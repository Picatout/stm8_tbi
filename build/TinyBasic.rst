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
      008050 82 00 88 E3             74 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      0080D7 CD 89 B2         [ 4]  164 	call puts 
      0080DA                        165 UBTN_Handler_exit:
      0080DA AE 17 FF         [ 2]  166     ldw x,#STACK_EMPTY 
      0080DD 94               [ 1]  167     ldw sp,x
      0080DE 9A               [ 1]  168 	rim 
      0080DF CC 97 3C         [ 2]  169 5$:	jp warm_start
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
      008180 CD 89 10         [ 4]  263 	call uart1_init
                                    264 ; activate PE_4 (user button interrupt)
      008183 72 18 50 18      [ 1]  265     bset PE_CR2,#USR_BTN_BIT 
                                    266 ; display system information
      008187 9A               [ 1]  267 	rim ; enable interrupts 
      008188 72 5C 00 18      [ 1]  268 	inc seedy+1 
      00818C 72 5C 00 16      [ 1]  269 	inc seedx+1 
      008190 CD 9D BE         [ 4]  270 	call func_eefree 
      008193 CD 9C F3         [ 4]  271 	call ubound 
      008196 CD 94 E8         [ 4]  272 	call clear_basic
      008199 CD A6 23         [ 4]  273 	call beep_1khz  
      00819C CD 94 95         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for application in flash memory 
      00819F CD A8 5E         [ 4]  277 	call qsign 
      0081A2 27 03            [ 1]  278 	jreq run_app
      0081A4 CC 97 3C         [ 2]  279 	jp warm_start 
      0081A7                        280 run_app:
                                    281 ; run application in FLASH|EEPROM 
      0081A7 90 CE 17 73      [ 2]  282 	ldw y,XSTACK_EMPTY
      0081AB CD 94 C6         [ 4]  283 	call warm_init
      0081AE AE B6 84         [ 2]  284 	ldw x,#app 
      0081B1 CF 00 1C         [ 2]  285 	ldw txtbgn,x
      0081B4 72 BB B6 82      [ 2]  286 	addw x,app_size 
      0081B8 CF 00 1E         [ 2]  287 	ldw txtend,x 
      0081BB AE 81 C9         [ 2]  288 	ldw x,#AUTO_RUN 
      0081BE CD 89 B2         [ 4]  289 	call puts 
      0081C1 CD 9E E0         [ 4]  290 	call program_info 
      0081C4 CC A5 BE         [ 2]  291 	jp run_it_02  
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
      0082DC CC 96 B2         [ 2]  208     jp tb_error 
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



      008353 CC 96 B2         [ 2]  282     jp tb_error 
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
      008397 CC 96 B2         [ 2]  348     jp tb_error 
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
      00841C CD 98 62         [ 4]   51 	call prt_i16  
      00841F A6 3A            [ 1]   52 	ld a,#': 
      008421 CD 89 55         [ 4]   53 	call putc 
      008424 A6 20            [ 1]   54 	ld a,#SPACE 
      008426 CD 89 55         [ 4]   55 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008429 85               [ 2]   56 	popw x 
      00842A F6               [ 1]   57 	ld a,(x)
      00842B 5F               [ 1]   58 	clrw x 
      00842C 97               [ 1]   59 	ld xl,a 
      00842D 35 0A 00 0B      [ 1]   60 	mov base,#10 
      008431 CD 98 62         [ 4]   61 	call prt_i16 
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
      00844A CD 89 55         [ 4]   87 	call putc
      00844D A6 28            [ 1]   88 	ld a,#'( 
      00844F CD 89 55         [ 4]   89 	call putc 	
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
      008454 CD 89 B2         [ 4]  102 	call puts 
      008457 7B 01            [ 1]  103 	ld a,(1,sp) 
      008459 5F               [ 1]  104 	clrw x 
      00845A 97               [ 1]  105 	ld xl,a 
      00845B 35 10 00 0B      [ 1]  106 	mov base,#16
      00845F CD 98 62         [ 4]  107 	call prt_i16  
      008462 CD 84 48         [ 4]  108 	call left_paren 
      008465 84               [ 1]  109 	pop a 
      008466 5F               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008467 97               [ 1]  111 	ld xl,a 
      008468 35 0A 00 0B      [ 1]  112 	mov base,#10 
      00846C CD 98 62         [ 4]  113 	call prt_i16  
      00846F A6 29            [ 1]  114 	ld a,#') 
      008471 CD 89 55         [ 4]  115 	call putc
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
      008477 CD 89 B2         [ 4]  128 	call puts 
      00847A 1E 01            [ 2]  129 	ldw x,(1,sp) 
      00847C 35 10 00 0B      [ 1]  130 	mov base,#16 
      008480 CD 98 62         [ 4]  131 	call prt_i16  
      008483 CD 84 48         [ 4]  132 	call left_paren 
      008486 85               [ 2]  133 	popw x 
      008487 35 0A 00 0B      [ 1]  134 	mov base,#10 
      00848B CD 98 62         [ 4]  135 	call prt_i16  
      00848E A6 29            [ 1]  136 	ld a,#') 
      008490 CD 89 55         [ 4]  137 	call putc
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
      0084AA CD 89 B2         [ 4]  163 	call puts
                                    164 ; print PC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0084AD AE 85 3A         [ 2]  165 	ldw x, #REG_PC
      0084B0 16 0A            [ 2]  166 	ldw y, (R_PC,sp)
      0084B2 72 A2 00 03      [ 2]  167 	subw y,#3
      0084B6 CD 84 75         [ 4]  168 	call prt_reg16 
                                    169 ; print x
      0084B9 AE 85 42         [ 2]  170 	ldw x,#REG_X
      0084BC 16 02            [ 2]  171 	ldw y,(R_X,sp)
      0084BE CD 84 75         [ 4]  172 	call prt_reg16  
                                    173 ; print Y 
      0084C1 AE 85 3E         [ 2]  174 	ldw x,#REG_Y
      0084C4 16 04            [ 2]  175 	ldw y, (R_Y,sp)
      0084C6 CD 84 75         [ 4]  176 	call prt_reg16  
                                    177 ; print A 
      0084C9 AE 85 46         [ 2]  178 	ldw x,#REG_A
      0084CC 7B 01            [ 1]  179 	ld a, (R_A,sp) 
      0084CE CD 84 53         [ 4]  180 	call prt_reg8
                                    181 ; print CC 
      0084D1 AE 85 4A         [ 2]  182 	ldw x,#REG_CC 
      0084D4 7B 09            [ 1]  183 	ld a, (R_CC,sp) 
      0084D6 CD 84 53         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      0084D9 AE 85 4F         [ 2]  186 	ldw x,#REG_SP
      0084DC 90 96            [ 1]  187 	ldw y,sp 
      0084DE 72 A9 00 0B      [ 2]  188 	addw y,#(VSIZE+3)
      0084E2 CD 84 75         [ 4]  189 	call prt_reg16  
      0084E5 A6 0A            [ 1]  190 	ld a,#'\n' 
      0084E7 CD 89 55         [ 4]  191 	call putc
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
      0084FE 0A 52 65 67 69 73 74   203 STATES:  .asciz "\nRegisters state at TRAP point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 54
             52 41 50 20 70 6F 69
             6E 74 2E 0A 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
      00853A 50 43 3A 00            204 REG_PC: .asciz "PC:"
      00853E 0A 59 3A 00            205 REG_Y:   .asciz "\nY:" 
      008542 0A 58 3A 00            206 REG_X:   .asciz "\nX:"
      008546 0A 41 3A 00            207 REG_A:   .asciz "\nA:" 
      00854A 0A 43 43 3A 00         208 REG_CC:  .asciz "\nCC:"
      00854F 0A 53 50 3A 00         209 REG_SP:  .asciz "\nSP:"
                                    210 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                    211 ;----------------------
                                    212 ; input:
                                    213 ;	Y    *input buffer 
                                    214 ; output:
                                    215 ;   acc24  integer 
                                    216 ;----------------------
      008554                        217 parse_addr:
      008554 A6 20            [ 1]  218 	ld a,#SPACE 
      008556 CD 8F 19         [ 4]  219 	call skip  	 
      008559 72 B9 00 01      [ 2]  220 	addw y,in.w 
      00855D AE 16 E0         [ 2]  221 	ldw x,#pad 
      008560 CD 93 EC         [ 4]  222 	call strcpy
      008563 AE 16 E0         [ 2]  223 	ldw x,#pad
      008566 CD 99 04         [ 4]  224 	call atoi24 	
      008569 81               [ 4]  225 	ret 
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
      00856A                        244 cmd_itf:
      00856A 8A               [ 1]  245 	push cc 
      0004EB                        246 	_vars VSIZE
      00856B 52 0B            [ 2]    1     sub sp,#VSIZE 
      00856D 6B 01            [ 1]  247 	ld (R_A,sp),a
      00856F C6 00 04         [ 1]  248 	ld a,count 
      008572 6B 0A            [ 1]  249 	ld (SAV_COUNT,sp),a 
      008574 C6 00 02         [ 1]  250 	ld a,in 
      008577 6B 09            [ 1]  251 	ld (SAV_IN,sp),a  
      008579 1F 02            [ 2]  252 	ldw (R_X,sp),x 
      00857B 17 04            [ 2]  253 	ldw (R_Y,sp),y
      00857D C6 00 0D         [ 1]  254 	ld a,acc24 
      008580 CE 00 0E         [ 2]  255 	ldw x,acc16 
      008583 6B 08            [ 1]  256 	ld (SAV_ACC24,sp),a 
      008585 1F 06            [ 2]  257 	ldw (SAV_ACC16,sp),x 
      008587 72 5F 00 19      [ 1]  258 	clr farptr 
      00858B 72 5F 00 1A      [ 1]  259 	clr farptr+1 
      00858F 72 5F 00 1B      [ 1]  260 	clr farptr+2  
      008593                        261 repl:
      008593 A6 0D            [ 1]  262 	ld a,#CR 
      008595 CD 89 55         [ 4]  263 	call putc 
      008598 A6 3F            [ 1]  264 	ld a,#'? 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00859A CD 89 55         [ 4]  265 	call putc
      00859D 72 5F 00 01      [ 1]  266 	clr in.w 
      0085A1 72 5F 00 02      [ 1]  267 	clr in 
      0085A5 CD 8A B7         [ 4]  268 	call readln
      0085A8 90 AE 16 90      [ 2]  269 	ldw y,#tib  
      0085AC 90 F6            [ 1]  270 	ld a,(y)
      0085AE 27 E3            [ 1]  271 	jreq repl  
      0085B0 72 5C 00 02      [ 1]  272 	inc in 
      0085B4 CD 98 F8         [ 4]  273 	call to_upper 
      0085B7 A1 51            [ 1]  274 	cp a,#'Q 
      0085B9 26 26            [ 1]  275 	jrne test_p
      0085BB                        276 repl_exit:
                                    277 ; restore original context 
      0085BB 7B 08            [ 1]  278 	ld a,(SAV_ACC24,sp)
      0085BD 1E 06            [ 2]  279 	ldw x,(SAV_ACC16,sp)
      0085BF C7 00 0D         [ 1]  280 	ld acc24,a 
      0085C2 CF 00 0E         [ 2]  281 	ldw acc16,x
      0085C5 7B 0A            [ 1]  282 	ld a,(SAV_COUNT,sp)
      0085C7 C7 00 04         [ 1]  283 	ld count,a 
      0085CA 7B 09            [ 1]  284 	ld a,(SAV_IN,sp)
      0085CC C7 00 02         [ 1]  285 	ld in,a 
      0085CF 16 04            [ 2]  286 	ldw y,(R_Y,sp)
      0085D1 1E 02            [ 2]  287 	ldw x,(R_X,sp)
      0085D3 7B 01            [ 1]  288 	ld a,(R_A,sp)
      000555                        289 	_drop VSIZE
      0085D5 5B 0B            [ 2]    1     addw sp,#VSIZE 
      0085D7 86               [ 1]  290 	pop cc 
      0085D8 81               [ 4]  291 	ret  
      0085D9                        292 invalid:
      0085D9 AE 86 47         [ 2]  293 	ldw x,#invalid_cmd 
      0085DC CD 89 B2         [ 4]  294 	call puts 
      0085DF 20 B2            [ 2]  295 	jra repl 
      0085E1                        296 test_p:	
      0085E1 A1 50            [ 1]  297     cp a,#'P 
      0085E3 27 10            [ 1]  298 	jreq mem_peek
      0085E5 A1 53            [ 1]  299     cp a,#'S 
      0085E7 26 F0            [ 1]  300 	jrne invalid 
      0085E9                        301 print_string:
      0085E9 CD 85 54         [ 4]  302 	call parse_addr 	
      0085EC CE 00 0E         [ 2]  303 	ldw x,acc16
      0085EF CD 89 B2         [ 4]  304 	call puts
      0085F2 CC 85 93         [ 2]  305 	jp repl 	
      0085F5                        306 mem_peek:
      0085F5 CD 85 54         [ 4]  307 	call parse_addr 
      0085F8 C6 00 0D         [ 1]  308 	ld a, acc24 
      0085FB CA 00 0E         [ 1]  309 	or a,acc16 
      0085FE CA 00 0F         [ 1]  310 	or a,acc8 
      008601 26 02            [ 1]  311 	jrne 1$ 
      008603 20 0C            [ 2]  312 	jra peek_byte  
      008605 CE 00 0D         [ 2]  313 1$:	ldw x,acc24 
      008608 CF 00 19         [ 2]  314 	ldw farptr,x 
      00860B C6 00 0F         [ 1]  315 	ld a,acc8 
      00860E C7 00 1B         [ 1]  316 	ld farptr+2,a 
      008611                        317 peek_byte:
      008611 CD 86 56         [ 4]  318 	call print_farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008614 A6 08            [ 1]  319 	ld a,#8 
      008616 6B 0B            [ 1]  320 	ld (PSIZE,sp),a 
      008618 5F               [ 1]  321 	clrw x 
      008619 CD 86 71         [ 4]  322 1$:	call fetchc  
      00861C 89               [ 2]  323 	pushw x 
      00861D C7 00 0F         [ 1]  324 	ld acc8,a 
      008620 5F               [ 1]  325 	clrw x 
      008621 CF 00 0D         [ 2]  326 	ldw acc24,x 
      008624 A6 90            [ 1]  327 	ld a,#16+128
      008626 CD 98 79         [ 4]  328 	call prt_acc24
      008629 85               [ 2]  329 	popw x 
      00862A 0A 0B            [ 1]  330 	dec (PSIZE,sp)
      00862C 26 EB            [ 1]  331 	jrne 1$ 
      00862E A6 08            [ 1]  332 	ld a,#8 
      008630 CB 00 1B         [ 1]  333 	add a,farptr+2 
      008633 C7 00 1B         [ 1]  334 	ld farptr+2,a
      008636 4F               [ 1]  335 	clr a 
      008637 C9 00 1A         [ 1]  336 	adc a,farptr+1 
      00863A C7 00 1A         [ 1]  337 	ld farptr+1,a 
      00863D 4F               [ 1]  338 	clr a 
      00863E C9 00 19         [ 1]  339 	adc a,farptr 
      008641 C7 00 19         [ 1]  340 	ld farptr,a 
      008644 CC 85 93         [ 2]  341 	jp repl  
                                    342 
      008647 6E 6F 74 20 61 20 63   343 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                    344 
                                    345 ;----------------------------
                                    346 ; display farptr address
                                    347 ;----------------------------
      008656                        348 print_farptr:
      008656 C6 00 1B         [ 1]  349 	ld a ,farptr+2 
      008659 C7 00 0F         [ 1]  350 	ld acc8,a 
      00865C CE 00 19         [ 2]  351 	ldw x,farptr 
      00865F CF 00 0D         [ 2]  352 	ldw acc24,x 
      008662 5F               [ 1]  353 	clrw x 
      008663 A6 10            [ 1]  354 	ld a,#16 
      008665 CD 98 79         [ 4]  355 	call prt_acc24
      008668 A6 20            [ 1]  356 	ld a,#SPACE 
      00866A CD 89 55         [ 4]  357 	call putc 
      00866D CD 89 55         [ 4]  358 	call putc 
      008670 81               [ 4]  359 	ret
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
      008671                        370 fetchc: ; @C
      008671 92 AF 00 19      [ 5]  371 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008675 5C               [ 1]  372 	incw x
      008676 81               [ 4]  373 	ret
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
      008677                        384 number:
      008677 CD 8F 2C         [ 4]  385 	call get_token
      00867A A1 84            [ 1]  386 	cp a,#TK_INTGR
      00867C 27 03            [ 1]  387 	jreq 1$
      00867E CC 96 B0         [ 2]  388 	jp syntax_error
      008681 81               [ 4]  389 1$:	ret
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
      008682                        404 show_row:
      008682 4D               [ 1]  405 	tnz a 
      008683 26 01            [ 1]  406 	jrne 1$
      008685 81               [ 4]  407 	ret 
      008686                        408 1$:	
      008686 89               [ 2]  409 	pushw x  
      008687 88               [ 1]  410 	push a 
      008688 35 04 00 24      [ 1]  411 	mov tab_width,#4 
      00868C CD 98 62         [ 4]  412 	call prt_i16 
      00868F A6 20            [ 1]  413 	ld a,#SPACE  
      008691 CD 89 55         [ 4]  414 	call putc
      008694                        415 row_loop:
      008694 1E 02            [ 2]  416 	ldw x,(ADR,sp)
      008696 F6               [ 1]  417 	ld a,(x)
      008697 5F               [ 1]  418 	clrw x 
      008698 97               [ 1]  419 	ld xl,a 
      008699 CD 98 62         [ 4]  420 	call prt_i16 
      00869C 1E 02            [ 2]  421 	ldw x,(ADR,sp)
      00869E 5C               [ 1]  422 	incw x 
      00869F 1F 02            [ 2]  423 	ldw (ADR,sp),x 
      0086A1 0A 01            [ 1]  424 	dec (CNT,sp)
      0086A3 26 EF            [ 1]  425 	jrne row_loop
      000625                        426 	_drop VSIZE  		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0086A5 5B 03            [ 2]    1     addw sp,#VSIZE 
      0086A7 35 04 00 24      [ 1]  427 	mov tab_width,#4
      0086AB A6 0D            [ 1]  428 	ld a,#CR 
      0086AD CD 89 55         [ 4]  429 	call putc 
      0086B0 81               [ 4]  430 	ret 
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
      0086B1                        443 hex_dump:
      0086B1 88               [ 1]  444 	push a 
      000632                        445 	_vars VSIZE
      0086B2 52 04            [ 2]    1     sub sp,#VSIZE 
      0086B4 C6 00 0B         [ 1]  446 	ld a,base
      0086B7 6B 03            [ 1]  447 	ld (BASE,sp),a 
      0086B9 35 10 00 0B      [ 1]  448 	mov base,#16
      0086BD C6 00 24         [ 1]  449 	ld a,tab_width 
      0086C0 6B 04            [ 1]  450 	ld (TABW,sp),a
      0086C2 A6 0D            [ 1]  451 	ld a,#CR 
      0086C4 CD 89 55         [ 4]  452 	call putc 
      0086C7 17 01            [ 2]  453 1$: ldw (BCNT,sp),y
      0086C9 A6 10            [ 1]  454 	ld a,#16
      0086CB 90 A3 00 10      [ 2]  455 	cpw y,#16
      0086CF 2A 02            [ 1]  456 	jrpl 2$
      0086D1 90 9F            [ 1]  457 	ld a,yl
      0086D3                        458 2$: 	
      0086D3 CD 86 82         [ 4]  459 	call show_row 
      0086D6 16 01            [ 2]  460 	ldw y,(BCNT,sp) 
      0086D8 72 A2 00 10      [ 2]  461 	subw y,#16 
      0086DC 90 A3 00 01      [ 2]  462 	cpw y,#1
      0086E0 2A E5            [ 1]  463 	jrpl 1$
      0086E2 7B 03            [ 1]  464 	ld a,(BASE,sp)
      0086E4 C7 00 0B         [ 1]  465 	ld base,a
      0086E7 7B 04            [ 1]  466 	ld a,(TABW,sp)
      0086E9 C7 00 24         [ 1]  467 	ld tab_width,a 
      00066C                        468 	_drop VSIZE
      0086EC 5B 04            [ 2]    1     addw sp,#VSIZE 
      0086EE 84               [ 1]  469 	pop a 
      0086EF 81               [ 4]  470 	ret 
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
      0086F0                         45 unlock_eeprom:
      0086F0 72 06 50 5F 15   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      0086F5 35 00 50 5B      [ 1]   47 	mov FLASH_CR2,#0 
      0086F9 35 FF 50 5C      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      0086FD 35 AE 50 64      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008701 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008705 72 07 50 5F FB   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00870A 81               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      00870B                         62 unlock_flash:
      00870B 72 02 50 5F 15   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      008710 35 00 50 5B      [ 1]   64 	mov FLASH_CR2,#0 
      008714 35 FF 50 5C      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008718 35 56 50 62      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00871C 35 AE 50 62      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008720 72 03 50 5F FB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008725 81               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      008726                         76 row_erase:
      008726 88               [ 1]   77 	push a 
      008727 90 89            [ 2]   78 	pushw y 
      008729 35 20 50 5B      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      00872D 35 DF 50 5C      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      008731 4F               [ 1]   81 	clr a 
      008732 90 5F            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      008734 91 A7 00 19      [ 1]   83 	ldf ([farptr],y),a
      008738 90 5C            [ 1]   84     incw y
      00873A 91 A7 00 19      [ 1]   85 	ldf ([farptr],y),a
      00873E 90 5C            [ 1]   86     incw y
      008740 91 A7 00 19      [ 1]   87 	ldf ([farptr],y),a
      008744 90 5C            [ 1]   88     incw y
      008746 91 A7 00 19      [ 1]   89 	ldf ([farptr],y),a
      00874A 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00874F 90 85            [ 2]   91 	popw y 
      008751 84               [ 1]   92 	pop a 
      008752 81               [ 4]   93 	ret
      008753                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      008753                         97 move_erase_to_ram:
      008753 89               [ 2]   98 	pushw x 
      008754 90 89            [ 2]   99 	pushw y 
      008756 AE 87 53         [ 2]  100 	ldw x,#row_erase_end 
      008759 1D 87 26         [ 2]  101 	subw x,#row_erase
      00875C CF 00 0E         [ 2]  102 	ldw acc16,x 
      00875F AE 16 90         [ 2]  103 	ldw x,#tib 
      008762 90 AE 87 26      [ 2]  104 	ldw y,#row_erase 
      008766 CD 93 FC         [ 4]  105 	call move
      008769 90 85            [ 2]  106 	popw y
      00876B 85               [ 2]  107 	popw x
      00876C 81               [ 4]  108 	ret 
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
      00876D                        123 program_row:
      00876D 88               [ 1]  124 	push a 
      00876E 90 89            [ 2]  125 	pushw y 
      008770 4B 80            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      008772 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      008776 72 11 50 5C      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      00877A 90 5F            [ 1]  130 	clrw y 
      00877C F6               [ 1]  131 1$:	ld a,(x)
      00877D 91 A7 00 19      [ 1]  132 	ldf ([farptr],y),a
      008781 5C               [ 1]  133 	incw x 
      008782 90 5C            [ 1]  134 	incw y 
      008784 0A 01            [ 1]  135 	dec (BCNT,sp)
      008786 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      008788 72 05 50 5F FB   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00070D                        139 	_drop 1 
      00878D 5B 01            [ 2]    1     addw sp,#1 
      00878F 90 85            [ 2]  140 	popw y 
      008791 84               [ 1]  141 	pop a 
      008792 81               [ 4]  142 	ret 
      008793                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      008793                        149 move_prg_to_ram:
      008793 89               [ 2]  150 	pushw x 
      008794 90 89            [ 2]  151 	pushw y 
      008796 AE 87 93         [ 2]  152 	ldw x,#program_row_end 
      008799 1D 87 6D         [ 2]  153 	subw x,#program_row 
      00879C CF 00 0E         [ 2]  154 	ldw acc16,x ; bytes to move 
      00879F AE 16 90         [ 2]  155 	ldw x,#tib ; destination address 
      0087A2 90 AE 87 6D      [ 2]  156 	ldw y,#program_row ; source address 
      0087A6 CD 93 FC         [ 4]  157 	call move
      0087A9 90 85            [ 2]  158 	popw y 
      0087AB 85               [ 2]  159 	popw x  
      0087AC 81               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      0087AD                        169 write_buffer:
      0087AD 89               [ 2]  170 	pushw x 
      0087AE 72 5D 00 19      [ 1]  171 	tnz farptr 
      0087B2 26 0D            [ 1]  172 	jrne to_flash 
      0087B4 CE 00 1A         [ 2]  173 	ldw x,farptr+1 
      0087B7 A3 B6 80         [ 2]  174 	cpw x,#app_space  
      0087BA 24 05            [ 1]  175 	jruge to_flash 
      0087BC                        176 to_eeprom:
      0087BC CD 86 F0         [ 4]  177 	call unlock_eeprom
      0087BF 20 03            [ 2]  178 	jra do_programming
      0087C1                        179 to_flash:
      0087C1 CD 87 0B         [ 4]  180 	call unlock_flash
      0087C4                        181 do_programming:
      0087C4 85               [ 2]  182 	popw x 
      0087C5 CD 16 90         [ 4]  183 	call tib
      0087C8 72 13 50 5F      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      0087CC 72 17 50 5F      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      0087D0 81               [ 4]  186 	ret 
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
      0087D1                        197 block_erase:
      0087D1 89               [ 2]  198 	pushw x 
      0087D2 C6 00 19         [ 1]  199 	ld a,farptr 
      0087D5 26 14            [ 1]  200 	jrne erase_flash
      0087D7 CE 00 1A         [ 2]  201 	ldw x,farptr+1
      0087DA A3 B6 80         [ 2]  202 	cpw x,#app_space 
      0087DD 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      0087DF CD 86 F0         [ 4]  205 	call unlock_eeprom 
      0087E2 CD 16 90         [ 4]  206 	call tib 
      0087E5 72 17 50 5F      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0087E9 20 0A            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0087EB                        210 erase_flash:
      0087EB CD 87 0B         [ 4]  211 	call unlock_flash 
      0087EE CD 16 90         [ 4]  212 	call tib 
      0087F1 72 13 50 5F      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0087F5                        214 erase_exit: 
      0087F5 85               [ 2]  215 	popw x 
      0087F6 81               [ 4]  216 	ret 
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
      0087F7                        232 write_byte:
      0087F7 90 89            [ 2]  233 	pushw y
      000779                        234 	_vars VSIZE
      0087F9 52 02            [ 2]    1     sub sp,#VSIZE 
      0087FB 6B 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      0087FD 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      0087FF 90 CE 00 1A      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008803 72 5D 00 19      [ 1]  240 	tnz farptr 
      008807 26 14            [ 1]  241 	jrne write_flash
      008809 90 A3 B6 80      [ 2]  242     cpw y,#app_space 	 
      00880D 24 0E            [ 1]  243     jruge write_flash
      00880F 90 A3 40 00      [ 2]  244 	cpw y,#EEPROM_BASE  
      008813 25 57            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      008815 90 A3 48 7F      [ 2]  246 	cpw y,#OPTION_END 
      008819 22 51            [ 1]  247 	jrugt write_exit
      00881B 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      00881D                        250 write_flash:
      00881D CD 87 0B         [ 4]  251 	call unlock_flash 
      008820 9B               [ 1]  252 1$:	sim 
      008821 7B 01            [ 1]  253 	ld a,(BTW,sp)
      008823 92 A7 00 19      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008827 72 05 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00882C 9A               [ 1]  256     rim 
      00882D 72 13 50 5F      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008831 20 39            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      008833                        260 write_eeprom:
      008833 CD 86 F0         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008836 90 A3 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      00883A 2B 08            [ 1]  264 	jrmi 1$
      00883C 90 A3 48 80      [ 2]  265 	cpw y,#OPTION_END+1
      008840 2A 02            [ 1]  266 	jrpl 1$
      008842 03 02            [ 1]  267 	cpl (OPT,sp)
      008844                        268 1$: 
      008844 0D 02            [ 1]  269     tnz (OPT,sp)
      008846 27 08            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      008848 72 1E 50 5B      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      00884C 72 1F 50 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008850                        274 2$: 
      008850 7B 01            [ 1]  275     ld a,(BTW,sp)
      008852 92 A7 00 19      [ 4]  276     ldf ([farptr],x),a
      008856 0D 02            [ 1]  277     tnz (OPT,sp)
      008858 27 08            [ 1]  278     jreq 3$
      00885A 5C               [ 1]  279     incw x
      00885B 7B 01            [ 1]  280     ld a,(BTW,sp)
      00885D 43               [ 1]  281     cpl a
      00885E 92 A7 00 19      [ 4]  282     ldf ([farptr],x),a
      008862 72 05 50 5F FB   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008867 72 0D 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      00886C                        285 write_exit:
      0007EC                        286 	_drop VSIZE 
      00886C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00886E 90 85            [ 2]  287 	popw y
      008870 81               [ 4]  288     ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                    300 ;	X 		after last byte written 
                                    301 ;   Y 		after last byte read 
                                    302 ;  farptr   point after block
                                    303 ;---------------------------------------------
      008871                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      0007F1                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      0007F1                        309 write_block::
      008871 88               [ 1]  310 	push a 
      0007F2                        311 	_vars VSIZE
      008872 52 02            [ 2]    1     sub sp,#VSIZE 
      008874 1F 01            [ 2]  312 	ldw (XSAVE,sp),x 
      008876 1E 06            [ 2]  313 	ldw x,(BSIZE,sp) 
      008878 27 13            [ 1]  314 	jreq 9$
      00887A 1E 01            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      00887C 90 F6            [ 1]  316 	ld a,(y)
      00887E CD 87 F7         [ 4]  317 	call write_byte 
      008881 5C               [ 1]  318 	incw x 
      008882 90 5C            [ 1]  319 	incw y 
      008884 1F 01            [ 2]  320 	ldw (XSAVE,sp),x
      008886 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      008888 5A               [ 2]  322 	decw x
      008889 1F 06            [ 2]  323 	ldw (BSIZE,sp),x 
      00888B 26 ED            [ 1]  324 	jrne 1$
      00888D                        325 9$:
      00888D 1E 01            [ 2]  326 	ldw x,(XSAVE,sp)
      00888F CD 88 C7         [ 4]  327 	call incr_farptr
      000812                        328 	_drop VSIZE
      008892 5B 02            [ 2]    1     addw sp,#VSIZE 
      008894 84               [ 1]  329 	pop a 
      008895 81               [ 4]  330 	ret 
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
      008896                        347 write_nbytes:
      008896 90 89            [ 2]  348 	pushw y
      008898 88               [ 1]  349 	push a 
      008899 90 93            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      00889B 5F               [ 1]  351 	clrw x 
      00889C                        352 1$:  
      00889C 90 F6            [ 1]  353 	ld a,(y)
      00889E 90 5C            [ 1]  354 	incw y
      0088A0 CD 87 F7         [ 4]  355 	call write_byte 
      0088A3 5C               [ 1]  356 	incw x 
      0088A4 0A 01            [ 1]  357 	dec (1,sp)  
      0088A6 26 F4            [ 1]  358 	jrne 1$ 
      0088A8 84               [ 1]  359 9$: pop a 
      0088A9 90 85            [ 2]  360 	popw y 
      0088AB 81               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      0088AC                        370 row_align:
      0088AC A6 7F            [ 1]  371 	ld a,#0x7f 
      0088AE C4 00 1B         [ 1]  372 	and a,farptr+2 
      0088B1 27 13            [ 1]  373 	jreq 1$ 
      0088B3 CE 00 1A         [ 2]  374 	ldw x,farptr+1 
      0088B6 1C 00 80         [ 2]  375 	addw x,#BLOCK_SIZE 
      0088B9 24 04            [ 1]  376 	jrnc 0$
      0088BB 72 5C 00 19      [ 1]  377 	inc farptr 
      0088BF 9F               [ 1]  378 0$: ld a,xl 
      0088C0 A4 80            [ 1]  379 	and a,#0x80
      0088C2 97               [ 1]  380 	ld xl,a
      0088C3 CF 00 1A         [ 2]  381 	ldw farptr+1,x  	
      0088C6 81               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      0088C7                        390 incr_farptr:
      0088C7 72 BB 00 1A      [ 2]  391 	addw x,farptr+1 
      0088CB 24 04            [ 1]  392 	jrnc 1$
      0088CD 72 5C 00 19      [ 1]  393 	inc farptr 
      0088D1 CF 00 1A         [ 2]  394 1$:	ldw farptr+1,x  
      0088D4 81               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      0088D5                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0088D5 5F               [ 1]  406 	clrw x 
      0088D6 92 AF 00 19      [ 5]  407 1$: ldf a,([farptr],x) 
      0088DA 26 06            [ 1]  408 	jrne 2$
      0088DC 5C               [ 1]  409 	incw x 
      0088DD A3 00 80         [ 2]  410 	cpw x,#BLOCK_SIZE 
      0088E0 25 F4            [ 1]  411 	jrult 1$ 
      0088E2 81               [ 4]  412 2$:	ret 
                                    413 
                                    414 
                                    415 
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
      0088E3                         66 Uart1RxHandler: ; console receive char 
      0088E3 72 0B 52 30 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      0088E8 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      0088EB A1 03            [ 1]   69 	cp a,#CTRL_C 
      0088ED 26 06            [ 1]   70 	jrne 2$
      0088EF CD 89 55         [ 4]   71 	call putc 
      0088F2 CC 80 C9         [ 2]   72 	jp user_interrupted
      0088F5                         73 2$:
      0088F5 A1 18            [ 1]   74 	cp a,#CAN ; CTRL_X 
      0088F7 26 03            [ 1]   75 	jrne 3$
      0088F9 CC 81 35         [ 2]   76 	jp cold_start 	
      0088FC 88               [ 1]   77 3$:	push a 
      0088FD A6 27            [ 1]   78 	ld a,#rx1_queue 
      0088FF CB 00 30         [ 1]   79 	add a,rx1_tail 
      008902 5F               [ 1]   80 	clrw x 
      008903 97               [ 1]   81 	ld xl,a 
      008904 84               [ 1]   82 	pop a 
      008905 F7               [ 1]   83 	ld (x),a 
      008906 C6 00 30         [ 1]   84 	ld a,rx1_tail 
      008909 4C               [ 1]   85 	inc a 
      00890A A4 07            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      00890C C7 00 30         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00890F 80               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      008910                         97 uart1_init:
      008910 72 1A 50 02      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008914 72 1A 50 03      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008918 72 1A 50 04      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      00891C 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008920                        103 uart1_set_baud: 
      008920 88               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008921 A6 E1            [ 1]  107 	ld a,#CLK_SWR_HSI
      008923 C1 50 C3         [ 1]  108 	cp a,CLK_CMSR 
      008926 27 0A            [ 1]  109 	jreq 2$ 
      008928                        110 1$: ; 8 Mhz 	
      008928 35 05 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      00892C 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008930 20 08            [ 2]  113 	jra 3$
      008932                        114 2$: ; 16 Mhz 	
      008932 35 0B 52 33      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      008936 35 08 52 32      [ 1]  116 	mov UART1_BRR1,#0x08
      00893A                        117 3$:
      00893A 72 5F 52 31      [ 1]  118     clr UART1_DR
      00893E 35 2C 52 35      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008942 72 10 52 35      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      008946 72 0D 52 30 FB   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00894B 72 5F 00 2F      [ 1]  122     clr rx1_head 
      00894F 72 5F 00 30      [ 1]  123 	clr rx1_tail
      008953 84               [ 1]  124 	pop a  
      008954 81               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      008955                        133 putc:: ; console output always on UART1
      008955                        134 uart1_putc:: 
      008955 72 0F 52 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      00895A C7 52 31         [ 1]  136 	ld UART1_DR,a 
      00895D 81               [ 4]  137 	ret 
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
      00895E                        148 qgetc::
      00895E                        149 uart1_qgetc::
      00895E C6 00 2F         [ 1]  150 	ld a,rx1_head 
      008961 C0 00 30         [ 1]  151 	sub a,rx1_tail 
      008964 81               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      008965                        161 getc:: ;console input
      008965                        162 uart1_getc::
      008965 CD 89 5E         [ 4]  163 	call uart1_qgetc
      008968 27 FB            [ 1]  164 	jreq uart1_getc 
      00896A 89               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      00896B A6 27            [ 1]  167 	ld a,#rx1_queue
      00896D CB 00 2F         [ 1]  168 	add a,rx1_head 
      008970 5F               [ 1]  169 	clrw x  
      008971 97               [ 1]  170 	ld xl,a 
      008972 F6               [ 1]  171 	ld a,(x)
      008973 88               [ 1]  172 	push a
      008974 C6 00 2F         [ 1]  173 	ld a,rx1_head 
      008977 4C               [ 1]  174 	inc a 
      008978 A4 07            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      00897A C7 00 2F         [ 1]  176 	ld rx1_head,a 
      00897D 84               [ 1]  177 	pop a  
      00897E 85               [ 2]  178 	popw x
      00897F 81               [ 4]  179 	ret 
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
      008980 43 81 44 80 48 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      00898C                        207 get_escape:
      00898C CD 89 65         [ 4]  208     call getc 
      00898F A1 5B            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      008991 27 02            [ 1]  210     jreq 1$
      008993 4F               [ 1]  211     clr a
      008994 81               [ 4]  212     ret
      008995 CD 89 65         [ 4]  213 1$: call getc 
      008998 AE 89 80         [ 2]  214     ldw x,#convert_table
      00899B                        215 2$:
      00899B F1               [ 1]  216     cp a,(x)
      00899C 27 08            [ 1]  217     jreq 4$
      00899E 1C 00 02         [ 2]  218     addw x,#2
      0089A1 7D               [ 1]  219     tnz (x)
      0089A2 26 F7            [ 1]  220     jrne 2$
      0089A4 4F               [ 1]  221     clr a
      0089A5 81               [ 4]  222     ret 
      0089A6 5C               [ 1]  223 4$: incw x 
      0089A7 F6               [ 1]  224     ld a,(x)
      0089A8 A1 84            [ 1]  225     cp a,#SUP
      0089AA 26 05            [ 1]  226     jrne 5$
      0089AC 88               [ 1]  227     push a 
      0089AD CD 89 65         [ 4]  228     call getc
      0089B0 84               [ 1]  229     pop a 
      0089B1                        230 5$:
      0089B1 81               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0089B2                        241 puts::
      0089B2 F6               [ 1]  242     ld a,(x)
      0089B3 27 06            [ 1]  243 	jreq 1$
      0089B5 CD 89 55         [ 4]  244 	call putc 
      0089B8 5C               [ 1]  245 	incw x 
      0089B9 20 F7            [ 2]  246 	jra puts 
      0089BB 81               [ 4]  247 1$:	ret 
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
      0089BC                        258 bksp:
      0089BC A6 08            [ 1]  259 	ld a,#BS 
      0089BE CD 89 55         [ 4]  260 	call putc 
      0089C1 A6 20            [ 1]  261 	ld a,#SPACE 
      0089C3 CD 89 55         [ 4]  262 	call putc 
      0089C6 A6 08            [ 1]  263 	ld a,#BS 
      0089C8 CD 89 55         [ 4]  264 	call putc 
      0089CB 81               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0089CC                        274 delete_nchar:
      0089CC 88               [ 1]  275 	push a 
      0089CD 0D 01            [ 1]  276 0$:	tnz (1,sp)
      0089CF 27 07            [ 1]  277 	jreq 1$
      0089D1 CD 89 BC         [ 4]  278 	call bksp 
      0089D4 0A 01            [ 1]  279 	dec (1,sp)
      0089D6 20 F5            [ 2]  280 	jra 0$
      0089D8 84               [ 1]  281 1$:	pop a 
      0089D9 81               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0089DA                        290 send_escape:
      0089DA A6 1B            [ 1]  291 	ld a,#ESC 
      0089DC CD 89 55         [ 4]  292 	call putc 
      0089DF A6 5B            [ 1]  293 	ld a,#'[
      0089E1 CD 89 55         [ 4]  294 	call putc 
      0089E4 81               [ 4]  295 	ret 
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
      0089E5                        311 send_parameter:
      0089E5 89               [ 2]  312 	pushw x 
      0089E6 5F               [ 1]  313 	clrw x 
      0089E7 97               [ 1]  314 	ld xl,a 
      0089E8 A6 0A            [ 1]  315 	ld a,#10 
      0089EA 62               [ 2]  316 	div x,a 
      0089EB 95               [ 1]  317 	ld xh,a 
      0089EC 9F               [ 1]  318 	ld a,xl
      0089ED 4D               [ 1]  319     tnz a 
      0089EE 27 0B            [ 1]  320     jreq 2$
      0089F0 A1 09            [ 1]  321 	cp a,#9 
      0089F2 23 02            [ 2]  322 	jrule 1$
      0089F4 A6 09            [ 1]  323 	ld a,#9
      0089F6                        324 1$:
      0089F6 AB 30            [ 1]  325 	add a,#'0 
      0089F8 CD 89 55         [ 4]  326 	call putc
      0089FB 9E               [ 1]  327 2$:	ld a,xh 
      0089FC AB 30            [ 1]  328 	add a,#'0
      0089FE CD 89 55         [ 4]  329 	call putc 
      008A01 85               [ 2]  330 	popw x 
      008A02 81               [ 4]  331 	ret 
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
      008A03                        344 move_left:
      008A03 88               [ 1]  345 	push a 
      008A04 CD 89 DA         [ 4]  346 	call send_escape
      008A07 84               [ 1]  347     pop a
      008A08 CD 89 E5         [ 4]  348 	call send_parameter 
      008A0B A6 44            [ 1]  349 	ld a,#'D 
      008A0D CD 89 55         [ 4]  350 	call putc 
      008A10 81               [ 4]  351 	ret	
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



      008A11                        362 move_right:
      008A11 88               [ 1]  363 	push a 
      008A12 CD 89 DA         [ 4]  364 	call send_escape
      008A15 84               [ 1]  365     pop a
      008A16 CD 89 E5         [ 4]  366 	call send_parameter 
      008A19 A6 43            [ 1]  367 	ld a,#'C 
      008A1B CD 89 55         [ 4]  368 	call putc 
      008A1E 81               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      008A1F                        379 spaces::
      008A1F A6 20            [ 1]  380 	ld a,#SPACE 
      008A21 5D               [ 2]  381 1$:	tnzw x
      008A22 27 06            [ 1]  382 	jreq 9$
      008A24 CD 89 55         [ 4]  383 	call putc 
      008A27 5A               [ 2]  384 	decw x
      008A28 20 F7            [ 2]  385 	jra 1$
      008A2A                        386 9$: 
      008A2A 81               [ 4]  387 	ret 
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
      008A2B                        405 insert_char: 
      0009AB                        406 	_vars VSIZE 
      008A2B 52 03            [ 2]    1     sub sp,#VSIZE 
      008A2D 6B 02            [ 1]  407     ld (KCHAR,sp),a 
      008A2F 9E               [ 1]  408     ld a,xh 
      008A30 6B 01            [ 1]  409 	ld (IPOS,sp),a
      008A32 9F               [ 1]  410     ld a,xl 
      008A33 6B 03            [ 1]  411     ld (LLEN,sp),a  
      008A35 93               [ 1]  412     ldw x,y
      008A36 5C               [ 1]  413     incw x 
      008A37 7B 03            [ 1]  414     ld a,(LLEN,sp)
      008A39 10 01            [ 1]  415     sub a,(IPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      008A3B 4C               [ 1]  416     inc a 
      008A3C C7 00 0F         [ 1]  417     ld acc8,a 
      008A3F 72 5F 00 0E      [ 1]  418     clr acc16
      008A43 CD 93 FC         [ 4]  419     call move
      008A46 90 AE 16 90      [ 2]  420     ldw y,#tib 
      008A4A 7B 01            [ 1]  421     ld a,(IPOS,sp)
      008A4C C7 00 0F         [ 1]  422     ld acc8,a 
      008A4F 72 B9 00 0E      [ 2]  423     addw y,acc16 
      008A53 7B 02            [ 1]  424     ld a,(KCHAR,sp)
      008A55 90 F7            [ 1]  425     ld (y),a
      008A57 90 5C            [ 1]  426     incw y  
      008A59 7B 01            [ 1]  427     ld a,(IPOS,sp)
      008A5B CD 8A 03         [ 4]  428     call move_left
      008A5E AE 16 90         [ 2]  429     ldw x,#tib 
      008A61 CD 89 B2         [ 4]  430     call puts 
      008A64 7B 03            [ 1]  431     ld a,(LLEN,sp)
      008A66 10 01            [ 1]  432     sub a,(IPOS,sp) 
      008A68 CD 8A 03         [ 4]  433     call move_left 
      0009EB                        434 	_drop VSIZE 
      008A6B 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A6D 81               [ 4]  435 	ret 
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
      008A6E                        448 delete_under:
      0009EE                        449 	_vars VSIZE 
      008A6E 52 02            [ 2]    1     sub sp,#VSIZE 
      008A70 6B 02            [ 1]  450     ld (LLEN,sp),a 
      008A72 9F               [ 1]  451     ld a,xl 
      008A73 6B 01            [ 1]  452     ld (CPOS,sp),a 
      008A75 93               [ 1]  453     ldw x,y ; move destination
      008A76 90 5C            [ 1]  454     incw y  ; move source 
      008A78 7B 02            [ 1]  455     ld a,(LLEN,sp)
      008A7A 10 01            [ 1]  456     sub a,(CPOS,sp)
      008A7C 4C               [ 1]  457     inc a ; move including zero at end.
      008A7D C7 00 0F         [ 1]  458     ld acc8,a 
      008A80 72 5F 00 0E      [ 1]  459     clr acc16 
      008A84 CD 93 FC         [ 4]  460 	call move 
      008A87 90 AE 16 90      [ 2]  461     ldw y,#tib 
      008A8B 7B 01            [ 1]  462     ld a,(CPOS,sp)
      008A8D C7 00 0F         [ 1]  463     ld acc8,a 
      008A90 72 B9 00 0E      [ 2]  464     addw y,acc16 
      008A94 93               [ 1]  465     ldw x,y 
      008A95 CD 89 B2         [ 4]  466     call puts 
      008A98 A6 20            [ 1]  467     ld a,#SPACE  
      008A9A CD 89 55         [ 4]  468     call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      008A9D 7B 02            [ 1]  469     ld a,(LLEN,sp)
      008A9F 10 01            [ 1]  470     sub a,(CPOS,sp)
      008AA1 CD 8A 03         [ 4]  471     call move_left 
      008AA4 0A 02            [ 1]  472     dec (LLEN,sp)
      000A26                        473 	_drop VSIZE 
      008AA6 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AA8 81               [ 4]  474 	ret 
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
      008AA9                        486 delete_line:
      008AA9 CD 89 DA         [ 4]  487     call send_escape
      008AAC A6 32            [ 1]  488 	ld a,#'2
      008AAE CD 89 55         [ 4]  489 	call putc 
      008AB1 A6 4B            [ 1]  490 	ld a,#'K 
      008AB3 CD 89 55         [ 4]  491 	call putc 
      008AB6 81               [ 4]  492 	ret 
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
      008AB7                        524 readln::
      008AB7 90 89            [ 2]  525 	pushw y 
      000A39                        526 	_vars VSIZE 
      008AB9 52 04            [ 2]    1     sub sp,#VSIZE 
      008ABB 5F               [ 1]  527 	clrw x 
      008ABC 1F 02            [ 2]  528 	ldw (LL,sp),x 
      008ABE 1F 03            [ 2]  529 	ldw (CPOS,sp),x 
      008AC0 03 04            [ 1]  530 	cpl (OVRWR,sp) ; default to overwrite mode 
      008AC2 90 AE 16 90      [ 2]  531  	ldw y,#tib ; terminal input buffer
      008AC6                        532 readln_loop:
      008AC6 CD 89 65         [ 4]  533 	call getc
      008AC9 6B 01            [ 1]  534 	ld (RXCHAR,sp),a
      008ACB A1 1B            [ 1]  535     cp a,#ESC 
      008ACD 26 05            [ 1]  536     jrne 0$
      008ACF CD 89 8C         [ 4]  537     call get_escape 
      008AD2 6B 01            [ 1]  538     ld (RXCHAR,sp),a 
      008AD4 A1 0D            [ 1]  539 0$:	cp a,#CR
      008AD6 26 03            [ 1]  540 	jrne 1$
      008AD8 CC 8C 53         [ 2]  541 	jp readln_quit
      008ADB A1 0A            [ 1]  542 1$:	cp a,#LF 
      008ADD 26 03            [ 1]  543 	jrne 2$ 
      008ADF CC 8C 53         [ 2]  544 	jp readln_quit
      008AE2                        545 2$:
      008AE2 A1 08            [ 1]  546 	cp a,#BS
      008AE4 26 12            [ 1]  547 	jrne 3$
                                    548 ; delete left 
      008AE6 0D 03            [ 1]  549     tnz (CPOS,sp)
      008AE8 27 DC            [ 1]  550     jreq readln_loop 
      008AEA A6 01            [ 1]  551     ld a,#1 
      008AEC CD 8A 03         [ 4]  552     call move_left
      008AEF 0A 03            [ 1]  553     dec (CPOS,sp)
      008AF1 90 5A            [ 2]  554     decw y 
      008AF3 7B 03            [ 1]  555     ld a,(CPOS,sp) 
      008AF5 CC 8B FF         [ 2]  556     jp 12$
      008AF8                        557 3$:
      008AF8 A1 04            [ 1]  558 	cp a,#CTRL_D
      008AFA 26 1A            [ 1]  559 	jrne 4$
                                    560 ;delete line 
      008AFC CD 8A A9         [ 4]  561 	call delete_line 
      008AFF 7B 03            [ 1]  562     ld a,(CPOS,sp)
      008B01 4C               [ 1]  563     inc a 
      008B02 CD 8A 03         [ 4]  564     call move_left 
      008B05 A6 3E            [ 1]  565 	ld a,#'> 
      008B07 CD 89 55         [ 4]  566 	call putc 
      008B0A 90 AE 16 90      [ 2]  567 	ldw y,#tib
      008B0E 90 7F            [ 1]  568 	clr (y)
      008B10 0F 02            [ 1]  569 	clr (LL,sp)
      008B12 0F 03            [ 1]  570 	clr (CPOS,sp)
      008B14 20 B0            [ 2]  571 	jra readln_loop
      008B16                        572 4$:
      008B16 A1 12            [ 1]  573 	cp a,#CTRL_R 
      008B18 26 1E            [ 1]  574 	jrne 5$
                                    575 ;repeat line 
      008B1A 0D 02            [ 1]  576 	tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      008B1C 26 A8            [ 1]  577 	jrne readln_loop
      008B1E 90 AE 16 90      [ 2]  578 	ldw y,#tib 
      008B22 93               [ 1]  579 	ldw x,y
      008B23 CD 93 D0         [ 4]  580 	call strlen
      008B26 4D               [ 1]  581 	tnz a  
      008B27 27 9D            [ 1]  582 	jreq readln_loop
      008B29 6B 02            [ 1]  583 	ld (LL,sp),a 
      008B2B 6B 03            [ 1]  584     ld (CPOS,sp),a
      008B2D 93               [ 1]  585 	ldw x,y  
      008B2E CD 89 B2         [ 4]  586 	call puts
      008B31 0F 01            [ 1]  587 	clr (LL_HB,sp)
      008B33 72 F9 01         [ 2]  588 	addw y,(LL_HB,sp)
      008B36 20 8E            [ 2]  589 	jra readln_loop 
      008B38                        590 5$:
      008B38 A1 05            [ 1]  591 	cp a,#CTRL_E 
      008B3A 26 41            [ 1]  592 	jrne 6$
                                    593 ;edit line number 
      008B3C AE 16 90         [ 2]  594 	ldw x,#tib 
      008B3F CD 99 04         [ 4]  595 	call atoi24
      008B42 CE 00 0E         [ 2]  596 	ldw x,acc16
      008B45 CD 8C 8F         [ 4]  597 	call search_lineno
      008B48 5D               [ 2]  598 	tnzw x 
      008B49 26 03            [ 1]  599 	jrne 51$
                                    600 ;	clr (LL,sp)
                                    601 ;	ldw y,#tib
                                    602 ;   clr (y) 	
      008B4B CC 8C 53         [ 2]  603 	jp readln_quit  
      008B4E                        604 51$:
      008B4E CF 00 05         [ 2]  605 	ldw basicptr,x
      008B51 E6 02            [ 1]  606 	ld a,(2,x)
      008B53 C7 00 04         [ 1]  607 	ld count,a 
      008B56 90 AE 16 90      [ 2]  608 	ldw y,#tib 
      008B5A CD 91 EC         [ 4]  609 	call decompile 
      008B5D 0F 01            [ 1]  610 	clr (LL_HB,sp)
      008B5F A6 0D            [ 1]  611 	ld a,#CR 
      008B61 CD 89 55         [ 4]  612 	call putc 
      008B64 A6 3E            [ 1]  613 	ld a,#'>
      008B66 CD 89 55         [ 4]  614 	call putc
      008B69 AE 16 90         [ 2]  615     ldw x,#tib  
      008B6C CD 93 D0         [ 4]  616 	call strlen 
      008B6F 6B 02            [ 1]  617 	ld (LL,sp),a 
      008B71 CD 89 B2         [ 4]  618 	call puts 
      008B74 90 93            [ 1]  619 	ldw y,x
      008B76 7B 02            [ 1]  620     ld a,(LL,sp)
      008B78 6B 03            [ 1]  621     ld (CPOS,sp),a  
      008B7A CC 8A C6         [ 2]  622 	jp readln_loop
      008B7D                        623 6$:
      008B7D A1 81            [ 1]  624 	cp a,#ARROW_RIGHT
      008B7F 26 15            [ 1]  625    	jrne 7$ 
                                    626 ; right arrow
      008B81 7B 03            [ 1]  627 	ld a,(CPOS,sp)
      008B83 11 02            [ 1]  628     cp a,(LL,sp)
      008B85 2B 03            [ 1]  629     jrmi 61$
      008B87 CC 8A C6         [ 2]  630     jp readln_loop 
      008B8A                        631 61$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      008B8A A6 01            [ 1]  632     ld a,#1 
      008B8C CD 8A 11         [ 4]  633 	call move_right 
      008B8F 0C 03            [ 1]  634 	inc (CPOS,sp)
      008B91 90 5C            [ 1]  635     incw y 
      008B93 CC 8A C6         [ 2]  636     jp readln_loop 
      008B96 A1 80            [ 1]  637 7$: cp a,#ARROW_LEFT  
      008B98 26 13            [ 1]  638 	jrne 8$
                                    639 ; left arrow 
      008B9A 0D 03            [ 1]  640 	tnz (CPOS,sp)
      008B9C 26 03            [ 1]  641 	jrne 71$
      008B9E CC 8A C6         [ 2]  642 	jp readln_loop
      008BA1                        643 71$:
      008BA1 A6 01            [ 1]  644     ld a,#1 
      008BA3 CD 8A 03         [ 4]  645 	call move_left 
      008BA6 0A 03            [ 1]  646 	dec (CPOS,sp)
      008BA8 90 5A            [ 2]  647     decw y 
      008BAA CC 8A C6         [ 2]  648 	jp readln_loop 
      008BAD A1 82            [ 1]  649 8$: cp a,#HOME  
      008BAF 26 0E            [ 1]  650 	jrne 9$
                                    651 ; HOME 
      008BB1 7B 03            [ 1]  652     ld a,(CPOS,sp)
      008BB3 CD 8A 03         [ 4]  653     call move_left 
      008BB6 0F 03            [ 1]  654 	clr (CPOS,sp)
      008BB8 90 AE 16 90      [ 2]  655     ldw y,#tib 
      008BBC CC 8A C6         [ 2]  656 	jp readln_loop  
      008BBF A1 83            [ 1]  657 9$: cp a,#KEY_END  
      008BC1 26 26            [ 1]  658 	jrne 10$
                                    659 ; KEY_END 
      008BC3 7B 03            [ 1]  660 	ld a,(CPOS,sp)
      008BC5 11 02            [ 1]  661 	cp a,(LL,sp)
      008BC7 26 03            [ 1]  662 	jrne 91$
      008BC9 CC 8A C6         [ 2]  663 	jp readln_loop 
      008BCC                        664 91$:
      008BCC 7B 02            [ 1]  665 	ld a,(LL,sp)
      008BCE 10 03            [ 1]  666 	sub a,(CPOS,sp)
      008BD0 CD 8A 11         [ 4]  667 	call move_right 
      008BD3 7B 02            [ 1]  668 	ld a,(LL,sp)
      008BD5 6B 03            [ 1]  669 	ld (CPOS,sp),a
      008BD7 90 AE 16 90      [ 2]  670     ldw y,#tib
      008BDB 72 5F 00 0E      [ 1]  671     clr acc16 
      008BDF C7 00 0F         [ 1]  672     ld acc8,a 
      008BE2 72 B9 00 0E      [ 2]  673     addw y,acc16  
      008BE6 CC 8A C6         [ 2]  674 	jp readln_loop 
      008BE9 A1 0F            [ 1]  675 10$: cp a,#CTRL_O
      008BEB 26 08            [ 1]  676 	jrne 11$ 
                                    677 ; toggle between insert/overwrite
      008BED 03 04            [ 1]  678 	cpl (OVRWR,sp)
      008BEF CD A6 23         [ 4]  679 	call beep_1khz
      008BF2 CC 8A C6         [ 2]  680 	jp readln_loop 
      008BF5 A1 84            [ 1]  681 11$: cp a,#SUP 
      008BF7 26 11            [ 1]  682     jrne final_test 
                                    683 ; del character under cursor 
      008BF9 7B 03            [ 1]  684     ld a,(CPOS,sp)
      008BFB 11 02            [ 1]  685     cp a,(LL,sp)
      008BFD 2A 08            [ 1]  686     jrpl 13$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      008BFF                        687 12$:
      008BFF 97               [ 1]  688     ld xl,a    ; cursor position 
      008C00 7B 02            [ 1]  689     ld a,(LL,sp)  ; line length
      008C02 CD 8A 6E         [ 4]  690     call delete_under
      008C05 0A 02            [ 1]  691     dec (LLEN,sp)
      008C07                        692 13$:
      008C07 CC 8A C6         [ 2]  693     jp readln_loop 
      008C0A                        694 final_test:
      008C0A A1 20            [ 1]  695 	cp a,#SPACE
      008C0C 2A 03            [ 1]  696 	jrpl accept_char
      008C0E CC 8A C6         [ 2]  697 	jp readln_loop
      008C11                        698 accept_char:
      008C11 A6 4F            [ 1]  699 	ld a,#TIB_SIZE-1
      008C13 11 02            [ 1]  700 	cp a, (LL,sp)
      008C15 2A 03            [ 1]  701 	jrpl 1$
      008C17 CC 8A C6         [ 2]  702 	jp readln_loop
      008C1A 0D 04            [ 1]  703 1$:	tnz (OVRWR,sp)
      008C1C 26 18            [ 1]  704 	jrne overwrite
                                    705 ; insert mode 
      008C1E 7B 03            [ 1]  706     ld a,(CPOS,sp)
      008C20 11 02            [ 1]  707     cp a,(LL,sp)
      008C22 27 12            [ 1]  708     jreq overwrite
      008C24 7B 02            [ 1]  709     ld a,(LL,sp)
      008C26 97               [ 1]  710     ld xl,a 
      008C27 7B 03            [ 1]  711     ld a,(CPOS,sp)
      008C29 95               [ 1]  712     ld xh,a
      008C2A 7B 01            [ 1]  713     ld a,(RXCHAR,sp)
      008C2C CD 8A 2B         [ 4]  714     call insert_char
      008C2F 0C 02            [ 1]  715     inc (LLEN,sp)
      008C31 0C 03            [ 1]  716     inc (CPOS,sp)	
      008C33 CC 8A C6         [ 2]  717     jp readln_loop 
      008C36                        718 overwrite:
      008C36 7B 01            [ 1]  719 	ld a,(RXCHAR,sp)
      008C38 90 F7            [ 1]  720 	ld (y),a
      008C3A 90 5C            [ 1]  721     incw y
      008C3C CD 89 55         [ 4]  722     call putc 
      008C3F 7B 03            [ 1]  723 	ld a,(CPOS,sp)
      008C41 11 02            [ 1]  724 	cp a,(LL,sp)
      008C43 2B 09            [ 1]  725 	jrmi 1$
      008C45 90 7F            [ 1]  726 	clr (y)
      008C47 0C 02            [ 1]  727 	inc (LL,sp)
      008C49 0C 03            [ 1]  728     inc (CPOS,sp)
      008C4B CC 8A C6         [ 2]  729 	jp readln_loop 
      008C4E                        730 1$:	
      008C4E 0C 03            [ 1]  731 	inc (CPOS,sp)
      008C50 CC 8A C6         [ 2]  732 	jp readln_loop 
      008C53                        733 readln_quit:
      008C53 90 AE 16 90      [ 2]  734 	ldw y,#tib
      008C57 0F 01            [ 1]  735     clr (LL_HB,sp) 
      008C59 72 F9 01         [ 2]  736     addw y,(LL_HB,sp)
      008C5C 90 7F            [ 1]  737     clr (y)
      008C5E 7B 02            [ 1]  738 	ld a,(LL,sp)
      008C60 C7 00 04         [ 1]  739 	ld count,a 
      008C63 A6 0D            [ 1]  740 	ld a,#CR
      008C65 CD 89 55         [ 4]  741 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      000BE8                        742 	_drop VSIZE 
      008C68 5B 04            [ 2]    1     addw sp,#VSIZE 
      008C6A 90 85            [ 2]  743 	popw y 
      008C6C 81               [ 4]  744 	ret
                                    745 
                                    746 ;------------------------------
                                    747 ; print byte  in hexadecimal 
                                    748 ; on console
                                    749 ; input:
                                    750 ;    A		byte to print
                                    751 ;------------------------------
      008C6D                        752 print_hex::
      008C6D 88               [ 1]  753 	push a 
      008C6E 4E               [ 1]  754 	swap a 
      008C6F CD 8C 84         [ 4]  755 	call to_hex_char 
      008C72 CD 89 55         [ 4]  756 	call putc 
      008C75 7B 01            [ 1]  757     ld a,(1,sp) 
      008C77 CD 8C 84         [ 4]  758 	call to_hex_char
      008C7A CD 89 55         [ 4]  759 	call putc
      008C7D A6 20            [ 1]  760 	ld a,#SPACE 
      008C7F CD 89 55         [ 4]  761 	call putc 
      008C82 84               [ 1]  762 	pop a 
      008C83 81               [ 4]  763 	ret 
                                    764 
                                    765 ;----------------------------------
                                    766 ; convert to hexadecimal digit 
                                    767 ; input:
                                    768 ;   A       digit to convert 
                                    769 ; output:
                                    770 ;   A       hexdecimal character 
                                    771 ;----------------------------------
      008C84                        772 to_hex_char::
      008C84 A4 0F            [ 1]  773 	and a,#15 
      008C86 A1 09            [ 1]  774 	cp a,#9 
      008C88 23 02            [ 2]  775 	jrule 1$ 
      008C8A AB 07            [ 1]  776 	add a,#7
      008C8C AB 30            [ 1]  777 1$: add a,#'0 
      008C8E 81               [ 4]  778 	ret 
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
      008C8F                         51 search_lineno::
      000C0F                         52 	_vars VSIZE
      008C8F 52 02            [ 2]    1     sub sp,#VSIZE 
      008C91 0F 01            [ 1]   53 	clr (LL,sp)
      008C93 90 CE 00 1C      [ 2]   54 	ldw y,txtbgn
      008C97 4D               [ 1]   55 	tnz a 
      008C98 27 04            [ 1]   56 	jreq search_ln_loop
      008C9A 90 CE 00 05      [ 2]   57 	ldw y,basicptr 
      008C9E                         58 search_ln_loop:
      008C9E 90 C3 00 1E      [ 2]   59 	cpw y,txtend 
      008CA2 2A 10            [ 1]   60 	jrpl 8$
      008CA4 90 F3            [ 1]   61 	cpw x,(y)
      008CA6 27 0E            [ 1]   62 	jreq 9$
      008CA8 2B 0A            [ 1]   63 	jrmi 8$ 
      008CAA 90 E6 02         [ 1]   64 	ld a,(2,y)
      008CAD 6B 02            [ 1]   65 	ld (LB,sp),a 
      008CAF 72 F9 01         [ 2]   66 	addw y,(LL,sp)
      008CB2 20 EA            [ 2]   67 	jra search_ln_loop 
      008CB4                         68 8$: 
      008CB4 5F               [ 1]   69 	clrw x 	
      008CB5 51               [ 1]   70 	exgw x,y 
      000C36                         71 9$: _drop VSIZE
      008CB6 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CB8 51               [ 1]   72 	exgw x,y   
      008CB9 81               [ 4]   73 	ret 
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
      008CBA                         83 del_line: 
      000C3A                         84 	_vars VSIZE 
      008CBA 52 04            [ 2]    1     sub sp,#VSIZE 
      008CBC E6 02            [ 1]   85 	ld a,(2,x) ; line length
      008CBE 6B 02            [ 1]   86 	ld (LLEN+1,sp),a 
      008CC0 0F 01            [ 1]   87 	clr (LLEN,sp)
      008CC2 90 93            [ 1]   88 	ldw y,x  
      008CC4 72 F9 01         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008CC7 17 03            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008CC9 90 CE 00 1E      [ 2]   91 	ldw y,txtend 
      008CCD 72 F2 03         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008CD0 90 CF 00 0E      [ 2]   93 	ldw acc16,y 
      008CD4 16 03            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008CD6 CD 93 FC         [ 4]   95 	call move
      008CD9 90 CE 00 1E      [ 2]   96 	ldw y,txtend 
      008CDD 72 F2 01         [ 2]   97 	subw y,(LLEN,sp)
      008CE0 90 CF 00 1E      [ 2]   98 	ldw txtend,y  
      000C64                         99 	_drop VSIZE     
      008CE4 5B 04            [ 2]    1     addw sp,#VSIZE 
      008CE6 81               [ 4]  100 	ret 
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
      008CE7                        115 create_gap:
      000C67                        116 	_vars VSIZE
      008CE7 52 06            [ 2]    1     sub sp,#VSIZE 
      008CE9 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008CEB 17 05            [ 2]  118 	ldw (LEN,sp),y 
      008CED 90 CF 00 0E      [ 2]  119 	ldw acc16,y 
      008CF1 90 93            [ 1]  120 	ldw y,x ; SRC
      008CF3 72 BB 00 0E      [ 2]  121 	addw x,acc16  
      008CF7 1F 01            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008CF9 CE 00 1E         [ 2]  124 	ldw x,txtend 
      008CFC 72 F0 03         [ 2]  125 	subw x,(SRC,sp)
      008CFF CF 00 0E         [ 2]  126 	ldw acc16,x ; size to move
      008D02 1E 01            [ 2]  127 	ldw x,(DEST,sp) 
      008D04 CD 93 FC         [ 4]  128 	call move
      008D07 CE 00 1E         [ 2]  129 	ldw x,txtend
      008D0A 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008D0D CF 00 1E         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      000C90                        132 9$:	_drop VSIZE 
      008D10 5B 06            [ 2]    1     addw sp,#VSIZE 
      008D12 81               [ 4]  133 	ret 
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
      008D13                        150 insert_line:
      000C93                        151 	_vars VSIZE 
      008D13 52 08            [ 2]    1     sub sp,#VSIZE 
      008D15 CE 00 1E         [ 2]  152 	ldw x,txtend  
      008D18 C3 00 1C         [ 2]  153 	cpw x,txtbgn 
      008D1B 26 19            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008D1D AE 00 02         [ 2]  156 	ldw x,#2 
      008D20 72 D6 00 1A      [ 4]  157 	ld a,([ptr16],x)
      008D24 A1 03            [ 1]  158 	cp a,#3
      008D26 27 5A            [ 1]  159 	jreq insert_ln_exit
      008D28 5F               [ 1]  160 	clrw x 
      008D29 97               [ 1]  161 	ld xl,a
      008D2A 1F 07            [ 2]  162 	ldw (LLEN,sp),x 
      008D2C CE 00 1C         [ 2]  163 	ldw x,txtbgn
      008D2F 1F 01            [ 2]  164 	ldw (DEST,sp),x 
      008D31 CE 00 1E         [ 2]  165 	ldw x,txtend 
      008D34 20 38            [ 2]  166 	jra 4$
      008D36 72 CE 00 1A      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008D3A 1F 05            [ 2]  169 	ldw (LINENO,sp),x 
      008D3C AE 00 02         [ 2]  170 	ldw x,#2 
      008D3F 72 D6 00 1A      [ 4]  171 	ld a,([ptr16],x)
      008D43 97               [ 1]  172 	ld xl,a
                                    173 ; line length
      008D44 1F 07            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008D46 1E 05            [ 2]  176 	ldw x,(LINENO,sp)
      008D48 4F               [ 1]  177 	clr a 
      008D49 CD 8C 8F         [ 4]  178 	call search_lineno 
      008D4C 5D               [ 2]  179 	tnzw x 
      008D4D 26 04            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008D4F 17 01            [ 2]  183 	ldw (DEST,sp),y 
      008D51 20 05            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008D53 1F 01            [ 2]  187 2$: ldw (DEST,sp),x 
      008D55 CD 8C BA         [ 4]  188 	call del_line
      008D58                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008D58 A6 03            [ 1]  192 	ld a,#3
      008D5A 11 08            [ 1]  193 	cp a,(LLEN+1,sp)
      008D5C 27 24            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008D5E 1E 01            [ 2]  197 	ldw x,(DEST,sp)
      008D60 C3 00 1E         [ 2]  198 	cpw x,txtend 
      008D63 27 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008D65 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008D67 16 07            [ 2]  203 	ldw y,(LLEN,sp)
      008D69 CD 8C E7         [ 4]  204 	call create_gap
      008D6C 20 06            [ 2]  205 	jra 5$
      008D6E                        206 4$: 
      008D6E 72 FB 07         [ 2]  207 	addw x,(LLEN,sp)
      008D71 CF 00 1E         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008D74 1E 07            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008D76 CF 00 0E         [ 2]  211 	ldw acc16,x 
      008D79 90 AE 16 E0      [ 2]  212 	ldw y,#pad ;SRC 
      008D7D 1E 01            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008D7F CD 93 FC         [ 4]  214 	call move 
      008D82                        215 insert_ln_exit:	
      000D02                        216 	_drop VSIZE
      008D82 5B 08            [ 2]    1     addw sp,#VSIZE 
      008D84 81               [ 4]  217 	ret
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
      008D85                        233 parse_quote: 
      000D05                        234 	_vars VSIZE 
      008D85 52 02            [ 2]    1     sub sp,#VSIZE 
      008D87 4F               [ 1]  235 	clr a
      008D88 6B 01            [ 1]  236 1$:	ld (PREV,sp),a 
      008D8A                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      008D8A 91 D6 01         [ 4]  238 	ld a,([in.w],y)
      008D8D 27 24            [ 1]  239 	jreq 6$
      008D8F 72 5C 00 02      [ 1]  240 	inc in 
      008D93 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008D95 A6 5C            [ 1]  242 	ld a,#'\
      008D97 11 01            [ 1]  243 	cp a, (PREV,sp)
      008D99 26 0A            [ 1]  244 	jrne 3$
      008D9B 0F 01            [ 1]  245 	clr (PREV,sp)
      008D9D 7B 02            [ 1]  246 	ld a,(CURR,sp)
      008D9F AD 1C            [ 4]  247 	callr convert_escape
      008DA1 F7               [ 1]  248 	ld (x),a 
      008DA2 5C               [ 1]  249 	incw x 
      008DA3 20 E5            [ 2]  250 	jra 2$
      008DA5                        251 3$:
      008DA5 7B 02            [ 1]  252 	ld a,(CURR,sp)
      008DA7 A1 5C            [ 1]  253 	cp a,#'\'
      008DA9 27 DD            [ 1]  254 	jreq 1$
      008DAB A1 22            [ 1]  255 	cp a,#'"
      008DAD 27 04            [ 1]  256 	jreq 6$ 
      008DAF F7               [ 1]  257 	ld (x),a 
      008DB0 5C               [ 1]  258 	incw x 
      008DB1 20 D7            [ 2]  259 	jra 2$
      008DB3                        260 6$:
      008DB3 7F               [ 1]  261 	clr (x)
      008DB4 5C               [ 1]  262 	incw x 
      008DB5 90 93            [ 1]  263 	ldw y,x 
      008DB7 5F               [ 1]  264 	clrw x 
      008DB8 A6 02            [ 1]  265 	ld a,#TK_QSTR  
      000D3A                        266 	_drop VSIZE
      008DBA 5B 02            [ 2]    1     addw sp,#VSIZE 
      008DBC 81               [ 4]  267 	ret 
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
      008DBD                        278 convert_escape:
      008DBD 89               [ 2]  279 	pushw x 
      008DBE AE 8D D2         [ 2]  280 	ldw x,#escaped 
      008DC1 F1               [ 1]  281 1$:	cp a,(x)
      008DC2 27 06            [ 1]  282 	jreq 2$
      008DC4 7D               [ 1]  283 	tnz (x)
      008DC5 27 09            [ 1]  284 	jreq 3$
      008DC7 5C               [ 1]  285 	incw x 
      008DC8 20 F7            [ 2]  286 	jra 1$
      008DCA 1D 8D D2         [ 2]  287 2$: subw x,#escaped 
      008DCD 9F               [ 1]  288 	ld a,xl 
      008DCE AB 07            [ 1]  289 	add a,#7
      008DD0 85               [ 2]  290 3$:	popw x 
      008DD1 81               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                    292 
      008DD2 61 62 74 6E 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008DDA                        310 parse_integer: ; { -- n }
      008DDA 89               [ 2]  311 	pushw x 	
      008DDB 4B 00            [ 1]  312 	push #0 ; TCHAR
      008DDD 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008DDF A1 24            [ 1]  314 	cp a,#'$
      008DE1 26 04            [ 1]  315 	jrne 2$ 
      000D63                        316     _drop #1
      008DE3 5B 01            [ 2]    1     addw sp,##1 
      008DE5 4B 10            [ 1]  317 	push #16  ; BASE=16
      008DE7 F7               [ 1]  318 2$:	ld (x),a 
      008DE8 5C               [ 1]  319 	incw x 
      008DE9 91 D6 01         [ 4]  320 	ld a,([in.w],y)
      008DEC 72 5C 00 02      [ 1]  321 	inc in 
      008DF0 CD 98 F8         [ 4]  322 	call to_upper 
      008DF3 6B 02            [ 1]  323 	ld (TCHAR,sp),a 
      008DF5 CD 8E 77         [ 4]  324 	call is_digit 
      008DF8 25 ED            [ 1]  325 	jrc 2$
      008DFA A6 10            [ 1]  326 	ld a,#16 
      008DFC 11 01            [ 1]  327 	cp a,(BASE,sp)
      008DFE 26 0A            [ 1]  328 	jrne 3$ 
      008E00 7B 02            [ 1]  329 	ld a,(TCHAR,sp)
      008E02 A1 41            [ 1]  330 	cp a,#'A 
      008E04 2B 04            [ 1]  331 	jrmi 3$ 
      008E06 A1 47            [ 1]  332 	cp a,#'G 
      008E08 2B DD            [ 1]  333 	jrmi 2$ 
      008E0A 72 5A 00 02      [ 1]  334 3$: dec in 	
      008E0E 7F               [ 1]  335     clr (x)
      008E0F 1E 03            [ 2]  336 	ldw x,(XSAVE,sp)
      008E11 CD 99 04         [ 4]  337 	call atoi24
      008E14 16 03            [ 2]  338 	ldw y,(XSAVE,sp)
      008E16 C6 00 0D         [ 1]  339 	ld a,acc24 
      008E19 90 F7            [ 1]  340 	ld (y),a 
      008E1B 90 5C            [ 1]  341 	incw y  
      008E1D CE 00 0E         [ 2]  342 	ldw x,acc16 
      008E20 90 FF            [ 2]  343 	ldw (y),x 
      008E22 72 A9 00 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      008E26 A6 84            [ 1]  345 	ld a,#TK_INTGR
      000DA8                        346 	_drop VSIZE  
      008E28 5B 04            [ 2]    1     addw sp,#VSIZE 
      008E2A 81               [ 4]  347 	ret 	
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
      008E2B                        364 parse_binary: ; { -- n }
      008E2B 4B 00            [ 1]  365 	push #0
      008E2D 4B 00            [ 1]  366 	push #0
      008E2F 4B 00            [ 1]  367 	push #0
      008E31                        368 2$:	
      008E31 91 D6 01         [ 4]  369 	ld a,([in.w],y)
      008E34 72 5C 00 02      [ 1]  370 	inc in 
      008E38 A1 30            [ 1]  371 	cp a,#'0 
      008E3A 27 06            [ 1]  372 	jreq 3$
      008E3C A1 31            [ 1]  373 	cp a,#'1 
      008E3E 27 02            [ 1]  374 	jreq 3$ 
      008E40 20 0B            [ 2]  375 	jra bin_exit 
      008E42 A0 30            [ 1]  376 3$: sub a,#'0 
      008E44 46               [ 1]  377 	rrc a
      008E45 09 03            [ 1]  378 	rlc (BINARY+2,sp) 
      008E47 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008E49 09 01            [ 1]  380 	rlc (BINARY,sp) 
      008E4B 20 E4            [ 2]  381 	jra 2$  
      008E4D                        382 bin_exit:
      008E4D 72 5A 00 02      [ 1]  383 	dec in 
      008E51 90 93            [ 1]  384 	ldw y,x
      008E53 7B 01            [ 1]  385 	ld a,(BINARY,sp)
      008E55 90 F7            [ 1]  386 	ld (y),a 
      008E57 90 5C            [ 1]  387 	incw y 
      008E59 1E 02            [ 2]  388 	ldw x,(BINARY+1,sp)
      008E5B 90 FF            [ 2]  389 	ldw (y),x 
      008E5D 72 A9 00 02      [ 2]  390 	addw y,#2  
      008E61 A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000DE3                        392 	_drop VSIZE 
      008E63 5B 03            [ 2]    1     addw sp,#VSIZE 
      008E65 81               [ 4]  393 	ret
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
      008E66                        402 is_alpha::
      008E66 A1 41            [ 1]  403 	cp a,#'A 
      008E68 8C               [ 1]  404 	ccf 
      008E69 24 0B            [ 1]  405 	jrnc 9$ 
      008E6B A1 5B            [ 1]  406 	cp a,#'Z+1 
      008E6D 25 07            [ 1]  407 	jrc 9$ 
      008E6F A1 61            [ 1]  408 	cp a,#'a 
      008E71 8C               [ 1]  409 	ccf 
      008E72 24 02            [ 1]  410 	jrnc 9$
      008E74 A1 7B            [ 1]  411 	cp a,#'z+1
      008E76 81               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      008E77                        421 is_digit::
      008E77 A1 30            [ 1]  422 	cp a,#'0
      008E79 25 03            [ 1]  423 	jrc 1$
      008E7B A1 3A            [ 1]  424     cp a,#'9+1
      008E7D 8C               [ 1]  425 	ccf 
      008E7E 8C               [ 1]  426 1$:	ccf 
      008E7F 81               [ 4]  427     ret
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
      008E80                        438 is_alnum::
      008E80 CD 8E 77         [ 4]  439 	call is_digit
      008E83 25 03            [ 1]  440 	jrc 1$ 
      008E85 CD 8E 66         [ 4]  441 	call is_alpha
      008E88 81               [ 4]  442 1$:	ret 
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



      008E89                        453 is_symbol_char: 
      008E89 A1 5F            [ 1]  454 	cp a,#'_ 
      008E8B 26 03            [ 1]  455 	jrne 1$
      008E8D 99               [ 1]  456 	scf 
      008E8E 20 03            [ 2]  457 	jra 9$ 
      008E90 CD 8E 80         [ 4]  458 1$:	call is_alnum 
      008E93 81               [ 4]  459 9$: ret 
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
      008E94                        473 parse_symbol:
      008E94 5C               [ 1]  474 	incw x ; keep space for TK_ID 
      008E95                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008E95 CD 98 F8         [ 4]  477 	call to_upper  
      008E98 F7               [ 1]  478 	ld (x), a 
      008E99 5C               [ 1]  479 	incw x
      008E9A 91 D6 01         [ 4]  480 	ld a,([in.w],y)
      008E9D 72 5C 00 02      [ 1]  481 	inc in 
      008EA1 CD 8E 89         [ 4]  482 	call is_symbol_char 
      008EA4 25 EF            [ 1]  483 	jrc symb_loop 
      008EA6 7F               [ 1]  484 	clr (x)
      008EA7 72 5A 00 02      [ 1]  485 	dec in  
      008EAB 81               [ 4]  486 	ret 
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
      008EAC                        502 parse_keyword: 
      008EAC 89               [ 2]  503 	pushw x ; preserve *symbol 
      008EAD CD 8E 94         [ 4]  504 	call parse_symbol
      008EB0 1E 01            [ 2]  505 	ldw x,(XFIRST,sp) 
      008EB2 E6 02            [ 1]  506 	ld a,(2,x)
      008EB4 26 0F            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008EB6 E6 01            [ 1]  509 	ld a,(1,x) 
      008EB8 A0 41            [ 1]  510 	sub a,#'A 
      008EBA AE 00 03         [ 2]  511 	ldw x,#3 
      008EBD 42               [ 4]  512 	mul x,a 
      008EBE 1C 00 35         [ 2]  513 	addw x,#vars 
      008EC1 A6 85            [ 1]  514 	ld a,#TK_VAR 
      008EC3 20 36            [ 2]  515 	jra 4$ 
      008EC5                        516 2$: ; check for keyword, otherwise syntax error.
      000E45                        517 	_ldx_dict kword_dict ; dictionary entry point
      008EC5 AE B4 9F         [ 2]    1     ldw x,#kword_dict+2
      008EC8 16 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008ECA 90 5C            [ 1]  519 	incw y 
      008ECC CD 99 85         [ 4]  520 	call search_dict
      008ECF 4D               [ 1]  521 	tnz a
      008ED0 26 29            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008ED2 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008ED4 A6 03            [ 1]  526 	ld a,#TK_LABEL 
      008ED6 90 F7            [ 1]  527 	ld (y),a 
      008ED8 90 5C            [ 1]  528 	incw y
      008EDA 93               [ 1]  529 	ldw x,y 
      008EDB CD 93 D0         [ 4]  530 	call strlen
      008EDE A1 0F            [ 1]  531 	cp a,#NAME_MAX_LEN 
      008EE0 23 02            [ 2]  532 	jrule 22$ 
      008EE2 A6 0F            [ 1]  533 	ld a,#NAME_MAX_LEN 
      008EE4                        534 22$:	
      008EE4 88               [ 1]  535 	push a 
      008EE5                        536 24$:
      008EE5 90 F6            [ 1]  537     ld a,(y)
      008EE7 27 09            [ 1]  538 	jreq 3$
      008EE9 90 5C            [ 1]  539 	incw y
      008EEB 0A 01            [ 1]  540 	dec (1,sp) 
      008EED 26 F6            [ 1]  541 	jrne 24$
      008EEF 4F               [ 1]  542 	clr a 
      008EF0 90 F7            [ 1]  543 	ld (y),a 
      008EF2 90 5C            [ 1]  544 3$: incw y 
      000E74                        545 	_drop 1 
      008EF4 5B 01            [ 2]    1     addw sp,#1 
      008EF6 A6 03            [ 1]  546 	ld a,#TK_LABEL 
      008EF8 5F               [ 1]  547 	clrw x 
      008EF9 20 1B            [ 2]  548 	jra 5$ 
      008EFB                        549 4$:	
      008EFB 16 01            [ 2]  550 	ldw y,(XFIRST,sp)
      008EFD A1 87            [ 1]  551 	cp a,#TK_NOT 
      008EFF 2B 06            [ 1]  552 	jrmi 41$
      008F01 90 F7            [ 1]  553 	ld (y),a 
      008F03 90 5C            [ 1]  554 	incw y 
      008F05 20 0F            [ 2]  555 	jra 5$ 
      008F07                        556 41$:	
      008F07 A3 9C FE         [ 2]  557 	cpw x,#let  
      008F0A 27 0A            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008F0C 90 F7            [ 1]  559 	ld (y),a 
      008F0E 90 5C            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008F10 90 FF            [ 2]  561 	ldw (y),x
      008F12 72 A9 00 02      [ 2]  562 	addw y,#2  
      000E96                        563 5$:	_drop VSIZE 
      008F16 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F18 81               [ 4]  564 	ret  	
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
      008F19                        575 skip:
      008F19 88               [ 1]  576 	push a
      008F1A 91 D6 01         [ 4]  577 1$:	ld a,([in.w],y)
      008F1D 27 0A            [ 1]  578 	jreq 2$
      008F1F 11 01            [ 1]  579 	cp a,(C,sp)
      008F21 26 06            [ 1]  580 	jrne 2$
      008F23 72 5C 00 02      [ 1]  581 	inc in
      008F27 20 F1            [ 2]  582 	jra 1$
      000EA9                        583 2$: _drop 1 
      008F29 5B 01            [ 2]    1     addw sp,#1 
      008F2B 81               [ 4]  584 	ret
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
      008F2C                        609 get_token:: 
      000EAC                        610 	_vars VSIZE
      008F2C 52 02            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      008F2E                        616 0$: 
      008F2E 90 AE 16 90      [ 2]  617 	ldw y,#tib    	
      008F32 A6 20            [ 1]  618 	ld a,#SPACE
      008F34 CD 8F 19         [ 4]  619 	call skip
      008F37 55 00 02 00 03   [ 1]  620 	mov in.saved,in 
      008F3C 91 D6 01         [ 4]  621 	ld a,([in.w],y)
      008F3F 26 05            [ 1]  622 	jrne 1$
      008F41 90 93            [ 1]  623 	ldw y,x 
      008F43 CC 90 DD         [ 2]  624 	jp token_exit ; end of line 
      008F46 72 5C 00 02      [ 1]  625 1$:	inc in 
      008F4A CD 98 F8         [ 4]  626 	call to_upper 
      008F4D 6B 01            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      008F4F                        629 str_tst:  	
      000ECF                        630 	_case '"' nbr_tst
      008F4F A6 22            [ 1]    1 	ld a,#'"' 
      008F51 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F53 26 0A            [ 1]    3 	jrne nbr_tst
      008F55 A6 02            [ 1]  631 	ld a,#TK_QSTR
      008F57 F7               [ 1]  632 	ld (x),a 
      008F58 5C               [ 1]  633 	incw x 
      008F59 CD 8D 85         [ 4]  634 	call parse_quote
      008F5C CC 90 DD         [ 2]  635 	jp token_exit
      008F5F                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008F5F A6 24            [ 1]  638 	ld a,#'$'
      008F61 11 01            [ 1]  639 	cp a,(TCHAR,sp) 
      008F63 27 17            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008F65 A6 26            [ 1]  642 	ld a,#'&
      008F67 11 01            [ 1]  643 	cp a,(TCHAR,sp)
      008F69 26 0A            [ 1]  644 	jrne 0$
      008F6B A6 84            [ 1]  645 	ld a,#TK_INTGR
      008F6D F7               [ 1]  646 	ld (x),a 
      008F6E 5C               [ 1]  647 	incw x 
      008F6F CD 8E 2B         [ 4]  648 	call parse_binary ; expect binary integer 
      008F72 CC 90 DD         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008F75 7B 01            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008F77 CD 8E 77         [ 4]  652 	call is_digit
      008F7A 24 0C            [ 1]  653 	jrnc 3$
      008F7C A6 84            [ 1]  654 1$:	ld a,#TK_INTGR 
      008F7E F7               [ 1]  655 	ld (x),a 
      008F7F 5C               [ 1]  656 	incw x 
      008F80 7B 01            [ 1]  657 	ld a,(TCHAR,sp)
      008F82 CD 8D DA         [ 4]  658 	call parse_integer 
      008F85 CC 90 DD         [ 2]  659 	jp token_exit 
      008F88                        660 3$: 
      000F08                        661 	_case '(' bkslsh_tst 
      008F88 A6 28            [ 1]    1 	ld a,#'(' 
      008F8A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F8C 26 05            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      008F8E A6 06            [ 1]  662 	ld a,#TK_LPAREN
      008F90 CC 90 D9         [ 2]  663 	jp token_char   	
      008F93                        664 bkslsh_tst: ; character token 
      000F13                        665 	_case '\',rparnt_tst
      008F93 A6 5C            [ 1]    1 	ld a,#'\' 
      008F95 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008F97 26 16            [ 1]    3 	jrne rparnt_tst
      008F99 A6 04            [ 1]  666 	ld a,#TK_CHAR 
      008F9B F7               [ 1]  667 	ld (x),a 
      008F9C 5C               [ 1]  668 	incw x 
      008F9D 91 D6 01         [ 4]  669 	ld a,([in.w],y)
      008FA0 F7               [ 1]  670 	ld (x),a 
      008FA1 5C               [ 1]  671 	incw x
      008FA2 90 93            [ 1]  672 	ldw y,x 	 
      008FA4 72 5C 00 02      [ 1]  673 	inc in  
      008FA8 5F               [ 1]  674 	clrw x 
      008FA9 97               [ 1]  675 	ld xl,a 
      008FAA A6 04            [ 1]  676 	ld a,#TK_CHAR 
      008FAC CC 90 DD         [ 2]  677 	jp token_exit 
      008FAF                        678 rparnt_tst:		
      000F2F                        679 	_case ')' colon_tst 
      008FAF A6 29            [ 1]    1 	ld a,#')' 
      008FB1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FB3 26 05            [ 1]    3 	jrne colon_tst
      008FB5 A6 07            [ 1]  680 	ld a,#TK_RPAREN 
      008FB7 CC 90 D9         [ 2]  681 	jp token_char
      008FBA                        682 colon_tst:
      000F3A                        683 	_case ':' comma_tst 
      008FBA A6 3A            [ 1]    1 	ld a,#':' 
      008FBC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FBE 26 05            [ 1]    3 	jrne comma_tst
      008FC0 A6 0A            [ 1]  684 	ld a,#TK_COLON 
      008FC2 CC 90 D9         [ 2]  685 	jp token_char  
      008FC5                        686 comma_tst:
      000F45                        687 	_case COMMA sharp_tst 
      008FC5 A6 2C            [ 1]    1 	ld a,#COMMA 
      008FC7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FC9 26 05            [ 1]    3 	jrne sharp_tst
      008FCB A6 08            [ 1]  688 	ld a,#TK_COMMA
      008FCD CC 90 D9         [ 2]  689 	jp token_char
      008FD0                        690 sharp_tst:
      000F50                        691 	_case SHARP dash_tst 
      008FD0 A6 23            [ 1]    1 	ld a,#SHARP 
      008FD2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FD4 26 05            [ 1]    3 	jrne dash_tst
      008FD6 A6 09            [ 1]  692 	ld a,#TK_SHARP
      008FD8 CC 90 D9         [ 2]  693 	jp token_char  	 	 
      008FDB                        694 dash_tst: 	
      000F5B                        695 	_case '-' at_tst 
      008FDB A6 2D            [ 1]    1 	ld a,#'-' 
      008FDD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FDF 26 05            [ 1]    3 	jrne at_tst
      008FE1 A6 11            [ 1]  696 	ld a,#TK_MINUS  
      008FE3 CC 90 D9         [ 2]  697 	jp token_char 
      008FE6                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      000F66                        699 	_case '@' qmark_tst 
      008FE6 A6 40            [ 1]    1 	ld a,#'@' 
      008FE8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FEA 26 05            [ 1]    3 	jrne qmark_tst
      008FEC A6 05            [ 1]  700 	ld a,#TK_ARRAY 
      008FEE CC 90 D9         [ 2]  701 	jp token_char
      008FF1                        702 qmark_tst:
      000F71                        703 	_case '?' tick_tst 
      008FF1 A6 3F            [ 1]    1 	ld a,#'?' 
      008FF3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008FF5 26 12            [ 1]    3 	jrne tick_tst
      008FF7 A6 80            [ 1]  704 	ld a,#TK_CMD  
      008FF9 F7               [ 1]  705 	ld (x),a 
      008FFA 5C               [ 1]  706 	incw x 
      008FFB 90 93            [ 1]  707 	ldw y,x 
      008FFD AE A0 76         [ 2]  708 	ldw x,#print
      009000 90 FF            [ 2]  709 	ldw (y),x 
      009002 72 A9 00 02      [ 2]  710 	addw y,#2
      009006 CC 90 DD         [ 2]  711 	jp token_exit
      009009                        712 tick_tst: ; comment 
      000F89                        713 	_case TICK plus_tst 
      009009 A6 27            [ 1]    1 	ld a,#TICK 
      00900B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00900D 26 2B            [ 1]    3 	jrne plus_tst
      00900F A6 80            [ 1]  714 	ld a,#TK_CMD
      009011 F7               [ 1]  715 	ld (x),a 
      009012 5C               [ 1]  716 	incw x
      009013 90 AE A1 BE      [ 2]  717 	ldw y,#remark 
      009017 FF               [ 2]  718 	ldw (x),y 
      009018 1C 00 02         [ 2]  719 	addw x,#2  
      00901B                        720 copy_comment:
      00901B 90 AE 16 90      [ 2]  721 	ldw y,#tib 
      00901F 72 B9 00 01      [ 2]  722 	addw y,in.w
      009023 90 89            [ 2]  723 	pushw y 
      009025 CD 93 EC         [ 4]  724 	call strcpy
      009028 72 F2 01         [ 2]  725 	subw y,(1,sp)
      00902B 90 5C            [ 1]  726 	incw y ; strlen+1 
      00902D 17 01            [ 2]  727 	ldw (1,sp),y 
      00902F 72 FB 01         [ 2]  728 	addw x,(1,sp) 
      000FB2                        729 	_drop 2 
      009032 5B 02            [ 2]    1     addw sp,#2 
      009034 4F               [ 1]  730 	clr a 
      009035 90 93            [ 1]  731 	ldw y,x 
      009037 CC 90 DD         [ 2]  732 	jp token_exit 
      00903A                        733 plus_tst:
      000FBA                        734 	_case '+' star_tst 
      00903A A6 2B            [ 1]    1 	ld a,#'+' 
      00903C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00903E 26 05            [ 1]    3 	jrne star_tst
      009040 A6 10            [ 1]  735 	ld a,#TK_PLUS  
      009042 CC 90 D9         [ 2]  736 	jp token_char 
      009045                        737 star_tst:
      000FC5                        738 	_case '*' slash_tst 
      009045 A6 2A            [ 1]    1 	ld a,#'*' 
      009047 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009049 26 05            [ 1]    3 	jrne slash_tst
      00904B A6 20            [ 1]  739 	ld a,#TK_MULT 
      00904D CC 90 D9         [ 2]  740 	jp token_char 
      009050                        741 slash_tst: 
      000FD0                        742 	_case '/' prcnt_tst 
      009050 A6 2F            [ 1]    1 	ld a,#'/' 
      009052 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009054 26 05            [ 1]    3 	jrne prcnt_tst
      009056 A6 21            [ 1]  743 	ld a,#TK_DIV 
      009058 CC 90 D9         [ 2]  744 	jp token_char 
      00905B                        745 prcnt_tst:
      000FDB                        746 	_case '%' eql_tst 
      00905B A6 25            [ 1]    1 	ld a,#'%' 
      00905D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00905F 26 05            [ 1]    3 	jrne eql_tst
      009061 A6 22            [ 1]  747 	ld a,#TK_MOD
      009063 CC 90 D9         [ 2]  748 	jp token_char  
                                    749 ; 1 or 2 character tokens 	
      009066                        750 eql_tst:
      000FE6                        751 	_case '=' gt_tst 		
      009066 A6 3D            [ 1]    1 	ld a,#'=' 
      009068 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00906A 26 05            [ 1]    3 	jrne gt_tst
      00906C A6 32            [ 1]  752 	ld a,#TK_EQUAL
      00906E CC 90 D9         [ 2]  753 	jp token_char 
      009071                        754 gt_tst:
      000FF1                        755 	_case '>' lt_tst 
      009071 A6 3E            [ 1]    1 	ld a,#'>' 
      009073 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      009075 26 23            [ 1]    3 	jrne lt_tst
      009077 A6 31            [ 1]  756 	ld a,#TK_GT 
      009079 6B 02            [ 1]  757 	ld (ATTRIB,sp),a 
      00907B 91 D6 01         [ 4]  758 	ld a,([in.w],y)
      00907E 72 5C 00 02      [ 1]  759 	inc in 
      009082 A1 3D            [ 1]  760 	cp a,#'=
      009084 26 04            [ 1]  761 	jrne 1$
      009086 A6 33            [ 1]  762 	ld a,#TK_GE 
      009088 20 4F            [ 2]  763 	jra token_char  
      00908A A1 3C            [ 1]  764 1$: cp a,#'<
      00908C 26 04            [ 1]  765 	jrne 2$
      00908E A6 35            [ 1]  766 	ld a,#TK_NE 
      009090 20 47            [ 2]  767 	jra token_char 
      009092 72 5A 00 02      [ 1]  768 2$: dec in
      009096 7B 02            [ 1]  769 	ld a,(ATTRIB,sp)
      009098 20 3F            [ 2]  770 	jra token_char 	 
      00909A                        771 lt_tst:
      00101A                        772 	_case '<' other
      00909A A6 3C            [ 1]    1 	ld a,#'<' 
      00909C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      00909E 26 23            [ 1]    3 	jrne other
      0090A0 A6 34            [ 1]  773 	ld a,#TK_LT 
      0090A2 6B 02            [ 1]  774 	ld (ATTRIB,sp),a 
      0090A4 91 D6 01         [ 4]  775 	ld a,([in.w],y)
      0090A7 72 5C 00 02      [ 1]  776 	inc in 
      0090AB A1 3D            [ 1]  777 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      0090AD 26 04            [ 1]  778 	jrne 1$
      0090AF A6 36            [ 1]  779 	ld a,#TK_LE 
      0090B1 20 26            [ 2]  780 	jra token_char 
      0090B3 A1 3E            [ 1]  781 1$: cp a,#'>
      0090B5 26 04            [ 1]  782 	jrne 2$
      0090B7 A6 35            [ 1]  783 	ld a,#TK_NE 
      0090B9 20 1E            [ 2]  784 	jra token_char 
      0090BB 72 5A 00 02      [ 1]  785 2$: dec in 
      0090BF 7B 02            [ 1]  786 	ld a,(ATTRIB,sp)
      0090C1 20 16            [ 2]  787 	jra token_char 	
      0090C3                        788 other: ; not a special character 	 
      0090C3 7B 01            [ 1]  789 	ld a,(TCHAR,sp)
      0090C5 CD 8E 66         [ 4]  790 	call is_alpha 
      0090C8 25 03            [ 1]  791 	jrc 30$ 
      0090CA CC 96 B0         [ 2]  792 	jp syntax_error 
      0090CD                        793 30$: 
      0090CD CD 8E AC         [ 4]  794 	call parse_keyword
      0090D0 A3 A1 BE         [ 2]  795 	cpw x,#remark 
      0090D3 26 08            [ 1]  796 	jrne token_exit 
      0090D5 93               [ 1]  797 	ldw x,y 
      0090D6 CC 90 1B         [ 2]  798 	jp copy_comment 
      0090D9                        799 token_char:
      0090D9 F7               [ 1]  800 	ld (x),a 
      0090DA 5C               [ 1]  801 	incw x
      0090DB 90 93            [ 1]  802 	ldw y,x 
      0090DD                        803 token_exit:
      00105D                        804 	_drop VSIZE 
      0090DD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090DF 81               [ 4]  805 	ret
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
      0090E0                        825 compile::
      0090E0 90 89            [ 2]  826 	pushw y 
      001062                        827 	_vars VSIZE 
      0090E2 52 02            [ 2]    1     sub sp,#VSIZE 
      0090E4 55 00 1C 00 05   [ 1]  828 	mov basicptr,txtbgn
      0090E9 72 1A 00 23      [ 1]  829 	bset flags,#FCOMP 
      0090ED A6 00            [ 1]  830 	ld a,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      0090EF AE 00 00         [ 2]  831 	ldw x,#0
      0090F2 CF 16 E0         [ 2]  832 	ldw pad,x ; destination buffer 
      0090F5 C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      0090F8 AE 16 E3         [ 2]  834 	ldw x,#pad+3
      0090FB 72 5F 00 02      [ 1]  835 	clr in 
      0090FF CD 8F 2C         [ 4]  836 	call get_token
      009102 A1 84            [ 1]  837 	cp a,#TK_INTGR
      009104 26 11            [ 1]  838 	jrne 2$
      009106 A3 00 01         [ 2]  839 	cpw x,#1 
      009109 2A 05            [ 1]  840 	jrpl 1$
      00910B A6 0A            [ 1]  841 	ld a,#ERR_BAD_VALUE
      00910D CC 96 B2         [ 2]  842 	jp tb_error
      009110 CF 16 E0         [ 2]  843 1$:	ldw pad,x 
      009113 90 AE 16 E3      [ 2]  844 	ldw y,#pad+3 
      009117 90 A3 17 60      [ 2]  845 2$:	cpw y,#xstack_full 
      00911B 25 05            [ 1]  846 	jrult 3$
      00911D A6 0F            [ 1]  847 	ld a,#ERR_BUF_FULL 
      00911F CC 96 B2         [ 2]  848 	jp tb_error 
      009122                        849 3$:	
      009122 93               [ 1]  850 	ldw x,y 
      009123 CD 8F 2C         [ 4]  851 	call get_token 
      009126 A1 00            [ 1]  852 	cp a,#TK_NONE 
      009128 26 ED            [ 1]  853 	jrne 2$ 
                                    854 ; compilation completed  
      00912A 72 A2 16 E0      [ 2]  855 	subw y,#pad
      00912E 90 9F            [ 1]  856     ld a,yl
      009130 AE 16 E0         [ 2]  857 	ldw x,#pad 
      009133 CF 00 1A         [ 2]  858 	ldw ptr16,x 
      009136 E7 02            [ 1]  859 	ld (2,x),a 
      009138 FE               [ 2]  860 	ldw x,(x)
      009139 27 09            [ 1]  861 	jreq 10$
      00913B CD 8D 13         [ 4]  862 	call insert_line
      00913E 72 5F 00 04      [ 1]  863 	clr  count 
      009142 20 0F            [ 2]  864 	jra  11$ 
      009144                        865 10$: ; line# is zero 
      009144 CE 00 1A         [ 2]  866 	ldw x,ptr16  
      009147 CF 00 05         [ 2]  867 	ldw basicptr,x 
      00914A E6 02            [ 1]  868 	ld a,(2,x)
      00914C C7 00 04         [ 1]  869 	ld count,a 
      00914F 35 03 00 02      [ 1]  870 	mov in,#3 
      009153                        871 11$:
      0010D3                        872 	_drop VSIZE 
      009153 5B 02            [ 2]    1     addw sp,#VSIZE 
      009155 72 1B 00 23      [ 1]  873 	bres flags,#FCOMP 
      009159 90 85            [ 2]  874 	popw y 
      00915B 81               [ 4]  875 	ret 
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
      00915C                         48 cpy_cmd_name:
      00915C 5D               [ 2]   49 	tnzw x 
      00915D 27 14            [ 1]   50 	jreq 10$
      00915F F6               [ 1]   51 	ld a,(x)
      009160 5C               [ 1]   52 	incw x
      009161 A4 0F            [ 1]   53 	and a,#15  
      009163 88               [ 1]   54 	push a 
      009164 0D 01            [ 1]   55     tnz (1,sp) 
      009166 27 0A            [ 1]   56 	jreq 9$
      009168 F6               [ 1]   57 1$:	ld a,(x)
      009169 90 F7            [ 1]   58 	ld (y),a  
      00916B 5C               [ 1]   59 	incw x
      00916C 90 5C            [ 1]   60 	incw y 
      00916E 0A 01            [ 1]   61 	dec (1,sp)	 
      009170 26 F6            [ 1]   62 	jrne 1$
      009172 84               [ 1]   63 9$: pop a 
      009173                         64 10$: 
      009173 81               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      009174                         75 add_space:
      009174 90 5A            [ 2]   76 	decw y 
      009176 90 F6            [ 1]   77 	ld a,(y)
      009178 90 5C            [ 1]   78 	incw y
      00917A A1 29            [ 1]   79 	cp a,#') 
      00917C 27 05            [ 1]   80 	jreq 0$
      00917E CD 8E 80         [ 4]   81 	call is_alnum 
      009181 24 06            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009183                         83 0$: 
      009183 A6 20            [ 1]   84 	ld a,#SPACE 
      009185 90 F7            [ 1]   85 	ld (y),a 
      009187 90 5C            [ 1]   86 	incw y 
      009189 81               [ 4]   87 1$: ret 
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
      00918A                         99 right_align::
      00918A 88               [ 1]  100 	push a 
      00918B 7B 01            [ 1]  101 0$: ld a,(1,sp)
      00918D C1 00 24         [ 1]  102 	cp a,tab_width 
      009190 2A 08            [ 1]  103 	jrpl 1$
      009192 A6 20            [ 1]  104 	ld a,#SPACE 
      009194 5A               [ 2]  105 	decw x
      009195 F7               [ 1]  106 	ld (x),a  
      009196 0C 01            [ 1]  107 	inc (1,sp)
      009198 20 F1            [ 2]  108 	jra 0$ 
      00919A 84               [ 1]  109 1$: pop a 	
      00919B 81               [ 4]  110 	ret 
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
      00919C                        123 cpy_quote:
      00919C A6 22            [ 1]  124 	ld a,#'"
      00919E 90 F7            [ 1]  125 	ld (y),a 
      0091A0 90 5C            [ 1]  126 	incw y 
      0091A2 89               [ 2]  127 	pushw x 
      0091A3 CD 98 33         [ 4]  128 	call skip_string 
      0091A6 85               [ 2]  129 	popw x 
      0091A7 F6               [ 1]  130 1$:	ld a,(x)
      0091A8 27 30            [ 1]  131 	jreq 9$
      0091AA 5C               [ 1]  132 	incw x 
      0091AB A1 20            [ 1]  133 	cp a,#SPACE 
      0091AD 25 0E            [ 1]  134 	jrult 3$
      0091AF 90 F7            [ 1]  135 	ld (y),a
      0091B1 90 5C            [ 1]  136 	incw y 
      0091B3 A1 5C            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      0091B5 26 F0            [ 1]  138 	jrne 1$ 
      0091B7                        139 2$:
      0091B7 90 F7            [ 1]  140 	ld (y),a
      0091B9 90 5C            [ 1]  141 	incw y  
      0091BB 20 EA            [ 2]  142 	jra 1$
      0091BD 88               [ 1]  143 3$: push a 
      0091BE A6 5C            [ 1]  144 	ld a,#'\
      0091C0 90 F7            [ 1]  145 	ld (y),a 
      0091C2 90 5C            [ 1]  146 	incw y  
      0091C4 84               [ 1]  147 	pop a 
      0091C5 A0 07            [ 1]  148 	sub a,#7
      0091C7 C7 00 0F         [ 1]  149 	ld acc8,a 
      0091CA 72 5F 00 0E      [ 1]  150 	clr acc16
      0091CE 89               [ 2]  151 	pushw x
      0091CF AE 8D D2         [ 2]  152 	ldw x,#escaped 
      0091D2 72 BB 00 0E      [ 2]  153 	addw x,acc16 
      0091D6 F6               [ 1]  154 	ld a,(x)
      0091D7 85               [ 2]  155 	popw x
      0091D8 20 DD            [ 2]  156 	jra 2$
      0091DA A6 22            [ 1]  157 9$: ld a,#'"
      0091DC 90 F7            [ 1]  158 	ld (y),a 
      0091DE 90 5C            [ 1]  159 	incw y  
      0091E0 5C               [ 1]  160 	incw x 
      0091E1 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0091E2                        171 var_name::
      0091E2 1D 00 35         [ 2]  172 		subw x,#vars 
      0091E5 A6 03            [ 1]  173 		ld a,#3
      0091E7 62               [ 2]  174 		div x,a 
      0091E8 9F               [ 1]  175 		ld a,xl 
      0091E9 AB 41            [ 1]  176 		add a,#'A 
      0091EB 81               [ 4]  177 		ret 
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
      0091EC                        195 decompile::
      00116C                        196 	_vars VSIZE
      0091EC 52 04            [ 2]    1     sub sp,#VSIZE 
      0091EE C6 00 0B         [ 1]  197 	ld a,base
      0091F1 6B 01            [ 1]  198 	ld (BASE_SAV,sp),a  
      0091F3 C6 00 24         [ 1]  199 	ld a,tab_width 
      0091F6 6B 02            [ 1]  200 	ld (WIDTH_SAV,sp),a 
      0091F8 17 03            [ 2]  201 	ldw (STR,sp),y   
      0091FA 72 CE 00 05      [ 5]  202 	ldw x,[basicptr] ; line number 
      0091FE 35 0A 00 0B      [ 1]  203 	mov base,#10
      009202 35 05 00 24      [ 1]  204 	mov tab_width,#5
      009206 72 5F 00 0D      [ 1]  205 	clr acc24 
      00920A CF 00 0E         [ 2]  206 	ldw acc16,x
      00920D 4F               [ 1]  207 	clr a ; unsigned conversion 
      00920E CD 98 9F         [ 4]  208 	call itoa  
      009211 CD 91 8A         [ 4]  209 	call right_align 
      009214 88               [ 1]  210 	push a 
      009215 90 93            [ 1]  211 1$:	ldw y,x ; source
      009217 1E 04            [ 2]  212 	ldw x,(STR+1,sp) ; destination
      009219 CD 93 EC         [ 4]  213 	call strcpy 
      00921C 90 5F            [ 1]  214 	clrw y 
      00921E 84               [ 1]  215 	pop a 
      00921F 90 97            [ 1]  216 	ld yl,a 
      009221 72 F9 03         [ 2]  217 	addw y,(STR,sp)
      009224 A6 20            [ 1]  218 	ld a,#SPACE 
      009226 90 F7            [ 1]  219 	ld (y),a 
      009228 90 5C            [ 1]  220 	incw y 
      00922A 72 5F 00 24      [ 1]  221 	clr tab_width
      00922E AE 00 03         [ 2]  222 	ldw x,#3
      009231 CF 00 01         [ 2]  223 	ldw in.w,x 
      009234                        224 decomp_loop:
      009234 90 89            [ 2]  225 	pushw y
      009236 CD 98 1A         [ 4]  226 	call next_token 
      009239 90 85            [ 2]  227 	popw y 
      00923B 4D               [ 1]  228 	tnz a  
      00923C 26 03            [ 1]  229 	jrne 1$
      00923E CC 93 61         [ 2]  230 	jp 20$
      009241 2B 03            [ 1]  231 1$:	jrmi 2$
      009243 CC 92 D2         [ 2]  232 	jp 6$
      009246                        233 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      009246 A1 85            [ 1]  234 	cp a,#TK_VAR 
      009248 26 0F            [ 1]  235 	jrne 3$
                                    236 ;; TK_VAR 
      00924A CD 91 74         [ 4]  237 	call add_space
      00924D CD 98 42         [ 4]  238 	call get_addr   
      009250 CD 91 E2         [ 4]  239 	call var_name
      009253 90 F7            [ 1]  240 	ld (y),a 
      009255 90 5C            [ 1]  241 	incw y  
      009257 20 DB            [ 2]  242 	jra decomp_loop
      009259                        243 3$:
      009259 A1 84            [ 1]  244 	cp a,#TK_INTGR
      00925B 26 26            [ 1]  245 	jrne 4$
                                    246 ;; TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00925D CD 98 4C         [ 4]  247 	call get_int24 
      009260 C7 00 0D         [ 1]  248 	ld acc24,a 
      009263 CF 00 0E         [ 2]  249 	ldw acc16,x 
      009266 CD 91 74         [ 4]  250 	call add_space
      009269 90 89            [ 2]  251 	pushw y 
      00926B A6 FF            [ 1]  252 	ld a,#255 ; signed conversion 
      00926D CD 98 9F         [ 4]  253 	call itoa  
      009270 16 01            [ 2]  254 	ldw y,(1,sp) 
      009272 88               [ 1]  255 	push a 
      009273 51               [ 1]  256 	exgw x,y 
      009274 CD 93 EC         [ 4]  257 	call strcpy 
      009277 90 5F            [ 1]  258 	clrw y
      009279 84               [ 1]  259 	pop a  
      00927A 90 97            [ 1]  260 	ld yl,a 
      00927C 72 F9 01         [ 2]  261 	addw y,(1,sp)
      0011FF                        262 	_drop 2 
      00927F 5B 02            [ 2]    1     addw sp,#2 
      009281 20 B1            [ 2]  263 	jra decomp_loop
      009283                        264 4$: ; dictionary keyword
      009283 A1 87            [ 1]  265 	cp a,#TK_NOT 
      009285 24 39            [ 1]  266 	jruge 50$ 
      009287 FE               [ 2]  267 	ldw x,(x)
      009288 72 5C 00 02      [ 1]  268 	inc in 
      00928C 72 5C 00 02      [ 1]  269 	inc in 
      009290 A3 A1 BE         [ 2]  270 	cpw x,#remark 
      009293 26 23            [ 1]  271 	jrne 5$
      009295 CE 00 05         [ 2]  272 	ldw x,basicptr 
                                    273 ; copy comment to buffer 
      009298 CD 91 74         [ 4]  274 	call add_space
      00929B A6 27            [ 1]  275 	ld a,#''
      00929D 90 F7            [ 1]  276 	ld (y),a 
      00929F 90 5C            [ 1]  277 	incw y 
      0092A1                        278 46$:
      0092A1 72 D6 00 01      [ 4]  279 	ld a,([in.w],x)
      0092A5 72 5C 00 02      [ 1]  280 	inc in  
      0092A9 90 F7            [ 1]  281 	ld (y),a 
      0092AB 90 5C            [ 1]  282 	incw y 
      0092AD C6 00 02         [ 1]  283 	ld a,in 
      0092B0 C1 00 04         [ 1]  284 	cp a,count 
      0092B3 2B EC            [ 1]  285 	jrmi 46$
      0092B5 CC 93 61         [ 2]  286 	jp 20$  
      0092B8 A3 9C FE         [ 2]  287 5$: cpw x,#let  
      0092BB 26 05            [ 1]  288 	jrne 54$
      0092BD CC 92 34         [ 2]  289 	jp decomp_loop ; down display LET
      0092C0                        290 50$:
      0092C0 5F               [ 1]  291 	clrw x 
      0092C1 97               [ 1]  292 	ld xl,a 
                                    293 ;	sub a,#TK_NOT  
                                    294 ;	sll a 
                                    295 ;	ld xl,a 
                                    296 ;	addw x,#NOT_IDX
      0092C2                        297 54$: ; insert command name 
      0092C2 CD 91 74         [ 4]  298 	call add_space  
      0092C5 90 89            [ 2]  299 	pushw y
      0092C7 CD 93 9C         [ 4]  300 	call cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      0092CA 90 85            [ 2]  301 	popw y 
      0092CC CD 91 5C         [ 4]  302 	call cpy_cmd_name
      0092CF CC 92 34         [ 2]  303 	jp decomp_loop 
      0092D2                        304 6$:
                                    305 ; label?
      0092D2 A1 03            [ 1]  306 	cp a,#TK_LABEL 
      0092D4 26 1E            [ 1]  307 	jrne 64$
                                    308 ; copy label string to output buffer   	
      0092D6 A6 20            [ 1]  309 	ld a,#32 
      0092D8 90 F7            [ 1]  310 	ld (y),a 
      0092DA 90 5C            [ 1]  311 	incw y 
      0092DC                        312 61$:
      0092DC 89               [ 2]  313 	pushw x 
      0092DD CD 98 33         [ 4]  314 	call skip_string 
      0092E0 85               [ 2]  315 	popw x 
      0092E1                        316 62$:	
      0092E1 F6               [ 1]  317 	ld a,(x)
      0092E2 27 07            [ 1]  318 	jreq 63$ 
      0092E4 5C               [ 1]  319 	incw x  
      0092E5 90 F7            [ 1]  320 	ld (y),a 
      0092E7 90 5C            [ 1]  321 	incw y 
      0092E9 20 F6            [ 2]  322 	jra 62$ 
      0092EB                        323 63$: 
      0092EB A6 20            [ 1]  324 	ld a,#32 
      0092ED 90 F7            [ 1]  325 	ld (y),a 
      0092EF 90 5C            [ 1]  326 	incw y 
      0092F1 CC 92 34         [ 2]  327 	jp decomp_loop
      0092F4                        328 64$:
      0092F4 A1 02            [ 1]  329 	cp a,#TK_QSTR 
      0092F6 26 09            [ 1]  330 	jrne 7$
                                    331 ;; TK_QSTR
      0092F8 CD 91 74         [ 4]  332 	call add_space
      0092FB CD 91 9C         [ 4]  333 	call cpy_quote  
      0092FE CC 92 34         [ 2]  334 	jp decomp_loop
      009301                        335 7$:
      009301 A1 04            [ 1]  336 	cp a,#TK_CHAR 
      009303 26 10            [ 1]  337 	jrne 8$
                                    338 ;; TK_CHAR
      009305 CD 91 74         [ 4]  339 	call add_space 
      009308 A6 5C            [ 1]  340 	ld a,#'\ 
      00930A 90 F7            [ 1]  341 	ld (y),a 
      00930C 90 5C            [ 1]  342 	incw y
      00930E F6               [ 1]  343 	ld a,(x)
      00930F 72 5C 00 02      [ 1]  344 	inc in  
      009313 20 06            [ 2]  345 	jra 81$
      009315 A1 0A            [ 1]  346 8$: cp a,#TK_COLON 
      009317 26 09            [ 1]  347 	jrne 9$
      009319 A6 3A            [ 1]  348 	ld a,#':
      00931B                        349 81$:
      00931B 90 F7            [ 1]  350 	ld (y),a 
      00931D 90 5C            [ 1]  351 	incw y 
      00931F                        352 82$:
      00931F CC 92 34         [ 2]  353 	jp decomp_loop
      009322                        354 9$: 
      009322 A1 09            [ 1]  355 	cp a,#TK_SHARP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009324 22 0A            [ 1]  356 	jrugt 10$ 
      009326 A0 05            [ 1]  357 	sub a,#TK_ARRAY 
      009328 5F               [ 1]  358 	clrw x 
      009329 97               [ 1]  359 	ld xl,a
      00932A 1C 93 77         [ 2]  360 	addw x,#single_char 
      00932D F6               [ 1]  361 	ld a,(x)
      00932E 20 EB            [ 2]  362 	jra 81$ 
      009330                        363 10$: 
      009330 A1 11            [ 1]  364 	cp a,#TK_MINUS 
      009332 22 0A            [ 1]  365 	jrugt 11$
      009334 A0 10            [ 1]  366 	sub a,#TK_PLUS 
      009336 5F               [ 1]  367 	clrw x 
      009337 97               [ 1]  368 	ld xl,a 
      009338 1C 93 7C         [ 2]  369 	addw x,#add_char 
      00933B F6               [ 1]  370 	ld a,(x)
      00933C 20 DD            [ 2]  371 	jra 81$
      00933E                        372 11$:
      00933E A1 22            [ 1]  373     cp a,#TK_MOD 
      009340 22 0A            [ 1]  374 	jrugt 12$
      009342 A0 20            [ 1]  375 	sub a,#TK_MULT
      009344 5F               [ 1]  376 	clrw x 
      009345 97               [ 1]  377 	ld xl,a 
      009346 1C 93 7E         [ 2]  378 	addw x,#mul_char
      009349 F6               [ 1]  379 	ld a,(x)
      00934A 20 CF            [ 2]  380 	jra 81$
      00934C                        381 12$:
      00934C A0 31            [ 1]  382 	sub a,#TK_GT  
      00934E 48               [ 1]  383 	sll a 
      00934F 5F               [ 1]  384 	clrw x 
      009350 97               [ 1]  385 	ld xl,a 
      009351 1C 93 81         [ 2]  386 	addw x,#relop_str 
      009354 FE               [ 2]  387 	ldw x,(x)
      009355 F6               [ 1]  388 	ld a,(x)
      009356 5C               [ 1]  389 	incw x 
      009357 90 F7            [ 1]  390 	ld (y),a
      009359 90 5C            [ 1]  391 	incw y 
      00935B F6               [ 1]  392 	ld a,(x)
      00935C 26 BD            [ 1]  393 	jrne 81$
      00935E CC 92 34         [ 2]  394 	jp decomp_loop 
      009361                        395 20$: 
      009361 90 7F            [ 1]  396 	clr (y)
      009363 1E 03            [ 2]  397 	ldw x,(STR,sp)
      009365 7B 01            [ 1]  398 	ld a,(BASE_SAV,sp)
      009367 C7 00 0B         [ 1]  399 	ld base,a 
      00936A 7B 02            [ 1]  400 	ld a,(WIDTH_SAV,sp)
      00936C C7 00 24         [ 1]  401 	ld tab_width,a
      00936F 72 F2 03         [ 2]  402 	subw y,(STR,sp) 
      009372 90 9F            [ 1]  403 	ld a,yl 
      0012F4                        404 	_drop VSIZE 
      009374 5B 04            [ 2]    1     addw sp,#VSIZE 
      009376 81               [ 4]  405 	ret 
                                    406 
      009377 40 28 29 2C 23         407 single_char: .byte '@','(',')',',','#'
      00937C 2B 2D                  408 add_char: .byte '+','-'
      00937E 2A 2F 25               409 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009381 93 8D 93 8F 93 91 93   410 relop_str: .word gt,equal,ge,lt,ne,le 
             94 93 99 93 96
      00938D 3E 00                  411 gt: .asciz ">"
      00938F 3D 00                  412 equal: .asciz "="
      009391 3E 3D 00               413 ge: .asciz ">="
      009394 3C 00                  414 lt: .asciz "<"
      009396 3C 3D 00               415 le: .asciz "<="
      009399 3C 3E 00               416 ne:  .asciz "<>"
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
      00939C                        429 cmd_name:
      00131C                        430 	_vars VSIZE 
      00939C 52 04            [ 2]    1     sub sp,#VSIZE 
      00939E 72 5F 00 0E      [ 1]  431 	clr acc16 
      0093A2 1F 01            [ 2]  432 	ldw (CODE_ADDR,sp),x  
      0093A4 AE B4 9D         [ 2]  433 	ldw x,#kword_dict	
      0093A7 1F 03            [ 2]  434 1$:	ldw (LINK,sp),x
      0093A9 E6 02            [ 1]  435 	ld a,(2,x)
      0093AB A4 0F            [ 1]  436 	and a,#15 
      0093AD C7 00 0F         [ 1]  437 	ld acc8,a 
      0093B0 1C 00 03         [ 2]  438 	addw x,#3
      0093B3 72 BB 00 0E      [ 2]  439 	addw x,acc16
      0093B7 FE               [ 2]  440 	ldw x,(x) ; code address   
      0093B8 13 01            [ 2]  441 	cpw x,(CODE_ADDR,sp)
      0093BA 27 0C            [ 1]  442 	jreq 2$
      0093BC 1E 03            [ 2]  443 	ldw x,(LINK,sp)
      0093BE FE               [ 2]  444 	ldw x,(x) 
      0093BF 1D 00 02         [ 2]  445 	subw x,#2  
      0093C2 26 E3            [ 1]  446 	jrne 1$
      0093C4 4F               [ 1]  447 	clr a 
      0093C5 5F               [ 1]  448 	clrw x 
      0093C6 20 05            [ 2]  449 	jra 9$
      0093C8 1E 03            [ 2]  450 2$: ldw x,(LINK,sp)
      0093CA 1C 00 02         [ 2]  451 	addw x,#2 	
      00134D                        452 9$:	_drop VSIZE
      0093CD 5B 04            [ 2]    1     addw sp,#VSIZE 
      0093CF 81               [ 4]  453 	ret
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
      0093D0                        118 strlen::
      0093D0 89               [ 2]  119 	pushw x 
      0093D1 4F               [ 1]  120 	clr a
      0093D2 7D               [ 1]  121 1$:	tnz (x) 
      0093D3 27 04            [ 1]  122 	jreq 9$ 
      0093D5 4C               [ 1]  123 	inc a 
      0093D6 5C               [ 1]  124 	incw x 
      0093D7 20 F9            [ 2]  125 	jra 1$ 
      0093D9 85               [ 2]  126 9$:	popw x 
      0093DA 81               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      0093DB                        137 strcmp:
      0093DB F6               [ 1]  138 	ld a,(x)
      0093DC 27 0B            [ 1]  139 	jreq 5$ 
      0093DE 90 F1            [ 1]  140 	cp a,(y) 
      0093E0 26 05            [ 1]  141 	jrne 4$ 
      0093E2 5C               [ 1]  142 	incw x 
      0093E3 90 5C            [ 1]  143 	incw y 
      0093E5 20 F4            [ 2]  144 	jra strcmp 
      0093E7                        145 4$: ; not same  
      0093E7 4F               [ 1]  146 	clr a 
      0093E8 81               [ 4]  147 	ret 
      0093E9                        148 5$: ; same 
      0093E9 A6 01            [ 1]  149 	ld a,#1 
      0093EB 81               [ 4]  150 	ret 
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



      0093EC                        161 strcpy::
      0093EC 88               [ 1]  162 	push a 
      0093ED 89               [ 2]  163 	pushw x 
      0093EE 90 F6            [ 1]  164 1$: ld a,(y)
      0093F0 27 06            [ 1]  165 	jreq 9$ 
      0093F2 F7               [ 1]  166 	ld (x),a 
      0093F3 5C               [ 1]  167 	incw x 
      0093F4 90 5C            [ 1]  168 	incw y 
      0093F6 20 F6            [ 2]  169 	jra 1$ 
      0093F8 7F               [ 1]  170 9$:	clr (x)
      0093F9 85               [ 2]  171 	popw x 
      0093FA 84               [ 1]  172 	pop a 
      0093FB 81               [ 4]  173 	ret 
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
      0093FC                        187 move::
      0093FC 88               [ 1]  188 	push a 
      00137D                        189 	_vars VSIZE 
      0093FD 52 02            [ 2]    1     sub sp,#VSIZE 
      0093FF 0F 01            [ 1]  190 	clr (INCR,sp)
      009401 0F 02            [ 1]  191 	clr (LB,sp)
      009403 90 89            [ 2]  192 	pushw y 
      009405 13 01            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      009407 90 85            [ 2]  194 	popw y 
      009409 27 31            [ 1]  195 	jreq move_exit ; x==y 
      00940B 2B 0E            [ 1]  196 	jrmi move_down
      00940D                        197 move_up: ; start from top address with incr=-1
      00940D 72 BB 00 0E      [ 2]  198 	addw x,acc16
      009411 72 B9 00 0E      [ 2]  199 	addw y,acc16
      009415 03 01            [ 1]  200 	cpl (INCR,sp)
      009417 03 02            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      009419 20 05            [ 2]  202 	jra move_loop  
      00941B                        203 move_down: ; start from bottom address with incr=1 
      00941B 5A               [ 2]  204     decw x 
      00941C 90 5A            [ 2]  205 	decw y
      00941E 0C 02            [ 1]  206 	inc (LB,sp) ; incr=1 
      009420                        207 move_loop:	
      009420 C6 00 0E         [ 1]  208     ld a, acc16 
      009423 CA 00 0F         [ 1]  209 	or a, acc8
      009426 27 14            [ 1]  210 	jreq move_exit 
      009428 72 FB 01         [ 2]  211 	addw x,(INCR,sp)
      00942B 72 F9 01         [ 2]  212 	addw y,(INCR,sp) 
      00942E 90 F6            [ 1]  213 	ld a,(y)
      009430 F7               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      009431 89               [ 2]  215 	pushw x 
      009432 CE 00 0E         [ 2]  216 	ldw x,acc16 
      009435 5A               [ 2]  217 	decw x 
      009436 CF 00 0E         [ 2]  218 	ldw acc16,x 
      009439 85               [ 2]  219 	popw x 
      00943A 20 E4            [ 2]  220 	jra move_loop
      00943C                        221 move_exit:
      0013BC                        222 	_drop VSIZE
      00943C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00943E 84               [ 1]  223 	pop a 
      00943F 81               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      009440                        233 clear_vars:
      009440 89               [ 2]  234 	pushw x 
      009441 88               [ 1]  235 	push a  
      009442 AE 00 35         [ 2]  236 	ldw x,#vars 
      009445 A6 4E            [ 1]  237 	ld a,#CELL_SIZE*26 
      009447 7F               [ 1]  238 1$:	clr (x)
      009448 5C               [ 1]  239 	incw x 
      009449 4A               [ 1]  240 	dec a 
      00944A 26 FB            [ 1]  241 	jrne 1$
      00944C 84               [ 1]  242 	pop a 
      00944D 85               [ 2]  243 	popw x 
      00944E 81               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      00944F 0A 0A 54 69 6E 79 20   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      009495                        255 system_information:
      009495 AE 94 4F         [ 2]  256 	ldw x,#software 
      009498 CD 89 B2         [ 4]  257 	call puts 
      00949B A6 02            [ 1]  258 	ld a,#MAJOR 
      00949D C7 00 0F         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0094A0 5F               [ 1]  260 	clrw x 
      0094A1 CF 00 0D         [ 2]  261 	ldw acc24,x
      0094A4 72 5F 00 24      [ 1]  262 	clr tab_width  
      0094A8 35 0A 00 0B      [ 1]  263 	mov base, #10 
      0094AC CD 98 79         [ 4]  264 	call prt_acc24 
      0094AF A6 2E            [ 1]  265 	ld a,#'.
      0094B1 CD 89 55         [ 4]  266 	call putc 
      0094B4 A6 00            [ 1]  267 	ld a,#MINOR 
      0094B6 C7 00 0F         [ 1]  268 	ld acc8,a 
      0094B9 5F               [ 1]  269 	clrw x 
      0094BA CF 00 0D         [ 2]  270 	ldw acc24,x 
      0094BD CD 98 79         [ 4]  271 	call prt_acc24
      0094C0 A6 0D            [ 1]  272 	ld a,#CR 
      0094C2 CD 89 55         [ 4]  273 	call putc
                                    274 ;call test 
      0094C5 81               [ 4]  275 	ret
                                    276 
      0094C6                        277 warm_init:
      0094C6 90 AE 17 73      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      0094CA 72 5F 00 23      [ 1]  279 	clr flags 
      0094CE 72 5F 00 20      [ 1]  280 	clr loop_depth 
      0094D2 35 04 00 24      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      0094D6 35 0A 00 0B      [ 1]  282 	mov base,#10 
      0094DA AE 00 00         [ 2]  283 	ldw x,#0 
      0094DD CF 00 05         [ 2]  284 	ldw basicptr,x 
      0094E0 CF 00 01         [ 2]  285 	ldw in.w,x 
      0094E3 72 5F 00 04      [ 1]  286 	clr count
      0094E7 81               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      0094E8                        293 clear_basic:
      0094E8 89               [ 2]  294 	pushw x 
      0094E9 72 5F 00 04      [ 1]  295 	clr count
      0094ED 72 5F 00 02      [ 1]  296 	clr in  
      0094F1 AE 00 90         [ 2]  297 	ldw x,#free_ram 
      0094F4 CF 00 1C         [ 2]  298 	ldw txtbgn,x 
      0094F7 CF 00 1E         [ 2]  299 	ldw txtend,x 
      0094FA CF 00 31         [ 2]  300 	ldw dvar_bgn,x 
      0094FD CF 00 33         [ 2]  301 	ldw dvar_end,x 
      009500 CD 94 40         [ 4]  302 	call clear_vars 
      009503 85               [ 2]  303 	popw x
      009504 81               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      009505                        309 err_msg:
      009505 00 00 95 29 95 36 95   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             44 95 5D 95 6C
      009511 95 82 95 98 95 B2 95   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             C3 95 D4
      00951B 95 E0 96 13 96 23 96   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal  37-Bits]



             B7 15 CA
      009523 96 4A 96 57            313 	.word err_overflow,err_read_only  
                                    314 
      009527 96 61 4D 65 6D 6F 72   315 err_mem_full: .asciz "Memory full\n" 
             79 20 66 75 6C 6C
      009534 0A 00 73 79 6E 74 61   316 err_syntax: .asciz "syntax error\n" 
             78 20 65 72 72 6F 72
      009542 0A 00 6D 61 74 68 20   317 err_math_ovf: .asciz "math operation overflow\n"
             6F 70 65 72 61 74 69
             6F 6E 20 6F 76 65 72
             66 6C 6F 77
      00955B 0A 00 64 69 76 69 73   318 err_div0: .asciz "division by 0\n" 
             69 6F 6E 20 62 79 20
             30
      00956A 0A 00 69 6E 76 61 6C   319 err_no_line: .asciz "invalid line number.\n"
             69 64 20 6C 69 6E 65
             20 6E 75 6D 62 65 72
             2E
      009580 0A 00 72 75 6E 20 74   320 err_run_only: .asciz "run time only usage.\n" 
             69 6D 65 20 6F 6E 6C
             79 20 75 73 61 67 65
             2E
      009596 0A 00 63 6F 6D 6D 61   321 err_cmd_only: .asciz "command line only usage.\n"
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20 75
             73 61 67 65 2E
      0095B0 0A 00 64 75 70 6C 69   322 err_duplicate: .asciz "duplicate name.\n"
             63 61 74 65 20 6E 61
             6D 65 2E
      0095C1 0A 00 46 69 6C 65 20   323 err_not_file: .asciz "File not found.\n"
             6E 6F 74 20 66 6F 75
             6E 64 2E
      0095D2 0A 00 62 61 64 20 76   324 err_bad_value: .asciz "bad value.\n"
             61 6C 75 65 2E
      0095DE 0A 00 46 69 6C 65 20   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20 74 68 65 72
             65 2E
      009611 0A 00 4E 6F 20 64 61   326 err_no_data: .asciz "No data found.\n"
             74 61 20 66 6F 75 6E
             64 2E
      009621 0A 00 4E 6F 20 70 72   327 err_no_prog: .asciz "No program in RAM!\n"
             6F 67 72 61 6D 20 69
             6E 20 52 41 4D 21
      009635 0A 00 46 69 6C 65 20   328 err_no_fspace: .asciz "File system full.\n" 
             73 79 73 74 65 6D 20
             66 75 6C 6C 2E
      009648 0A 00 42 75 66 66 65   329 err_buf_full: .asciz "Buffer full\n"
             72 20 66 75 6C 6C
      009655 0A 00 6F 76 65 72 66   330 err_overflow: .asciz "overflow\n" 
             6C 6F 77
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00965F 0A 00 63 6F 6E 73 74   331 err_read_only: .asciz "constant can't be modified\n"
             61 6E 74 20 63 61 6E
             27 74 20 62 65 20 6D
             6F 64 69 66 69 65 64
                                    332 
      00967B 0A 00 0A 72 75 6E 20   333 rt_msg: .asciz "\nrun time error, "
             74 69 6D 65 20 65 72
             72 6F 72 2C
      00968D 20 00 0A 63 6F 6D 70   334 comp_msg: .asciz "\ncompile error, "
             69 6C 65 20 65 72 72
             6F 72 2C
      00969E 20 00 6C 61 73 74 20   335 tk_id: .asciz "last token id: "
             74 6F 6B 65 6E 20 69
             64 3A
                                    336 
      001630                        337 syntax_error::
      0096AE 20 00            [ 1]  338 	ld a,#ERR_SYNTAX 
                                    339 
      0096B0                        340 tb_error::
      0096B0 A6 02 00 22 4C   [ 2]  341 	btjt flags,#FCOMP,1$
      0096B2 88               [ 1]  342 	push a 
      0096B2 72 0A 00         [ 2]  343 	ldw x, #rt_msg 
      0096B5 23 4C 88         [ 4]  344 	call puts 
      0096B8 AE               [ 1]  345 	pop a 
      0096B9 96 7D CD         [ 2]  346 	ldw x, #err_msg 
      0096BC 89 B2 84 AE      [ 1]  347 	clr acc16 
      0096C0 95               [ 1]  348 	sll a
      0096C1 05 72 5F 00      [ 1]  349 	rlc acc16  
      0096C5 0E 48 72         [ 1]  350 	ld acc8, a 
      0096C8 59 00 0E C7      [ 2]  351 	addw x,acc16 
      0096CC 00               [ 2]  352 	ldw x,(x)
      0096CD 0F 72 BB         [ 4]  353 	call puts
      0096D0 00 0E FE         [ 2]  354 	ldw x,basicptr 
                           000001   355 .if DEBUG 
      0096D3 CD 89 B2         [ 1]  356 ld a,count 
      0096D6 CE 00            [ 1]  357 clrw y 
      0096D8 05 C6            [ 1]  358 rlwa y  
      0096DA 00 04 90         [ 4]  359 call hex_dump
      0096DD 5F 90 02         [ 2]  360 ldw x,basicptr
                                    361 .endif 
      0096E0 CD 86 B1         [ 1]  362 	ld a,in 
      0096E3 CE 00 05         [ 4]  363 	call prt_basic_line
      0096E6 C6 00 02         [ 2]  364 	ldw x,#tk_id 
      0096E9 CD A0 52         [ 4]  365 	call puts 
      0096EC AE 96 A0         [ 1]  366 	ld a,in.saved 
      0096EF CD               [ 1]  367 	clrw x 
      0096F0 89               [ 1]  368 	ld xl,a 
      0096F1 B2 C6 00 03      [ 2]  369 	addw x,basicptr 
      0096F5 5F               [ 1]  370 	ld a,(x)
      0096F6 97               [ 1]  371 	clrw x 
      0096F7 72               [ 1]  372 	ld xl,a 
      0096F8 BB 00 05         [ 4]  373 	call prt_i16
      0096FB F6 5F            [ 2]  374 	jra 6$
      001683                        375 1$:	
      0096FD 97               [ 1]  376 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0096FE CD 98 62         [ 2]  377 	ldw x,#comp_msg
      009701 20 35 32         [ 4]  378 	call puts 
      009703 84               [ 1]  379 	pop a 
      009703 88 AE 96         [ 2]  380 	ldw x, #err_msg 
      009706 8F CD 89 B2      [ 1]  381 	clr acc16 
      00970A 84               [ 1]  382 	sll a
      00970B AE 95 05 72      [ 1]  383 	rlc acc16  
      00970F 5F 00 0E         [ 1]  384 	ld acc8, a 
      009712 48 72 59 00      [ 2]  385 	addw x,acc16 
      009716 0E               [ 2]  386 	ldw x,(x)
      009717 C7 00 0F         [ 4]  387 	call puts
      00971A 72 BB 00         [ 2]  388 	ldw x,#tib
      00971D 0E FE CD         [ 4]  389 	call puts 
      009720 89 B2            [ 1]  390 	ld a,#CR 
      009722 AE 16 90         [ 4]  391 	call putc
      009725 CD 89 B2         [ 2]  392 	ldw x,in.w
      009728 A6 0D CD         [ 4]  393 	call spaces
      00972B 89 55            [ 1]  394 	ld a,#'^
      00972D CE 00 01         [ 4]  395 	call putc 
      009730 CD 8A 1F         [ 2]  396 6$: ldw x,#STACK_EMPTY 
      009733 A6               [ 1]  397     ldw sp,x
                                    398 
      0016BC                        399 warm_start:
      009734 5E CD 89         [ 4]  400 	call warm_init
                                    401 ;----------------------------
                                    402 ;   BASIC interpreter
                                    403 ;----------------------------
      0016BF                        404 cmd_line: ; user interface 
      009737 55 AE            [ 1]  405 	ld a,#CR 
      009739 17 FF 94         [ 4]  406 	call putc 
      00973C A6 3E            [ 1]  407 	ld a,#'> 
      00973C CD 94 C6         [ 4]  408 	call putc
      00973F CD 0A 37         [ 4]  409 	call readln
      00973F A6 0D CD 89      [ 1]  410 	tnz count 
      009743 55 A6            [ 1]  411 	jreq cmd_line
      009745 3E CD 89         [ 4]  412 	call compile
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
      009748 55 CD 8A B7      [ 1]  426 	tnz count 
      00974C 72 5D            [ 1]  427 	jreq cmd_line
                                    428 	
                                    429 ; if direct command 
                                    430 ; it's ready to interpret 
                                    431 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



                                    432 ;; This is the interpreter loop
                                    433 ;; for each BASIC code line. 
                                    434 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016DB                        435 interpreter: 
      00974E 00 04 27         [ 1]  436 	ld a,in 
      009751 ED CD 90         [ 1]  437 	cp a,count 
      009754 E0 72            [ 1]  438 	jrmi interp_loop
      0016E3                        439 next_line:
      009756 5D 00 04 27 E4   [ 2]  440 	btjf flags, #FRUN, cmd_line
      00975B CE 00 04         [ 2]  441 	ldw x,basicptr
      00975B C6 00 02 C1      [ 2]  442 	addw x,in.w 
      00975F 00 04 2B         [ 2]  443 	cpw x,txtend 
      009762 1D C8            [ 1]  444 	jrpl warm_start
      009763 CF 00 04         [ 2]  445 	ldw basicptr,x ; start of next line  
      009763 72 01            [ 1]  446 	ld a,(2,x)
      009765 00 23 D7         [ 1]  447 	ld count,a 
      009768 CE 00 05 72      [ 1]  448 	mov in,#3 ; skip first 3 bytes of line 
      001700                        449 interp_loop:
      00976C BB 00 01         [ 4]  450 	call next_token
      001703                        451 _dbg_prt_regs
                           000001     1 	.if DEBUG 
      00976F C3 00 1E         [ 4]    2 		call print_registers  
                                      3 	.endif 
      001706                        452 _dbg_cmd_itf 
                           000001     1 	.if DEBUG 
      009772 2A C8 CF         [ 4]    2 		call cmd_itf 
                                      3 	.endif 
      009775 00 05            [ 1]  453 	cp a,#TK_NONE 
      009777 E6 02            [ 1]  454 	jreq next_line 
      009779 C7 00            [ 1]  455 	cp a,#TK_CMD
      00977B 04 35            [ 1]  456 	jrne 1$
      001711                        457 	_get_code_addr
      00977D 03               [ 2]    1         ldw x,(x)
      00977E 00 02 00 01      [ 1]    2         inc in 
      009780 72 5C 00 01      [ 1]    3         inc in 
      009780 CD               [ 4]  458 	call(x)
      009781 98 1A            [ 2]  459 	jra interp_loop 
      00171D                        460 1$:	 
      009783 CD 84            [ 1]  461 	cp a,#TK_VAR
      009785 94 CD            [ 1]  462 	jrne 2$
      009787 85 6A A1         [ 4]  463 	call let_var  
      00978A 00 27            [ 2]  464 	jra interp_loop 
      001726                        465 2$:	
      00978C D6 A1            [ 1]  466 	cp a,#TK_ARRAY 
      00978E 80 26            [ 1]  467 	jrne 3$
      009790 0C FE 72         [ 4]  468 	call let_array 
      009793 5C 00            [ 2]  469 	jra interp_loop
      00172F                        470 3$:	
      009795 02 72            [ 1]  471 	cp a,#TK_LABEL
      009797 5C 00            [ 1]  472 	jrne 4$
      009799 02 FD 20         [ 4]  473 	call let_dvar  
      00979C E3 C8            [ 2]  474 	jra interp_loop 
      00979D                        475 4$: 
      00979D A1 85            [ 1]  476 	cp a,#TK_COLON 
      00979F 26 05            [ 1]  477 	jreq interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0097A1 CD 9D 11         [ 2]  478 5$:	jp syntax_error 
                                    479 
                                    480 
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
      00173F                        491 let_dvar:
      00173F                        492 	_vars VSIZE 
      0097A4 20 DA            [ 2]    1     sub sp,#VSIZE 
      0097A6 1F 01            [ 2]  493 	ldw (VAR_NAME,sp),x
      0097A6 A1 05            [ 1]  494 	clr (REC_LEN,sp) 
      0097A8 26 05 CD         [ 4]  495 	call skip_string 
      0097AB 9D 0C 20         [ 2]  496 	ldw x,basicptr 
      0097AE D1 BB 00 00      [ 2]  497 	addw x,in.w 
      0097AF F6               [ 1]  498 	ld a,(x)
      0097AF A1 03            [ 1]  499 	cp a,#TK_EQUAL 
      0097B1 26 05            [ 1]  500 	jrne 9$ 
                                    501 ; dvar assignment 
      0097B3 CD 97 BF 20      [ 1]  502 	inc in  
      0097B7 C8 1B BF         [ 4]  503 	call condition  
      0097B8 A1 84            [ 1]  504 	cp a,#TK_INTGR 
      0097B8 A1 0A            [ 1]  505 	jreq 1$ 
      0097BA 27 C4 CC         [ 2]  506 0$:	jp syntax_error 
      001762                        507 1$: 
      0097BD 96 B0            [ 2]  508 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      0097BF CD 13 50         [ 4]  509 	call strlen 
      0097BF 52 04            [ 1]  510 	add a,#REC_XTRA_BYTES
      0097C1 1F 01            [ 1]  511 	ld (REC_LEN+1,sp),a 
      0097C3 0F 03 CD         [ 4]  512 	call search_name 
      0097C6 98               [ 2]  513 	tnzw x 
      0097C7 33 CE            [ 1]  514 	jreq 0$ 
      0097C9 00               [ 1]  515 	ld a,(x)
      0097CA 05 72            [ 1]  516 	jrpl 2$
      0097CC BB 00            [ 1]  517 	ld a,#ERR_RD_ONLY 
      0097CE 01 F6 A1         [ 2]  518 	jp tb_error 
      001779                        519 2$:
      0097D1 32 26 43         [ 2]  520 	addw x,(REC_LEN,sp)
      0097D4 72 5C 00         [ 2]  521 	subw x,#CELL_SIZE 
      0097D7 02 CD 9C         [ 2]  522 	ldw ptr16,x
      001782                        523 	_xpop 
      0097DA 3F A1            [ 1]    1     ld a,(y)
      0097DC 84               [ 1]    2     ldw x,y 
      0097DD 27 03            [ 2]    3     ldw x,(1,x)
      0097DF CC 96 B0 03      [ 2]    4     addw y,#CELL_SIZE 
      0097E2 72 C7 00 19      [ 4]  524 	ld [ptr16],a 
      0097E2 1E 01 CD 93      [ 1]  525 	inc ptr8 
      0097E6 D0 AB 05 6B      [ 5]  526 	ldw [ptr16],x 
      001797                        527 9$: _drop VSIZE 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      0097EA 04 CD            [ 2]    1     addw sp,#VSIZE 
      0097EC 9D               [ 4]  528 	ret 
                                    529 
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
      00179A                        540 next_token::
                                    541 ;	clrw x 
      0097ED E7 5D 27         [ 1]  542 	ld a,in 
      0097F0 EE F6 2A         [ 1]  543 	ld in.saved,a ; in case "_unget_token" needed 
                                    544 ; don't replace sub by "cp a,count" 
                                    545 ; if end of line must return with A=0   	
      0097F3 05 A6 11         [ 1]  546 	sub a,count 
      0097F6 CC 96            [ 1]  547 	jreq 9$ ; end of line 
      0017A5                        548 0$: 
      0097F8 B2 00 04         [ 2]  549 	ldw x,basicptr 
      0097F9 72 BB 00 00      [ 2]  550 	addw x,in.w 
      0097F9 72               [ 1]  551 	ld a,(x)
      0097FA FB               [ 1]  552 	incw x
      0097FB 03 1D 00 03      [ 1]  553 	inc in   
      0097FF CF               [ 4]  554 9$: ret 
                                    555 
                                    556 ;-------------------------
                                    557 ;  skip .asciz in BASIC line 
                                    558 ;  name 
                                    559 ;  input:
                                    560 ;     x		* string 
                                    561 ;  output:
                                    562 ;     none 
                                    563 ;-------------------------
      0017B3                        564 skip_string:
      009800 00               [ 1]  565 	ld a,(x)
      009801 1A 90            [ 1]  566 	jreq 1$
      009803 F6               [ 1]  567 	incw x 
      009804 93 EE            [ 2]  568 	jra skip_string 
      009806 01               [ 1]  569 1$: incw x 	
      009807 72 A9 00 03      [ 2]  570 	subw x,basicptr 
      00980B 72 C7 00         [ 2]  571 	ldw in.w,x 
      00980E 1A               [ 4]  572 	ret 
                                    573 
                                    574 ;---------------------
                                    575 ; extract 16 bits  
                                    576 ; address from BASIC
                                    577 ; code 
                                    578 ; input:
                                    579 ;    X    *address
                                    580 ; output:
                                    581 ;    X    address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



                                    582 ;-------------------- 
      0017C2                        583 get_addr:
      00980F 72               [ 2]  584 	ldw x,(x)
      009810 5C 00 1B 72      [ 1]  585 	inc in 
      009814 CF 00 1A 5B      [ 1]  586 	inc in 
      009818 04               [ 4]  587 	ret 
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
      0017CC                        598 get_int24:
      009819 81               [ 1]  599 	ld a,(x)
      00981A EE 01            [ 2]  600 	ldw x,(1,x)
                                    601 ; skip 3 bytes 
      00981A C6 00 02 C7      [ 1]  602 	inc in 
      00981E 00 03 C0 00      [ 1]  603 	inc in 
      009822 04 27 0D 01      [ 1]  604 	inc in 
      009825 81               [ 4]  605 	ret 
                                    606 
                                    607 ;-------------------------
                                    608 ; get character from 
                                    609 ; BASIC code 
                                    610 ; input:
                                    611 ;    X   *char 
                                    612 ; output:
                                    613 ;    A    char 
                                    614 ;-------------------------
      0017DC                        615 get_char:
      009825 CE               [ 1]  616 	ld a,(x)
      009826 00 05 72 BB      [ 1]  617 	inc in  
      00982A 00               [ 4]  618     ret 
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
      0017E2                        630 prt_i16:
      00982B 01 F6 5C 72      [ 1]  631 	clr acc24 
      00982F 5C 00 02         [ 2]  632 	ldw acc16,x 
      009832 81 10            [ 1]  633 	ld a,#16
      009833 C1 00 0A         [ 1]  634 	cp a,base
      009833 F6 27            [ 1]  635 	jreq prt_acc24  
      009835 03 5C 20 FA 5C   [ 2]  636 	btjf acc16,#7,prt_acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      00983A 72 B0 00 05      [ 1]  637 	cpl acc24 ; sign extend 
                                    638 	
                                    639 ;------------------------------------
                                    640 ; print integer in acc24 
                                    641 ; input:
                                    642 ;	acc24 		integer to print 
                                    643 ;	'base' 		numerical base for conversion 
                                    644 ;   'tab_width' field width 
                                    645 ;    A 			signed||unsigned conversion
                                    646 ;  output:
                                    647 ;    A          string length
                                    648 ;------------------------------------
      0017F9                        649 prt_acc24:
      00983E CF 00            [ 1]  650 	ld a,#255  ; signed conversion  
      009840 01 81 1F         [ 4]  651     call itoa  ; conversion entier en  .asciz
      009842 CD 11 0A         [ 4]  652 	call right_align  
      009842 FE               [ 1]  653 	push a 
      009843 72 5C 00         [ 4]  654 	call puts
      009846 02               [ 1]  655 	pop a 
      009847 72               [ 4]  656     ret	
                                    657 
                                    658 ;---------------------------------------
                                    659 ;  print value at xstack top 
                                    660 ;---------------------------------------
      001807                        661 print_top: 
      001807                        662 	_xpop 
      009848 5C 00            [ 1]    1     ld a,(y)
      00984A 02               [ 1]    2     ldw x,y 
      00984B 81 01            [ 2]    3     ldw x,(1,x)
      00984C 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00984C F6 EE 01         [ 1]  663 	ld acc24,a 
      00984F 72 5C 00         [ 2]  664 	ldw acc16,x 
      009852 02 72 5C         [ 4]  665 	call prt_acc24 
      009855 00 02            [ 1]  666 	ld a,#SPACE
      009857 72 5C 00         [ 4]  667 	call putc 
      00985A 02               [ 4]  668 	ret 
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
      00181F                        684 itoa::
      00181F                        685 	_vars VSIZE
      00985B 81 04            [ 2]    1     sub sp,#VSIZE 
      00985C 0F 02            [ 1]  686 	clr (LEN,sp) ; string length  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00985C F6 72            [ 1]  687 	clr (SIGN,sp)    ; sign
      00985E 5C               [ 1]  688 	tnz A
      00985F 00 02            [ 1]  689 	jreq 1$ ; unsigned conversion  
      009861 81 00 0A         [ 1]  690 	ld a,base 
      009862 A1 0A            [ 1]  691 	cp a,#10
      009862 72 5F            [ 1]  692 	jrne 1$
                                    693 	; base 10 string display with negative sign if bit 23==1
      009864 00 0D CF 00 0E   [ 2]  694 	btjf acc24,#7,1$
      009869 A6 10            [ 1]  695 	cpl (SIGN,sp)
      00986B C1 00 0B         [ 4]  696 	call neg_acc24
      001839                        697 1$:
                                    698 ; initialize string pointer 
      00986E 27 09 72         [ 2]  699 	ldw x,#tib 
      009871 0F 00 0E         [ 2]  700 	addw x,#TIB_SIZE
      009874 04               [ 2]  701 	decw x 
      009875 72               [ 1]  702 	clr (x)
      001841                        703 itoa_loop:
      009876 53 00 0D         [ 1]  704     ld a,base
      009879 CD 02 D6         [ 4]  705     call divu24_8 ; acc24/A 
      009879 A6 FF            [ 1]  706     add a,#'0  ; remainder of division
      00987B CD 98            [ 1]  707     cp a,#'9+1
      00987D 9F CD            [ 1]  708     jrmi 2$
      00987F 91 8A            [ 1]  709     add a,#7 
      00184F                        710 2$:	
      009881 88               [ 2]  711 	decw x
      009882 CD               [ 1]  712     ld (x),a
      009883 89 B2            [ 1]  713 	inc (LEN,sp)
                                    714 	; if acc24==0 conversion done
      009885 84 81 0C         [ 1]  715 	ld a,acc24
      009887 CA 00 0D         [ 1]  716 	or a,acc16
      009887 90 F6 93         [ 1]  717 	or a,acc8
      00988A EE 01            [ 1]  718     jrne itoa_loop
                                    719 	;conversion done, next add '$' or '-' as required
      00988C 72 A9 00         [ 1]  720 	ld a,base 
      00988F 03 C7            [ 1]  721 	cp a,#16
      009891 00 0D            [ 1]  722 	jreq 8$
      009893 CF 00            [ 1]  723 	ld a,(SIGN,sp)
      009895 0E CD            [ 1]  724     jreq 10$
      009897 98 79            [ 1]  725     ld a,#'-
      009899 A6 20            [ 2]  726 	jra 9$ 
      00186D                        727 8$:	
      00989B CD 89            [ 1]  728 	ld a,#'$ 
      00989D 55               [ 2]  729 9$: decw x
      00989E 81               [ 1]  730     ld (x),a
      00989F 0C 02            [ 1]  731 	inc (LEN,sp)
      001873                        732 10$:
      00989F 52 04            [ 1]  733 	ld a,(LEN,sp)
      001875                        734 	_drop VSIZE
      0098A1 0F 02            [ 2]    1     addw sp,#VSIZE 
      0098A3 0F               [ 4]  735 	ret
                                    736 
                                    737 ;------------------------------------
                                    738 ; convert alpha to uppercase
                                    739 ; input:
                                    740 ;    a  character to convert
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



                                    741 ; output:
                                    742 ;    a  uppercase character
                                    743 ;------------------------------------
      001878                        744 to_upper::
      0098A4 01 4D            [ 1]  745 	cp a,#'a
      0098A6 27 11            [ 1]  746 	jrpl 1$
      0098A8 C6               [ 4]  747 0$:	ret
      0098A9 00 0B            [ 1]  748 1$: cp a,#'z	
      0098AB A1 0A            [ 1]  749 	jrugt 0$
      0098AD 26 0A            [ 1]  750 	sub a,#32
      0098AF 72               [ 4]  751 	ret
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
      001884                        766 atoi24::
      001884                        767 	_vars VSIZE
      0098B0 0F 00            [ 2]    1     sub sp,#VSIZE 
      0098B2 0D 05            [ 2]  768 	ldw (XTEMP,sp),x 
                                    769 ; conversion made on xstack 
      0098B4 03               [ 1]  770 	clr a 
      0098B5 01               [ 1]  771 	clrw x 
      00188A                        772 	_xpush 
      0098B6 CD 82 8A 03      [ 2]    1     subw y,#CELL_SIZE
      0098B9 90 F7            [ 1]    2     ld (y),a 
      0098B9 AE 16 90         [ 2]    3     ldw (1,y),x 
      0098BC 1C 00            [ 1]  773 	clr (SIGN,sp)
      0098BE 50 5A            [ 1]  774 	ld a,#10
      0098C0 7F 02            [ 1]  775 	ld (BASE,sp),a ; default base decimal
      0098C1 1E 04            [ 2]  776 	ldw x,(XTEMP,sp)
      0098C1 C6               [ 1]  777 	ld a,(x)
      0098C2 00 0B            [ 1]  778 	jreq 9$  ; completed if 0
      0098C4 CD 83            [ 1]  779 	cp a,#'-
      0098C6 56 AB            [ 1]  780 	jrne 1$
      0098C8 30 A1            [ 1]  781 	cpl (SIGN,sp)
      0098CA 3A 2B            [ 2]  782 	jra 2$
      0098CC 02 AB            [ 1]  783 1$: cp a,#'$
      0098CE 07 08            [ 1]  784 	jrne 3$
      0098CF A6 10            [ 1]  785 	ld a,#16
      0098CF 5A F7            [ 1]  786 	ld (BASE,sp),a
      0098D1 0C               [ 1]  787 2$:	incw x
      0098D2 02 C6            [ 2]  788 	ldw (XTEMP,sp),x 
      0098D4 00               [ 1]  789 	ld a,(x)
      0018B2                        790 3$:	; char to digit 
      0098D5 0D CA            [ 1]  791 	cp a,#'a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0098D7 00 0E            [ 1]  792 	jrmi 4$
      0098D9 CA 00            [ 1]  793 	sub a,#32
      0098DB 0F 26            [ 1]  794 4$:	cp a,#'0
      0098DD E3 C6            [ 1]  795 	jrmi 9$
      0098DF 00 0B            [ 1]  796 	sub a,#'0
      0098E1 A1 10            [ 1]  797 	cp a,#10
      0098E3 27 08            [ 1]  798 	jrmi 5$
      0098E5 7B 01            [ 1]  799 	sub a,#7
      0098E7 27 0A            [ 1]  800 	cp a,(BASE,sp)
      0098E9 A6 2D            [ 1]  801 	jrpl 9$
      0098EB 20 02            [ 1]  802 5$:	ld (TEMP,sp),a
      0098ED 7B 02            [ 1]  803 	ld a,(BASE,sp)
      0098ED A6 24 5A         [ 4]  804 	call mulu24_8
      0018CF                        805 	_xpush 
      0098F0 F7 0C 02 03      [ 2]    1     subw y,#CELL_SIZE
      0098F3 90 F7            [ 1]    2     ld (y),a 
      0098F3 7B 02 5B         [ 2]    3     ldw (1,y),x 
      0098F6 04               [ 1]  806 	clrw x 
      0098F7 81 03            [ 1]  807 	ld a,(TEMP,sp)
      0098F8 02               [ 1]  808 	rlwa x 
      0018DC                        809 	_xpush 
      0098F8 A1 61 2A 01      [ 2]    1     subw y,#CELL_SIZE
      0098FC 81 A1            [ 1]    2     ld (y),a 
      0098FE 7A 22 FB         [ 2]    3     ldw (1,y),x 
      009901 A0 20 81         [ 4]  810 	call add24 
      009904 1E 04            [ 2]  811 	ldw x,(XTEMP,sp)
      009904 52 05            [ 2]  812 	jra 2$
      009906 1F 04            [ 1]  813 9$:	tnz (SIGN,sp)
      009908 4F 5F            [ 1]  814     jreq atoi_exit
      00990A 72 A2 00         [ 4]  815     call neg24
      0018F3                        816 atoi_exit:
      0018F3                        817 	_xpop 
      00990D 03 90            [ 1]    1     ld a,(y)
      00990F F7               [ 1]    2     ldw x,y 
      009910 90 EF            [ 2]    3     ldw x,(1,x)
      009912 01 0F 01 A6      [ 2]    4     addw y,#CELL_SIZE 
      009916 0A 6B 02         [ 1]  818 	ld acc24,a 
      009919 1E 04 F6         [ 2]  819 	ldw acc16,x  
      001902                        820 	_drop VSIZE
      00991C 27 4E            [ 2]    1     addw sp,#VSIZE 
      00991E A1               [ 4]  821 	ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    836 ;  X		routine address|TK_OP 
                                    837 ;---------------------------------
                           000001   838 	NLEN=1 ; cmd length 
                           000002   839 	XSAVE=2
                           000004   840 	YSAVE=4
                           000005   841 	VSIZE=5 
      001905                        842 search_dict::
      001905                        843 	_vars VSIZE 
      00991F 2D 26            [ 2]    1     sub sp,#VSIZE 
      009921 04 03            [ 2]  844 	ldw (YSAVE,sp),y 
      001909                        845 search_next:
      009923 01 20            [ 2]  846 	ldw (XSAVE,sp),x 
                                    847 ; get name length in dictionary	
      009925 08               [ 1]  848 	ld a,(x)
      009926 A1 24            [ 1]  849 	and a,#0xf 
      009928 26 08            [ 1]  850 	ld (NLEN,sp),a  
      00992A A6 10            [ 2]  851 	ldw y,(YSAVE,sp) ; name pointer 
      00992C 6B               [ 1]  852 	incw x 
      001913                        853 cp_loop:
      00992D 02 5C            [ 1]  854 	ld a,(y)
      00992F 1F 04            [ 1]  855 	jreq str_match 
      009931 F6 01            [ 1]  856 	tnz (NLEN,sp)
      009932 27 0A            [ 1]  857 	jreq no_match  
      009932 A1               [ 1]  858 	cp a,(x)
      009933 61 2B            [ 1]  859 	jrne no_match 
      009935 02 A0            [ 1]  860 	incw y 
      009937 20               [ 1]  861 	incw x
      009938 A1 30            [ 1]  862 	dec (NLEN,sp)
      00993A 2B 30            [ 2]  863 	jra cp_loop 
      001925                        864 no_match:
      00993C A0 30            [ 2]  865 	ldw x,(XSAVE,sp) 
      00993E A1 0A 2B         [ 2]  866 	subw x,#2 ; move X to link field
      009941 06 A0            [ 1]  867 	push #TK_NONE 
      009943 07               [ 2]  868 	ldw x,(x) ; next word link 
      009944 11               [ 1]  869 	pop a ; TK_NONE 
      009945 02 2A            [ 1]  870 	jreq search_exit  ; not found  
                                    871 ;try next 
      009947 24 6B            [ 2]  872 	jra search_next
      001932                        873 str_match:
      009949 03 7B            [ 2]  874 	ldw x,(XSAVE,sp)
      00994B 02               [ 1]  875 	ld a,(X)
      00994C CD 82            [ 1]  876 	ld (NLEN,sp),a ; needed to test keyword type  
      00994E A7 72            [ 1]  877 	and a,#NLEN_MASK 
                                    878 ; move x to procedure address field 	
      009950 A2               [ 1]  879 	inc a 
      009951 00 03 90         [ 1]  880 	ld acc8,a 
      009954 F7 90 EF 01      [ 1]  881 	clr acc16 
      009958 5F 7B 03 02      [ 2]  882 	addw x,acc16 
      00995C 72               [ 2]  883 	ldw x,(x) ; routine address  
                                    884 ;determine keyword type bits 7:4 
      00995D A2 00            [ 1]  885 	ld a,(NLEN,sp)
      00995F 03 90            [ 1]  886 	and a,#KW_TYPE_MASK 
      009961 F7               [ 1]  887 	swap a 
      009962 90 EF            [ 1]  888 	add a,#128
      00194D                        889 search_exit: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00194D                        890 	_drop VSIZE 
      009964 01 CD            [ 2]    1     addw sp,#VSIZE 
      009966 81               [ 4]  891 	ret 
                                    892 
                                    893 ;---------------------
                                    894 ; check if next token
                                    895 ;  is of expected type 
                                    896 ; input:
                                    897 ;   A 		 expected token attribute
                                    898 ;  ouput:
                                    899 ;   none     if fail call syntax_error 
                                    900 ;--------------------
      001950                        901 expect:
      009967 EB               [ 1]  902 	push a 
      009968 1E 04 20         [ 4]  903 	call next_token 
      00996B C2 0D            [ 1]  904 	cp a,(1,sp)
      00996D 01 27            [ 1]  905 	jreq 1$
      00996F 03 CD 82         [ 2]  906 	jp syntax_error
      009972 70               [ 1]  907 1$: pop a 
      009973 81               [ 4]  908 	ret 
                                    909 
                                    910 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    911 ; parse arguments list 
                                    912 ; between ()
                                    913 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00195D                        914 func_args:
      009973 90 F6            [ 1]  915 	ld a,#TK_LPAREN 
      009975 93 EE 01         [ 4]  916 	call expect 
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
      001962                        932 arg_list:
      009978 72 A9            [ 1]  933 	push #0
      00997A 00 03 C7         [ 4]  934 1$:	call condition 
      00997D 00               [ 1]  935 	tnz a 
      00997E 0D CF            [ 1]  936 	jreq 7$  
      009980 00 0E            [ 1]  937 	inc (1,sp)
      009982 5B 05 81         [ 4]  938 	call next_token 
      009985 A1 08            [ 1]  939 	cp a,#TK_COMMA 
      009985 52 05            [ 1]  940 	jreq 1$ 
      009987 17 04            [ 1]  941 	cp a,#TK_RPAREN
      009989 27 05            [ 1]  942 	jreq 7$
      001977                        943 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      009989 1F 02 F6 A4 0F   [ 1]    1      mov in,in.saved  
      00998E 6B               [ 1]  944 7$:	pop a  
      00998F 01               [ 4]  945 	ret 
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
      00197E                        973 get_array_element:
      009990 16 04 5C         [ 4]  974 	call func_args 
      009993 A1 01            [ 1]  975 	cp a,#1
      009993 90 F6            [ 1]  976 	jreq 1$
      009995 27 1B 0D         [ 2]  977 	jp syntax_error
      001988                        978 1$: _xpop 
      009998 01 27            [ 1]    1     ld a,(y)
      00999A 0A               [ 1]    2     ldw x,y 
      00999B F1 26            [ 2]    3     ldw x,(1,x)
      00999D 07 90 5C 5C      [ 2]    4     addw y,#CELL_SIZE 
                                    979     ; ignore A, index < 65536 in any case 
                                    980 	; check for bounds 
      0099A1 0A 01 20         [ 2]  981 	cpw x,array_size 
      0099A4 EE 05            [ 2]  982 	jrule 3$
                                    983 ; bounds {1..array_size}	
      0099A5 A6 0A            [ 1]  984 2$: ld a,#ERR_BAD_VALUE 
      0099A5 1E 02 1D         [ 2]  985 	jp tb_error 
      0099A8 00               [ 2]  986 3$: tnzw  x
      0099A9 02 4B            [ 1]  987 	jreq 2$ 
      0099AB 00               [ 2]  988 	pushw x 
      0099AC FE               [ 2]  989 	sllw x 
      0099AD 84 27 1D         [ 2]  990 	addw x,(1,sp) ; index*size_of(int24)
      0099B0 20 D7            [ 2]  991 	ldw (1,sp),x  
      0099B2 AE 16 90         [ 2]  992 	ldw x,#tib ; array is below tib 
      0099B2 1E 02 F6         [ 2]  993 	subw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0019AB                        994 	_drop 2   
      0099B5 6B 01            [ 2]    1     addw sp,#2 
      0099B7 A4               [ 4]  995 	ret 
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
      0019AE                       1011 factor:
      0019AE                       1012 	_vars VSIZE 
      0099B8 0F 4C            [ 2]    1     sub sp,#VSIZE 
      0099BA C7 00            [ 1] 1013 	clr (NEG,sp)
      0099BC 0F 72 5F         [ 4] 1014 	call next_token
      0099BF 00               [ 1] 1015 	tnz a 
      0099C0 0E 72            [ 1] 1016 	jrne 1$ 
      0099C2 BB 00 0E         [ 2] 1017 	jp 22$ 
      0099C5 FE 7B            [ 1] 1018 1$:	cp a,#TK_PLUS 
      0099C7 01 A4            [ 1] 1019 	jreq 2$
      0099C9 F0 4E            [ 1] 1020 	cp a,#TK_MINUS 
      0099CB AB 80            [ 1] 1021 	jrne 4$ 
      0099CD 03 01            [ 1] 1022 	cpl (NEG,sp)
      0019C5                       1023 2$:	
      0099CD 5B 05 81         [ 4] 1024 	call next_token
      0099D0                       1025 4$:
      0099D0 88               [ 1] 1026 	tnz a 
      0099D1 CD 98            [ 1] 1027 	jrne 41$ 
      0099D3 1A 11 01         [ 2] 1028 	jp syntax_error  
      0019CE                       1029 41$:	
      0099D6 27 03            [ 1] 1030 	cp a,#TK_IFUNC 
      0099D8 CC 96            [ 1] 1031 	jrne 5$ 
      0019D2                       1032 	_get_code_addr 
      0099DA B0               [ 2]    1         ldw x,(x)
      0099DB 84 81 00 01      [ 1]    2         inc in 
      0099DD 72 5C 00 01      [ 1]    3         inc in 
      0099DD A6               [ 4] 1033 	call (x); result in A:X  
      0099DE 06 CD            [ 2] 1034 	jra 18$ 
      0019DE                       1035 5$:
      0099E0 99 D0            [ 1] 1036 	cp a,#TK_INTGR
      0099E2 26 05            [ 1] 1037 	jrne 6$
      0099E2 4B 00 CD         [ 4] 1038 	call get_int24 ; A:X
      0099E5 9C 3F            [ 2] 1039 	jra 18$
      0019E7                       1040 6$:
      0099E7 4D 27            [ 1] 1041 	cp a,#TK_ARRAY
      0099E9 12 0C            [ 1] 1042 	jrne 7$
      0099EB 01 CD 98         [ 4] 1043 	call get_array_element
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0099EE 1A A1            [ 2] 1044     jra 71$
      0019F0                       1045 7$:
      0099F0 08 27            [ 1] 1046 	cp a,#TK_VAR 
      0099F2 F1 A1            [ 1] 1047 	jrne 8$
      0099F4 07 27 05         [ 4] 1048 	call get_addr 
      0019F7                       1049 71$: ; put value in A:X
      0099F7 55               [ 1] 1050 	ld a,(x)
      0099F8 00 03            [ 2] 1051 	ldw x,(1,x)
      0099FA 00 02            [ 2] 1052 	jra 18$
      0019FC                       1053 8$:
      0099FC 84 81            [ 1] 1054 	cp a,#TK_LABEL 
      0099FE 26 1D            [ 1] 1055 	jrne 9$
      0099FE CD 99            [ 2] 1056 	pushw y  
      009A00 DD               [ 2] 1057 	pushw x 
      009A01 A1 01 27         [ 4] 1058 	call skip_string
      009A04 03               [ 2] 1059 	popw x  
      009A05 CC 96 B0         [ 4] 1060 	call strlen 
      009A08 90 F6            [ 1] 1061 	add a,#REC_XTRA_BYTES
      009A0A 93 EE 01         [ 4] 1062 	call search_name
      009A0D 72               [ 2] 1063 	tnzw x 
      009A0E A9 00            [ 1] 1064 	jrne 82$ 
      009A10 03 C3            [ 2] 1065 	popw y 
      009A12 00 21            [ 2] 1066 	jra 16$
      001A16                       1067 82$:
      009A14 23 05            [ 2] 1068 	popw y   
      009A16 A6 0A CC         [ 4] 1069 	call get_value ; in A:X 
      009A19 96 B2            [ 2] 1070 	jra 18$
      001A1D                       1071 9$: 
      009A1B 5D 27            [ 1] 1072 	cp a,#TK_CFUNC 
      009A1D F8 89            [ 1] 1073 	jrne 12$
      001A21                       1074 	_get_code_addr 
      009A1F 58               [ 2]    1         ldw x,(x)
      009A20 72 FB 01 1F      [ 1]    2         inc in 
      009A24 01 AE 16 90      [ 1]    3         inc in 
      009A28 72               [ 4] 1075 	call(x)
      009A29 F0               [ 1] 1076 	clrw x 
      009A2A 01               [ 1] 1077 	rlwa x  ; char>int24 in A:X 
      009A2B 5B 02            [ 2] 1078 	jra 18$ 	 
      001A2F                       1079 12$:			
      009A2D 81 06            [ 1] 1080 	cp a,#TK_LPAREN
      009A2E 26 13            [ 1] 1081 	jrne 16$
      009A2E 52 01 0F         [ 4] 1082 	call expression
      009A31 01 CD            [ 1] 1083 	ld a,#TK_RPAREN 
      009A33 98 1A 4D         [ 4] 1084 	call expect
      001A3B                       1085 	_xpop 
      009A36 26 03            [ 1]    1     ld a,(y)
      009A38 CC               [ 1]    2     ldw x,y 
      009A39 9A E0            [ 2]    3     ldw x,(1,x)
      009A3B A1 10 27 06      [ 2]    4     addw y,#CELL_SIZE 
      009A3F A1 11            [ 2] 1086 	jra 18$	
      001A46                       1087 16$:
      001A46                       1088 	_unget_token 
      009A41 26 05 03 01 01   [ 1]    1      mov in,in.saved  
      009A45 4F               [ 1] 1089 	clr a 
      009A45 CD 98            [ 2] 1090 	jra 22$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      001A4E                       1091 18$: 
      009A47 1A 01            [ 1] 1092 	tnz (NEG,sp)
      009A48 27 03            [ 1] 1093 	jreq 20$
      009A48 4D 26 03         [ 4] 1094 	call neg_ax   
      001A55                       1095 20$:
      001A55                       1096 	_xpush 
      009A4B CC 96 B0 03      [ 2]    1     subw y,#CELL_SIZE
      009A4E 90 F7            [ 1]    2     ld (y),a 
      009A4E A1 81 26         [ 2]    3     ldw (1,y),x 
      009A51 0C FE            [ 1] 1097 	ld a,#TK_INTGR
      001A60                       1098 22$:
      001A60                       1099 	_drop VSIZE
      009A53 72 5C            [ 2]    1     addw sp,#VSIZE 
      009A55 00               [ 4] 1100 	ret
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
      001A63                       1111 term:
      001A63                       1112 	_vars VSIZE
      009A56 02 72            [ 2]    1     sub sp,#VSIZE 
                                   1113 ; first factor 	
      009A58 5C 00 02         [ 4] 1114 	call factor
      009A5B FD               [ 1] 1115 	tnz a 
      009A5C 20 70            [ 1] 1116 	jreq term_exit  
      009A5E                       1117 term01:	 ; check for  operator '*'|'/'|'%' 
      009A5E A1 84 26         [ 4] 1118 	call next_token
      009A61 05 CD            [ 1] 1119 	ld (MULOP,sp),a
      009A63 98 4C            [ 1] 1120 	and a,#TK_GRP_MASK
      009A65 20 67            [ 1] 1121 	cp a,#TK_GRP_MULT
      009A67 27 09            [ 1] 1122 	jreq 1$
      009A67 A1 05            [ 1] 1123 	ld a,#TK_INTGR
      001A78                       1124 	_unget_token 
      009A69 26 05 CD 99 FE   [ 1]    1      mov in,in.saved  
      009A6E 20 07            [ 2] 1125 	jra term_exit 
      009A70                       1126 1$:	; got *|/|%
                                   1127 ;second factor
      009A70 A1 85 26         [ 4] 1128 	call factor
      009A73 08               [ 1] 1129 	tnz a 
      009A74 CD 98            [ 1] 1130 	jrne 2$ 
      009A76 42 16 30         [ 2] 1131 	jp syntax_error 
      009A77                       1132 2$: ; select operation 	
      009A77 F6 EE            [ 1] 1133 	ld a,(MULOP,sp) 
      009A79 01 20            [ 1] 1134 	cp a,#TK_MULT 
      009A7B 52 05            [ 1] 1135 	jrne 3$
                                   1136 ; '*' operator
      009A7C CD 02 66         [ 4] 1137 	call mul24 
      009A7C A1 03            [ 2] 1138 	jra term01
      009A7E 26 1D            [ 1] 1139 3$: cp a,#TK_DIV 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      009A80 90 89            [ 1] 1140 	jrne 4$ 
                                   1141 ; '/' operator	
      009A82 89 CD 98         [ 4] 1142 	call div24 
      009A85 33 85            [ 2] 1143 	jra term01 
      001A9C                       1144 4$: ; '%' operator
      009A87 CD 93 D0         [ 4] 1145 	call mod24
      009A8A AB 05            [ 2] 1146 	jra term01 
      001AA1                       1147 9$: 
      009A8C CD 9D            [ 1] 1148 	ld a,#TK_INTGR
      001AA3                       1149 term_exit:
      001AA3                       1150 	_drop VSIZE 
      009A8E E7 5D            [ 2]    1     addw sp,#VSIZE 
      009A90 26               [ 4] 1151 	ret 
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
      001AA6                       1162 expression:
      001AA6                       1163 	_vars VSIZE 
      009A91 04 90            [ 2]    1     sub sp,#VSIZE 
                                   1164 ; first term 	
      009A93 85 20 30         [ 4] 1165 	call term
      009A96 4D               [ 1] 1166 	tnz a 
      009A96 90 85            [ 1] 1167 	jreq 9$
      001AAE                       1168 1$:	; operator '+'|'-'
      009A98 CD 9D 41         [ 4] 1169 	call next_token
      009A9B 20 31            [ 1] 1170 	ld (OP,sp),a 
      009A9D A4 30            [ 1] 1171 	and a,#TK_GRP_MASK
      009A9D A1 82            [ 1] 1172 	cp a,#TK_GRP_ADD 
      009A9F 26 0E            [ 1] 1173 	jreq 2$ 
      001AB9                       1174 	_unget_token 
      009AA1 FE 72 5C 00 02   [ 1]    1      mov in,in.saved  
      009AA6 72 5C            [ 1] 1175 	ld a,#TK_INTGR
      009AA8 00 02            [ 2] 1176 	jra 9$ 
      001AC2                       1177 2$: ; second term 
      009AAA FD 5F 02         [ 4] 1178 	call term
      009AAD 20               [ 1] 1179 	tnz a 
      009AAE 1F 03            [ 1] 1180 	jrne 3$
      009AAF CC 16 30         [ 2] 1181 	jp syntax_error
      001ACB                       1182 3$:
      009AAF A1 06            [ 1] 1183 	ld a,(OP,sp)
      009AB1 26 13            [ 1] 1184 	cp a,#TK_PLUS 
      009AB3 CD 9B            [ 1] 1185 	jrne 4$
                                   1186 ; '+' operator	
      009AB5 26 A6 07         [ 4] 1187 	call add24
      009AB8 CD 99            [ 2] 1188 	jra 1$ 
      001AD6                       1189 4$:	; '-' operator 
      009ABA D0 90 F6         [ 4] 1190 	call sub24
      009ABD 93 EE            [ 2] 1191 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      001ADB                       1192 9$:
      001ADB                       1193 	_drop VSIZE 
      009ABF 01 72            [ 2]    1     addw sp,#VSIZE 
      009AC1 A9               [ 4] 1194 	ret 
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
      001ADE                       1205 relation: 
      001ADE                       1206 	_vars VSIZE
      009AC2 00 03            [ 2]    1     sub sp,#VSIZE 
      009AC4 20 08 A6         [ 4] 1207 	call expression
      009AC6 4D               [ 1] 1208 	tnz a 
      009AC6 55 00            [ 1] 1209 	jreq 9$ 
                                   1210 ; expect rel_op or leave 
      009AC8 03 00 02         [ 4] 1211 	call next_token 
      009ACB 4F 20            [ 1] 1212 	ld (RELOP,sp),a 
      009ACD 12 30            [ 1] 1213 	and a,#TK_GRP_MASK
      009ACE A1 30            [ 1] 1214 	cp a,#TK_GRP_RELOP 
      009ACE 0D 01            [ 1] 1215 	jreq 2$
      009AD0 27 03            [ 1] 1216 	ld a,#TK_INTGR 
      001AF3                       1217 	_unget_token 
      009AD2 CD 82 82 00 01   [ 1]    1      mov in,in.saved  
      009AD5 20 40            [ 2] 1218 	jra 9$ 
      001AFA                       1219 2$:	; expect another expression
      009AD5 72 A2 00         [ 4] 1220 	call expression
      009AD8 03               [ 1] 1221 	tnz a 
      009AD9 90 F7            [ 1] 1222 	jrne 3$
      009ADB 90 EF 01         [ 2] 1223 	jp syntax_error 
      001B03                       1224 3$: 
      009ADE A6 84 A5         [ 4] 1225 	call cp24 
      009AE0                       1226 	_xpop  
      009AE0 5B 01            [ 1]    1     ld a,(y)
      009AE2 81               [ 1]    2     ldw x,y 
      009AE3 EE 01            [ 2]    3     ldw x,(1,x)
      009AE3 52 01 CD 9A      [ 2]    4     addw y,#CELL_SIZE 
      009AE7 2E               [ 1] 1227 	tnz a 
      009AE8 4D 27            [ 1] 1228 	jrmi 4$
      009AEA 38 0C            [ 1] 1229 	jrne 5$
      009AEB 35 02 00 0E      [ 1] 1230 	mov acc8,#2 ; i1==i2
      009AEB CD 98            [ 2] 1231 	jra 6$ 
      001B1A                       1232 4$: ; i1<i2
      009AED 1A 6B 01 A4      [ 1] 1233 	mov acc8,#4 
      009AF1 30 A1            [ 2] 1234 	jra 6$
      001B20                       1235 5$: ; i1>i2
      009AF3 20 27 09 A6      [ 1] 1236 	mov acc8,#1  
      001B24                       1237 6$: ; 0=false, -1=true 
      009AF7 84               [ 1] 1238 	clrw x 
      009AF8 55 00 03         [ 1] 1239 	ld a, acc8  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009AFB 00 02            [ 1] 1240 	and a,(RELOP,sp)
      009AFD 20 24            [ 1] 1241 	jreq 7$
      009AFF 53               [ 2] 1242 	cplw x 
      009AFF CD 9A            [ 1] 1243 	ld a,#255 
      001B2F                       1244 7$:	_xpush 
      009B01 2E 4D 26 03      [ 2]    1     subw y,#CELL_SIZE
      009B05 CC 96            [ 1]    2     ld (y),a 
      009B07 B0 EF 01         [ 2]    3     ldw (1,y),x 
      009B08 A6 84            [ 1] 1245 	ld a,#TK_INTGR
      001B3A                       1246 9$: 
      001B3A                       1247 	_drop VSIZE
      009B08 7B 01            [ 2]    1     addw sp,#VSIZE 
      009B0A A1               [ 4] 1248 	ret 
                                   1249 
                                   1250 ;-------------------------------------------
                                   1251 ;  AND factor:  [NOT] relation | (condition)
                                   1252 ;  output:
                                   1253 ;     A      TK_INTGR|0
                                   1254 ;-------------------------------------------
                           000001  1255 	NOT_OP=1
      001B3D                       1256 and_factor:
      009B0B 20 26            [ 1] 1257 	push #0 
      009B0D 05 CD 82         [ 4] 1258 0$:	call next_token  
      009B10 E6               [ 1] 1259 	tnz a 
      009B11 20 D8            [ 1] 1260 	jreq 8$ 
      009B13 A1 21            [ 1] 1261 	cp a,#TK_NOT 
      009B15 26 05            [ 1] 1262 	jrne 1$ 
      009B17 CD 83            [ 1] 1263 	cpl (NOT_OP,sp)
      009B19 74 20            [ 2] 1264 	jra 0$ 
      001B4D                       1265 1$:	
      009B1B CF 06            [ 1] 1266 	cp a,#TK_LPAREN 
      009B1C 26 0A            [ 1] 1267 	jrne 2$
      009B1C CD 84 0E         [ 4] 1268 	call condition
      009B1F 20 CA            [ 1] 1269 	ld a,#TK_RPAREN 
      009B21 CD 19 50         [ 4] 1270 	call expect
      009B21 A6 84            [ 2] 1271 	jra 3$
      009B23                       1272 2$: _unget_token 
      009B23 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009B26 CD 1A DE         [ 4] 1273 	call relation
      001B63                       1274 3$:
      009B26 52 01            [ 1] 1275 	tnz (NOT_OP,sp)
      009B28 CD 9A            [ 1] 1276 	jreq 8$ 
      009B2A E3 4D 27         [ 4] 1277 	call cpl24
      001B6A                       1278 8$:
      001B6A                       1279 	_drop 1  
      009B2D 2D 01            [ 2]    1     addw sp,#1 
      009B2E 81               [ 4] 1280     ret 
                                   1281 
                                   1282 
                                   1283 ;--------------------------------------------
                                   1284 ;  AND operator as priority over OR||XOR 
                                   1285 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1286 ;          
                                   1287 ;  output:
                                   1288 ;     A     TK_INTGR|0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   1289 ;    xtack   value 
                                   1290 ;--------------------------------------------
      001B6D                       1291 and_cond:
      009B2E CD 98 1A         [ 4] 1292 	call and_factor
      009B31 6B               [ 1] 1293 	tnz a 
      009B32 01 A4            [ 1] 1294 	jreq 9$  
      009B34 30 A1 10         [ 4] 1295 1$: call next_token 
      009B37 27               [ 1] 1296 	tnz a 
      009B38 09 55            [ 1] 1297 	jreq 6$ 
      009B3A 00 03            [ 1] 1298 	cp a,#TK_AND 
      009B3C 00 02            [ 1] 1299 	jreq 3$
      001B7D                       1300 	_unget_token 
      009B3E A6 84 20 19 01   [ 1]    1      mov in,in.saved  
      009B42 20 38            [ 2] 1301 	jra 6$ 
      009B42 CD 9A E3         [ 4] 1302 3$:	call and_factor  
      009B45 4D               [ 1] 1303 	tnz a 
      009B46 26 03            [ 1] 1304 	jrne 4$
      009B48 CC 96 B0         [ 2] 1305 	jp syntax_error 
      009B4B                       1306 4$:	
      001B8D                       1307 	_xpop 
      009B4B 7B 01            [ 1]    1     ld a,(y)
      009B4D A1               [ 1]    2     ldw x,y 
      009B4E 10 26            [ 2]    3     ldw x,(1,x)
      009B50 05 CD 81 EB      [ 2]    4     addw y,#CELL_SIZE 
      009B54 20 D8 0C         [ 1] 1308 	ld acc24,a 
      009B56 CF 00 0D         [ 2] 1309 	ldw acc16,x
      001B9C                       1310 	_xpop 
      009B56 CD 82            [ 1]    1     ld a,(y)
      009B58 08               [ 1]    2     ldw x,y 
      009B59 20 D3            [ 2]    3     ldw x,(1,x)
      009B5B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B5B 5B 01 81         [ 1] 1311 	and a,acc24 
      009B5E 02               [ 1] 1312 	rlwa x 
      009B5E 52 01 CD         [ 1] 1313 	and a,acc16 
      009B61 9B               [ 1] 1314 	rlwa x 
      009B62 26 4D 27         [ 1] 1315 	and a,acc8 
      009B65 54               [ 1] 1316 	rlwa x
      001BB1                       1317 	_xpush
      009B66 CD 98 1A 6B      [ 2]    1     subw y,#CELL_SIZE
      009B6A 01 A4            [ 1]    2     ld (y),a 
      009B6C 30 A1 30         [ 2]    3     ldw (1,y),x 
      009B6F 27 09            [ 2] 1318 	jra 1$  
      009B71 A6 84            [ 1] 1319 6$: ld a,#TK_INTGR 
      009B73 55               [ 4] 1320 9$:	ret 	 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



                           000002  1332 	OP=2
                           000002  1333 	VSIZE=2 
      001BBF                       1334 condition:
      001BBF                       1335 	_vars VSIZE 
      009B74 00 03            [ 2]    1     sub sp,#VSIZE 
      009B76 00 02 20         [ 4] 1336 	call and_cond
      009B79 40               [ 1] 1337 	tnz a 
      009B7A 27 69            [ 1] 1338 	jreq 9$ 
      009B7A CD 9B 26         [ 4] 1339 1$:	call next_token 
      009B7D 4D 26            [ 1] 1340 	cp a,#TK_OR 
      009B7F 03 CC            [ 1] 1341 	jreq 2$
      009B81 96 B0            [ 1] 1342 	cp a,#TK_XOR
      009B83 27 07            [ 1] 1343 	jreq 2$ 
      001BD2                       1344 	_unget_token 
      009B83 CD 82 25 90 F6   [ 1]    1      mov in,in.saved  
      009B88 93 EE            [ 2] 1345 	jra 8$ 
      009B8A 01 72            [ 1] 1346 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009B8C A9 00 03         [ 4] 1347 	call and_cond
      009B8F 4D 2B            [ 1] 1348 	cp a,#TK_INTGR 
      009B91 08 26            [ 1] 1349 	jreq 3$
      009B93 0C 35 02         [ 2] 1350 	jp syntax_error 
      001BE5                       1351 3$:	 
      001BE5                       1352 	_xpop  ; rigth arg 
      009B96 00 0F            [ 1]    1     ld a,(y)
      009B98 20               [ 1]    2     ldw x,y 
      009B99 0A 01            [ 2]    3     ldw x,(1,x)
      009B9A 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B9A 35 04 00         [ 1] 1353 	ld acc24,a 
      009B9D 0F 20 04         [ 2] 1354 	ldw acc16,x 
      009BA0                       1355 	_xpop  ; left arg  
      009BA0 35 01            [ 1]    1     ld a,(y)
      009BA2 00               [ 1]    2     ldw x,y 
      009BA3 0F 01            [ 2]    3     ldw x,(1,x)
      009BA4 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009BA4 5F C6            [ 1] 1356 	ld (ATMP,sp),a 
      009BA6 00 0F            [ 1] 1357 	ld a,(OP,sp)
      009BA8 14 01            [ 1] 1358 	cp a,#TK_XOR 
      009BAA 27 03            [ 1] 1359 	jreq 5$ 
      001C05                       1360 4$: ; A:X OR acc24   
      009BAC 53 A6            [ 1] 1361 	ld a,(ATMP,sp)
      009BAE FF 72 A2         [ 1] 1362 	or a,acc24 
      009BB1 00               [ 1] 1363 	rlwa x 
      009BB2 03 90 F7         [ 1] 1364 	or a,acc16 
      009BB5 90               [ 1] 1365 	rlwa x 
      009BB6 EF 01 A6         [ 1] 1366 	or a,acc8 
      009BB9 84               [ 1] 1367 	rlwa x 
      009BBA 20 0E            [ 2] 1368 	jra 6$  
      001C15                       1369 5$: ; A:X XOR acc24 
      009BBA 5B 01            [ 1] 1370 	ld a,(ATMP,sp)
      009BBC 81 00 0C         [ 1] 1371 	xor a,acc24 
      009BBD 02               [ 1] 1372 	rlwa x 
      009BBD 4B 00 CD         [ 1] 1373 	xor a,acc16 
      009BC0 98               [ 1] 1374 	rlwa x 
      009BC1 1A 4D 27         [ 1] 1375 	xor a,acc8 
      009BC4 25               [ 1] 1376 	rlwa x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      001C23                       1377 6$: _xpush
      009BC5 A1 87 26 04      [ 2]    1     subw y,#CELL_SIZE
      009BC9 03 01            [ 1]    2     ld (y),a 
      009BCB 20 F2 01         [ 2]    3     ldw (1,y),x 
      009BCD 20 99            [ 2] 1378 	jra 1$ 
      009BCD A1 06            [ 1] 1379 8$:	ld a,#TK_INTGR 
      001C30                       1380 9$:	_drop VSIZE 
      009BCF 26 0A            [ 2]    1     addw sp,#VSIZE 
      009BD1 CD               [ 4] 1381 	ret 
                                   1382 
                                   1383 
                                   1384 ;--------------------------------------------
                                   1385 ; BASIC: HEX 
                                   1386 ; select hexadecimal base for integer print
                                   1387 ;---------------------------------------------
      001C33                       1388 hex_base:
      009BD2 9C 3F A6 07      [ 1] 1389 	mov base,#16 
      009BD6 CD               [ 4] 1390 	ret 
                                   1391 
                                   1392 ;--------------------------------------------
                                   1393 ; BASIC: DEC 
                                   1394 ; select decimal base for integer print
                                   1395 ;---------------------------------------------
      001C38                       1396 dec_base:
      009BD7 99 D0 20 08      [ 1] 1397 	mov base,#10
      009BDB 55               [ 4] 1398 	ret 
                                   1399 
                                   1400 ;------------------------
                                   1401 ; BASIC: FREE 
                                   1402 ; return free size in RAM 
                                   1403 ; output:
                                   1404 ;   A:x		size 
                                   1405 ;--------------------------
      001C3D                       1406 free:
      009BDC 00               [ 1] 1407 	clr a 
      009BDD 03 00 02         [ 2] 1408 	ldw x,#tib 
      009BE0 CD 9B 5E 32      [ 2] 1409 	subw x,dvar_end 
      009BE3 81               [ 4] 1410 	ret 
                                   1411 
                                   1412 ;------------------------------
                                   1413 ; BASIC: SIZE 
                                   1414 ; command that print 
                                   1415 ; program start addres and size 
                                   1416 ;------------------------------
      001C46                       1417 cmd_size:
      009BE3 0D 01 27         [ 1] 1418 	push base 
      009BE6 03 CD 82         [ 2] 1419 	ldw x,#PROG_ADDR 
      009BE9 67 09 32         [ 4] 1420 	call puts 
      009BEA CE 00 1B         [ 2] 1421 	ldw x,txtbgn     
      009BEA 5B 01 81 0A      [ 1] 1422 	mov base,#16 
      009BED CD 17 E2         [ 4] 1423 	call prt_i16
      009BED CD 9B BD         [ 1] 1424 	pop base 
      009BF0 4D 27 4B         [ 2] 1425 	ldw x,#PROG_SIZE 
      009BF3 CD 98 1A         [ 4] 1426 	call puts 
      009BF6 4D 27 43         [ 2] 1427 	ldw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009BF9 A1 88 27 07      [ 2] 1428 	subw x,txtbgn 
      009BFD 55 00 03         [ 4] 1429 	call prt_i16
      009C00 00 02 20         [ 2] 1430 	ldw x,#STR_BYTES 
      009C03 38 CD 9B         [ 4] 1431 	call puts  
      009C06 BD               [ 4] 1432 	ret 
                                   1433 
                                   1434 
                                   1435 ;------------------------
                                   1436 ; BASIC: UBOUND  
                                   1437 ; return array variable size 
                                   1438 ; and set 'array_size' variable 
                                   1439 ; output:
                                   1440 ;   A:X 	array_size
                                   1441 ;--------------------------
      001C73                       1442 ubound:
      009C07 4D 26 03         [ 4] 1443 	call free 
      009C0A CC 96            [ 1] 1444 	ld a,#CELL_SIZE 
      009C0C B0               [ 2] 1445 	div x,a 
      009C0D CF 00 20         [ 2] 1446 	ldw array_size,x
      009C0D 90               [ 1] 1447 	clr a 
      009C0E F6               [ 4] 1448 	ret 
                                   1449 
                                   1450 ;-----------------------------
                                   1451 ; BASIC: LET var=expr 
                                   1452 ; variable assignement 
                                   1453 ; output:
                                   1454 ;   A 		TK_NONE 
                                   1455 ;-----------------------------
      001C7E                       1456 let::
      009C0F 93 EE 01         [ 4] 1457 	call next_token 
      009C12 72 A9            [ 1] 1458 	cp a,#TK_VAR 
      009C14 00 03            [ 1] 1459 	jreq let_var
      009C16 C7 00            [ 1] 1460 	cp a,#TK_ARRAY 
      009C18 0D CF            [ 1] 1461 	jreq  let_array
      009C1A 00 0E 90         [ 2] 1462 	jp syntax_error
      001C8C                       1463 let_array:
      009C1D F6 93 EE         [ 4] 1464 	call get_array_element
      009C20 01 72            [ 2] 1465 	jra let_eval 
      001C91                       1466 let_var:
      009C22 A9 00 03         [ 4] 1467 	call get_addr
      001C94                       1468 let_eval:
      009C25 C4 00 0D         [ 2] 1469 	ldw ptr16,x  ; variable address 
      009C28 02 C4 00         [ 4] 1470 	call next_token 
      009C2B 0E 02            [ 1] 1471 	cp a,#TK_EQUAL
      009C2D C4 00            [ 1] 1472 	jreq 1$
      009C2F 0F 02 72         [ 2] 1473 	jp syntax_error
      001CA1                       1474 1$:	
      009C32 A2 00 03         [ 4] 1475 	call condition   
      009C35 90 F7            [ 1] 1476 	cp a,#TK_INTGR 
      009C37 90 EF            [ 1] 1477 	jreq 2$
      009C39 01 20 B7         [ 2] 1478 	jp syntax_error
      001CAB                       1479 2$:	
      001CAB                       1480 	_xpop ; value 
      009C3C A6 84            [ 1]    1     ld a,(y)
      009C3E 81               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009C3F EE 01            [ 2]    3     ldw x,(1,x)
      009C3F 52 02 CD 9B      [ 2]    4     addw y,#CELL_SIZE 
      001CB4                       1481 3$:
      009C43 ED 4D 27 69      [ 4] 1482 	ld [ptr16],a
      009C47 CD 98 1A A1      [ 1] 1483 	inc ptr8  
      009C4B 89 27 0B A1      [ 5] 1484 	ldw [ptr16],x 
      009C4F 8A               [ 4] 1485 	ret 
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
      001CC1                       1496 get_value: ; -- i 
      009C50 27               [ 1] 1497 	ld a,(x) ; record size 
      009C51 07 55            [ 1] 1498 	and a,#NAME_MAX_LEN
      009C53 00 03            [ 1] 1499 	sub a,#CELL_SIZE ; * value 
      009C55 00               [ 1] 1500 	push a 
      009C56 02 20            [ 1] 1501 	push #0 
      009C58 55 6B 02         [ 2] 1502 	addw x,(1,sp)
      009C5B CD               [ 1] 1503 	ld a,(x)
      009C5C 9B ED            [ 2] 1504 	ldw x,(1,x)
      001CCF                       1505 	_drop 2
      009C5E A1 84            [ 2]    1     addw sp,#2 
      009C60 27               [ 4] 1506 	ret 
                                   1507 
                                   1508 
                                   1509 ;--------------------------
                                   1510 ; list constants in EEPROM 
                                   1511 ; call when using LIST \C 
                                   1512 ;-------------------------
                           000001  1513 	COUNT=1
                           000003  1514 	YTEMP=3
                           000004  1515 	VSIZE=4 
      001CD2                       1516 list_const:
      009C61 03 CC            [ 2] 1517 	pushw y 
      001CD4                       1518 	_vars 4 
      009C63 96 B0            [ 2]    1     sub sp,#4 
      009C65 5F               [ 1] 1519 	clrw x 
      009C65 90 F6            [ 2] 1520 	ldw (COUNT,sp),x  
      009C67 93 EE 01 72      [ 2] 1521 	ldw Y,#EEPROM_BASE 
      009C6B A9 00 03 C7      [ 2] 1522 1$:	cpw y,free_eeprom 
      009C6F 00 0D            [ 1] 1523 	jruge 9$
      009C71 CF 00            [ 2] 1524     ldw (YTEMP,sp),y 
      009C73 0E               [ 1] 1525 	ldw x,y
      009C74 90               [ 1] 1526 	incw x 
      009C75 F6 93 EE         [ 4] 1527 	call puts  
      009C78 01 72            [ 1] 1528 	ld a,#'= 
      009C7A A9 00 03         [ 4] 1529 	call putc 
      009C7D 6B 01            [ 2] 1530 	ldw x,(YTEMP,sp)
      009C7F 7B 02 A1         [ 4] 1531 	call get_value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      009C82 8A 27 10         [ 1] 1532 	ld acc24,a 
      009C85 CF 00 0D         [ 2] 1533 	ldw acc16,x 
      009C85 7B 01 CA         [ 4] 1534 	call prt_acc24
      009C88 00 0D            [ 1] 1535 	ld a,#CR 
      009C8A 02 CA 00         [ 4] 1536 	call putc 
      009C8D 0E 02            [ 2] 1537 	ldw x,(COUNT,sp)
      009C8F CA               [ 1] 1538 	incw x 
      009C90 00 0F            [ 2] 1539 	ldw (COUNT,sp),x 
      009C92 02 20 0E 0D      [ 1] 1540 	clr acc16 
      009C95 16 03            [ 2] 1541 	ldw y,(YTEMP,sp)
      009C95 7B 01            [ 1] 1542 	ld a,(y)
      009C97 C8 00 0D         [ 1] 1543 	ld acc8,a
      009C9A 02 C8 00 0E      [ 2] 1544 	addw y,acc16 
      009C9E 02 C8            [ 2] 1545 	jra 1$ 
      001D18                       1546 9$:	
      009CA0 00 0F            [ 2] 1547 	ldw x,(COUNT,sp)
      009CA2 02 72 A2         [ 4] 1548 	call prt_i16 
      009CA5 00 03 90         [ 2] 1549 	ldw x,#CONST_COUNT 
      009CA8 F7 90 EF         [ 4] 1550 	call puts 
      001D23                       1551 	_drop VSIZE 
      009CAB 01 20            [ 2]    1     addw sp,#VSIZE 
      009CAD 99 A6            [ 2] 1552 	popw y 
      009CAF 84               [ 4] 1553 	ret 
                                   1554 
      009CB0 5B 02 81 6E 73 74 61  1555 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1556 
                                   1557 
                                   1558 ;--------------------------
                                   1559 ; BASIC: EEFREE 
                                   1560 ; eeprom_free 
                                   1561 ; search end of data  
                                   1562 ; in EEPROM 
                                   1563 ; input:
                                   1564 ;    none 
                                   1565 ; output:
                                   1566 ;    A:X     address free
                                   1567 ;-------------------------
      009CB3                       1568 func_eefree:
      009CB3 35 10 00         [ 2] 1569 	ldw x,#EEPROM_BASE 
      009CB6 0B 81 00 0E      [ 1] 1570 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009CB8 A3 47 F8         [ 2] 1571     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009CB8 35 0A            [ 1] 1572 	jruge 8$ ; no free space 
      009CBA 00               [ 1] 1573 2$: ld a,(x)
      009CBB 0B 81            [ 1] 1574 	jrne 3$
      009CBD 5C               [ 1] 1575 	incw x 
      009CBD 4F AE 16 90      [ 1] 1576 	dec acc8 
      009CC1 72 B0            [ 1] 1577 	jrne 2$
      009CC3 00 33 81         [ 2] 1578 	subw x,#8 
      009CC6 20 09            [ 2] 1579 	jra 9$  
      009CC6 3B               [ 1] 1580 3$: ld a,(x)
      009CC7 00               [ 1] 1581 	incw x
      009CC8 0B               [ 1] 1582 	tnz a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009CC9 AE 9F            [ 1] 1583 	jrne 3$
      009CCB 1F               [ 2] 1584 	decw x   
      009CCC CD 89            [ 2] 1585 	jra 1$ 
      009CCE B2               [ 1] 1586 8$: clrw x ; no free space 
      009CCF CE               [ 1] 1587 9$: clr a 
      009CD0 00 1C 35         [ 2] 1588 	ldw free_eeprom,x ; save in system variable 
      009CD3 10               [ 4] 1589 	ret 
                                   1590 
                           000005  1591 REC_XTRA_BYTES=5 
                                   1592 ;--------------------------
                                   1593 ; search constant/dim_var name 
                                   1594 ; format of record  
                                   1595 ;   .byte record length 
                                   1596 ;         = strlen(name)+5 
                                   1597 ;   .asciz name (variable length)
                                   1598 ;   .int24 value (3 bytes )
                                   1599 ; a constant record use 7+ bytes
                                   1600 ; constants are saved in EEPROM  
                                   1601 ; input:
                                   1602 ;    A     record_len 
                                   1603 ;    X     *name
                                   1604 ; output:
                                   1605 ;    X     address|0
                                   1606 ; use:
                                   1607 ;   A,Y, acc16 
                                   1608 ;-------------------------
                           000001  1609 	NAMEPTR=1 ; target name pointer 
                           000003  1610 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1611 	RECLEN=5  ; record length of target
                           000007  1612 	LIMIT=7   ; search area limit 
                           000008  1613 	VSIZE=8  
      001D67                       1614 search_name:
      009CD4 00 0B            [ 2] 1615 	pushw y 
      001D69                       1616 	_vars VSIZE
      009CD6 CD 98            [ 2]    1     sub sp,#VSIZE 
      009CD8 62 32 00 0B      [ 1] 1617 	clr acc16 
      009CDC AE 9F            [ 1] 1618 	ld (RECLEN,sp),a    
      009CDE 31 CD            [ 2] 1619 	ldw (NAMEPTR,sp),x
      009CE0 89 B2 CE         [ 2] 1620 	ldw x,dvar_end 
      009CE3 00 1E            [ 2] 1621 	ldw (LIMIT,sp),x 
      009CE5 72 B0 00 1C      [ 2] 1622 	ldw y,dvar_bgn
      009CE9 CD 98            [ 2] 1623 1$:	ldw (WLKPTR,sp),y
      009CEB 62               [ 1] 1624 	ldw x,y 
      009CEC AE 9F            [ 2] 1625 	cpw x, (LIMIT,sp) 
      009CEE 42 CD            [ 1] 1626 	jruge 7$ ; no match found 
      009CF0 89 B2            [ 1] 1627 	ld a,(y)
      009CF2 81 0F            [ 1] 1628 	and a,#NAME_MAX_LEN
      009CF3 11 05            [ 1] 1629 	cp a,(RECLEN,sp)
      009CF3 CD 9C            [ 1] 1630 	jrne 2$ 
      009CF5 BD A6            [ 1] 1631 	incw y 
      009CF7 03 62            [ 2] 1632 	ldw x,(NAMEPTR,sp)
      009CF9 CF 00 21         [ 4] 1633 	call strcmp
      009CFC 4F 81            [ 1] 1634 	jrne 8$ ; match found 
      009CFE                       1635 2$: ; skip this one 	
      009CFE CD 98            [ 2] 1636 	ldW Y,(WLKPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009D00 1A A1            [ 1] 1637 	ld a,(y)
      009D02 85 27            [ 1] 1638 	and a,#NAME_MAX_LEN 
      009D04 0C A1 05         [ 1] 1639 	ld acc8,a 
      009D07 27 03 CC 96      [ 2] 1640 	addw y,acc16 
      009D0B B0 D9            [ 2] 1641 	jra 1$  
      009D0C                       1642 7$: ; no match found 
      009D0C CD 99            [ 1] 1643 	clr (WLKPTR,sp)
      009D0E FE 20            [ 1] 1644 	clr (WLKPTR+1,sp)
      001DA7                       1645 8$: ; match found 
      009D10 03 03            [ 2] 1646 	ldw x,(WLKPTR,sp) ; record address 
      009D11                       1647 9$:	_DROP VSIZE
      009D11 CD 98            [ 2]    1     addw sp,#VSIZE 
      009D13 42 85            [ 2] 1648 	popw y 
      009D14 81               [ 4] 1649 	 ret 
                                   1650 
                                   1651 ;--------------------------------------------
                                   1652 ; BASIC: CONST name=value [, name=value]*
                                   1653 ; define constant(s) saved in EEPROM
                                   1654 ; share most of his code with cmd_dim 
                                   1655 ;--------------------------------------------
                           000001  1656 	VAR_NAME=1 
                           000003  1657 	REC_LEN=3
                           000005  1658 	RONLY=5
                           000005  1659 	VSIZE=5
      001DAE                       1660 cmd_const:
      009D14 CF 00 1A CD 98   [ 2] 1661 	btjt flags,#FRUN,0$
      009D19 1A A1            [ 1] 1662 	ld a,#ERR_RUN_ONLY
      009D1B 32 27 03         [ 2] 1663 	jp tb_error 
      001DB8                       1664 0$: 
      001DB8                       1665 	_vars VSIZE 
      009D1E CC 96            [ 2]    1     sub sp,#VSIZE 
      009D20 B0 80            [ 1] 1666 	ld a,#128 
      009D21 6B 05            [ 1] 1667 	ld (RONLY,sp),a 
      009D21 CD 9C            [ 1] 1668 	clr (REC_LEN,sp)
      009D23 3F A1            [ 2] 1669 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1670 
                                   1671 ;---------------------------------
                                   1672 ; BASIC: DIM var_name [var_name]* 
                                   1673 ; create named variables at end 
                                   1674 ; of BASIC program. 
                                   1675 ; These variables are initialized 
                                   1676 ; to 0. 
                                   1677 ; record format same ast CONST 
                                   1678 ; but r/w because stored in RAM 
                                   1679 ;---------------------------------
      001DC2                       1680 cmd_dim:
      009D25 84 27 03 CC 96   [ 2] 1681 	btjt flags,#FRUN,cmd_dim1
      009D2A B0 06            [ 1] 1682 	ld a,#ERR_RUN_ONLY
      009D2B CC 16 32         [ 2] 1683 	jp tb_error 
      001DCC                       1684 cmd_dim1:	
      001DCC                       1685 	_vars VSIZE
      009D2B 90 F6            [ 2]    1     sub sp,#VSIZE 
      009D2D 93 EE            [ 1] 1686 	clr (REC_LEN,sp )
      009D2F 01 72            [ 1] 1687 	clr (RONLY,sp)
      001DD2                       1688 cmd_dim2: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009D31 A9 00 03         [ 4] 1689 0$:	call next_token 
      009D34 A1 03            [ 1] 1690 	cp a,#TK_LABEL  
      009D34 72 C7            [ 1] 1691 	jreq 1$ 
      009D36 00 1A 72         [ 2] 1692 	jp syntax_error 
      009D39 5C 00            [ 2] 1693 1$: ldw (VAR_NAME,sp),x ; name pointer 
      009D3B 1B 72 CF         [ 4] 1694 	call strlen
      009D3E 00 1A            [ 1] 1695 	add a,#REC_XTRA_BYTES
      009D40 81 04            [ 1] 1696 	ld (REC_LEN+1,sp),a
      009D41 CD 17 B3         [ 4] 1697 	call skip_string 
      009D41 F6 A4            [ 1] 1698 	ld a,(REC_LEN+1,sp)
      009D43 0F A0            [ 2] 1699 	ldw x,(VAR_NAME,sp) 
      009D45 03 88 4B         [ 4] 1700 	call search_name  
      009D48 00               [ 2] 1701 	tnzw x 
      009D49 72 FB            [ 1] 1702 	jreq 2$
      009D4B 01 F6            [ 1] 1703 	ld a,#ERR_DUPLICATE
      009D4D EE 01 5B         [ 2] 1704 	jp tb_error  
      009D50 02 81 32         [ 2] 1705 2$:	ldw x,dvar_end 
      009D52 7B 04            [ 1] 1706 	ld a,(REC_LEN+1,sp)
      009D52 90 89            [ 1] 1707 	or a,(RONLY,sp)
      009D54 52               [ 1] 1708 	ld (x),a 
      009D55 04               [ 1] 1709 	incw x 
      009D56 5F 1F            [ 2] 1710 	pushw y 
      009D58 01 90            [ 2] 1711 	ldw y,(VAR_NAME+2,sp)
      009D5A AE 40 00         [ 4] 1712 	call strcpy
      009D5D 90 C3            [ 2] 1713 	popw y 
      009D5F 00               [ 2] 1714 	decw x
      009D60 25 24 35         [ 2] 1715 	addw x,(REC_LEN,sp)
      009D63 17 03 93         [ 2] 1716 	ldw dvar_end,x 
      009D66 5C CD 89         [ 2] 1717 	subw x,#CELL_SIZE  
      009D69 B2               [ 1] 1718 	clr (x)
      009D6A A6 3D            [ 1] 1719 	clr (1,x)  
      009D6C CD 89            [ 1] 1720 	clr (2,x)
      009D6E 55 1E 03         [ 4] 1721 4$: call next_token 
      009D71 CD 9D            [ 1] 1722 	cp a,#TK_COMMA 
      009D73 41 C7            [ 1] 1723 	jreq 0$ 
      009D75 00 0D            [ 1] 1724 	cp a,#TK_EQUAL 
      009D77 CF 00            [ 1] 1725 	jrne 8$
                                   1726 ; initialize variable 
      009D79 0E CD 98         [ 4] 1727 	call condition 
      009D7C 79 A6            [ 1] 1728 	cp a,#TK_INTGR
      009D7E 0D CD            [ 1] 1729 	jreq 5$
      009D80 89 55 1E         [ 2] 1730 	jp syntax_error
      009D83 01 5C 1F         [ 2] 1731 5$: ldw x,dvar_end 
      009D86 01 72 5F         [ 2] 1732 	subw x,#CELL_SIZE 
      009D89 00 0E 16         [ 2] 1733 	ldw ptr16,x 
      001E36                       1734 	_xpop 
      009D8C 03 90            [ 1]    1     ld a,(y)
      009D8E F6               [ 1]    2     ldw x,y 
      009D8F C7 00            [ 2]    3     ldw x,(1,x)
      009D91 0F 72 B9 00      [ 2]    4     addw y,#CELL_SIZE 
      009D95 0E 20 C5 19      [ 4] 1735 	ld [ptr16],a 
      009D98 72 5C 00 1A      [ 1] 1736 	inc ptr8 
      009D98 1E 01 CD 98      [ 5] 1737 	ldw [ptr16],x 
      009D9C 62 AE            [ 2] 1738 	jra 4$ 
      001E4D                       1739 8$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      001E4D                       1740 	_unget_token 	
      009D9E 9D A8 CD 89 B2   [ 1]    1      mov in,in.saved  
      001E52                       1741 	_drop VSIZE 
      009DA3 5B 04            [ 2]    1     addw sp,#VSIZE 
      009DA5 90 85 81         [ 4] 1742 	call ubound 
      009DA8 20               [ 4] 1743 	ret 
                                   1744 
                                   1745 
                                   1746 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1747 ; return program size 
                                   1748 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E58                       1749 prog_size:
      009DA9 63 6F 6E         [ 2] 1750 	ldw x,txtend 
      009DAC 73 74 61 6E      [ 2] 1751 	subw x,txtbgn 
      009DB0 74               [ 4] 1752 	ret 
                                   1753 
                                   1754 ;----------------------------
                                   1755 ; print program information 
                                   1756 ;---------------------------
      001E60                       1757 program_info: 
      009DB1 73 20 69         [ 2] 1758 	ldw x,#PROG_ADDR 
      009DB4 6E 20 45         [ 4] 1759 	call puts 
      009DB7 45 50 52         [ 2] 1760 	ldw x,txtbgn 
      009DBA 4F 4D 0A 00      [ 1] 1761 	mov base,#16 
      009DBE CD 17 E2         [ 4] 1762 	call prt_i16
      009DBE AE 40 00 35      [ 1] 1763 	mov base,#10  
      009DC2 08 00 0F         [ 2] 1764 	ldw x,#PROG_SIZE
      009DC5 A3 47 F8         [ 4] 1765 	call puts 
      009DC8 24 17 F6         [ 4] 1766 	call prog_size 
      009DCB 26 0C 5C         [ 4] 1767 	call prt_i16 
      009DCE 72 5A 00         [ 2] 1768 	ldw x,#STR_BYTES 
      009DD1 0F 26 F6         [ 4] 1769 	call puts
      009DD4 1D 00 08         [ 2] 1770 	ldw x,txtbgn
      009DD7 20 09 F6         [ 2] 1771 	cpw x,#app 
      009DDA 5C 4D            [ 1] 1772 	jrult 2$
      009DDC 26 FB 5A         [ 2] 1773 	ldw x,#FLASH_MEM 
      009DDF 20 E0            [ 2] 1774 	jra 3$
      009DE1 5F 4F CF         [ 2] 1775 2$: ldw x,#RAM_MEM 	 
      009DE4 00 25 81         [ 4] 1776 3$:	call puts 
      009DE7 A6 0D            [ 1] 1777 	ld a,#CR 
      009DE7 90 89 52         [ 4] 1778 	call putc
      009DEA 08               [ 4] 1779 	ret 
                                   1780 
      009DEB 72 5F 00 0E 6B 05 1F  1781 PROG_ADDR: .asciz "program address: "
             01 CE 00 33 1F 07 90
             CE 00 31 17
      009DFD 03 93 13 07 24 20 90  1782 PROG_SIZE: .asciz ", program size: "
             F6 A4 0F 11 05 26 09
             90 5C 1E
      009E0E 01 CD 93 DB 26 13 00  1783 STR_BYTES: .asciz " bytes" 
      009E14 20 69 6E 20 46 4C 41  1784 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009E14 16 03 90 F6 A4 0F C7  1785 RAM_MEM:   .asciz " in RAM memory" 
             00 0F 72 B9 00 0E 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal  D9-Bits]



             00
                                   1786 
                                   1787 
                                   1788 ;----------------------------
                                   1789 ; BASIC: LIST [[start][,end]]
                                   1790 ; list program lines 
                                   1791 ; form start to end 
                                   1792 ; if empty argument list then 
                                   1793 ; list all.
                                   1794 ;----------------------------
                           000001  1795 	FIRST=1
                           000003  1796 	LAST=3 
                           000005  1797 	LN_PTR=5
                           000006  1798 	VSIZE=6 
      009E23                       1799 list:
      009E23 0F 03 0F 04 05   [ 2] 1800 	btjf flags,#FRUN,0$
      009E27 A6 07            [ 1] 1801 	ld a,#ERR_CMD_ONLY
      009E27 1E 03 5B         [ 2] 1802 	jp tb_error
      001EF3                       1803 0$:	 
      009E2A 08 90 85         [ 4] 1804 	call next_token 
      009E2D 81 04            [ 1] 1805 	cp a,#TK_CHAR 
      009E2E 26 10            [ 1] 1806 	jrne 2$
      009E2E 72 00 00         [ 4] 1807 	call get_char 
      009E31 23 05            [ 1] 1808 	and a,#0xDF 
      009E33 A6 06            [ 1] 1809 	cp a,#'C 
      009E35 CC 96            [ 1] 1810 	jrne 1$
      009E37 B2 1C D2         [ 4] 1811 	call list_const
      009E38 81               [ 4] 1812 	ret 
      009E38 52 05 A6         [ 2] 1813 1$: jp syntax_error 
      001F0A                       1814 2$:	_unget_token 
      009E3B 80 6B 05 0F 03   [ 1]    1      mov in,in.saved  
      009E40 20 10 58         [ 4] 1815 	call prog_size 
      009E42 22 01            [ 1] 1816 	jrugt 3$
      009E42 72               [ 4] 1817 	ret 
      001F15                       1818 3$: _vars VSIZE
      009E43 00 00            [ 2]    1     sub sp,#VSIZE 
      009E45 23 05 A6         [ 2] 1819 	ldw x,txtbgn 
      009E48 06 CC            [ 2] 1820 	ldw (LN_PTR,sp),x 
      009E4A 96               [ 2] 1821 	ldw x,(x) 
      009E4B B2 01            [ 2] 1822 	ldw (FIRST,sp),x ; list from first line 
      009E4C AE 7F FF         [ 2] 1823 	ldw x,#MAX_LINENO ; biggest line number 
      009E4C 52 05            [ 2] 1824 	ldw (LAST,sp),x 
      009E4E 0F 03 0F         [ 4] 1825 	call arg_list
      009E51 05               [ 1] 1826 	tnz a
      009E52 27 31            [ 1] 1827 	jreq list_loop 
      009E52 CD 98            [ 1] 1828 	cp a,#2 
      009E54 1A A1            [ 1] 1829 	jreq 4$
      009E56 03 27            [ 1] 1830 	cp a,#1 
      009E58 03 CC            [ 1] 1831 	jreq first_line 
      009E5A 96 B0 1F         [ 2] 1832 	jp syntax_error 
      009E5D 01               [ 2] 1833 4$:	popw x 
      009E5E CD 93            [ 2] 1834 	ldw (LAST+2,sp),x 
      001F38                       1835 first_line:
      009E60 D0               [ 2] 1836 	popw x
      009E61 AB 05            [ 2] 1837 	ldw (FIRST,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      001F3B                       1838 lines_skip:
      009E63 6B 04 CD         [ 2] 1839 	ldw x,txtbgn
      009E66 98 33            [ 2] 1840 2$:	ldw (LN_PTR,sp),x 
      009E68 7B 04 1E         [ 2] 1841 	cpw x,txtend 
      009E6B 01 CD            [ 1] 1842 	jrpl list_exit 
      009E6D 9D               [ 2] 1843 	ldw x,(x) ;line# 
      009E6E E7 5D            [ 2] 1844 	cpw x,(FIRST,sp)
      009E70 27 05            [ 1] 1845 	jrpl list_loop 
      009E72 A6 08            [ 2] 1846 	ldw x,(LN_PTR,sp) 
      009E74 CC 96            [ 1] 1847 	ld a,(2,x)
      009E76 B2 CE 00         [ 1] 1848 	ld acc8,a 
      009E79 33 7B 04 1A      [ 1] 1849 	clr acc16 
      009E7D 05 F7 5C 90      [ 2] 1850 	addw x,acc16
      009E81 89 16            [ 2] 1851 	jra 2$ 
                                   1852 ; print loop
      001F5B                       1853 list_loop:
      009E83 03 CD            [ 2] 1854 	ldw x,(LN_PTR,sp)
      009E85 93 EC            [ 1] 1855 	ld a,(2,x) 
      009E87 90 85 5A         [ 4] 1856 	call prt_basic_line
      009E8A 72 FB            [ 2] 1857 	ldw x,(LN_PTR,sp)
      009E8C 03 CF            [ 1] 1858 	ld a,(2,x)
      009E8E 00 33 1D         [ 1] 1859 	ld acc8,a 
      009E91 00 03 7F 6F      [ 1] 1860 	clr acc16 
      009E95 01 6F 02 CD      [ 2] 1861 	addw x,acc16
      009E99 98 1A A1         [ 2] 1862 	cpw x,txtend 
      009E9C 08 27            [ 1] 1863 	jrpl list_exit
      009E9E B3 A1            [ 2] 1864 	ldw (LN_PTR,sp),x
      009EA0 32               [ 2] 1865 	ldw x,(x)
      009EA1 26 2A            [ 2] 1866 	cpw x,(LAST,sp)  
      009EA3 CD 9C            [ 1] 1867 	jrslt list_loop
      001F7D                       1868 list_exit:
      009EA5 3F A1 84 27 03   [ 1] 1869 	mov in,count 
      009EAA CC 96 B0         [ 2] 1870 	ldw x,#pad 
      009EAD CE 00 33         [ 2] 1871 	ldw basicptr,x 
      001F88                       1872 	_drop VSIZE 
      009EB0 1D 00            [ 2]    1     addw sp,#VSIZE 
      009EB2 03 CF 00         [ 4] 1873 	call program_info 
      009EB5 1A               [ 4] 1874 	ret
                                   1875 
                                   1876 
                                   1877 ;--------------------------
                                   1878 ; BASIC: EDIT 
                                   1879 ;  copy program in FLASH 
                                   1880 ;  to RAM for edition 
                                   1881 ;-------------------------
      001F8E                       1882 edit:
      009EB6 90 F6 93         [ 4] 1883 	call qsign 
      009EB9 EE 01            [ 1] 1884 	jreq 1$ 
      009EBB 72 A9 00         [ 2] 1885 	ldw x,#NOT_SAVED 
      009EBE 03 72 C7         [ 4] 1886 	call puts 
      009EC1 00               [ 4] 1887 	ret 
      001F9A                       1888 1$: 
      009EC2 1A 72 5C 00      [ 2] 1889 	ldw y,#app_sign ; source address 
      009EC6 1B 72 CF         [ 2] 1890     ldw x,app_size  
      009EC9 00 1A 20         [ 2] 1891 	addw x,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009ECC CB 00 0D         [ 2] 1892 	ldw acc16,x  ; bytes to copy 
      009ECD AE 00 8C         [ 2] 1893 	ldw x,#rsign ; destination address 
      009ECD 55 00 03         [ 4] 1894 	call move  
      009ED0 00 02 5B         [ 2] 1895 	ldw x,#free_ram 
      009ED3 05 CD 9C         [ 2] 1896 	ldw txtbgn,x 
      009ED6 F3 81 00 8E      [ 2] 1897 	addw x,rsize  
      009ED8 CF 00 1D         [ 2] 1898 	ldw txtend,x 
      009ED8 CE               [ 4] 1899 	ret 
                                   1900 
      009ED9 00 1E 72 B0 00 1C 81  1901 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1902 
                                   1903 
                                   1904 ;--------------------------
                                   1905 ; decompile line from token list
                                   1906 ; and print it. 
                                   1907 ; input:
                                   1908 ;   A       stop at this position 
                                   1909 ;   X 		pointer at line
                                   1910 ; output:
                                   1911 ;   none 
                                   1912 ;--------------------------	
      009EE0                       1913 prt_basic_line:
      009EE0 AE 9F            [ 2] 1914 	pushw y 
      009EE2 1F CD 89         [ 1] 1915 	ld count,a 
      009EE5 B2 CE            [ 1] 1916 	ld a,(2,x)
      009EE7 00 1C 35         [ 1] 1917 	cp a,count 
      009EEA 10 00            [ 1] 1918 	jrpl 1$ 
      009EEC 0B CD 98         [ 1] 1919 	ld count,a 
      009EEF 62 35 0A         [ 2] 1920 1$:	ldw basicptr,x 
      009EF2 00 0B AE 9F      [ 2] 1921 	ldw y,#tib  
      009EF6 31 CD 89         [ 4] 1922 	call decompile 
      009EF9 B2 CD 9E         [ 4] 1923 	call puts 
      009EFC D8 CD            [ 1] 1924 	ld a,#CR 
      009EFE 98 62 AE         [ 4] 1925 	call putc 
      009F01 9F 42            [ 2] 1926 	popw y 
      009F03 CD               [ 4] 1927 	ret 
                                   1928 
                                   1929 
                                   1930 ;---------------------------------
                                   1931 ; BASIC: PRINT|? arg_list 
                                   1932 ; print values from argument list
                                   1933 ;----------------------------------
                           000001  1934 	CCOMMA=1
                           000001  1935 	VSIZE=1
      001FF6                       1936 print:
      001FF6                       1937 	_vars VSIZE 
      009F04 89 B2            [ 2]    1     sub sp,#VSIZE 
      001FF8                       1938 reset_comma:
      009F06 CE 00            [ 1] 1939 	clr (CCOMMA,sp)
      001FFA                       1940 prt_loop:
      009F08 1C A3 B6         [ 4] 1941 	call next_token
      009F0B 84 25            [ 1] 1942 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009F0D 05 AE            [ 1] 1943 	jrult 0$
      009F0F 9F 49            [ 1] 1944 	cp a,#TK_COLON 
      009F11 20 03            [ 1] 1945 	jreq 0$
      009F13 AE 9F            [ 1] 1946 	cp a,#TK_CMD
      009F15 5A CD            [ 1] 1947 	jrne 10$
      002009                       1948 0$:
      002009                       1949 	_unget_token 
      009F17 89 B2 A6 0D CD   [ 1]    1      mov in,in.saved  
      009F1C 89 55            [ 2] 1950 	jra 8$ 
      002010                       1951 10$:	
      009F1E 81 70            [ 1] 1952 	cp a,#TK_QSTR
      009F20 72 6F            [ 1] 1953 	jreq 1$
      009F22 67 72            [ 1] 1954 	cp a,#TK_CHAR 
      009F24 61 6D            [ 1] 1955 	jreq 2$ 
      009F26 20 61            [ 1] 1956 	cp a,#TK_CFUNC 
      009F28 64 64            [ 1] 1957 	jreq 3$
      009F2A 72 65            [ 1] 1958 	cp a,#TK_COMMA 
      009F2C 73 73            [ 1] 1959 	jreq 4$
      009F2E 3A 20            [ 1] 1960 	cp a,#TK_SHARP 
      009F30 00 2C            [ 1] 1961 	jreq 5$
      009F32 20 70            [ 2] 1962 	jra 7$ 
      002026                       1963 1$:	; print string 
      009F34 72 6F 67         [ 4] 1964 	call puts
      009F37 72               [ 1] 1965 	incw x
      009F38 61 6D 20 73      [ 2] 1966 	subw x,basicptr 
      009F3C 69 7A 65         [ 2] 1967 	ldw in.w,x  
      009F3F 3A 20            [ 2] 1968 	jra reset_comma
      002033                       1969 2$:	; print character 
      009F41 00 20 62         [ 4] 1970 	call get_char 
      009F44 79 74 65         [ 4] 1971 	call putc 
      009F47 73 00            [ 2] 1972 	jra reset_comma 
      00203B                       1973 3$: ; print character function value  	
      00203B                       1974 	_get_code_addr 
      009F49 20               [ 2]    1         ldw x,(x)
      009F4A 69 6E 20 46      [ 1]    2         inc in 
      009F4E 4C 41 53 48      [ 1]    3         inc in 
      009F52 20               [ 4] 1975 	call (x)
      009F53 6D 65 6D         [ 4] 1976 	call putc
      009F56 6F 72            [ 2] 1977 	jra reset_comma 
      00204A                       1978 4$: ; set comma state 
      009F58 79 00            [ 1] 1979 	cpl (CCOMMA,sp)
      009F5A 20 69            [ 2] 1980 	jra prt_loop   
      00204E                       1981 5$: ; # character must be followed by an integer   
      009F5C 6E 20 52         [ 4] 1982 	call next_token
      009F5F 41 4D            [ 1] 1983 	cp a,#TK_INTGR 
      009F61 20 6D            [ 1] 1984 	jreq 6$
      009F63 65 6D 6F         [ 2] 1985 	jp syntax_error 
      002058                       1986 6$: ; set tab width
      009F66 72 79 00         [ 4] 1987 	call get_int24 
      009F69 9F               [ 1] 1988 	ld a,xl 
      009F69 72 01            [ 1] 1989 	and a,#15 
      009F6B 00 23 05         [ 1] 1990 	ld tab_width,a 
      009F6E A6 07            [ 2] 1991 	jra reset_comma 
      002063                       1992 7$:	
      002063                       1993 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009F70 CC 96 B2 00 01   [ 1]    1      mov in,in.saved  
      009F73 CD 1B BF         [ 4] 1994 	call condition
      009F73 CD               [ 1] 1995 	tnz a 
      009F74 98 1A            [ 1] 1996 	jreq 8$    
      009F76 A1 04 26         [ 4] 1997     call print_top
      009F79 10 CD            [ 2] 1998 	jra reset_comma 
      002073                       1999 8$:
      009F7B 98 5C            [ 1] 2000 	tnz (CCOMMA,sp)
      009F7D A4 DF            [ 1] 2001 	jrne 9$
      009F7F A1 43            [ 1] 2002 	ld a,#CR 
      009F81 26 04 CD         [ 4] 2003     call putc 
      00207C                       2004 9$:	_drop VSIZE 
      009F84 9D 52            [ 2]    1     addw sp,#VSIZE 
      009F86 81               [ 4] 2005 	ret 
                                   2006 
                                   2007 ;----------------------
                                   2008 ; 'save_context' and
                                   2009 ; 'rest_context' must be 
                                   2010 ; called at the same 
                                   2011 ; call stack depth 
                                   2012 ; i.e. SP must have the 
                                   2013 ; save value at  
                                   2014 ; entry point of both 
                                   2015 ; routine. 
                                   2016 ;---------------------
                           000004  2017 	CTXT_SIZE=4 ; size of saved data 
                                   2018 ;--------------------
                                   2019 ; save current BASIC
                                   2020 ; interpreter context 
                                   2021 ; on stack 
                                   2022 ;--------------------
      00207F                       2023 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00207F                       2024 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00207F                       2025 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00207F                       2026 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00207F                       2027 save_context:
      009F87 CC 96 B0         [ 2] 2028 	ldw x,basicptr 
      009F8A 55 00            [ 2] 2029 	ldw (BPTR,sp),x
      009F8C 03 00 02         [ 1] 2030 	ld a,in 
      009F8F CD 9E            [ 1] 2031 	ld (IN,sp),a
      009F91 D8 22 01         [ 1] 2032 	ld a,count 
      009F94 81 52            [ 1] 2033 	ld (CNT,sp),a  
      009F96 06               [ 4] 2034 	ret
                                   2035 
                                   2036 ;-----------------------
                                   2037 ; restore previously saved 
                                   2038 ; BASIC interpreter context 
                                   2039 ; from stack 
                                   2040 ;-------------------------
      00208F                       2041 rest_context:
      009F97 CE 00            [ 2] 2042 	ldw x,(BPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009F99 1C 1F 05         [ 2] 2043 	ldw basicptr,x 
      009F9C FE 1F            [ 1] 2044 	ld a,(IN,sp)
      009F9E 01 AE 7F         [ 1] 2045 	ld in,a
      009FA1 FF 1F            [ 1] 2046 	ld a,(CNT,sp)
      009FA3 03 CD 99         [ 1] 2047 	ld count,a  
      009FA6 E2               [ 4] 2048 	ret
                                   2049 
                                   2050 
                                   2051 
                                   2052 ;------------------------------------------
                                   2053 ; BASIC: INPUT [string]var[,[string]var]
                                   2054 ; input value in variables 
                                   2055 ; [string] optionally can be used as prompt 
                                   2056 ;-----------------------------------------
                           000001  2057 	CX_BPTR=1
                           000003  2058 	CX_IN=3
                           000004  2059 	CX_CNT=4
                           000005  2060 	SKIP=5
                           000005  2061 	VSIZE=5
      00209F                       2062 input_var:
      009FA7 4D 27            [ 2] 2063 	pushw y 
      0020A1                       2064 	_vars VSIZE 
      009FA9 31 A1            [ 2]    1     sub sp,#VSIZE 
      0020A3                       2065 input_loop:
      009FAB 02 27            [ 1] 2066 	clr (SKIP,sp)
      009FAD 07 A1 01         [ 4] 2067 	call next_token 
      009FB0 27 06            [ 1] 2068 	cp a,#TK_QSTR 
      009FB2 CC 96            [ 1] 2069 	jrne 1$ 
      009FB4 B0 85 1F         [ 4] 2070 	call puts 
      009FB7 05               [ 1] 2071 	incw x 
      009FB8 72 B0 00 04      [ 2] 2072 	subw x,basicptr 
      009FB8 85 1F 01         [ 2] 2073 	ldw in.w,x 
      009FBB 03 05            [ 1] 2074 	cpl (SKIP,sp)
      009FBB CE 00 1C         [ 4] 2075 	call next_token 
      009FBE 1F 05            [ 1] 2076 1$: cp a,#TK_VAR  
      009FC0 C3 00            [ 1] 2077 	jreq 2$ 
      009FC2 1E 2A 38         [ 2] 2078 	jp syntax_error
      009FC5 FE 13 01         [ 4] 2079 2$:	call get_addr
      009FC8 2A 11 1E         [ 2] 2080 	ldw ptr16,x 
      009FCB 05 E6            [ 1] 2081 	tnz (SKIP,sp)
      009FCD 02 C7            [ 1] 2082 	jrne 21$ 
      009FCF 00 0F 72         [ 4] 2083 	call var_name 
      009FD2 5F 00 0E         [ 4] 2084 	call putc   
      0020D3                       2085 21$:
      009FD5 72 BB            [ 1] 2086 	ld a,#':
      009FD7 00 0E 20         [ 4] 2087 	call putc 
      009FDA E3 20 7F         [ 4] 2088 	call save_context 
      009FDB 72 5F 00 03      [ 1] 2089 	clr count  
      009FDB 1E 05 E6         [ 4] 2090 	call readln 
      009FDE 02 CD A0         [ 2] 2091 	ldw x,#tib 
      009FE1 52 1E 05         [ 1] 2092 	push count
      009FE4 E6 02            [ 1] 2093 	push #0 
      009FE6 C7 00 0F         [ 2] 2094 	addw x,(1,sp)
      009FE9 72               [ 1] 2095 	incw x 
      0020EE                       2096 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009FEA 5F 00            [ 2]    1     addw sp,#2 
      009FEC 0E 72 BB 00      [ 1] 2097 	clr in 
      009FF0 0E C3 00         [ 4] 2098 	call get_token
      009FF3 1E 2A            [ 1] 2099 	cp a,#TK_INTGR
      009FF5 07 1F            [ 1] 2100 	jreq 3$ 
      009FF7 05 FE            [ 1] 2101 	cp a,#TK_MINUS
      009FF9 13 03            [ 1] 2102 	jrne 22$
      009FFB 2F DE AC         [ 4] 2103 	call get_token 
      009FFD A1 84            [ 1] 2104 	cp a,#TK_INTGR 
      009FFD 55 00            [ 1] 2105 	jreq 23$
      002106                       2106 22$:
      009FFF 04 00 02         [ 4] 2107 	call rest_context 
      00A002 AE 16 E0         [ 2] 2108 	jp syntax_error
      00210C                       2109 23$:
      00A005 CF 00 05         [ 4] 2110 	call neg_acc24	
      00210F                       2111 3$: 
      00A008 5B 06 CD         [ 1] 2112 	ld a,acc24 
      00A00B 9E E0 81         [ 2] 2113 	ldw x,acc16 
      00A00E 72 C7 00 19      [ 4] 2114 	ld [ptr16],a
      00A00E CD A8 5E 27      [ 1] 2115 	inc ptr8  
      00A012 07 AE A0 3B      [ 5] 2116 	ldw [ptr16],x 
      00A016 CD 89 B2         [ 4] 2117 	call rest_context
      00A019 81 17 9A         [ 4] 2118 	call next_token 
      00A01A A1 08            [ 1] 2119 	cp a,#TK_COMMA
      00A01A 90 AE            [ 1] 2120 	jrne 4$ 
      00A01C B6 80 CE         [ 2] 2121 	jp input_loop
      00212E                       2122 4$:
      00A01F B6 82            [ 1] 2123 	cp a,#TK_NONE 
      00A021 1C 00            [ 1] 2124 	jreq input_exit  
      00A023 04 CF            [ 1] 2125 	cp a,#TK_COLON 
      00A025 00 0E            [ 1] 2126     jreq input_exit 
      00A027 AE 00 8C         [ 2] 2127 	jp syntax_error 
      002139                       2128 input_exit:
      002139                       2129 	_drop VSIZE 
      00A02A CD 93            [ 2]    1     addw sp,#VSIZE 
      00A02C FC AE            [ 2] 2130 	popw y 
      00A02E 00               [ 4] 2131 	ret 
                                   2132 
                                   2133 
                                   2134 ;---------------------
                                   2135 ; BASIC: REM | ' 
                                   2136 ; skip comment to end of line 
                                   2137 ;---------------------- 
      00213E                       2138 remark::
      00A02F 90 CF 00 1C 72   [ 1] 2139 	mov in,count 
      00A034 BB               [ 4] 2140  	ret 
                                   2141 
                                   2142 
                                   2143 ;---------------------
                                   2144 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2145 ; read in loop 'addr'  
                                   2146 ; apply & 'mask' to value 
                                   2147 ; loop while result==0.  
                                   2148 ; 'xor_mask' is used to 
                                   2149 ; invert the wait logic.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   2150 ; i.e. loop while not 0.
                                   2151 ;---------------------
                           000001  2152 	XMASK=1 
                           000002  2153 	MASK=2
                           000003  2154 	ADDR=3
                           000004  2155 	VSIZE=4
      002144                       2156 wait: 
      002144                       2157 	_vars VSIZE
      00A035 00 8E            [ 2]    1     sub sp,#VSIZE 
      00A037 CF 00            [ 1] 2158 	clr (XMASK,sp) 
      00A039 1E 81 4E         [ 4] 2159 	call arg_list 
      00A03C 6F 20            [ 1] 2160 	cp a,#2
      00A03E 61 70            [ 1] 2161 	jruge 0$
      00A040 70 6C 69         [ 2] 2162 	jp syntax_error 
      00A043 63 61            [ 1] 2163 0$:	cp a,#3
      00A045 74 69            [ 1] 2164 	jrult 1$
      002156                       2165 	_xpop  ; xor mask 
      00A047 6F 6E            [ 1]    1     ld a,(y)
      00A049 20               [ 1]    2     ldw x,y 
      00A04A 73 61            [ 2]    3     ldw x,(1,x)
      00A04C 76 65 64 2E      [ 2]    4     addw y,#CELL_SIZE 
      00A050 0A               [ 1] 2166 	ld a,xl 
      00A051 00 01            [ 1] 2167 	ld (XMASK,sp),a 
      00A052                       2168 1$: _xpop ; mask
      00A052 90 89            [ 1]    1     ld a,(y)
      00A054 C7               [ 1]    2     ldw x,y 
      00A055 00 04            [ 2]    3     ldw x,(1,x)
      00A057 E6 02 C1 00      [ 2]    4     addw y,#CELL_SIZE 
      00A05B 04               [ 1] 2169     ld a,xl  
      00A05C 2A 03            [ 1] 2170 	ld (MASK,sp),a 
      00216E                       2171 	_xpop ; address 
      00A05E C7 00            [ 1]    1     ld a,(y)
      00A060 04               [ 1]    2     ldw x,y 
      00A061 CF 00            [ 2]    3     ldw x,(1,x)
      00A063 05 90 AE 16      [ 2]    4     addw y,#CELL_SIZE 
      00A067 90               [ 1] 2172 2$:	ld a,(x)
      00A068 CD 91            [ 1] 2173 	and a,(MASK,sp)
      00A06A EC CD            [ 1] 2174 	xor a,(XMASK,sp)
      00A06C 89 B2            [ 1] 2175 	jreq 2$ 
      00217E                       2176 	_drop VSIZE 
      00A06E A6 0D            [ 2]    1     addw sp,#VSIZE 
      00A070 CD               [ 4] 2177 	ret 
                                   2178 
                                   2179 ;---------------------
                                   2180 ; BASIC: BSET addr,mask
                                   2181 ; set bits at 'addr' corresponding 
                                   2182 ; to those of 'mask' that are at 1.
                                   2183 ; arguments:
                                   2184 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2185 ;   mask        mask|addr
                                   2186 ; output:
                                   2187 ;	none 
                                   2188 ;--------------------------
      002181                       2189 bit_set:
      00A071 89 55 90         [ 4] 2190 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      00A074 85 81            [ 1] 2191 	cp a,#2	 
      00A076 27 03            [ 1] 2192 	jreq 1$ 
      00A076 52 01 30         [ 2] 2193 	jp syntax_error
      00A078                       2194 1$: 
      00218B                       2195 	_xpop ; mask 
      00A078 0F 01            [ 1]    1     ld a,(y)
      00A07A 93               [ 1]    2     ldw x,y 
      00A07A CD 98            [ 2]    3     ldw x,(1,x)
      00A07C 1A A1 02 25      [ 2]    4     addw y,#CELL_SIZE 
      00A080 08               [ 1] 2196 	ld a,xl
      00A081 A1               [ 1] 2197 	push a  
      002196                       2198 	_xpop ; addr  
      00A082 0A 27            [ 1]    1     ld a,(y)
      00A084 04               [ 1]    2     ldw x,y 
      00A085 A1 80            [ 2]    3     ldw x,(1,x)
      00A087 26 07 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A089 84               [ 1] 2199 	pop a 
      00A089 55               [ 1] 2200 	or a,(x)
      00A08A 00               [ 1] 2201 	ld (x),a
      00A08B 03               [ 4] 2202 	ret 
                                   2203 
                                   2204 ;---------------------
                                   2205 ; BASIC: BRES addr,mask
                                   2206 ; reset bits at 'addr' corresponding 
                                   2207 ; to those of 'mask' that are at 1.
                                   2208 ; arguments:
                                   2209 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2210 ;   mask	    ~mask&*addr  
                                   2211 ; output:
                                   2212 ;	none 
                                   2213 ;--------------------------
      0021A3                       2214 bit_reset:
      00A08C 00 02 20         [ 4] 2215 	call arg_list 
      00A08F 63 02            [ 1] 2216 	cp a,#2  
      00A090 27 03            [ 1] 2217 	jreq 1$ 
      00A090 A1 02 27         [ 2] 2218 	jp syntax_error
      0021AD                       2219 1$: 
      0021AD                       2220 	_xpop ; mask 
      00A093 12 A1            [ 1]    1     ld a,(y)
      00A095 04               [ 1]    2     ldw x,y 
      00A096 27 1B            [ 2]    3     ldw x,(1,x)
      00A098 A1 82 27 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A09C A1               [ 1] 2221 	ld a,xl 
      00A09D 08               [ 1] 2222 	cpl a
      00A09E 27               [ 1] 2223 	push a  
      0021B9                       2224 	_xpop ; addr  
      00A09F 2A A1            [ 1]    1     ld a,(y)
      00A0A1 09               [ 1]    2     ldw x,y 
      00A0A2 27 2A            [ 2]    3     ldw x,(1,x)
      00A0A4 20 3D 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0A6 84               [ 1] 2225 	pop a 
      00A0A6 CD               [ 1] 2226 	and a,(x)
      00A0A7 89               [ 1] 2227 	ld (x),a 
      00A0A8 B2               [ 4] 2228 	ret 
                                   2229 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2230 ;---------------------
                                   2231 ; BASIC: BTOGL addr,mask
                                   2232 ; toggle bits at 'addr' corresponding 
                                   2233 ; to those of 'mask' that are at 1.
                                   2234 ; arguments:
                                   2235 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2236 ;   mask	    mask^*addr  
                                   2237 ; output:
                                   2238 ;	none 
                                   2239 ;--------------------------
      0021C6                       2240 bit_toggle:
      00A0A9 5C 72 B0         [ 4] 2241 	call arg_list 
      00A0AC 00 05            [ 1] 2242 	cp a,#2 
      00A0AE CF 00            [ 1] 2243 	jreq 1$ 
      00A0B0 01 20 C5         [ 2] 2244 	jp syntax_error
      00A0B3                       2245 1$: _xpop ; mask 
      00A0B3 CD 98            [ 1]    1     ld a,(y)
      00A0B5 5C               [ 1]    2     ldw x,y 
      00A0B6 CD 89            [ 2]    3     ldw x,(1,x)
      00A0B8 55 20 BD 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0BB 9F               [ 1] 2246 	ld a,xl
      00A0BB FE               [ 1] 2247 	push a 
      0021DB                       2248 	_xpop  ; addr  
      00A0BC 72 5C            [ 1]    1     ld a,(y)
      00A0BE 00               [ 1]    2     ldw x,y 
      00A0BF 02 72            [ 2]    3     ldw x,(1,x)
      00A0C1 5C 00 02 FD      [ 2]    4     addw y,#CELL_SIZE 
      00A0C5 CD               [ 1] 2249 	pop a 
      00A0C6 89               [ 1] 2250 	xor a,(x)
      00A0C7 55               [ 1] 2251 	ld (x),a 
      00A0C8 20               [ 4] 2252 	ret 
                                   2253 
                                   2254 
                                   2255 ;---------------------
                                   2256 ; BASIC: BTEST(addr,bit)
                                   2257 ; return bit value at 'addr' 
                                   2258 ; bit is in range {0..7}.
                                   2259 ; arguments:
                                   2260 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2261 ;   bit 	    bit position {0..7}  
                                   2262 ; output:
                                   2263 ;	A:X       bit value  
                                   2264 ;--------------------------
      0021E8                       2265 bit_test:
      00A0C9 AE 19 5D         [ 4] 2266 	call func_args 
      00A0CA A1 02            [ 1] 2267 	cp a,#2
      00A0CA 03 01            [ 1] 2268 	jreq 0$
      00A0CC 20 AC 30         [ 2] 2269 	jp syntax_error
      00A0CE                       2270 0$:	
      0021F2                       2271 	_xpop 
      00A0CE CD 98            [ 1]    1     ld a,(y)
      00A0D0 1A               [ 1]    2     ldw x,y 
      00A0D1 A1 84            [ 2]    3     ldw x,(1,x)
      00A0D3 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A0D7 B0               [ 1] 2272 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      00A0D8 A4 07            [ 1] 2273 	and a,#7
      00A0D8 CD               [ 1] 2274 	push a   
      00A0D9 98 4C            [ 1] 2275 	ld a,#1 
      00A0DB 9F A4            [ 1] 2276 1$: tnz (1,sp)
      00A0DD 0F C7            [ 1] 2277 	jreq 2$
      00A0DF 00               [ 1] 2278 	sll a 
      00A0E0 24 20            [ 1] 2279 	dec (1,sp)
      00A0E2 95 F7            [ 2] 2280 	jra 1$
      00A0E3 6B 01            [ 1] 2281 2$: ld (1,sp),a  
      00220C                       2282 	_xpop ; address  
      00A0E3 55 00            [ 1]    1     ld a,(y)
      00A0E5 03               [ 1]    2     ldw x,y 
      00A0E6 00 02            [ 2]    3     ldw x,(1,x)
      00A0E8 CD 9C 3F 4D      [ 2]    4     addw y,#CELL_SIZE 
      00A0EC 27               [ 1] 2283 	pop a 
      00A0ED 05               [ 1] 2284 	and a,(x)
      00A0EE CD 98            [ 1] 2285 	jreq 3$
      00A0F0 87 20            [ 1] 2286 	ld a,#1 
      00A0F2 85               [ 1] 2287 3$:	clrw x 
      00A0F3 97               [ 1] 2288 	ld xl,a
      00A0F3 0D               [ 1] 2289 	clr a  
      00A0F4 01               [ 4] 2290 	ret
                                   2291 
                                   2292 ;--------------------
                                   2293 ; BASIC: POKE addr,byte
                                   2294 ; put a byte at addr 
                                   2295 ;--------------------
      00221F                       2296 poke:
      00A0F5 26 05 A6         [ 4] 2297 	call arg_list 
      00A0F8 0D CD            [ 1] 2298 	cp a,#2
      00A0FA 89 55            [ 1] 2299 	jreq 1$
      00A0FC 5B 01 81         [ 2] 2300 	jp syntax_error
      00A0FF                       2301 1$:	
      002229                       2302 	_xpop ; byte   
      00A0FF CE 00            [ 1]    1     ld a,(y)
      00A101 05               [ 1]    2     ldw x,y 
      00A102 1F 03            [ 2]    3     ldw x,(1,x)
      00A104 C6 00 02 6B      [ 2]    4     addw y,#CELL_SIZE 
      00A108 05               [ 1] 2303     ld a,xl 
      00A109 C6               [ 1] 2304 	push a 
      002234                       2305 	_xpop ; address 
      00A10A 00 04            [ 1]    1     ld a,(y)
      00A10C 6B               [ 1]    2     ldw x,y 
      00A10D 06 81            [ 2]    3     ldw x,(1,x)
      00A10F 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A10F 1E               [ 1] 2306 	pop a 
      00A110 03               [ 1] 2307 	ld (x),a 
      00A111 CF               [ 4] 2308 	ret 
                                   2309 
                                   2310 ;-----------------------
                                   2311 ; BASIC: PEEK(addr)
                                   2312 ; get the byte at addr 
                                   2313 ; input:
                                   2314 ;	none 
                                   2315 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2316 ;	X 		value 
                                   2317 ;-----------------------
      002240                       2318 peek:
      00A112 00 05 7B         [ 4] 2319 	call func_args
      00A115 05 C7            [ 1] 2320 	cp a,#1 
      00A117 00 02            [ 1] 2321 	jreq 1$
      00A119 7B 06 C7         [ 2] 2322 	jp syntax_error
      00224A                       2323 1$: _xpop ; address  
      00A11C 00 04            [ 1]    1     ld a,(y)
      00A11E 81               [ 1]    2     ldw x,y 
      00A11F EE 01            [ 2]    3     ldw x,(1,x)
      00A11F 90 89 52 05      [ 2]    4     addw y,#CELL_SIZE 
      00A123 C7 00 18         [ 1] 2324 	ld farptr,a 
      00A123 0F 05 CD         [ 2] 2325 	ldw ptr16,x 
      00A126 98 1A A1 02      [ 5] 2326 	ldf a,[farptr]
      00A12A 26               [ 1] 2327 	clrw x 
      00A12B 10               [ 1] 2328 	ld xl,a 
      00A12C CD               [ 1] 2329 	clr a 
      00A12D 89               [ 4] 2330 	ret 
                                   2331 
                                   2332 ;---------------------------
                                   2333 ; BASIC IF expr : instructions
                                   2334 ; evaluate expr and if true 
                                   2335 ; execute instructions on same line. 
                                   2336 ;----------------------------
      002261                       2337 if: 
      00A12E B2 5C 72         [ 4] 2338 	call condition  
      002264                       2339 	_xpop 
      00A131 B0 00            [ 1]    1     ld a,(y)
      00A133 05               [ 1]    2     ldw x,y 
      00A134 CF 00            [ 2]    3     ldw x,(1,x)
      00A136 01 03 05 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A13A 98               [ 1] 2340 	tnz  a  
      00A13B 1A A1            [ 1] 2341 	jrne 9$
      00A13D 85               [ 2] 2342 	tnzw x 
      00A13E 27 03            [ 1] 2343 	jrne 9$  
                                   2344 ;skip to next line
      00A140 CC 96 B0 CD 98   [ 1] 2345 	mov in,count
      002278                       2346 	_drop 2 
      00A145 42 CF            [ 2]    1     addw sp,#2 
      00A147 00 1A 0D         [ 2] 2347 	jp next_line
      00A14A 05               [ 4] 2348 9$:	ret 
                                   2349 
                                   2350 ;------------------------
                                   2351 ; BASIC: FOR var=expr 
                                   2352 ; set variable to expression 
                                   2353 ; leave variable address 
                                   2354 ; on stack and set
                                   2355 ; FLOOP bit in 'flags'
                                   2356 ;-----------------
                           000001  2357 	RETL1=1 ; return address  
                           000003  2358 	FSTEP=3  ; variable increment int24
                           000006  2359 	LIMIT=6 ; loop limit, int24  
                           000009  2360 	CVAR=9   ; control variable 
                           00000B  2361 	INW=11   ;  in.w saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                           00000D  2362 	BPTR=13 ; baseptr saved
                           00000D  2363 	VSIZE=13  
      00227E                       2364 for: ; { -- var_addr }
      00A14B 26               [ 2] 2365 	popw x ; call return address 
      00227F                       2366 	_vars VSIZE 
      00A14C 06 CD            [ 2]    1     sub sp,#VSIZE 
      00A14E 91               [ 2] 2367 	pushw x  ; RETL1 
      00A14F E2 CD            [ 1] 2368 	ld a,#TK_VAR 
      00A151 89 55 50         [ 4] 2369 	call expect
      00A153 CD 17 C2         [ 4] 2370 	call get_addr
      00A153 A6 3A            [ 2] 2371 	ldw (CVAR,sp),x  ; control variable 
      00A155 CD 89 55         [ 4] 2372 	call let_eval 
      00A158 CD A0 FF 72      [ 1] 2373 	bset flags,#FLOOP 
      00A15C 5F 00 04         [ 4] 2374 	call next_token 
      00A15F CD 8A            [ 1] 2375 	cp a,#TK_CMD 
      00A161 B7 AE            [ 1] 2376 	jreq 1$
      00A163 16 90 3B         [ 2] 2377 	jp syntax_error
      00229D                       2378 1$:  
      00229D                       2379 	_get_code_addr
      00A166 00               [ 2]    1         ldw x,(x)
      00A167 04 4B 00 72      [ 1]    2         inc in 
      00A16B FB 01 5C 5B      [ 1]    3         inc in 
      00A16F 02 72 5F         [ 2] 2380 	cpw x,#to   
      00A172 00 02            [ 1] 2381 	jreq to
      00A174 CD 8F 2C         [ 2] 2382 	jp syntax_error 
                                   2383 
                                   2384 ;-----------------------------------
                                   2385 ; BASIC: TO expr 
                                   2386 ; second part of FOR loop initilization
                                   2387 ; leave limit on stack and set 
                                   2388 ; FTO bit in 'flags'
                                   2389 ;-----------------------------------
      0022AE                       2390 to: ; { var_addr -- var_addr limit step }
      00A177 A1 84 27 14 A1   [ 2] 2391 	btjt flags,#FLOOP,1$
      00A17C 11 26 07         [ 2] 2392 	jp syntax_error
      00A17F CD 8F 2C         [ 4] 2393 1$: call expression   
      00A182 A1 84            [ 1] 2394 	cp a,#TK_INTGR 
      00A184 27 06            [ 1] 2395 	jreq 2$ 
      00A186 CC 16 30         [ 2] 2396 	jp syntax_error
      0022C0                       2397 2$: _xpop
      00A186 CD A1            [ 1]    1     ld a,(y)
      00A188 0F               [ 1]    2     ldw x,y 
      00A189 CC 96            [ 2]    3     ldw x,(1,x)
      00A18B B0 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A18C 6B 06            [ 1] 2398 	ld (LIMIT,sp),a 
      00A18C CD 82            [ 2] 2399 	ldw (LIMIT+1,sp),x
      00A18E 8A 17 9A         [ 4] 2400 	call next_token
      00A18F A1 00            [ 1] 2401 	cp a,#TK_NONE  
      00A18F C6 00            [ 1] 2402 	jreq 4$ 
      00A191 0D CE            [ 1] 2403 	cp a,#TK_CMD
      00A193 00 0E            [ 1] 2404 	jrne 3$
      0022D8                       2405 	_get_code_addr
      00A195 72               [ 2]    1         ldw x,(x)
      00A196 C7 00 1A 72      [ 1]    2         inc in 
      00A19A 5C 00 1B 72      [ 1]    3         inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      00A19E CF 00 1A         [ 2] 2406 	cpw x,#step 
      00A1A1 CD A1            [ 1] 2407 	jreq step
      0022E6                       2408 3$:	
      0022E6                       2409 	_unget_token   	 
      00A1A3 0F CD 98 1A A1   [ 1]    1      mov in,in.saved  
      0022EB                       2410 4$:	
      00A1A8 08 26            [ 1] 2411 	clr (FSTEP,sp) 
      00A1AA 03 CC A1         [ 2] 2412 	ldw x,#1   ; default step  
      00A1AD 23 04            [ 2] 2413 	ldw (FSTEP+1,sp),x 
      00A1AE 20 2F            [ 2] 2414 	jra store_loop_addr 
                                   2415 
                                   2416 
                                   2417 ;----------------------------------
                                   2418 ; BASIC: STEP expr 
                                   2419 ; optional third par of FOR loop
                                   2420 ; initialization. 	
                                   2421 ;------------------------------------
      0022F4                       2422 step: ; {var limit -- var limit step}
      00A1AE A1 00 27 07 A1   [ 2] 2423 	btjt flags,#FLOOP,1$
      00A1B3 0A 27 03         [ 2] 2424 	jp syntax_error
      00A1B6 CC 96 B0         [ 4] 2425 1$: call expression 
      00A1B9 A1 84            [ 1] 2426 	cp a,#TK_INTGR
      00A1B9 5B 05            [ 1] 2427 	jreq 2$
      00A1BB 90 85 81         [ 2] 2428 	jp syntax_error
      00A1BE                       2429 2$:	
      002306                       2430 	_xpop 
      00A1BE 55 00            [ 1]    1     ld a,(y)
      00A1C0 04               [ 1]    2     ldw x,y 
      00A1C1 00 02            [ 2]    3     ldw x,(1,x)
      00A1C3 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A1C4 6B 03            [ 1] 2431 	ld (FSTEP,sp),a 
      00A1C4 52 04            [ 2] 2432 	ldw (FSTEP+1,sp),x ; step
                                   2433 ; if step < 0 decrement LIMIT 
      00A1C6 0F               [ 1] 2434 	tnz a
      00A1C7 01 CD            [ 1] 2435 	jrpl store_loop_addr 
      00A1C9 99 E2            [ 1] 2436 	ld a,(LIMIT,sp)
      00A1CB A1 02            [ 2] 2437 	ldw x,(LIMIT+1,sp)
      00A1CD 24 03 CC         [ 2] 2438 	subw x,#1 
      00A1D0 96 B0            [ 1] 2439 	sbc a,#0 
      00A1D2 A1 03            [ 1] 2440 	ld (LIMIT,sp),a 
      00A1D4 25 0C            [ 2] 2441 	ldw (LIMIT+1,sp),x 
                                   2442 ; leave loop back entry point on cstack 
                                   2443 ; cstack is 1 call deep from interpreter
      002323                       2444 store_loop_addr:
      00A1D6 90 F6 93         [ 2] 2445 	ldw x,basicptr
      00A1D9 EE 01            [ 2] 2446 	ldw (BPTR,sp),x 
      00A1DB 72 A9 00         [ 2] 2447 	ldw x,in.w 
      00A1DE 03 9F            [ 2] 2448 	ldw (INW,sp),x   
      00A1E0 6B 01 90 F6      [ 1] 2449 	bres flags,#FLOOP 
      00A1E4 93 EE 01 72      [ 1] 2450 	inc loop_depth  
      00A1E8 A9               [ 4] 2451 	ret 
                                   2452 
                                   2453 ;--------------------------------
                                   2454 ; BASIC: NEXT var 
                                   2455 ; FOR loop control 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2456 ; increment variable with step 
                                   2457 ; and compare with limit 
                                   2458 ; loop if threshold not crossed.
                                   2459 ; else stack. 
                                   2460 ; and decrement 'loop_depth' 
                                   2461 ;--------------------------------
      002336                       2462 next: ; {var limit step retl1 -- [var limit step ] }
      00A1E9 00 03 9F 6B      [ 1] 2463 	tnz loop_depth 
      00A1ED 02 90            [ 1] 2464 	jrne 1$ 
      00A1EF F6 93 EE         [ 2] 2465 	jp syntax_error 
      00233F                       2466 1$: 
      00A1F2 01 72            [ 1] 2467 	ld a,#TK_VAR 
      00A1F4 A9 00 03         [ 4] 2468 	call expect
      00A1F7 F6 14 02         [ 4] 2469 	call get_addr 
                                   2470 ; check for good variable after NEXT 	 
      00A1FA 18 01            [ 2] 2471 	cpw x,(CVAR,sp)
      00A1FC 27 F9            [ 1] 2472 	jreq 2$  
      00A1FE 5B 04 81         [ 2] 2473 	jp syntax_error ; not the good one 
      00A201                       2474 2$: 
      00A201 CD 99 E2         [ 2] 2475 	ldw ptr16,x 
                                   2476 	; increment variable 
      00A204 A1               [ 1] 2477 	ld a,(x)
      00A205 02 27            [ 2] 2478 	ldw x,(1,x)  ; get var value 
      00A207 03 CC 96         [ 2] 2479 	addw x,(FSTEP+1,sp) ; var+step 
      00A20A B0 03            [ 1] 2480 	adc a,(FSTEP,sp)
      00A20B 72 C7 00 19      [ 4] 2481 	ld [ptr16],a
      00A20B 90 F6 93 EE      [ 1] 2482 	inc ptr8  
      00A20F 01 72 A9 00      [ 5] 2483 	ldw [ptr16],x 
      00A213 03 9F 88         [ 1] 2484 	ld acc24,a 
      00A216 90 F6 93         [ 2] 2485 	ldw acc16,x 
      00A219 EE 01            [ 1] 2486 	ld a,(LIMIT,sp)
      00A21B 72 A9            [ 2] 2487 	ldw x,(LIMIT+1,sp)
      00A21D 00 03 84 FA      [ 2] 2488 	subw x,acc16 
      00A221 F7 81 0C         [ 1] 2489 	sbc a,acc24
      00A223 18 03            [ 1] 2490 	xor a,(FSTEP,sp)
      00A223 CD 99            [ 1] 2491 	xor a,#0x80
      00A225 E2 A1            [ 1] 2492 	jrmi loop_back  
      00A227 02 27            [ 2] 2493 	jra loop_done   
                                   2494 ; check sign of STEP  
      00A229 03 CC            [ 1] 2495 	ld a,(FSTEP,sp)
      00A22B 96 B0            [ 1] 2496 	jrpl 4$
                                   2497 ;negative step
      00A22D C6 00 0E         [ 1] 2498     ld a,acc8 
      00A22D 90 F6            [ 1] 2499 	jrslt loop_back   
      00A22F 93 EE            [ 2] 2500 	jra loop_done  
      002389                       2501 4$: ; positive step
      00A231 01 72 A9 00 03   [ 2] 2502 	btjt acc8,#7,loop_done 
      00238E                       2503 loop_back:
      00A236 9F 43            [ 2] 2504 	ldw x,(BPTR,sp)
      00A238 88 90 F6         [ 2] 2505 	ldw basicptr,x 
      00A23B 93 EE 01 72 A9   [ 2] 2506 	btjf flags,#FRUN,1$ 
      00A240 00 03            [ 1] 2507 	ld a,(2,x)
      00A242 84 F4 F7         [ 1] 2508 	ld count,a
      00A245 81 0B            [ 2] 2509 1$:	ldw x,(INW,sp)
      00A246 CF 00 00         [ 2] 2510 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      00A246 CD               [ 4] 2511 	ret 
      0023A3                       2512 loop_done:
                                   2513 	; remove loop data from stack  
      00A247 99               [ 2] 2514 	popw x
      0023A4                       2515 	_drop VSIZE 
      00A248 E2 A1            [ 2]    1     addw sp,#VSIZE 
      00A24A 02 27 03 CC      [ 1] 2516 	dec loop_depth 
      00A24E 96               [ 2] 2517 	jp (x)
                                   2518 
                                   2519 ;----------------------------
                                   2520 ; called by goto/gosub
                                   2521 ; to get target line number 
                                   2522 ; output:
                                   2523 ;    x    line address 
                                   2524 ;---------------------------
      0023AB                       2525 get_target_line:
      00A24F B0 90 F6         [ 4] 2526 	call next_token  
      00A252 93 EE            [ 1] 2527 	cp a,#TK_INTGR
      00A254 01 72            [ 1] 2528 	jreq get_target_line_addr 
      00A256 A9 00            [ 1] 2529 	cp a,#TK_LABEL 
      00A258 03 9F            [ 1] 2530 	jreq look_target_symbol 
      00A25A 88 90 F6         [ 2] 2531 	jp syntax_error
                                   2532 ; the target is a line number 
                                   2533 ; search it. 
      0023B9                       2534 get_target_line_addr:
      00A25D 93 EE            [ 2] 2535 	pushw y 
      00A25F 01 72 A9         [ 4] 2536 	call get_int24 ; line # 
      00A262 00               [ 1] 2537 	clr a
      00A263 03 84 F8 F7      [ 2] 2538 	ldw y,basicptr 
      00A267 81 FE            [ 2] 2539 	ldw y,(y)
      00A268 90 89            [ 2] 2540 	pushw y 
      00A268 CD 99            [ 2] 2541 	cpw x,(1,sp)
      0023C9                       2542 	_drop 2  
      00A26A DD A1            [ 2]    1     addw sp,#2 
      00A26C 02 27            [ 1] 2543 	jrult 11$
      00A26E 03               [ 1] 2544 	inc a 
      0023CE                       2545 11$: ; scan program for this line# 	
      00A26F CC 96 B0         [ 4] 2546 	call search_lineno  
      00A272 5D               [ 2] 2547 	tnzw x ; 0| line# address 
      00A272 90 F6            [ 1] 2548 	jrne 2$ 
      00A274 93 EE            [ 1] 2549 	ld a,#ERR_NO_LINE 
      00A276 01 72 A9         [ 2] 2550 	jp tb_error 
      00A279 00 03            [ 2] 2551 2$:	popw y  
      00A27B 9F               [ 4] 2552 	ret 
                                   2553 
                                   2554 ; the GOTO|GOSUB target is a symbol.
                                   2555 ; output:
                                   2556 ;    X    line address|0 
      0023DC                       2557 look_target_symbol:
      00A27C A4 07            [ 2] 2558 	pushw y 
      00A27E 88               [ 2] 2559 	pushw x 
      00A27F A6 01 0D         [ 4] 2560 	call skip_string 
      00A282 01 27 05 48      [ 1] 2561 	clr acc16 
      00A286 0A 01 20 F7      [ 2] 2562 	ldw y,txtbgn 
      00A28A 6B 01 90         [ 1] 2563 1$:	ld a,(3,y) ; first TK_ID on line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      00A28D F6 93            [ 1] 2564 	cp a,#TK_LABEL 
      00A28F EE 01            [ 1] 2565 	jreq 3$ 
      00A291 72 A9 00         [ 1] 2566 2$:	ld a,(2,y); line length 
      00A294 03 84 F4         [ 1] 2567 	ld acc8,a 
      00A297 27 02 A6 01      [ 2] 2568 	addw y,acc16 ;point to next line 
      00A29B 5F 97 4F 81      [ 2] 2569 	cpw y,txtend 
      00A29F 25 E9            [ 1] 2570 	jrult 1$
      00A29F CD 99            [ 1] 2571 	ld a,#ERR_BAD_VALUE
      00A2A1 E2 A1 02         [ 2] 2572 	jp tb_error 
      002406                       2573 3$: ; found a TK_LABEL 
                                   2574 	; compare with GOTO|GOSUB target 
      00A2A4 27 03            [ 2] 2575 	pushw y ; line address 
      00A2A6 CC 96 B0 04      [ 2] 2576 	addw y,#4 ; label string 
      00A2A9 1E 03            [ 2] 2577 	ldw x,(3,sp) ; target string 
      00A2A9 90 F6 93         [ 4] 2578 	call strcmp
      00A2AC EE 01            [ 1] 2579 	jrne 4$
      00A2AE 72 A9            [ 2] 2580 	popw y 
      00A2B0 00 03            [ 2] 2581 	jra 2$ 
      002417                       2582 4$: ; target found 
      00A2B2 9F               [ 2] 2583 	popw x ;  address line target  
      002418                       2584 	_drop 2 ; target string 
      00A2B3 88 90            [ 2]    1     addw sp,#2 
      00A2B5 F6 93            [ 2] 2585 	popw y 
      00A2B7 EE               [ 4] 2586 	ret
                                   2587 
                                   2588 
                                   2589 ;--------------------------------
                                   2590 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2591 ; selective goto or gosub 
                                   2592 ;--------------------------------
      00241D                       2593 cmd_on:
      00A2B8 01 72 A9 00 03   [ 2] 2594 	btjt flags,#FRUN,0$ 
      00A2BD 84 F7            [ 1] 2595 	ld a,#ERR_RUN_ONLY
      00A2BF 81 16 32         [ 2] 2596 	jp tb_error 
      00A2C0 CD 1A A6         [ 4] 2597 0$:	call expression 
      00A2C0 CD 99            [ 1] 2598 	cp a,#TK_INTGR
      00A2C2 DD A1            [ 1] 2599 	jreq 1$
      00A2C4 01 27 03         [ 2] 2600 	jp syntax_error
      002431                       2601 1$: _xpop
      00A2C7 CC 96            [ 1]    1     ld a,(y)
      00A2C9 B0               [ 1]    2     ldw x,y 
      00A2CA 90 F6            [ 2]    3     ldw x,(1,x)
      00A2CC 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
                                   2602 ; the selector is the element indice 
                                   2603 ; in the list of arguments. {1..#elements} 
      00A2D0 A9               [ 1] 2604 	ld a,xl ; keep only bits 7..0
      00A2D1 00 03            [ 1] 2605 	jreq 9$ ; element # begin at 1. 
      00A2D3 C7               [ 1] 2606 	push a  ; selector  
      00A2D4 00 19 CF         [ 4] 2607 	call next_token
      00A2D7 00 1A            [ 1] 2608 	cp a,#TK_CMD 
      00A2D9 92 BC            [ 1] 2609 	jreq 2$ 
      00A2DB 00 19 5F         [ 2] 2610 	jp syntax_error 
      002448                       2611 2$: _get_code_addr
      00A2DE 97               [ 2]    1         ldw x,(x)
      00A2DF 4F 81 00 01      [ 1]    2         inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      00A2E1 72 5C 00 01      [ 1]    3         inc in 
                                   2612 ;; must be a GOTO or GOSUB 
      00A2E1 CD 9C 3F         [ 2] 2613 	cpw x,#goto 
      00A2E4 90 F6            [ 1] 2614 	jreq 4$
      00A2E6 93 EE 01         [ 2] 2615 	cpw x,#gosub 
      00A2E9 72 A9            [ 1] 2616 	jreq 4$ 
      00A2EB 00 03 4D         [ 2] 2617 	jp syntax_error 
      00245E                       2618 4$: 
      00A2EE 26               [ 1] 2619 	pop a 
      00A2EF 0D               [ 2] 2620 	pushw x ; save routine address 	
      00A2F0 5D               [ 1] 2621 	push a  ; selector  
      002461                       2622 5$: ; skip elements in list until selector==0 
      00A2F1 26 0A            [ 1] 2623 	dec (1,sp)
      00A2F3 55 00            [ 1] 2624 	jreq 6$ 
                                   2625 ; can be a line# or a label 
      00A2F5 04 00 02         [ 4] 2626 	call next_token 
      00A2F8 5B 02            [ 1] 2627 	cp a,#TK_INTGR 
      00A2FA CC 97            [ 1] 2628 	jreq 52$
      00A2FC 63 81            [ 1] 2629 	cp a,#TK_LABEL 
      00A2FE 27 0D            [ 1] 2630 	jreq 54$
      00A2FE 85 52 0D         [ 2] 2631 	jp syntax_error 
      002473                       2632 52$: ; got a line number 
      00A301 89 A6 85         [ 1] 2633 	ld a,in ; skip over int24 value 
      00A304 CD 99            [ 1] 2634 	add a,#CELL_SIZE ; integer size  
      00A306 D0 CD 98         [ 1] 2635 	ld in,a 
      00A309 42 1F            [ 2] 2636 	jra 56$
      00A30B 09 CD 9D         [ 4] 2637 54$: call skip_string ; skip over label 	
      002480                       2638 56$: ; if another element comma present 
      00A30E 14 72 14         [ 4] 2639 	call next_token
      00A311 00 23            [ 1] 2640 	cp a,#TK_COMMA 
      00A313 CD 98            [ 1] 2641 	jreq 5$ 
                                   2642 ; arg list exhausted, selector to big 
                                   2643 ; continue execution on next line 
      002487                       2644 	_drop 3 ; drop selector and GOTO|GOSUB address 
      00A315 1A A1            [ 2]    1     addw sp,#3 
      00A317 80 27            [ 2] 2645 	jra 9$
      00248B                       2646 6$: ;at selected position  
      00248B                       2647 	_drop 1 ; discard selector
      00A319 03 CC            [ 2]    1     addw sp,#1 
                                   2648 ; here only the routine address 
                                   2649 ; of GOTO|GOSUB is on stack 
      00A31B 96 B0 AB         [ 4] 2650     call get_target_line
      00A31D CF 00 19         [ 2] 2651 	ldw ptr16,x 	
      00A31D FE 72 5C 00 02   [ 1] 2652 	mov in,count ; move to end of line  
      00A322 72               [ 2] 2653 	popw x ; cmd address, GOTO||GOSUB 
      00A323 5C 00 02         [ 2] 2654 	cpw x,#goto 
      00A326 A3 A3            [ 1] 2655 	jrne 7$ 
      00A328 2E 27 03         [ 2] 2656 	ldw x,ptr16 
      00A32B CC 96            [ 2] 2657 	jra jp_to_target
      0024A3                       2658 7$: 
      00A32D B0 35            [ 2] 2659 	jra gosub_2 ; target in ptr16 
      00A32E                       2660 9$: ; expr out of range skip to end of line
                                   2661     ; this will force a fall to next line  
      00A32E 72 04 00 23 03   [ 1] 2662 	mov in,count
      0024AA                       2663 	_drop 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      00A333 CC 96            [ 2]    1     addw sp,#2 
      00A335 B0 CD 9B         [ 2] 2664 	jp next_line  
                                   2665 
                                   2666 
                                   2667 ;------------------------
                                   2668 ; BASIC: GOTO line# 
                                   2669 ; jump to line# 
                                   2670 ; here cstack is 2 call deep from interpreter 
                                   2671 ;------------------------
      0024AF                       2672 goto:
      00A338 26 A1 84 27 03   [ 2] 2673 	btjt flags,#FRUN,goto_1  
      00A33D CC 96            [ 1] 2674 	ld a,#ERR_RUN_ONLY
      00A33F B0 90 F6         [ 2] 2675 	jp tb_error 
      0024B9                       2676 goto_1:
      00A342 93 EE 01         [ 4] 2677 	call get_target_line
      0024BC                       2678 jp_to_target:
      00A345 72 A9 00         [ 2] 2679 	ldw basicptr,x 
      00A348 03 6B            [ 1] 2680 	ld a,(2,x)
      00A34A 06 1F 07         [ 1] 2681 	ld count,a 
      00A34D CD 98 1A A1      [ 1] 2682 	mov in,#3 
      00A351 00               [ 4] 2683 	ret 
                                   2684 
                                   2685 
                                   2686 ;--------------------
                                   2687 ; BASIC: GOSUB line#
                                   2688 ; basic subroutine call
                                   2689 ; actual line# and basicptr 
                                   2690 ; are saved on cstack
                                   2691 ; here cstack is 2 call deep from interpreter 
                                   2692 ;--------------------
                           000001  2693 	RET_ADDR=1 ; subroutine return address 
                           000003  2694 	RET_BPTR=3 ; basicptr return point 
                           000005  2695 	RET_INW=5  ; in.w return point 
                           000004  2696 	VSIZE=4 
      0024C9                       2697 gosub:
      00A352 27 17 A1 80 26   [ 2] 2698 	btjt flags,#FRUN,gosub_1 
      00A357 0E FE            [ 1] 2699 	ld a,#ERR_RUN_ONLY
      00A359 72 5C 00         [ 2] 2700 	jp tb_error 
      00A35C 02               [ 4] 2701 	ret 
      0024D4                       2702 gosub_1:
      00A35D 72 5C 00         [ 4] 2703 	call get_target_line 
      00A360 02 A3 A3         [ 2] 2704 	ldw ptr16,x
      0024DA                       2705 gosub_2: 
      00A363 74               [ 2] 2706 	popw x 
      0024DB                       2707 	_vars VSIZE  
      00A364 27 0E            [ 2]    1     sub sp,#VSIZE 
      00A366 89               [ 2] 2708 	pushw x ; RET_ADDR 
                                   2709 ; save BASIC subroutine return point.   
      00A366 55 00 03         [ 2] 2710 	ldw x,basicptr
      00A369 00 02            [ 2] 2711 	ldw (RET_BPTR,sp),x 
      00A36B CE 00 00         [ 2] 2712 	ldw x,in.w 
      00A36B 0F 03            [ 2] 2713 	ldw (RET_INW,sp),x
      00A36D AE 00 01         [ 2] 2714 	ldw x,ptr16  
      00A370 1F 04            [ 2] 2715 	jra jp_to_target
                                   2716 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2717 ;------------------------
                                   2718 ; BASIC: RETURN 
                                   2719 ; exit from BASIC subroutine 
                                   2720 ;------------------------
      0024ED                       2721 return:
      00A372 20 2F 00 22 05   [ 2] 2722 	btjt flags,#FRUN,0$ 
      00A374 A6 06            [ 1] 2723 	ld a,#ERR_RUN_ONLY
      00A374 72 04 00         [ 2] 2724 	jp tb_error 
      0024F7                       2725 0$:	
      00A377 23 03            [ 2] 2726 	ldw x,(RET_BPTR,sp) 
      00A379 CC 96 B0         [ 2] 2727 	ldw basicptr,x
      00A37C CD 9B            [ 1] 2728 	ld a,(2,x)
      00A37E 26 A1 84         [ 1] 2729 	ld count,a  
      00A381 27 03            [ 2] 2730 	ldw x,(RET_INW,sp)
      00A383 CC 96 B0         [ 2] 2731 	ldw in.w,x 
      00A386 85               [ 2] 2732 	popw x 
      002507                       2733 	_drop VSIZE 
      00A386 90 F6            [ 2]    1     addw sp,#VSIZE 
      00A388 93               [ 2] 2734 	jp (x)
                                   2735 
                                   2736 
                                   2737 ;----------------------------------
                                   2738 ; BASIC: RUN
                                   2739 ; run BASIC program in RAM
                                   2740 ;----------------------------------- 
      00250A                       2741 run: 
      00A389 EE 01 72 A9 00   [ 2] 2742 	btjf flags,#FRUN,0$  
      00A38E 03               [ 1] 2743 	clr a 
      00A38F 6B               [ 4] 2744 	ret
      002511                       2745 0$: 
      00A390 03 1F 04 4D 2A   [ 2] 2746 	btjf flags,#FBREAK,1$
      002516                       2747 	_drop 2 
      00A395 0D 7B            [ 2]    1     addw sp,#2 
      00A397 06 1E 07         [ 4] 2748 	call rest_context
      00251B                       2749 	_drop CTXT_SIZE 
      00A39A 1D 00            [ 2]    1     addw sp,#CTXT_SIZE 
      00A39C 01 A2 00 6B      [ 1] 2750 	bres flags,#FBREAK 
      00A3A0 06 1F 07 22      [ 1] 2751 	bset flags,#FRUN 
      00A3A3 CC 16 DB         [ 2] 2752 	jp interpreter 
      00A3A3 CE 00 05         [ 2] 2753 1$:	ldw x,txtbgn
      00A3A6 1F 0D CE         [ 2] 2754 	cpw x,txtend 
      00A3A9 00 01            [ 1] 2755 	jrmi run_it 
      00A3AB 1F 0B 72         [ 2] 2756 	ldw x,#err_no_prog
      00A3AE 15 00 23         [ 4] 2757 	call puts 
      00A3B1 72 5C 00 20 81   [ 1] 2758 	mov in,count
      00A3B6 81               [ 4] 2759 	ret 
      00253C                       2760 run_it:	 
      00253C                       2761 	_drop 2 ; drop return address 
      00A3B6 72 5D            [ 2]    1     addw sp,#2 
      00253E                       2762 run_it_02: 
      00A3B8 00 20 26         [ 4] 2763     call ubound 
      00A3BB 03 CC 96         [ 4] 2764 	call clear_vars
                                   2765 ; initialize DIM variables pointers 
      00A3BE B0 00 1D         [ 2] 2766 	ldw x,txtend 
      00A3BF CF 00 30         [ 2] 2767 	ldw dvar_bgn,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      00A3BF A6 85 CD         [ 2] 2768 	ldw dvar_end,x 	 
                                   2769 ; clear data pointer 
      00A3C2 99               [ 1] 2770 	clrw x 
      00A3C3 D0 CD 98         [ 2] 2771 	ldw data_ptr,x 
      00A3C6 42 13 09 27      [ 1] 2772 	clr data_ofs 
      00A3CA 03 CC 96 B0      [ 1] 2773 	clr data_len 
                                   2774 ; initialize BASIC pointer 
      00A3CE CE 00 1B         [ 2] 2775 	ldw x,txtbgn 
      00A3CE CF 00 1A         [ 2] 2776 	ldw basicptr,x 
      00A3D1 F6 EE            [ 1] 2777 	ld a,(2,x)
      00A3D3 01 72 FB         [ 1] 2778 	ld count,a
      00A3D6 04 19 03 72      [ 1] 2779 	mov in,#3	
      00A3DA C7 00 1A 72      [ 1] 2780 	bset flags,#FRUN 
      00A3DE 5C 00 1B         [ 2] 2781 	jp interpreter 
                                   2782 
                                   2783 
                                   2784 ;----------------------
                                   2785 ; BASIC: END
                                   2786 ; end running program
                                   2787 ;---------------------- 
      00256F                       2788 cmd_end: 
                                   2789 ; clean stack 
      00A3E1 72 CF 00         [ 2] 2790 	ldw x,#STACK_EMPTY
      00A3E4 1A               [ 1] 2791 	ldw sp,x 
      00A3E5 C7 00 0D         [ 2] 2792 	jp warm_start
                                   2793 
                                   2794 ;---------------------------
                                   2795 ; BASIC: GET var 
                                   2796 ; receive a key in variable 
                                   2797 ; don't wait 
                                   2798 ;---------------------------
      002576                       2799 cmd_get:
      00A3E8 CF 00 0E         [ 4] 2800 	call next_token 
      00A3EB 7B 06            [ 1] 2801 	cp a,#TK_VAR 
      00A3ED 1E 07            [ 1] 2802 	jreq 0$
      00A3EF 72 B0 00         [ 2] 2803 	jp syntax_error 
      00A3F2 0E C2 00         [ 4] 2804 0$: call get_addr 
      00A3F5 0D 18 03         [ 2] 2805 	ldw ptr16,x 
      00A3F8 A8 80 2B         [ 4] 2806 	call qgetc 
      00A3FB 12 20            [ 1] 2807 	jreq 2$
      00A3FD 25 7B 03         [ 4] 2808 	call getc  
      00A400 2A 07 C6 00      [ 4] 2809 2$: clr [ptr16]
      00A404 0F 2F 07 20      [ 1] 2810 	inc ptr8 
      00A408 1A 3F 00 19      [ 4] 2811 	clr [ptr16]
      00A409 72 5C 00 1A      [ 1] 2812 	inc ptr8 
      00A409 72 0E 00 0F      [ 4] 2813 	ld [ptr16],a 
      00A40D 15               [ 4] 2814 	ret 
                                   2815 
                                   2816 
                                   2817 ;-----------------
                                   2818 ; 1 Khz beep 
                                   2819 ;-----------------
      00A40E                       2820 beep_1khz:: 
      00A40E 1E 0D            [ 2] 2821 	pushw y 
      00A410 CF 00 05         [ 2] 2822 	ldw x,#100
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A413 72 01 00 23      [ 2] 2823 	ldw y,#1000
      00A417 05 E6            [ 2] 2824 	jra beep
                                   2825 
                                   2826 ;-----------------------
                                   2827 ; BASIC: TONE expr1,expr2
                                   2828 ; used TIMER2 channel 1
                                   2829 ; to produce a tone 
                                   2830 ; arguments:
                                   2831 ;    expr1   frequency 
                                   2832 ;    expr2   duration msec.
                                   2833 ;---------------------------
      0025AE                       2834 tone:
      00A419 02 C7            [ 2] 2835 	pushw y 
      00A41B 00 04 1E         [ 4] 2836 	call arg_list 
      00A41E 0B CF            [ 1] 2837 	cp a,#2 
      00A420 00 01            [ 1] 2838 	jreq 1$
      00A422 81 16 30         [ 2] 2839 	jp syntax_error 
      00A423                       2840 1$: 
      0025BA                       2841 	_xpop 
      00A423 85 5B            [ 1]    1     ld a,(y)
      00A425 0D               [ 1]    2     ldw x,y 
      00A426 72 5A            [ 2]    3     ldw x,(1,x)
      00A428 00 20 FC 03      [ 2]    4     addw y,#CELL_SIZE 
      00A42B 89               [ 2] 2842 	pushw x ; duration 
      0025C4                       2843 	_xpop ; frequency
      00A42B CD 98            [ 1]    1     ld a,(y)
      00A42D 1A               [ 1]    2     ldw x,y 
      00A42E A1 84            [ 2]    3     ldw x,(1,x)
      00A430 27 07 A1 03      [ 2]    4     addw y,#CELL_SIZE 
      00A434 27 26            [ 1] 2844 	ldw y,x ; frequency 
      00A436 CC               [ 2] 2845 	popw x  ; duration 
      0025D0                       2846 beep:  
      00A437 96               [ 2] 2847 	pushw x 
      00A438 B0 F4 24         [ 2] 2848 	ldw x,#TIM2_CLK_FREQ
      00A439 65               [ 2] 2849 	divw x,y ; cntr=Fclk/freq 
                                   2850 ; round to nearest integer 
      00A439 90 89 CD 98      [ 2] 2851 	cpw y,#TIM2_CLK_FREQ/2
      00A43D 4C 4F            [ 1] 2852 	jrmi 2$
      00A43F 90               [ 1] 2853 	incw x 
      0025DC                       2854 2$:	 
      00A440 CE               [ 1] 2855 	ld a,xh 
      00A441 00 05 90         [ 1] 2856 	ld TIM2_ARRH,a 
      00A444 FE               [ 1] 2857 	ld a,xl 
      00A445 90 89 13         [ 1] 2858 	ld TIM2_ARRL,a 
                                   2859 ; 50% duty cycle 
      00A448 01               [ 1] 2860 	ccf 
      00A449 5B               [ 2] 2861 	rrcw x 
      00A44A 02               [ 1] 2862 	ld a,xh 
      00A44B 25 01 4C         [ 1] 2863 	ld TIM2_CCR1H,a 
      00A44E 9F               [ 1] 2864 	ld a,xl
      00A44E CD 8C 8F         [ 1] 2865 	ld TIM2_CCR1L,a
      00A451 5D 26 05 A6      [ 1] 2866 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A455 05 CC 96 B2      [ 1] 2867 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A459 90 85 81 04      [ 1] 2868 	bset TIM2_EGR,#TIM2_EGR_UG
      00A45C 85               [ 2] 2869 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A45C 90 89 89         [ 4] 2870 	call pause02
      00A45F CD 98 33 72      [ 1] 2871 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A463 5F 00 0E 90      [ 1] 2872 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A467 CE 00            [ 2] 2873 	popw y 
      00A469 1C               [ 4] 2874 	ret 
                                   2875 
                                   2876 ;-------------------------------
                                   2877 ; BASIC: ADCON 0|1 [,divisor]  
                                   2878 ; disable/enanble ADC 
                                   2879 ;-------------------------------
                           000003  2880 	ONOFF=3 
                           000001  2881 	DIVSOR=1
                           000004  2882 	VSIZE=4 
      002609                       2883 power_adc:
      00A46A 90 E6 03         [ 4] 2884 	call arg_list 
      00A46D A1 03            [ 1] 2885 	cp a,#2	
      00A46F 27 15            [ 1] 2886 	jreq 1$
      00A471 90 E6            [ 1] 2887 	cp a,#1 
      00A473 02 C7            [ 1] 2888 	jreq 0$ 
      00A475 00 0F 72         [ 2] 2889 	jp syntax_error 
      00A478 B9               [ 1] 2890 0$:	clr a 
      00A479 00               [ 1] 2891 	clrw x
      002619                       2892 	_xpush   ; divisor  
      00A47A 0E 90 C3 00      [ 2]    1     subw y,#CELL_SIZE
      00A47E 1E 25            [ 1]    2     ld (y),a 
      00A480 E9 A6 0A         [ 2]    3     ldw (1,y),x 
      002622                       2893 1$: _at_next 
      00A483 CC 96 B2         [ 1]    1     ld a,(3,y)
      00A486 93               [ 1]    2     ldw x,y 
      00A486 90 89            [ 2]    3     ldw x,(4,x)
      00A488 72               [ 2] 2894 	tnzw x 
      00A489 A9 00            [ 1] 2895 	jreq 2$ 
      00262B                       2896 	_xpop
      00A48B 04 1E            [ 1]    1     ld a,(y)
      00A48D 03               [ 1]    2     ldw x,y 
      00A48E CD 93            [ 2]    3     ldw x,(1,x)
      00A490 DB 26 04 90      [ 2]    4     addw y,#CELL_SIZE 
      002634                       2897 	_xdrop  
      00A494 85 20 DA 03      [ 2]    1     addw y,#CELL_SIZE 
      00A497 9F               [ 1] 2898 	ld a,xl
      00A497 85 5B            [ 1] 2899 	and a,#7
      00A499 02               [ 1] 2900 	swap a 
      00A49A 90 85 81         [ 1] 2901 	ld ADC_CR1,a
      00A49D 72 16 50 CA      [ 1] 2902 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A49D 72 00 00 23      [ 1] 2903 	bset ADC_CR1,#ADC_CR1_ADON 
      002647                       2904 	_usec_dly 7 
      00A4A1 05 A6 06         [ 2]    1     ldw x,#(16*7-2)/4
      00A4A4 CC               [ 2]    2     decw x
      00A4A5 96               [ 1]    3     nop 
      00A4A6 B2 CD            [ 1]    4     jrne .-4
      00A4A8 9B 26            [ 2] 2905 	jra 3$
      00A4AA A1 84 27 03      [ 1] 2906 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A4AE CC 96 B0 90      [ 1] 2907 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002658                       2908 3$:	
      00A4B2 F6               [ 4] 2909 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



                                   2910 
                                   2911 ;-----------------------------
                                   2912 ; BASIC: ADCREAD (channel)
                                   2913 ; read adc channel {0..5}
                                   2914 ; output:
                                   2915 ;   A 		TK_INTGR 
                                   2916 ;   X 		value 
                                   2917 ;-----------------------------
      002659                       2918 analog_read:
      00A4B3 93 EE 01         [ 4] 2919 	call func_args 
      00A4B6 72 A9            [ 1] 2920 	cp a,#1 
      00A4B8 00 03            [ 1] 2921 	jreq 1$
      00A4BA 9F 27 68         [ 2] 2922 	jp syntax_error
      002663                       2923 1$: _xpop 
      00A4BD 88 CD            [ 1]    1     ld a,(y)
      00A4BF 98               [ 1]    2     ldw x,y 
      00A4C0 1A A1            [ 2]    3     ldw x,(1,x)
      00A4C2 80 27 03 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A4C6 96 B0 FE         [ 2] 2924 	cpw x,#5 
      00A4C9 72 5C            [ 2] 2925 	jrule 2$
      00A4CB 00 02            [ 1] 2926 	ld a,#ERR_BAD_VALUE
      00A4CD 72 5C 00         [ 2] 2927 	jp tb_error 
      00A4D0 02               [ 1] 2928 2$: ld a,xl
      00A4D1 A3 A5 2F         [ 1] 2929 	ld acc8,a 
      00A4D4 27 08            [ 1] 2930 	ld a,#5
      00A4D6 A3 A5 49         [ 1] 2931 	sub a,acc8 
      00A4D9 27 03 CC         [ 1] 2932 	ld ADC_CSR,a
      00A4DC 96 B0 54 02      [ 1] 2933 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A4DE 72 10 54 01      [ 1] 2934 	bset ADC_CR1,#ADC_CR1_ADON
      00A4DE 84 89 88 00 FB   [ 2] 2935 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A4E1 CE 54 04         [ 2] 2936 	ldw x,ADC_DRH
      00A4E1 0A 01            [ 1] 2937 	ld a,#TK_INTGR
      00A4E3 27               [ 4] 2938 	ret 
                                   2939 
                                   2940 ;-----------------------
                                   2941 ; BASIC: DREAD(pin)
                                   2942 ; Arduino pins 
                                   2943 ; read state of a digital pin 
                                   2944 ; pin# {0..15}
                                   2945 ; output:
                                   2946 ;    A 		TK_INTGR
                                   2947 ;    X      0|1 
                                   2948 ;-------------------------
                           000001  2949 	PINNO=1
                           000001  2950 	VSIZE=1
      002695                       2951 digital_read:
      002695                       2952 	_vars VSIZE 
      00A4E4 26 CD            [ 2]    1     sub sp,#VSIZE 
      00A4E6 98 1A A1         [ 4] 2953 	call func_args
      00A4E9 84 27            [ 1] 2954 	cp a,#1
      00A4EB 07 A1            [ 1] 2955 	jreq 1$
      00A4ED 03 27 0D         [ 2] 2956 	jp syntax_error
      0026A1                       2957 1$: _xpop 
      00A4F0 CC 96            [ 1]    1     ld a,(y)
      00A4F2 B0               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A4F3 EE 01            [ 2]    3     ldw x,(1,x)
      00A4F3 C6 00 02 AB      [ 2]    4     addw y,#CELL_SIZE 
      00A4F7 03 C7 00         [ 2] 2958 	cpw x,#15 
      00A4FA 02 20            [ 2] 2959 	jrule 2$
      00A4FC 03 CD            [ 1] 2960 	ld a,#ERR_BAD_VALUE
      00A4FE 98 33 32         [ 2] 2961 	jp tb_error 
      00A500 CD 2B 7F         [ 4] 2962 2$:	call select_pin 
      00A500 CD 98            [ 1] 2963 	ld (PINNO,sp),a
      00A502 1A A1            [ 1] 2964 	ld a,(GPIO_IDR,x)
      00A504 08 27            [ 1] 2965 	tnz (PINNO,sp)
      00A506 DA 5B            [ 1] 2966 	jreq 8$
      00A508 03               [ 1] 2967 3$: srl a 
      00A509 20 1A            [ 1] 2968 	dec (PINNO,sp)
      00A50B 26 FB            [ 1] 2969 	jrne 3$ 
      00A50B 5B 01            [ 1] 2970 8$: and a,#1 
      00A50D CD               [ 1] 2971 	clrw x 
      00A50E A4               [ 1] 2972 	ld xl,a 
      00A50F 2B               [ 1] 2973 	clr a 
      0026C9                       2974 	_drop VSIZE
      00A510 CF 00            [ 2]    1     addw sp,#VSIZE 
      00A512 1A               [ 4] 2975 	ret
                                   2976 
                                   2977 
                                   2978 ;-----------------------
                                   2979 ; BASIC: DWRITE pin,0|1
                                   2980 ; Arduino pins 
                                   2981 ; write to a digital pin 
                                   2982 ; pin# {0..15}
                                   2983 ; output:
                                   2984 ;    A 		TK_INTGR
                                   2985 ;    X      0|1 
                                   2986 ;-------------------------
                           000001  2987 	PINNO=1
                           000002  2988 	PINVAL=2
                           000002  2989 	VSIZE=2
      0026CC                       2990 digital_write:
      0026CC                       2991 	_vars VSIZE 
      00A513 55 00            [ 2]    1     sub sp,#VSIZE 
      00A515 04 00 02         [ 4] 2992 	call arg_list  
      00A518 85 A3            [ 1] 2993 	cp a,#2 
      00A51A A5 2F            [ 1] 2994 	jreq 1$
      00A51C 26 05 CE         [ 2] 2995 	jp syntax_error
      0026D8                       2996 1$: _xpop 
      00A51F 00 1A            [ 1]    1     ld a,(y)
      00A521 20               [ 1]    2     ldw x,y 
      00A522 19 01            [ 2]    3     ldw x,(1,x)
      00A523 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A523 20               [ 1] 2997 	ld a,xl 
      00A524 35 02            [ 1] 2998 	ld (PINVAL,sp),a
      00A525                       2999 	_xpop 
      00A525 55 00            [ 1]    1     ld a,(y)
      00A527 04               [ 1]    2     ldw x,y 
      00A528 00 02            [ 2]    3     ldw x,(1,x)
      00A52A 5B 02 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A52E 63 00 0F         [ 2] 3000 	cpw x,#15 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A52F 23 05            [ 2] 3001 	jrule 2$
      00A52F 72 00            [ 1] 3002 	ld a,#ERR_BAD_VALUE
      00A531 00 23 05         [ 2] 3003 	jp tb_error 
      00A534 A6 06 CC         [ 4] 3004 2$:	call select_pin 
      00A537 96 B2            [ 1] 3005 	ld (PINNO,sp),a 
      00A539 A6 01            [ 1] 3006 	ld a,#1
      00A539 CD A4            [ 1] 3007 	tnz (PINNO,sp)
      00A53B 2B 05            [ 1] 3008 	jreq 4$
      00A53C 48               [ 1] 3009 3$: sll a
      00A53C CF 00            [ 1] 3010 	dec (PINNO,sp)
      00A53E 05 E6            [ 1] 3011 	jrne 3$
      00A540 02 C7            [ 1] 3012 4$: tnz (PINVAL,sp)
      00A542 00 04            [ 1] 3013 	jrne 5$
      00A544 35               [ 1] 3014 	cpl a 
      00A545 03 00            [ 1] 3015 	and a,(GPIO_ODR,x)
      00A547 02 81            [ 2] 3016 	jra 8$
      00A549 EA 00            [ 1] 3017 5$: or a,(GPIO_ODR,x)
      00A549 72 00            [ 1] 3018 8$: ld (GPIO_ODR,x),a 
      002714                       3019 	_drop VSIZE 
      00A54B 00 23            [ 2]    1     addw sp,#VSIZE 
      00A54D 06               [ 4] 3020 	ret
                                   3021 
                                   3022 
                                   3023 ;-----------------------
                                   3024 ; BASIC: STOP
                                   3025 ; stop progam execution  
                                   3026 ; without resetting pointers 
                                   3027 ; the program is resumed
                                   3028 ; with RUN 
                                   3029 ;-------------------------
      002717                       3030 stop:
      00A54E A6 06 CC 96 B2   [ 2] 3031 	btjt flags,#FRUN,2$
      00A553 81               [ 1] 3032 	clr a
      00A554 81               [ 4] 3033 	ret 
      00271E                       3034 2$:	 
                                   3035 ; create space on cstack to save context 
      00A554 CD A4 2B         [ 2] 3036 	ldw x,#break_point 
      00A557 CF 00 1A         [ 4] 3037 	call puts 
      00A55A                       3038 	_drop 2 ;drop return address 
      00A55A 85 52            [ 2]    1     addw sp,#2 
      002726                       3039 	_vars CTXT_SIZE ; context size 
      00A55C 04 89            [ 2]    1     sub sp,#CTXT_SIZE 
      00A55E CE 00 05         [ 4] 3040 	call save_context 
      00A561 1F 03 CE         [ 2] 3041 	ldw x,#tib 
      00A564 00 01 1F         [ 2] 3042 	ldw basicptr,x
      00A567 05               [ 1] 3043 	clr (x)
      00A568 CE 00 1A 20      [ 1] 3044 	clr count  
      00A56C CF               [ 1] 3045 	clrw x 
      00A56D CF 00 00         [ 2] 3046 	ldw in.w,x
      00A56D 72 00 00 23      [ 1] 3047 	bres flags,#FRUN 
      00A571 05 A6 06 CC      [ 1] 3048 	bset flags,#FBREAK
      00A575 96 B2 DB         [ 2] 3049 	jp interpreter 
      00A577 0A 62 72 65 61 6B 20  3050 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



             72 65 73 75 6D 65 2E
             0A 00
                                   3051 
                                   3052 ;-----------------------
                                   3053 ; BASIC: NEW
                                   3054 ; from command line only 
                                   3055 ; free program memory
                                   3056 ; and clear variables 
                                   3057 ;------------------------
      002763                       3058 new: 
      00A577 1E 03 CF 00 05   [ 2] 3059 	btjf flags,#FRUN,0$ 
      00A57C E6               [ 4] 3060 	ret 
      002769                       3061 0$:	
      00A57D 02 C7 00         [ 4] 3062 	call clear_basic 
      00A580 04               [ 4] 3063 	ret 
                                   3064 
                                   3065 ;-----------------------------------
                                   3066 ; BASIC: ERASE \E | \F 
                                   3067 ; erase all block in range from 
                                   3068 ;  'app_space' to FLASH end (0x20000)
                                   3069 ;  or all EEPROM 
                                   3070 ; that contains a non zero byte.  
                                   3071 ;-----------------------------------
                           000001  3072 	LIMIT=1 
                           000003  3073 	VSIZE = 3 
      00276D                       3074 erase:
      00A581 1E 05 CF 00      [ 1] 3075 	clr farptr 
      002771                       3076 	_vars VSIZE 
      00A585 01 85            [ 2]    1     sub sp,#VSIZE 
      00A587 5B 04 FC         [ 4] 3077 	call next_token 
      00A58A A1 04            [ 1] 3078 	cp a,#TK_CHAR 
      00A58A 72 01            [ 1] 3079 	jreq 0$ 
      00A58C 00 23 02         [ 2] 3080 	jp syntax_error
      00A58F 4F 81 DC         [ 4] 3081 0$: call get_char 
      00A591 A4 DF            [ 1] 3082 	and a,#0XDF 
      00A591 72 09            [ 1] 3083 	cp a,#'E
      00A593 00 23            [ 1] 3084 	jrne 1$
      00A595 12 5B 02         [ 2] 3085 	ldw x,#EEPROM_BASE 
      00A598 CD A1 0F         [ 2] 3086 	ldw farptr+1,x 
      00A59B 5B 04 72         [ 2] 3087 	ldw x,#EEPROM_END
      00A59E 19               [ 1] 3088 	clr a 
      00A59F 00 23            [ 2] 3089 	jra 3$ 
      00A5A1 72 10            [ 1] 3090 1$: cp a,#'F 
      00A5A3 00 23            [ 1] 3091 	jreq 2$
      00A5A5 CC 97 5B         [ 2] 3092 	ldw x,#err_bad_value
      00A5A8 CE 00 1C         [ 2] 3093 	jp tb_error
      00279C                       3094 2$:
      00A5AB C3 00 1E         [ 2] 3095 	ldw x,#app_space  
      00A5AE 2B 0C AE         [ 2] 3096 	ldw farptr+1,x 
      00A5B1 96 23            [ 1] 3097 	ld a,#(FLASH_END>>16)&0XFF 
      00A5B3 CD 89 B2         [ 2] 3098 	ldw x,#FLASH_END&0xffff
      0027A7                       3099 3$:
      00A5B6 55 00            [ 1] 3100 	ld (LIMIT,sp),a 
      00A5B8 04 00            [ 2] 3101 	ldw (LIMIT+1,sp),x 
                                   3102  ; operation done from RAM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   3103  ; copy code to RAM in tib   
      00A5BA 02 81 D3         [ 4] 3104 	call move_erase_to_ram
      00A5BC                       3105 4$:	 
      00A5BC 5B 02 55         [ 4] 3106     call scan_block 
      00A5BE 27 08            [ 1] 3107 	jreq 5$  ; block already erased 
      00A5BE CD 9C            [ 1] 3108     ld a,#'E 
      00A5C0 F3 CD 94         [ 4] 3109     call putc 
      00A5C3 40 CE 00         [ 4] 3110 	call block_erase   
                                   3111 ; this block is clean, next  
      00A5C6 1E CF 00         [ 2] 3112 5$:	ldw x,#BLOCK_SIZE
      00A5C9 31 CF 00         [ 4] 3113 	call incr_farptr
                                   3114 ; check limit, 24 bit substraction  	
      00A5CC 33 5F            [ 1] 3115 	ld a,(LIMIT,sp)
      00A5CE CF 00            [ 2] 3116 	ldw x,(LIMIT+1,sp)
      00A5D0 07 72 5F 00      [ 2] 3117 	subw x,farptr+1
      00A5D4 09 72 5F         [ 1] 3118 	sbc a,farptr 
      00A5D7 00 0A            [ 1] 3119 	jrugt 4$ 
      00A5D9 CE 00 1C         [ 4] 3120 9$: call clear_basic
      00A5DC CF 00            [ 2] 3121 	ldw x,(LIMIT+1,sp)
      00A5DE 05 E6 02         [ 2] 3122 	cpw x,#EEPROM_END
      00A5E1 C7 00            [ 1] 3123 	jrne 10$
      00A5E3 04 35 03         [ 4] 3124 	call func_eefree 
      0027DB                       3125 10$:
      0027DB                       3126 	_drop VSIZE 
      00A5E6 00 02            [ 2]    1     addw sp,#VSIZE 
      00A5E8 72               [ 4] 3127 	ret 
                                   3128 	
                                   3129 
                                   3130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3131 ;  check for application signature 
                                   3132 ; output:
                                   3133 ;   Carry    0 app present 
                                   3134 ;            1 no app installed  
                                   3135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027DE                       3136 qsign: 
      00A5E9 10 00 23         [ 2] 3137 	ldw x,app_sign 
      00A5EC CC 97 5B         [ 2] 3138 	cpw x,SIGNATURE ; "TB" 
      00A5EF 81               [ 4] 3139 	ret 
                                   3140 
                                   3141 ;--------------------------------------
                                   3142 ;  fill write buffer 
                                   3143 ;  input:
                                   3144 ;    y  point to output buffer 
                                   3145 ;    x  point to source 
                                   3146 ;    a  bytes to write in buffer 
                                   3147 ;  output:
                                   3148 ;    y   += A 
                                   3149 ;    X   += A 
                                   3150 ;    A   0 
                                   3151 ;---------------------------------------
      0027E5                       3152 fill_write_buffer:
      00A5EF AE               [ 1] 3153 	push a 
      00A5F0 17               [ 1] 3154 	tnz a 
      00A5F1 FF 94            [ 1] 3155 	jreq 9$ 
      00A5F3 CC               [ 1] 3156 1$: ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A5F4 97               [ 1] 3157 	incw x 
      00A5F5 3C F7            [ 1] 3158 	ld (y),a 
      00A5F6 90 5C            [ 1] 3159 	incw y 
      00A5F6 CD 98            [ 1] 3160 	dec (1,sp) 
      00A5F8 1A A1            [ 1] 3161 	jrne 1$ 
      00A5FA 85               [ 1] 3162 9$:	pop a 
      00A5FB 27               [ 4] 3163     ret 	
                                   3164 
                                   3165 ;--------------------------------------
                                   3166 ;  fill pad buffer with zero 
                                   3167 ;  input:
                                   3168 ;	none 
                                   3169 ;  output:
                                   3170 ;    y     buffer address  
                                   3171 ;--------------------------------------
      0027F5                       3172 clear_block_buffer:
      00A5FC 03               [ 1] 3173 	push a 
      00A5FD CC 96 B0 CD      [ 2] 3174 	ldw y,#block_buffer 
      00A601 98 42            [ 2] 3175 	pushw y
      00A603 CF 00            [ 1] 3176 	ld a,#BLOCK_SIZE   
      00A605 1A CD            [ 1] 3177 1$:	clr (y)
      00A607 89 5E            [ 1] 3178 	incw y
      00A609 27               [ 1] 3179 	dec a  
      00A60A 03 CD            [ 1] 3180 	jrne 1$ 	
      00A60C 89 65            [ 2] 3181 9$: popw y 
      00A60E 72               [ 1] 3182 	pop a 			
      00A60F 3F               [ 4] 3183 	ret 
                                   3184 
                                   3185 
                                   3186 ;---------------------------------------
                                   3187 ; BASIC: SAVE
                                   3188 ; write application from RAM to FLASH
                                   3189 ; at UFLASH address
                                   3190 ;--------------------------------------
                           000001  3191 	XTEMP=1
                           000003  3192 	COUNT=3  ; last count bytes written 
                           000004  3193 	CNT_LO=4 ; count low byte 
                           000005  3194 	TOWRITE=5 ; how bytes left to write  
                           000006  3195 	VSIZE=6 
      002809                       3196 save_app:
      00A610 00               [ 2] 3197 	pushw x 
      00A611 1A 72            [ 2] 3198 	pushw y 
      00280C                       3199 	_vars VSIZE
      00A613 5C 00            [ 2]    1     sub sp,#VSIZE 
      00A615 1B 72 3F         [ 4] 3200 	call qsign 
      00A618 00 1A            [ 1] 3201 	jrne 1$
      00A61A 72 5C 00         [ 2] 3202 	ldw x,#CANT_DO 
      00A61D 1B 72 C7         [ 4] 3203 	call puts 
      00A620 00 1A 81         [ 2] 3204 	jp 9$
      00A623                       3205 1$: 
      00A623 90 89 AE         [ 2] 3206 	ldw x,txtbgn
      00A626 00 64 90         [ 2] 3207 	cpw x,txtend 
      00A629 AE 03            [ 1] 3208 	jrult 2$ 
      00A62B E8 20 22         [ 2] 3209 	ldw x,#NO_APP
      00A62E CD 09 32         [ 4] 3210 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A62E 90 89 CD         [ 2] 3211 	jp 9$
      00282D                       3212 2$: 
                                   3213 ; block programming flash
                                   3214 ; must be done from RAM
                                   3215 ; moved in tib  
      00A631 99 E2 A1         [ 4] 3216 	call move_prg_to_ram
                                   3217 ; initialize farptr 
                                   3218 ; to app_sign address 
      00A634 02 27 03 CC      [ 1] 3219 	clr farptr 
      00A638 96 B0 00         [ 2] 3220 	ldw x,#app_sign 
      00A63A CF 00 19         [ 2] 3221 	ldw farptr+1,x
                                   3222 ; initialize local variables 
      00A63A 90 F6 93         [ 4] 3223 	call prog_size
      00A63D EE 01            [ 2] 3224 	ldw (TOWRITE,sp),x
      00A63F 72 A9            [ 1] 3225 	clr (COUNT,sp)
                                   3226 ; first bock 
                                   3227 ; containt signature 2 bytes 
                                   3228 ; and size 	2 bytes 
                                   3229 ; use Y as pointer to block_buffer
      00A641 00 03 89         [ 4] 3230 	call clear_block_buffer ; -- y=*block_buffer	
                                   3231 ; write signature
      00A644 90 F6 93         [ 2] 3232 	ldw x,SIGNATURE ; "BC" 
      00A647 EE 01            [ 2] 3233 	ldw (y),x 
      00A649 72 A9 00 03      [ 2] 3234 	addw y,#2
      00A64D 90 93            [ 2] 3235 	ldw x,(TOWRITE,sp)
      00A64F 85 FF            [ 2] 3236 	ldw (y),x
      00A650 72 A9 00 02      [ 2] 3237 	addw y,#2   
      00A650 89 AE            [ 1] 3238 	ld a,#(BLOCK_SIZE-4)
      00A652 F4 24            [ 1] 3239 	ld (CNT_LO,sp),a 
      00A654 65 90 A3         [ 2] 3240 	cpw x,#(BLOCK_SIZE-4) 
      00A657 7A 12            [ 1] 3241 	jrugt 3$
      00A659 2B               [ 1] 3242 	ld a,xl 
      00A65A 01 5C            [ 1] 3243 3$:	ld (CNT_LO,sp),a   
      00A65C CE 00 1B         [ 2] 3244 	ldw x,txtbgn 
      00A65C 9E C7            [ 2] 3245 	ldw (XTEMP,sp),x 
      002866                       3246 32$: 
      00A65E 53 0D            [ 2] 3247 	ldw x,(XTEMP,sp)
      00A660 9F C7            [ 1] 3248 	ld a,(CNT_LO,sp)
      00A662 53 0E 8C         [ 4] 3249 	call fill_write_buffer 
      00A665 56 9E            [ 2] 3250 	ldw (XTEMP,sp),x 
      00A667 C7 53 0F         [ 2] 3251 	ldw x,#block_buffer
      00A66A 9F C7 53         [ 4] 3252 	call write_buffer
      00A66D 10 72 10         [ 2] 3253 	ldw x,#BLOCK_SIZE 
      00A670 53 08 72         [ 4] 3254 	call incr_farptr  
                                   3255 ; following blocks 
      00A673 10 53            [ 2] 3256 	ldw x,(XTEMP,sp)
      00A675 00 72 10         [ 2] 3257 	cpw x,txtend 
      00A678 53 04            [ 1] 3258 	jruge 9$ 
      00A67A 85 CD            [ 2] 3259 	ldw x,(TOWRITE,sp)
      00A67C AA BC 72         [ 2] 3260 	subw x,(COUNT,sp)
      00A67F 11 53            [ 2] 3261 	ldw (TOWRITE,sp),x 
      00A681 08 72            [ 1] 3262 	ld a,#BLOCK_SIZE 
      00A683 11 53 00         [ 2] 3263 	cpw x,#BLOCK_SIZE 
      00A686 90 85            [ 1] 3264 	jruge 4$ 
      00A688 81               [ 1] 3265 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A689 6B 04            [ 1] 3266 4$:	ld (CNT_LO,sp),a 
      00A689 CD 99 E2         [ 4] 3267 	call clear_block_buffer 
      00A68C A1 02            [ 2] 3268 	jra 32$ 
      002898                       3269 9$:	_drop VSIZE 
      00A68E 27 12            [ 2]    1     addw sp,#VSIZE 
      00A690 A1 01            [ 2] 3270     popw y 
      00A692 27               [ 2] 3271 	popw x 
      00A693 03               [ 4] 3272 	ret 
                                   3273 
                                   3274 
      00A694 CC 96                 3275 SIGNATURE: .ascii "TB"
      00A696 B0 4F 5F 72 A2 00 03  3276 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             90 F7 90 EF 01 90 E6
             03 93 EE 04 5D 27 25
             90 F6 93 EE 01 72 A9
             00 03 72 A9 00 03 9F
             A4 07 4E C7 54 01 72
             16 50 CA 72 10 54 01
             AE 00 1B 5A 9D 26 FA
             20 08 72 11 54 01 72
             17 50 CA
      00A6D8 4E 6F 20 61 70 70 6C  3277 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3278 
                                   3279 ;---------------------
                                   3280 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3281 ; write 1 or more byte to FLASH or EEPROM
                                   3282 ; starting at address  
                                   3283 ; input:
                                   3284 ;   expr1  	is address 
                                   3285 ;   expr2,...,exprn   are bytes to write
                                   3286 ; output:
                                   3287 ;   none 
                                   3288 ;---------------------
      0028F8                       3289 write:
      00A6D8 81 1A A6         [ 4] 3290 	call expression
      00A6D9 A1 84            [ 1] 3291 	cp a,#TK_INTGR 
      00A6D9 CD 99            [ 1] 3292 	jreq 0$
      00A6DB DD A1 01         [ 2] 3293 	jp syntax_error
      002902                       3294 0$: _xpop 
      00A6DE 27 03            [ 1]    1     ld a,(y)
      00A6E0 CC               [ 1]    2     ldw x,y 
      00A6E1 96 B0            [ 2]    3     ldw x,(1,x)
      00A6E3 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A6E7 01 72 A9         [ 1] 3295 	ld farptr,a 
      00A6EA 00 03 A3         [ 2] 3296 	ldw ptr16,x 
      002911                       3297 1$:	
      00A6ED 00 05 23         [ 4] 3298 	call next_token 
      00A6F0 05 A6            [ 1] 3299 	cp a,#TK_COMMA 
      00A6F2 0A CC            [ 1] 3300 	jreq 2$ 
      00A6F4 96 B2            [ 2] 3301 	jra 9$ ; no more data 
      00A6F6 9F C7 00         [ 4] 3302 2$:	call expression
      00A6F9 0F A6            [ 1] 3303 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A6FB 05 C0            [ 1] 3304 	jreq 3$
      00A6FD 00 0F C7         [ 2] 3305 	jp syntax_error
      002924                       3306 3$:	_xpop 
      00A700 54 00            [ 1]    1     ld a,(y)
      00A702 72               [ 1]    2     ldw x,y 
      00A703 16 54            [ 2]    3     ldw x,(1,x)
      00A705 02 72 10 54      [ 2]    4     addw y,#CELL_SIZE 
      00A709 01               [ 1] 3307 	ld a,xl 
      00A70A 72               [ 1] 3308 	clrw x 
      00A70B 0F 54 00         [ 4] 3309 	call write_byte
      00A70E FB CE 54         [ 2] 3310 	ldw x,#1 
      00A711 04 A6 84         [ 4] 3311 	call incr_farptr 
      00A714 81 D7            [ 2] 3312 	jra 1$ 
      00A715                       3313 9$:
      00A715 52               [ 4] 3314 	ret 
                                   3315 
                                   3316 
                                   3317 ;---------------------
                                   3318 ;BASIC: CHAR(expr)
                                   3319 ; évaluate expression 
                                   3320 ; and take the 7 least 
                                   3321 ; bits as ASCII character
                                   3322 ; output: 
                                   3323 ; 	A char 
                                   3324 ;---------------------
      00293B                       3325 func_char:
      00A716 01 CD 99         [ 4] 3326 	call func_args 
      00A719 DD A1            [ 1] 3327 	cp a,#1
      00A71B 01 27            [ 1] 3328 	jreq 1$
      00A71D 03 CC 96         [ 2] 3329 	jp syntax_error
      002945                       3330 1$:	_xpop
      00A720 B0 90            [ 1]    1     ld a,(y)
      00A722 F6               [ 1]    2     ldw x,y 
      00A723 93 EE            [ 2]    3     ldw x,(1,x)
      00A725 01 72 A9 00      [ 2]    4     addw y,#CELL_SIZE 
      00A729 03               [ 1] 3331 	ld a,xl
      00A72A A3 00            [ 1] 3332 	and a,#0x7f 
      00A72C 0F               [ 4] 3333 	ret
                                   3334 
                                   3335 ;---------------------
                                   3336 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3337 ; extract first character 
                                   3338 ; of string argument 
                                   3339 ; output:
                                   3340 ;    A:X    int24 
                                   3341 ;---------------------
      002952                       3342 ascii:
      00A72D 23 05            [ 1] 3343 	ld a,#TK_LPAREN
      00A72F A6 0A CC         [ 4] 3344 	call expect 
      00A732 96 B2 CD         [ 4] 3345 	call next_token 
      00A735 AB FF            [ 1] 3346 	cp a,#TK_QSTR 
      00A737 6B 01            [ 1] 3347 	jreq 1$
      00A739 E6 01            [ 1] 3348 	cp a,#TK_CHAR 
      00A73B 0D 01            [ 1] 3349 	jreq 2$ 
      00A73D 27 05            [ 1] 3350 	cp a,#TK_CFUNC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A73F 44 0A            [ 1] 3351 	jreq 0$
      00A741 01 26 FB         [ 2] 3352 	jp syntax_error
      002969                       3353 0$: ; cfunc 
      00A744 A4               [ 4] 3354 	call (x)
      00A745 01 5F            [ 2] 3355 	jra 3$
      00296C                       3356 1$: ; quoted string 
      00A747 97               [ 1] 3357 	ld a,(x)
      00A748 4F               [ 1] 3358 	push a  
      00A749 5B 01 81         [ 4] 3359 	call skip_string
      00A74C 84               [ 1] 3360 	pop a  	
      00A74C 52 02            [ 2] 3361 	jra 3$ 
      002974                       3362 2$: ; character 
      00A74E CD 99 E2         [ 4] 3363 	call get_char 
      00A751 A1               [ 1] 3364 3$:	clrw x 
      00A752 02               [ 1] 3365 	rlwa x   
      002979                       3366 4$:	_xpush  
      00A753 27 03 CC 96      [ 2]    1     subw y,#CELL_SIZE
      00A757 B0 90            [ 1]    2     ld (y),a 
      00A759 F6 93 EE         [ 2]    3     ldw (1,y),x 
      00A75C 01 72            [ 1] 3367 	ld a,#TK_RPAREN 
      00A75E A9 00 03         [ 4] 3368 	call expect
      002987                       3369 9$:	
      002987                       3370 	_xpop  
      00A761 9F 6B            [ 1]    1     ld a,(y)
      00A763 02               [ 1]    2     ldw x,y 
      00A764 90 F6            [ 2]    3     ldw x,(1,x)
      00A766 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A76A A9               [ 4] 3371 	ret 
                                   3372 
                                   3373 ;---------------------
                                   3374 ;BASIC: KEY
                                   3375 ; wait for a character 
                                   3376 ; received from STDIN 
                                   3377 ; input:
                                   3378 ;	none 
                                   3379 ; output:
                                   3380 ;	a	 character 
                                   3381 ;---------------------
      002991                       3382 key:
      00A76B 00 03 A3         [ 4] 3383 	call getc 
      00A76E 00               [ 4] 3384 	ret
                                   3385 
                                   3386 ;----------------------
                                   3387 ; BASIC: QKEY
                                   3388 ; Return true if there 
                                   3389 ; is a character in 
                                   3390 ; waiting in STDIN 
                                   3391 ; input:
                                   3392 ;  none 
                                   3393 ; output:
                                   3394 ;   A     0|-1
                                   3395 ;-----------------------
      002995                       3396 qkey:: 
      00A76F 0F               [ 1] 3397 	clrw x 
      00A770 23 05 A6         [ 1] 3398 	ld a,rx1_head
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A773 0A CC 96         [ 1] 3399 	sub a,rx1_tail 
      00A776 B2 CD            [ 1] 3400 	jreq 9$ 
      00A778 AB               [ 2] 3401 	cplw x
      00A779 FF 6B            [ 1] 3402 	ld a,#255    
      0029A1                       3403 9$: 
      00A77B 01               [ 4] 3404 	ret 
                                   3405 
                                   3406 ;---------------------
                                   3407 ; BASIC: GPIO(port,reg)
                                   3408 ; return gpio register address 
                                   3409 ; expr {PORTA..PORTI}
                                   3410 ; input:
                                   3411 ;   none 
                                   3412 ; output:
                                   3413 ;   A:X 	gpio register address
                                   3414 ;----------------------------
                                   3415 ;	N=PORT
                                   3416 ;	T=REG 
      0029A2                       3417 gpio:
      00A77C A6 01 0D         [ 4] 3418 	call func_args 
      00A77F 01 27            [ 1] 3419 	cp a,#2
      00A781 05 48            [ 1] 3420 	jreq 1$
      00A783 0A 01 26         [ 2] 3421 	jp syntax_error  
      0029AC                       3422 1$:	_at_next 
      00A786 FB 0D 02         [ 1]    1     ld a,(3,y)
      00A789 26               [ 1]    2     ldw x,y 
      00A78A 05 43            [ 2]    3     ldw x,(4,x)
      00A78C E4 00 20         [ 2] 3423 	cpw x,#PA_BASE 
      00A78F 02 EA            [ 1] 3424 	jrmi bad_port
      00A791 00 E7 00         [ 2] 3425 	cpw x,#PI_BASE+1 
      00A794 5B 02            [ 1] 3426 	jrpl bad_port
      00A796 81               [ 2] 3427 	pushw x 
      00A797                       3428 	_xpop
      00A797 72 00            [ 1]    1     ld a,(y)
      00A799 00               [ 1]    2     ldw x,y 
      00A79A 23 02            [ 2]    3     ldw x,(1,x)
      00A79C 4F 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A79E 72 FB 01         [ 2] 3429 	addw x,(1,sp)
      0029C9                       3430 	_drop 2 
      00A79E AE A7            [ 2]    1     addw sp,#2 
      00A7A0 C5               [ 1] 3431 	clr a 
      00A7A1 CD               [ 4] 3432 	ret
      0029CD                       3433 bad_port:
      00A7A2 89 B2            [ 1] 3434 	ld a,#ERR_BAD_VALUE
      00A7A4 5B 02 52         [ 2] 3435 	jp tb_error
                                   3436 
                                   3437 
                                   3438 ;-------------------------
                                   3439 ; BASIC: UFLASH 
                                   3440 ; return free flash address
                                   3441 ; align to BLOCK address 
                                   3442 ; input:
                                   3443 ;  none 
                                   3444 ; output:
                                   3445 ;	A		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3446 ;   xstack	free address 
                                   3447 ;---------------------------
      0029D2                       3448 uflash:
      00A7A7 04 CD A0         [ 4] 3449 	call qsign 
      00A7AA FF AE            [ 1] 3450 	jrne 1$
      00A7AC 16 90 CF         [ 2] 3451 	ldw x,#app_space 
      00A7AF 00 05 7F 72      [ 2] 3452 	addw x,app_size 
      00A7B3 5F 00 04         [ 2] 3453 	addw x,#4
                                   3454 ; align on 128 bytes block 
      00A7B6 5F CF 00         [ 2] 3455 	addw x,#BLOCK_SIZE 
      00A7B9 01               [ 1] 3456 	ld a,xl 
      00A7BA 72 11            [ 1] 3457 	and a,#0x80 
      00A7BC 00               [ 1] 3458 	ld xl,a 
      00A7BD 23 72            [ 2] 3459 	jra 2$
      00A7BF 18 00 23         [ 2] 3460 1$:	ldw x,#app_space 
      0029ED                       3461 2$:
      00A7C2 CC               [ 1] 3462 	clr a 
      00A7C3 97               [ 4] 3463 	ret 
                                   3464 
                                   3465 
                                   3466 ;---------------------
                                   3467 ; BASIC: USR(addr,arg)
                                   3468 ; execute a function written 
                                   3469 ; in binary code.
                                   3470 ; input:
                                   3471 ;   addr	routine address 
                                   3472 ;   arg 	is an argument
                                   3473 ;           it can be ignore 
                                   3474 ;           by cally. 
                                   3475 ; output:
                                   3476 ;   xstack 	value returned by cally  
                                   3477 ;---------------------
      0029EF                       3478 usr:
      00A7C4 5B 0A 62         [ 4] 3479 	call func_args 
      00A7C7 72 65            [ 1] 3480 	cp a,#2
      00A7C9 61 6B            [ 1] 3481 	jreq 1$  
      00A7CB 20 70 6F         [ 2] 3482 	jp syntax_error 
      0029F9                       3483 1$: 
      0029F9                       3484 	_at_next ; A:X addr 
      00A7CE 69 6E 74         [ 1]    1     ld a,(3,y)
      00A7D1 2C               [ 1]    2     ldw x,y 
      00A7D2 20 52            [ 2]    3     ldw x,(4,x)
      00A7D4 55 4E 20         [ 2] 3485 	ldw ptr16,X 
      002A02                       3486 	_xpop  ; arg 
      00A7D7 74 6F            [ 1]    1     ld a,(y)
      00A7D9 20               [ 1]    2     ldw x,y 
      00A7DA 72 65            [ 2]    3     ldw x,(1,x)
      00A7DC 73 75 6D 65      [ 2]    4     addw y,#CELL_SIZE 
      002A0B                       3487 	_store_top ; overwrite addr 
      00A7E0 2E 0A            [ 1]    1     ld (y),a 
      00A7E2 00 EF 01         [ 2]    2     ldw (1,y),x     
      00A7E3 72 CD 00 19      [ 6] 3488     call [ptr16]
      00A7E3 72               [ 4] 3489 	ret 
                                   3490 
                                   3491 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3492 ;------------------------------
                                   3493 ; BASIC: BYE 
                                   3494 ; halt mcu in its lowest power mode 
                                   3495 ; wait for reset or external interrupt
                                   3496 ; do a cold start on wakeup.
                                   3497 ;------------------------------
      002A15                       3498 bye:
      00A7E4 01 00 23 01 81   [ 2] 3499 	btjf UART1_SR,#UART_SR_TC,.
      00A7E9 8E               [10] 3500 	halt
      00A7E9 CD 94 E8         [ 2] 3501 	jp cold_start  
                                   3502 
                                   3503 ;----------------------------------
                                   3504 ; BASIC: SLEEP 
                                   3505 ; halt mcu until reset or external
                                   3506 ; interrupt.
                                   3507 ; Resume progam after SLEEP command
                                   3508 ;----------------------------------
      002A1E                       3509 sleep:
      00A7EC 81 0D 52 30 FB   [ 2] 3510 	btjf UART1_SR,#UART_SR_TC,.
      00A7ED 72 16 00 22      [ 1] 3511 	bset flags,#FSLEEP
      00A7ED 72               [10] 3512 	halt 
      00A7EE 5F               [ 4] 3513 	ret 
                                   3514 
                                   3515 ;-------------------------------
                                   3516 ; BASIC: PAUSE expr 
                                   3517 ; suspend execution for n msec.
                                   3518 ; input:
                                   3519 ;	none
                                   3520 ; output:
                                   3521 ;	none 
                                   3522 ;------------------------------
      002A29                       3523 pause:
      00A7EF 00 19 52         [ 4] 3524 	call expression
      00A7F2 03 CD            [ 1] 3525 	cp a,#TK_INTGR
      00A7F4 98 1A            [ 1] 3526 	jreq 1$ 
      00A7F6 A1 04 27         [ 2] 3527 	jp syntax_error
      002A33                       3528 1$: _xpop 
      00A7F9 03 CC            [ 1]    1     ld a,(y)
      00A7FB 96               [ 1]    2     ldw x,y 
      00A7FC B0 CD            [ 2]    3     ldw x,(1,x)
      00A7FE 98 5C A4 DF      [ 2]    4     addw y,#CELL_SIZE 
      002A3C                       3529 pause02:
      00A802 A1 45 26         [ 2] 3530 	ldw timer,x 
      00A805 0C AE 40         [ 2] 3531 1$: ldw x,timer 
      00A808 00               [ 2] 3532 	tnzw x 
      00A809 CF 00            [ 1] 3533 	jreq 2$
      00A80B 1A               [10] 3534 	wfi 
      00A80C AE 47            [ 1] 3535 	jrne 1$
      002A48                       3536 2$:	
      00A80E FF               [ 4] 3537 	ret 
                                   3538 
                                   3539 ;------------------------------
                                   3540 ; BASIC: AWU expr
                                   3541 ; halt mcu for 'expr' milliseconds
                                   3542 ; use Auto wakeup peripheral
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3543 ; all oscillators stopped except LSI
                                   3544 ; range: 1ms - 511ms
                                   3545 ; input:
                                   3546 ;  none
                                   3547 ; output:
                                   3548 ;  none:
                                   3549 ;------------------------------
      002A49                       3550 awu:
      00A80F 4F 20 15         [ 4] 3551   call expression
      00A812 A1 46            [ 1] 3552   cp a,#TK_INTGR
      00A814 27 06            [ 1] 3553   jreq 1$
      00A816 AE 95 D4         [ 2] 3554   jp syntax_error
      002A53                       3555 1$: _xpop 
      00A819 CC 96            [ 1]    1     ld a,(y)
      00A81B B2               [ 1]    2     ldw x,y 
      00A81C EE 01            [ 2]    3     ldw x,(1,x)
      00A81C AE B6 80 CF      [ 2]    4     addw y,#CELL_SIZE 
      002A5C                       3556 awu02:
      00A820 00 1A A6         [ 2] 3557   cpw x,#5120
      00A823 02 AE            [ 1] 3558   jrmi 1$ 
      00A825 7F FF 50 F2      [ 1] 3559   mov AWU_TBR,#15 
      00A827 A6 1E            [ 1] 3560   ld a,#30
      00A827 6B               [ 2] 3561   div x,a
      00A828 01 1F            [ 1] 3562   ld a,#16
      00A82A 02               [ 2] 3563   div x,a 
      00A82B CD 87            [ 2] 3564   jra 4$
      002A6D                       3565 1$: 
      00A82D 53 08 00         [ 2] 3566   cpw x,#2048
      00A82E 2B 09            [ 1] 3567   jrmi 2$ 
      00A82E CD 88 D5 27      [ 1] 3568   mov AWU_TBR,#14
      00A832 08 A6            [ 1] 3569   ld a,#80
      00A834 45               [ 2] 3570   div x,a 
      00A835 CD 89            [ 2] 3571   jra 4$   
      002A7B                       3572 2$:
      00A837 55 CD 87 D1      [ 1] 3573   mov AWU_TBR,#7
      002A7F                       3574 3$:  
                                   3575 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A83B AE 00 80         [ 2] 3576   cpw x,#64 
      00A83E CD 88            [ 2] 3577   jrule 4$ 
      00A840 C7 7B 01 1E      [ 1] 3578   inc AWU_TBR 
      00A844 02               [ 2] 3579   srlw x 
      00A845 72 B0            [ 2] 3580   jra 3$ 
      002A8B                       3581 4$:
      00A847 00               [ 1] 3582   ld a, xl
      00A848 1A               [ 1] 3583   dec a 
      00A849 C2 00            [ 1] 3584   jreq 5$
      00A84B 19               [ 1] 3585   dec a 	
      002A90                       3586 5$: 
      00A84C 22 E0            [ 1] 3587   and a,#0x3e 
      00A84E CD 94 E8         [ 1] 3588   ld AWU_APR,a 
      00A851 1E 02 A3 47      [ 1] 3589   bset AWU_CSR,#AWU_CSR_AWUEN
      00A855 FF               [10] 3590   halt 
                                   3591 
      00A856 26               [ 4] 3592   ret 
                                   3593 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3594 ;------------------------------
                                   3595 ; BASIC: TICKS
                                   3596 ; return msec ticks counter value 
                                   3597 ; input:
                                   3598 ; 	none 
                                   3599 ; output:
                                   3600 ;	X 		TK_INTGR
                                   3601 ;-------------------------------
      002A9B                       3602 get_ticks:
      00A857 03 CD 9D         [ 1] 3603 	ld a,ticks 
      00A85A BE 00 10         [ 2] 3604 	ldw x,ticks+1 
      00A85B 81               [ 4] 3605 	ret 
                                   3606 
                                   3607 ;------------------------------
                                   3608 ; BASIC: ABS(expr)
                                   3609 ; return absolute value of expr.
                                   3610 ; input:
                                   3611 ;   none
                                   3612 ; output:
                                   3613 ;   xstack    positive int24 
                                   3614 ;-------------------------------
      002AA2                       3615 abs:
      00A85B 5B 03 81         [ 4] 3616 	call func_args 
      00A85E A1 01            [ 1] 3617 	cp a,#1 
      00A85E CE B6            [ 1] 3618 	jreq 0$ 
      00A860 80 C3 A9         [ 2] 3619 	jp syntax_error
      002AAC                       3620 0$:  
      00A863 1E 81 E0         [ 4] 3621 	call abs24 
      00A865                       3622 	_xpop 
      00A865 88 4D            [ 1]    1     ld a,(y)
      00A867 27               [ 1]    2     ldw x,y 
      00A868 0A F6            [ 2]    3     ldw x,(1,x)
      00A86A 5C 90 F7 90      [ 2]    4     addw y,#CELL_SIZE 
      00A86E 5C               [ 4] 3623 	ret 
                                   3624 
                                   3625 ;------------------------------
                                   3626 ; BASIC: LSHIFT(expr1,expr2)
                                   3627 ; logical shift left expr1 by 
                                   3628 ; expr2 bits 
                                   3629 ; output:
                                   3630 ; 	A:x 	result 
                                   3631 ;------------------------------
      002AB9                       3632 lshift:
      00A86F 0A 01 26         [ 4] 3633 	call func_args
      00A872 F6 84            [ 1] 3634 	cp a,#2 
      00A874 81 03            [ 1] 3635 	jreq 1$
      00A875 CC 16 30         [ 2] 3636 	jp syntax_error
      002AC3                       3637 1$: _xpop 
      00A875 88 90            [ 1]    1     ld a,(y)
      00A877 AE               [ 1]    2     ldw x,y 
      00A878 16 E0            [ 2]    3     ldw x,(1,x)
      00A87A 90 89 A6 80      [ 2]    4     addw y,#CELL_SIZE 
      00A87E 90               [ 1] 3638 	ld a,xl 
      00A87F 7F               [ 1] 3639 	push a      
      002ACE                       3640 	_xpop  ; T>A:X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A880 90 5C            [ 1]    1     ld a,(y)
      00A882 4A               [ 1]    2     ldw x,y 
      00A883 26 F9            [ 2]    3     ldw x,(1,x)
      00A885 90 85 84 81      [ 2]    4     addw y,#CELL_SIZE 
      00A889 0D 01            [ 1] 3641 	tnz (1,sp) 
      00A889 89 90            [ 1] 3642 	jreq 4$
      00A88B 89               [ 1] 3643 2$:	rcf 
      00A88C 52               [ 2] 3644 	rlcw x 
      00A88D 06               [ 1] 3645 	rlc a 
      00A88E CD A8            [ 1] 3646 	dec (1,sp) 
      00A890 5E 26            [ 1] 3647 	jrne 2$
      002AE2                       3648 4$: _drop 1 
      00A892 09 AE            [ 2]    1     addw sp,#1 
      00A894 A9               [ 4] 3649 	ret
                                   3650 
                                   3651 ;------------------------------
                                   3652 ; BASIC: RSHIFT(expr1,expr2)
                                   3653 ; logical shift right expr1 by 
                                   3654 ; expr2 bits.
                                   3655 ; output:
                                   3656 ; 	A 		TK_INTGR
                                   3657 ;   X 		result 
                                   3658 ;------------------------------
      002AE5                       3659 rshift:
      00A895 20 CD 89         [ 4] 3660 	call func_args
      00A898 B2 CC            [ 1] 3661 	cp a,#2 
      00A89A A9 18            [ 1] 3662 	jreq 1$
      00A89C CC 16 30         [ 2] 3663 	jp syntax_error
      002AEF                       3664 1$: _xpop ; T>A:X
      00A89C CE 00            [ 1]    1     ld a,(y)
      00A89E 1C               [ 1]    2     ldw x,y 
      00A89F C3 00            [ 2]    3     ldw x,(1,x)
      00A8A1 1E 25 09 AE      [ 2]    4     addw y,#CELL_SIZE 
      00A8A5 A9               [ 1] 3665     ld a,xl 
      00A8A6 62               [ 1] 3666 	push a    
      002AFA                       3667 	_xpop  
      00A8A7 CD 89            [ 1]    1     ld a,(y)
      00A8A9 B2               [ 1]    2     ldw x,y 
      00A8AA CC A9            [ 2]    3     ldw x,(1,x)
      00A8AC 18 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8AD 0D 01            [ 1] 3668 	tnz (1,sp)
      00A8AD CD 87            [ 1] 3669 	jreq 4$
      00A8AF 93               [ 1] 3670 2$:	rcf 
      00A8B0 72               [ 1] 3671 	rrc a 
      00A8B1 5F               [ 2] 3672 	rrcw x 
      00A8B2 00 19            [ 1] 3673 	dec (1,sp) 
      00A8B4 AE B6            [ 1] 3674 	jrne 2$
      002B0E                       3675 4$: _drop 1 
      00A8B6 80 CF            [ 2]    1     addw sp,#1 
      00A8B8 00               [ 4] 3676 	ret
                                   3677 
                                   3678 ;--------------------------
                                   3679 ; BASIC: FCPU integer
                                   3680 ; set CPU frequency 
                                   3681 ;-------------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3682 
      002B11                       3683 fcpu:
      00A8B9 1A CD            [ 1] 3684 	ld a,#TK_INTGR
      00A8BB 9E D8 1F         [ 4] 3685 	call expect 
      00A8BE 05 0F 03         [ 4] 3686 	call get_int24 
      00A8C1 CD               [ 1] 3687 	ld a,xl 
      00A8C2 A8 75            [ 1] 3688 	and a,#7 
      00A8C4 CE A9 1E         [ 1] 3689 	ld CLK_CKDIVR,a 
      00A8C7 90               [ 4] 3690 	ret 
                                   3691 
                                   3692 ;------------------------------
                                   3693 ; BASIC: PMODE pin#, mode 
                                   3694 ; Arduino pin. 
                                   3695 ; define pin as input or output
                                   3696 ; pin#: {0..15}
                                   3697 ; mode: INPUT|OUTPUT  
                                   3698 ;------------------------------
                           000001  3699 	PINNO=1
                           000001  3700 	VSIZE=1
      002B20                       3701 pin_mode:
      002B20                       3702 	_vars VSIZE 
      00A8C8 FF 72            [ 2]    1     sub sp,#VSIZE 
      00A8CA A9 00 02         [ 4] 3703 	call arg_list 
      00A8CD 1E 05            [ 1] 3704 	cp a,#2 
      00A8CF 90 FF            [ 1] 3705 	jreq 1$
      00A8D1 72 A9 00         [ 2] 3706 	jp syntax_error 
      002B2C                       3707 1$: _xpop 
      00A8D4 02 A6            [ 1]    1     ld a,(y)
      00A8D6 7C               [ 1]    2     ldw x,y 
      00A8D7 6B 04            [ 2]    3     ldw x,(1,x)
      00A8D9 A3 00 7C 22      [ 2]    4     addw y,#CELL_SIZE 
      00A8DD 01 9F 6B         [ 2] 3708 	ldw ptr16,x ; mode 
      002B38                       3709 	_xpop ; Dx pin 
      00A8E0 04 CE            [ 1]    1     ld a,(y)
      00A8E2 00               [ 1]    2     ldw x,y 
      00A8E3 1C 1F            [ 2]    3     ldw x,(1,x)
      00A8E5 01 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A8E6 CD 2B 7F         [ 4] 3710 	call select_pin 
      00A8E6 1E 01            [ 1] 3711 	ld (PINNO,sp),a  
      00A8E8 7B 04            [ 1] 3712 	ld a,#1 
      00A8EA CD A8            [ 1] 3713 	tnz (PINNO,sp)
      00A8EC 65 1F            [ 1] 3714 	jreq 4$
      00A8EE 01               [ 1] 3715 2$:	sll a 
      00A8EF AE 16            [ 1] 3716 	dec (PINNO,sp)
      00A8F1 E0 CD            [ 1] 3717 	jrne 2$ 
      00A8F3 87 AD            [ 1] 3718 	ld (PINNO,sp),a
      00A8F5 AE 00            [ 1] 3719 	ld a,(PINNO,sp)
      00A8F7 80 CD            [ 1] 3720 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A8F9 88 C7            [ 1] 3721 	ld (GPIO_CR1,x),a 
      00A8FB 1E 01            [ 1] 3722 4$:	ld a,#OUTP
      00A8FD C3 00 1E         [ 1] 3723 	cp a,acc8 
      00A900 24 16            [ 1] 3724 	jreq 6$
                                   3725 ; input mode
                                   3726 ; disable external interrupt 
      00A902 1E 05            [ 1] 3727 	ld a,(PINNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A904 72               [ 1] 3728 	cpl a 
      00A905 F0 03            [ 1] 3729 	and a,(GPIO_CR2,x)
      00A907 1F 05            [ 1] 3730 	ld (GPIO_CR2,x),a 
                                   3731 ;clear bit in DDR for input mode 
      00A909 A6 80            [ 1] 3732 	ld a,(PINNO,sp)
      00A90B A3               [ 1] 3733 	cpl a 
      00A90C 00 80            [ 1] 3734 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A90E 24 01            [ 1] 3735 	ld (GPIO_DDR,x),a 
      00A910 9F 6B            [ 2] 3736 	jra 9$
      002B70                       3737 6$: ;output mode  
      00A912 04 CD            [ 1] 3738 	ld a,(PINNO,sp)
      00A914 A8 75            [ 1] 3739 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A916 20 CE            [ 1] 3740 	ld (GPIO_DDR,x),a 
      00A918 5B 06            [ 1] 3741 	ld a,(PINNO,sp)
      00A91A 90 85            [ 1] 3742 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A91C 85 81            [ 1] 3743 	ld (GPIO_CR2,x),a 
      002B7C                       3744 9$:	
      002B7C                       3745 	_drop VSIZE 
      00A91E 54 42            [ 2]    1     addw sp,#VSIZE 
      00A920 43               [ 4] 3746 	ret
                                   3747 
                                   3748 ;------------------------
                                   3749 ; select Arduino pin 
                                   3750 ; input:
                                   3751 ;   X 	 {0..15} Arduino Dx 
                                   3752 ; output:
                                   3753 ;   A     stm8s208 pin 
                                   3754 ;   X     base address s208 GPIO port 
                                   3755 ;---------------------------
      002B7F                       3756 select_pin:
      00A921 61               [ 2] 3757 	sllw x 
      00A922 6E 27 74         [ 2] 3758 	addw x,#arduino_to_8s208 
      00A925 20               [ 2] 3759 	ldw x,(x)
      00A926 66               [ 1] 3760 	ld a,xl 
      00A927 6C               [ 1] 3761 	push a 
      00A928 61               [ 1] 3762 	swapw x 
      00A929 73 68            [ 1] 3763 	ld a,#5 
      00A92B 20               [ 4] 3764 	mul x,a 
      00A92C 61 70 70         [ 2] 3765 	addw x,#GPIO_BASE 
      00A92F 6C               [ 1] 3766 	pop a 
      00A930 69               [ 4] 3767 	ret 
                                   3768 ; translation from Arduino D0..D15 to stm8s208rb 
      002B8F                       3769 arduino_to_8s208:
      00A931 63 61                 3770 .byte 3,6 ; D0 
      00A933 74 69                 3771 .byte 3,5 ; D1 
      00A935 6F 6E                 3772 .byte 4,0 ; D2 
      00A937 2C 20                 3773 .byte 2,1 ; D3
      00A939 61 6C                 3774 .byte 6,0 ; D4
      00A93B 72 65                 3775 .byte 2,2 ; D5
      00A93D 61 64                 3776 .byte 2,3 ; D6
      00A93F 79 20                 3777 .byte 3,1 ; D7
      00A941 6F 6E                 3778 .byte 3,3 ; D8
      00A943 65 20                 3779 .byte 2,4 ; D9
      00A945 69 6E                 3780 .byte 4,5 ; D10
      00A947 20 46                 3781 .byte 2,6 ; D11
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A949 4C 41                 3782 .byte 2,7 ; D12
      00A94B 53 48                 3783 .byte 2,5 ; D13
      00A94D 0A 75                 3784 .byte 4,2 ; D14
      00A94F 73 65                 3785 .byte 4,1 ; D15
                                   3786 
                                   3787 
                                   3788 ;------------------------------
                                   3789 ; BASIC: RND(expr)
                                   3790 ; return random number 
                                   3791 ; between 1 and expr inclusive
                                   3792 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3793 ; input:
                                   3794 ; 	none 
                                   3795 ; output:
                                   3796 ;	xstack 	random positive integer 
                                   3797 ;------------------------------
      002BAF                       3798 random:
      00A951 20 45 52         [ 4] 3799 	call func_args 
      00A954 41 53            [ 1] 3800 	cp a,#1
      00A956 45 20            [ 1] 3801 	jreq 1$
      00A958 5C 46 20         [ 2] 3802 	jp syntax_error
      002BB9                       3803 1$:  
      002BB9                       3804 	_xpop   
      00A95B 62 65            [ 1]    1     ld a,(y)
      00A95D 66               [ 1]    2     ldw x,y 
      00A95E 6F 72            [ 2]    3     ldw x,(1,x)
      00A960 65 00 4E 6F      [ 2]    4     addw y,#CELL_SIZE 
      00A964 20               [ 2] 3805 	pushw x 
      00A965 61               [ 1] 3806 	push a  
      00A966 70 70            [ 1] 3807 	ld a,#0x80 
      00A968 6C 69            [ 1] 3808 	bcp a,(1,sp)
      00A96A 63 61            [ 1] 3809 	jreq 2$
      00A96C 74 69            [ 1] 3810 	ld a,#ERR_BAD_VALUE
      00A96E 6F 6E 20         [ 2] 3811 	jp tb_error
      002BCF                       3812 2$: 
                                   3813 ; acc16=(x<<5)^x 
      00A971 69 6E 20         [ 2] 3814 	ldw x,seedx 
      00A974 52               [ 2] 3815 	sllw x 
      00A975 41               [ 2] 3816 	sllw x 
      00A976 4D               [ 2] 3817 	sllw x 
      00A977 00               [ 2] 3818 	sllw x 
      00A978 58               [ 2] 3819 	sllw x 
      00A978 CD               [ 1] 3820 	ld a,xh 
      00A979 9B 26 A1         [ 1] 3821 	xor a,seedx 
      00A97C 84 27 03         [ 1] 3822 	ld acc16,a 
      00A97F CC               [ 1] 3823 	ld a,xl 
      00A980 96 B0 90         [ 1] 3824 	xor a,seedx+1 
      00A983 F6 93 EE         [ 1] 3825 	ld acc8,a 
                                   3826 ; seedx=seedy 
      00A986 01 72 A9         [ 2] 3827 	ldw x,seedy 
      00A989 00 03 C7         [ 2] 3828 	ldw seedx,x  
                                   3829 ; seedy=seedy^(seedy>>1)
      00A98C 00 19 CF         [ 2] 3830 	ldw x,seedy 
      00A98F 00               [ 2] 3831 	srlw x 
      00A990 1A               [ 1] 3832 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A991 C8 00 16         [ 1] 3833 	xor a,seedy 
      00A991 CD 98 1A         [ 1] 3834 	ld seedy,a  
      00A994 A1               [ 1] 3835 	ld a,xl 
      00A995 08 27 02         [ 1] 3836 	xor a,seedy+1 
      00A998 20 20 CD         [ 1] 3837 	ld seedy+1,a 
                                   3838 ; acc16>>3 
      00A99B 9B 26 A1         [ 2] 3839 	ldw x,acc16 
      00A99E 84               [ 2] 3840 	srlw x 
      00A99F 27               [ 2] 3841 	srlw x 
      00A9A0 03               [ 2] 3842 	srlw x 
                                   3843 ; x=acc16^x 
      00A9A1 CC               [ 1] 3844 	ld a,xh 
      00A9A2 96 B0 90         [ 1] 3845 	xor a,acc16 
      00A9A5 F6 93 EE         [ 1] 3846 	ld acc16,a 
      00A9A8 01               [ 1] 3847 	ld a,xl 
      00A9A9 72 A9 00         [ 1] 3848 	xor a,acc8 
      00A9AC 03 9F 5F         [ 1] 3849 	ld acc8,a 
                                   3850 ; seedy=acc16^seedy 
      00A9AF CD 87 F7         [ 1] 3851 	xor a,seedy+1
      00A9B2 AE               [ 1] 3852 	ld xl,a 
      00A9B3 00 01 CD         [ 1] 3853 	ld a,acc16 
      00A9B6 88 C7 20         [ 1] 3854 	xor a,seedy
      00A9B9 D7               [ 1] 3855 	ld xh,a 
      00A9BA CF 00 16         [ 2] 3856 	ldw seedy,x 
                                   3857 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A9BA 81 00 15         [ 1] 3858 	ld a,seedx+1
      00A9BB A4 7F            [ 1] 3859 	and a,#127
      002C24                       3860 	_xpush 
      00A9BB CD 99 DD A1      [ 2]    1     subw y,#CELL_SIZE
      00A9BF 01 27            [ 1]    2     ld (y),a 
      00A9C1 03 CC 96         [ 2]    3     ldw (1,y),x 
      00A9C4 B0               [ 1] 3861 	pop a 
      00A9C5 90               [ 2] 3862 	popw x 
      002C2F                       3863 	_xpush 
      00A9C6 F6 93 EE 01      [ 2]    1     subw y,#CELL_SIZE
      00A9CA 72 A9            [ 1]    2     ld (y),a 
      00A9CC 00 03 9F         [ 2]    3     ldw (1,y),x 
      00A9CF A4 7F 81         [ 4] 3864 	call mod24 
      00A9D2                       3865 	_xpop
      00A9D2 A6 06            [ 1]    1     ld a,(y)
      00A9D4 CD               [ 1]    2     ldw x,y 
      00A9D5 99 D0            [ 2]    3     ldw x,(1,x)
      00A9D7 CD 98 1A A1      [ 2]    4     addw y,#CELL_SIZE 
      00A9DB 02 27 0E         [ 2] 3866 	addw x,#1 
      00A9DE A1 04            [ 1] 3867 	adc a,#0  
      00A9E0 27               [ 4] 3868 	ret 
                                   3869 
                                   3870 ;---------------------------------
                                   3871 ; BASIC: WORDS 
                                   3872 ; affiche la listes des mots du
                                   3873 ; dictionnaire ainsi que le nombre
                                   3874 ; de mots.
                                   3875 ;---------------------------------
                           000001  3876 	WLEN=1 ; word length
                           000002  3877 	LLEN=2 ; character sent to console
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                           000003  3878 	WCNT=3 ; count words printed 
                           000003  3879 	VSIZE=3 
      002C4A                       3880 words:
      00A9E1 12 A1            [ 2] 3881 	pushw y
      002C4C                       3882 	_vars VSIZE
      00A9E3 82 27            [ 2]    1     sub sp,#VSIZE 
      00A9E5 03 CC            [ 1] 3883 	clr (LLEN,sp)
      00A9E7 96 B0            [ 1] 3884 	clr (WCNT,sp)
      00A9E9 90 AE 34 1F      [ 2] 3885 	ldw y,#kword_dict+2
      00A9E9 FD               [ 1] 3886 0$:	ldw x,y
      00A9EA 20               [ 1] 3887 	ld a,(x)
      00A9EB 0B 0F            [ 1] 3888 	and a,#15 
      00A9EC 6B 01            [ 1] 3889 	ld (WLEN,sp),a 
      00A9EC F6 88            [ 1] 3890 	inc (WCNT,sp)
      00A9EE CD               [ 1] 3891 1$:	incw x 
      00A9EF 98               [ 1] 3892 	ld a,(x)
      00A9F0 33 84 20         [ 4] 3893 	call putc 
      00A9F3 03 02            [ 1] 3894 	inc (LLEN,sp)
      00A9F4 0A 01            [ 1] 3895 	dec (WLEN,sp)
      00A9F4 CD 98            [ 1] 3896 	jrne 1$
      00A9F6 5C 5F            [ 1] 3897 	ld a,#70
      00A9F8 02 72            [ 1] 3898 	cp a,(LLEN,sp)
      00A9FA A2 00            [ 1] 3899 	jrmi 2$   
      00A9FC 03 90            [ 1] 3900 	ld a,#SPACE 
      00A9FE F7 90 EF         [ 4] 3901 	call putc 
      00AA01 01 A6            [ 1] 3902 	inc (LLEN,sp) 
      00AA03 07 CD            [ 2] 3903 	jra 3$
      00AA05 99 D0            [ 1] 3904 2$: ld a,#CR 
      00AA07 CD 08 D5         [ 4] 3905 	call putc 
      00AA07 90 F6            [ 1] 3906 	clr (LLEN,sp)
      00AA09 93 EE 01 72      [ 2] 3907 3$:	subw y,#2 
      00AA0D A9 00            [ 2] 3908 	ldw y,(y)
      00AA0F 03 81            [ 1] 3909 	jrne 0$ 
      00AA11 A6 0D            [ 1] 3910 	ld a,#CR 
      00AA11 CD 89 65         [ 4] 3911 	call putc  
      00AA14 81               [ 1] 3912 	clrw x 
      00AA15 7B 03            [ 1] 3913 	ld a,(WCNT,sp)
      00AA15 5F               [ 1] 3914 	ld xl,a 
      00AA16 C6 00 2F         [ 4] 3915 	call prt_i16 
      00AA19 C0 00 30         [ 2] 3916 	ldw x,#words_count_msg
      00AA1C 27 03 53         [ 4] 3917 	call puts 
      002C99                       3918 	_drop VSIZE 
      00AA1F A6 FF            [ 2]    1     addw sp,#VSIZE 
      00AA21 90 85            [ 2] 3919 	popw y 
      00AA21 81               [ 4] 3920 	ret 
      00AA22 20 77 6F 72 64 73 20  3921 words_count_msg: .asciz " words in dictionary\n"
             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3922 
                                   3923 
                                   3924 ;-----------------------------
                                   3925 ; BASIC: TIMER expr 
                                   3926 ; initialize count down timer 
                                   3927 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      002CB4                       3928 set_timer:
      00AA22 CD 99 DD         [ 4] 3929 	call arg_list
      00AA25 A1 02            [ 1] 3930 	cp a,#1 
      00AA27 27 03            [ 1] 3931 	jreq 1$
      00AA29 CC 96 B0         [ 2] 3932 	jp syntax_error
      002CBE                       3933 1$: 
      002CBE                       3934 	_xpop  
      00AA2C 90 E6            [ 1]    1     ld a,(y)
      00AA2E 03               [ 1]    2     ldw x,y 
      00AA2F 93 EE            [ 2]    3     ldw x,(1,x)
      00AA31 04 A3 50 00      [ 2]    4     addw y,#CELL_SIZE 
      00AA35 2B 16 A3         [ 2] 3935 	ldw timer,x 
      00AA38 50               [ 4] 3936 	ret 
                                   3937 
                                   3938 ;------------------------------
                                   3939 ; BASIC: TIMEOUT 
                                   3940 ; return state of timer 
                                   3941 ; output:
                                   3942 ;   A:X     0 not timeout 
                                   3943 ;   A:X     -1 timeout 
                                   3944 ;------------------------------
      002CCB                       3945 timeout:
      00AA39 29               [ 1] 3946 	clr a 
      00AA3A 2A 11 89         [ 2] 3947 	ldw x,timer 
      00AA3D 90 F6            [ 1] 3948 	jreq 1$
      00AA3F 93               [ 1] 3949 	clrw x
      00AA40 EE               [ 4] 3950 	ret  
      00AA41 01               [ 1] 3951 1$:	cpl a
      00AA42 72               [ 2] 3952 	cplw x 
      00AA43 A9               [ 4] 3953 	ret 
                                   3954  	
                                   3955 
                                   3956 
                                   3957 
                                   3958 ;-----------------------------------
                                   3959 ; BASIC: IWDGEN expr1 
                                   3960 ; enable independant watchdog timer
                                   3961 ; expr1 is delay in multiple of 62.5µsec
                                   3962 ; expr1 -> {1..16383}
                                   3963 ;-----------------------------------
      002CD6                       3964 enable_iwdg:
      00AA44 00 03 72         [ 4] 3965 	call arg_list
      00AA47 FB 01            [ 1] 3966 	cp a,#1 
      00AA49 5B 02            [ 1] 3967 	jreq 1$
      00AA4B 4F 81 30         [ 2] 3968 	jp syntax_error 
      00AA4D                       3969 1$: _xpop  
      00AA4D A6 0A            [ 1]    1     ld a,(y)
      00AA4F CC               [ 1]    2     ldw x,y 
      00AA50 96 B2            [ 2]    3     ldw x,(1,x)
      00AA52 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AA52 CD A8            [ 1] 3970 	push #0
      00AA54 5E 26 13 AE      [ 1] 3971 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00AA58 B6               [ 1] 3972 	ld a,xh 
      00AA59 80 72            [ 1] 3973 	and a,#0x3f
      00AA5B BB               [ 1] 3974 	ld xh,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00AA5C B6 82 1C         [ 2] 3975 2$:	cpw x,#255
      00AA5F 00 04            [ 2] 3976 	jrule 3$
      00AA61 1C 00            [ 1] 3977 	inc (1,sp)
      00AA63 80               [ 1] 3978 	rcf 
      00AA64 9F               [ 2] 3979 	rrcw x 
      00AA65 A4 80            [ 2] 3980 	jra 2$
      00AA67 97 20 03 AE      [ 1] 3981 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AA6B B6               [ 1] 3982 	pop a  
      00AA6C 80 50 E1         [ 1] 3983 	ld IWDG_PR,a 
      00AA6D 9F               [ 1] 3984 	ld a,xl
      00AA6D 4F               [ 1] 3985 	dec a 
      00AA6E 81 55 50 E0      [ 1] 3986 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00AA6F C7 50 E2         [ 1] 3987 	ld IWDG_RLR,a 
      00AA6F CD 99 DD A1      [ 1] 3988 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00AA73 02               [ 4] 3989 	ret 
                                   3990 
                                   3991 
                                   3992 ;-----------------------------------
                                   3993 ; BASIC: IWDGREF  
                                   3994 ; refresh independant watchdog count down 
                                   3995 ; timer before it reset MCU. 
                                   3996 ;-----------------------------------
      002D14                       3997 refresh_iwdg:
      00AA74 27 03 CC 96      [ 1] 3998 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00AA78 B0               [ 4] 3999 	ret 
                                   4000 
                                   4001 
                                   4002 ;-------------------------------------
                                   4003 ; BASIC: LOG2(expr)
                                   4004 ; return logarithm base 2 of expr 
                                   4005 ; this is the position of most significant
                                   4006 ; bit set. 
                                   4007 ; input: 
                                   4008 ; output:
                                   4009 ;   A     TK_INTGR 
                                   4010 ;   xstack log2 
                                   4011 ;*********************************
      00AA79                       4012 log2:
      00AA79 90 E6 03         [ 4] 4013 	call func_args 
      00AA7C 93 EE            [ 1] 4014 	cp a,#1 
      00AA7E 04 CF            [ 1] 4015 	jreq 1$
      00AA80 00 1A 90         [ 2] 4016 	jp syntax_error 
      002D23                       4017 1$: 
      002D23                       4018 	_xpop    
      00AA83 F6 93            [ 1]    1     ld a,(y)
      00AA85 EE               [ 1]    2     ldw x,y 
      00AA86 01 72            [ 2]    3     ldw x,(1,x)
      00AA88 A9 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      00AA8C F7               [ 1] 4019 	tnz a
      00AA8D 90 EF            [ 1] 4020 	jrne 2$ 
      00AA8F 01               [ 2] 4021 	tnzw x 
      00AA90 72 CD            [ 1] 4022 	jrne 2$
      00AA92 00 1A            [ 1] 4023 	ld a,#ERR_BAD_VALUE
      00AA94 81 16 32         [ 2] 4024 	jp tb_error 
      00AA95 4B 18            [ 1] 4025 2$: push #24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00AA95 72               [ 2] 4026 3$: rlcw x 
      00AA96 0D               [ 1] 4027     rlc a 
      00AA97 52 30            [ 1] 4028 	jrc 4$
      00AA99 FB 8E            [ 1] 4029 	dec (1,sp) 
      00AA9B CC 81            [ 1] 4030 	jrne 3$
      00AA9D 35               [ 1] 4031 4$: clrw x 
      00AA9E 84               [ 1] 4032     pop a 
      00AA9E 72               [ 1] 4033 	dec a
      00AA9F 0D               [ 1] 4034 	rlwa x  
      002D45                       4035 9$:	
      00AAA0 52               [ 4] 4036 	ret 
                                   4037 
                                   4038 ;-----------------------------------
                                   4039 ; BASIC: BIT(expr) 
                                   4040 ; expr ->{0..23}
                                   4041 ; return 2^expr 
                                   4042 ; output:
                                   4043 ;    A:X    2^expr 
                                   4044 ;-----------------------------------
      002D46                       4045 bitmask:
      00AAA1 30 FB 72         [ 4] 4046     call func_args 
      00AAA4 16 00            [ 1] 4047 	cp a,#1
      00AAA6 23 8E            [ 1] 4048 	jreq 1$
      00AAA8 81 16 30         [ 2] 4049 	jp syntax_error 
      00AAA9                       4050 1$: _xpop 
      00AAA9 CD 9B            [ 1]    1     ld a,(y)
      00AAAB 26               [ 1]    2     ldw x,y 
      00AAAC A1 84            [ 2]    3     ldw x,(1,x)
      00AAAE 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00AAB2 B0               [ 1] 4051 	ld a,xl 
      00AAB3 90 F6 93         [ 2] 4052 	ldw x,#1 
      00AAB6 EE 01            [ 1] 4053 	and a,#23
      00AAB8 72 A9            [ 1] 4054 	jreq 9$
      00AABA 00               [ 1] 4055 	push a 
      00AABB 03               [ 1] 4056 	clr a 
      00AABC                       4057 2$: 
      00AABC CF               [ 2] 4058 	slaw x 
      00AABD 00               [ 1] 4059 	rlc a 	
      00AABE 13 CE            [ 1] 4060 	dec (1,sp)
      00AAC0 00 13            [ 1] 4061 	jrne 2$ 
      002D69                       4062 4$:
      002D69                       4063     _drop 1 
      00AAC2 5D 27            [ 2]    1     addw sp,#1 
      00AAC4 03               [ 4] 4064 9$:	ret 
                                   4065 
                                   4066 ;------------------------------
                                   4067 ; BASIC: DO 
                                   4068 ; initiate a DO ... UNTIL loop 
                                   4069 ;------------------------------
                           000003  4070 	DOLP_ADR=3 
                           000005  4071 	DOLP_INW=5
                           000004  4072 	VSIZE=4 
      002D6C                       4073 do_loop:
      00AAC5 8F               [ 2] 4074 	popw x 
      002D6D                       4075 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00AAC6 26 F7            [ 2]    1     sub sp,#VSIZE 
      00AAC8 89               [ 2] 4076 	pushw x 
      00AAC8 81 00 04         [ 2] 4077 	ldw x,basicptr 
      00AAC9 1F 03            [ 2] 4078 	ldw (DOLP_ADR,sp),x
      00AAC9 CD 9B 26         [ 2] 4079 	ldw x,in.w 
      00AACC A1 84            [ 2] 4080 	ldw (DOLP_INW,sp),x
      00AACE 27 03 CC 96      [ 1] 4081 	inc loop_depth 
      00AAD2 B0               [ 4] 4082 	ret 
                                   4083 
                                   4084 ;--------------------------------
                                   4085 ; BASIC: UNTIL expr 
                                   4086 ; loop if exprssion is false 
                                   4087 ; else terminate loop
                                   4088 ;--------------------------------
      002D7F                       4089 until: 
      00AAD3 90 F6 93 EE      [ 1] 4090 	tnz loop_depth 
      00AAD7 01 72            [ 1] 4091 	jrne 1$ 
      00AAD9 A9 00 03         [ 2] 4092 	jp syntax_error 
      00AADC                       4093 1$: 
      00AADC A3 14 00         [ 4] 4094 	call condition  
      002D8B                       4095 	_xpop 
      00AADF 2B 0C            [ 1]    1     ld a,(y)
      00AAE1 35               [ 1]    2     ldw x,y 
      00AAE2 0F 50            [ 2]    3     ldw x,(1,x)
      00AAE4 F2 A6 1E 62      [ 2]    4     addw y,#CELL_SIZE 
      00AAE8 A6               [ 1] 4096 	tnz a 
      00AAE9 10 62            [ 1] 4097 	jrne 9$ 
      00AAEB 20               [ 2] 4098 	tnzw x 
      00AAEC 1E 10            [ 1] 4099 	jrne 9$ 
      00AAED 1E 03            [ 2] 4100 	ldw x,(DOLP_ADR,sp)
      00AAED A3 08 00         [ 2] 4101 	ldw basicptr,x 
      00AAF0 2B 09            [ 1] 4102 	ld a,(2,x)
      00AAF2 35 0E 50         [ 1] 4103 	ld count,a 
      00AAF5 F2 A6            [ 2] 4104 	ldw x,(DOLP_INW,sp)
      00AAF7 50 62 20         [ 2] 4105 	ldw in.w,x 
      00AAFA 10               [ 4] 4106 	ret 
      00AAFB                       4107 9$:	; remove loop data from stack  
      00AAFB 35               [ 2] 4108 	popw x
      002DAB                       4109 	_drop VSIZE
      00AAFC 07 50            [ 2]    1     addw sp,#VSIZE 
      00AAFE F2 5A 00 1F      [ 1] 4110 	dec loop_depth 
      00AAFF FC               [ 2] 4111 	jp (x)
                                   4112 
                                   4113 ;--------------------------
                                   4114 ; BASIC: PORTA...PORTI  
                                   4115 ;  return constant value 
                                   4116 ;  PORT  base address 
                                   4117 ;---------------------------
      002DB2                       4118 const_porta:
      00AAFF A3 00 40         [ 2] 4119 	ldw x,#PA_BASE 
      00AB02 23               [ 1] 4120 	clr a 
      00AB03 07               [ 4] 4121 	ret 
      002DB7                       4122 const_portb:
      00AB04 72 5C 50         [ 2] 4123 	ldw x,#PB_BASE 
      00AB07 F2               [ 1] 4124 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00AB08 54               [ 4] 4125 	ret 
      002DBC                       4126 const_portc:
      00AB09 20 F4 0A         [ 2] 4127 	ldw x,#PC_BASE 
      00AB0B 4F               [ 1] 4128 	clr a 
      00AB0B 9F               [ 4] 4129 	ret 
      002DC1                       4130 const_portd:
      00AB0C 4A 27 01         [ 2] 4131 	ldw x,#PD_BASE 
      00AB0F 4A               [ 1] 4132 	clr a 
      00AB10 81               [ 4] 4133 	ret 
      002DC6                       4134 const_porte:
      00AB10 A4 3E C7         [ 2] 4135 	ldw x,#PE_BASE 
      00AB13 50               [ 1] 4136 	clr a 
      00AB14 F1               [ 4] 4137 	ret 
      002DCB                       4138 const_portf:
      00AB15 72 18 50         [ 2] 4139 	ldw x,#PF_BASE 
      00AB18 F0               [ 1] 4140 	clr a 
      00AB19 8E               [ 4] 4141 	ret 
      002DD0                       4142 const_portg:
      00AB1A 81 50 1E         [ 2] 4143 	ldw x,#PG_BASE 
      00AB1B 4F               [ 1] 4144 	clr a 
      00AB1B C6               [ 4] 4145 	ret 
      002DD5                       4146 const_porti:
      00AB1C 00 10 CE         [ 2] 4147 	ldw x,#PI_BASE 
      00AB1F 00               [ 1] 4148 	clr a 
      00AB20 11               [ 4] 4149 	ret 
                                   4150 
                                   4151 ;-------------------------------
                                   4152 ; following return constant 
                                   4153 ; related to GPIO register offset 
                                   4154 ;---------------------------------
      002DDA                       4155 const_odr:
      00AB21 81               [ 1] 4156 	clr a 
      00AB22 AE 00 00         [ 2] 4157 	ldw x,#GPIO_ODR
      00AB22 CD               [ 4] 4158 	ret 
      002DDF                       4159 const_idr:
      00AB23 99               [ 1] 4160 	clr a 
      00AB24 DD A1 01         [ 2] 4161 	ldw x,#GPIO_IDR
      00AB27 27               [ 4] 4162 	ret 
      002DE4                       4163 const_ddr:
      00AB28 03               [ 1] 4164 	clr a
      00AB29 CC 96 B0         [ 2] 4165 	ldw x,#GPIO_DDR
      00AB2C 81               [ 4] 4166 	ret 
      002DE9                       4167 const_cr1:
      00AB2C CD               [ 1] 4168 	clr a 
      00AB2D 82 60 90         [ 2] 4169 	ldw x,#GPIO_CR1
      00AB30 F6               [ 4] 4170 	ret 
      002DEE                       4171 const_cr2:
      00AB31 93               [ 1] 4172 	clr a
      00AB32 EE 01 72         [ 2] 4173 	ldw x,#GPIO_CR2
      00AB35 A9               [ 4] 4174 	ret 
                                   4175 ;-------------------------
                                   4176 ; BASIC: POUT 
                                   4177 ;  constant for port mode
                                   4178 ;  used by PMODE 
                                   4179 ;  to set pin as output
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   4180 ;------------------------
      002DF3                       4181 const_output:
      00AB36 00               [ 1] 4182 	clr a 
      00AB37 03 81 01         [ 2] 4183 	ldw x,#OUTP
      00AB39 81               [ 4] 4184 	ret 
                                   4185 
                                   4186 ;-------------------------
                                   4187 ; BASIC: PINP 
                                   4188 ;  constant for port mode
                                   4189 ;  used by PMODE 
                                   4190 ;  to set pin as input
                                   4191 ;------------------------
      002DF8                       4192 const_input:
      00AB39 CD               [ 1] 4193 	clr a  
      00AB3A 99 DD A1         [ 2] 4194 	ldw x,#INP 
      00AB3D 02               [ 4] 4195 	ret 
                                   4196 	
                                   4197 ;-----------------------
                                   4198 ; memory area constants
                                   4199 ;-----------------------
      002DFD                       4200 const_eeprom_base:
      00AB3E 27               [ 1] 4201 	clr a  
      00AB3F 03 CC 96         [ 2] 4202 	ldw x,#EEPROM_BASE 
      00AB42 B0               [ 4] 4203 	ret 
                                   4204 
                                   4205 ;---------------------------
                                   4206 ; BASIC: DATA 
                                   4207 ; when the interpreter find 
                                   4208 ; a DATA line it skip it.
                                   4209 ;---------------------------
      002E02                       4210 data:
      00AB43 90 F6 93 EE 01   [ 1] 4211 	mov in,count 
      00AB48 72               [ 4] 4212 	ret 
                                   4213 
                                   4214 ;------------------------------
                                   4215 ; check if it is a DATA line 
                                   4216 ; input: 
                                   4217 ;    X    line address 
                                   4218 ; output:
                                   4219 ;    Z    set if DATA line 
                                   4220 ;----------------------------
      002E08                       4221 is_data_line:
      00AB49 A9               [ 2] 4222 	pushw x 
      00AB4A 00 03            [ 1] 4223 	ld a,(3,x)
      00AB4C 9F 88            [ 1] 4224 	cp a,#TK_CMD 
      00AB4E 90 F6            [ 1] 4225 	jrne 9$
      00AB50 93 EE            [ 2] 4226 	ldw x,(4,x)
      00AB52 01 72 A9         [ 2] 4227 	cpw x,#data  
      00AB55 00               [ 2] 4228 9$: popw x 
      00AB56 03               [ 4] 4229 	ret 
                                   4230 
                                   4231 ;---------------------------------
                                   4232 ; BASIC: RESTORE [line#]
                                   4233 ; set data_ptr to first data line
                                   4234 ; if no DATA found pointer set to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4235 ; zero.
                                   4236 ; if a line# is given as argument 
                                   4237 ; a data line with that number 
                                   4238 ; is searched and the data pointer 
                                   4239 ; is set to it. If there is no 
                                   4240 ; data line with that number 
                                   4241 ; the program is interrupted. 
                                   4242 ;---------------------------------
      002E16                       4243 restore:
      00AB57 0D               [ 1] 4244 	clrw x 
      00AB58 01 27 07         [ 2] 4245 	ldw data_ptr,x 
      00AB5B 98 59 49         [ 2] 4246 	ldw data_ofs,x 
      00AB5E 0A 01 26         [ 2] 4247 	ldw x,txtbgn 
      00AB61 F9 5B 01         [ 4] 4248 	call next_token 
      00AB64 81 84            [ 1] 4249 	cp a,#TK_INTGR
      00AB65 26 10            [ 1] 4250 	jrne 0$
      00AB65 CD 99 DD         [ 4] 4251 	call get_int24
      00AB68 A1 02            [ 2] 4252 	pushw y 
      00AB6A 27               [ 1] 4253 	clr a 
      00AB6B 03 CC 96         [ 4] 4254 	call search_lineno  
      00AB6E B0 90            [ 2] 4255 	popw y 
      00AB70 F6               [ 2] 4256 	tnzw x 
      00AB71 93 EE            [ 1] 4257 	jrne set_data_pointer 
      00AB73 01 72            [ 2] 4258 	jra data_error 
      002E37                       4259 0$:
      002E37                       4260 	_unget_token  
      00AB75 A9 00 03 9F 88   [ 1]    1      mov in,in.saved  
                                   4261 ; search first DATA line 	
      00AB7A 90 F6 93         [ 2] 4262 1$:	cpw x,txtend
      00AB7D EE 01            [ 1] 4263 	jruge data_error 
      002E41                       4264 2$:	
      00AB7F 72 A9 00         [ 4] 4265 	call is_data_line 
      00AB82 03 0D            [ 1] 4266 	jrne 4$
      00AB84 01 27 07         [ 4] 4267 4$:	call try_next_line 
      00AB87 98 46            [ 1] 4268 	jrne 4$ 
      00AB89 56               [ 4] 4269 	ret 
                                   4270 
                                   4271 ;---------------------
                                   4272 ; set data pointer 
                                   4273 ; variables at new line 
                                   4274 ; input:
                                   4275 ;    X    line address 
                                   4276 ;----------------------
      002E4C                       4277 set_data_pointer:
      00AB8A 0A 01 26         [ 2] 4278 	ldw data_ptr,x
      00AB8D F9 5B            [ 1] 4279 	ld a,(2,x)
      00AB8F 01 81 09         [ 1] 4280 	ld data_len,a 
      00AB91 35 06 00 08      [ 1] 4281 	mov data_ofs,#FIRST_DATA_ITEM
      00AB91 A6               [ 4] 4282 	ret 
                                   4283 
                                   4284 
                                   4285 ;--------------------
                                   4286 ; at end of data line 
                                   4287 ; check if next line 
                                   4288 ; is a data line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4289 ; input:
                                   4290 ;    X   actual line address 
                                   4291 ;  
                                   4292 ;-------------------
      002E59                       4293 try_next_line: 
      00AB92 84 CD            [ 1] 4294 	ld a,(2,x)
      00AB94 99 D0 CD         [ 1] 4295 	ld acc8,a 
      00AB97 98 4C 9F A4      [ 1] 4296 	clr acc16 
      00AB9B 07 C7 50 C6      [ 2] 4297 	addw x,acc16 
      00AB9F 81 00 1D         [ 2] 4298 	cpw x,txtend 
      00ABA0 25 02            [ 1] 4299 	jrult 1$
      00ABA0 52 01            [ 2] 4300 	jra data_error 
      002E6D                       4301 1$:	
      00ABA2 CD 99 E2         [ 4] 4302 	call is_data_line 
      00ABA5 A1 02            [ 1] 4303 	jreq 2$
      00ABA7 27 03            [ 1] 4304 	ld a,#1  
      00ABA9 CC 96            [ 2] 4305 	jra 9$
      00ABAB B0 90 F6         [ 4] 4306 2$:	call set_data_pointer
      00ABAE 93               [ 1] 4307 	clr a  
      00ABAF EE               [ 4] 4308 9$:	ret 
      002E7B                       4309 data_error:	
      00ABB0 01 72            [ 1] 4310     ld a,#ERR_NO_DATA 
      00ABB2 A9 00 03         [ 2] 4311 	jp tb_error 
                                   4312 
                                   4313 
                                   4314 ;---------------------------------
                                   4315 ; BASIC: READ 
                                   4316 ; return next data item | 0 
                                   4317 ;---------------------------------
                           000001  4318 	CTX_BPTR=1 
                           000003  4319 	CTX_IN=3 
                           000004  4320 	CTX_COUNT=4 
                           000005  4321 	INT24=5
                           000007  4322 	VSIZE=7 
      002E80                       4323 read:
      002E80                       4324 	_vars  VSIZE 
      00ABB5 CF 00            [ 2]    1     sub sp,#VSIZE 
      00ABB7 1A 90 F6         [ 4] 4325 	call save_context
      002E85                       4326 read01:	
      00ABBA 93 EE 01         [ 1] 4327 	ld a,data_ofs
      00ABBD 72 A9 00         [ 1] 4328 	cp a,data_len 
      00ABC0 03 CD            [ 1] 4329 	jreq 2$ ; end of line  
      002E8D                       4330 0$:
      00ABC2 AB FF 6B         [ 2] 4331 	ldw x,data_ptr 
      00ABC5 01 A6 01         [ 2] 4332 	ldw basicptr,x 
      00ABC8 0D 01 27 0D 48   [ 1] 4333 	mov in,data_ofs 
      00ABCD 0A 01 26 FB 6B   [ 1] 4334 	mov count,data_len  
      00ABD2 01 7B 01         [ 4] 4335 	call expression 
      00ABD5 EA 03            [ 1] 4336 	cp a,#TK_INTGR 
      00ABD7 E7 03            [ 1] 4337 	jreq 1$ 
      00ABD9 A6 01 C1         [ 2] 4338 	jp syntax_error 
      002EA7                       4339 1$:
      00ABDC 00 0F 27         [ 4] 4340 	call next_token ; skip comma
      00ABDF 10 7B 01         [ 2] 4341 	ldw x,basicptr 
      00ABE2 43 E4 04         [ 2] 4342 	ldw data_ptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00ABE5 E7 04 7B 01 43   [ 1] 4343 	mov data_ofs,in 
      00ABEA E4 02 E7         [ 4] 4344 	call rest_context
      002EB8                       4345 	_xpop 
      00ABED 02 20            [ 1]    1     ld a,(y)
      00ABEF 0C               [ 1]    2     ldw x,y 
      00ABF0 EE 01            [ 2]    3     ldw x,(1,x)
      00ABF0 7B 01 EA 02      [ 2]    4     addw y,#CELL_SIZE 
      002EC1                       4346 	_drop VSIZE 
      00ABF4 E7 02            [ 2]    1     addw sp,#VSIZE 
      00ABF6 7B               [ 4] 4347 	ret 
      002EC4                       4348 2$: ; end of line reached 
                                   4349 	; try next line 
      00ABF7 01 EA 04         [ 2] 4350 	ldw x,data_ptr  
      00ABFA E7 04 59         [ 4] 4351 	call try_next_line
      00ABFC 27 C1            [ 1] 4352 	jreq 0$ 
      00ABFC 5B 01            [ 2] 4353 	jra data_error 
                                   4354 
                                   4355 ;---------------------------------
                                   4356 ; BASIC: SPIEN clkdiv, 0|1  
                                   4357 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4358 ; if clkdiv==-1 disable SPI
                                   4359 ; 0|1 -> disable|enable  
                                   4360 ;--------------------------------- 
                           000005  4361 SPI_CS_BIT=5
      002ECE                       4362 spi_enable:
      00ABFE 81 19 62         [ 4] 4363 	call arg_list 
      00ABFF A1 02            [ 1] 4364 	cp a,#2
      00ABFF 58 1C            [ 1] 4365 	jreq 1$
      00AC01 AC 0F FE         [ 2] 4366 	jp syntax_error 
      002ED8                       4367 1$: 
      00AC04 9F 88 5E A6      [ 1] 4368 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00AC08 05               [ 2] 4369 	popw x  
      00AC09 42               [ 2] 4370 	tnzw x 
      00AC0A 1C 50            [ 1] 4371 	jreq spi_disable 
      00AC0C 00               [ 2] 4372 	popw x 
      00AC0D 84 81            [ 1] 4373 	ld a,#(1<<SPI_CR1_BR)
      00AC0F 42               [ 4] 4374 	mul x,a 
      00AC0F 03               [ 1] 4375 	ld a,xl 
      00AC10 06 03 05         [ 1] 4376 	ld SPI_CR1,a 
                                   4377 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00AC13 04 00 02 01      [ 1] 4378 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00AC17 06 00 02 02      [ 1] 4379 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4380 ; configure SPI as master mode 0.	
      00AC1B 02 03 03 01      [ 1] 4381 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4382 ; ~CS line controlled by sofware 	
      00AC1F 03 03 02 04      [ 1] 4383 	bset SPI_CR2,#SPI_CR2_SSM 
      00AC23 04 05 02 06      [ 1] 4384     bset SPI_CR2,#SPI_CR2_SSI 
                                   4385 ; enable SPI
      00AC27 02 07 02 05      [ 1] 4386 	bset SPI_CR1,#SPI_CR1_SPE 	
      00AC2B 04               [ 4] 4387 	ret 
      002F01                       4388 spi_disable:
      002F01                       4389 	_drop #2; throw first argument.
      00AC2C 02 04            [ 2]    1     addw sp,##2 
                                   4390 ; wait spi idle 
      00AC2E 01 82            [ 1] 4391 1$:	ld a,#0x82 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00AC2F C4 52 03         [ 1] 4392 	and a,SPI_SR
      00AC2F CD 99            [ 1] 4393 	cp a,#2 
      00AC31 DD A1            [ 1] 4394 	jrne 1$
      00AC33 01 27 03 CC      [ 1] 4395 	bres SPI_CR1,#SPI_CR1_SPE
      00AC37 96 B0 50 C7      [ 1] 4396 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00AC39 72 1B 50 16      [ 1] 4397 	bres PE_DDR,#SPI_CS_BIT 
      00AC39 90               [ 4] 4398 	ret 
                                   4399 
      002F19                       4400 spi_clear_error:
      00AC3A F6 93            [ 1] 4401 	ld a,#0x78 
      00AC3C EE 01 72         [ 1] 4402 	bcp a,SPI_SR 
      00AC3F A9 00            [ 1] 4403 	jreq 1$
      00AC41 03 89 88 A6      [ 1] 4404 	clr SPI_SR 
      00AC45 80               [ 4] 4405 1$: ret 
                                   4406 
      002F25                       4407 spi_send_byte:
      00AC46 15               [ 1] 4408 	push a 
      00AC47 01 27 05         [ 4] 4409 	call spi_clear_error
      00AC4A A6               [ 1] 4410 	pop a 
      00AC4B 0A CC 96 B2 FB   [ 2] 4411 	btjf SPI_SR,#SPI_SR_TXE,.
      00AC4F C7 52 04         [ 1] 4412 	ld SPI_DR,a
      00AC4F CE 00 15 58 58   [ 2] 4413 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00AC54 58 58 58         [ 1] 4414 	ld a,SPI_DR 
      00AC57 9E               [ 4] 4415 	ret 
                                   4416 
      002F3B                       4417 spi_rcv_byte:
      00AC58 C8 00            [ 1] 4418 	ld a,#255
      00AC5A 15 C7 00 0E 9F   [ 2] 4419 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00AC5F C8 00 16         [ 1] 4420 	ld a,SPI_DR 
      00AC62 C7               [ 4] 4421 	ret
                                   4422 
                                   4423 ;------------------------------
                                   4424 ; BASIC: SPIWR byte [,byte]
                                   4425 ; write 1 or more byte
                                   4426 ;------------------------------
      002F46                       4427 spi_write:
      00AC63 00 0F CE         [ 4] 4428 	call expression
      00AC66 00 17            [ 1] 4429 	cp a,#TK_INTGR 
      00AC68 CF 00            [ 1] 4430 	jreq 1$
      00AC6A 15 CE 00         [ 2] 4431 	jp syntax_error 
      002F50                       4432 1$:	
      00AC6D 17               [ 1] 4433 	ld a,xl 
      00AC6E 54 9E C8         [ 4] 4434 	call spi_send_byte 
      00AC71 00 17 C7         [ 4] 4435 	call next_token 
      00AC74 00 17            [ 1] 4436 	cp a,#TK_COMMA 
      00AC76 9F C8            [ 1] 4437 	jrne 2$ 
      00AC78 00 18            [ 2] 4438 	jra spi_write 
      00AC7A C7               [ 1] 4439 2$:	tnz a 
      00AC7B 00 18            [ 1] 4440 	jreq 3$
      002F60                       4441 	_unget_token  
      00AC7D CE 00 0E 54 54   [ 1]    1      mov in,in.saved  
      00AC82 54               [ 4] 4442 3$:	ret 
                                   4443 
                                   4444 
                                   4445 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4446 ; BASIC: SPIRD 	
                                   4447 ; read one byte from SPI 
                                   4448 ;-------------------------------
      002F66                       4449 spi_read:
      00AC83 9E C8 00         [ 4] 4450 	call spi_rcv_byte 
      00AC86 0E               [ 1] 4451 	clrw x 
      00AC87 C7               [ 1] 4452 	ld xl,a 
      00AC88 00               [ 1] 4453 	clr a  
      00AC89 0E               [ 4] 4454 	ret 
                                   4455 
                                   4456 ;------------------------------
                                   4457 ; BASIC: SPISEL 0|1 
                                   4458 ; set state of ~CS line
                                   4459 ; 0|1 deselect|select  
                                   4460 ;------------------------------
      002F6D                       4461 spi_select:
      00AC8A 9F C8 00         [ 4] 4462 	call next_token 
      00AC8D 0F C7            [ 1] 4463 	cp a,#TK_INTGR 
      00AC8F 00 0F            [ 1] 4464 	jreq 1$
      00AC91 C8 00 18         [ 2] 4465 	jp syntax_error 
      00AC94 97               [ 2] 4466 1$: tnzw x  
      00AC95 C6 00            [ 1] 4467 	jreq cs_high 
      00AC97 0E C8 00 17      [ 1] 4468 	bres PE_ODR,#SPI_CS_BIT
      00AC9B 95               [ 4] 4469 	ret 
      002F7F                       4470 cs_high: 
      00AC9C CF 00 17 C6      [ 1] 4471 	bset PE_ODR,#SPI_CS_BIT
      00ACA0 00               [ 4] 4472 	ret 
                                   4473 
                                   4474 ;-------------------------------
                                   4475 ; BASIC: PAD 
                                   4476 ; Return pad buffer address.
                                   4477 ;------------------------------
      002F84                       4478 pad_ref:
      00ACA1 16 A4 7F         [ 2] 4479 	ldw x,#pad 
      00ACA4 72               [ 1] 4480 	clr a
      00ACA5 A2               [ 4] 4481 	ret 
                                   4482 
                                   4483 ;****************************
                                   4484 ; expression stack 
                                   4485 ; manipulation routines
                                   4486 ;****************************
                                   4487 
                                   4488 ;-----------------------------
                                   4489 ; BASIC: PUSH expr|rel|cond 
                                   4490 ; push the result on xtack
                                   4491 ;-----------------------------
      002F89                       4492 xpush:
      00ACA6 00 03 90         [ 4] 4493 	call condition 
      00ACA9 F7               [ 4] 4494 	ret 
                                   4495 
                                   4496 ;------------------------------
                                   4497 ; BASIC: POP 
                                   4498 ; pop top of xstack 
                                   4499 ;------------------------------
      002F8D                       4500 xpop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      002F8D                       4501 	_xpop 
      00ACAA 90 EF            [ 1]    1     ld a,(y)
      00ACAC 01               [ 1]    2     ldw x,y 
      00ACAD 84 85            [ 2]    3     ldw x,(1,x)
      00ACAF 72 A2 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00ACB3 90               [ 4] 4502 	ret 
                                   4503 
                                   4504 
                                   4505 ;------------------------------
                                   4506 ; BASIC: ALLOC expr 
                                   4507 ; allocate expr element on xtack 
                                   4508 ;-------------------------------
      002F97                       4509 xalloc: 
      00ACB4 F7 90 EF         [ 4] 4510 	call expression 
      00ACB7 01 CD            [ 1] 4511 	cp a,#TK_INTGR
      00ACB9 84 0E            [ 1] 4512 	jreq 1$ 
      00ACBB 90 F6 93         [ 2] 4513 	jp syntax_error
      002FA1                       4514 1$: _xpop 
      00ACBE EE 01            [ 1]    1     ld a,(y)
      00ACC0 72               [ 1]    2     ldw x,y 
      00ACC1 A9 00            [ 2]    3     ldw x,(1,x)
      00ACC3 03 1C 00 01      [ 2]    4     addw y,#CELL_SIZE 
      00ACC7 A9               [ 1] 4515 	tnz a 
      00ACC8 00 81            [ 1] 4516 	jreq 3$ 
      00ACCA A6 0A            [ 1] 4517 2$:	ld a,#ERR_BAD_VALUE
      00ACCA 90 89 52         [ 2] 4518 	jp tb_error 
      00ACCD 03 0F 02         [ 2] 4519 3$: cpw x,#XSTACK_SIZE 
      00ACD0 0F 03            [ 1] 4520 	jrugt 2$
      00ACD2 90 AE            [ 1] 4521 	ld a,#CELL_SIZE 
      00ACD4 B4               [ 4] 4522 	mul x,a 
      00ACD5 9F 93 F6         [ 2] 4523 	ldw acc16,x 
      00ACD8 A4 0F 6B 01      [ 2] 4524 	subw y,acc16 
      00ACDC 0C 03 5C F6      [ 2] 4525 	cpw y,#xstack_full
      00ACE0 CD 89            [ 1] 4526 	jrugt 9$
      00ACE2 55 0C            [ 1] 4527 	ld a,#ERR_MEM_FULL
      00ACE4 02 0A 01         [ 2] 4528 	jp tb_error 
      002FCC                       4529 9$:	 
      00ACE7 26               [ 4] 4530 	ret 
                                   4531 
                                   4532 
                                   4533 ;------------------------------
                                   4534 ;  BASIC DROP expr 
                                   4535 ;  expr in range {0..XSTACK_SIZE}
                                   4536 ;  discard n elements from xtack
                                   4537 ;------------------------------
      002FCD                       4538 xdrop:
      00ACE8 F5 A6 46         [ 4] 4539 	call expression 
      00ACEB 11 02            [ 1] 4540 	cp a,#TK_INTGR
      00ACED 2B 09            [ 1] 4541 	jreq 1$ 
      00ACEF A6 20 CD         [ 2] 4542 	jp syntax_error 
      002FD7                       4543 1$:	_xpop 
      00ACF2 89 55            [ 1]    1     ld a,(y)
      00ACF4 0C               [ 1]    2     ldw x,y 
      00ACF5 02 20            [ 2]    3     ldw x,(1,x)
      00ACF7 07 A6 0D CD      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00ACFB 89               [ 1] 4544 	ld a,xl 
      00ACFC 55 0F            [ 1] 4545 	and a,#0x1f 
      00ACFE 02               [ 1] 4546 	clrw x 
      00ACFF 72               [ 1] 4547 	ld xl,a 
      00AD00 A2 00            [ 1] 4548 	ld a,#CELL_SIZE 
      00AD02 02               [ 4] 4549 	mul x,a 
      00AD03 90 FE 26         [ 2] 4550 	ldw acc16,x  
      00AD06 CF A6 0D CD      [ 2] 4551 	addw y,acc16 
      00AD0A 89 55 5F 7B      [ 2] 4552 	cpw y,#XSTACK_EMPTY 
      00AD0E 03 97            [ 2] 4553 	jrule 9$
      00AD10 CD 98 62 AE      [ 2] 4554 	ldw y,#XSTACK_EMPTY 
      00AD14 AD               [ 4] 4555 9$:	ret 
                                   4556 
                                   4557 ;-----------------------
                                   4558 ; check if value in A:X 
                                   4559 ; is inside xstack bound
                                   4560 ; output:
                                   4561 ;    X     slot address  
                                   4562 ;-----------------------
      002FFA                       4563 xstack_bound:
      00AD15 1E               [ 1] 4564 	tnz a 
      00AD16 CD 89            [ 1] 4565 	jrne 8$ 
      00AD18 B2 5B 03         [ 2] 4566 1$: cpw x,#XSTACK_SIZE 
      00AD1B 90 85            [ 1] 4567 	jrugt 8$
      00AD1D 81 20            [ 1] 4568 	ld a,#CELL_SIZE 
      00AD1F 77               [ 4] 4569 	mul x,a
      00AD20 6F 72 64         [ 2] 4570 	ldw acc16,x 
      00AD23 73               [ 1] 4571 	ldw x,y 
      00AD24 20 69 6E 20      [ 2] 4572 	addw x,acc16 
      00AD28 64 69 63         [ 2] 4573 	cpw x,#XSTACK_EMPTY 
      00AD2B 74 69            [ 1] 4574 	jruge 8$  
      00AD2D 6F               [ 4] 4575 	ret 
      00AD2E 6E 61            [ 1] 4576 8$: ld a,#ERR_BAD_VALUE
      00AD30 72 79 0A         [ 2] 4577 	jp tb_error 
                                   4578 
                                   4579 ;-------------------------
                                   4580 ; BASIC: PUT expr, cond 
                                   4581 ; expr -> slot 
                                   4582 ; cond -> valut to put 
                                   4583 ; on xstack 
                                   4584 ;-------------------------
      003018                       4585 xput:
      00AD33 00 19 62         [ 4] 4586 	call arg_list 
      00AD34 A1 02            [ 1] 4587 	cp a,#2 
      00AD34 CD 99            [ 1] 4588 	jreq 1$ 
      00AD36 E2 A1 01         [ 2] 4589 0$:	jp syntax_error
      003022                       4590 1$: _xpop   ; value to put 
      00AD39 27 03            [ 1]    1     ld a,(y)
      00AD3B CC               [ 1]    2     ldw x,y 
      00AD3C 96 B0            [ 2]    3     ldw x,(1,x)
      00AD3E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AD3E 90               [ 2] 4591 	pushw x 
      00AD3F F6               [ 1] 4592 	push a 
      00302D                       4593 	_xpop    ; slot 
      00AD40 93 EE            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00AD42 01               [ 1]    2     ldw x,y 
      00AD43 72 A9            [ 2]    3     ldw x,(1,x)
      00AD45 00 03 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00AD49 13 81 FA         [ 4] 4594 	call xstack_bound
      00AD4B CF 00 19         [ 2] 4595     ldw ptr16,x 
      00AD4B 4F               [ 1] 4596 	pop a 
      00AD4C CE               [ 2] 4597 	popw x 
      00AD4D 00 13 27 02      [ 4] 4598 	ld [ptr16],a 
      00AD51 5F 81 43 53      [ 1] 4599 	inc ptr8 
      00AD55 81 CF 00 19      [ 5] 4600 	ldw [ptr16],x 
      00AD56 81               [ 4] 4601 	ret 
                                   4602 
                                   4603 ;------------------------
                                   4604 ; BASIC: PICK expr 
                                   4605 ; get nième element on 
                                   4606 ; xtack. 
                                   4607 ;-----------------------
      00304B                       4608 xpick:
      00AD56 CD 99 E2         [ 4] 4609 	call func_args 
      00AD59 A1 01            [ 1] 4610 	cp a,#1 
      00AD5B 27 03            [ 1] 4611 	jreq 1$
      00AD5D CC 96 B0         [ 2] 4612 	jp syntax_error 
      003055                       4613 1$: _xpop 
      00AD60 90 F6            [ 1]    1     ld a,(y)
      00AD62 93               [ 1]    2     ldw x,y 
      00AD63 EE 01            [ 2]    3     ldw x,(1,x)
      00AD65 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AD69 4B 00 35         [ 4] 4614 	call xstack_bound
      00AD6C CC               [ 1] 4615     ld a,(x)
      00AD6D 50 E0            [ 2] 4616 	ldw x,(1,x)				
      00AD6F 9E               [ 4] 4617 	ret 
                                   4618 
                                   4619 
                                   4620 
                                   4621 ;------------------------------
                                   4622 ;      dictionary 
                                   4623 ; format:
                                   4624 ;   link:   2 bytes 
                                   4625 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4626 ;   cmd_name: 16 byte max 
                                   4627 ;   code_addr: 2 bytes 
                                   4628 ;------------------------------
                                   4629 	.macro _dict_entry len,name,code_addr 
                                   4630 	.word LINK 
                                   4631 	LINK=.
                                   4632 name:
                                   4633 	.byte len   	
                                   4634 	.ascii "name"
                                   4635 	.word code_addr  
                                   4636 	.endm 
                                   4637 
                           000000  4638 	LINK=0
                                   4639 ; respect alphabetic order for BASIC names from Z-A
                                   4640 ; this sort order is for a cleaner WORDS cmd output. 	
      003065                       4641 kword_end:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      003065                       4642 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AD70 A4 3F                    1 	.word LINK 
                           003067     2 	LINK=.
      003067                          3 XOR:
      00AD72 95                       4 	.byte 3+F_XOR   	
      00AD73 A3 00 FF                 5 	.ascii "XOR"
      00AD76 23 06                    6 	.word TK_XOR  
      00306D                       4643 	_dict_entry,5,WRITE,write  
      00AD78 0C 01                    1 	.word LINK 
                           00306F     2 	LINK=.
      00306F                          3 WRITE:
      00AD7A 98                       4 	.byte 5   	
      00AD7B 56 20 F5 35 55           5 	.ascii "WRITE"
      00AD80 50 E0                    6 	.word write  
      003077                       4644 	_dict_entry,5,WORDS,words 
      00AD82 84 C7                    1 	.word LINK 
                           003079     2 	LINK=.
      003079                          3 WORDS:
      00AD84 50                       4 	.byte 5   	
      00AD85 E1 9F 4A 35 55           5 	.ascii "WORDS"
      00AD8A 50 E0                    6 	.word words  
      003081                       4645 	_dict_entry 4,WAIT,wait 
      00AD8C C7 50                    1 	.word LINK 
                           003083     2 	LINK=.
      003083                          3 WAIT:
      00AD8E E2                       4 	.byte 4   	
      00AD8F 35 AA 50 E0              5 	.ascii "WAIT"
      00AD93 81 44                    6 	.word wait  
      00AD94                       4646 	_dict_entry,3+F_IFUNC,USR,usr
      00AD94 35 AA                    1 	.word LINK 
                           00308C     2 	LINK=.
      00308C                          3 USR:
      00AD96 50                       4 	.byte 3+F_IFUNC   	
      00AD97 E0 81 52                 5 	.ascii "USR"
      00AD99 29 EF                    6 	.word usr  
      003092                       4647 	_dict_entry,5,UNTIL,until 
      00AD99 CD 99                    1 	.word LINK 
                           003094     2 	LINK=.
      003094                          3 UNTIL:
      00AD9B DD                       4 	.byte 5   	
      00AD9C A1 01 27 03 CC           5 	.ascii "UNTIL"
      00ADA1 96 B0                    6 	.word until  
      00ADA3                       4648 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00ADA3 90 F6                    1 	.word LINK 
                           00309E     2 	LINK=.
      00309E                          3 UFLASH:
      00ADA5 93                       4 	.byte 6+F_IFUNC   	
      00ADA6 EE 01 72 A9 00 03        5 	.ascii "UFLASH"
      00ADAC 4D 26                    6 	.word uflash  
      0030A7                       4649 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00ADAE 08 5D                    1 	.word LINK 
                           0030A9     2 	LINK=.
      0030A9                          3 UBOUND:
      00ADB0 26                       4 	.byte 6+F_IFUNC   	
      00ADB1 05 A6 0A CC 96 B2        5 	.ascii "UBOUND"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00ADB7 4B 18                    6 	.word ubound  
      0030B2                       4650 	_dict_entry,4,TONE,tone  
      00ADB9 59 49                    1 	.word LINK 
                           0030B4     2 	LINK=.
      0030B4                          3 TONE:
      00ADBB 25                       4 	.byte 4   	
      00ADBC 04 0A 01 26              5 	.ascii "TONE"
      00ADC0 F8 5F                    6 	.word tone  
      0030BB                       4651 	_dict_entry,2,TO,to
      00ADC2 84 4A                    1 	.word LINK 
                           0030BD     2 	LINK=.
      0030BD                          3 TO:
      00ADC4 02                       4 	.byte 2   	
      00ADC5 54 4F                    5 	.ascii "TO"
      00ADC5 81 AE                    6 	.word to  
      00ADC6                       4652 	_dict_entry,5,TIMER,set_timer
      00ADC6 CD 99                    1 	.word LINK 
                           0030C4     2 	LINK=.
      0030C4                          3 TIMER:
      00ADC8 DD                       4 	.byte 5   	
      00ADC9 A1 01 27 03 CC           5 	.ascii "TIMER"
      00ADCE 96 B0                    6 	.word set_timer  
      0030CC                       4653 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00ADD0 90 F6                    1 	.word LINK 
                           0030CE     2 	LINK=.
      0030CE                          3 TIMEOUT:
      00ADD2 93                       4 	.byte 7+F_IFUNC   	
      00ADD3 EE 01 72 A9 00 03 9F     5 	.ascii "TIMEOUT"
      00ADDA AE 00                    6 	.word timeout  
      0030D8                       4654 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00ADDC 01 A4                    1 	.word LINK 
                           0030DA     2 	LINK=.
      0030DA                          3 TICKS:
      00ADDE 17                       4 	.byte 5+F_IFUNC   	
      00ADDF 27 0A 88 4F 53           5 	.ascii "TICKS"
      00ADE3 2A 9B                    6 	.word get_ticks  
      0030E2                       4655 	_dict_entry,4,STOP,stop 
      00ADE3 58 49                    1 	.word LINK 
                           0030E4     2 	LINK=.
      0030E4                          3 STOP:
      00ADE5 0A                       4 	.byte 4   	
      00ADE6 01 26 FA 50              5 	.ascii "STOP"
      00ADE9 27 17                    6 	.word stop  
      0030EB                       4656 	_dict_entry,4,STEP,step 
      00ADE9 5B 01                    1 	.word LINK 
                           0030ED     2 	LINK=.
      0030ED                          3 STEP:
      00ADEB 81                       4 	.byte 4   	
      00ADEC 53 54 45 50              5 	.ascii "STEP"
      00ADEC 85 52                    6 	.word step  
      0030F4                       4657 	_dict_entry,5,SPIWR,spi_write
      00ADEE 04 89                    1 	.word LINK 
                           0030F6     2 	LINK=.
      0030F6                          3 SPIWR:
      00ADF0 CE                       4 	.byte 5   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00ADF1 00 05 1F 03 CE           5 	.ascii "SPIWR"
      00ADF6 00 01                    6 	.word spi_write  
      0030FE                       4658 	_dict_entry,6,SPISEL,spi_select
      00ADF8 1F 05                    1 	.word LINK 
                           003100     2 	LINK=.
      003100                          3 SPISEL:
      00ADFA 72                       4 	.byte 6   	
      00ADFB 5C 00 20 81 45 4C        5 	.ascii "SPISEL"
      00ADFF 2F 6D                    6 	.word spi_select  
      003109                       4659 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00ADFF 72 5D                    1 	.word LINK 
                           00310B     2 	LINK=.
      00310B                          3 SPIRD:
      00AE01 00                       4 	.byte 5+F_IFUNC   	
      00AE02 20 26 03 CC 96           5 	.ascii "SPIRD"
      00AE07 B0 66                    6 	.word spi_read  
      00AE08                       4660 	_dict_entry,5,SPIEN,spi_enable 
      00AE08 CD 9C                    1 	.word LINK 
                           003115     2 	LINK=.
      003115                          3 SPIEN:
      00AE0A 3F                       4 	.byte 5   	
      00AE0B 90 F6 93 EE 01           5 	.ascii "SPIEN"
      00AE10 72 A9                    6 	.word spi_enable  
      00311D                       4661 	_dict_entry,5,SLEEP,sleep 
      00AE12 00 03                    1 	.word LINK 
                           00311F     2 	LINK=.
      00311F                          3 SLEEP:
      00AE14 4D                       4 	.byte 5   	
      00AE15 26 13 5D 26 10           5 	.ascii "SLEEP"
      00AE1A 1E 03                    6 	.word sleep  
      003127                       4662     _dict_entry,4,SIZE,cmd_size 
      00AE1C CF 00                    1 	.word LINK 
                           003129     2 	LINK=.
      003129                          3 SIZE:
      00AE1E 05                       4 	.byte 4   	
      00AE1F E6 02 C7 00              5 	.ascii "SIZE"
      00AE23 04 1E                    6 	.word cmd_size  
      003130                       4663 	_dict_entry,4,SAVE,save_app 
      00AE25 05 CF                    1 	.word LINK 
                           003132     2 	LINK=.
      003132                          3 SAVE:
      00AE27 00                       4 	.byte 4   	
      00AE28 01 81 56 45              5 	.ascii "SAVE"
      00AE2A 28 09                    6 	.word save_app  
      003139                       4664 	_dict_entry 3,RUN,run
      00AE2A 85 5B                    1 	.word LINK 
                           00313B     2 	LINK=.
      00313B                          3 RUN:
      00AE2C 04                       4 	.byte 3   	
      00AE2D 72 5A 00                 5 	.ascii "RUN"
      00AE30 20 FC                    6 	.word run  
      00AE32                       4665 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00AE32 AE 50                    1 	.word LINK 
                           003143     2 	LINK=.
      003143                          3 RSHIFT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00AE34 00                       4 	.byte 6+F_IFUNC   	
      00AE35 4F 81 48 49 46 54        5 	.ascii "RSHIFT"
      00AE37 2A E5                    6 	.word rshift  
      00314C                       4666 	_dict_entry,3+F_IFUNC,RND,random 
      00AE37 AE 50                    1 	.word LINK 
                           00314E     2 	LINK=.
      00314E                          3 RND:
      00AE39 05                       4 	.byte 3+F_IFUNC   	
      00AE3A 4F 81 44                 5 	.ascii "RND"
      00AE3C 2B AF                    6 	.word random  
      003154                       4667 	_dict_entry,6,RETURN,return 
      00AE3C AE 50                    1 	.word LINK 
                           003156     2 	LINK=.
      003156                          3 RETURN:
      00AE3E 0A                       4 	.byte 6   	
      00AE3F 4F 81 54 55 52 4E        5 	.ascii "RETURN"
      00AE41 24 ED                    6 	.word return  
      00315F                       4668 	_dict_entry,7,RESTORE,restore 
      00AE41 AE 50                    1 	.word LINK 
                           003161     2 	LINK=.
      003161                          3 RESTORE:
      00AE43 0F                       4 	.byte 7   	
      00AE44 4F 81 53 54 4F 52 45     5 	.ascii "RESTORE"
      00AE46 2E 16                    6 	.word restore  
      00316B                       4669 	_dict_entry 3,REM,remark 
      00AE46 AE 50                    1 	.word LINK 
                           00316D     2 	LINK=.
      00316D                          3 REM:
      00AE48 14                       4 	.byte 3   	
      00AE49 4F 81 4D                 5 	.ascii "REM"
      00AE4B 21 3E                    6 	.word remark  
      003173                       4670 	_dict_entry,6,REBOOT,cold_start
      00AE4B AE 50                    1 	.word LINK 
                           003175     2 	LINK=.
      003175                          3 REBOOT:
      00AE4D 19                       4 	.byte 6   	
      00AE4E 4F 81 42 4F 4F 54        5 	.ascii "REBOOT"
      00AE50 00 B5                    6 	.word cold_start  
      00317E                       4671 	_dict_entry,4+F_IFUNC,READ,read  
      00AE50 AE 50                    1 	.word LINK 
                           003180     2 	LINK=.
      003180                          3 READ:
      00AE52 1E                       4 	.byte 4+F_IFUNC   	
      00AE53 4F 81 41 44              5 	.ascii "READ"
      00AE55 2E 80                    6 	.word read  
      003187                       4672 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AE55 AE 50                    1 	.word LINK 
                           003189     2 	LINK=.
      003189                          3 QKEY:
      00AE57 28                       4 	.byte 4+F_IFUNC   	
      00AE58 4F 81 45 59              5 	.ascii "QKEY"
      00AE5A 29 95                    6 	.word qkey  
      003190                       4673 	_dict_entry,3,PUT,xput 
      00AE5A 4F AE                    1 	.word LINK 
                           003192     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      003192                          3 PUT:
      00AE5C 00                       4 	.byte 3   	
      00AE5D 00 81 54                 5 	.ascii "PUT"
      00AE5F 30 18                    6 	.word xput  
      003198                       4674 	_dict_entry,4,PUSH,xpush   
      00AE5F 4F AE                    1 	.word LINK 
                           00319A     2 	LINK=.
      00319A                          3 PUSH:
      00AE61 00                       4 	.byte 4   	
      00AE62 01 81 53 48              5 	.ascii "PUSH"
      00AE64 2F 89                    6 	.word xpush  
      0031A1                       4675 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AE64 4F AE                    1 	.word LINK 
                           0031A3     2 	LINK=.
      0031A3                          3 PORTI:
      00AE66 00                       4 	.byte 5+F_IFUNC   	
      00AE67 02 81 52 54 49           5 	.ascii "PORTI"
      00AE69 2D D5                    6 	.word const_porti  
      0031AB                       4676 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AE69 4F AE                    1 	.word LINK 
                           0031AD     2 	LINK=.
      0031AD                          3 PORTG:
      00AE6B 00                       4 	.byte 5+F_IFUNC   	
      00AE6C 03 81 52 54 47           5 	.ascii "PORTG"
      00AE6E 2D D0                    6 	.word const_portg  
      0031B5                       4677 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AE6E 4F AE                    1 	.word LINK 
                           0031B7     2 	LINK=.
      0031B7                          3 PORTF:
      00AE70 00                       4 	.byte 5+F_IFUNC   	
      00AE71 04 81 52 54 46           5 	.ascii "PORTF"
      00AE73 2D CB                    6 	.word const_portf  
      0031BF                       4678 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AE73 4F AE                    1 	.word LINK 
                           0031C1     2 	LINK=.
      0031C1                          3 PORTE:
      00AE75 00                       4 	.byte 5+F_IFUNC   	
      00AE76 01 81 52 54 45           5 	.ascii "PORTE"
      00AE78 2D C6                    6 	.word const_porte  
      0031C9                       4679 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AE78 4F AE                    1 	.word LINK 
                           0031CB     2 	LINK=.
      0031CB                          3 PORTD:
      00AE7A 00                       4 	.byte 5+F_IFUNC   	
      00AE7B 00 81 52 54 44           5 	.ascii "PORTD"
      00AE7D 2D C1                    6 	.word const_portd  
      0031D3                       4680 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AE7D 4F AE                    1 	.word LINK 
                           0031D5     2 	LINK=.
      0031D5                          3 PORTC:
      00AE7F 40                       4 	.byte 5+F_IFUNC   	
      00AE80 00 81 52 54 43           5 	.ascii "PORTC"
      00AE82 2D BC                    6 	.word const_portc  
      0031DD                       4681 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AE82 55 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



                           0031DF     2 	LINK=.
      0031DF                          3 PORTB:
      00AE84 04                       4 	.byte 5+F_IFUNC   	
      00AE85 00 02 81 54 42           5 	.ascii "PORTB"
      00AE88 2D B7                    6 	.word const_portb  
      0031E7                       4682 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AE88 89 E6                    1 	.word LINK 
                           0031E9     2 	LINK=.
      0031E9                          3 PORTA:
      00AE8A 03                       4 	.byte 5+F_IFUNC   	
      00AE8B A1 80 26 05 EE           5 	.ascii "PORTA"
      00AE90 04 A3                    6 	.word const_porta  
      0031F1                       4683 	_dict_entry 5,PRINT,print 
      00AE92 AE 82                    1 	.word LINK 
                           0031F3     2 	LINK=.
      0031F3                          3 PRINT:
      00AE94 85                       4 	.byte 5   	
      00AE95 81 52 49 4E 54           5 	.ascii "PRINT"
      00AE96 1F F6                    6 	.word print  
      0031FB                       4684 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AE96 5F CF                    1 	.word LINK 
                           0031FD     2 	LINK=.
      0031FD                          3 POUT:
      00AE98 00                       4 	.byte 4+F_IFUNC   	
      00AE99 07 CF 00 09              5 	.ascii "POUT"
      00AE9D CE 00                    6 	.word const_output  
      003204                       4685 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AE9F 1C CD                    1 	.word LINK 
                           003206     2 	LINK=.
      003206                          3 POP:
      00AEA1 98                       4 	.byte 3+F_IFUNC   	
      00AEA2 1A A1 84                 5 	.ascii "POP"
      00AEA5 26 10                    6 	.word xpop  
      00320C                       4686 	_dict_entry,4,POKE,poke 
      00AEA7 CD 98                    1 	.word LINK 
                           00320E     2 	LINK=.
      00320E                          3 POKE:
      00AEA9 4C                       4 	.byte 4   	
      00AEAA 90 89 4F CD              5 	.ascii "POKE"
      00AEAE 8C 8F                    6 	.word poke  
      003215                       4687 	_dict_entry,5,PMODE,pin_mode 
      00AEB0 90 85                    1 	.word LINK 
                           003217     2 	LINK=.
      003217                          3 PMODE:
      00AEB2 5D                       4 	.byte 5   	
      00AEB3 26 17 20 44 45           5 	.ascii "PMODE"
      00AEB7 2B 20                    6 	.word pin_mode  
      00321F                       4688 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AEB7 55 00                    1 	.word LINK 
                           003221     2 	LINK=.
      003221                          3 PINP:
      00AEB9 03                       4 	.byte 4+F_IFUNC   	
      00AEBA 00 02 C3 00              5 	.ascii "PINP"
      00AEBE 1E 24                    6 	.word const_input  
      003228                       4689 	_dict_entry,4+F_IFUNC,PICK,xpick 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AEC0 3A 21                    1 	.word LINK 
                           00322A     2 	LINK=.
      00AEC1                          3 PICK:
      00AEC1 CD                       4 	.byte 4+F_IFUNC   	
      00AEC2 AE 88 26 00              5 	.ascii "PICK"
      00AEC6 CD AE                    6 	.word xpick  
      003231                       4690 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AEC8 D9 26                    1 	.word LINK 
                           003233     2 	LINK=.
      003233                          3 PEEK:
      00AECA FB                       4 	.byte 4+F_IFUNC   	
      00AECB 81 45 45 4B              5 	.ascii "PEEK"
      00AECC 22 40                    6 	.word peek  
      00323A                       4691 	_dict_entry,5,PAUSE,pause 
      00AECC CF 00                    1 	.word LINK 
                           00323C     2 	LINK=.
      00323C                          3 PAUSE:
      00AECE 07                       4 	.byte 5   	
      00AECF E6 02 C7 00 0A           5 	.ascii "PAUSE"
      00AED4 35 06                    6 	.word pause  
      003244                       4692 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AED6 00 09                    1 	.word LINK 
                           003246     2 	LINK=.
      003246                          3 PAD:
      00AED8 81                       4 	.byte 3+F_IFUNC   	
      00AED9 50 41 44                 5 	.ascii "PAD"
      00AED9 E6 02                    6 	.word pad_ref  
      00324C                       4693 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AEDB C7 00                    1 	.word LINK 
                           00324E     2 	LINK=.
      00324E                          3 OR:
      00AEDD 0F                       4 	.byte 2+F_OR   	
      00AEDE 72 5F                    5 	.ascii "OR"
      00AEE0 00 0E                    6 	.word TK_OR  
      003253                       4694 	_dict_entry,2,ON,cmd_on 
      00AEE2 72 BB                    1 	.word LINK 
                           003255     2 	LINK=.
      003255                          3 ON:
      00AEE4 00                       4 	.byte 2   	
      00AEE5 0E C3                    5 	.ascii "ON"
      00AEE7 00 1E                    6 	.word cmd_on  
      00325A                       4695 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AEE9 25 02                    1 	.word LINK 
                           00325C     2 	LINK=.
      00325C                          3 ODR:
      00AEEB 20                       4 	.byte 3+F_IFUNC   	
      00AEEC 0E 44 52                 5 	.ascii "ODR"
      00AEED 2D DA                    6 	.word const_odr  
      003262                       4696 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AEED CD AE                    1 	.word LINK 
                           003264     2 	LINK=.
      003264                          3 NOT:
      00AEEF 88                       4 	.byte 3+F_NOT   	
      00AEF0 27 04 A6                 5 	.ascii "NOT"
      00AEF3 01 20                    6 	.word TK_NOT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00326A                       4697 	_dict_entry,4,NEXT,next 
      00AEF5 04 CD                    1 	.word LINK 
                           00326C     2 	LINK=.
      00326C                          3 NEXT:
      00AEF7 AE                       4 	.byte 4   	
      00AEF8 CC 4F 81 54              5 	.ascii "NEXT"
      00AEFB 23 36                    6 	.word next  
      003273                       4698 	_dict_entry,3,NEW,new
      00AEFB A6 0C                    1 	.word LINK 
                           003275     2 	LINK=.
      003275                          3 NEW:
      00AEFD CC                       4 	.byte 3   	
      00AEFE 96 B2 57                 5 	.ascii "NEW"
      00AF00 27 63                    6 	.word new  
      00327B                       4699 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AF00 52 07                    1 	.word LINK 
                           00327D     2 	LINK=.
      00327D                          3 LSHIFT:
      00AF02 CD                       4 	.byte 6+F_IFUNC   	
      00AF03 A0 FF 48 49 46 54        5 	.ascii "LSHIFT"
      00AF05 2A B9                    6 	.word lshift  
      003286                       4700 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AF05 C6 00                    1 	.word LINK 
                           003288     2 	LINK=.
      003288                          3 LOG2:
      00AF07 09                       4 	.byte 4+F_IFUNC   	
      00AF08 C1 00 0A 27              5 	.ascii "LOG2"
      00AF0C 37 19                    6 	.word log2  
      00AF0D                       4701 	_dict_entry 4,LIST,list
      00AF0D CE 00                    1 	.word LINK 
                           003291     2 	LINK=.
      003291                          3 LIST:
      00AF0F 07                       4 	.byte 4   	
      00AF10 CF 00 05 55              5 	.ascii "LIST"
      00AF14 00 09                    6 	.word list  
      003298                       4702 	_dict_entry 3,LET,let 
      00AF16 00 02                    1 	.word LINK 
                           00329A     2 	LINK=.
      00329A                          3 LET:
      00AF18 55                       4 	.byte 3   	
      00AF19 00 0A 00                 5 	.ascii "LET"
      00AF1C 04 CD                    6 	.word let  
      0032A0                       4703 	_dict_entry,3+F_CFUNC,KEY,key 
      00AF1E 9B 26                    1 	.word LINK 
                           0032A2     2 	LINK=.
      0032A2                          3 KEY:
      00AF20 A1                       4 	.byte 3+F_CFUNC   	
      00AF21 84 27 03                 5 	.ascii "KEY"
      00AF24 CC 96                    6 	.word key  
      0032A8                       4704 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AF26 B0 A2                    1 	.word LINK 
                           0032AA     2 	LINK=.
      00AF27                          3 IWDGREF:
      00AF27 CD                       4 	.byte 7   	
      00AF28 98 1A CE 00 05 CF 00     5 	.ascii "IWDGREF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal  07-Bits]



      00AF30 55 00                    6 	.word refresh_iwdg  
      0032B4                       4705 	_dict_entry,6,IWDGEN,enable_iwdg
      00AF32 02 00                    1 	.word LINK 
                           0032B6     2 	LINK=.
      0032B6                          3 IWDGEN:
      00AF34 09                       4 	.byte 6   	
      00AF35 CD A1 0F 90 F6 93        5 	.ascii "IWDGEN"
      00AF3B EE 01                    6 	.word enable_iwdg  
      0032BF                       4706 	_dict_entry,5,INPUT,input_var  
      00AF3D 72 A9                    1 	.word LINK 
                           0032C1     2 	LINK=.
      0032C1                          3 INPUT:
      00AF3F 00                       4 	.byte 5   	
      00AF40 03 5B 07 81 54           5 	.ascii "INPUT"
      00AF44 20 9F                    6 	.word input_var  
      0032C9                       4707 	_dict_entry,2,IF,if 
      00AF44 CE 00                    1 	.word LINK 
                           0032CB     2 	LINK=.
      0032CB                          3 IF:
      00AF46 07                       4 	.byte 2   	
      00AF47 CD AE                    5 	.ascii "IF"
      00AF49 D9 27                    6 	.word if  
      0032D0                       4708 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AF4B C1 20                    1 	.word LINK 
                           0032D2     2 	LINK=.
      0032D2                          3 IDR:
      00AF4D AD                       4 	.byte 3+F_IFUNC   	
      00AF4E 49 44 52                 5 	.ascii "IDR"
      00AF4E CD 99                    6 	.word const_idr  
      0032D8                       4709 	_dict_entry,3,HEX,hex_base
      00AF50 E2 A1                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 HEX:
      00AF52 02                       4 	.byte 3   	
      00AF53 27 03 CC                 5 	.ascii "HEX"
      00AF56 96 B0                    6 	.word hex_base  
      00AF58                       4710 	_dict_entry,4,GOTO,goto 
      00AF58 72 12                    1 	.word LINK 
                           0032E2     2 	LINK=.
      0032E2                          3 GOTO:
      00AF5A 50                       4 	.byte 4   	
      00AF5B C7 85 5D 27              5 	.ascii "GOTO"
      00AF5F 21 85                    6 	.word goto  
      0032E9                       4711 	_dict_entry,5,GOSUB,gosub 
      00AF61 A6 08                    1 	.word LINK 
                           0032EB     2 	LINK=.
      0032EB                          3 GOSUB:
      00AF63 42                       4 	.byte 5   	
      00AF64 9F C7 52 00 72           5 	.ascii "GOSUB"
      00AF69 1A 50                    6 	.word gosub  
      0032F3                       4712 	_dict_entry,3,GET,cmd_get 
      00AF6B 14 72                    1 	.word LINK 
                           0032F5     2 	LINK=.
      0032F5                          3 GET:
      00AF6D 1A                       4 	.byte 3   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AF6E 50 16 72                 5 	.ascii "GET"
      00AF71 14 52                    6 	.word cmd_get  
      0032FB                       4713 	_dict_entry,4+F_IFUNC,FREE,free
      00AF73 00 72                    1 	.word LINK 
                           0032FD     2 	LINK=.
      0032FD                          3 FREE:
      00AF75 12                       4 	.byte 4+F_IFUNC   	
      00AF76 52 01 72 10              5 	.ascii "FREE"
      00AF7A 52 01                    6 	.word free  
      003304                       4714 	_dict_entry,3,FOR,for 
      00AF7C 72 1C                    1 	.word LINK 
                           003306     2 	LINK=.
      003306                          3 FOR:
      00AF7E 52                       4 	.byte 3   	
      00AF7F 00 81 52                 5 	.ascii "FOR"
      00AF81 22 7E                    6 	.word for  
      00330C                       4715 	_dict_entry,4,FCPU,fcpu 
      00AF81 5B 02                    1 	.word LINK 
                           00330E     2 	LINK=.
      00330E                          3 FCPU:
      00AF83 A6                       4 	.byte 4   	
      00AF84 82 C4 52 03              5 	.ascii "FCPU"
      00AF88 A1 02                    6 	.word fcpu  
      003315                       4716 	_dict_entry,5,ERASE,erase 
      00AF8A 26 F7                    1 	.word LINK 
                           003317     2 	LINK=.
      003317                          3 ERASE:
      00AF8C 72                       4 	.byte 5   	
      00AF8D 1D 52 00 72 13           5 	.ascii "ERASE"
      00AF92 50 C7                    6 	.word erase  
      00331F                       4717 	_dict_entry,3,END,cmd_end  
      00AF94 72 1B                    1 	.word LINK 
                           003321     2 	LINK=.
      003321                          3 END:
      00AF96 50                       4 	.byte 3   	
      00AF97 16 81 44                 5 	.ascii "END"
      00AF99 25 6F                    6 	.word cmd_end  
      003327                       4718 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AF99 A6 78                    1 	.word LINK 
                           003329     2 	LINK=.
      003329                          3 EEPROM:
      00AF9B C5                       4 	.byte 6+F_IFUNC   	
      00AF9C 52 03 27 04 72 5F        5 	.ascii "EEPROM"
      00AFA2 52 03                    6 	.word const_eeprom_base  
      003332                       4719 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AFA4 81 29                    1 	.word LINK 
                           003334     2 	LINK=.
      00AFA5                          3 EEFREE:
      00AFA5 88                       4 	.byte 6+F_IFUNC   	
      00AFA6 CD AF 99 84 72 03        5 	.ascii "EEFREE"
      00AFAC 52 03                    6 	.word func_eefree  
      00333D                       4720 	_dict_entry,4,EDIT,edit 
      00AFAE FB C7                    1 	.word LINK 
                           00333F     2 	LINK=.
      00333F                          3 EDIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AFB0 52                       4 	.byte 4   	
      00AFB1 04 72 01 52              5 	.ascii "EDIT"
      00AFB5 03 FB                    6 	.word edit  
      003346                       4721 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AFB7 C6 52                    1 	.word LINK 
                           003348     2 	LINK=.
      003348                          3 DWRITE:
      00AFB9 04                       4 	.byte 6+F_CMD   	
      00AFBA 81 57 52 49 54 45        5 	.ascii "DWRITE"
      00AFBB 26 CC                    6 	.word digital_write  
      003351                       4722 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AFBB A6 FF                    1 	.word LINK 
                           003353     2 	LINK=.
      003353                          3 DROP:
      00AFBD 72                       4 	.byte 4   	
      00AFBE 01 52 03 E3              5 	.ascii "DROP"
      00AFC2 C6 52                    6 	.word xdrop  
      00335A                       4723 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AFC4 04 81                    1 	.word LINK 
                           00335C     2 	LINK=.
      00AFC6                          3 DREAD:
      00AFC6 CD                       4 	.byte 5+F_IFUNC   	
      00AFC7 9B 26 A1 84 27           5 	.ascii "DREAD"
      00AFCC 03 CC                    6 	.word digital_read  
      003364                       4724 	_dict_entry,2,DO,do_loop
      00AFCE 96 B0                    1 	.word LINK 
                           003366     2 	LINK=.
      00AFD0                          3 DO:
      00AFD0 9F                       4 	.byte 2   	
      00AFD1 CD AF                    5 	.ascii "DO"
      00AFD3 A5 CD                    6 	.word do_loop  
      00336B                       4725 	_dict_entry,3,DIM,cmd_dim 
      00AFD5 98 1A                    1 	.word LINK 
                           00336D     2 	LINK=.
      00336D                          3 DIM:
      00AFD7 A1                       4 	.byte 3   	
      00AFD8 08 26 02                 5 	.ascii "DIM"
      00AFDB 20 E9                    6 	.word cmd_dim  
      003373                       4726 	_dict_entry,3,DEC,dec_base
      00AFDD 4D 27                    1 	.word LINK 
                           003375     2 	LINK=.
      003375                          3 DEC:
      00AFDF 05                       4 	.byte 3   	
      00AFE0 55 00 03                 5 	.ascii "DEC"
      00AFE3 00 02                    6 	.word dec_base  
      00337B                       4727 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00AFE5 81 75                    1 	.word LINK 
                           00337D     2 	LINK=.
      00AFE6                          3 DDR:
      00AFE6 CD                       4 	.byte 3+F_IFUNC   	
      00AFE7 AF BB 5F                 5 	.ascii "DDR"
      00AFEA 97 4F                    6 	.word const_ddr  
      003383                       4728 	_dict_entry,4,DATA,data  
      00AFEC 81 7D                    1 	.word LINK 
                           003385     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AFED                          3 DATA:
      00AFED CD                       4 	.byte 4   	
      00AFEE 98 1A A1 84              5 	.ascii "DATA"
      00AFF2 27 03                    6 	.word data  
      00338C                       4729 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00AFF4 CC 96                    1 	.word LINK 
                           00338E     2 	LINK=.
      00338E                          3 CR2:
      00AFF6 B0                       4 	.byte 3+F_IFUNC   	
      00AFF7 5D 27 05                 5 	.ascii "CR2"
      00AFFA 72 1B                    6 	.word const_cr2  
      003394                       4730 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00AFFC 50 14                    1 	.word LINK 
                           003396     2 	LINK=.
      003396                          3 CR1:
      00AFFE 81                       4 	.byte 3+F_IFUNC   	
      00AFFF 43 52 31                 5 	.ascii "CR1"
      00AFFF 72 1A                    6 	.word const_cr1  
      00339C                       4731 	_dict_entry,5,CONST,cmd_const 
      00B001 50 14                    1 	.word LINK 
                           00339E     2 	LINK=.
      00339E                          3 CONST:
      00B003 81                       4 	.byte 5   	
      00B004 43 4F 4E 53 54           5 	.ascii "CONST"
      00B004 AE 16                    6 	.word cmd_const  
      0033A6                       4732 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00B006 E0 4F                    1 	.word LINK 
                           0033A8     2 	LINK=.
      0033A8                          3 CHAR:
      00B008 81                       4 	.byte 4+F_CFUNC   	
      00B009 43 48 41 52              5 	.ascii "CHAR"
      00B009 CD 9C                    6 	.word func_char  
      0033AF                       4733 	_dict_entry,3,BYE,bye 
      00B00B 3F 81                    1 	.word LINK 
                           0033B1     2 	LINK=.
      00B00D                          3 BYE:
      00B00D 90                       4 	.byte 3   	
      00B00E F6 93 EE                 5 	.ascii "BYE"
      00B011 01 72                    6 	.word bye  
      0033B7                       4734 	_dict_entry,5,BTOGL,bit_toggle
      00B013 A9 00                    1 	.word LINK 
                           0033B9     2 	LINK=.
      0033B9                          3 BTOGL:
      00B015 03                       4 	.byte 5   	
      00B016 81 54 4F 47 4C           5 	.ascii "BTOGL"
      00B017 21 C6                    6 	.word bit_toggle  
      0033C1                       4735 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00B017 CD 9B                    1 	.word LINK 
                           0033C3     2 	LINK=.
      0033C3                          3 BTEST:
      00B019 26                       4 	.byte 5+F_IFUNC   	
      00B01A A1 84 27 03 CC           5 	.ascii "BTEST"
      00B01F 96 B0                    6 	.word bit_test  
      0033CB                       4736 	_dict_entry,4,BSET,bit_set 
      00B021 90 F6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



                           0033CD     2 	LINK=.
      0033CD                          3 BSET:
      00B023 93                       4 	.byte 4   	
      00B024 EE 01 72 A9              5 	.ascii "BSET"
      00B028 00 03                    6 	.word bit_set  
      0033D4                       4737 	_dict_entry,4,BRES,bit_reset
      00B02A 4D 27                    1 	.word LINK 
                           0033D6     2 	LINK=.
      0033D6                          3 BRES:
      00B02C 05                       4 	.byte 4   	
      00B02D A6 0A CC 96              5 	.ascii "BRES"
      00B031 B2 A3                    6 	.word bit_reset  
      0033DD                       4738 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00B033 00 14                    1 	.word LINK 
                           0033DF     2 	LINK=.
      0033DF                          3 BIT:
      00B035 22                       4 	.byte 3+F_IFUNC   	
      00B036 F6 A6 03                 5 	.ascii "BIT"
      00B039 42 CF                    6 	.word bitmask  
      0033E5                       4739 	_dict_entry,3,AWU,awu 
      00B03B 00 0E                    1 	.word LINK 
                           0033E7     2 	LINK=.
      0033E7                          3 AWU:
      00B03D 72                       4 	.byte 3   	
      00B03E B2 00 0E                 5 	.ascii "AWU"
      00B041 90 A3                    6 	.word awu  
      0033ED                       4740 	_dict_entry,3+F_IFUNC,ASC,ascii
      00B043 17 60                    1 	.word LINK 
                           0033EF     2 	LINK=.
      0033EF                          3 ASC:
      00B045 22                       4 	.byte 3+F_IFUNC   	
      00B046 05 A6 01                 5 	.ascii "ASC"
      00B049 CC 96                    6 	.word ascii  
      0033F5                       4741 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00B04B B2 EF                    1 	.word LINK 
                           0033F7     2 	LINK=.
      00B04C                          3 AND:
      00B04C 81                       4 	.byte 3+F_AND   	
      00B04D 41 4E 44                 5 	.ascii "AND"
      00B04D CD 9B                    6 	.word TK_AND  
      0033FD                       4742 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00B04F 26 A1                    1 	.word LINK 
                           0033FF     2 	LINK=.
      0033FF                          3 ALLOC:
      00B051 84                       4 	.byte 5   	
      00B052 27 03 CC 96 B0           5 	.ascii "ALLOC"
      00B057 90 F6                    6 	.word xalloc  
      003407                       4743 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00B059 93 EE                    1 	.word LINK 
                           003409     2 	LINK=.
      003409                          3 ADCREAD:
      00B05B 01                       4 	.byte 7+F_IFUNC   	
      00B05C 72 A9 00 03 9F A4 1F     5 	.ascii "ADCREAD"
      00B063 5F 97                    6 	.word analog_read  
      003413                       4744 	_dict_entry,5,ADCON,power_adc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00B065 A6 03                    1 	.word LINK 
                           003415     2 	LINK=.
      003415                          3 ADCON:
      00B067 42                       4 	.byte 5   	
      00B068 CF 00 0E 72 B9           5 	.ascii "ADCON"
      00B06D 00 0E                    6 	.word power_adc  
      00341D                       4745 kword_dict::
      00341D                       4746 	_dict_entry,3+F_IFUNC,ABS,abs
      00B06F 90 A3                    1 	.word LINK 
                           00341F     2 	LINK=.
      00341F                          3 ABS:
      00B071 17                       4 	.byte 3+F_IFUNC   	
      00B072 73 23 04                 5 	.ascii "ABS"
      00B075 90 AE                    6 	.word abs  
                                   4747 
                           000000  4748 INDIRECT=0 
                           000000  4749 .if INDIRECT 
                                   4750 ;comands and fonctions address table 	
                                   4751 code_addr::
                                   4752 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4753 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4754 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4755 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4756 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4757 	.word let,list,log2,lshift,next,new ; 40..47
                                   4758 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4759 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4760 	.word const_portf,const_portg,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4761 	.word restore,return, random,rshift,run,free ; 72..79
                                   4762 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4763 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4764 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4765 	.word func_eefree,0 
                                   4766 .endif 
                                   4767 
                                   4768 
                                   4769 
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
      003425                         30 test:
      003425                         31     _vars VSIZE 
      00B077 17 73            [ 2]    1     sub sp,#VSIZE 
      00B079 81 27 10         [ 2]   32     ldw x,#LOOP_CNT
      00B07A 1F 03            [ 2]   33     ldw (CNTR,sp),x  
      00B07A 4D 26 16         [ 2]   34     ldw x,ticks 
      00B07D A3 00            [ 2]   35     ldw (T,sp),x
      003431                         36 1$: ; test add24 
      00B07F 14 22            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00B081 11 A6 03         [ 2]   38     ldw x,#VAL1&0XFFFF
      00B084 42 CF 00         [ 1]   39     ld acc24,a 
      00B087 0E 93 72         [ 2]   40     ldw acc24+1,x  
      00B08A BB 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00B08C 0E A3 17         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00B08F 73 24 01         [ 4]   43     call add24 
      00B092 81 A6            [ 2]   44     ldw x,(CNTR,sp)
      00B094 0A CC 96         [ 2]   45     subw x,#1
      00B097 B2 03            [ 2]   46     ldw (CNTR,sp),x 
      00B098 26 E4            [ 1]   47     jrne 1$
      00B098 CD 99 E2         [ 4]   48     call prt_acc24
      00B09B A1 02            [ 1]   49     ld a,#SPACE 
      00B09D 27 03 CC         [ 4]   50     call putc 
      00B0A0 96 B0 90         [ 2]   51     ldw x,ticks 
      00B0A3 F6 93 EE         [ 2]   52     subw x,(T,sp)
      00B0A6 01 72 A9         [ 4]   53     call prt_i16  
      00B0A9 00 03            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00B0AB 89 88 90         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00B0AE F6 93 EE         [ 2]   58     ldw x,LOOP_CNT
      00B0B1 01 72            [ 2]   59     ldw (CNTR,sp),x 
      00B0B3 A9 00 03         [ 2]   60     ldw x,ticks 
      00B0B6 CD B0            [ 2]   61     ldw (T,sp),x 
      00346D                         62 2$: 
      00B0B8 7A CF            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00B0BA 00 1A 84         [ 2]   64     ldw x,#VAL1&0XFFFF
      00B0BD 85 72 C7         [ 1]   65     ld acc24,a 
      00B0C0 00 1A 72         [ 2]   66     ldw acc24+1,x  
      00B0C3 5C 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00B0C5 1B 72 CF         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00B0C8 00 1A 81         [ 4]   69     call mul24 
      00B0CB 1E 03            [ 2]   70     ldw x,(CNTR,sp)
      00B0CB CD 99 DD         [ 2]   71     subw x,#1
      00B0CE A1 01            [ 2]   72     ldw (CNTR,sp),x 
      00B0D0 27 03            [ 1]   73     jrne 2$ 
      00B0D2 CC 96 B0         [ 4]   74    call prt_acc24 
      00B0D5 90 F6            [ 1]   75    ld a,#SPACE 
      00B0D7 93 EE 01         [ 4]   76    call putc 
      00B0DA 72 A9 00         [ 2]   77     ldw x,ticks 
      00B0DD 03 CD B0         [ 2]   78     subw x,(T,sp)
      00B0E0 7A F6 EE         [ 4]   79     call prt_i16 
      00B0E3 01 81            [ 1]   80     ld a,#CR 
      00B0E5 CD 08 D5         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00B0E5 00 00 10         [ 2]   83     ldw x,LOOP_CNT
      00B0E7 1F 03            [ 2]   84     ldw (CNTR,sp),x 
      00B0E7 A3 58 4F         [ 2]   85     ldw x,ticks 
      00B0EA 52 00            [ 2]   86     ldw (T,sp),x 
      0034A9                         87 3$: 
      00B0EC 8A B0            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00B0EE E7 FF FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00B0EF C7 00 0C         [ 1]   90     ld acc24,a 
      00B0EF 05 57 52         [ 2]   91     ldw acc24+1,x  
      00B0F2 49 54            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00B0F4 45 A9 78         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00B0F7 B0 EF 66         [ 4]   94     call mul24 
      00B0F9 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00B0F9 05 57 4F         [ 2]   96     subw x,#1
      00B0FC 52 44            [ 2]   97     ldw (CNTR,sp),x 
      00B0FE 53 AC            [ 1]   98     jrne 3$ 
      00B100 CA B0 F9         [ 4]   99     call prt_acc24    
      00B103 A6 20            [ 1]  100     ld a,#SPACE 
      00B103 04 57 41         [ 4]  101     call putc 
      00B106 49 54 A1         [ 2]  102     ldw x,ticks 
      00B109 C4 B1 03         [ 2]  103     subw x,(T,sp)
      00B10C CD 17 E2         [ 4]  104     call prt_i16 
      00B10C 13 55            [ 1]  105     ld a,#CR 
      00B10E 53 52 AA         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00B111 6F B1 0C         [ 2]  108     ldw x,LOOP_CNT
      00B114 1F 03            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00B114 05 55 4E         [ 2]  110     ldw x,ticks 
      00B117 54 49            [ 2]  111     ldw (T,sp),x 
      0034E5                        112 4$:
      00B119 4C AD            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00B11B FF B1 14         [ 2]  114     ldw x,#VAL1&0XFFFF
      00B11E C7 00 0C         [ 1]  115     ld acc24,a 
      00B11E 16 55 46         [ 2]  116     ldw acc24+1,x  
      00B121 4C 41            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00B123 53 48 AA         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00B126 52 B1 1E         [ 4]  119     call mul24 
      00B129 1E 03            [ 2]  120     ldw x,(CNTR,sp)
      00B129 16 55 42         [ 2]  121     subw x,#1
      00B12C 4F 55            [ 2]  122     ldw (CNTR,sp),x 
      00B12E 4E 44            [ 1]  123     jrne 4$ 
      00B130 9C F3 B1         [ 4]  124     call prt_acc24 
      00B133 29 20            [ 1]  125     ld a,#SPACE 
      00B134 CD 08 D5         [ 4]  126     call putc 
      00B134 04 54 4F         [ 2]  127     ldw x,ticks 
      00B137 4E 45 A6         [ 2]  128     subw x,(T,sp)
      00B13A 2E B1 34         [ 4]  129     call prt_i16 
      00B13D A6 0D            [ 1]  130     ld a,#CR 
      00B13D 02 54 4F         [ 4]  131     call putc 
                                    132 ; test abs24 
      00B140 A3 2E B1         [ 2]  133     ldw x,LOOP_CNT
      00B143 3D 03            [ 2]  134     ldw (CNTR,sp),x 
      00B144 CE 00 0F         [ 2]  135     ldw x,ticks 
      00B144 05 54            [ 2]  136     ldw (T,sp),x 
      003521                        137 5$: 
      00B146 49 4D            [ 1]  138     ld a,#0xff
      00B148 45 52 AD         [ 2]  139     ldw x,#0xffff
      00B14B 34 B1 44         [ 4]  140     call abs24 
      00B14E C7 00 0C         [ 1]  141     ld acc24,a 
      00B14E 17 54 49         [ 2]  142     ldw acc24+1,x
      00B151 4D 45            [ 2]  143     ldw x,(CNTR,sp)
      00B153 4F 55 54         [ 2]  144     subw x,#1
      00B156 AD 4B            [ 2]  145     ldw (CNTR,sp),x 
      00B158 B1 4E            [ 1]  146     jrne 5$ 
      00B15A CD 17 F9         [ 4]  147     call prt_acc24 
      00B15A 15 54            [ 1]  148     ld a,#SPACE 
      00B15C 49 43 4B         [ 4]  149     call putc 
      00B15F 53 AB 1B         [ 2]  150     ldw x,ticks 
      00B162 B1 5A 01         [ 2]  151     subw x,(T,sp)
      00B164 CD 17 E2         [ 4]  152     call prt_i16 
      003549                        153 6$:
      00B164 04 53            [ 1]  154     ld a,#CR 
      00B166 54 4F 50         [ 4]  155     call putc 
      00B169 A7 97 B1         [ 4]  156     call read_integer 
      00B16C 64 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00B16D 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00B16D 04 53 54 45 50   [ 1]  159     mov farptr+2,acc8 
      00B172 A3 74 B1         [ 4]  160     call read_integer 
      00B175 6D 00 0C         [ 1]  161     ld a,acc24 
      00B176 CE 00 0D         [ 2]  162     ldw x,acc16 
      00B176 05 53 50 49 57   [ 1]  163     mov acc24,farptr 
      00B17B 52 AF C6 B1 76   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00B180 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00B180 06 53 50         [ 4]  166     call div24 
      00B183 49               [ 1]  167     push a 
      00B184 53               [ 2]  168     pushw x 
      00B185 45 4C AF         [ 4]  169     call prt_acc24 
      00B188 ED B1            [ 1]  170     ld a,#SPACE 
      00B18A 80 08 D5         [ 4]  171     call putc 
      00B18B 85               [ 2]  172     popw x
      00B18B 15 53 50         [ 2]  173     ldw acc16,x  
      00B18E 49 52 44         [ 1]  174     pop acc24 
      00B191 AF E6 B1         [ 4]  175     call prt_acc24
      00B194 8B B8            [ 2]  176     jra 6$
      00B195                        177     _drop VSIZE 
      00B195 05 53            [ 2]    1     addw sp,#VSIZE 
      00B197 50               [ 4]  178     ret 
                                    179 
                                    180 
      003594                        181 read_integer:
      00B198 49 45            [ 1]  182     ld a,#'? 
      00B19A 4E AF 4E         [ 4]  183     call putc  
      00B19D B1 95 00 03      [ 1]  184 	clr count  
      00B19F CD 0A 37         [ 4]  185 	call readln 
      00B19F 05 53 4C         [ 2]  186 	ldw x,#tib 
      00B1A2 45 45 50         [ 1]  187 	push count
      00B1A5 AA 9E            [ 1]  188 	push #0 
      00B1A7 B1 9F 01         [ 2]  189 	addw x,(1,sp)
      00B1A9 5C               [ 1]  190 	incw x 
      0035AC                        191 	_drop 2 
      00B1A9 04 53            [ 2]    1     addw sp,#2 
      00B1AB 49 5A 45 9C      [ 1]  192 	clr in 
      00B1AF C6 B1 A9         [ 4]  193 	call get_token
      00B1B2 A1 84            [ 1]  194 	cp a,#TK_INTGR
      00B1B2 04 53            [ 1]  195 	jreq 3$ 
      00B1B4 41 56            [ 1]  196 	cp a,#TK_MINUS
      00B1B6 45 A8 89         [ 4]  197 	call get_token 
      00B1B9 B1 B2            [ 1]  198 	cp a,#TK_INTGR 
      00B1BB 27 03            [ 1]  199 	jreq 2$
      00B1BB 03 52 55         [ 2]  200 	jp syntax_error
      0035C5                        201 2$:
      00B1BE 4E A5 8A         [ 4]  202 	call neg_acc24  	
      0035C8                        203 3$: 
      00B1C1 B1               [ 4]  204     ret 
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
      003600                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003600                         30 app_space::
      00B1C2 BB 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00B1C3 00 00                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00341F R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003415 R
    ADCON_ID=  000002     |   4 ADCREAD    003409 R   |     ADCREAD_=  000004 
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
  4 ALLOC      0033FF R   |   4 AND        0033F7 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        0033EF R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   000149 R   |   4 AWU        0033E7 R
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
  4 BIT        0033DF R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       0033D6 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       0033CD R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      0033C3 R
    BTEST_ID=  000010     |   4 BTOGL      0033B9 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        0033B1 R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    0028A0 R
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
  4 CHAR       0033A8 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
    CNT     =  000006     |     CNTR    =  000003     |     CNT_LO  =  000004 
    CODE_ADD=  000001     |     COMMA   =  00002C     |   4 CONST      00339E R
  4 CONST_CO   001D28 R   |     CONST_ID=  0000B6     |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        003396 R   |     CR1_IDX =  00001A 
  4 CR2        00338E R   |     CR2_IDX =  000018     |     CTRL_A  =  000001 
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
    CX_IN   =  000003     |   4 DATA       003385 R   |     DATA_IDX=  00001C 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        00337D R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        003375 R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   4 DIM        00336D R
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         003366 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      00335C R   |     DREAD_ID=  000024     |   4 DROP       003353 R
  4 DWRITE     003348 R   |     DWRITE_I=  000026     |   4 EDIT       00333F R
    EDIT_IDX=  000028     |   4 EEFREE     003334 R   |     EEFREE_I=  0000B8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EEPROM     003329 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EM      =  000019 
  4 END        003321 R   |     END_IDX =  00002C     |     ENQ     =  000005 
    EOF     =  0000FF     |     EOT     =  000004     |   4 ERASE      003317 R
    ERASE_ID=  00002E     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_OVER=  000010     |     ERR_RD_O=  000011     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       00330E R
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
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   001EC9 R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        003306 R   |     FOR_IDX =  000034     |   4 FREE       0032FD R
    FREE_IDX=  000088     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_AND   =  000080     |     F_CFUNC =  000020     |     F_CMD   =  000000 
    F_CONST =  000030     |     F_IFUNC =  000010     |     F_NOT   =  000070 
    F_OR    =  000090     |     F_XOR   =  0000A0     |   4 GET        0032F5 R
    GET_IDX =  0000B4     |   4 GOSUB      0032EB R   |     GOSUB_ID=  000036 
  4 GOTO       0032E2 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        0032DA R   |     HEX_IDX =  00003A 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        0032D2 R
    IDR_IDX =  00003C     |   4 IF         0032CB R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INDIRECT=  000000 
    INP     =  000000     |   4 INPUT      0032C1 R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     0032B6 R   |     IWDGEN_I=  000042 
  4 IWDGREF    0032AA R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0032A2 R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        00329A R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  00341F R   |   4 LIST       003291 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       003288 R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     00327D R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NAME_MAX=  00000F     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        003275 R   |     NEW_IDX =  000052     |   4 NEXT       00326C R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        003264 R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |   4 NOT_SAVE   001FBB R   |   4 NO_APP     0028E2 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        00325C R   |     ODR_IDX =  000054 
  4 ON         003255 R   |     ONOFF   =  000003     |     ON_IDX  =  0000B2 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OR         00324E R
    OR_IDX  =  0000FC     |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        003246 R
    PAD_IDX =  000056     |     PAD_SIZE=  000080     |   4 PAUSE      00323C R
    PAUSE_ID=  000058     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       003233 R
    PEEK_IDX=  00005C     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |   4 PICK       00322A R
    PINNO   =  000001     |   4 PINP       003221 R   |     PINP_IDX=  00005E 
    PINVAL  =  000002     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   4 PMODE      003217 R   |     PMODE_ID=  00005A 
  4 POKE       00320E R   |     POKE_IDX=  000060     |   4 POP        003206 R
  4 PORTA      0031E9 R   |   4 PORTB      0031DF R   |   4 PORTC      0031D5 R
  4 PORTD      0031CB R   |   4 PORTE      0031C1 R   |   4 PORTF      0031B7 R
  4 PORTG      0031AD R   |   4 PORTI      0031A3 R   |   4 POUT       0031FD R
    POUT_IDX=  000062     |     PREV    =  000001     |   4 PRINT      0031F3 R
    PROD    =  000001     |     PROD_SIG=  000004     |   4 PROG_ADD   001E9F R
  4 PROG_SIZ   001EB1 R   |     PRTA_IDX=  000066     |     PRTB_IDX=  000068 
    PRTC_IDX=  00006A     |     PRTD_IDX=  00006C     |     PRTE_IDX=  00006E 
    PRTF_IDX=  000070     |     PRTG_IDX=  000072     |     PRTI_IDX=  000074 
    PRT_IDX =  000064     |     PSIZE   =  00000B     |     PSTR    =  000003 
  4 PUSH       00319A R   |   4 PUT        003192 R   |   4 QKEY       003189 R
    QKEY_IDX=  000076     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001EDA R   |     RAM_SIZE=  001800 
    RBT_IDX =  00007A     |   4 READ       003180 R   |     READ_IDX=  000078 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

  4 REBOOT     003175 R   |     RECLEN  =  000005     |     REC_LEN =  000003 
    REC_XTRA=  000005     |   4 REG_A      0004C6 R   |   4 REG_CC     0004CA R
  4 REG_PC     0004BA R   |   4 REG_SP     0004CF R   |   4 REG_X      0004C2 R
  4 REG_Y      0004BE R   |     RELOP   =  000001     |   4 REM        00316D R
    REM_IDX =  00007C     |   4 RESTORE    003161 R   |     REST_IDX=  00007E 
    RETL1   =  000001     |   4 RETURN     003156 R   |     RET_ADDR=  000001 
    RET_BPTR=  000003     |     RET_IDX =  000080     |     RET_INW =  000005 
  4 RND        00314E R   |     RND_IDX =  000082     |     RONLY   =  000005 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     003143 R
    RSHIFT_I=  000084     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        00313B R   |     RUN_IDX =  000086     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000001     |     R_CC    =  000009 
    R_PC    =  00000A     |     R_X     =  000002     |     R_Y     =  000004 
  4 SAVE       003132 R   |     SAVE_IDX=  000032     |     SAV_ACC1=  000006 
    SAV_ACC2=  000008     |     SAV_COUN=  00000A     |     SAV_IN  =  000009 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   00289E R   |   4 SIZE       003129 R   |     SIZE_IDX=  0000B0 
    SKIP    =  000005     |   4 SLEEP      00311F R   |     SLEEP_ID=  00008A 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      003115 R   |     SPIEN_ID=  00008E     |   4 SPIRD      00310B R
    SPIRD_ID=  00008C     |   4 SPISEL     003100 R   |     SPISEL_I=  000090 
  4 SPIWR      0030F6 R   |     SPIWR_ID=  000092     |     SPI_CR1 =  005200 
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
    STACK_SI=  00008C     |   4 STATES     00047E R   |   4 STEP       0030ED R
    STEP_IDX=  000094     |   4 STOP       0030E4 R   |     STOP_IDX=  000096 
    STR     =  000003     |   4 STR_BYTE   001EC2 R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |   4 SysCall    000012 R   |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      0030DA R   |     TICKS_ID=  000098 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM3_SR1=  005322     |     TIM3_SR2=  005323     |     TIM4_ARR=  005346 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CNT=  005344     |     TIM4_CR1=  005340     |     TIM4_CR1=  000007 
    TIM4_CR1=  000000     |     TIM4_CR1=  000003     |     TIM4_CR1=  000001 
    TIM4_CR1=  000002     |     TIM4_EGR=  005343     |     TIM4_EGR=  000000 
    TIM4_IER=  005341     |     TIM4_IER=  000000     |     TIM4_PSC=  005345 
    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   4 TIMEOUT    0030CE R   |   4 TIMER      0030C4 R
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
    TK_XOR  =  00008A     |     TMROUT_I=  00009C     |   4 TO         0030BD R
  4 TONE       0030B4 R   |     TONE_IDX=  0000A0     |     TOWRITE =  000005 
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
    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     0030A9 R   |     UBOUND_I=  0000A2     |   4 UBTN_Han   00005A R
  4 UFLASH     00309E R   |     UFLASH_I=  0000A4     |   4 UNTIL      003094 R
    UNTIL_ID=  0000A6     |     US      =  00001F     |   4 USER_ABO   000062 R
  4 USR        00308C R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000A8     |   4 Uart1RxH   000863 R
  4 UserButt   000036 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VAR_NAME=  000001     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       003083 R   |     WAIT_IDX=  0000AA     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |     WLKPTR  =  000003     |   4 WORDS      003079 R
    WORDS_ID=  0000AC     |   4 WRITE      00306F R   |     WRITE_ID=  0000AE 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        003067 R   |     XOR_IDX =  0000FE     |     XSAVE   =  000002 
    XSTACK_E=  001773     |     XSTACK_S=  000014     |     XTEMP   =  000001 
    YSAVE   =  000004     |     YTEMP   =  000003     |   4 abs        002AA2 R
  4 abs24      0001E0 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000B91 R
  4 add24      00016B R   |   4 add_char   0012FC R   |   4 add_spac   0010F4 R
  4 analog_r   002659 R   |   4 and_cond   001B6D R   |   4 and_fact   001B3D R
  4 app        003604 R   |   4 app_sign   003600 R   |   4 app_size   003602 R
  4 app_spac   003600 GR  |   4 arduino_   002B8F R   |   4 arg_list   001962 R
  5 array_si   000020 R   |   4 ascii      002952 R   |   4 at_tst     000F66 R
  4 atoi24     001884 GR  |   4 atoi_exi   0018F3 R   |   4 awu        002A49 R
  4 awu02      002A5C R   |   4 bad_port   0029CD R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       0025D0 R   |   4 beep_1kh   0025A3 GR
  4 bin_exit   000DCD R   |   4 bit_rese   0021A3 R   |   4 bit_set    002181 R
  4 bit_test   0021E8 R   |   4 bit_togg   0021C6 R   |   4 bitmask    002D46 R
  4 bkslsh_t   000F13 R   |   4 bksp       00093C R   |   2 block_bu   0016E0 GR
  4 block_er   000751 R   |   4 break_po   002745 R   |   4 bye        002A15 R
  4 clear_ba   001468 R   |   4 clear_bl   0027F5 R   |   4 clear_va   0013C0 R
  4 clock_in   00007D R   |   4 cmd_cons   001DAE R   |   4 cmd_dim    001DC2 R
  4 cmd_dim1   001DCC R   |   4 cmd_dim2   001DD2 R   |   4 cmd_end    00256F R
  4 cmd_get    002576 R   |   4 cmd_itf    0004EA R   |   4 cmd_line   0016BF R
  4 cmd_name   00131C R   |   4 cmd_on     00241D R   |   4 cmd_size   001C46 R
  4 cold_sta   0000B5 R   |   4 colon_ts   000F3A R   |   4 comma_ts   000F45 R
  4 comp_msg   00160F R   |   4 compile    001060 GR  |   4 conditio   001BBF R
  4 const_cr   002DE9 R   |   4 const_cr   002DEE R   |   4 const_dd   002DE4 R
  4 const_ee   002DFD R   |   4 const_id   002DDF R   |   4 const_in   002DF8 R
  4 const_od   002DDA R   |   4 const_ou   002DF3 R   |   4 const_po   002DB2 R
  4 const_po   002DB7 R   |   4 const_po   002DBC R   |   4 const_po   002DC1 R
  4 const_po   002DC6 R   |   4 const_po   002DCB R   |   4 const_po   002DD0 R
  4 const_po   002DD5 R   |   4 convert_   000D3D R   |   4 convert_   000900 R
  4 copy_com   000F9B R   |   5 count      000003 GR  |   4 cp24       0001A5 R
  4 cp24_ax    0001D7 R   |   4 cp_loop    001913 R   |   4 cpl24      0001E7 R
  4 cpy_cmd_   0010DC R   |   4 cpy_quot   00111C R   |   4 create_g   000C67 R
  4 cs_high    002F7F R   |   4 dash_tst   000F5B R   |   4 data       002E02 R
  4 data_err   002E7B R   |   5 data_len   000009 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 dec_base   001C38 R   |   4 decomp_l   0011B4 R
  4 decompil   00116C GR  |   4 del_line   000C3A R   |   4 delete_l   000A29 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 delete_n   00094C R   |   4 delete_u   0009EE R   |   4 digital_   002695 R
  4 digital_   0026CC R   |   4 div24      0002F4 R   |   4 divu24_8   0002D6 R
  4 do_loop    002D6C R   |   4 do_progr   000744 R   |   4 dup24      00015C R
  5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR  |   4 edit       001F8E R
  4 enable_i   002CD6 R   |   4 eql_tst    000FE6 R   |   4 equal      00130F R
  4 erase      00276D R   |   4 erase_ex   000775 R   |   4 erase_fl   00076B R
  4 err_bad_   001554 R   |   4 err_buf_   0015CA R   |   4 err_cmd_   001518 R
  4 err_div0   0014DD R   |   4 err_dupl   001532 R   |   4 err_math   0014C4 R
  4 err_mem_   0014A9 R   |   4 err_msg    001485 R   |   4 err_no_a   001560 R
  4 err_no_d   001593 R   |   4 err_no_f   0015B7 R   |   4 err_no_l   0014EC R
  4 err_no_p   0015A3 R   |   4 err_not_   001543 R   |   4 err_over   0015D7 R
  4 err_read   0015E1 R   |   4 err_run_   001502 R   |   4 err_synt   0014B6 R
  4 escaped    000D52 GR  |   4 expect     001950 R   |   4 expressi   001AA6 R
  4 factor     0019AE R   |   5 farptr     000018 R   |   4 fcpu       002B11 R
  4 fetchc     0005F1 R   |   4 fill_wri   0027E5 R   |   4 final_te   000B8A R
  4 first_li   001F38 R   |   5 flags      000022 GR  |   4 for        00227E R
  4 free       001C3D R   |   5 free_eep   000024 R   |   7 free_ram   000090 R
  4 func_arg   00195D R   |   4 func_cha   00293B R   |   4 func_eef   001D3E R
  4 ge         001311 R   |   4 get_addr   0017C2 R   |   4 get_arra   00197E R
  4 get_char   0017DC R   |   4 get_esca   00090C R   |   4 get_int2   0017CC R
  4 get_targ   0023AB R   |   4 get_targ   0023B9 R   |   4 get_tick   002A9B R
  4 get_toke   000EAC GR  |   4 get_valu   001CC1 R   |   4 getc       0008E5 GR
  4 gosub      0024C9 R   |   4 gosub_1    0024D4 R   |   4 gosub_2    0024DA R
  4 goto       0024AF R   |   4 goto_1     0024B9 R   |   4 gpio       0029A2 R
  4 gt         00130D R   |   4 gt_tst     000FF1 R   |   4 hex_base   001C33 R
  4 hex_dump   000631 R   |   4 if         002261 R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   000847 R
  4 input_ex   002139 R   |   4 input_lo   0020A3 R   |   4 input_va   00209F R
  4 insert_c   0009AB R   |   4 insert_l   000C93 R   |   4 insert_l   000D02 R
  4 interp_l   001700 R   |   4 interpre   0016DB R   |   4 invalid    000559 R
  4 invalid_   0005C7 R   |   4 is_alnum   000E00 GR  |   4 is_alpha   000DE6 GR
  4 is_data_   002E08 R   |   4 is_digit   000DF7 GR  |   4 is_symbo   000E09 R
  4 itoa       00181F GR  |   4 itoa_loo   001841 R   |   4 jp_to_ta   0024BC R
  4 key        002991 R   |   4 kword_di   00341D GR  |   4 kword_en   003065 R
  4 le         001316 R   |   4 ledoff     0003BA R   |   4 ledon      0003B5 R
  4 ledtoggl   0003BF R   |   4 left_par   0003C8 R   |   4 let        001C7E GR
  4 let_arra   001C8C R   |   4 let_dvar   00173F R   |   4 let_eval   001C94 R
  4 let_var    001C91 R   |   4 lines_sk   001F3B R   |   4 list       001EE9 R
  4 list_con   001CD2 R   |   4 list_exi   001F7D R   |   4 list_loo   001F5B R
  4 log2       002D19 R   |   4 look_tar   0023DC R   |   4 loop_bac   00238E R
  5 loop_dep   00001F R   |   4 loop_don   0023A3 R   |   4 lshift     002AB9 R
  4 lt         001314 R   |   4 lt_tst     00101A R   |   4 mem_peek   000575 R
  4 mod24      00038E R   |   4 move       00137C GR  |   4 move_dow   00139B R
  4 move_era   0006D3 R   |   4 move_exi   0013BC R   |   4 move_lef   000983 R
  4 move_loo   0013A0 R   |   4 move_prg   000713 R   |   4 move_rig   000991 R
  4 move_up    00138D R   |   4 mul24      000266 R   |   4 mul_char   0012FE R
  4 mulu24_8   000227 R   |   4 nbr_tst    000EDF R   |   4 ne         001319 R
  4 neg24      0001F0 R   |   4 neg_acc2   00020A R   |   4 neg_ax     000202 R
  4 new        002763 R   |   4 next       002336 R   |   4 next_lin   0016E3 R
  4 next_tok   00179A GR  |   4 no_match   001925 R   |   4 number     0005F7 R
  4 other      001043 R   |   4 overwrit   000BB6 R   |   2 pad        0016E0 GR
  4 pad_ref    002F84 R   |   4 parse_ad   0004D4 R   |   4 parse_bi   000DAB R
  4 parse_in   000D5A R   |   4 parse_ke   000E2C R   |   4 parse_qu   000D05 R
  4 parse_sy   000E14 R   |   4 pause      002A29 R   |   4 pause02    002A3C R
  4 peek       002240 R   |   4 peek_byt   000591 R   |   4 pin_mode   002B20 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 plus_tst   000FBA R   |   4 poke       00221F R   |   4 power_ad   002609 R
  4 prcnt_ts   000FDB R   |   4 print      001FF6 R   |   4 print_fa   0005D6 R
  4 print_he   000BED GR  |   4 print_re   000414 R   |   4 print_st   000569 R
  4 print_to   001807 R   |   4 prog_siz   001E58 R   |   4 program_   001E60 R
  4 program_   0006ED R   |   4 program_   000713 R   |   4 prt_acc2   0017F9 R
  4 prt_basi   001FD2 R   |   4 prt_i16    0017E2 R   |   4 prt_loop   001FFA R
  4 prt_peek   000397 GR  |   4 prt_reg1   0003F5 R   |   4 prt_reg8   0003D3 R
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       0008D5 GR
  4 puts       000932 GR  |   4 qgetc      0008DE GR  |   4 qkey       002995 GR
  4 qmark_ts   000F71 R   |   4 qsign      0027DE R   |   4 random     002BAF R
  4 read       002E80 R   |   4 read01     002E85 R   |   4 read_int   003594 R
  4 readln     000A37 GR  |   4 readln_l   000A46 R   |   4 readln_q   000BD3 R
  4 refresh_   002D14 R   |   4 relation   001ADE R   |   4 relop_st   001301 R
  4 remark     00213E GR  |   4 repl       000513 R   |   4 repl_exi   00053B R
  4 reset_co   001FF8 R   |   4 rest_con   00208F R   |   4 restore    002E16 R
  4 return     0024ED R   |   4 right_al   00110A GR  |   4 row_alig   00082C R
  4 row_eras   0006A6 R   |   4 row_eras   0006D3 R   |   4 row_loop   000614 R
  4 rparnt_t   000F2F R   |   4 rshift     002AE5 R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     0015FD R   |   4 run        00250A R
  4 run_app    000127 R   |   4 run_it     00253C R   |   4 run_it_0   00253E R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_app   002809 R   |   4 save_con   00207F R   |   4 scan_blo   000855 R
  4 search_d   001905 GR  |   4 search_e   00194D R   |   4 search_l   000C0F GR
  4 search_l   000C1E R   |   4 search_n   001D67 R   |   4 search_n   001909 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002B7F R
  4 send_esc   00095A R   |   4 send_par   000965 R   |   4 set_data   002E4C R
  4 set_time   002CB4 R   |   4 sharp_ts   000F50 R   |   4 show_row   000602 R
  4 single_c   0012F7 R   |   4 skip       000E99 R   |   4 skip_str   0017B3 R
  4 slash_ts   000FD0 R   |   4 sleep      002A1E R   |   4 software   0013CF R
  4 spaces     00099F GR  |   4 spi_clea   002F19 R   |   4 spi_disa   002F01 R
  4 spi_enab   002ECE R   |   4 spi_rcv_   002F3B R   |   4 spi_read   002F66 R
  4 spi_sele   002F6D R   |   4 spi_send   002F25 R   |   4 spi_writ   002F46 R
  2 stack_fu   00179C GR  |   2 stack_un   001828 R   |   4 star_tst   000FC5 R
  4 step       0022F4 R   |   4 stop       002717 R   |   4 store_lo   002323 R
  4 str_matc   001932 R   |   4 str_tst    000ECF R   |   4 strcmp     00135B R
  4 strcpy     00136C GR  |   4 strlen     001350 GR  |   4 sub24      000188 R
  4 symb_loo   000E15 R   |   4 syntax_e   001630 GR  |   4 system_i   001415 R
  5 tab_widt   000023 GR  |   4 tb_error   001632 GR  |   4 term       001A63 R
  4 term01     001A6B R   |   4 term_exi   001AA3 R   |   4 test       003425 R
  4 test_p     000561 R   |   2 tib        001690 GR  |   4 tick_tst   000F89 R
  5 ticks      00000F R   |   4 timeout    002CCB R   |   5 timer      000012 GR
  4 timer2_i   000093 R   |   4 timer4_i   0000A0 R   |   4 tk_id      001620 R
  4 to         0022AE R   |   4 to_eepro   00073C R   |   4 to_flash   000741 R
  4 to_hex_c   000C04 GR  |   4 to_upper   001878 GR  |   4 token_ch   001059 R
  4 token_ex   00105D R   |   4 tone       0025AE R   |   4 try_next   002E59 R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   0008E5 GR
  4 uart1_in   000890 R   |   4 uart1_pu   0008D5 GR  |   4 uart1_qg   0008DE GR
  4 uart1_se   0008A0 R   |   4 ubound     001C73 R   |   4 uflash     0029D2 R
  4 unlock_e   000670 R   |   4 unlock_f   00068B R   |   4 until      002D7F R
  4 user_int   000049 R   |   4 usr        0029EF R   |   4 var_name   001162 GR
  5 vars       000034 GR  |   4 wait       002144 R   |   4 warm_ini   001446 R
  4 warm_sta   0016BC R   |   4 words      002C4A R   |   4 words_co   002C9E R
  4 write      0028F8 R   |   4 write_bl   0007F1 GR  |   4 write_bu   00072D R
  4 write_by   000777 R   |   4 write_ee   0007B3 R   |   4 write_ex   0007EC R
  4 write_fl   00079D R   |   4 write_nb   000816 R   |   4 xalloc     002F97 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

  4 xdrop      002FCD R   |   4 xpick      00304B R   |   4 xpop       002F8D R
  4 xpush      002F89 R   |   4 xput       003018 R   |   4 xstack_b   002FFA R
  2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
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

