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
      0080ED CC 97 4E         [ 2]  179 5$:	jp warm_start
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
      00819E CD 9D 73         [ 4]  280 	call func_eefree 
      0081A1 CD 9C AA         [ 4]  281 	call ubound 
      0081A4 CD 95 1E         [ 4]  282 	call clear_basic
      0081A7 CD A5 D5         [ 4]  283 	call beep_1khz  
      0081AA CD 94 CB         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 10         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 4E         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 94 FC         [ 4]  293 	call warm_init
      0081BC AE B6 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 89 E8         [ 4]  299 	call puts 
      0081CF CD 9E 9B         [ 4]  300 	call program_info 
      0081D2 CC A5 79         [ 2]  301 	jp run_it_02  
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
      0082EB 96 C4 FE         [ 4]  240     call neg24
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
      008363 C4 05            [ 1]  346     jrne 1$ 
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
      0083A7 C4 01            [ 1]  385     sbc a,(DIVISOR,sp)
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
      008412 CD 17 93         [ 4]   84 	call prt_i16  
      008412 0D 06            [ 1]   85 	ld a,#': 
      008414 27 03 CD         [ 4]   86 	call putc 
      008417 82 90            [ 1]   87 	ld a,#SPACE 
      008419 5B 06 81         [ 4]   88 	call putc 
      00841C 85               [ 2]   89 	popw x 
      00841C CD               [ 1]   90 	ld a,(x)
      00841D 83               [ 1]   91 	clrw x 
      00841E 82               [ 1]   92 	ld xl,a 
      00841F 90 F7 90 EF      [ 1]   93 	mov base,#10 
      008423 01 81 93         [ 4]   94 	call prt_i16 
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
      008494 CD 98 13         [ 1]  186 	ld acc16,a 
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
      0084AA 98 13 81         [ 2]  197 	ldw x,#REG_Y
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
      0084D7 CD 98 13 CD 84         222 REG_CC:  .asciz "\nCC:"
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
      0084E3 0B CD 98 13      [ 1]  237 	clr farptr 
      0084E7 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      0084EB 8B 81 00 1A      [ 1]  239 	clr farptr+2  
      0084ED                        240 repl:
      0084ED 90 89            [ 1]  241 	ld a,#CR 
      0084EF CD 89 E8         [ 4]  242 	call putc 
      0084F2 1E 01            [ 1]  243 	ld a,#'? 
      0084F4 35 10 00         [ 4]  244 	call putc
      0084F7 0B CD 98 13      [ 1]  245 	clr in.w 
      0084FB CD 84 C0 85      [ 1]  246 	clr in 
      0084FF 35 0A 00         [ 4]  247 	call readln
      008502 0B CD 98 13      [ 2]  248 	ldw y,#tib  
      008506 A6 29            [ 1]  249 	ld a,(y)
      008508 CD 89            [ 1]  250 	jreq repl  
      00850A 8B 81 00 01      [ 1]  251 	inc in 
      00850C CD 18 29         [ 4]  252 	call to_upper 
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
      00852B 98 2A            [ 1]  268     cp a,#'S 
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
      0085E5 02 CD 98         [ 4]  390 	call putc
      00064A                        391 row_loop:
      0085E8 A9 A1            [ 2]  392 	ldw x,(ADR,sp)
      0085EA 51               [ 1]  393 	ld a,(x)
      0085EB 26               [ 1]  394 	clrw x 
      0085EC 17               [ 1]  395 	ld xl,a 
      0085ED CD 17 93         [ 4]  396 	call prt_i16 
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
      00862A E0 CD 98         [ 1]  441 	ld base,a
      00862D B5 C6            [ 1]  442 	ld a,(TABW,sp)
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
      00865E 2A 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
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
      00869C 98 2A A6         [ 2]  103 	ldw x,#tib 
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
      0086B4 CC 96 C2 81      [ 1]  132 	ldf ([farptr],y),a
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
      0086C3 98 13            [ 2]  140 	popw y 
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
      0086D0 98 13 1E         [ 2]  155 	ldw x,#tib ; destination address 
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
      0086E7 A3 36 00         [ 2]  174 	cpw x,#app_space  
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
      0087EE B6               [ 1]  409 	incw x 
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
      008811 B6 80 24         [ 1]   87 	ld rx1_tail,a 
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
      008841 B6 80 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
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
      0089E7 81 18 35         [ 4]  595 	call atoi24
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
      008B76 98 B5 CE         [ 2]  130 	addw x,(LEN,sp)
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
      008C25 CD A5            [ 1]  284 	jreq 3$
      008C27 D5               [ 1]  285 	incw x 
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
      008C47 CD 18 29         [ 4]  322 	call to_upper 
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
      008E26 CD 98 A9 6B      [ 2]  710 	addw y,#2
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
      008E47 CD 98            [ 2]  723 	pushw y 
      008E49 B5 16 03         [ 4]  724 	call strcpy
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
      008ECB CD 98            [ 1]  789 	ld a,(TCHAR,sp)
      008ECD A9 F7 5C         [ 4]  790 	call is_alpha 
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



      008EF6 31 A6 85         [ 2]  831 	ldw x,#0
      008EF9 20 36 E0         [ 2]  832 	ldw pad,x ; destination buffer 
      008EFB C7 16 E2         [ 1]  833 	ld pad+2,a ; count 
      008EFB AE B4 5A         [ 2]  834 	ldw x,#pad+3
      008EFE 16 01 90 5C      [ 1]  835 	clr in 
      008F02 CD 99 36         [ 4]  836 	call get_token
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
      008F3D A3 9C B5         [ 2]  866 	ldw x,ptr16  
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
      008F81 98 A9            [ 1]  103 	jrpl 1$
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
      008F93 91 13 64         [ 4]  128 	call skip_string 
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
      009011 CD 17 4B         [ 4]  226 	call next_token 
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
      009032 93 AE A0         [ 1]  248 	ld acc24,a 
      009035 31 90 FF         [ 2]  249 	ldw acc16,x 
      009038 72 A9 00         [ 4]  250 	call add_space
      00903B 02 CC            [ 2]  251 	pushw y 
      00903D 91 13            [ 1]  252 	ld a,#255 ; signed conversion 
      00903F CD 17 D0         [ 4]  253 	call itoa  
      00903F A6 27            [ 2]  254 	ldw y,(1,sp) 
      009041 11               [ 1]  255 	push a 
      009042 01               [ 1]  256 	exgw x,y 
      009043 26 2B A6         [ 4]  257 	call strcpy 
      009046 80 F7            [ 1]  258 	clrw y
      009048 5C               [ 1]  259 	pop a  
      009049 90 AE            [ 1]  260 	ld yl,a 
      00904B A1 79 FF         [ 2]  261 	addw y,(1,sp)
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
      00909C CD 17 64         [ 4]  314 	call skip_string 
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
      009101 96 C2            [ 2]  380 	jra 81$
      009103                        381 12$:
      009103 CD 8E            [ 1]  382 	sub a,#TK_GT  
      009105 E2               [ 1]  383 	sll a 
      009106 A3               [ 1]  384 	clrw x 
      009107 A1               [ 1]  385 	ld xl,a 
      009108 79 26 08         [ 2]  386 	addw x,#relop_str 
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
      009145 C4 CF 16               415 le: .asciz "<="
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
      009156 96 C4            [ 2]  434 1$:	ldw (LINK,sp),x
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
      001386                        116 strlen::
      00917D CF               [ 2]  117 	pushw x 
      00917E 00               [ 1]  118 	clr a
      00917F 05               [ 1]  119 1$:	tnz (x) 
      009180 E6 02            [ 1]  120 	jreq 9$ 
      009182 C7               [ 1]  121 	inc a 
      009183 00               [ 1]  122 	incw x 
      009184 04 35            [ 2]  123 	jra 1$ 
      009186 03               [ 2]  124 9$:	popw x 
      009187 00               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      001391                        135 strcmp:
      009188 02               [ 1]  136 	ld a,(x)
      009189 27 0B            [ 1]  137 	jreq 5$ 
      009189 5B 02            [ 1]  138 	cp a,(y) 
      00918B 72 1B            [ 1]  139 	jrne 4$ 
      00918D 00               [ 1]  140 	incw x 
      00918E 23 90            [ 1]  141 	incw y 
      009190 85 81            [ 2]  142 	jra strcmp 
      009192                        143 4$: ; not same  
      009192 5D               [ 1]  144 	clr a 
      009193 27               [ 4]  145 	ret 
      00139F                        146 5$: ; same 
      009194 14 F6            [ 1]  147 	ld a,#1 
      009196 5C               [ 4]  148 	ret 
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
      0013A2                        159 strcpy::
      009197 A4               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009198 0F               [ 2]  161 	pushw x 
      009199 88 0D            [ 1]  162 1$: ld a,(y)
      00919B 01 27            [ 1]  163 	jreq 9$ 
      00919D 0A               [ 1]  164 	ld (x),a 
      00919E F6               [ 1]  165 	incw x 
      00919F 90 F7            [ 1]  166 	incw y 
      0091A1 5C 90            [ 2]  167 	jra 1$ 
      0091A3 5C               [ 1]  168 9$:	clr (x)
      0091A4 0A               [ 2]  169 	popw x 
      0091A5 01               [ 1]  170 	pop a 
      0091A6 26               [ 4]  171 	ret 
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
      0013B2                        185 move::
      0091A7 F6               [ 1]  186 	push a 
      0013B3                        187 	_vars VSIZE 
      0091A8 84 02            [ 2]    1     sub sp,#VSIZE 
      0091A9 0F 01            [ 1]  188 	clr (INCR,sp)
      0091A9 81 02            [ 1]  189 	clr (LB,sp)
      0091AA 90 89            [ 2]  190 	pushw y 
      0091AA 90 5A            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      0091AC 90 F6            [ 2]  192 	popw y 
      0091AE 90 5C            [ 1]  193 	jreq move_exit ; x==y 
      0091B0 A1 29            [ 1]  194 	jrmi move_down
      0013C3                        195 move_up: ; start from top address with incr=-1
      0091B2 27 05 CD 8E      [ 2]  196 	addw x,acc16
      0091B6 B6 24 06 0D      [ 2]  197 	addw y,acc16
      0091B9 03 01            [ 1]  198 	cpl (INCR,sp)
      0091B9 A6 20            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      0091BB 90 F7            [ 2]  200 	jra move_loop  
      0013D1                        201 move_down: ; start from bottom address with incr=1 
      0091BD 90               [ 2]  202     decw x 
      0091BE 5C 81            [ 2]  203 	decw y
      0091C0 0C 02            [ 1]  204 	inc (LB,sp) ; incr=1 
      0013D6                        205 move_loop:	
      0091C0 88 7B 01         [ 1]  206     ld a, acc16 
      0091C3 C1 00 24         [ 1]  207 	or a, acc8
      0091C6 2A 08            [ 1]  208 	jreq move_exit 
      0091C8 A6 20 5A         [ 2]  209 	addw x,(INCR,sp)
      0091CB F7 0C 01         [ 2]  210 	addw y,(INCR,sp) 
      0091CE 20 F1            [ 1]  211 	ld a,(y)
      0091D0 84               [ 1]  212 	ld (x),a 
      0091D1 81               [ 2]  213 	pushw x 
      0091D2 CE 00 0D         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      0091D2 A6               [ 2]  215 	decw x 
      0091D3 22 90 F7         [ 2]  216 	ldw acc16,x 
      0091D6 90               [ 2]  217 	popw x 
      0091D7 5C 89            [ 2]  218 	jra move_loop
      0013F2                        219 move_exit:
      0013F2                        220 	_drop VSIZE
      0091D9 CD 97            [ 2]    1     addw sp,#VSIZE 
      0091DB E4               [ 1]  221 	pop a 
      0091DC 85               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      0013F6                        231 clear_vars:
      0091DD F6               [ 2]  232 	pushw x 
      0091DE 27               [ 1]  233 	push a  
      0091DF 30 5C A1         [ 2]  234 	ldw x,#vars 
      0091E2 20 25            [ 1]  235 	ld a,#CELL_SIZE*26 
      0091E4 0E               [ 1]  236 1$:	clr (x)
      0091E5 90               [ 1]  237 	incw x 
      0091E6 F7               [ 1]  238 	dec a 
      0091E7 90 5C            [ 1]  239 	jrne 1$
      0091E9 A1               [ 1]  240 	pop a 
      0091EA 5C               [ 2]  241 	popw x 
      0091EB 26               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      0091EC F0 0A 54 69 6E 79 20   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      0091ED                        253 system_information:
      0091ED 90 F7 90         [ 2]  254 	ldw x,#software 
      0091F0 5C 20 EA         [ 4]  255 	call puts 
      0091F3 88 A6            [ 1]  256 	ld a,#MAJOR 
      0091F5 5C 90 F7         [ 1]  257 	ld acc8,a 
      0091F8 90               [ 1]  258 	clrw x 
      0091F9 5C 84 A0         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0091FC 07 C7 00 0F      [ 1]  260 	clr tab_width  
      009200 72 5F 00 0E      [ 1]  261 	mov base, #10 
      009204 89 AE 8E         [ 4]  262 	call prt_acc24 
      009207 08 72            [ 1]  263 	ld a,#'.
      009209 BB 00 0E         [ 4]  264 	call putc 
      00920C F6 85            [ 1]  265 	ld a,#MINOR 
      00920E 20 DD A6         [ 1]  266 	ld acc8,a 
      009211 22               [ 1]  267 	clrw x 
      009212 90 F7 90         [ 2]  268 	ldw acc24,x 
      009215 5C 5C 81         [ 4]  269 	call prt_acc24
      009218 A6 0D            [ 1]  270 	ld a,#CR 
      009218 1D 00 31         [ 4]  271 	call putc
                                    272 ;call test 
      00921B A6               [ 4]  273 	ret
                                    274 
      00147C                        275 warm_init:
      00921C 03 62 9F AB      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      009220 41 81 00 22      [ 1]  277 	clr flags 
      009222 72 5F 00 1F      [ 1]  278 	clr loop_depth 
      009222 52 04 C6 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009226 0B 6B 01 C6      [ 1]  280 	mov base,#10 
      00922A 00 24 6B         [ 2]  281 	ldw x,#0 
      00922D 02 17 03         [ 2]  282 	ldw basicptr,x 
      009230 72 CE 00         [ 2]  283 	ldw in.w,x 
      009233 05 35 0A 00      [ 1]  284 	clr count
      009237 0B               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      00149E                        291 clear_basic:
      009238 35               [ 2]  292 	pushw x 
      009239 05 00 24 72      [ 1]  293 	clr count
      00923D 5F 00 0D CF      [ 1]  294 	clr in  
      009241 00 0E 4F         [ 2]  295 	ldw x,#free_ram 
      009244 CD 98 50         [ 2]  296 	ldw txtbgn,x 
      009247 CD 91 C0         [ 2]  297 	ldw txtend,x 
      00924A 88 90 93         [ 4]  298 	call clear_vars 
      00924D 1E               [ 2]  299 	popw x
      00924E 04               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014B5                        305 err_msg:
      00924F CD 94 22 90 5F 84 90   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             97 72 F9 03 A6
      00925B 20 90 F7 90 5C 72 5F   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             00 24 AE
      009265 00 03 CF 00 01 D1 15   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             E5 15 F8
      00926A 16 05                  309 	.word err_overflow 
                                    310 
      00926A 90 89 CD 97 CB 90 85   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  4D-Bits]



             66 75 6C 6C 0A 00
      009272 26 03 CC 93 97 2B 03   312 err_syntax: .asciz "syntax error\n" 
             CC 93 08 6F 72 0A 00
      00927C 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      00927C A1 85 26 0F CD 91 AA   314 err_div0: .asciz "division by 0\n" 
             CD 97 F3 CD 92 18 90
             F7
      00928B 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      00928F 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      00928F A1 84 26 26 CD 97 FD   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 AA 90 89 A6 FF CD
             98 50 16 01 88
      0092A9 51 CD 94 22 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      0092B9 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      0092B9 A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      0092C5 02 A3 A1 79 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 AA A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092D7 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092D7 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      0092EB CC 93 97 A3 9C B5 26   324 err_no_fspace: .asciz "File system full.\n" 
             05 CC 92 6A 20 66 75
             6C 6C 2E 0A 00
      0092F6 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      0092F6 5F 97 65 72 66 6C 6F   326 err_overflow: .asciz "overflow\n" 
             77 0A 00
                                    327 
      0092F8 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      0092F8 CD 91 AA 90 89 CD 93   329 comp_msg: .asciz "\ncompile error, "
             D2 90 85 CD 91 92 CC
             92 6A 00
      009308 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      001642                        332 syntax_error::
      009308 A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      001644                        335 tb_error::
      00930A 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      00930F F7               [ 1]  337 	push a 
      009310 90 5C 0F         [ 2]  338 	ldw x, #rt_msg 
      009312 CD 09 68         [ 4]  339 	call puts 
      009312 89               [ 1]  340 	pop a 
      009313 CD 97 E4         [ 2]  341 	ldw x, #err_msg 
      009316 85 5F 00 0D      [ 1]  342 	clr acc16 
      009317 48               [ 1]  343 	sll a
      009317 F6 27 07 5C      [ 1]  344 	rlc acc16  
      00931B 90 F7 90         [ 1]  345 	ld acc8, a 
      00931E 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      009321 FE               [ 2]  347 	ldw x,(x)
      009321 A6 20 90         [ 4]  348 	call puts
      009324 F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      009327 CC 92 6A         [ 1]  351 ld a,count 
      00932A 90 5F            [ 1]  352 clrw y 
      00932A A1 02            [ 1]  353 rlwa y  
      00932C 26 09 CD         [ 4]  354 call hex_dump
      00932F 91 AA CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      009332 91 D2 CC         [ 1]  357 	ld a,in 
      009335 92 6A 8D         [ 4]  358 	call prt_basic_line
      009337 AE 16 32         [ 2]  359 	ldw x,#tk_id 
      009337 A1 04 26         [ 4]  360 	call puts 
      00933A 10 CD 91         [ 1]  361 	ld a,in.saved 
      00933D AA               [ 1]  362 	clrw x 
      00933E A6               [ 1]  363 	ld xl,a 
      00933F 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      009343 5C               [ 1]  365 	ld a,(x)
      009344 F6               [ 1]  366 	clrw x 
      009345 72               [ 1]  367 	ld xl,a 
      009346 5C 00 02         [ 4]  368 	call prt_i16
      009349 20 06            [ 2]  369 	jra 6$
      001695                        370 1$:	
      00934B A1               [ 1]  371 	push a 
      00934C 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      00934F A6 3A 68         [ 4]  373 	call puts 
      009351 84               [ 1]  374 	pop a 
      009351 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      009354 5C 5F 00 0D      [ 1]  376 	clr acc16 
      009355 48               [ 1]  377 	sll a
      009355 CC 92 6A 0D      [ 1]  378 	rlc acc16  
      009358 C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009358 A1 09 22 0A      [ 2]  380 	addw x,acc16 
      00935C A0               [ 2]  381 	ldw x,(x)
      00935D 05 5F 97         [ 4]  382 	call puts
      009360 1C 93 AD         [ 2]  383 	ldw x,#tib
      009363 F6 20 EB         [ 4]  384 	call puts 
      009366 A6 0D            [ 1]  385 	ld a,#CR 
      009366 A1 11 22         [ 4]  386 	call putc
      009369 0A A0 10         [ 2]  387 	ldw x,in.w
      00936C 5F 97 1C         [ 4]  388 	call spaces
      00936F 93 B2            [ 1]  389 	ld a,#'^
      009371 F6 20 DD         [ 4]  390 	call putc 
      009374 AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      009374 A1               [ 1]  392     ldw sp,x
                                    393 
      0016CE                        394 warm_start:
      009375 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      0016D1                        399 cmd_line: ; user interface 
      009378 A0 20            [ 1]  400 	ld a,#CR 
      00937A 5F 97 1C         [ 4]  401 	call putc 
      00937D 93 B4            [ 1]  402 	ld a,#'> 
      00937F F6 20 CF         [ 4]  403 	call putc
      009382 CD 0A 6D         [ 4]  404 	call readln
      009382 A0 31 48 5F      [ 1]  405 	tnz count 
      009386 97 1C            [ 1]  406 	jreq cmd_line
      009388 93 B7 FE         [ 4]  407 	call compile
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
      00938B F6 5C 90 F7      [ 1]  421 	tnz count 
      00938F 90 5C            [ 1]  422 	jreq cmd_line
                                    423 	
                                    424 ; if direct command 
                                    425 ; it's ready to interpret 
                                    426 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    427 ;; This is the interpreter loop
                                    428 ;; for each BASIC code line. 
                                    429 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      0016ED                        430 interpreter: 
      009391 F6 26 BD         [ 1]  431 	ld a,in 
      009394 CC 92 6A         [ 1]  432 	cp a,count 
      009397 2B 1D            [ 1]  433 	jrmi interp_loop
      0016F5                        434 next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      009397 90 7F 1E 03 7B   [ 2]  435 	btjf flags, #FRUN, cmd_line
      00939C 01 C7 00         [ 2]  436 	ldw x,basicptr
      00939F 0B 7B 02 C7      [ 2]  437 	addw x,in.w 
      0093A3 00 24 72         [ 2]  438 	cpw x,txtend 
      0093A6 F2 03            [ 1]  439 	jrpl warm_start
      0093A8 90 9F 5B         [ 2]  440 	ldw basicptr,x ; start of next line  
      0093AB 04 81            [ 1]  441 	ld a,(2,x)
      0093AD 40 28 29         [ 1]  442 	ld count,a 
      0093B0 2C 23 2B 2D      [ 1]  443 	mov in,#3 ; skip first 3 bytes of line 
      001712                        444 interp_loop:
      0093B4 2A 2F 25         [ 4]  445 	call next_token
      0093B7 93 C3            [ 1]  446 	cp a,#TK_NONE 
      0093B9 93 C5            [ 1]  447 	jreq next_line 
      0093BB 93 C7            [ 1]  448 	cp a,#TK_CMD
      0093BD 93 CA            [ 1]  449 	jrne 1$
      00171D                        450 	_get_code_addr
      0093BF 93               [ 2]    1         ldw x,(x)
      0093C0 CF 93 CC 3E      [ 1]    2         inc in 
      0093C4 00 3D 00 3E      [ 1]    3         inc in 
      0093C8 3D               [ 4]  451 	call(x)
      0093C9 00 3C            [ 2]  452 	jra interp_loop 
      001729                        453 1$:	 
      0093CB 00 3C            [ 1]  454 	cp a,#TK_VAR
      0093CD 3D 00            [ 1]  455 	jrne 2$
      0093CF 3C 3E 00         [ 4]  456 	call let_var  
      0093D2 20 E0            [ 2]  457 	jra interp_loop 
      001732                        458 2$:	
      0093D2 52 04            [ 1]  459 	cp a,#TK_ARRAY 
      0093D4 72 5F            [ 1]  460 	jrne 3$
      0093D6 00 0E 1F         [ 4]  461 	call let_array 
      0093D9 01 AE            [ 2]  462 	jra interp_loop
      00173B                        463 3$:	
      0093DB B4 58            [ 1]  464 	cp a,#TK_COLON 
      0093DD 1F 03            [ 1]  465 	jreq interp_loop
      0093DF E6 02            [ 1]  466 4$: cp a,#TK_LABEL
      0093E1 A4 0F            [ 1]  467 	jrne 5$
      0093E3 C7 00 0F         [ 4]  468 	call skip_string 
      0093E6 1C 00            [ 2]  469 	jra interp_loop 
      0093E8 03 72 BB         [ 2]  470 5$:	jp syntax_error 
                                    471 
                                    472 ;--------------------------
                                    473 ; extract next token from
                                    474 ; token list 
                                    475 ; basicptr -> base address 
                                    476 ; in  -> offset in list array 
                                    477 ; output:
                                    478 ;   A 		token attribute
                                    479 ;   X 		*token_value 
                                    480 ;----------------------------------------
      00174B                        481 next_token::
                                    482 ;	clrw x 
      0093EB 00 0E FE         [ 1]  483 	ld a,in 
      0093EE 13 01 27         [ 1]  484 	ld in.saved,a ; in case "_unget_token" needed 
                                    485 ; don't replace sub by "cp a,count" 
                                    486 ; if end of line must return with A=0   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      0093F1 0C 1E 03         [ 1]  487 	sub a,count 
      0093F4 FE 1D            [ 1]  488 	jreq 9$ ; end of line 
      001756                        489 0$: 
      0093F6 00 02 26         [ 2]  490 	ldw x,basicptr 
      0093F9 E3 4F 5F 20      [ 2]  491 	addw x,in.w 
      0093FD 05               [ 1]  492 	ld a,(x)
      0093FE 1E               [ 1]  493 	incw x
      0093FF 03 1C 00 02      [ 1]  494 	inc in   
      009403 5B               [ 4]  495 9$: ret 
                                    496 
                                    497 ;-------------------------
                                    498 ;  skip .asciz in BASIC line 
                                    499 ;  name 
                                    500 ;  input:
                                    501 ;     x		* string 
                                    502 ;  output:
                                    503 ;     none 
                                    504 ;-------------------------
      001764                        505 skip_string:
      009404 04               [ 1]  506 	ld a,(x)
      009405 81 03            [ 1]  507 	jreq 1$
      000001 5C               [ 1]  508 	incw x 
      000002 20 FA            [ 2]  509 	jra skip_string 
      000003 5C               [ 1]  510 1$: incw x 	
      000004 72 B0 00 04      [ 2]  511 	subw x,basicptr 
      000005 CF 00 00         [ 2]  512 	ldw in.w,x 
      000007 81               [ 4]  513 	ret 
                                    514 
                                    515 ;---------------------
                                    516 ; extract 16 bits  
                                    517 ; address from BASIC
                                    518 ; code 
                                    519 ; input:
                                    520 ;    X    *address
                                    521 ; output:
                                    522 ;    X    address 
                                    523 ;-------------------- 
      000009                        524 get_addr:
      00000A FE               [ 2]  525 	ldw x,(x)
      00000B 72 5C 00 01      [ 1]  526 	inc in 
      00000C 72 5C 00 01      [ 1]  527 	inc in 
      00000D 81               [ 4]  528 	ret 
                                    529 
                                    530 ;--------------------
                                    531 ; extract int24_t  
                                    532 ; value from BASIC 
                                    533 ; code 
                                    534 ; input:
                                    535 ;    X   *integer 
                                    536 ; output:
                                    537 ;    A:X   int24  
                                    538 ;--------------------
      00000E                        539 get_int24:
      00000F F6               [ 1]  540 	ld a,(x)
      000010 EE 01            [ 2]  541 	ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    542 ; skip 3 bytes 
      000013 72 5C 00 01      [ 1]  543 	inc in 
      000015 72 5C 00 01      [ 1]  544 	inc in 
      000017 72 5C 00 01      [ 1]  545 	inc in 
      000019 81               [ 4]  546 	ret 
                                    547 
                                    548 ;-------------------------
                                    549 ; get character from 
                                    550 ; BASIC code 
                                    551 ; input:
                                    552 ;    X   *char 
                                    553 ; output:
                                    554 ;    A    char 
                                    555 ;-------------------------
      00001A                        556 get_char:
      00001B F6               [ 1]  557 	ld a,(x)
      00001C 72 5C 00 01      [ 1]  558 	inc in  
      00001E 81               [ 4]  559     ret 
                                    560 
                                    561 ;-----------------------------------
                                    562 ; print a 16 bit integer 
                                    563 ; using variable 'base' as conversion
                                    564 ; format.
                                    565 ; input:
                                    566 ;    X       integer to print 
                                    567 ;   'base'    conversion base 
                                    568 ; output:
                                    569 ;   terminal  
                                    570 ;-----------------------------------
      000020                        571 prt_i16:
      000021 72 5F 00 0C      [ 1]  572 	clr acc24 
      000023 CF 00 0D         [ 2]  573 	ldw acc16,x 
      000024 A6 10            [ 1]  574 	ld a,#16
      000025 C1 00 0A         [ 1]  575 	cp a,base
      000027 27 09            [ 1]  576 	jreq prt_acc24  
      00002F 72 0F 00 0D 04   [ 2]  577 	btjf acc16,#7,prt_acc24
      000030 72 53 00 0C      [ 1]  578 	cpl acc24 ; sign extend 
                                    579 	
                                    580 ;------------------------------------
                                    581 ; print integer in acc24 
                                    582 ; input:
                                    583 ;	acc24 		integer to print 
                                    584 ;	'base' 		numerical base for conversion 
                                    585 ;   'tab_width' field width 
                                    586 ;    A 			signed||unsigned conversion
                                    587 ;  output:
                                    588 ;    A          string length
                                    589 ;------------------------------------
      000031                        590 prt_acc24:
      00007C A6 FF            [ 1]  591 	ld a,#255  ; signed conversion  
      00007C CD 17 D0         [ 4]  592     call itoa  ; conversion entier en  .asciz
      00007E CD 11 40         [ 4]  593 	call right_align  
      000080 88               [ 1]  594 	push a 
      009406 CD 09 68         [ 4]  595 	call puts
      009406 89               [ 1]  596 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      009407 4F               [ 4]  597     ret	
                                    598 
                                    599 ;---------------------------------------
                                    600 ;  print value at xstack top 
                                    601 ;---------------------------------------
      0017B8                        602 print_top: 
      0017B8                        603 	_xpop 
      009408 7D 27            [ 1]    1     ld a,(y)
      00940A 04               [ 1]    2     ldw x,y 
      00940B 4C 5C            [ 2]    3     ldw x,(1,x)
      00940D 20 F9 85 81      [ 2]    4     addw y,#CELL_SIZE 
      009411 C7 00 0C         [ 1]  604 	ld acc24,a 
      009411 F6 27 0B         [ 2]  605 	ldw acc16,x 
      009414 90 F1 26         [ 4]  606 	call prt_acc24 
      009417 05 5C            [ 1]  607 	ld a,#SPACE
      009419 90 5C 20         [ 4]  608 	call putc 
      00941C F4               [ 4]  609 	ret 
                                    610 
                                    611 ;------------------------------------
                                    612 ; convert integer in acc24 to string
                                    613 ; input:
                                    614 ;   'base'	conversion base 
                                    615 ;	acc24	integer to convert
                                    616 ;   A       0=unsigned, else signed 
                                    617 ; output:
                                    618 ;   X  		pointer to first char of string
                                    619 ;   A       string length
                                    620 ;------------------------------------
                           000001   621 	SIGN=1  ; integer sign 
                           000002   622 	LEN=2 
                           000003   623 	PSTR=3
                           000004   624 	VSIZE=4 ;locals size
      00941D                        625 itoa::
      0017D0                        626 	_vars VSIZE
      00941D 4F 81            [ 2]    1     sub sp,#VSIZE 
      00941F 0F 02            [ 1]  627 	clr (LEN,sp) ; string length  
      00941F A6 01            [ 1]  628 	clr (SIGN,sp)    ; sign
      009421 81               [ 1]  629 	tnz A
      009422 27 11            [ 1]  630 	jreq 1$ ; unsigned conversion  
      009422 88 89 90         [ 1]  631 	ld a,base 
      009425 F6 27            [ 1]  632 	cp a,#10
      009427 06 F7            [ 1]  633 	jrne 1$
                                    634 	; base 10 string display with negative sign if bit 23==1
      009429 5C 90 5C 20 F6   [ 2]  635 	btjf acc24,#7,1$
      00942E 7F 85            [ 1]  636 	cpl (SIGN,sp)
      009430 84 81 18         [ 4]  637 	call neg_acc24
      009432                        638 1$:
                                    639 ; initialize string pointer 
      009432 88 52 02         [ 2]  640 	ldw x,#tib 
      009435 0F 01 0F         [ 2]  641 	addw x,#TIB_SIZE
      009438 02               [ 2]  642 	decw x 
      009439 90               [ 1]  643 	clr (x)
      0017F2                        644 itoa_loop:
      00943A 89 13 01         [ 1]  645     ld a,base
                                    646 ;	ldw (PSTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00943D 90 85 27         [ 4]  647     call divu24_8 ; acc24/A 
                                    648 ;	ldw x,(PSTR,sp)
      009440 31 2B            [ 1]  649     add a,#'0  ; remainder of division
      009442 0E 3A            [ 1]  650     cp a,#'9+1
      009443 2B 02            [ 1]  651     jrmi 2$
      009443 72 BB            [ 1]  652     add a,#7 
      001800                        653 2$:	
      009445 00               [ 2]  654 	decw x
      009446 0E               [ 1]  655     ld (x),a
      009447 72 B9            [ 1]  656 	inc (LEN,sp)
                                    657 	; if acc24==0 conversion done
      009449 00 0E 03         [ 1]  658 	ld a,acc24
      00944C 01 03 02         [ 1]  659 	or a,acc16
      00944F 20 05 0E         [ 1]  660 	or a,acc8
      009451 26 E3            [ 1]  661     jrne itoa_loop
                                    662 	;conversion done, next add '$' or '-' as required
      009451 5A 90 5A         [ 1]  663 	ld a,base 
      009454 0C 02            [ 1]  664 	cp a,#16
      009456 27 08            [ 1]  665 	jreq 8$
      009456 C6 00            [ 1]  666 	ld a,(SIGN,sp)
      009458 0E CA            [ 1]  667     jreq 10$
      00945A 00 0F            [ 1]  668     ld a,#'-
      00945C 27 14            [ 2]  669 	jra 9$ 
      00181E                        670 8$:	
      00945E 72 FB            [ 1]  671 	ld a,#'$ 
      009460 01               [ 2]  672 9$: decw x
      009461 72               [ 1]  673     ld (x),a
      009462 F9 01            [ 1]  674 	inc (LEN,sp)
      001824                        675 10$:
      009464 90 F6            [ 1]  676 	ld a,(LEN,sp)
      001826                        677 	_drop VSIZE
      009466 F7 89            [ 2]    1     addw sp,#VSIZE 
      009468 CE               [ 4]  678 	ret
                                    679 
                                    680 ;------------------------------------
                                    681 ; convert alpha to uppercase
                                    682 ; input:
                                    683 ;    a  character to convert
                                    684 ; output:
                                    685 ;    a  uppercase character
                                    686 ;------------------------------------
      001829                        687 to_upper::
      009469 00 0E            [ 1]  688 	cp a,#'a
      00946B 5A CF            [ 1]  689 	jrpl 1$
      00946D 00               [ 4]  690 0$:	ret
      00946E 0E 85            [ 1]  691 1$: cp a,#'z	
      009470 20 E4            [ 1]  692 	jrugt 0$
      009472 A0 20            [ 1]  693 	sub a,#32
      009472 5B               [ 4]  694 	ret
                                    695 	
                                    696 ;------------------------------------
                                    697 ; convert pad content in integer
                                    698 ; input:
                                    699 ;    x		* .asciz to convert
                                    700 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



                                    701 ;    acc24      int24_t
                                    702 ;------------------------------------
                                    703 	; local variables
                           000001   704 	SIGN=1 ; 1 byte, 
                           000002   705 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   706 	TEMP=3 ; 1 byte, temporary storage
                           000004   707 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   708 	VSIZE=5 ; 5 bytes reserved for local storage
      001835                        709 atoi24::
      001835                        710 	_vars VSIZE
      009473 02 84            [ 2]    1     sub sp,#VSIZE 
      009475 81 04            [ 2]  711 	ldw (XTEMP,sp),x 
                                    712 ; conversion made on xstack 
      009476 4F               [ 1]  713 	clr a 
      009476 89               [ 1]  714 	clrw x 
      00183B                        715 	_xpush 
      009477 88 AE 00 31      [ 2]    1     subw y,#CELL_SIZE
      00947B A6 4E            [ 1]    2     ld (y),a 
      00947D 7F 5C 4A         [ 2]    3     ldw (1,y),x 
      009480 26 FB            [ 1]  716 	clr (SIGN,sp)
      009482 84 85            [ 1]  717 	ld a,#10
      009484 81 0A            [ 1]  718 	ld (BASE,sp),a ; default base decimal
      009486 0A 54            [ 2]  719 	ldw x,(XTEMP,sp)
      009488 69               [ 1]  720 	ld a,(x)
      009489 6E 79            [ 1]  721 	jreq 9$  ; completed if 0
      00948B 20 42            [ 1]  722 	cp a,#'-
      00948D 41 53            [ 1]  723 	jrne 1$
      00948F 49 43            [ 1]  724 	cpl (SIGN,sp)
      009491 20 66            [ 2]  725 	jra 2$
      009493 6F 72            [ 1]  726 1$: cp a,#'$
      009495 20 53            [ 1]  727 	jrne 3$
      009497 54 4D            [ 1]  728 	ld a,#16
      009499 38 0A            [ 1]  729 	ld (BASE,sp),a
      00949B 43               [ 1]  730 2$:	incw x
      00949C 6F 70            [ 2]  731 	ldw (XTEMP,sp),x 
      00949E 79               [ 1]  732 	ld a,(x)
      001863                        733 3$:	; char to digit 
      00949F 72 69            [ 1]  734 	cp a,#'a
      0094A1 67 68            [ 1]  735 	jrmi 4$
      0094A3 74 2C            [ 1]  736 	sub a,#32
      0094A5 20 4A            [ 1]  737 4$:	cp a,#'0
      0094A7 61 63            [ 1]  738 	jrmi 9$
      0094A9 71 75            [ 1]  739 	sub a,#'0
      0094AB 65 73            [ 1]  740 	cp a,#10
      0094AD 20 44            [ 1]  741 	jrmi 5$
      0094AF 65 73            [ 1]  742 	sub a,#7
      0094B1 63 68            [ 1]  743 	cp a,(BASE,sp)
      0094B3 65 6E            [ 1]  744 	jrpl 9$
      0094B5 65 73            [ 1]  745 5$:	ld (TEMP,sp),a
      0094B7 20 32            [ 1]  746 	ld a,(BASE,sp)
      0094B9 30 31 39         [ 4]  747 	call mulu24_8
      001880                        748 	_xpush 
      0094BC 2C 32 30 32      [ 2]    1     subw y,#CELL_SIZE
      0094C0 32 0A            [ 1]    2     ld (y),a 
      0094C2 76 65 72         [ 2]    3     ldw (1,y),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0094C5 73               [ 1]  749 	clrw x 
      0094C6 69 6F            [ 1]  750 	ld a,(TEMP,sp)
      0094C8 6E               [ 1]  751 	rlwa x 
      00188D                        752 	_xpush 
      0094C9 20 00 00 03      [ 2]    1     subw y,#CELL_SIZE
      0094CB 90 F7            [ 1]    2     ld (y),a 
      0094CB AE 94 85         [ 2]    3     ldw (1,y),x 
      0094CE CD 89 E8         [ 4]  753 	call add24 
      0094D1 A6 02            [ 2]  754 	ldw x,(XTEMP,sp)
      0094D3 C7 00            [ 2]  755 	jra 2$
      0094D5 0F 5F            [ 1]  756 9$:	tnz (SIGN,sp)
      0094D7 CF 00            [ 1]  757     jreq atoi_exit
      0094D9 0D 72 5F         [ 4]  758     call neg24
      0018A4                        759 atoi_exit:
      0018A4                        760 	_xpop 
      0094DC 00 24            [ 1]    1     ld a,(y)
      0094DE 35               [ 1]    2     ldw x,y 
      0094DF 0A 00            [ 2]    3     ldw x,(1,x)
      0094E1 0B CD 98 2A      [ 2]    4     addw y,#CELL_SIZE 
      0094E5 A6 2E CD         [ 1]  761 	ld acc24,a 
      0094E8 89 8B A6         [ 2]  762 	ldw acc16,x  
      0018B3                        763 	_drop VSIZE
      0094EB 00 C7            [ 2]    1     addw sp,#VSIZE 
      0094ED 00               [ 4]  764 	ret
                                    765 
                                    766 
                                    767 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    768 ;;   TINY BASIC  operators,
                                    769 ;;   commands and functions 
                                    770 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    771 
                                    772 ;---------------------------------
                                    773 ; dictionary search 
                                    774 ; input:
                                    775 ;	X 		dictionary entry point, name field  
                                    776 ;   y		.asciz name to search 
                                    777 ; output:
                                    778 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    779 ;  X		routine address|TK_OP 
                                    780 ;---------------------------------
                           000001   781 	NLEN=1 ; cmd length 
                           000002   782 	XSAVE=2
                           000004   783 	YSAVE=4
                           000005   784 	VSIZE=5 
      0018B6                        785 search_dict::
      0018B6                        786 	_vars VSIZE 
      0094EE 0F 5F            [ 2]    1     sub sp,#VSIZE 
      0094F0 CF 00            [ 2]  787 	ldw (YSAVE,sp),y 
      0018BA                        788 search_next:
      0094F2 0D CD            [ 2]  789 	ldw (XSAVE,sp),x 
                                    790 ; get name length in dictionary	
      0094F4 98               [ 1]  791 	ld a,(x)
      0094F5 2A A6            [ 1]  792 	and a,#0xf 
      0094F7 0D CD            [ 1]  793 	ld (NLEN,sp),a  
      0094F9 89 8B            [ 2]  794 	ldw y,(YSAVE,sp) ; name pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      0094FB 81               [ 1]  795 	incw x 
      0094FC                        796 cp_loop:
      0094FC 90 AE            [ 1]  797 	ld a,(y)
      0094FE 17 73            [ 1]  798 	jreq str_match 
      009500 72 5F            [ 1]  799 	tnz (NLEN,sp)
      009502 00 23            [ 1]  800 	jreq no_match  
      009504 72               [ 1]  801 	cp a,(x)
      009505 5F 00            [ 1]  802 	jrne no_match 
      009507 20 35            [ 1]  803 	incw y 
      009509 04               [ 1]  804 	incw x
      00950A 00 24            [ 1]  805 	dec (NLEN,sp)
      00950C 35 0A            [ 2]  806 	jra cp_loop 
      0018D6                        807 no_match:
      00950E 00 0B            [ 2]  808 	ldw x,(XSAVE,sp) 
      009510 AE 00 00         [ 2]  809 	subw x,#2 ; move X to link field
      009513 CF 00            [ 1]  810 	push #TK_NONE 
      009515 05               [ 2]  811 	ldw x,(x) ; next word link 
      009516 CF               [ 1]  812 	pop a ; TK_NONE 
      009517 00 01            [ 1]  813 	jreq search_exit  ; not found  
                                    814 ;try next 
      009519 72 5F            [ 2]  815 	jra search_next
      0018E3                        816 str_match:
      00951B 00 04            [ 2]  817 	ldw x,(XSAVE,sp)
      00951D 81               [ 1]  818 	ld a,(X)
      00951E 6B 01            [ 1]  819 	ld (NLEN,sp),a ; needed to test keyword type  
      00951E 89 72            [ 1]  820 	and a,#NLEN_MASK 
                                    821 ; move x to procedure address field 	
      009520 5F               [ 1]  822 	inc a 
      009521 00 04 72         [ 1]  823 	ld acc8,a 
      009524 5F 00 02 AE      [ 1]  824 	clr acc16 
      009528 00 80 CF 00      [ 2]  825 	addw x,acc16 
      00952C 1C               [ 2]  826 	ldw x,(x) ; routine address  
                                    827 ;determine keyword type bits 7:4 
      00952D CF 00            [ 1]  828 	ld a,(NLEN,sp)
      00952F 1E CD            [ 1]  829 	and a,#KW_TYPE_MASK 
      009531 94               [ 1]  830 	swap a 
      009532 76 85            [ 1]  831 	add a,#128
      0018FE                        832 search_exit: 
      0018FE                        833 	_drop VSIZE 
      009534 81 05            [ 2]    1     addw sp,#VSIZE 
      009535 81               [ 4]  834 	ret 
                                    835 
                                    836 ;---------------------
                                    837 ; check if next token
                                    838 ;  is of expected type 
                                    839 ; input:
                                    840 ;   A 		 expected token attribute
                                    841 ;  ouput:
                                    842 ;   none     if fail call syntax_error 
                                    843 ;--------------------
      001901                        844 expect:
      009535 00               [ 1]  845 	push a 
      009536 00 95 57         [ 4]  846 	call next_token 
      009539 95 64            [ 1]  847 	cp a,(1,sp)
      00953B 95 72            [ 1]  848 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      00953D 95 8B 95         [ 2]  849 	jp syntax_error
      009540 9A               [ 1]  850 1$: pop a 
      009541 95               [ 4]  851 	ret 
                                    852 
                                    853 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    854 ; parse arguments list 
                                    855 ; between ()
                                    856 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00190E                        857 func_args:
      009542 B0 95            [ 1]  858 	ld a,#TK_LPAREN 
      009544 C6 95 E0         [ 4]  859 	call expect 
                                    860 ; expected to continue in arg_list 
                                    861 ; caller must check for TK_RPAREN 
                                    862 
                                    863 ;-------------------------------
                                    864 ; parse embedded BASIC routines 
                                    865 ; arguments list.
                                    866 ; arg_list::=  expr[','expr]*
                                    867 ; all arguments are of int24_t type
                                    868 ; and pushed on stack 
                                    869 ; input:
                                    870 ;   none
                                    871 ; output:
                                    872 ;   xstack{n}   arguments pushed on xstack
                                    873 ;   A 	number of arguments pushed on xstack  
                                    874 ;--------------------------------
      001913                        875 arg_list:
      009547 95 F1            [ 1]  876 	push #0
      009549 96 02 96         [ 4]  877 1$:	call condition 
      00954C 0E               [ 1]  878 	tnz a 
      00954D 96 41            [ 1]  879 	jreq 7$  
      00954F 96 51            [ 1]  880 	inc (1,sp)
      009551 96 65 96         [ 4]  881 	call next_token 
      009554 78 96            [ 1]  882 	cp a,#TK_COMMA 
      009556 85 4D            [ 1]  883 	jreq 1$ 
      009558 65 6D            [ 1]  884 	cp a,#TK_RPAREN
      00955A 6F 72            [ 1]  885 	jreq 7$
      001928                        886 	_unget_token 
      00955C 79 20 66 75 6C   [ 1]    1      mov in,in.saved  
      009561 6C               [ 1]  887 7$:	pop a  
      009562 0A               [ 4]  888 	ret 
                                    889 
                                    890 ;--------------------------------
                                    891 ;   BASIC commnands 
                                    892 ;--------------------------------
                                    893 
                                    894 ;--------------------------------
                                    895 ;  arithmetic and relational 
                                    896 ;  routines
                                    897 ;  operators precedence
                                    898 ;  highest to lowest
                                    899 ;  operators on same row have 
                                    900 ;  same precedence and are executed
                                    901 ;  from left to right.
                                    902 ;	'*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    903 ;   '-','+'
                                    904 ;   '=','>','<','>=','<=','<>','><'
                                    905 ;   '<>' and '><' are equivalent for not equal.
                                    906 ;--------------------------------
                                    907 
                                    908 ;---------------------
                                    909 ; return array element
                                    910 ; address from @(expr)
                                    911 ; input:
                                    912 ;   A 		TK_ARRAY
                                    913 ; output:
                                    914 ;	X 		element address 
                                    915 ;----------------------
      00192F                        916 get_array_element:
      009563 00 73 79         [ 4]  917 	call func_args 
      009566 6E 74            [ 1]  918 	cp a,#1
      009568 61 78            [ 1]  919 	jreq 1$
      00956A 20 65 72         [ 2]  920 	jp syntax_error
      001939                        921 1$: _xpop 
      00956D 72 6F            [ 1]    1     ld a,(y)
      00956F 72               [ 1]    2     ldw x,y 
      009570 0A 00            [ 2]    3     ldw x,(1,x)
      009572 6D 61 74 68      [ 2]    4     addw y,#CELL_SIZE 
                                    922     ; ignore A, index < 65536 in any case 
                                    923 	; check for bounds 
      009576 20 6F 70         [ 2]  924 	cpw x,array_size 
      009579 65 72            [ 2]  925 	jrule 3$
                                    926 ; bounds {1..array_size}	
      00957B 61 74            [ 1]  927 2$: ld a,#ERR_BAD_VALUE 
      00957D 69 6F 6E         [ 2]  928 	jp tb_error 
      009580 20               [ 2]  929 3$: tnzw  x
      009581 6F 76            [ 1]  930 	jreq 2$ 
      009583 65               [ 2]  931 	pushw x 
      009584 72               [ 2]  932 	sllw x 
      009585 66 6C 6F         [ 2]  933 	addw x,(1,sp) ; index*size_of(int24)
      009588 77 0A            [ 2]  934 	ldw (1,sp),x  
      00958A 00 64 69         [ 2]  935 	ldw x,#tib ; array is below tib 
      00958D 76 69 73         [ 2]  936 	subw x,(1,sp)
      00195C                        937 	_drop 2   
      009590 69 6F            [ 2]    1     addw sp,#2 
      009592 6E               [ 4]  938 	ret 
                                    939 
                                    940 
                                    941 ;***********************************
                                    942 ;   expression parse,execute 
                                    943 ;***********************************
                                    944 ;-----------------------------------
                                    945 ; factor ::= ['+'|'-'|e]  var | @ |
                                    946 ;			 integer | function |
                                    947 ;			 '('relation')' 
                                    948 ; output:
                                    949 ;   A       token attribute 
                                    950 ;   xstack  value  
                                    951 ; ---------------------------------
                           000001   952 	NEG=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                           000001   953 	VSIZE=1
      00195F                        954 factor:
      00195F                        955 	_vars VSIZE 
      009593 20 62            [ 2]    1     sub sp,#VSIZE 
      009595 79 20            [ 1]  956 	clr (NEG,sp)
      009597 30 0A 00         [ 4]  957 	call next_token
      00959A 69               [ 1]  958 	tnz a 
      00959B 6E 76            [ 1]  959 	jrne 1$ 
      00959D 61 6C 69         [ 2]  960 	jp 22$ 
      0095A0 64 20            [ 1]  961 1$:	cp a,#TK_PLUS 
      0095A2 6C 69            [ 1]  962 	jreq 2$
      0095A4 6E 65            [ 1]  963 	cp a,#TK_MINUS 
      0095A6 20 6E            [ 1]  964 	jrne 4$ 
      0095A8 75 6D            [ 1]  965 	cpl (NEG,sp)
      001976                        966 2$:	
      0095AA 62 65 72         [ 4]  967 	call next_token
      001979                        968 4$:
      0095AD 2E               [ 1]  969 	tnz a 
      0095AE 0A 00            [ 1]  970 	jrne 41$ 
      0095B0 72 75 6E         [ 2]  971 	jp syntax_error  
      00197F                        972 41$:	
      0095B3 20 74            [ 1]  973 	cp a,#TK_IFUNC 
      0095B5 69 6D            [ 1]  974 	jrne 5$ 
      001983                        975 	_get_code_addr 
      0095B7 65               [ 2]    1         ldw x,(x)
      0095B8 20 6F 6E 6C      [ 1]    2         inc in 
      0095BC 79 20 75 73      [ 1]    3         inc in 
      0095C0 61               [ 4]  976 	call (x); result in A:X  
      0095C1 67 65            [ 2]  977 	jra 18$ 
      00198F                        978 5$:
      0095C3 2E 0A            [ 1]  979 	cp a,#TK_INTGR
      0095C5 00 63            [ 1]  980 	jrne 6$
      0095C7 6F 6D 6D         [ 4]  981 	call get_int24 ; A:X
      0095CA 61 6E            [ 2]  982 	jra 18$
      001998                        983 6$:
      0095CC 64 20            [ 1]  984 	cp a,#TK_ARRAY
      0095CE 6C 69            [ 1]  985 	jrne 7$
      0095D0 6E 65 20         [ 4]  986 	call get_array_element
      0095D3 6F 6E            [ 2]  987     jra 71$
      0019A1                        988 7$:
      0095D5 6C 79            [ 1]  989 	cp a,#TK_VAR 
      0095D7 20 75            [ 1]  990 	jrne 8$
      0095D9 73 61 67         [ 4]  991 	call get_addr 
      0019A8                        992 71$: ; put value in A:X
      0095DC 65               [ 1]  993 	ld a,(x)
      0095DD 2E 0A            [ 2]  994 	ldw x,(1,x)
      0095DF 00 64            [ 2]  995 	jra 18$
      0019AD                        996 8$:
      0095E1 75 70            [ 1]  997 	cp a,#TK_LABEL 
      0095E3 6C 69            [ 1]  998 	jrne 9$ 
      0095E5 63               [ 2]  999 	pushw x 
      0095E6 61 74 65         [ 4] 1000 	call skip_string
      0095E9 20               [ 2] 1001 	popw x 
      0095EA 6E 61 6D         [ 4] 1002 	call search_const 
      0095ED 65               [ 2] 1003 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      0095EE 2E 0A            [ 1] 1004 	jreq 16$
      0095F0 00 46 69         [ 4] 1005 	call get_const_value ; in A:X 
      0095F3 6C 65            [ 2] 1006 	jra 18$
      0019C1                       1007 9$: 
      0095F5 20 6E            [ 1] 1008 	cp a,#TK_CFUNC 
      0095F7 6F 74            [ 1] 1009 	jrne 12$
      0019C5                       1010 	_get_code_addr 
      0095F9 20               [ 2]    1         ldw x,(x)
      0095FA 66 6F 75 6E      [ 1]    2         inc in 
      0095FE 64 2E 0A 00      [ 1]    3         inc in 
      009602 62               [ 4] 1011 	call(x)
      009603 61               [ 1] 1012 	clrw x 
      009604 64               [ 1] 1013 	rlwa x  ; char>int24 in A:X 
      009605 20 76            [ 2] 1014 	jra 18$ 	 
      0019D3                       1015 12$:			
      009607 61 6C            [ 1] 1016 	cp a,#TK_LPAREN
      009609 75 65            [ 1] 1017 	jrne 16$
      00960B 2E 0A 00         [ 4] 1018 	call expression
      00960E 46 69            [ 1] 1019 	ld a,#TK_RPAREN 
      009610 6C 65 20         [ 4] 1020 	call expect
      0019DF                       1021 	_xpop 
      009613 69 6E            [ 1]    1     ld a,(y)
      009615 20               [ 1]    2     ldw x,y 
      009616 65 78            [ 2]    3     ldw x,(1,x)
      009618 74 65 6E 64      [ 2]    4     addw y,#CELL_SIZE 
      00961C 65 64            [ 2] 1022 	jra 18$	
      0019EA                       1023 16$:
      0019EA                       1024 	_unget_token 
      00961E 20 6D 65 6D 6F   [ 1]    1      mov in,in.saved  
      009623 72               [ 1] 1025 	clr a 
      009624 79 2C            [ 2] 1026 	jra 22$ 
      0019F2                       1027 18$: 
      009626 20 63            [ 1] 1028 	tnz (NEG,sp)
      009628 61 6E            [ 1] 1029 	jreq 20$
      00962A 27 74 20         [ 4] 1030 	call neg_ax   
      0019F9                       1031 20$:
      0019F9                       1032 	_xpush 
      00962D 62 65 20 72      [ 2]    1     subw y,#CELL_SIZE
      009631 75 6E            [ 1]    2     ld (y),a 
      009633 20 66 72         [ 2]    3     ldw (1,y),x 
      009636 6F 6D            [ 1] 1033 	ld a,#TK_INTGR
      001A04                       1034 22$:
      001A04                       1035 	_drop VSIZE
      009638 20 74            [ 2]    1     addw sp,#VSIZE 
      00963A 68               [ 4] 1036 	ret
                                   1037 
                                   1038 
                                   1039 ;-----------------------------------
                                   1040 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1041 ; output:
                                   1042 ;   A    	token attribute 
                                   1043 ;	xstack		value 
                                   1044 ;-----------------------------------
                           000001  1045 	MULOP=1
                           000001  1046 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      001A07                       1047 term:
      001A07                       1048 	_vars VSIZE
      00963B 65 72            [ 2]    1     sub sp,#VSIZE 
                                   1049 ; first factor 	
      00963D 65 2E 0A         [ 4] 1050 	call factor
      009640 00               [ 1] 1051 	tnz a 
      009641 4E 6F            [ 1] 1052 	jreq term_exit  
      001A0F                       1053 term01:	 ; check for  operator '*'|'/'|'%' 
      009643 20 64 61         [ 4] 1054 	call next_token
      009646 74 61            [ 1] 1055 	ld (MULOP,sp),a
      009648 20 66            [ 1] 1056 	and a,#TK_GRP_MASK
      00964A 6F 75            [ 1] 1057 	cp a,#TK_GRP_MULT
      00964C 6E 64            [ 1] 1058 	jreq 1$
      00964E 2E 0A            [ 1] 1059 	ld a,#TK_INTGR
      001A1C                       1060 	_unget_token 
      009650 00 4E 6F 20 70   [ 1]    1      mov in,in.saved  
      009655 72 6F            [ 2] 1061 	jra term_exit 
      001A23                       1062 1$:	; got *|/|%
                                   1063 ;second factor
      009657 67 72 61         [ 4] 1064 	call factor
      00965A 6D               [ 1] 1065 	tnz a 
      00965B 20 69            [ 1] 1066 	jrne 2$ 
      00965D 6E 20 52         [ 2] 1067 	jp syntax_error 
      001A2C                       1068 2$: ; select operation 	
      009660 41 4D            [ 1] 1069 	ld a,(MULOP,sp) 
      009662 21 0A            [ 1] 1070 	cp a,#TK_MULT 
      009664 00 46            [ 1] 1071 	jrne 3$
                                   1072 ; '*' operator
      009666 69 6C 65         [ 4] 1073 	call mul24 
      009669 20 73            [ 2] 1074 	jra term01
      00966B 79 73            [ 1] 1075 3$: cp a,#TK_DIV 
      00966D 74 65            [ 1] 1076 	jrne 4$ 
                                   1077 ; '/' operator	
      00966F 6D 20 66         [ 4] 1078 	call div24 
      009672 75 6C            [ 2] 1079 	jra term01 
      001A40                       1080 4$: ; '%' operator
      009674 6C 2E 0A         [ 4] 1081 	call mod24
      009677 00 42            [ 2] 1082 	jra term01 
      001A45                       1083 9$: 
      009679 75 66            [ 1] 1084 	ld a,#TK_INTGR
      001A47                       1085 term_exit:
      001A47                       1086 	_drop VSIZE 
      00967B 66 65            [ 2]    1     addw sp,#VSIZE 
      00967D 72               [ 4] 1087 	ret 
                                   1088 
                                   1089 ;-------------------------------
                                   1090 ;  expr ::= term [['+'|'-'] term]*
                                   1091 ;  result range {-32768..32767}
                                   1092 ;  output:
                                   1093 ;   A    token attribute 
                                   1094 ;   xstack	 result    
                                   1095 ;-------------------------------
                           000001  1096 	OP=1 
                           000001  1097 	VSIZE=1 
      001A4A                       1098 expression:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001A4A                       1099 	_vars VSIZE 
      00967E 20 66            [ 2]    1     sub sp,#VSIZE 
                                   1100 ; first term 	
      009680 75 6C 6C         [ 4] 1101 	call term
      009683 0A               [ 1] 1102 	tnz a 
      009684 00 6F            [ 1] 1103 	jreq 9$
      001A52                       1104 1$:	; operator '+'|'-'
      009686 76 65 72         [ 4] 1105 	call next_token
      009689 66 6C            [ 1] 1106 	ld (OP,sp),a 
      00968B 6F 77            [ 1] 1107 	and a,#TK_GRP_MASK
      00968D 0A 00            [ 1] 1108 	cp a,#TK_GRP_ADD 
      00968F 0A 72            [ 1] 1109 	jreq 2$ 
      001A5D                       1110 	_unget_token 
      009691 75 6E 20 74 69   [ 1]    1      mov in,in.saved  
      009696 6D 65            [ 1] 1111 	ld a,#TK_INTGR
      009698 20 65            [ 2] 1112 	jra 9$ 
      001A66                       1113 2$: ; second term 
      00969A 72 72 6F         [ 4] 1114 	call term
      00969D 72               [ 1] 1115 	tnz a 
      00969E 2C 20            [ 1] 1116 	jrne 3$
      0096A0 00 0A 63         [ 2] 1117 	jp syntax_error
      001A6F                       1118 3$:
      0096A3 6F 6D            [ 1] 1119 	ld a,(OP,sp)
      0096A5 70 69            [ 1] 1120 	cp a,#TK_PLUS 
      0096A7 6C 65            [ 1] 1121 	jrne 4$
                                   1122 ; '+' operator	
      0096A9 20 65 72         [ 4] 1123 	call add24
      0096AC 72 6F            [ 2] 1124 	jra 1$ 
      001A7A                       1125 4$:	; '-' operator 
      0096AE 72 2C 20         [ 4] 1126 	call sub24
      0096B1 00 6C            [ 2] 1127 	jra 1$
      001A7F                       1128 9$:
      001A7F                       1129 	_drop VSIZE 
      0096B3 61 73            [ 2]    1     addw sp,#VSIZE 
      0096B5 74               [ 4] 1130 	ret 
                                   1131 
                                   1132 ;---------------------------------------------
                                   1133 ; rel ::= expr rel_op expr
                                   1134 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1135 ;  relation return  integer , zero is false 
                                   1136 ;  output:
                                   1137 ;	 xstack		value  
                                   1138 ;---------------------------------------------
                           000001  1139 	RELOP=1
                           000001  1140 	VSIZE=1 
      001A82                       1141 relation: 
      001A82                       1142 	_vars VSIZE
      0096B6 20 74            [ 2]    1     sub sp,#VSIZE 
      0096B8 6F 6B 65         [ 4] 1143 	call expression
      0096BB 6E               [ 1] 1144 	tnz a 
      0096BC 20 69            [ 1] 1145 	jreq 9$ 
                                   1146 ; expect rel_op or leave 
      0096BE 64 3A 20         [ 4] 1147 	call next_token 
      0096C1 00 01            [ 1] 1148 	ld (RELOP,sp),a 
      0096C2 A4 30            [ 1] 1149 	and a,#TK_GRP_MASK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      0096C2 A6 02            [ 1] 1150 	cp a,#TK_GRP_RELOP 
      0096C4 27 09            [ 1] 1151 	jreq 2$
      0096C4 72 0A            [ 1] 1152 	ld a,#TK_INTGR 
      001A97                       1153 	_unget_token 
      0096C6 00 23 4C 88 AE   [ 1]    1      mov in,in.saved  
      0096CB 96 8F            [ 2] 1154 	jra 9$ 
      001A9E                       1155 2$:	; expect another expression
      0096CD CD 89 E8         [ 4] 1156 	call expression
      0096D0 84               [ 1] 1157 	tnz a 
      0096D1 AE 95            [ 1] 1158 	jrne 3$
      0096D3 35 72 5F         [ 2] 1159 	jp syntax_error 
      001AA7                       1160 3$: 
      0096D6 00 0E 48         [ 4] 1161 	call cp24 
      001AAA                       1162 	_xpop  
      0096D9 72 59            [ 1]    1     ld a,(y)
      0096DB 00               [ 1]    2     ldw x,y 
      0096DC 0E C7            [ 2]    3     ldw x,(1,x)
      0096DE 00 0F 72 BB      [ 2]    4     addw y,#CELL_SIZE 
      0096E2 00               [ 1] 1163 	tnz a 
      0096E3 0E FE            [ 1] 1164 	jrmi 4$
      0096E5 CD 89            [ 1] 1165 	jrne 5$
      0096E7 E8 CE 00 05      [ 1] 1166 	mov acc8,#2 ; i1==i2
      0096EB C6 00            [ 2] 1167 	jra 6$ 
      001ABE                       1168 4$: ; i1<i2
      0096ED 04 90 5F 90      [ 1] 1169 	mov acc8,#4 
      0096F1 02 CD            [ 2] 1170 	jra 6$
      001AC4                       1171 5$: ; i1>i2
      0096F3 86 E7 CE 00      [ 1] 1172 	mov acc8,#1  
      001AC8                       1173 6$: ; 0=false, -1=true 
      0096F7 05               [ 1] 1174 	clrw x 
      0096F8 C6 00 02         [ 1] 1175 	ld a, acc8  
      0096FB CD A0            [ 1] 1176 	and a,(RELOP,sp)
      0096FD 0D AE            [ 1] 1177 	jreq 7$
      0096FF 96               [ 2] 1178 	cplw x 
      009700 B2 CD            [ 1] 1179 	ld a,#255 
      001AD3                       1180 7$:	_xpush 
      009702 89 E8 C6 00      [ 2]    1     subw y,#CELL_SIZE
      009706 03 5F            [ 1]    2     ld (y),a 
      009708 97 72 BB         [ 2]    3     ldw (1,y),x 
      00970B 00 05            [ 1] 1181 	ld a,#TK_INTGR
      001ADE                       1182 9$: 
      001ADE                       1183 	_drop VSIZE
      00970D F6 5F            [ 2]    1     addw sp,#VSIZE 
      00970F 97               [ 4] 1184 	ret 
                                   1185 
                                   1186 ;-------------------------------------------
                                   1187 ;  AND factor:  [NOT] relation | (condition)
                                   1188 ;  output:
                                   1189 ;     A      TK_INTGR|0
                                   1190 ;-------------------------------------------
                           000001  1191 	NOT_OP=1
      001AE1                       1192 and_factor:
      009710 CD 98            [ 1] 1193 	push #0 
      009712 13 20 35         [ 4] 1194 0$:	call next_token  
      009715 4D               [ 1] 1195 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009715 88 AE            [ 1] 1196 	jreq 8$ 
      009717 96 A1            [ 1] 1197 	cp a,#TK_NOT 
      009719 CD 89            [ 1] 1198 	jrne 1$ 
      00971B E8 84            [ 1] 1199 	cpl (NOT_OP,sp)
      00971D AE 95            [ 2] 1200 	jra 0$ 
      001AF1                       1201 1$:	
      00971F 35 72            [ 1] 1202 	cp a,#TK_LPAREN 
      009721 5F 00            [ 1] 1203 	jrne 2$
      009723 0E 48 72         [ 4] 1204 	call condition
      009726 59 00            [ 1] 1205 	ld a,#TK_RPAREN 
      009728 0E C7 00         [ 4] 1206 	call expect
      00972B 0F 72            [ 2] 1207 	jra 3$
      001AFF                       1208 2$: _unget_token 
      00972D BB 00 0E FE CD   [ 1]    1      mov in,in.saved  
      009732 89 E8 AE         [ 4] 1209 	call relation
      001B07                       1210 3$:
      009735 16 90            [ 1] 1211 	tnz (NOT_OP,sp)
      009737 CD 89            [ 1] 1212 	jreq 8$ 
      009739 E8 A6 0D         [ 4] 1213 	call cpl24
      001B0E                       1214 8$:
      001B0E                       1215 	_drop 1  
      00973C CD 89            [ 2]    1     addw sp,#1 
      00973E 8B               [ 4] 1216     ret 
                                   1217 
                                   1218 
                                   1219 ;--------------------------------------------
                                   1220 ;  AND operator as priority over OR||XOR 
                                   1221 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1222 ;          
                                   1223 ;  output:
                                   1224 ;     A     TK_INTGR|0
                                   1225 ;    xtack   value 
                                   1226 ;--------------------------------------------
      001B11                       1227 and_cond:
      00973F CE 00 01         [ 4] 1228 	call and_factor
      009742 CD               [ 1] 1229 	tnz a 
      009743 8A 55            [ 1] 1230 	jreq 9$  
      009745 A6 5E CD         [ 4] 1231 1$: call next_token 
      009748 89               [ 1] 1232 	tnz a 
      009749 8B AE            [ 1] 1233 	jreq 6$ 
      00974B 17 FF            [ 1] 1234 	cp a,#TK_AND 
      00974D 94 07            [ 1] 1235 	jreq 3$
      00974E                       1236 	_unget_token 
      00974E CD 94 FC 00 01   [ 1]    1      mov in,in.saved  
      009751 20 38            [ 2] 1237 	jra 6$ 
      009751 A6 0D CD         [ 4] 1238 3$:	call and_factor  
      009754 89               [ 1] 1239 	tnz a 
      009755 8B A6            [ 1] 1240 	jrne 4$
      009757 3E CD 89         [ 2] 1241 	jp syntax_error 
      001B31                       1242 4$:	
      001B31                       1243 	_xpop 
      00975A 8B CD            [ 1]    1     ld a,(y)
      00975C 8A               [ 1]    2     ldw x,y 
      00975D ED 72            [ 2]    3     ldw x,(1,x)
      00975F 5D 00 04 27      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      009763 ED CD 91         [ 1] 1244 	ld acc24,a 
      009766 16 72 5D         [ 2] 1245 	ldw acc16,x
      001B40                       1246 	_xpop 
      009769 00 04            [ 1]    1     ld a,(y)
      00976B 27               [ 1]    2     ldw x,y 
      00976C E4 01            [ 2]    3     ldw x,(1,x)
      00976D 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00976D C6 00 02         [ 1] 1247 	and a,acc24 
      009770 C1               [ 1] 1248 	rlwa x 
      009771 00 04 2B         [ 1] 1249 	and a,acc16 
      009774 1D               [ 1] 1250 	rlwa x 
      009775 C4 00 0E         [ 1] 1251 	and a,acc8 
      009775 72               [ 1] 1252 	rlwa x
      001B55                       1253 	_xpush
      009776 01 00 23 D7      [ 2]    1     subw y,#CELL_SIZE
      00977A CE 00            [ 1]    2     ld (y),a 
      00977C 05 72 BB         [ 2]    3     ldw (1,y),x 
      00977F 00 01            [ 2] 1254 	jra 1$  
      009781 C3 00            [ 1] 1255 6$: ld a,#TK_INTGR 
      009783 1E               [ 4] 1256 9$:	ret 	 
                                   1257 
                                   1258 
                                   1259 ;--------------------------------------------
                                   1260 ; condition for IF and UNTIL 
                                   1261 ; operators: OR,XOR 
                                   1262 ; format:  and_cond [ OP and_cond ]* 
                                   1263 ; output:
                                   1264 ;    A        INTGR|0 
                                   1265 ;    xstack   value 
                                   1266 ;--------------------------------------------
                           000001  1267 	ATMP=1
                           000002  1268 	OP=2
                           000002  1269 	VSIZE=2 
      001B63                       1270 condition:
      001B63                       1271 	_vars VSIZE 
      009784 2A C8            [ 2]    1     sub sp,#VSIZE 
      009786 CF 00 05         [ 4] 1272 	call and_cond
      009789 E6               [ 1] 1273 	tnz a 
      00978A 02 C7            [ 1] 1274 	jreq 9$ 
      00978C 00 04 35         [ 4] 1275 1$:	call next_token 
      00978F 03 00            [ 1] 1276 	cp a,#TK_OR 
      009791 02 0B            [ 1] 1277 	jreq 2$
      009792 A1 8A            [ 1] 1278 	cp a,#TK_XOR
      009792 CD 97            [ 1] 1279 	jreq 2$ 
      001B76                       1280 	_unget_token 
      009794 CB A1 00 27 DC   [ 1]    1      mov in,in.saved  
      009799 A1 80            [ 2] 1281 	jra 8$ 
      00979B 26 0C            [ 1] 1282 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      00979D FE 72 5C         [ 4] 1283 	call and_cond
      0097A0 00 02            [ 1] 1284 	cp a,#TK_INTGR 
      0097A2 72 5C            [ 1] 1285 	jreq 3$
      0097A4 00 02 FD         [ 2] 1286 	jp syntax_error 
      001B89                       1287 3$:	 
      001B89                       1288 	_xpop  ; rigth arg 
      0097A7 20 E9            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      0097A9 93               [ 1]    2     ldw x,y 
      0097A9 A1 85            [ 2]    3     ldw x,(1,x)
      0097AB 26 05 CD 9C      [ 2]    4     addw y,#CELL_SIZE 
      0097AF C8 20 E0         [ 1] 1289 	ld acc24,a 
      0097B2 CF 00 0D         [ 2] 1290 	ldw acc16,x 
      001B98                       1291 	_xpop  ; left arg  
      0097B2 A1 05            [ 1]    1     ld a,(y)
      0097B4 26               [ 1]    2     ldw x,y 
      0097B5 05 CD            [ 2]    3     ldw x,(1,x)
      0097B7 9C C3 20 D7      [ 2]    4     addw y,#CELL_SIZE 
      0097BB 6B 01            [ 1] 1292 	ld (ATMP,sp),a 
      0097BB A1 0A            [ 1] 1293 	ld a,(OP,sp)
      0097BD 27 D3            [ 1] 1294 	cp a,#TK_XOR 
      0097BF A1 03            [ 1] 1295 	jreq 5$ 
      001BA9                       1296 4$: ; A:X OR acc24   
      0097C1 26 05            [ 1] 1297 	ld a,(ATMP,sp)
      0097C3 CD 97 E4         [ 1] 1298 	or a,acc24 
      0097C6 20               [ 1] 1299 	rlwa x 
      0097C7 CA CC 96         [ 1] 1300 	or a,acc16 
      0097CA C2               [ 1] 1301 	rlwa x 
      0097CB CA 00 0E         [ 1] 1302 	or a,acc8 
      0097CB C6               [ 1] 1303 	rlwa x 
      0097CC 00 02            [ 2] 1304 	jra 6$  
      001BB9                       1305 5$: ; A:X XOR acc24 
      0097CE C7 00            [ 1] 1306 	ld a,(ATMP,sp)
      0097D0 03 C0 00         [ 1] 1307 	xor a,acc24 
      0097D3 04               [ 1] 1308 	rlwa x 
      0097D4 27 0D 0D         [ 1] 1309 	xor a,acc16 
      0097D6 02               [ 1] 1310 	rlwa x 
      0097D6 CE 00 05         [ 1] 1311 	xor a,acc8 
      0097D9 72               [ 1] 1312 	rlwa x 
      001BC7                       1313 6$: _xpush
      0097DA BB 00 01 F6      [ 2]    1     subw y,#CELL_SIZE
      0097DE 5C 72            [ 1]    2     ld (y),a 
      0097E0 5C 00 02         [ 2]    3     ldw (1,y),x 
      0097E3 81 99            [ 2] 1314 	jra 1$ 
      0097E4 A6 84            [ 1] 1315 8$:	ld a,#TK_INTGR 
      001BD4                       1316 9$:	_drop VSIZE 
      0097E4 F6 27            [ 2]    1     addw sp,#VSIZE 
      0097E6 03               [ 4] 1317 	ret 
                                   1318 
                                   1319 
                                   1320 ;--------------------------------------------
                                   1321 ; BASIC: HEX 
                                   1322 ; select hexadecimal base for integer print
                                   1323 ;---------------------------------------------
      001BD7                       1324 hex_base:
      0097E7 5C 20 FA 5C      [ 1] 1325 	mov base,#16 
      0097EB 72               [ 4] 1326 	ret 
                                   1327 
                                   1328 ;--------------------------------------------
                                   1329 ; BASIC: DEC 
                                   1330 ; select decimal base for integer print
                                   1331 ;---------------------------------------------
      001BDC                       1332 dec_base:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      0097EC B0 00 05 CF      [ 1] 1333 	mov base,#10
      0097F0 00               [ 4] 1334 	ret 
                                   1335 
                                   1336 ;------------------------
                                   1337 ; BASIC: FREE 
                                   1338 ; return free size in RAM 
                                   1339 ; output:
                                   1340 ;   A:x		size 
                                   1341 ;--------------------------
      001BE1                       1342 free:
      0097F1 01 81            [ 2] 1343 	pushw y 
      0097F3 4F               [ 1] 1344 	clr a 
      0097F3 FE 72 5C         [ 2] 1345 	ldw x,#tib 
      0097F6 00 02 72 5C      [ 2] 1346 	ldw y,txtend 
      0097FA 00 02 81 00      [ 2] 1347 	cpw y,#app_space
      0097FD 25 05            [ 1] 1348 	jrult 1$
      0097FD F6 EE 01         [ 2] 1349 	subw x,#free_ram 
      009800 72 5C            [ 2] 1350 	jra 2$ 
      001BF6                       1351 1$:	
      009802 00 02 72 5C      [ 2] 1352 	subw x,txtend
      009806 00 02            [ 2] 1353 2$:	popw y 
      009808 72               [ 4] 1354 	ret 
                                   1355 
                                   1356 ;------------------------------
                                   1357 ; BASIC: SIZE 
                                   1358 ; command that print 
                                   1359 ; program start addres and size 
                                   1360 ;------------------------------
      001BFD                       1361 cmd_size:
      009809 5C 00 02         [ 1] 1362 	push base 
      00980C 81 1E 5A         [ 2] 1363 	ldw x,#PROG_ADDR 
      00980D CD 09 68         [ 4] 1364 	call puts 
      00980D F6 72 5C         [ 2] 1365 	ldw x,txtbgn     
      009810 00 02 81 0A      [ 1] 1366 	mov base,#16 
      009813 CD 17 93         [ 4] 1367 	call prt_i16
      009813 72 5F 00         [ 1] 1368 	pop base 
      009816 0D CF 00         [ 2] 1369 	ldw x,#PROG_SIZE 
      009819 0E A6 10         [ 4] 1370 	call puts 
      00981C C1 00 0B         [ 2] 1371 	ldw x,txtend 
      00981F 27 09 72 0F      [ 2] 1372 	subw x,txtbgn 
      009823 00 0E 04         [ 4] 1373 	call prt_i16
      009826 72 53 00         [ 2] 1374 	ldw x,#STR_BYTES 
      009829 0D 09 68         [ 4] 1375 	call puts  
      00982A 81               [ 4] 1376 	ret 
                                   1377 
                                   1378 
                                   1379 ;------------------------
                                   1380 ; BASIC: UBOUND  
                                   1381 ; return array variable size 
                                   1382 ; and set 'array_size' variable 
                                   1383 ; output:
                                   1384 ;   A:X 	array_size
                                   1385 ;--------------------------
      001C2A                       1386 ubound:
      00982A A6 FF CD         [ 4] 1387 	call free 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00982D 98 50            [ 1] 1388 	ld a,#CELL_SIZE 
      00982F CD               [ 2] 1389 	div x,a 
      009830 91 C0 88         [ 2] 1390 	ldw array_size,x
      009833 CD               [ 1] 1391 	clr a 
      009834 89               [ 4] 1392 	ret 
                                   1393 
                                   1394 ;-----------------------------
                                   1395 ; BASIC: LET var=expr 
                                   1396 ; variable assignement 
                                   1397 ; output:
                                   1398 ;   A 		TK_NONE 
                                   1399 ;-----------------------------
      001C35                       1400 let::
      009835 E8 84 81         [ 4] 1401 	call next_token 
      009838 A1 85            [ 1] 1402 	cp a,#TK_VAR 
      009838 90 F6            [ 1] 1403 	jreq let_var
      00983A 93 EE            [ 1] 1404 	cp a,#TK_ARRAY 
      00983C 01 72            [ 1] 1405 	jreq  let_array
      00983E A9 00 03         [ 2] 1406 	jp syntax_error
      001C43                       1407 let_array:
      009841 C7 00 0D         [ 4] 1408 	call get_array_element
      009844 CF 00            [ 2] 1409 	jra let_eval 
      001C48                       1410 let_var:
      009846 0E CD 98         [ 4] 1411 	call get_addr
      001C4B                       1412 let_eval:
      009849 2A A6 20         [ 2] 1413 	ldw ptr16,x  ; variable address 
      00984C CD 89 8B         [ 4] 1414 	call next_token 
      00984F 81 32            [ 1] 1415 	cp a,#TK_EQUAL
      009850 27 03            [ 1] 1416 	jreq 1$
      009850 52 04 0F         [ 2] 1417 	jp syntax_error
      001C58                       1418 1$:	
      009853 02 0F 01         [ 4] 1419 	call condition   
      009856 4D 27            [ 1] 1420 	cp a,#TK_INTGR 
      009858 11 C6            [ 1] 1421 	jreq 2$
      00985A 00 0B A1         [ 2] 1422 	jp syntax_error
      001C62                       1423 2$:	
      001C62                       1424 	_xpop ; value 
      00985D 0A 26            [ 1]    1     ld a,(y)
      00985F 0A               [ 1]    2     ldw x,y 
      009860 72 0F            [ 2]    3     ldw x,(1,x)
      009862 00 0D 05 03      [ 2]    4     addw y,#CELL_SIZE 
      001C6B                       1425 3$:
      009866 01 CD 82 98      [ 4] 1426 	ld [ptr16],a
      00986A 72 5C 00 1A      [ 1] 1427 	inc ptr8  
      00986A AE 16 90 1C      [ 5] 1428 	ldw [ptr16],x 
      00986E 00               [ 4] 1429 	ret 
                                   1430 
                                   1431 
                                   1432 ;--------------------------
                                   1433 ; return constant value 
                                   1434 ; from it's record address
                                   1435 ; input:
                                   1436 ;	X	*const record 
                                   1437 ; output:
                                   1438 ;   A:X   const  value
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1439 ;--------------------------
      001C78                       1440 get_const_value: ; -- i 
      00986F 50               [ 1] 1441 	ld a,(x) ; record size 
      009870 5A 7F            [ 1] 1442 	sub a,#3 ; * value 
      009872 88               [ 1] 1443 	push a 
      009872 C6 00            [ 1] 1444 	push #0 
      009874 0B CD 83         [ 2] 1445 	addw x,(1,sp)
      009877 64               [ 1] 1446 	ld a,(x)
      009878 AB 30            [ 2] 1447 	ldw x,(1,x)
      001C84                       1448 	_drop 2
      00987A A1 3A            [ 2]    1     addw sp,#2 
      00987C 2B               [ 4] 1449 	ret 
                                   1450 
                                   1451 
                                   1452 ;--------------------------
                                   1453 ; list constants in EEPROM 
                                   1454 ; call when using LIST \C 
                                   1455 ;-------------------------
                           000001  1456 	COUNT=1
                           000003  1457 	YTEMP=3
                           000004  1458 	VSIZE=4 
      001C87                       1459 list_const:
      00987D 02 AB            [ 2] 1460 	pushw y 
      001C89                       1461 	_vars 4 
      00987F 07 04            [ 2]    1     sub sp,#4 
      009880 5F               [ 1] 1462 	clrw x 
      009880 5A F7            [ 2] 1463 	ldw (COUNT,sp),x  
      009882 0C 02 C6 00      [ 2] 1464 	ldw Y,#EEPROM_BASE 
      009886 0D CA 00 0E      [ 2] 1465 1$:	cpw y,free_eeprom 
      00988A CA 00            [ 1] 1466 	jruge 9$
      00988C 0F 26            [ 2] 1467     ldw (YTEMP,sp),y 
      00988E E3               [ 1] 1468 	ldw x,y
      00988F C6               [ 1] 1469 	incw x 
      009890 00 0B A1         [ 4] 1470 	call puts  
      009893 10 27            [ 1] 1471 	ld a,#'= 
      009895 08 7B 01         [ 4] 1472 	call putc 
      009898 27 0A            [ 2] 1473 	ldw x,(YTEMP,sp)
      00989A A6 2D 20         [ 4] 1474 	call get_const_value 
      00989D 02 00 0C         [ 1] 1475 	ld acc24,a 
      00989E CF 00 0D         [ 2] 1476 	ldw acc16,x 
      00989E A6 24 5A         [ 4] 1477 	call prt_acc24
      0098A1 F7 0C            [ 1] 1478 	ld a,#CR 
      0098A3 02 09 0B         [ 4] 1479 	call putc 
      0098A4 1E 01            [ 2] 1480 	ldw x,(COUNT,sp)
      0098A4 7B               [ 1] 1481 	incw x 
      0098A5 02 5B            [ 2] 1482 	ldw (COUNT,sp),x 
      0098A7 04 81 00 0D      [ 1] 1483 	clr acc16 
      0098A9 16 03            [ 2] 1484 	ldw y,(YTEMP,sp)
      0098A9 A1 61            [ 1] 1485 	ld a,(y)
      0098AB 2A 01 81         [ 1] 1486 	ld acc8,a
      0098AE A1 7A 22 FB      [ 2] 1487 	addw y,acc16 
      0098B2 A0 20            [ 2] 1488 	jra 1$ 
      001CCD                       1489 9$:	
      0098B4 81 01            [ 2] 1490 	ldw x,(COUNT,sp)
      0098B5 CD 17 93         [ 4] 1491 	call prt_i16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0098B5 52 05 1F         [ 2] 1492 	ldw x,#CONST_COUNT 
      0098B8 04 4F 5F         [ 4] 1493 	call puts 
      001CD8                       1494 	_drop VSIZE 
      0098BB 72 A2            [ 2]    1     addw sp,#VSIZE 
      0098BD 00 03            [ 2] 1495 	popw y 
      0098BF 90               [ 4] 1496 	ret 
                                   1497 
      0098C0 F7 90 EF 01 0F 01 A6  1498 CONST_COUNT: .asciz " constants in EEPROM\n"
             0A 6B 02 1E 04 F6 27
             4E A1 2D 26 04 03 01
             20
                                   1499 
                                   1500 
                                   1501 ;--------------------------
                                   1502 ; BASIC: EEFREE 
                                   1503 ; eeprom_free 
                                   1504 ; search end of data  
                                   1505 ; in EEPROM 
                                   1506 ; input:
                                   1507 ;    none 
                                   1508 ; output:
                                   1509 ;    A:X     address free
                                   1510 ;-------------------------
      001CF3                       1511 func_eefree:
      0098D6 08 A1 24         [ 2] 1512 	ldw x,#EEPROM_BASE 
      0098D9 26 08 A6 10      [ 1] 1513 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0098DD 6B 02 5C         [ 2] 1514     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0098E0 1F 04            [ 1] 1515 	jruge 8$ ; no free space 
      0098E2 F6               [ 1] 1516 2$: ld a,(x)
      0098E3 26 0C            [ 1] 1517 	jrne 3$
      0098E3 A1               [ 1] 1518 	incw x 
      0098E4 61 2B 02 A0      [ 1] 1519 	dec acc8 
      0098E8 20 A1            [ 1] 1520 	jrne 2$
      0098EA 30 2B 30         [ 2] 1521 	subw x,#8 
      0098ED A0 30            [ 2] 1522 	jra 9$  
      0098EF A1               [ 1] 1523 3$: ld a,(x)
      0098F0 0A               [ 1] 1524 	incw x
      0098F1 2B               [ 1] 1525 	tnz a  
      0098F2 06 A0            [ 1] 1526 	jrne 3$
      0098F4 07               [ 2] 1527 	decw x   
      0098F5 11 02            [ 2] 1528 	jra 1$ 
      0098F7 2A               [ 1] 1529 8$: clrw x ; no free space 
      0098F8 24               [ 1] 1530 9$: clr a 
      0098F9 6B 03 7B         [ 2] 1531 	ldw free_eeprom,x ; save in system variable 
      0098FC 02               [ 4] 1532 	ret 
                                   1533 
                           000005  1534 CONST_REC_XTRA_BYTES=5 
                                   1535 ;--------------------------
                                   1536 ; search constant name 
                                   1537 ; format of constant record  
                                   1538 ;   .byte record length 
                                   1539 ;         = strlen(name)+5 
                                   1540 ;   .asciz name (variable length)
                                   1541 ;   .int24 value (3 bytes )
                                   1542 ; a constant record use 7+ bytes
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   1543 ; constants are saved in EEPROM  
                                   1544 ; input:
                                   1545 ;    X     *name
                                   1546 ; output:
                                   1547 ;    X     address|0
                                   1548 ; use:
                                   1549 ;   A,Y, acc16 
                                   1550 ;-------------------------
                           000001  1551 	NAMEPTR=1 ; target name pointer 
                           000003  1552 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1553 	RECLEN=5  ; record length of target
                           000005  1554 	VSIZE=5
      001D1C                       1555 search_const:
      0098FD CD 82            [ 2] 1556 	pushw y 
      001D1E                       1557 	_vars VSIZE
      0098FF B5 72            [ 2]    1     sub sp,#VSIZE 
      009901 A2 00 03 90      [ 1] 1558 	clr acc16 
      009905 F7 90 EF         [ 4] 1559 	call strlen 
      009908 01 5F            [ 1] 1560 	add a,#CONST_REC_XTRA_BYTES
      00990A 7B 03            [ 1] 1561 	ld (RECLEN,sp),a    
      00990C 02 72            [ 2] 1562 	ldw (NAMEPTR,sp),x
      00990E A2 00 03 90      [ 2] 1563 	ldw y,#EEPROM_BASE 
      009912 F7 90            [ 2] 1564 1$:	ldw x,(NAMEPTR,sp)
      009914 EF 01            [ 2] 1565 	ldw (EEPTR,sp),y
      009916 CD 81 F9 1E      [ 2] 1566 	cpw y, free_eeprom 
      00991A 04 20            [ 1] 1567 	jruge 7$ ; no match found 
      00991C C2 0D            [ 1] 1568 	ld a,(y)
      00991E 01 27            [ 1] 1569 	cp a,(RECLEN,sp)
      009920 03 CD            [ 1] 1570 	jrne 2$ 
      009922 82 7E            [ 1] 1571 	incw y 
      009924 CD 13 91         [ 4] 1572 	call strcmp
      009924 90 F6            [ 1] 1573 	jrne 8$ ; match found 
      001D48                       1574 2$: ; skip this one 	
      009926 93 EE            [ 2] 1575 	ldW Y,(EEPTR,sp)
      009928 01 72            [ 1] 1576 	ld a,(y)
      00992A A9 00 03         [ 1] 1577 	ld acc8,a 
      00992D C7 00 0D CF      [ 2] 1578 	addw y,acc16 
      009931 00 0E            [ 2] 1579 	jra 1$  
      001D55                       1580 7$: ; no match found 
      009933 5B 05            [ 1] 1581 	clr (EEPTR,sp)
      009935 81 04            [ 1] 1582 	clr (EEPTR+1,sp)
      009936                       1583 8$: ; match found 
      009936 52 05            [ 2] 1584 	ldw x,(EEPTR,sp) ; record address 
      001D5B                       1585 9$:	_DROP VSIZE
      009938 17 04            [ 2]    1     addw sp,#VSIZE 
      00993A 90 85            [ 2] 1586 	 popw y 
      00993A 1F               [ 4] 1587 	 ret 
                                   1588 
                                   1589 
                                   1590 ;--------------------------------------------
                                   1591 ; BASIC: CONST name=value [, name=value]*
                                   1592 ; define constant(s) saved in EEPROM
                                   1593 ;--------------------------------------------
                           000001  1594 	CNAME=1 
                           000003  1595 	BUFPTR=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                           000005  1596 	RECLEN=5
                           000006  1597 	UPDATE=6
                           000007  1598 	YSAVE=7
                           000008  1599 	VSIZE=8 
      001D60                       1600 cmd_const:
      00993B 02 F6            [ 2] 1601 	pushw y 
      001D62                       1602 	_vars VSIZE 
      00993D A4 0F            [ 2]    1     sub sp,#VSIZE 
      00993F 6B 01            [ 1] 1603 	clr (UPDATE,sp)
      009941 16 04 5C         [ 4] 1604 	call next_token 
      009944 A1 04            [ 1] 1605 	cp a,#TK_CHAR 
      009944 90 F6            [ 1] 1606 	jrne 0$
      009946 27 1B 0D         [ 4] 1607 	call get_char 
      009949 01 27            [ 1] 1608 	and a,#0xDF 
      00994B 0A F1            [ 1] 1609 	cp a,#'U 
      00994D 26 07            [ 1] 1610 	jrne 1$
      00994F 90 5C            [ 1] 1611 	cpl (UPDATE,sp)
      009951 5C 0A            [ 2] 1612 	jra const_loop 
      009953 01 20            [ 1] 1613 0$: cp a,#TK_LABEL 
      009955 EE 08            [ 1] 1614 	jreq cloop_1
      009956 CC 16 42         [ 2] 1615 1$: jp syntax_error
      001D81                       1616 const_loop: 
      009956 1E 02            [ 1] 1617 	ld a,#TK_LABEL 
      009958 1D 00 02         [ 4] 1618 	call expect  
      001D86                       1619 cloop_1: 
      00995B 4B 00            [ 2] 1620 	ldw (CNAME,sp),x ; *const_name
      00995D FE 84 27         [ 4] 1621 	call skip_string
      009960 1D 20            [ 2] 1622 	ldw x,(CNAME,sp)
      009962 D7 13 86         [ 4] 1623 	call strlen  
      009963 AB 05            [ 1] 1624 	add a,#CONST_REC_XTRA_BYTES 
      009963 1E 02            [ 1] 1625 	ld (RECLEN,sp),a 
                                   1626 ; copy name in buffer  
      009965 F6 6B            [ 2] 1627 	ldw y,(CNAME,sp) 
      009967 01 A4 0F         [ 2] 1628 	ldw x,#tib  
      00996A 4C C7            [ 1] 1629 	ld a,(RECLEN,sp)
      00996C 00               [ 1] 1630 	ld (x),a 
      00996D 0F               [ 1] 1631 	incw x  
      00996E 72 5F 00         [ 4] 1632 	call strcpy 
      009971 0E 72            [ 2] 1633 	ldw (BUFPTR,sp),x 
                                   1634 ; x not updated by strcpy 
                                   1635 ; BUFPTR must be incremented 
                                   1636 ; to point after name 
      009973 BB               [ 1] 1637 	clrw x 
      009974 00 0E            [ 1] 1638 	ld a,(RECLEN,sp)
      009976 FE 7B            [ 1] 1639 	sub a,#CONST_REC_XTRA_BYTES-1
      009978 01               [ 1] 1640 	ld xl,a  
      009979 A4 F0 4E         [ 2] 1641 	addw x,(BUFPTR,sp)
      00997C AB 80            [ 2] 1642 	ldw (BUFPTR,sp),x 
      00997E A6 32            [ 1] 1643 	ld a,#TK_EQUAL 
      00997E 5B 05 81         [ 4] 1644 	call expect 
      009981 16 07            [ 2] 1645 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      009981 88 CD 97         [ 4] 1646 	call expression 
      009984 CB 11            [ 1] 1647 	cp a,#TK_INTGR 
      009986 01 27            [ 1] 1648 	jreq 5$ 
      009988 03 CC 96         [ 2] 1649 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      001DBE                       1650 5$:	_xpop 
      00998B C2 84            [ 1]    1     ld a,(y)
      00998D 81               [ 1]    2     ldw x,y 
      00998E EE 01            [ 2]    3     ldw x,(1,x)
      00998E A6 06 CD 99      [ 2]    4     addw y,#CELL_SIZE 
      009992 81 07            [ 2] 1651 	ldw (YSAVE,sp),y ; save xtack pointer 
      009993 16 03            [ 2] 1652 	ldw y,(BUFPTR,sp)
      009993 4B 00            [ 1] 1653 	ld (y),a 
      009995 CD 9B E3         [ 2] 1654 	ldw (1,y),x 
                                   1655 ; record completed in buffer 
                                   1656 ; check if constant already exist 
                                   1657 ; if exist and \U option then update  
      009998 4D 27 12 0C      [ 1] 1658 	clr farptr 
      00999C 01 CD            [ 2] 1659 	ldw x,(CNAME,sp)
      00999E 97 CB A1         [ 4] 1660 	call search_const 
      0099A1 08               [ 2] 1661 	tnzw x 
      0099A2 27 F1            [ 1] 1662 	jreq 6$ ; new constant  
      0099A4 A1 07            [ 1] 1663 	tnz (UPDATE,sp)
      0099A6 27 05            [ 1] 1664 	jreq 8$ 
      0099A8 55 00            [ 2] 1665 	jra 7$	
      001DE2                       1666 6$:	
      0099AA 03 00 02         [ 2] 1667 	ldw x,free_eeprom  
      001DE5                       1668 7$:	
      0099AD 84 81 19         [ 2] 1669 	ldw farptr+1,x 
      0099AF AE 16 90         [ 2] 1670 	ldw x,#tib 
      0099AF CD 99            [ 1] 1671 	ld a,(RECLEN,sp)
      0099B1 8E A1 01         [ 4] 1672 	call write_nbytes
      0099B4 27 03            [ 1] 1673 	tnz (UPDATE,sp)
      0099B6 CC 96            [ 1] 1674 	jrne 8$ ; not a new constant, don't update free_eeprom
                                   1675 ; update free_eeprom 
      0099B8 C2               [ 1] 1676 	clrw x 
      0099B9 90 F6            [ 1] 1677 	ld a,(RECLEN,sp)
      0099BB 93               [ 1] 1678 	ld xl,a 
      0099BC EE 01 72 A9      [ 2] 1679 	addw x,free_eeprom 
      0099C0 00 03 C3         [ 2] 1680 	ldw free_eeprom,x
      001DFF                       1681 8$: ; check for next constant 
      0099C3 00 21 23         [ 4] 1682 	call next_token 
      0099C6 05 A6            [ 1] 1683 	cp a,#TK_COMMA 
      0099C8 0A CC            [ 1] 1684 	jrne 9$ ; no other constant 
      0099CA 96 C4 5D         [ 2] 1685 	jp const_loop 
      001E09                       1686 9$: 
      001E09                       1687 	_unget_token    
      0099CD 27 F8 89 58 72   [ 1]    1      mov in,in.saved  
      001E0E                       1688 10$: 
      001E0E                       1689 	_drop VSIZE 
      0099D2 FB 01            [ 2]    1     addw sp,#VSIZE 
      0099D4 1F 01            [ 2] 1690 	popw y ; restore xstack pointer 
      0099D6 AE               [ 4] 1691 	ret 
                                   1692 
                                   1693 
                                   1694 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1695 ; return program size 
                                   1696 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E13                       1697 prog_size:
      0099D7 16 90 72         [ 2] 1698 	ldw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      0099DA F0 01 5B 02      [ 2] 1699 	subw x,txtbgn 
      0099DE 81               [ 4] 1700 	ret 
                                   1701 
                                   1702 ;----------------------------
                                   1703 ; print program information 
                                   1704 ;---------------------------
      0099DF                       1705 program_info: 
      0099DF 52 01 0F         [ 2] 1706 	ldw x,#PROG_ADDR 
      0099E2 01 CD 97         [ 4] 1707 	call puts 
      0099E5 CB 4D 26         [ 2] 1708 	ldw x,txtbgn 
      0099E8 03 CC 9A 84      [ 1] 1709 	mov base,#16 
      0099EC A1 10 27         [ 4] 1710 	call prt_i16
      0099EF 06 A1 11 26      [ 1] 1711 	mov base,#10  
      0099F3 05 03 01         [ 2] 1712 	ldw x,#PROG_SIZE
      0099F6 CD 09 68         [ 4] 1713 	call puts 
      0099F6 CD 97 CB         [ 4] 1714 	call prog_size 
      0099F9 CD 17 93         [ 4] 1715 	call prt_i16 
      0099F9 4D 26 03         [ 2] 1716 	ldw x,#STR_BYTES 
      0099FC CC 96 C2         [ 4] 1717 	call puts
      0099FF CE 00 1B         [ 2] 1718 	ldw x,txtbgn
      0099FF A1 81 26         [ 2] 1719 	cpw x,#app 
      009A02 0C FE            [ 1] 1720 	jrult 2$
      009A04 72 5C 00         [ 2] 1721 	ldw x,#FLASH_MEM 
      009A07 02 72            [ 2] 1722 	jra 3$
      009A09 5C 00 02         [ 2] 1723 2$: ldw x,#RAM_MEM 	 
      009A0C FD 20 63         [ 4] 1724 3$:	call puts 
      009A0F A6 0D            [ 1] 1725 	ld a,#CR 
      009A0F A1 84 26         [ 4] 1726 	call putc
      009A12 05               [ 4] 1727 	ret 
                                   1728 
      009A13 CD 97 FD 20 5A 61 6D  1729 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A18 2C 20 70 72 6F 67 72  1730 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A18 A1 05 26 05 CD 99 AF  1731 STR_BYTES: .asciz " bytes" 
      009A1F 20 07 6E 20 46 4C 41  1732 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A21 20 69 6E 20 52 41 4D  1733 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1734 
                                   1735 
                                   1736 ;----------------------------
                                   1737 ; BASIC: LIST [[start][,end]]
                                   1738 ; list program lines 
                                   1739 ; form start to end 
                                   1740 ; if empty argument list then 
                                   1741 ; list all.
                                   1742 ;----------------------------
                           000001  1743 	FIRST=1
                           000003  1744 	LAST=3 
                           000005  1745 	LN_PTR=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



                           000006  1746 	VSIZE=6 
      001EA4                       1747 list:
      009A21 A1 85 26 08 CD   [ 2] 1748 	btjf flags,#FRUN,0$
      009A26 97 F3            [ 1] 1749 	ld a,#ERR_CMD_ONLY
      009A28 CC 16 44         [ 2] 1750 	jp tb_error
      001EAE                       1751 0$:	 
      009A28 F6 EE 01         [ 4] 1752 	call next_token 
      009A2B 20 45            [ 1] 1753 	cp a,#TK_CHAR 
      009A2D 26 10            [ 1] 1754 	jrne 2$
      009A2D A1 03 26         [ 4] 1755 	call get_char 
      009A30 10 89            [ 1] 1756 	and a,#0xDF 
      009A32 CD 97            [ 1] 1757 	cp a,#'C 
      009A34 E4 85            [ 1] 1758 	jrne 1$
      009A36 CD 9D 9C         [ 4] 1759 	call list_const
      009A39 5D               [ 4] 1760 	ret 
      009A3A 27 2E CD         [ 2] 1761 1$: jp syntax_error 
      001EC5                       1762 2$:	_unget_token 
      009A3D 9C F8 20 31 01   [ 1]    1      mov in,in.saved  
      009A41 CD 1E 13         [ 4] 1763 	call prog_size 
      009A41 A1 82            [ 1] 1764 	jrugt 3$
      009A43 26               [ 4] 1765 	ret 
      001ED0                       1766 3$: _vars VSIZE
      009A44 0E FE            [ 2]    1     sub sp,#VSIZE 
      009A46 72 5C 00         [ 2] 1767 	ldw x,txtbgn 
      009A49 02 72            [ 2] 1768 	ldw (LN_PTR,sp),x 
      009A4B 5C               [ 2] 1769 	ldw x,(x) 
      009A4C 00 02            [ 2] 1770 	ldw (FIRST,sp),x ; list from first line 
      009A4E FD 5F 02         [ 2] 1771 	ldw x,#MAX_LINENO ; biggest line number 
      009A51 20 1F            [ 2] 1772 	ldw (LAST,sp),x 
      009A53 CD 19 13         [ 4] 1773 	call arg_list
      009A53 A1               [ 1] 1774 	tnz a
      009A54 06 26            [ 1] 1775 	jreq list_loop 
      009A56 13 CD            [ 1] 1776 	cp a,#2 
      009A58 9A CA            [ 1] 1777 	jreq 4$
      009A5A A6 07            [ 1] 1778 	cp a,#1 
      009A5C CD 99            [ 1] 1779 	jreq first_line 
      009A5E 81 90 F6         [ 2] 1780 	jp syntax_error 
      009A61 93               [ 2] 1781 4$:	popw x 
      009A62 EE 01            [ 2] 1782 	ldw (LAST+2,sp),x 
      001EF3                       1783 first_line:
      009A64 72               [ 2] 1784 	popw x
      009A65 A9 00            [ 2] 1785 	ldw (FIRST,sp),x 
      001EF6                       1786 lines_skip:
      009A67 03 20 08         [ 2] 1787 	ldw x,txtbgn
      009A6A 1F 05            [ 2] 1788 2$:	ldw (LN_PTR,sp),x 
      009A6A 55 00 03         [ 2] 1789 	cpw x,txtend 
      009A6D 00 02            [ 1] 1790 	jrpl list_exit 
      009A6F 4F               [ 2] 1791 	ldw x,(x) ;line# 
      009A70 20 12            [ 2] 1792 	cpw x,(FIRST,sp)
      009A72 2A 11            [ 1] 1793 	jrpl list_loop 
      009A72 0D 01            [ 2] 1794 	ldw x,(LN_PTR,sp) 
      009A74 27 03            [ 1] 1795 	ld a,(2,x)
      009A76 CD 82 90         [ 1] 1796 	ld acc8,a 
      009A79 72 5F 00 0D      [ 1] 1797 	clr acc16 
      009A79 72 A2 00 03      [ 2] 1798 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009A7D 90 F7            [ 2] 1799 	jra 2$ 
                                   1800 ; print loop
      001F16                       1801 list_loop:
      009A7F 90 EF            [ 2] 1802 	ldw x,(LN_PTR,sp)
      009A81 01 A6            [ 1] 1803 	ld a,(2,x) 
      009A83 84 1F 8D         [ 4] 1804 	call prt_basic_line
      009A84 1E 05            [ 2] 1805 	ldw x,(LN_PTR,sp)
      009A84 5B 01            [ 1] 1806 	ld a,(2,x)
      009A86 81 00 0E         [ 1] 1807 	ld acc8,a 
      009A87 72 5F 00 0D      [ 1] 1808 	clr acc16 
      009A87 52 01 CD 99      [ 2] 1809 	addw x,acc16
      009A8B DF 4D 27         [ 2] 1810 	cpw x,txtend 
      009A8E 38 07            [ 1] 1811 	jrpl list_exit
      009A8F 1F 05            [ 2] 1812 	ldw (LN_PTR,sp),x
      009A8F CD               [ 2] 1813 	ldw x,(x)
      009A90 97 CB            [ 2] 1814 	cpw x,(LAST,sp)  
      009A92 6B 01            [ 1] 1815 	jrslt list_loop
      001F38                       1816 list_exit:
      009A94 A4 30 A1 20 27   [ 1] 1817 	mov in,count 
      009A99 09 A6 84         [ 2] 1818 	ldw x,#pad 
      009A9C 55 00 03         [ 2] 1819 	ldw basicptr,x 
      001F43                       1820 	_drop VSIZE 
      009A9F 00 02            [ 2]    1     addw sp,#VSIZE 
      009AA1 20 24 1B         [ 4] 1821 	call program_info 
      009AA3 81               [ 4] 1822 	ret
                                   1823 
                                   1824 
                                   1825 ;--------------------------
                                   1826 ; BASIC: EDIT 
                                   1827 ;  copy program in FLASH 
                                   1828 ;  to RAM for edition 
                                   1829 ;-------------------------
      001F49                       1830 edit:
      009AA3 CD 99 DF         [ 4] 1831 	call qsign 
      009AA6 4D 26            [ 1] 1832 	jreq 1$ 
      009AA8 03 CC 96         [ 2] 1833 	ldw x,#NOT_SAVED 
      009AAB C2 09 68         [ 4] 1834 	call puts 
      009AAC 81               [ 4] 1835 	ret 
      001F55                       1836 1$: 
      009AAC 7B 01 A1 20      [ 2] 1837 	ldw y,#app_sign ; source address 
      009AB0 26 05 CD         [ 2] 1838     ldw x,app_size  
      009AB3 82 F4 20         [ 2] 1839 	addw x,#4 
      009AB6 D8 A1 21         [ 2] 1840 	ldw acc16,x  ; bytes to copy 
      009AB9 26 05 CD         [ 2] 1841 	ldw x,#rsign ; destination address 
      009ABC 83 82 20         [ 4] 1842 	call move  
      009ABF CF 00 80         [ 2] 1843 	ldw x,#free_ram 
      009AC0 CF 00 1B         [ 2] 1844 	ldw txtbgn,x 
      009AC0 CD 84 1C 20      [ 2] 1845 	addw x,rsize  
      009AC4 CA 00 1D         [ 2] 1846 	ldw txtend,x 
      009AC5 81               [ 4] 1847 	ret 
                                   1848 
      009AC5 A6 84 20 61 70 70 6C  1849 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   1850 
                                   1851 
                                   1852 ;--------------------------
                                   1853 ; decompile line from token list
                                   1854 ; and print it. 
                                   1855 ; input:
                                   1856 ;   A       stop at this position 
                                   1857 ;   X 		pointer at line
                                   1858 ; output:
                                   1859 ;   none 
                                   1860 ;--------------------------	
      009AC7                       1861 prt_basic_line:
      009AC7 5B 01            [ 2] 1862 	pushw y 
      009AC9 81 00 03         [ 1] 1863 	ld count,a 
      009ACA E6 02            [ 1] 1864 	ld a,(2,x)
      009ACA 52 01 CD         [ 1] 1865 	cp a,count 
      009ACD 9A 87            [ 1] 1866 	jrpl 1$ 
      009ACF 4D 27 2D         [ 1] 1867 	ld count,a 
      009AD2 CF 00 04         [ 2] 1868 1$:	ldw basicptr,x 
      009AD2 CD 97 CB 6B      [ 2] 1869 	ldw y,#tib  
      009AD6 01 A4 30         [ 4] 1870 	call decompile 
      009AD9 A1 10 27         [ 4] 1871 	call puts 
      009ADC 09 55            [ 1] 1872 	ld a,#CR 
      009ADE 00 03 00         [ 4] 1873 	call putc 
      009AE1 02 A6            [ 2] 1874 	popw y 
      009AE3 84               [ 4] 1875 	ret 
                                   1876 
                                   1877 
                                   1878 ;---------------------------------
                                   1879 ; BASIC: PRINT|? arg_list 
                                   1880 ; print values from argument list
                                   1881 ;----------------------------------
                           000001  1882 	CCOMMA=1
                           000001  1883 	VSIZE=1
      001FB1                       1884 print:
      001FB1                       1885 	_vars VSIZE 
      009AE4 20 19            [ 2]    1     sub sp,#VSIZE 
      009AE6                       1886 reset_comma:
      009AE6 CD 9A            [ 1] 1887 	clr (CCOMMA,sp)
      001FB5                       1888 prt_loop:
      009AE8 87 4D 26         [ 4] 1889 	call next_token
      009AEB 03 CC            [ 1] 1890 	cp a,#CMD_END 
      009AED 96 C2            [ 1] 1891 	jrult 0$
      009AEF A1 0A            [ 1] 1892 	cp a,#TK_COLON 
      009AEF 7B 01            [ 1] 1893 	jreq 0$
      009AF1 A1 10            [ 1] 1894 	cp a,#TK_CMD
      009AF3 26 05            [ 1] 1895 	jrne 10$
      001FC4                       1896 0$:
      001FC4                       1897 	_unget_token 
      009AF5 CD 81 F9 20 D8   [ 1]    1      mov in,in.saved  
      009AFA 20 63            [ 2] 1898 	jra 8$ 
      001FCB                       1899 10$:	
      009AFA CD 82            [ 1] 1900 	cp a,#TK_QSTR
      009AFC 16 20            [ 1] 1901 	jreq 1$
      009AFE D3 04            [ 1] 1902 	cp a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009AFF 27 1B            [ 1] 1903 	jreq 2$ 
      009AFF 5B 01            [ 1] 1904 	cp a,#TK_CFUNC 
      009B01 81 1F            [ 1] 1905 	jreq 3$
      009B02 A1 08            [ 1] 1906 	cp a,#TK_COMMA 
      009B02 52 01            [ 1] 1907 	jreq 4$
      009B04 CD 9A            [ 1] 1908 	cp a,#TK_SHARP 
      009B06 CA 4D            [ 1] 1909 	jreq 5$
      009B08 27 54            [ 2] 1910 	jra 7$ 
      001FE1                       1911 1$:	; print string 
      009B0A CD 97 CB         [ 4] 1912 	call puts
      009B0D 6B               [ 1] 1913 	incw x
      009B0E 01 A4 30 A1      [ 2] 1914 	subw x,basicptr 
      009B12 30 27 09         [ 2] 1915 	ldw in.w,x  
      009B15 A6 84            [ 2] 1916 	jra reset_comma
      001FEE                       1917 2$:	; print character 
      009B17 55 00 03         [ 4] 1918 	call get_char 
      009B1A 00 02 20         [ 4] 1919 	call putc 
      009B1D 40 BD            [ 2] 1920 	jra reset_comma 
      009B1E                       1921 3$: ; print character function value  	
      001FF6                       1922 	_get_code_addr 
      009B1E CD               [ 2]    1         ldw x,(x)
      009B1F 9A CA 4D 26      [ 1]    2         inc in 
      009B23 03 CC 96 C2      [ 1]    3         inc in 
      009B27 FD               [ 4] 1923 	call (x)
      009B27 CD 82 33         [ 4] 1924 	call putc
      009B2A 90 F6            [ 2] 1925 	jra reset_comma 
      002005                       1926 4$: ; set comma state 
      009B2C 93 EE            [ 1] 1927 	cpl (CCOMMA,sp)
      009B2E 01 72            [ 2] 1928 	jra prt_loop   
      002009                       1929 5$: ; # character must be followed by an integer   
      009B30 A9 00 03         [ 4] 1930 	call next_token
      009B33 4D 2B            [ 1] 1931 	cp a,#TK_INTGR 
      009B35 08 26            [ 1] 1932 	jreq 6$
      009B37 0C 35 02         [ 2] 1933 	jp syntax_error 
      002013                       1934 6$: ; set tab width
      009B3A 00 0F 20         [ 4] 1935 	call get_int24 
      009B3D 0A               [ 1] 1936 	ld a,xl 
      009B3E A4 0F            [ 1] 1937 	and a,#15 
      009B3E 35 04 00         [ 1] 1938 	ld tab_width,a 
      009B41 0F 20            [ 2] 1939 	jra reset_comma 
      00201E                       1940 7$:	
      00201E                       1941 	_unget_token 
      009B43 04 00 02 00 01   [ 1]    1      mov in,in.saved  
      009B44 CD 1B 63         [ 4] 1942 	call condition
      009B44 35               [ 1] 1943 	tnz a 
      009B45 01 00            [ 1] 1944 	jreq 8$    
      009B47 0F 17 B8         [ 4] 1945     call print_top
      009B48 20 85            [ 2] 1946 	jra reset_comma 
      00202E                       1947 8$:
      009B48 5F C6            [ 1] 1948 	tnz (CCOMMA,sp)
      009B4A 00 0F            [ 1] 1949 	jrne 9$
      009B4C 14 01            [ 1] 1950 	ld a,#CR 
      009B4E 27 03 53         [ 4] 1951     call putc 
      002037                       1952 9$:	_drop VSIZE 
      009B51 A6 FF            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009B53 72               [ 4] 1953 	ret 
                                   1954 
                                   1955 ;----------------------
                                   1956 ; 'save_context' and
                                   1957 ; 'rest_context' must be 
                                   1958 ; called at the same 
                                   1959 ; call stack depth 
                                   1960 ; i.e. SP must have the 
                                   1961 ; save value at  
                                   1962 ; entry point of both 
                                   1963 ; routine. 
                                   1964 ;---------------------
                           000004  1965 	CTXT_SIZE=4 ; size of saved data 
                                   1966 ;--------------------
                                   1967 ; save current BASIC
                                   1968 ; interpreter context 
                                   1969 ; on stack 
                                   1970 ;--------------------
      00203A                       1971 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00203A                       1972 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00203A                       1973 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      00203A                       1974 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      00203A                       1975 save_context:
      009B54 A2 00 03         [ 2] 1976 	ldw x,basicptr 
      009B57 90 F7            [ 2] 1977 	ldw (BPTR,sp),x
      009B59 90 EF 01         [ 1] 1978 	ld a,in 
      009B5C A6 84            [ 1] 1979 	ld (IN,sp),a
      009B5E C6 00 03         [ 1] 1980 	ld a,count 
      009B5E 5B 01            [ 1] 1981 	ld (CNT,sp),a  
      009B60 81               [ 4] 1982 	ret
                                   1983 
                                   1984 ;-----------------------
                                   1985 ; restore previously saved 
                                   1986 ; BASIC interpreter context 
                                   1987 ; from stack 
                                   1988 ;-------------------------
      009B61                       1989 rest_context:
      009B61 4B 00            [ 2] 1990 	ldw x,(BPTR,sp)
      009B63 CD 97 CB         [ 2] 1991 	ldw basicptr,x 
      009B66 4D 27            [ 1] 1992 	ld a,(IN,sp)
      009B68 25 A1 87         [ 1] 1993 	ld in,a
      009B6B 26 04            [ 1] 1994 	ld a,(CNT,sp)
      009B6D 03 01 20         [ 1] 1995 	ld count,a  
      009B70 F2               [ 4] 1996 	ret
                                   1997 
                                   1998 
                                   1999 
                                   2000 ;------------------------------------------
                                   2001 ; BASIC: INPUT [string]var[,[string]var]
                                   2002 ; input value in variables 
                                   2003 ; [string] optionally can be used as prompt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



                                   2004 ;-----------------------------------------
                           000001  2005 	CX_BPTR=1
                           000003  2006 	CX_IN=3
                           000004  2007 	CX_CNT=4
                           000005  2008 	SKIP=5
                           000005  2009 	VSIZE=5
      009B71                       2010 input_var:
      009B71 A1 06            [ 2] 2011 	pushw y 
      00205C                       2012 	_vars VSIZE 
      009B73 26 0A            [ 2]    1     sub sp,#VSIZE 
      00205E                       2013 input_loop:
      009B75 CD 9B            [ 1] 2014 	clr (SKIP,sp)
      009B77 E3 A6 07         [ 4] 2015 	call next_token 
      009B7A CD 99            [ 1] 2016 	cp a,#TK_QSTR 
      009B7C 81 20            [ 1] 2017 	jrne 1$ 
      009B7E 08 55 00         [ 4] 2018 	call puts 
      009B81 03               [ 1] 2019 	incw x 
      009B82 00 02 CD 9B      [ 2] 2020 	subw x,basicptr 
      009B86 02 00 00         [ 2] 2021 	ldw in.w,x 
      009B87 03 05            [ 1] 2022 	cpl (SKIP,sp)
      009B87 0D 01 27         [ 4] 2023 	call next_token 
      009B8A 03 CD            [ 1] 2024 1$: cp a,#TK_VAR  
      009B8C 82 75            [ 1] 2025 	jreq 2$ 
      009B8E CC 16 42         [ 2] 2026 	jp syntax_error
      009B8E 5B 01 81         [ 4] 2027 2$:	call get_addr
      009B91 CF 00 19         [ 2] 2028 	ldw ptr16,x 
      009B91 CD 9B            [ 1] 2029 	tnz (SKIP,sp)
      009B93 61 4D            [ 1] 2030 	jrne 21$ 
      009B95 27 4B CD         [ 4] 2031 	call var_name 
      009B98 97 CB 4D         [ 4] 2032 	call putc   
      00208E                       2033 21$:
      009B9B 27 43            [ 1] 2034 	ld a,#':
      009B9D A1 88 27         [ 4] 2035 	call putc 
      009BA0 07 55 00         [ 4] 2036 	call save_context 
      009BA3 03 00 02 20      [ 1] 2037 	clr count  
      009BA7 38 CD 9B         [ 4] 2038 	call readln 
      009BAA 61 4D 26         [ 2] 2039 	ldw x,#tib 
      009BAD 03 CC 96         [ 1] 2040 	push count
      009BB0 C2 00            [ 1] 2041 	push #0 
      009BB1 72 FB 01         [ 2] 2042 	addw x,(1,sp)
      009BB1 90               [ 1] 2043 	incw x 
      0020A9                       2044 	_drop 2 
      009BB2 F6 93            [ 2]    1     addw sp,#2 
      009BB4 EE 01 72 A9      [ 1] 2045 	clr in 
      009BB8 00 03 C7         [ 4] 2046 	call get_token
      009BBB 00 0D            [ 1] 2047 	cp a,#TK_INTGR
      009BBD CF 00            [ 1] 2048 	jreq 3$ 
      009BBF 0E 90            [ 1] 2049 	cp a,#TK_MINUS
      009BC1 F6 93            [ 1] 2050 	jrne 22$
      009BC3 EE 01 72         [ 4] 2051 	call get_token 
      009BC6 A9 00            [ 1] 2052 	cp a,#TK_INTGR 
      009BC8 03 C4            [ 1] 2053 	jreq 23$
      0020C1                       2054 22$:
      009BCA 00 0D 02         [ 4] 2055 	call rest_context 
      009BCD C4 00 0E         [ 2] 2056 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      0020C7                       2057 23$:
      009BD0 02 C4 00         [ 4] 2058 	call neg_acc24	
      0020CA                       2059 3$: 
      009BD3 0F 02 72         [ 1] 2060 	ld a,acc24 
      009BD6 A2 00 03         [ 2] 2061 	ldw x,acc16 
      009BD9 90 F7 90 EF      [ 4] 2062 	ld [ptr16],a
      009BDD 01 20 B7 A6      [ 1] 2063 	inc ptr8  
      009BE1 84 81 00 19      [ 5] 2064 	ldw [ptr16],x 
      009BE3 CD 20 4A         [ 4] 2065 	call rest_context
      009BE3 52 02 CD         [ 4] 2066 	call next_token 
      009BE6 9B 91            [ 1] 2067 	cp a,#TK_COMMA
      009BE8 4D 27            [ 1] 2068 	jrne 4$ 
      009BEA 69 CD 97         [ 2] 2069 	jp input_loop
      0020E9                       2070 4$:
      009BED CB A1            [ 1] 2071 	cp a,#TK_NONE 
      009BEF 89 27            [ 1] 2072 	jreq input_exit  
      009BF1 0B A1            [ 1] 2073 	cp a,#TK_COLON 
      009BF3 8A 27            [ 1] 2074     jreq input_exit 
      009BF5 07 55 00         [ 2] 2075 	jp syntax_error 
      0020F4                       2076 input_exit:
      0020F4                       2077 	_drop VSIZE 
      009BF8 03 00            [ 2]    1     addw sp,#VSIZE 
      009BFA 02 20            [ 2] 2078 	popw y 
      009BFC 55               [ 4] 2079 	ret 
                                   2080 
                                   2081 
                                   2082 ;---------------------
                                   2083 ; BASIC: REM | ' 
                                   2084 ; skip comment to end of line 
                                   2085 ;---------------------- 
      0020F9                       2086 remark::
      009BFD 6B 02 CD 9B 91   [ 1] 2087 	mov in,count 
      009C02 A1               [ 4] 2088  	ret 
                                   2089 
                                   2090 
                                   2091 ;---------------------
                                   2092 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2093 ; read in loop 'addr'  
                                   2094 ; apply & 'mask' to value 
                                   2095 ; loop while result==0.  
                                   2096 ; 'xor_mask' is used to 
                                   2097 ; invert the wait logic.
                                   2098 ; i.e. loop while not 0.
                                   2099 ;---------------------
                           000001  2100 	XMASK=1 
                           000002  2101 	MASK=2
                           000003  2102 	ADDR=3
                           000004  2103 	VSIZE=4
      0020FF                       2104 wait: 
      0020FF                       2105 	_vars VSIZE
      009C03 84 27            [ 2]    1     sub sp,#VSIZE 
      009C05 03 CC            [ 1] 2106 	clr (XMASK,sp) 
      009C07 96 C2 13         [ 4] 2107 	call arg_list 
      009C09 A1 02            [ 1] 2108 	cp a,#2
      009C09 90 F6            [ 1] 2109 	jruge 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C0B 93 EE 01         [ 2] 2110 	jp syntax_error 
      009C0E 72 A9            [ 1] 2111 0$:	cp a,#3
      009C10 00 03            [ 1] 2112 	jrult 1$
      002111                       2113 	_xpop  ; xor mask 
      009C12 C7 00            [ 1]    1     ld a,(y)
      009C14 0D               [ 1]    2     ldw x,y 
      009C15 CF 00            [ 2]    3     ldw x,(1,x)
      009C17 0E 90 F6 93      [ 2]    4     addw y,#CELL_SIZE 
      009C1B EE               [ 1] 2114 	ld a,xl 
      009C1C 01 72            [ 1] 2115 	ld (XMASK,sp),a 
      00211D                       2116 1$: _xpop ; mask
      009C1E A9 00            [ 1]    1     ld a,(y)
      009C20 03               [ 1]    2     ldw x,y 
      009C21 6B 01            [ 2]    3     ldw x,(1,x)
      009C23 7B 02 A1 8A      [ 2]    4     addw y,#CELL_SIZE 
      009C27 27               [ 1] 2117     ld a,xl  
      009C28 10 02            [ 1] 2118 	ld (MASK,sp),a 
      009C29                       2119 	_xpop ; address 
      009C29 7B 01            [ 1]    1     ld a,(y)
      009C2B CA               [ 1]    2     ldw x,y 
      009C2C 00 0D            [ 2]    3     ldw x,(1,x)
      009C2E 02 CA 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      009C32 02               [ 1] 2120 2$:	ld a,(x)
      009C33 CA 00            [ 1] 2121 	and a,(MASK,sp)
      009C35 0F 02            [ 1] 2122 	xor a,(XMASK,sp)
      009C37 20 0E            [ 1] 2123 	jreq 2$ 
      009C39                       2124 	_drop VSIZE 
      009C39 7B 01            [ 2]    1     addw sp,#VSIZE 
      009C3B C8               [ 4] 2125 	ret 
                                   2126 
                                   2127 ;---------------------
                                   2128 ; BASIC: BSET addr,mask
                                   2129 ; set bits at 'addr' corresponding 
                                   2130 ; to those of 'mask' that are at 1.
                                   2131 ; arguments:
                                   2132 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2133 ;   mask        mask|addr
                                   2134 ; output:
                                   2135 ;	none 
                                   2136 ;--------------------------
      00213C                       2137 bit_set:
      009C3C 00 0D 02         [ 4] 2138 	call arg_list 
      009C3F C8 00            [ 1] 2139 	cp a,#2	 
      009C41 0E 02            [ 1] 2140 	jreq 1$ 
      009C43 C8 00 0F         [ 2] 2141 	jp syntax_error
      002146                       2142 1$: 
      002146                       2143 	_xpop ; mask 
      009C46 02 72            [ 1]    1     ld a,(y)
      009C48 A2               [ 1]    2     ldw x,y 
      009C49 00 03            [ 2]    3     ldw x,(1,x)
      009C4B 90 F7 90 EF      [ 2]    4     addw y,#CELL_SIZE 
      009C4F 01               [ 1] 2144 	ld a,xl
      009C50 20               [ 1] 2145 	push a  
      002151                       2146 	_xpop ; addr  
      009C51 99 A6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009C53 84               [ 1]    2     ldw x,y 
      009C54 5B 02            [ 2]    3     ldw x,(1,x)
      009C56 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C57 84               [ 1] 2147 	pop a 
      009C57 35               [ 1] 2148 	or a,(x)
      009C58 10               [ 1] 2149 	ld (x),a
      009C59 00               [ 4] 2150 	ret 
                                   2151 
                                   2152 ;---------------------
                                   2153 ; BASIC: BRES addr,mask
                                   2154 ; reset bits at 'addr' corresponding 
                                   2155 ; to those of 'mask' that are at 1.
                                   2156 ; arguments:
                                   2157 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2158 ;   mask	    ~mask&*addr  
                                   2159 ; output:
                                   2160 ;	none 
                                   2161 ;--------------------------
      00215E                       2162 bit_reset:
      009C5A 0B 81 13         [ 4] 2163 	call arg_list 
      009C5C A1 02            [ 1] 2164 	cp a,#2  
      009C5C 35 0A            [ 1] 2165 	jreq 1$ 
      009C5E 00 0B 81         [ 2] 2166 	jp syntax_error
      009C61                       2167 1$: 
      002168                       2168 	_xpop ; mask 
      009C61 90 89            [ 1]    1     ld a,(y)
      009C63 4F               [ 1]    2     ldw x,y 
      009C64 AE 16            [ 2]    3     ldw x,(1,x)
      009C66 90 90 CE 00      [ 2]    4     addw y,#CELL_SIZE 
      009C6A 1E               [ 1] 2169 	ld a,xl 
      009C6B 90               [ 1] 2170 	cpl a
      009C6C A3               [ 1] 2171 	push a  
      002174                       2172 	_xpop ; addr  
      009C6D B6 80            [ 1]    1     ld a,(y)
      009C6F 25               [ 1]    2     ldw x,y 
      009C70 05 1D            [ 2]    3     ldw x,(1,x)
      009C72 00 80 20 04      [ 2]    4     addw y,#CELL_SIZE 
      009C76 84               [ 1] 2173 	pop a 
      009C76 72               [ 1] 2174 	and a,(x)
      009C77 B0               [ 1] 2175 	ld (x),a 
      009C78 00               [ 4] 2176 	ret 
                                   2177 
                                   2178 ;---------------------
                                   2179 ; BASIC: BTOGL addr,mask
                                   2180 ; toggle bits at 'addr' corresponding 
                                   2181 ; to those of 'mask' that are at 1.
                                   2182 ; arguments:
                                   2183 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2184 ;   mask	    mask^*addr  
                                   2185 ; output:
                                   2186 ;	none 
                                   2187 ;--------------------------
      002181                       2188 bit_toggle:
      009C79 1E 90 85         [ 4] 2189 	call arg_list 
      009C7C 81 02            [ 1] 2190 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009C7D 27 03            [ 1] 2191 	jreq 1$ 
      009C7D 3B 00 0B         [ 2] 2192 	jp syntax_error
      00218B                       2193 1$: _xpop ; mask 
      009C80 AE 9E            [ 1]    1     ld a,(y)
      009C82 DA               [ 1]    2     ldw x,y 
      009C83 CD 89            [ 2]    3     ldw x,(1,x)
      009C85 E8 CE 00 1C      [ 2]    4     addw y,#CELL_SIZE 
      009C89 35               [ 1] 2194 	ld a,xl
      009C8A 10               [ 1] 2195 	push a 
      002196                       2196 	_xpop  ; addr  
      009C8B 00 0B            [ 1]    1     ld a,(y)
      009C8D CD               [ 1]    2     ldw x,y 
      009C8E 98 13            [ 2]    3     ldw x,(1,x)
      009C90 32 00 0B AE      [ 2]    4     addw y,#CELL_SIZE 
      009C94 9E               [ 1] 2197 	pop a 
      009C95 EC               [ 1] 2198 	xor a,(x)
      009C96 CD               [ 1] 2199 	ld (x),a 
      009C97 89               [ 4] 2200 	ret 
                                   2201 
                                   2202 
                                   2203 ;---------------------
                                   2204 ; BASIC: BTEST(addr,bit)
                                   2205 ; return bit value at 'addr' 
                                   2206 ; bit is in range {0..7}.
                                   2207 ; arguments:
                                   2208 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2209 ;   bit 	    bit position {0..7}  
                                   2210 ; output:
                                   2211 ;	A:X       bit value  
                                   2212 ;--------------------------
      0021A3                       2213 bit_test:
      009C98 E8 CE 00         [ 4] 2214 	call func_args 
      009C9B 1E 72            [ 1] 2215 	cp a,#2
      009C9D B0 00            [ 1] 2216 	jreq 0$
      009C9F 1C CD 98         [ 2] 2217 	jp syntax_error
      0021AD                       2218 0$:	
      0021AD                       2219 	_xpop 
      009CA2 13 AE            [ 1]    1     ld a,(y)
      009CA4 9E               [ 1]    2     ldw x,y 
      009CA5 FD CD            [ 2]    3     ldw x,(1,x)
      009CA7 89 E8 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009CAA 9F               [ 1] 2220 	ld a,xl 
      009CAA CD 9C            [ 1] 2221 	and a,#7
      009CAC 61               [ 1] 2222 	push a   
      009CAD A6 03            [ 1] 2223 	ld a,#1 
      009CAF 62 CF            [ 1] 2224 1$: tnz (1,sp)
      009CB1 00 21            [ 1] 2225 	jreq 2$
      009CB3 4F               [ 1] 2226 	sll a 
      009CB4 81 01            [ 1] 2227 	dec (1,sp)
      009CB5 20 F7            [ 2] 2228 	jra 1$
      009CB5 CD 97            [ 1] 2229 2$: ld (1,sp),a  
      0021C7                       2230 	_xpop ; address  
      009CB7 CB A1            [ 1]    1     ld a,(y)
      009CB9 85               [ 1]    2     ldw x,y 
      009CBA 27 0C            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009CBC A1 05 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009CC0 CC               [ 1] 2231 	pop a 
      009CC1 96               [ 1] 2232 	and a,(x)
      009CC2 C2 02            [ 1] 2233 	jreq 3$
      009CC3 A6 01            [ 1] 2234 	ld a,#1 
      009CC3 CD               [ 1] 2235 3$:	clrw x 
      009CC4 99               [ 1] 2236 	ld xl,a
      009CC5 AF               [ 1] 2237 	clr a  
      009CC6 20               [ 4] 2238 	ret
                                   2239 
                                   2240 ;--------------------
                                   2241 ; BASIC: POKE addr,byte
                                   2242 ; put a byte at addr 
                                   2243 ;--------------------
      0021DA                       2244 poke:
      009CC7 03 19 13         [ 4] 2245 	call arg_list 
      009CC8 A1 02            [ 1] 2246 	cp a,#2
      009CC8 CD 97            [ 1] 2247 	jreq 1$
      009CCA F3 16 42         [ 2] 2248 	jp syntax_error
      009CCB                       2249 1$:	
      0021E4                       2250 	_xpop ; byte   
      009CCB CF 00            [ 1]    1     ld a,(y)
      009CCD 1A               [ 1]    2     ldw x,y 
      009CCE CD 97            [ 2]    3     ldw x,(1,x)
      009CD0 CB A1 32 27      [ 2]    4     addw y,#CELL_SIZE 
      009CD4 03               [ 1] 2251     ld a,xl 
      009CD5 CC               [ 1] 2252 	push a 
      0021EF                       2253 	_xpop ; address 
      009CD6 96 C2            [ 1]    1     ld a,(y)
      009CD8 93               [ 1]    2     ldw x,y 
      009CD8 CD 9B            [ 2]    3     ldw x,(1,x)
      009CDA E3 A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      009CDE 03               [ 1] 2254 	pop a 
      009CDF CC               [ 1] 2255 	ld (x),a 
      009CE0 96               [ 4] 2256 	ret 
                                   2257 
                                   2258 ;-----------------------
                                   2259 ; BASIC: PEEK(addr)
                                   2260 ; get the byte at addr 
                                   2261 ; input:
                                   2262 ;	none 
                                   2263 ; output:
                                   2264 ;	X 		value 
                                   2265 ;-----------------------
      0021FB                       2266 peek:
      009CE1 C2 19 0E         [ 4] 2267 	call func_args
      009CE2 A1 01            [ 1] 2268 	cp a,#1 
      009CE2 90 F6            [ 1] 2269 	jreq 1$
      009CE4 93 EE 01         [ 2] 2270 	jp syntax_error
      002205                       2271 1$: _xpop ; address  
      009CE7 72 A9            [ 1]    1     ld a,(y)
      009CE9 00               [ 1]    2     ldw x,y 
      009CEA 03 01            [ 2]    3     ldw x,(1,x)
      009CEB 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CEB 72 C7 00         [ 1] 2272 	ld farptr,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009CEE 1A 72 5C         [ 2] 2273 	ldw ptr16,x 
      009CF1 00 1B 72 CF      [ 5] 2274 	ldf a,[farptr]
      009CF5 00               [ 1] 2275 	clrw x 
      009CF6 1A               [ 1] 2276 	ld xl,a 
      009CF7 81               [ 1] 2277 	clr a 
      009CF8 81               [ 4] 2278 	ret 
                                   2279 
                                   2280 ;---------------------------
                                   2281 ; BASIC IF expr : instructions
                                   2282 ; evaluate expr and if true 
                                   2283 ; execute instructions on same line. 
                                   2284 ;----------------------------
      00221C                       2285 if: 
      009CF8 F6 A0 03         [ 4] 2286 	call condition  
      00221F                       2287 	_xpop 
      009CFB 88 4B            [ 1]    1     ld a,(y)
      009CFD 00               [ 1]    2     ldw x,y 
      009CFE 72 FB            [ 2]    3     ldw x,(1,x)
      009D00 01 F6 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      009D04 5B               [ 1] 2288 	tnz  a  
      009D05 02 81            [ 1] 2289 	jrne 9$
      009D07 5D               [ 2] 2290 	tnzw x 
      009D07 90 89            [ 1] 2291 	jrne 9$  
                                   2292 ;skip to next line
      009D09 52 04 5F 1F 01   [ 1] 2293 	mov in,count
      002233                       2294 	_drop 2 
      009D0E 90 AE            [ 2]    1     addw sp,#2 
      009D10 40 00 90         [ 2] 2295 	jp next_line
      009D13 C3               [ 4] 2296 9$:	ret 
                                   2297 
                                   2298 ;------------------------
                                   2299 ; BASIC: FOR var=expr 
                                   2300 ; set variable to expression 
                                   2301 ; leave variable address 
                                   2302 ; on stack and set
                                   2303 ; FLOOP bit in 'flags'
                                   2304 ;-----------------
                           000001  2305 	RETL1=1 ; return address  
                           000003  2306 	FSTEP=3  ; variable increment int24
                           000006  2307 	LIMIT=6 ; loop limit, int24  
                           000009  2308 	CVAR=9   ; control variable 
                           00000B  2309 	INW=11   ;  in.w saved
                           00000D  2310 	BPTR=13 ; baseptr saved
                           00000D  2311 	VSIZE=13  
      002239                       2312 for: ; { -- var_addr }
      009D14 00               [ 2] 2313 	popw x ; call return address 
      00223A                       2314 	_vars VSIZE 
      009D15 25 24            [ 2]    1     sub sp,#VSIZE 
      009D17 35               [ 2] 2315 	pushw x  ; RETL1 
      009D18 17 03            [ 1] 2316 	ld a,#TK_VAR 
      009D1A 93 5C CD         [ 4] 2317 	call expect
      009D1D 89 E8 A6         [ 4] 2318 	call get_addr
      009D20 3D CD            [ 2] 2319 	ldw (CVAR,sp),x  ; control variable 
      009D22 89 8B 1E         [ 4] 2320 	call let_eval 
      009D25 03 CD 9C F8      [ 1] 2321 	bset flags,#FLOOP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D29 C7 00 0D         [ 4] 2322 	call next_token 
      009D2C CF 00            [ 1] 2323 	cp a,#TK_CMD 
      009D2E 0E CD            [ 1] 2324 	jreq 1$
      009D30 98 2A A6         [ 2] 2325 	jp syntax_error
      002258                       2326 1$:  
      002258                       2327 	_get_code_addr
      009D33 0D               [ 2]    1         ldw x,(x)
      009D34 CD 89 8B 1E      [ 1]    2         inc in 
      009D38 01 5C 1F 01      [ 1]    3         inc in 
      009D3C 72 5F 00         [ 2] 2328 	cpw x,#to   
      009D3F 0E 16            [ 1] 2329 	jreq to
      009D41 03 90 F6         [ 2] 2330 	jp syntax_error 
                                   2331 
                                   2332 ;-----------------------------------
                                   2333 ; BASIC: TO expr 
                                   2334 ; second part of FOR loop initilization
                                   2335 ; leave limit on stack and set 
                                   2336 ; FTO bit in 'flags'
                                   2337 ;-----------------------------------
      002269                       2338 to: ; { var_addr -- var_addr limit step }
      009D44 C7 00 0F 72 B9   [ 2] 2339 	btjt flags,#FLOOP,1$
      009D49 00 0E 20         [ 2] 2340 	jp syntax_error
      009D4C C5 1A 4A         [ 4] 2341 1$: call expression   
      009D4D A1 84            [ 1] 2342 	cp a,#TK_INTGR 
      009D4D 1E 01            [ 1] 2343 	jreq 2$ 
      009D4F CD 98 13         [ 2] 2344 	jp syntax_error
      00227B                       2345 2$: _xpop
      009D52 AE 9D            [ 1]    1     ld a,(y)
      009D54 5D               [ 1]    2     ldw x,y 
      009D55 CD 89            [ 2]    3     ldw x,(1,x)
      009D57 E8 5B 04 90      [ 2]    4     addw y,#CELL_SIZE 
      009D5B 85 81            [ 1] 2346 	ld (LIMIT,sp),a 
      009D5D 20 63            [ 2] 2347 	ldw (LIMIT+1,sp),x
      009D5F 6F 6E 73         [ 4] 2348 	call next_token
      009D62 74 61            [ 1] 2349 	cp a,#TK_NONE  
      009D64 6E 74            [ 1] 2350 	jreq 4$ 
      009D66 73 20            [ 1] 2351 	cp a,#TK_CMD
      009D68 69 6E            [ 1] 2352 	jrne 3$
      002293                       2353 	_get_code_addr
      009D6A 20               [ 2]    1         ldw x,(x)
      009D6B 45 45 50 52      [ 1]    2         inc in 
      009D6F 4F 4D 0A 00      [ 1]    3         inc in 
      009D73 A3 22 AF         [ 2] 2354 	cpw x,#step 
      009D73 AE 40            [ 1] 2355 	jreq step
      0022A1                       2356 3$:	
      0022A1                       2357 	_unget_token   	 
      009D75 00 35 08 00 0F   [ 1]    1      mov in,in.saved  
      0022A6                       2358 4$:	
      009D7A A3 47            [ 1] 2359 	clr (FSTEP,sp) 
      009D7C F8 24 17         [ 2] 2360 	ldw x,#1   ; default step  
      009D7F F6 26            [ 2] 2361 	ldw (FSTEP+1,sp),x 
      009D81 0C 5C            [ 2] 2362 	jra store_loop_addr 
                                   2363 
                                   2364 
                                   2365 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2366 ; BASIC: STEP expr 
                                   2367 ; optional third par of FOR loop
                                   2368 ; initialization. 	
                                   2369 ;------------------------------------
      0022AF                       2370 step: ; {var limit -- var limit step}
      009D83 72 5A 00 0F 26   [ 2] 2371 	btjt flags,#FLOOP,1$
      009D88 F6 1D 00         [ 2] 2372 	jp syntax_error
      009D8B 08 20 09         [ 4] 2373 1$: call expression 
      009D8E F6 5C            [ 1] 2374 	cp a,#TK_INTGR
      009D90 4D 26            [ 1] 2375 	jreq 2$
      009D92 FB 5A 20         [ 2] 2376 	jp syntax_error
      0022C1                       2377 2$:	
      0022C1                       2378 	_xpop 
      009D95 E0 5F            [ 1]    1     ld a,(y)
      009D97 4F               [ 1]    2     ldw x,y 
      009D98 CF 00            [ 2]    3     ldw x,(1,x)
      009D9A 25 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D9C 6B 03            [ 1] 2379 	ld (FSTEP,sp),a 
      009D9C 90 89            [ 2] 2380 	ldw (FSTEP+1,sp),x ; step
                                   2381 ; if step < 0 decrement LIMIT 
      009D9E 52               [ 1] 2382 	tnz a
      009D9F 05 72            [ 1] 2383 	jrpl store_loop_addr 
      009DA1 5F 00            [ 1] 2384 	ld a,(LIMIT,sp)
      009DA3 0E CD            [ 2] 2385 	ldw x,(LIMIT+1,sp)
      009DA5 94 06 AB         [ 2] 2386 	subw x,#1 
      009DA8 05 6B            [ 1] 2387 	sbc a,#0 
      009DAA 05 1F            [ 1] 2388 	ld (LIMIT,sp),a 
      009DAC 01 90            [ 2] 2389 	ldw (LIMIT+1,sp),x 
                                   2390 ; leave loop back entry point on cstack 
                                   2391 ; cstack is 1 call deep from interpreter
      0022DE                       2392 store_loop_addr:
      009DAE AE 40 00         [ 2] 2393 	ldw x,basicptr
      009DB1 1E 01            [ 2] 2394 	ldw (BPTR,sp),x 
      009DB3 17 03 90         [ 2] 2395 	ldw x,in.w 
      009DB6 C3 00            [ 2] 2396 	ldw (INW,sp),x   
      009DB8 25 24 1A 90      [ 1] 2397 	bres flags,#FLOOP 
      009DBC F6 11 05 26      [ 1] 2398 	inc loop_depth  
      009DC0 07               [ 4] 2399 	ret 
                                   2400 
                                   2401 ;--------------------------------
                                   2402 ; BASIC: NEXT var 
                                   2403 ; FOR loop control 
                                   2404 ; increment variable with step 
                                   2405 ; and compare with limit 
                                   2406 ; loop if threshold not crossed.
                                   2407 ; else stack. 
                                   2408 ; and decrement 'loop_depth' 
                                   2409 ;--------------------------------
      0022F1                       2410 next: ; {var limit step retl1 -- [var limit step ] }
      009DC1 90 5C CD 94      [ 1] 2411 	tnz loop_depth 
      009DC5 11 26            [ 1] 2412 	jrne 1$ 
      009DC7 11 16 42         [ 2] 2413 	jp syntax_error 
      009DC8                       2414 1$: 
      009DC8 16 03            [ 1] 2415 	ld a,#TK_VAR 
      009DCA 90 F6 C7         [ 4] 2416 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009DCD 00 0F 72         [ 4] 2417 	call get_addr 
                                   2418 ; check for good variable after NEXT 	 
      009DD0 B9 00            [ 2] 2419 	cpw x,(CVAR,sp)
      009DD2 0E 20            [ 1] 2420 	jreq 2$  
      009DD4 DC 16 42         [ 2] 2421 	jp syntax_error ; not the good one 
      009DD5                       2422 2$: 
      009DD5 0F 03 0F         [ 2] 2423 	ldw ptr16,x 
                                   2424 	; increment variable 
      009DD8 04               [ 1] 2425 	ld a,(x)
      009DD9 EE 01            [ 2] 2426 	ldw x,(1,x)  ; get var value 
      009DD9 1E 03 5B         [ 2] 2427 	addw x,(FSTEP+1,sp) ; var+step 
      009DDC 05 90            [ 1] 2428 	adc a,(FSTEP,sp)
      009DDE 85 81 00 19      [ 4] 2429 	ld [ptr16],a
      009DE0 72 5C 00 1A      [ 1] 2430 	inc ptr8  
      009DE0 90 89 52 08      [ 5] 2431 	ldw [ptr16],x 
      009DE4 0F 06 CD         [ 1] 2432 	ld acc24,a 
      009DE7 97 CB A1         [ 2] 2433 	ldw acc16,x 
      009DEA 04 26            [ 1] 2434 	ld a,(LIMIT,sp)
      009DEC 0D CD            [ 2] 2435 	ldw x,(LIMIT+1,sp)
      009DEE 98 0D A4 DF      [ 2] 2436 	subw x,acc16 
      009DF2 A1 55 26         [ 1] 2437 	sbc a,acc24
      009DF5 08 03            [ 1] 2438 	xor a,(FSTEP,sp)
      009DF7 06 20            [ 1] 2439 	xor a,#0x80
      009DF9 07 A1            [ 1] 2440 	jrmi loop_back  
      009DFB 03 27            [ 2] 2441 	jra loop_done   
                                   2442 ; check sign of STEP  
      009DFD 08 CC            [ 1] 2443 	ld a,(FSTEP,sp)
      009DFF 96 C2            [ 1] 2444 	jrpl 4$
                                   2445 ;negative step
      009E01 C6 00 0E         [ 1] 2446     ld a,acc8 
      009E01 A6 03            [ 1] 2447 	jrslt loop_back   
      009E03 CD 99            [ 2] 2448 	jra loop_done  
      002344                       2449 4$: ; positive step
      009E05 81 0E 00 0E 15   [ 2] 2450 	btjt acc8,#7,loop_done 
      009E06                       2451 loop_back:
      009E06 1F 01            [ 2] 2452 	ldw x,(BPTR,sp)
      009E08 CD 97 E4         [ 2] 2453 	ldw basicptr,x 
      009E0B 1E 01 CD 94 06   [ 2] 2454 	btjf flags,#FRUN,1$ 
      009E10 AB 05            [ 1] 2455 	ld a,(2,x)
      009E12 6B 05 16         [ 1] 2456 	ld count,a
      009E15 01 AE            [ 2] 2457 1$:	ldw x,(INW,sp)
      009E17 16 90 7B         [ 2] 2458 	ldw in.w,x 
      009E1A 05               [ 4] 2459 	ret 
      00235E                       2460 loop_done:
                                   2461 	; remove loop data from stack  
      009E1B F7               [ 2] 2462 	popw x
      00235F                       2463 	_drop VSIZE 
      009E1C 5C CD            [ 2]    1     addw sp,#VSIZE 
      009E1E 94 22 1F 03      [ 1] 2464 	dec loop_depth 
      009E22 5F               [ 2] 2465 	jp (x)
                                   2466 
                                   2467 ;----------------------------
                                   2468 ; called by goto/gosub
                                   2469 ; to get target line number 
                                   2470 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                                   2471 ;    x    line address 
                                   2472 ;---------------------------
      002366                       2473 get_target_line:
      009E23 7B 05 A0         [ 4] 2474 	call next_token  
      009E26 04 97            [ 1] 2475 	cp a,#TK_INTGR
      009E28 72 FB            [ 1] 2476 	jreq get_target_line_addr 
      009E2A 03 1F            [ 1] 2477 	cp a,#TK_LABEL 
      009E2C 03 A6            [ 1] 2478 	jreq look_target_symbol 
      009E2E 32 CD 99         [ 2] 2479 	jp syntax_error
                                   2480 ; the target is a line number 
                                   2481 ; search it. 
      002374                       2482 get_target_line_addr:
      009E31 81 16            [ 2] 2483 	pushw y 
      009E33 07 CD 9A         [ 4] 2484 	call get_int24 ; line # 
      009E36 CA               [ 1] 2485 	clr a
      009E37 A1 84 27 03      [ 2] 2486 	ldw y,basicptr 
      009E3B CC 96            [ 2] 2487 	ldw y,(y)
      009E3D C2 90            [ 2] 2488 	pushw y 
      009E3F F6 93            [ 2] 2489 	cpw x,(1,sp)
      002384                       2490 	_drop 2  
      009E41 EE 01            [ 2]    1     addw sp,#2 
      009E43 72 A9            [ 1] 2491 	jrult 11$
      009E45 00               [ 1] 2492 	inc a 
      002389                       2493 11$: ; scan program for this line# 	
      009E46 03 17 07         [ 4] 2494 	call search_lineno  
      009E49 16               [ 2] 2495 	tnzw x ; 0| line# address 
      009E4A 03 90            [ 1] 2496 	jrne 2$ 
      009E4C F7 90            [ 1] 2497 	ld a,#ERR_NO_LINE 
      009E4E EF 01 72         [ 2] 2498 	jp tb_error 
      009E51 5F 00            [ 2] 2499 2$:	popw y  
      009E53 19               [ 4] 2500 	ret 
                                   2501 
                                   2502 ; the GOTO|GOSUB target is a symbol.
                                   2503 ; output:
                                   2504 ;    X    line address|0 
      002397                       2505 look_target_symbol:
      009E54 1E 01            [ 2] 2506 	pushw y 
      009E56 CD               [ 2] 2507 	pushw x 
      009E57 9D 9C 5D         [ 4] 2508 	call skip_string 
      009E5A 27 06 0D 06      [ 1] 2509 	clr acc16 
      009E5E 27 1F 20 03      [ 2] 2510 	ldw y,txtbgn 
      009E62 90 E6 03         [ 1] 2511 1$:	ld a,(3,y) ; first TK_ID on line 
      009E62 CE 00            [ 1] 2512 	cp a,#TK_LABEL 
      009E64 25 15            [ 1] 2513 	jreq 3$ 
      009E65 90 E6 02         [ 1] 2514 2$:	ld a,(2,y); line length 
      009E65 CF 00 1A         [ 1] 2515 	ld acc8,a 
      009E68 AE 16 90 7B      [ 2] 2516 	addw y,acc16 ;point to next line 
      009E6C 05 CD 88 CC      [ 2] 2517 	cpw y,txtend 
      009E70 0D 06            [ 1] 2518 	jrult 1$
      009E72 26 0B            [ 1] 2519 	ld a,#ERR_BAD_VALUE
      009E74 5F 7B 05         [ 2] 2520 	jp tb_error 
      0023C1                       2521 3$: ; found a TK_LABEL 
                                   2522 	; compare with GOTO|GOSUB target 
      009E77 97 72            [ 2] 2523 	pushw y ; line address 
      009E79 BB 00 25 CF      [ 2] 2524 	addw y,#4 ; label string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009E7D 00 25            [ 2] 2525 	ldw x,(3,sp) ; target string 
      009E7F CD 13 91         [ 4] 2526 	call strcmp
      009E7F CD 97            [ 1] 2527 	jrne 4$
      009E81 CB A1            [ 2] 2528 	popw y 
      009E83 08 26            [ 2] 2529 	jra 2$ 
      0023D2                       2530 4$: ; target found 
      009E85 03               [ 2] 2531 	popw x ;  address line target  
      0023D3                       2532 	_drop 2 ; target string 
      009E86 CC 9E            [ 2]    1     addw sp,#2 
      009E88 01 85            [ 2] 2533 	popw y 
      009E89 81               [ 4] 2534 	ret
                                   2535 
                                   2536 
                                   2537 ;--------------------------------
                                   2538 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2539 ; selective goto or gosub 
                                   2540 ;--------------------------------
      0023D8                       2541 cmd_on:
      009E89 55 00 03 00 02   [ 2] 2542 	btjt flags,#FRUN,0$ 
      009E8E A6 06            [ 1] 2543 	ld a,#ERR_RUN_ONLY
      009E8E 5B 08 90         [ 2] 2544 	jp tb_error 
      009E91 85 81 4A         [ 4] 2545 0$:	call expression 
      009E93 A1 84            [ 1] 2546 	cp a,#TK_INTGR
      009E93 CE 00            [ 1] 2547 	jreq 1$
      009E95 1E 72 B0         [ 2] 2548 	jp syntax_error
      0023EC                       2549 1$: _xpop
      009E98 00 1C            [ 1]    1     ld a,(y)
      009E9A 81               [ 1]    2     ldw x,y 
      009E9B EE 01            [ 2]    3     ldw x,(1,x)
      009E9B AE 9E DA CD      [ 2]    4     addw y,#CELL_SIZE 
                                   2550 ; the selector is the element indice 
                                   2551 ; in the list of arguments. {1..#elements} 
      009E9F 89               [ 1] 2552 	ld a,xl ; keep only bits 7..0
      009EA0 E8 CE            [ 1] 2553 	jreq 9$ ; element # begin at 1. 
      009EA2 00               [ 1] 2554 	push a  ; selector  
      009EA3 1C 35 10         [ 4] 2555 	call next_token
      009EA6 00 0B            [ 1] 2556 	cp a,#TK_CMD 
      009EA8 CD 98            [ 1] 2557 	jreq 2$ 
      009EAA 13 35 0A         [ 2] 2558 	jp syntax_error 
      002403                       2559 2$: _get_code_addr
      009EAD 00               [ 2]    1         ldw x,(x)
      009EAE 0B AE 9E EC      [ 1]    2         inc in 
      009EB2 CD 89 E8 CD      [ 1]    3         inc in 
                                   2560 ;; must be a GOTO or GOSUB 
      009EB6 9E 93 CD         [ 2] 2561 	cpw x,#goto 
      009EB9 98 13            [ 1] 2562 	jreq 4$
      009EBB AE 9E FD         [ 2] 2563 	cpw x,#gosub 
      009EBE CD 89            [ 1] 2564 	jreq 4$ 
      009EC0 E8 CE 00         [ 2] 2565 	jp syntax_error 
      002419                       2566 4$: 
      009EC3 1C               [ 1] 2567 	pop a 
      009EC4 A3               [ 2] 2568 	pushw x ; save routine address 	
      009EC5 B6               [ 1] 2569 	push a  ; selector  
      00241C                       2570 5$: ; skip elements in list until selector==0 
      009EC6 84 25            [ 1] 2571 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009EC8 05 AE            [ 1] 2572 	jreq 6$ 
                                   2573 ; can be a line# or a label 
      009ECA 9F 04 20         [ 4] 2574 	call next_token 
      009ECD 03 AE            [ 1] 2575 	cp a,#TK_INTGR 
      009ECF 9F 15            [ 1] 2576 	jreq 52$
      009ED1 CD 89            [ 1] 2577 	cp a,#TK_LABEL 
      009ED3 E8 A6            [ 1] 2578 	jreq 54$
      009ED5 0D CD 89         [ 2] 2579 	jp syntax_error 
      00242E                       2580 52$: ; got a line number 
      009ED8 8B 81 70         [ 1] 2581 	ld a,in ; skip over int24 value 
      009EDB 72 6F            [ 1] 2582 	add a,#CELL_SIZE ; integer size  
      009EDD 67 72 61         [ 1] 2583 	ld in,a 
      009EE0 6D 20            [ 2] 2584 	jra 56$
      009EE2 61 64 64         [ 4] 2585 54$: call skip_string ; skip over label 	
      00243B                       2586 56$: ; if another element comma present 
      009EE5 72 65 73         [ 4] 2587 	call next_token
      009EE8 73 3A            [ 1] 2588 	cp a,#TK_COMMA 
      009EEA 20 00            [ 1] 2589 	jreq 5$ 
                                   2590 ; arg list exhausted, selector to big 
                                   2591 ; continue execution on next line 
      002442                       2592 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EEC 2C 20            [ 2]    1     addw sp,#3 
      009EEE 70 72            [ 2] 2593 	jra 9$
      002446                       2594 6$: ;at selected position  
      002446                       2595 	_drop 1 ; discard selector
      009EF0 6F 67            [ 2]    1     addw sp,#1 
                                   2596 ; here only the routine address 
                                   2597 ; of GOTO|GOSUB is on stack 
      009EF2 72 61 6D         [ 4] 2598     call get_target_line
      009EF5 20 73 69         [ 2] 2599 	ldw ptr16,x 	
      009EF8 7A 65 3A 20 00   [ 1] 2600 	mov in,count ; move to end of line  
      009EFD 20               [ 2] 2601 	popw x ; cmd address, GOTO||GOSUB 
      009EFE 62 79 74         [ 2] 2602 	cpw x,#goto 
      009F01 65 73            [ 1] 2603 	jrne 7$ 
      009F03 00 20 69         [ 2] 2604 	ldw x,ptr16 
      009F06 6E 20            [ 2] 2605 	jra jp_to_target
      00245E                       2606 7$: 
      009F08 46 4C            [ 2] 2607 	jra gosub_2 ; target in ptr16 
      002460                       2608 9$: ; expr out of range skip to end of line
                                   2609     ; this will force a fall to next line  
      009F0A 41 53 48 20 6D   [ 1] 2610 	mov in,count
      002465                       2611 	_drop 2
      009F0F 65 6D            [ 2]    1     addw sp,#2 
      009F11 6F 72 79         [ 2] 2612 	jp next_line  
                                   2613 
                                   2614 
                                   2615 ;------------------------
                                   2616 ; BASIC: GOTO line# 
                                   2617 ; jump to line# 
                                   2618 ; here cstack is 2 call deep from interpreter 
                                   2619 ;------------------------
      00246A                       2620 goto:
      009F14 00 20 69 6E 20   [ 2] 2621 	btjt flags,#FRUN,goto_1  
      009F19 52 41            [ 1] 2622 	ld a,#ERR_RUN_ONLY
      009F1B 4D 20 6D         [ 2] 2623 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      002474                       2624 goto_1:
      009F1E 65 6D 6F         [ 4] 2625 	call get_target_line
      002477                       2626 jp_to_target:
      009F21 72 79 00         [ 2] 2627 	ldw basicptr,x 
      009F24 E6 02            [ 1] 2628 	ld a,(2,x)
      009F24 72 01 00         [ 1] 2629 	ld count,a 
      009F27 23 05 A6 07      [ 1] 2630 	mov in,#3 
      009F2B CC               [ 4] 2631 	ret 
                                   2632 
                                   2633 
                                   2634 ;--------------------
                                   2635 ; BASIC: GOSUB line#
                                   2636 ; basic subroutine call
                                   2637 ; actual line# and basicptr 
                                   2638 ; are saved on cstack
                                   2639 ; here cstack is 2 call deep from interpreter 
                                   2640 ;--------------------
                           000001  2641 	RET_ADDR=1 ; subroutine return address 
                           000003  2642 	RET_BPTR=3 ; basicptr return point 
                           000005  2643 	RET_INW=5  ; in.w return point 
                           000004  2644 	VSIZE=4 
      002484                       2645 gosub:
      009F2C 96 C4 00 22 06   [ 2] 2646 	btjt flags,#FRUN,gosub_1 
      009F2E A6 06            [ 1] 2647 	ld a,#ERR_RUN_ONLY
      009F2E CD 97 CB         [ 2] 2648 	jp tb_error 
      009F31 A1               [ 4] 2649 	ret 
      00248F                       2650 gosub_1:
      009F32 04 26 10         [ 4] 2651 	call get_target_line 
      009F35 CD 98 0D         [ 2] 2652 	ldw ptr16,x
      002495                       2653 gosub_2: 
      009F38 A4               [ 2] 2654 	popw x 
      002496                       2655 	_vars VSIZE  
      009F39 DF A1            [ 2]    1     sub sp,#VSIZE 
      009F3B 43               [ 2] 2656 	pushw x ; RET_ADDR 
                                   2657 ; save BASIC subroutine return point.   
      009F3C 26 04 CD         [ 2] 2658 	ldw x,basicptr
      009F3F 9D 07            [ 2] 2659 	ldw (RET_BPTR,sp),x 
      009F41 81 CC 96         [ 2] 2660 	ldw x,in.w 
      009F44 C2 55            [ 2] 2661 	ldw (RET_INW,sp),x
      009F46 00 03 00         [ 2] 2662 	ldw x,ptr16  
      009F49 02 CD            [ 2] 2663 	jra jp_to_target
                                   2664 
                                   2665 ;------------------------
                                   2666 ; BASIC: RETURN 
                                   2667 ; exit from BASIC subroutine 
                                   2668 ;------------------------
      0024A8                       2669 return:
      009F4B 9E 93 22 01 81   [ 2] 2670 	btjt flags,#FRUN,0$ 
      009F50 52 06            [ 1] 2671 	ld a,#ERR_RUN_ONLY
      009F52 CE 00 1C         [ 2] 2672 	jp tb_error 
      0024B2                       2673 0$:	
      009F55 1F 05            [ 2] 2674 	ldw x,(RET_BPTR,sp) 
      009F57 FE 1F 01         [ 2] 2675 	ldw basicptr,x
      009F5A AE 7F            [ 1] 2676 	ld a,(2,x)
      009F5C FF 1F 03         [ 1] 2677 	ld count,a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009F5F CD 99            [ 2] 2678 	ldw x,(RET_INW,sp)
      009F61 93 4D 27         [ 2] 2679 	ldw in.w,x 
      009F64 31               [ 2] 2680 	popw x 
      0024C2                       2681 	_drop VSIZE 
      009F65 A1 02            [ 2]    1     addw sp,#VSIZE 
      009F67 27               [ 2] 2682 	jp (x)
                                   2683 
                                   2684 
                                   2685 ;----------------------------------
                                   2686 ; BASIC: RUN
                                   2687 ; run BASIC program in RAM
                                   2688 ;----------------------------------- 
      0024C5                       2689 run: 
      009F68 07 A1 01 27 06   [ 2] 2690 	btjf flags,#FRUN,0$  
      009F6D CC               [ 1] 2691 	clr a 
      009F6E 96               [ 4] 2692 	ret
      0024CC                       2693 0$: 
      009F6F C2 85 1F 05 12   [ 2] 2694 	btjf flags,#FBREAK,1$
      009F73                       2695 	_drop 2 
      009F73 85 1F            [ 2]    1     addw sp,#2 
      009F75 01 20 4A         [ 4] 2696 	call rest_context
      009F76                       2697 	_drop CTXT_SIZE 
      009F76 CE 00            [ 2]    1     addw sp,#CTXT_SIZE 
      009F78 1C 1F 05 C3      [ 1] 2698 	bres flags,#FBREAK 
      009F7C 00 1E 2A 38      [ 1] 2699 	bset flags,#FRUN 
      009F80 FE 13 01         [ 2] 2700 	jp interpreter 
      009F83 2A 11 1E         [ 2] 2701 1$:	ldw x,txtbgn
      009F86 05 E6 02         [ 2] 2702 	cpw x,txtend 
      009F89 C7 00            [ 1] 2703 	jrmi run_it 
      009F8B 0F 72 5F         [ 2] 2704 	ldw x,#err_no_prog
      009F8E 00 0E 72         [ 4] 2705 	call puts 
      009F91 BB 00 0E 20 E3   [ 1] 2706 	mov in,count
      009F96 81               [ 4] 2707 	ret 
      0024F7                       2708 run_it:	 
      0024F7                       2709 	_drop 2 ; drop return address 
      009F96 1E 05            [ 2]    1     addw sp,#2 
      0024F9                       2710 run_it_02: 
      009F98 E6 02 CD         [ 4] 2711     call ubound 
      009F9B A0 0D 1E         [ 4] 2712 	call clear_vars 
                                   2713 ; clear data pointer 
      009F9E 05               [ 1] 2714 	clrw x 
      009F9F E6 02 C7         [ 2] 2715 	ldw data_ptr,x 
      009FA2 00 0F 72 5F      [ 1] 2716 	clr data_ofs 
      009FA6 00 0E 72 BB      [ 1] 2717 	clr data_len 
                                   2718 ; initialize BASIC pointer 
      009FAA 00 0E C3         [ 2] 2719 	ldw x,txtbgn 
      009FAD 00 1E 2A         [ 2] 2720 	ldw basicptr,x 
      009FB0 07 1F            [ 1] 2721 	ld a,(2,x)
      009FB2 05 FE 13         [ 1] 2722 	ld count,a
      009FB5 03 2F DE 01      [ 1] 2723 	mov in,#3	
      009FB8 72 10 00 22      [ 1] 2724 	bset flags,#FRUN 
      009FB8 55 00 04         [ 2] 2725 	jp interpreter 
                                   2726 
                                   2727 
                                   2728 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   2729 ; BASIC: END
                                   2730 ; end running program
                                   2731 ;---------------------- 
      002521                       2732 cmd_end: 
                                   2733 ; clean stack 
      009FBB 00 02 AE         [ 2] 2734 	ldw x,#STACK_EMPTY
      009FBE 16               [ 1] 2735 	ldw sp,x 
      009FBF E0 CF 00         [ 2] 2736 	jp warm_start
                                   2737 
                                   2738 ;---------------------------
                                   2739 ; BASIC: GET var 
                                   2740 ; receive a key in variable 
                                   2741 ; don't wait 
                                   2742 ;---------------------------
      002528                       2743 cmd_get:
      009FC2 05 5B 06         [ 4] 2744 	call next_token 
      009FC5 CD 9E            [ 1] 2745 	cp a,#TK_VAR 
      009FC7 9B 81            [ 1] 2746 	jreq 0$
      009FC9 CC 16 42         [ 2] 2747 	jp syntax_error 
      009FC9 CD A8 10         [ 4] 2748 0$: call get_addr 
      009FCC 27 07 AE         [ 2] 2749 	ldw ptr16,x 
      009FCF 9F F6 CD         [ 4] 2750 	call qgetc 
      009FD2 89 E8            [ 1] 2751 	jreq 2$
      009FD4 81 09 1B         [ 4] 2752 	call getc  
      009FD5 72 3F 00 19      [ 4] 2753 2$: clr [ptr16]
      009FD5 90 AE B6 80      [ 1] 2754 	inc ptr8 
      009FD9 CE B6 82 1C      [ 4] 2755 	clr [ptr16]
      009FDD 00 04 CF 00      [ 1] 2756 	inc ptr8 
      009FE1 0E AE 00 7C      [ 4] 2757 	ld [ptr16],a 
      009FE5 CD               [ 4] 2758 	ret 
                                   2759 
                                   2760 
                                   2761 ;-----------------
                                   2762 ; 1 Khz beep 
                                   2763 ;-----------------
      002555                       2764 beep_1khz:: 
      009FE6 94 32            [ 2] 2765 	pushw y 
      009FE8 AE 00 80         [ 2] 2766 	ldw x,#100
      009FEB CF 00 1C 72      [ 2] 2767 	ldw y,#1000
      009FEF BB 00            [ 2] 2768 	jra beep
                                   2769 
                                   2770 ;-----------------------
                                   2771 ; BASIC: TONE expr1,expr2
                                   2772 ; used TIMER2 channel 1
                                   2773 ; to produce a tone 
                                   2774 ; arguments:
                                   2775 ;    expr1   frequency 
                                   2776 ;    expr2   duration msec.
                                   2777 ;---------------------------
      002560                       2778 tone:
      009FF1 7E CF            [ 2] 2779 	pushw y 
      009FF3 00 1E 81         [ 4] 2780 	call arg_list 
      009FF6 4E 6F            [ 1] 2781 	cp a,#2 
      009FF8 20 61            [ 1] 2782 	jreq 1$
      009FFA 70 70 6C         [ 2] 2783 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00256C                       2784 1$: 
      00256C                       2785 	_xpop 
      009FFD 69 63            [ 1]    1     ld a,(y)
      009FFF 61               [ 1]    2     ldw x,y 
      00A000 74 69            [ 2]    3     ldw x,(1,x)
      00A002 6F 6E 20 73      [ 2]    4     addw y,#CELL_SIZE 
      00A006 61               [ 2] 2786 	pushw x ; duration 
      002576                       2787 	_xpop ; frequency
      00A007 76 65            [ 1]    1     ld a,(y)
      00A009 64               [ 1]    2     ldw x,y 
      00A00A 2E 0A            [ 2]    3     ldw x,(1,x)
      00A00C 00 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A00D 90 93            [ 1] 2788 	ldw y,x ; frequency 
      00A00D 90               [ 2] 2789 	popw x  ; duration 
      002582                       2790 beep:  
      00A00E 89               [ 2] 2791 	pushw x 
      00A00F C7 00 04         [ 2] 2792 	ldw x,#TIM2_CLK_FREQ
      00A012 E6               [ 2] 2793 	divw x,y ; cntr=Fclk/freq 
                                   2794 ; round to nearest integer 
      00A013 02 C1 00 04      [ 2] 2795 	cpw y,#TIM2_CLK_FREQ/2
      00A017 2A 03            [ 1] 2796 	jrmi 2$
      00A019 C7               [ 1] 2797 	incw x 
      00258E                       2798 2$:	 
      00A01A 00               [ 1] 2799 	ld a,xh 
      00A01B 04 CF 00         [ 1] 2800 	ld TIM2_ARRH,a 
      00A01E 05               [ 1] 2801 	ld a,xl 
      00A01F 90 AE 16         [ 1] 2802 	ld TIM2_ARRL,a 
                                   2803 ; 50% duty cycle 
      00A022 90               [ 1] 2804 	ccf 
      00A023 CD               [ 2] 2805 	rrcw x 
      00A024 92               [ 1] 2806 	ld a,xh 
      00A025 22 CD 89         [ 1] 2807 	ld TIM2_CCR1H,a 
      00A028 E8               [ 1] 2808 	ld a,xl
      00A029 A6 0D CD         [ 1] 2809 	ld TIM2_CCR1L,a
      00A02C 89 8B 90 85      [ 1] 2810 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A030 81 10 53 00      [ 1] 2811 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A031 72 10 53 04      [ 1] 2812 	bset TIM2_EGR,#TIM2_EGR_UG
      00A031 52               [ 2] 2813 	popw x 
      00A032 01 29 EE         [ 4] 2814 	call pause02
      00A033 72 11 53 08      [ 1] 2815 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A033 0F 01 53 00      [ 1] 2816 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A035 90 85            [ 2] 2817 	popw y 
      00A035 CD               [ 4] 2818 	ret 
                                   2819 
                                   2820 ;-------------------------------
                                   2821 ; BASIC: ADCON 0|1 [,divisor]  
                                   2822 ; disable/enanble ADC 
                                   2823 ;-------------------------------
                           000003  2824 	ONOFF=3 
                           000001  2825 	DIVSOR=1
                           000004  2826 	VSIZE=4 
      0025BB                       2827 power_adc:
      00A036 97 CB A1         [ 4] 2828 	call arg_list 
      00A039 02 25            [ 1] 2829 	cp a,#2	
      00A03B 08 A1            [ 1] 2830 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A03D 0A 27            [ 1] 2831 	cp a,#1 
      00A03F 04 A1            [ 1] 2832 	jreq 0$ 
      00A041 80 26 07         [ 2] 2833 	jp syntax_error 
      00A044 4F               [ 1] 2834 0$:	clr a 
      00A044 55               [ 1] 2835 	clrw x
      0025CB                       2836 	_xpush   ; divisor  
      00A045 00 03 00 02      [ 2]    1     subw y,#CELL_SIZE
      00A049 20 63            [ 1]    2     ld (y),a 
      00A04B 90 EF 01         [ 2]    3     ldw (1,y),x 
      0025D4                       2837 1$: _at_next 
      00A04B A1 02 27         [ 1]    1     ld a,(3,y)
      00A04E 12               [ 1]    2     ldw x,y 
      00A04F A1 04            [ 2]    3     ldw x,(4,x)
      00A051 27               [ 2] 2838 	tnzw x 
      00A052 1B A1            [ 1] 2839 	jreq 2$ 
      0025DD                       2840 	_xpop
      00A054 82 27            [ 1]    1     ld a,(y)
      00A056 1F               [ 1]    2     ldw x,y 
      00A057 A1 08            [ 2]    3     ldw x,(1,x)
      00A059 27 2A A1 09      [ 2]    4     addw y,#CELL_SIZE 
      0025E6                       2841 	_xdrop  
      00A05D 27 2A 20 3D      [ 2]    1     addw y,#CELL_SIZE 
      00A061 9F               [ 1] 2842 	ld a,xl
      00A061 CD 89            [ 1] 2843 	and a,#7
      00A063 E8               [ 1] 2844 	swap a 
      00A064 5C 72 B0         [ 1] 2845 	ld ADC_CR1,a
      00A067 00 05 CF 00      [ 1] 2846 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A06B 01 20 C5 01      [ 1] 2847 	bset ADC_CR1,#ADC_CR1_ADON 
      00A06E                       2848 	_usec_dly 7 
      00A06E CD 98 0D         [ 2]    1     ldw x,#(16*7-2)/4
      00A071 CD               [ 2]    2     decw x
      00A072 89               [ 1]    3     nop 
      00A073 8B 20            [ 1]    4     jrne .-4
      00A075 BD 08            [ 2] 2849 	jra 3$
      00A076 72 11 54 01      [ 1] 2850 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A076 FE 72 5C 00      [ 1] 2851 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00260A                       2852 3$:	
      00A07A 02               [ 4] 2853 	ret
                                   2854 
                                   2855 ;-----------------------------
                                   2856 ; BASIC: ADCREAD (channel)
                                   2857 ; read adc channel {0..5}
                                   2858 ; output:
                                   2859 ;   A 		TK_INTGR 
                                   2860 ;   X 		value 
                                   2861 ;-----------------------------
      00260B                       2862 analog_read:
      00A07B 72 5C 00         [ 4] 2863 	call func_args 
      00A07E 02 FD            [ 1] 2864 	cp a,#1 
      00A080 CD 89            [ 1] 2865 	jreq 1$
      00A082 8B 20 AE         [ 2] 2866 	jp syntax_error
      00A085                       2867 1$: _xpop 
      00A085 03 01            [ 1]    1     ld a,(y)
      00A087 20               [ 1]    2     ldw x,y 
      00A088 AC 01            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A089 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A089 CD 97 CB         [ 2] 2868 	cpw x,#5 
      00A08C A1 84            [ 2] 2869 	jrule 2$
      00A08E 27 03            [ 1] 2870 	ld a,#ERR_BAD_VALUE
      00A090 CC 96 C2         [ 2] 2871 	jp tb_error 
      00A093 9F               [ 1] 2872 2$: ld a,xl
      00A093 CD 97 FD         [ 1] 2873 	ld acc8,a 
      00A096 9F A4            [ 1] 2874 	ld a,#5
      00A098 0F C7 00         [ 1] 2875 	sub a,acc8 
      00A09B 24 20 95         [ 1] 2876 	ld ADC_CSR,a
      00A09E 72 16 54 02      [ 1] 2877 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A09E 55 00 03 00      [ 1] 2878 	bset ADC_CR1,#ADC_CR1_ADON
      00A0A2 02 CD 9B E3 4D   [ 2] 2879 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0A7 27 05 CD         [ 2] 2880 	ldw x,ADC_DRH
      00A0AA 98 38            [ 1] 2881 	ld a,#TK_INTGR
      00A0AC 20               [ 4] 2882 	ret 
                                   2883 
                                   2884 ;-----------------------
                                   2885 ; BASIC: DREAD(pin)
                                   2886 ; Arduino pins 
                                   2887 ; read state of a digital pin 
                                   2888 ; pin# {0..15}
                                   2889 ; output:
                                   2890 ;    A 		TK_INTGR
                                   2891 ;    X      0|1 
                                   2892 ;-------------------------
                           000001  2893 	PINNO=1
                           000001  2894 	VSIZE=1
      002647                       2895 digital_read:
      002647                       2896 	_vars VSIZE 
      00A0AD 85 01            [ 2]    1     sub sp,#VSIZE 
      00A0AE CD 19 0E         [ 4] 2897 	call func_args
      00A0AE 0D 01            [ 1] 2898 	cp a,#1
      00A0B0 26 05            [ 1] 2899 	jreq 1$
      00A0B2 A6 0D CD         [ 2] 2900 	jp syntax_error
      002653                       2901 1$: _xpop 
      00A0B5 89 8B            [ 1]    1     ld a,(y)
      00A0B7 5B               [ 1]    2     ldw x,y 
      00A0B8 01 81            [ 2]    3     ldw x,(1,x)
      00A0BA 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0BA CE 00 05         [ 2] 2902 	cpw x,#15 
      00A0BD 1F 03            [ 2] 2903 	jrule 2$
      00A0BF C6 00            [ 1] 2904 	ld a,#ERR_BAD_VALUE
      00A0C1 02 6B 05         [ 2] 2905 	jp tb_error 
      00A0C4 C6 00 04         [ 4] 2906 2$:	call select_pin 
      00A0C7 6B 06            [ 1] 2907 	ld (PINNO,sp),a
      00A0C9 81 01            [ 1] 2908 	ld a,(GPIO_IDR,x)
      00A0CA 0D 01            [ 1] 2909 	tnz (PINNO,sp)
      00A0CA 1E 03            [ 1] 2910 	jreq 8$
      00A0CC CF               [ 1] 2911 3$: srl a 
      00A0CD 00 05            [ 1] 2912 	dec (PINNO,sp)
      00A0CF 7B 05            [ 1] 2913 	jrne 3$ 
      00A0D1 C7 00            [ 1] 2914 8$: and a,#1 
      00A0D3 02               [ 1] 2915 	clrw x 
      00A0D4 7B               [ 1] 2916 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A0D5 06               [ 1] 2917 	clr a 
      00267B                       2918 	_drop VSIZE
      00A0D6 C7 00            [ 2]    1     addw sp,#VSIZE 
      00A0D8 04               [ 4] 2919 	ret
                                   2920 
                                   2921 
                                   2922 ;-----------------------
                                   2923 ; BASIC: DWRITE pin,0|1
                                   2924 ; Arduino pins 
                                   2925 ; write to a digital pin 
                                   2926 ; pin# {0..15}
                                   2927 ; output:
                                   2928 ;    A 		TK_INTGR
                                   2929 ;    X      0|1 
                                   2930 ;-------------------------
                           000001  2931 	PINNO=1
                           000002  2932 	PINVAL=2
                           000002  2933 	VSIZE=2
      00267E                       2934 digital_write:
      00267E                       2935 	_vars VSIZE 
      00A0D9 81 02            [ 2]    1     sub sp,#VSIZE 
      00A0DA CD 19 13         [ 4] 2936 	call arg_list  
      00A0DA 90 89            [ 1] 2937 	cp a,#2 
      00A0DC 52 05            [ 1] 2938 	jreq 1$
      00A0DE CC 16 42         [ 2] 2939 	jp syntax_error
      00268A                       2940 1$: _xpop 
      00A0DE 0F 05            [ 1]    1     ld a,(y)
      00A0E0 CD               [ 1]    2     ldw x,y 
      00A0E1 97 CB            [ 2]    3     ldw x,(1,x)
      00A0E3 A1 02 26 10      [ 2]    4     addw y,#CELL_SIZE 
      00A0E7 CD               [ 1] 2941 	ld a,xl 
      00A0E8 89 E8            [ 1] 2942 	ld (PINVAL,sp),a
      002696                       2943 	_xpop 
      00A0EA 5C 72            [ 1]    1     ld a,(y)
      00A0EC B0               [ 1]    2     ldw x,y 
      00A0ED 00 05            [ 2]    3     ldw x,(1,x)
      00A0EF CF 00 01 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0F3 05 CD 97         [ 2] 2944 	cpw x,#15 
      00A0F6 CB A1            [ 2] 2945 	jrule 2$
      00A0F8 85 27            [ 1] 2946 	ld a,#ERR_BAD_VALUE
      00A0FA 03 CC 96         [ 2] 2947 	jp tb_error 
      00A0FD C2 CD 97         [ 4] 2948 2$:	call select_pin 
      00A100 F3 CF            [ 1] 2949 	ld (PINNO,sp),a 
      00A102 00 1A            [ 1] 2950 	ld a,#1
      00A104 0D 05            [ 1] 2951 	tnz (PINNO,sp)
      00A106 26 06            [ 1] 2952 	jreq 4$
      00A108 CD               [ 1] 2953 3$: sll a
      00A109 92 18            [ 1] 2954 	dec (PINNO,sp)
      00A10B CD 89            [ 1] 2955 	jrne 3$
      00A10D 8B 02            [ 1] 2956 4$: tnz (PINVAL,sp)
      00A10E 26 05            [ 1] 2957 	jrne 5$
      00A10E A6               [ 1] 2958 	cpl a 
      00A10F 3A CD            [ 1] 2959 	and a,(GPIO_ODR,x)
      00A111 89 8B            [ 2] 2960 	jra 8$
      00A113 CD A0            [ 1] 2961 5$: or a,(GPIO_ODR,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A115 BA 72            [ 1] 2962 8$: ld (GPIO_ODR,x),a 
      0026C6                       2963 	_drop VSIZE 
      00A117 5F 00            [ 2]    1     addw sp,#VSIZE 
      00A119 04               [ 4] 2964 	ret
                                   2965 
                                   2966 
                                   2967 ;-----------------------
                                   2968 ; BASIC: STOP
                                   2969 ; stop progam execution  
                                   2970 ; without resetting pointers 
                                   2971 ; the program is resumed
                                   2972 ; with RUN 
                                   2973 ;-------------------------
      0026C9                       2974 stop:
      00A11A CD 8A ED AE 16   [ 2] 2975 	btjt flags,#FRUN,2$
      00A11F 90               [ 1] 2976 	clr a
      00A120 3B               [ 4] 2977 	ret 
      0026D0                       2978 2$:	 
                                   2979 ; create space on cstack to save context 
      00A121 00 04 4B         [ 2] 2980 	ldw x,#break_point 
      00A124 00 72 FB         [ 4] 2981 	call puts 
      0026D6                       2982 	_drop 2 ;drop return address 
      00A127 01 5C            [ 2]    1     addw sp,#2 
      0026D8                       2983 	_vars CTXT_SIZE ; context size 
      00A129 5B 02            [ 2]    1     sub sp,#CTXT_SIZE 
      00A12B 72 5F 00         [ 4] 2984 	call save_context 
      00A12E 02 CD 8F         [ 2] 2985 	ldw x,#tib 
      00A131 62 A1 84         [ 2] 2986 	ldw basicptr,x
      00A134 27               [ 1] 2987 	clr (x)
      00A135 14 A1 11 26      [ 1] 2988 	clr count  
      00A139 07               [ 1] 2989 	clrw x 
      00A13A CD 8F 62         [ 2] 2990 	ldw in.w,x
      00A13D A1 84 27 06      [ 1] 2991 	bres flags,#FRUN 
      00A141 72 18 00 22      [ 1] 2992 	bset flags,#FBREAK
      00A141 CD A0 CA         [ 2] 2993 	jp interpreter 
      00A144 CC 96 C2 65 61 6B 20  2994 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2995 
                                   2996 ;-----------------------
                                   2997 ; BASIC: NEW
                                   2998 ; from command line only 
                                   2999 ; free program memory
                                   3000 ; and clear variables 
                                   3001 ;------------------------
      00A147                       3002 new: 
      00A147 CD 82 98 22 01   [ 2] 3003 	btjf flags,#FRUN,0$ 
      00A14A 81               [ 4] 3004 	ret 
      00271B                       3005 0$:	
      00A14A C6 00 0D         [ 4] 3006 	call clear_basic 
      00A14D CE               [ 4] 3007 	ret 
                                   3008 
                                   3009 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3010 ; BASIC: ERASE \E | \F 
                                   3011 ; erase all block in range from 
                                   3012 ;  'app_space' to FLASH end (0x20000)
                                   3013 ;  or all EEPROM 
                                   3014 ; that contains a non zero byte.  
                                   3015 ;-----------------------------------
                           000001  3016 	LIMIT=1 
                           000003  3017 	VSIZE = 3 
      00271F                       3018 erase:
      00A14E 00 0E 72 C7      [ 1] 3019 	clr farptr 
      002723                       3020 	_vars VSIZE 
      00A152 00 1A            [ 2]    1     sub sp,#VSIZE 
      00A154 72 5C 00         [ 4] 3021 	call next_token 
      00A157 1B 72            [ 1] 3022 	cp a,#TK_CHAR 
      00A159 CF 00            [ 1] 3023 	jreq 0$ 
      00A15B 1A CD A0         [ 2] 3024 	jp syntax_error
      00A15E CA CD 97         [ 4] 3025 0$: call get_char 
      00A161 CB A1            [ 1] 3026 	and a,#0XDF 
      00A163 08 26            [ 1] 3027 	cp a,#'E
      00A165 03 CC            [ 1] 3028 	jrne 1$
      00A167 A0 DE 00         [ 2] 3029 	ldw x,#EEPROM_BASE 
      00A169 CF 00 19         [ 2] 3030 	ldw farptr+1,x 
      00A169 A1 00 27         [ 2] 3031 	ldw x,#EEPROM_END
      00A16C 07               [ 1] 3032 	clr a 
      00A16D A1 0A            [ 2] 3033 	jra 3$ 
      00A16F 27 03            [ 1] 3034 1$: cp a,#'F 
      00A171 CC 96            [ 1] 3035 	jreq 2$
      00A173 C2 15 82         [ 2] 3036 	ldw x,#err_bad_value
      00A174 CC 16 44         [ 2] 3037 	jp tb_error
      00274E                       3038 2$:
      00A174 5B 05 90         [ 2] 3039 	ldw x,#app_space  
      00A177 85 81 19         [ 2] 3040 	ldw farptr+1,x 
      00A179 A6 02            [ 1] 3041 	ld a,#(FLASH_END>>16)&0XFF 
      00A179 55 00 04         [ 2] 3042 	ldw x,#FLASH_END&0xffff
      002759                       3043 3$:
      00A17C 00 02            [ 1] 3044 	ld (LIMIT,sp),a 
      00A17E 81 02            [ 2] 3045 	ldw (LIMIT+1,sp),x 
                                   3046  ; operation done from RAM
                                   3047  ; copy code to RAM in tib   
      00A17F CD 07 09         [ 4] 3048 	call move_erase_to_ram
      002760                       3049 4$:	 
      00A17F 52 04 0F         [ 4] 3050     call scan_block 
      00A182 01 CD            [ 1] 3051 	jreq 5$  ; block already erased 
      00A184 99 93            [ 1] 3052     ld a,#'E 
      00A186 A1 02 24         [ 4] 3053     call putc 
      00A189 03 CC 96         [ 4] 3054 	call block_erase   
                                   3055 ; this block is clean, next  
      00A18C C2 A1 03         [ 2] 3056 5$:	ldw x,#BLOCK_SIZE
      00A18F 25 0C 90         [ 4] 3057 	call incr_farptr
                                   3058 ; check limit, 24 bit substraction  	
      00A192 F6 93            [ 1] 3059 	ld a,(LIMIT,sp)
      00A194 EE 01            [ 2] 3060 	ldw x,(LIMIT+1,sp)
      00A196 72 A9 00 03      [ 2] 3061 	subw x,farptr+1
      00A19A 9F 6B 01         [ 1] 3062 	sbc a,farptr 
      00A19D 90 F6            [ 1] 3063 	jrugt 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A19F 93 EE 01         [ 4] 3064 9$: call clear_basic
      00A1A2 72 A9            [ 2] 3065 	ldw x,(LIMIT+1,sp)
      00A1A4 00 03 9F         [ 2] 3066 	cpw x,#EEPROM_END
      00A1A7 6B 02            [ 1] 3067 	jrne 10$
      00A1A9 90 F6 93         [ 4] 3068 	call func_eefree 
      00278D                       3069 10$:
      00278D                       3070 	_drop VSIZE 
      00A1AC EE 01            [ 2]    1     addw sp,#VSIZE 
      00A1AE 72               [ 4] 3071 	ret 
                                   3072 	
                                   3073 
                                   3074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3075 ;  check for application signature 
                                   3076 ; output:
                                   3077 ;   Carry    0 app present 
                                   3078 ;            1 no app installed  
                                   3079 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002790                       3080 qsign: 
      00A1AF A9 00 03         [ 2] 3081 	ldw x,app_sign 
      00A1B2 F6 14 02         [ 2] 3082 	cpw x,SIGNATURE ; "BC" 
      00A1B5 18               [ 4] 3083 	ret 
                                   3084 
                                   3085 ;--------------------------------------
                                   3086 ;  fill write buffer 
                                   3087 ;  input:
                                   3088 ;    y  point to output buffer 
                                   3089 ;    x  point to source 
                                   3090 ;    a  bytes to write in buffer 
                                   3091 ;  output:
                                   3092 ;    y   += A 
                                   3093 ;    X   += A 
                                   3094 ;    A   0 
                                   3095 ;---------------------------------------
      002797                       3096 fill_write_buffer:
      00A1B6 01               [ 1] 3097 	push a 
      00A1B7 27               [ 1] 3098 	tnz a 
      00A1B8 F9 5B            [ 1] 3099 	jreq 9$ 
      00A1BA 04               [ 1] 3100 1$: ld a,(x)
      00A1BB 81               [ 1] 3101 	incw x 
      00A1BC 90 F7            [ 1] 3102 	ld (y),a 
      00A1BC CD 99            [ 1] 3103 	incw y 
      00A1BE 93 A1            [ 1] 3104 	dec (1,sp) 
      00A1C0 02 27            [ 1] 3105 	jrne 1$ 
      00A1C2 03               [ 1] 3106 9$:	pop a 
      00A1C3 CC               [ 4] 3107     ret 	
                                   3108 
                                   3109 ;--------------------------------------
                                   3110 ;  fill pad buffer with zero 
                                   3111 ;  input:
                                   3112 ;	none 
                                   3113 ;  output:
                                   3114 ;    y     buffer address  
                                   3115 ;--------------------------------------
      0027A7                       3116 clear_block_buffer:
      00A1C4 96               [ 1] 3117 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A1C5 C2 AE 16 E0      [ 2] 3118 	ldw y,#block_buffer 
      00A1C6 90 89            [ 2] 3119 	pushw y
      00A1C6 90 F6            [ 1] 3120 	ld a,#BLOCK_SIZE   
      00A1C8 93 EE            [ 1] 3121 1$:	clr (y)
      00A1CA 01 72            [ 1] 3122 	incw y
      00A1CC A9               [ 1] 3123 	dec a  
      00A1CD 00 03            [ 1] 3124 	jrne 1$ 	
      00A1CF 9F 88            [ 2] 3125 9$: popw y 
      00A1D1 90               [ 1] 3126 	pop a 			
      00A1D2 F6               [ 4] 3127 	ret 
                                   3128 
                                   3129 
                                   3130 ;---------------------------------------
                                   3131 ; BASIC: SAVE
                                   3132 ; write application from RAM to FLASH
                                   3133 ;--------------------------------------
                           000001  3134 	XTEMP=1
                           000003  3135 	COUNT=3  ; last count bytes written 
                           000004  3136 	CNT_LO=4 ; count low byte 
                           000005  3137 	TOWRITE=5 ; how bytes left to write  
                           000006  3138 	VSIZE=6 
      0027BB                       3139 save_app:
      00A1D3 93               [ 2] 3140 	pushw x 
      00A1D4 EE 01            [ 2] 3141 	pushw y 
      0027BE                       3142 	_vars VSIZE
      00A1D6 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A1D8 00 03 84         [ 4] 3143 	call qsign 
      00A1DB FA F7            [ 1] 3144 	jrne 1$
      00A1DD 81 28 52         [ 2] 3145 	ldw x,#CANT_DO 
      00A1DE CD 09 68         [ 4] 3146 	call puts 
      00A1DE CD 99 93         [ 2] 3147 	jp 9$
      0027CE                       3148 1$: 
      00A1E1 A1 02 27         [ 2] 3149 	ldw x,txtbgn
      00A1E4 03 CC 96         [ 2] 3150 	cpw x,txtend 
      00A1E7 C2 09            [ 1] 3151 	jrult 2$ 
      00A1E8 AE 28 94         [ 2] 3152 	ldw x,#NO_APP
      00A1E8 90 F6 93         [ 4] 3153 	call puts 
      00A1EB EE 01 72         [ 2] 3154 	jp 9$
      0027DF                       3155 2$: 
                                   3156 ; block programming flash
                                   3157 ; must be done from RAM
                                   3158 ; moved in tib  
      00A1EE A9 00 03         [ 4] 3159 	call move_prg_to_ram
                                   3160 ; initialize farptr 
                                   3161 ; to app_sign address 
      00A1F1 9F 43 88 90      [ 1] 3162 	clr farptr 
      00A1F5 F6 93 EE         [ 2] 3163 	ldw x,#app_sign 
      00A1F8 01 72 A9         [ 2] 3164 	ldw farptr+1,x
                                   3165 ; initialize local variables 
      00A1FB 00 03 84         [ 4] 3166 	call prog_size
      00A1FE F4 F7            [ 2] 3167 	ldw (TOWRITE,sp),x
      00A200 81 03            [ 1] 3168 	clr (COUNT,sp)
                                   3169 ; first bock 
                                   3170 ; containt signature 2 bytes 
                                   3171 ; and size 	2 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   3172 ; use Y as pointer to block_buffer
      00A201 CD 27 A7         [ 4] 3173 	call clear_block_buffer ; -- y=*block_buffer	
                                   3174 ; write signature
      00A201 CD 99 93         [ 2] 3175 	ldw x,SIGNATURE ; "BC" 
      00A204 A1 02            [ 2] 3176 	ldw (y),x 
      00A206 27 03 CC 96      [ 2] 3177 	addw y,#2
      00A20A C2 90            [ 2] 3178 	ldw x,(TOWRITE,sp)
      00A20C F6 93            [ 2] 3179 	ldw (y),x
      00A20E EE 01 72 A9      [ 2] 3180 	addw y,#2   
      00A212 00 03            [ 1] 3181 	ld a,#(BLOCK_SIZE-4)
      00A214 9F 88            [ 1] 3182 	ld (CNT_LO,sp),a 
      00A216 90 F6 93         [ 2] 3183 	cpw x,#(BLOCK_SIZE-4) 
      00A219 EE 01            [ 1] 3184 	jrugt 3$
      00A21B 72               [ 1] 3185 	ld a,xl 
      00A21C A9 00            [ 1] 3186 3$:	ld (CNT_LO,sp),a   
      00A21E 03 84 F8         [ 2] 3187 	ldw x,txtbgn 
      00A221 F7 81            [ 2] 3188 	ldw (XTEMP,sp),x 
      00A223                       3189 32$: 
      00A223 CD 99            [ 2] 3190 	ldw x,(XTEMP,sp)
      00A225 8E A1            [ 1] 3191 	ld a,(CNT_LO,sp)
      00A227 02 27 03         [ 4] 3192 	call fill_write_buffer 
      00A22A CC 96            [ 2] 3193 	ldw (XTEMP,sp),x 
      00A22C C2 16 E0         [ 2] 3194 	ldw x,#block_buffer
      00A22D CD 07 63         [ 4] 3195 	call write_buffer
      00A22D 90 F6 93         [ 2] 3196 	ldw x,#BLOCK_SIZE 
      00A230 EE 01 72         [ 4] 3197 	call incr_farptr  
                                   3198 ; following blocks 
      00A233 A9 00            [ 2] 3199 	ldw x,(XTEMP,sp)
      00A235 03 9F A4         [ 2] 3200 	cpw x,txtend 
      00A238 07 88            [ 1] 3201 	jruge 9$ 
      00A23A A6 01            [ 2] 3202 	ldw x,(TOWRITE,sp)
      00A23C 0D 01 27         [ 2] 3203 	subw x,(COUNT,sp)
      00A23F 05 48            [ 2] 3204 	ldw (TOWRITE,sp),x 
      00A241 0A 01            [ 1] 3205 	ld a,#BLOCK_SIZE 
      00A243 20 F7 6B         [ 2] 3206 	cpw x,#BLOCK_SIZE 
      00A246 01 90            [ 1] 3207 	jruge 4$ 
      00A248 F6               [ 1] 3208 	ld a,xl 
      00A249 93 EE            [ 1] 3209 4$:	ld (CNT_LO,sp),a 
      00A24B 01 72 A9         [ 4] 3210 	call clear_block_buffer 
      00A24E 00 03            [ 2] 3211 	jra 32$ 
      00284A                       3212 9$:	_drop VSIZE 
      00A250 84 F4            [ 2]    1     addw sp,#VSIZE 
      00A252 27 02            [ 2] 3213     popw y 
      00A254 A6               [ 2] 3214 	popw x 
      00A255 01               [ 4] 3215 	ret 
                                   3216 
                                   3217 
      00A256 5F 97                 3218 SIGNATURE: .ascii "BC"
      00A258 4F 81 6E 27 74 20 66  3219 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A25A 4E 6F 20 61 70 70 6C  3220 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3221 
                                   3222 ;---------------------
                                   3223 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3224 ; write 1 or more byte to FLASH or EEPROM
                                   3225 ; starting at address  
                                   3226 ; input:
                                   3227 ;   expr1  	is address 
                                   3228 ;   expr2,...,exprn   are bytes to write
                                   3229 ; output:
                                   3230 ;   none 
                                   3231 ;---------------------
      0028AA                       3232 write:
      00A25A CD 99 93         [ 4] 3233 	call expression
      00A25D A1 02            [ 1] 3234 	cp a,#TK_INTGR 
      00A25F 27 03            [ 1] 3235 	jreq 0$
      00A261 CC 96 C2         [ 2] 3236 	jp syntax_error
      00A264                       3237 0$: _xpop 
      00A264 90 F6            [ 1]    1     ld a,(y)
      00A266 93               [ 1]    2     ldw x,y 
      00A267 EE 01            [ 2]    3     ldw x,(1,x)
      00A269 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A26D 9F 88 90         [ 1] 3238 	ld farptr,a 
      00A270 F6 93 EE         [ 2] 3239 	ldw ptr16,x 
      0028C3                       3240 1$:	
      00A273 01 72 A9         [ 4] 3241 	call next_token 
      00A276 00 03            [ 1] 3242 	cp a,#TK_COMMA 
      00A278 84 F7            [ 1] 3243 	jreq 2$ 
      00A27A 81 20            [ 2] 3244 	jra 9$ ; no more data 
      00A27B CD 1A 4A         [ 4] 3245 2$:	call expression
      00A27B CD 99            [ 1] 3246 	cp a,#TK_INTGR
      00A27D 8E A1            [ 1] 3247 	jreq 3$
      00A27F 01 27 03         [ 2] 3248 	jp syntax_error
      0028D6                       3249 3$:	_xpop 
      00A282 CC 96            [ 1]    1     ld a,(y)
      00A284 C2               [ 1]    2     ldw x,y 
      00A285 90 F6            [ 2]    3     ldw x,(1,x)
      00A287 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A28B A9               [ 1] 3250 	ld a,xl 
      00A28C 00               [ 1] 3251 	clrw x 
      00A28D 03 C7 00         [ 4] 3252 	call write_byte
      00A290 19 CF 00         [ 2] 3253 	ldw x,#1 
      00A293 1A 92 BC         [ 4] 3254 	call incr_farptr 
      00A296 00 19            [ 2] 3255 	jra 1$ 
      0028EC                       3256 9$:
      00A298 5F               [ 4] 3257 	ret 
                                   3258 
                                   3259 
                                   3260 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3261 ;BASIC: CHAR(expr)
                                   3262 ; évaluate expression 
                                   3263 ; and take the 7 least 
                                   3264 ; bits as ASCII character
                                   3265 ; output: 
                                   3266 ; 	A char 
                                   3267 ;---------------------
      0028ED                       3268 func_char:
      00A299 97 4F 81         [ 4] 3269 	call func_args 
      00A29C A1 01            [ 1] 3270 	cp a,#1
      00A29C CD 9B            [ 1] 3271 	jreq 1$
      00A29E E3 90 F6         [ 2] 3272 	jp syntax_error
      0028F7                       3273 1$:	_xpop
      00A2A1 93 EE            [ 1]    1     ld a,(y)
      00A2A3 01               [ 1]    2     ldw x,y 
      00A2A4 72 A9            [ 2]    3     ldw x,(1,x)
      00A2A6 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2AA 0D               [ 1] 3274 	ld a,xl
      00A2AB 5D 26            [ 1] 3275 	and a,#0x7f 
      00A2AD 0A               [ 4] 3276 	ret
                                   3277 
                                   3278 ;---------------------
                                   3279 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3280 ; extract first character 
                                   3281 ; of string argument 
                                   3282 ; output:
                                   3283 ;    A:X    int24 
                                   3284 ;---------------------
      002904                       3285 ascii:
      00A2AE 55 00            [ 1] 3286 	ld a,#TK_LPAREN
      00A2B0 04 00 02         [ 4] 3287 	call expect 
      00A2B3 5B 02 CC         [ 4] 3288 	call next_token 
      00A2B6 97 75            [ 1] 3289 	cp a,#TK_QSTR 
      00A2B8 81 0E            [ 1] 3290 	jreq 1$
      00A2B9 A1 04            [ 1] 3291 	cp a,#TK_CHAR 
      00A2B9 85 52            [ 1] 3292 	jreq 2$ 
      00A2BB 0D 89            [ 1] 3293 	cp a,#TK_CFUNC 
      00A2BD A6 85            [ 1] 3294 	jreq 0$
      00A2BF CD 99 81         [ 2] 3295 	jp syntax_error
      00291B                       3296 0$: ; cfunc 
      00A2C2 CD               [ 4] 3297 	call (x)
      00A2C3 97 F3            [ 2] 3298 	jra 3$
      00291E                       3299 1$: ; quoted string 
      00A2C5 1F               [ 1] 3300 	ld a,(x)
      00A2C6 09               [ 1] 3301 	push a  
      00A2C7 CD 9C CB         [ 4] 3302 	call skip_string
      00A2CA 72               [ 1] 3303 	pop a  	
      00A2CB 14 00            [ 2] 3304 	jra 3$ 
      002926                       3305 2$: ; character 
      00A2CD 23 CD 97         [ 4] 3306 	call get_char 
      00A2D0 CB               [ 1] 3307 3$:	clrw x 
      00A2D1 A1               [ 1] 3308 	rlwa x   
      00292B                       3309 4$:	_xpush  
      00A2D2 80 27 03 CC      [ 2]    1     subw y,#CELL_SIZE
      00A2D6 96 C2            [ 1]    2     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A2D8 90 EF 01         [ 2]    3     ldw (1,y),x 
      00A2D8 FE 72            [ 1] 3310 	ld a,#TK_RPAREN 
      00A2DA 5C 00 02         [ 4] 3311 	call expect
      002939                       3312 9$:	
      002939                       3313 	_xpop  
      00A2DD 72 5C            [ 1]    1     ld a,(y)
      00A2DF 00               [ 1]    2     ldw x,y 
      00A2E0 02 A3            [ 2]    3     ldw x,(1,x)
      00A2E2 A2 E9 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2E6 CC               [ 4] 3314 	ret 
                                   3315 
                                   3316 ;---------------------
                                   3317 ;BASIC: KEY
                                   3318 ; wait for a character 
                                   3319 ; received from STDIN 
                                   3320 ; input:
                                   3321 ;	none 
                                   3322 ; output:
                                   3323 ;	a	 character 
                                   3324 ;---------------------
      002943                       3325 key:
      00A2E7 96 C2 1B         [ 4] 3326 	call getc 
      00A2E9 81               [ 4] 3327 	ret
                                   3328 
                                   3329 ;----------------------
                                   3330 ; BASIC: QKEY
                                   3331 ; Return true if there 
                                   3332 ; is a character in 
                                   3333 ; waiting in STDIN 
                                   3334 ; input:
                                   3335 ;  none 
                                   3336 ; output:
                                   3337 ;   A     0|-1
                                   3338 ;-----------------------
      002947                       3339 qkey:: 
      00A2E9 72               [ 1] 3340 	clrw x 
      00A2EA 04 00 23         [ 1] 3341 	ld a,rx1_head
      00A2ED 03 CC 96         [ 1] 3342 	sub a,rx1_tail 
      00A2F0 C2 CD            [ 1] 3343 	jreq 9$ 
      00A2F2 9A               [ 2] 3344 	cplw x
      00A2F3 CA A1            [ 1] 3345 	ld a,#255    
      002953                       3346 9$: 
      00A2F5 84               [ 4] 3347 	ret 
                                   3348 
                                   3349 ;---------------------
                                   3350 ; BASIC: GPIO(port,reg)
                                   3351 ; return gpio register address 
                                   3352 ; expr {PORTA..PORTI}
                                   3353 ; input:
                                   3354 ;   none 
                                   3355 ; output:
                                   3356 ;   A:X 	gpio register address
                                   3357 ;----------------------------
                                   3358 ;	N=PORT
                                   3359 ;	T=REG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      002954                       3360 gpio:
      00A2F6 27 03 CC         [ 4] 3361 	call func_args 
      00A2F9 96 C2            [ 1] 3362 	cp a,#2
      00A2FB 90 F6            [ 1] 3363 	jreq 1$
      00A2FD 93 EE 01         [ 2] 3364 	jp syntax_error  
      00295E                       3365 1$:	_at_next 
      00A300 72 A9 00         [ 1]    1     ld a,(3,y)
      00A303 03               [ 1]    2     ldw x,y 
      00A304 6B 06            [ 2]    3     ldw x,(4,x)
      00A306 1F 07 CD         [ 2] 3366 	cpw x,#PA_BASE 
      00A309 97 CB            [ 1] 3367 	jrmi bad_port
      00A30B A1 00 27         [ 2] 3368 	cpw x,#PI_BASE+1 
      00A30E 17 A1            [ 1] 3369 	jrpl bad_port
      00A310 80               [ 2] 3370 	pushw x 
      00296F                       3371 	_xpop
      00A311 26 0E            [ 1]    1     ld a,(y)
      00A313 FE               [ 1]    2     ldw x,y 
      00A314 72 5C            [ 2]    3     ldw x,(1,x)
      00A316 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A31A 00 02 A3         [ 2] 3372 	addw x,(1,sp)
      00297B                       3373 	_drop 2 
      00A31D A3 2F            [ 2]    1     addw sp,#2 
      00A31F 27               [ 1] 3374 	clr a 
      00A320 0E               [ 4] 3375 	ret
      00A321                       3376 bad_port:
      00A321 55 00            [ 1] 3377 	ld a,#ERR_BAD_VALUE
      00A323 03 00 02         [ 2] 3378 	jp tb_error
                                   3379 
                                   3380 
                                   3381 ;-------------------------
                                   3382 ; BASIC: UFLASH 
                                   3383 ; return free flash address
                                   3384 ; input:
                                   3385 ;  none 
                                   3386 ; output:
                                   3387 ;	A		TK_INTGR
                                   3388 ;   xstack	free address 
                                   3389 ;---------------------------
      00A326                       3390 uflash:
      00A326 0F 03 AE         [ 4] 3391 	call qsign 
      00A329 00 01            [ 1] 3392 	jrne 1$
      00A32B 1F 04 20         [ 2] 3393 	ldw x,#app_space 
      00A32E 2F BB 36 02      [ 2] 3394 	addw x,app_size 
      00A32F 1C 00 04         [ 2] 3395 	addw x,#4
                                   3396 ; align on 128 bytes block 
      00A32F 72 04 00         [ 2] 3397 	addw x,#BLOCK_SIZE 
      00A332 23               [ 1] 3398 	ld a,xl 
      00A333 03 CC            [ 1] 3399 	and a,#0x80 
      00A335 96               [ 1] 3400 	ld xl,a 
      00A336 C2 CD            [ 2] 3401 	jra 2$
      00A338 9A CA A1         [ 2] 3402 1$:	ldw x,#app_space 
      00299F                       3403 2$:
      00A33B 84               [ 1] 3404 	clr a 
      00A33C 27               [ 4] 3405 	ret 
                                   3406 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



                                   3407 
                                   3408 ;---------------------
                                   3409 ; BASIC: USR(addr,arg)
                                   3410 ; execute a function written 
                                   3411 ; in binary code.
                                   3412 ; input:
                                   3413 ;   addr	routine address 
                                   3414 ;   arg 	is an argument
                                   3415 ;           it can be ignore 
                                   3416 ;           by cally. 
                                   3417 ; output:
                                   3418 ;   xstack 	value returned by cally  
                                   3419 ;---------------------
      0029A1                       3420 usr:
      00A33D 03 CC 96         [ 4] 3421 	call func_args 
      00A340 C2 02            [ 1] 3422 	cp a,#2
      00A341 27 03            [ 1] 3423 	jreq 1$  
      00A341 90 F6 93         [ 2] 3424 	jp syntax_error 
      0029AB                       3425 1$: 
      0029AB                       3426 	_at_next ; A:X addr 
      00A344 EE 01 72         [ 1]    1     ld a,(3,y)
      00A347 A9               [ 1]    2     ldw x,y 
      00A348 00 03            [ 2]    3     ldw x,(4,x)
      00A34A 6B 03 1F         [ 2] 3427 	ldw ptr16,X 
      0029B4                       3428 	_xpop  ; arg 
      00A34D 04 4D            [ 1]    1     ld a,(y)
      00A34F 2A               [ 1]    2     ldw x,y 
      00A350 0D 7B            [ 2]    3     ldw x,(1,x)
      00A352 06 1E 07 1D      [ 2]    4     addw y,#CELL_SIZE 
      0029BD                       3429 	_store_top ; overwrite addr 
      00A356 00 01            [ 1]    1     ld (y),a 
      00A358 A2 00 6B         [ 2]    2     ldw (1,y),x     
      00A35B 06 1F 07 19      [ 6] 3430     call [ptr16]
      00A35E 81               [ 4] 3431 	ret 
                                   3432 
                                   3433 
                                   3434 ;------------------------------
                                   3435 ; BASIC: BYE 
                                   3436 ; halt mcu in its lowest power mode 
                                   3437 ; wait for reset or external interrupt
                                   3438 ; do a cold start on wakeup.
                                   3439 ;------------------------------
      0029C7                       3440 bye:
      00A35E CE 00 05 1F 0D   [ 2] 3441 	btjf UART1_SR,#UART_SR_TC,.
      00A363 CE               [10] 3442 	halt
      00A364 00 01 1F         [ 2] 3443 	jp cold_start  
                                   3444 
                                   3445 ;----------------------------------
                                   3446 ; BASIC: SLEEP 
                                   3447 ; halt mcu until reset or external
                                   3448 ; interrupt.
                                   3449 ; Resume progam after SLEEP command
                                   3450 ;----------------------------------
      0029D0                       3451 sleep:
      00A367 0B 72 15 00 23   [ 2] 3452 	btjf UART1_SR,#UART_SR_TC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A36C 72 5C 00 20      [ 1] 3453 	bset flags,#FSLEEP
      00A370 81               [10] 3454 	halt 
      00A371 81               [ 4] 3455 	ret 
                                   3456 
                                   3457 ;-------------------------------
                                   3458 ; BASIC: PAUSE expr 
                                   3459 ; suspend execution for n msec.
                                   3460 ; input:
                                   3461 ;	none
                                   3462 ; output:
                                   3463 ;	none 
                                   3464 ;------------------------------
      0029DB                       3465 pause:
      00A371 72 5D 00         [ 4] 3466 	call expression
      00A374 20 26            [ 1] 3467 	cp a,#TK_INTGR
      00A376 03 CC            [ 1] 3468 	jreq 1$ 
      00A378 96 C2 42         [ 2] 3469 	jp syntax_error
      00A37A                       3470 1$: _xpop 
      00A37A A6 85            [ 1]    1     ld a,(y)
      00A37C CD               [ 1]    2     ldw x,y 
      00A37D 99 81            [ 2]    3     ldw x,(1,x)
      00A37F CD 97 F3 13      [ 2]    4     addw y,#CELL_SIZE 
      0029EE                       3471 pause02:
      00A383 09 27 03         [ 2] 3472 	ldw timer,x 
      00A386 CC 96 C2         [ 2] 3473 1$: ldw x,timer 
      00A389 5D               [ 2] 3474 	tnzw x 
      00A389 CF 00            [ 1] 3475 	jreq 2$
      00A38B 1A               [10] 3476 	wfi 
      00A38C F6 EE            [ 1] 3477 	jrne 1$
      0029FA                       3478 2$:	
      00A38E 01               [ 4] 3479 	ret 
                                   3480 
                                   3481 ;------------------------------
                                   3482 ; BASIC: AWU expr
                                   3483 ; halt mcu for 'expr' milliseconds
                                   3484 ; use Auto wakeup peripheral
                                   3485 ; all oscillators stopped except LSI
                                   3486 ; range: 1ms - 511ms
                                   3487 ; input:
                                   3488 ;  none
                                   3489 ; output:
                                   3490 ;  none:
                                   3491 ;------------------------------
      0029FB                       3492 awu:
      00A38F 72 FB 04         [ 4] 3493   call expression
      00A392 19 03            [ 1] 3494   cp a,#TK_INTGR
      00A394 72 C7            [ 1] 3495   jreq 1$
      00A396 00 1A 72         [ 2] 3496   jp syntax_error
      002A05                       3497 1$: _xpop 
      00A399 5C 00            [ 1]    1     ld a,(y)
      00A39B 1B               [ 1]    2     ldw x,y 
      00A39C 72 CF            [ 2]    3     ldw x,(1,x)
      00A39E 00 1A C7 00      [ 2]    4     addw y,#CELL_SIZE 
      002A0E                       3498 awu02:
      00A3A2 0D CF 00         [ 2] 3499   cpw x,#5120
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A3A5 0E 7B            [ 1] 3500   jrmi 1$ 
      00A3A7 06 1E 07 72      [ 1] 3501   mov AWU_TBR,#15 
      00A3AB B0 00            [ 1] 3502   ld a,#30
      00A3AD 0E               [ 2] 3503   div x,a
      00A3AE C2 00            [ 1] 3504   ld a,#16
      00A3B0 0D               [ 2] 3505   div x,a 
      00A3B1 18 03            [ 2] 3506   jra 4$
      002A1F                       3507 1$: 
      00A3B3 A8 80 2B         [ 2] 3508   cpw x,#2048
      00A3B6 12 20            [ 1] 3509   jrmi 2$ 
      00A3B8 25 7B 03 2A      [ 1] 3510   mov AWU_TBR,#14
      00A3BC 07 C6            [ 1] 3511   ld a,#80
      00A3BE 00               [ 2] 3512   div x,a 
      00A3BF 0F 2F            [ 2] 3513   jra 4$   
      002A2D                       3514 2$:
      00A3C1 07 20 1A F2      [ 1] 3515   mov AWU_TBR,#7
      00A3C4                       3516 3$:  
                                   3517 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3C4 72 0E 00         [ 2] 3518   cpw x,#64 
      00A3C7 0F 15            [ 2] 3519   jrule 4$ 
      00A3C9 72 5C 50 F2      [ 1] 3520   inc AWU_TBR 
      00A3C9 1E               [ 2] 3521   srlw x 
      00A3CA 0D CF            [ 2] 3522   jra 3$ 
      002A3D                       3523 4$:
      00A3CC 00               [ 1] 3524   ld a, xl
      00A3CD 05               [ 1] 3525   dec a 
      00A3CE 72 01            [ 1] 3526   jreq 5$
      00A3D0 00               [ 1] 3527   dec a 	
      002A42                       3528 5$: 
      00A3D1 23 05            [ 1] 3529   and a,#0x3e 
      00A3D3 E6 02 C7         [ 1] 3530   ld AWU_APR,a 
      00A3D6 00 04 1E 0B      [ 1] 3531   bset AWU_CSR,#AWU_CSR_AWUEN
      00A3DA CF               [10] 3532   halt 
                                   3533 
      00A3DB 00               [ 4] 3534   ret 
                                   3535 
                                   3536 ;------------------------------
                                   3537 ; BASIC: TICKS
                                   3538 ; return msec ticks counter value 
                                   3539 ; input:
                                   3540 ; 	none 
                                   3541 ; output:
                                   3542 ;	X 		TK_INTGR
                                   3543 ;-------------------------------
      002A4D                       3544 get_ticks:
      00A3DC 01 81 0F         [ 1] 3545 	ld a,ticks 
      00A3DE CE 00 10         [ 2] 3546 	ldw x,ticks+1 
      00A3DE 85               [ 4] 3547 	ret 
                                   3548 
                                   3549 ;------------------------------
                                   3550 ; BASIC: ABS(expr)
                                   3551 ; return absolute value of expr.
                                   3552 ; input:
                                   3553 ;   none
                                   3554 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



                                   3555 ;   xstack    positive int24 
                                   3556 ;-------------------------------
      002A54                       3557 abs:
      00A3DF 5B 0D 72         [ 4] 3558 	call func_args 
      00A3E2 5A 00            [ 1] 3559 	cp a,#1 
      00A3E4 20 FC            [ 1] 3560 	jreq 0$ 
      00A3E6 CC 16 42         [ 2] 3561 	jp syntax_error
      002A5E                       3562 0$:  
      00A3E6 CD 97 CB         [ 4] 3563 	call abs24 
      002A61                       3564 	_xpop 
      00A3E9 A1 84            [ 1]    1     ld a,(y)
      00A3EB 27               [ 1]    2     ldw x,y 
      00A3EC 07 A1            [ 2]    3     ldw x,(1,x)
      00A3EE 03 27 26 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A3F2 96               [ 4] 3565 	ret 
                                   3566 
                                   3567 ;------------------------------
                                   3568 ; BASIC: LSHIFT(expr1,expr2)
                                   3569 ; logical shift left expr1 by 
                                   3570 ; expr2 bits 
                                   3571 ; output:
                                   3572 ; 	A 		TK_INTGR
                                   3573 ;   X 		result 
                                   3574 ;------------------------------
      002A6B                       3575 lshift:
      00A3F3 C2 19 0E         [ 4] 3576 	call func_args
      00A3F4 A1 02            [ 1] 3577 	cp a,#2 
      00A3F4 90 89            [ 1] 3578 	jreq 1$
      00A3F6 CD 97 FD         [ 2] 3579 	jp syntax_error
      002A75                       3580 1$: _xpop 
      00A3F9 4F 90            [ 1]    1     ld a,(y)
      00A3FB CE               [ 1]    2     ldw x,y 
      00A3FC 00 05            [ 2]    3     ldw x,(1,x)
      00A3FE 90 FE 90 89      [ 2]    4     addw y,#CELL_SIZE 
      00A402 13 01            [ 1] 3581     ldw y,x    
      002A80                       3582 	_at_top  ; T@ 
      00A404 5B 02            [ 1]    1     ld a,(y)
      00A406 25               [ 1]    2     ldw x,y 
      00A407 01 4C            [ 2]    3     ldw x,(1,x)
      00A409 90 5D            [ 2] 3583 	tnzw y 
      00A409 CD 8C            [ 1] 3584 	jreq 4$
      00A40B C5               [ 1] 3585 2$:	rcf 
      00A40C 5D               [ 2] 3586 	rlcw x 
      00A40D 26               [ 1] 3587 	rlc a 
      00A40E 05 A6            [ 2] 3588 	decw y 
      00A410 05 CC            [ 1] 3589 	jrne 2$
      002A90                       3590 4$: _store_top  ; T! 
      00A412 96 C4            [ 1]    1     ld (y),a 
      00A414 90 85 81         [ 2]    2     ldw (1,y),x     
      00A417 A6 84            [ 1] 3591 	ld a,#TK_INTGR
      00A417 90               [ 4] 3592 	ret
                                   3593 
                                   3594 ;------------------------------
                                   3595 ; BASIC: RSHIFT(expr1,expr2)
                                   3596 ; logical shift right expr1 by 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3597 ; expr2 bits.
                                   3598 ; output:
                                   3599 ; 	A 		TK_INTGR
                                   3600 ;   X 		result 
                                   3601 ;------------------------------
      002A98                       3602 rshift:
      00A418 89 89 CD         [ 4] 3603 	call func_args
      00A41B 97 E4            [ 1] 3604 	cp a,#2 
      00A41D 72 5F            [ 1] 3605 	jreq 1$
      00A41F 00 0E 90         [ 2] 3606 	jp syntax_error
      002AA2                       3607 1$: _xpop 
      00A422 CE 00            [ 1]    1     ld a,(y)
      00A424 1C               [ 1]    2     ldw x,y 
      00A425 90 E6            [ 2]    3     ldw x,(1,x)
      00A427 03 A1 03 27      [ 2]    4     addw y,#CELL_SIZE 
      00A42B 15 90            [ 1] 3608     ldw y,x   
      002AAD                       3609 	_at_top  ; T@  
      00A42D E6 02            [ 1]    1     ld a,(y)
      00A42F C7               [ 1]    2     ldw x,y 
      00A430 00 0F            [ 2]    3     ldw x,(1,x)
      00A432 72 B9            [ 2] 3610 	tnzw y 
      00A434 00 0E            [ 1] 3611 	jreq 4$
      00A436 90               [ 1] 3612 2$:	rcf 
      00A437 C3               [ 2] 3613 	rrcw x
      00A438 00               [ 1] 3614 	rrc a  
      00A439 1E 25            [ 2] 3615 	decw y 
      00A43B E9 A6            [ 1] 3616 	jrne 2$
      002ABD                       3617 4$: _store_top  ; T! 
      00A43D 0A CC            [ 1]    1     ld (y),a 
      00A43F 96 C4 01         [ 2]    2     ldw (1,y),x     
      00A441 A6 84            [ 1] 3618 	ld a,#TK_INTGR
      00A441 90               [ 4] 3619 	ret
                                   3620 
                                   3621 ;--------------------------
                                   3622 ; BASIC: FCPU integer
                                   3623 ; set CPU frequency 
                                   3624 ;-------------------------- 
                                   3625 
      002AC5                       3626 fcpu:
      00A442 89 72            [ 1] 3627 	ld a,#TK_INTGR
      00A444 A9 00 04         [ 4] 3628 	call expect 
      00A447 1E 03 CD         [ 4] 3629 	call get_int24 
      00A44A 94               [ 1] 3630 	ld a,xl 
      00A44B 11 26            [ 1] 3631 	and a,#7 
      00A44D 04 90 85         [ 1] 3632 	ld CLK_CKDIVR,a 
      00A450 20               [ 4] 3633 	ret 
                                   3634 
                                   3635 ;------------------------------
                                   3636 ; BASIC: PMODE pin#, mode 
                                   3637 ; Arduino pin. 
                                   3638 ; define pin as input or output
                                   3639 ; pin#: {0..15}
                                   3640 ; mode: INPUT|OUTPUT  
                                   3641 ;------------------------------
                           000001  3642 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                           000001  3643 	VSIZE=1
      002AD4                       3644 pin_mode:
      002AD4                       3645 	_vars VSIZE 
      00A451 DA 01            [ 2]    1     sub sp,#VSIZE 
      00A452 CD 19 13         [ 4] 3646 	call arg_list 
      00A452 85 5B            [ 1] 3647 	cp a,#2 
      00A454 02 90            [ 1] 3648 	jreq 1$
      00A456 85 81 42         [ 2] 3649 	jp syntax_error 
      00A458                       3650 1$: _xpop 
      00A458 72 00            [ 1]    1     ld a,(y)
      00A45A 00               [ 1]    2     ldw x,y 
      00A45B 23 05            [ 2]    3     ldw x,(1,x)
      00A45D A6 06 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A461 C4 CD 9A         [ 2] 3651 	ldw ptr16,x ; mode 
      002AEC                       3652 	_xpop ; Dx pin 
      00A464 CA A1            [ 1]    1     ld a,(y)
      00A466 84               [ 1]    2     ldw x,y 
      00A467 27 03            [ 2]    3     ldw x,(1,x)
      00A469 CC 96 C2 90      [ 2]    4     addw y,#CELL_SIZE 
      00A46D F6 93 EE         [ 4] 3653 	call select_pin 
      00A470 01 72            [ 1] 3654 	ld (PINNO,sp),a  
      00A472 A9 00            [ 1] 3655 	ld a,#1 
      00A474 03 9F            [ 1] 3656 	tnz (PINNO,sp)
      00A476 27 68            [ 1] 3657 	jreq 4$
      00A478 88               [ 1] 3658 2$:	sll a 
      00A479 CD 97            [ 1] 3659 	dec (PINNO,sp)
      00A47B CB A1            [ 1] 3660 	jrne 2$ 
      00A47D 80 27            [ 1] 3661 	ld (PINNO,sp),a
      00A47F 03 CC            [ 1] 3662 	ld a,(PINNO,sp)
      00A481 96 C2            [ 1] 3663 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A483 FE 72            [ 1] 3664 	ld (GPIO_CR1,x),a 
      00A485 5C 00            [ 1] 3665 4$:	ld a,#OUTP
      00A487 02 72 5C         [ 1] 3666 	cp a,acc8 
      00A48A 00 02            [ 1] 3667 	jreq 6$
                                   3668 ; input mode
                                   3669 ; disable external interrupt 
      00A48C A3 A4            [ 1] 3670 	ld a,(PINNO,sp)
      00A48E EA               [ 1] 3671 	cpl a 
      00A48F 27 08            [ 1] 3672 	and a,(GPIO_CR2,x)
      00A491 A3 A5            [ 1] 3673 	ld (GPIO_CR2,x),a 
                                   3674 ;clear bit in DDR for input mode 
      00A493 04 27            [ 1] 3675 	ld a,(PINNO,sp)
      00A495 03               [ 1] 3676 	cpl a 
      00A496 CC 96            [ 1] 3677 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A498 C2 02            [ 1] 3678 	ld (GPIO_DDR,x),a 
      00A499 20 0C            [ 2] 3679 	jra 9$
      002B24                       3680 6$: ;output mode  
      00A499 84 89            [ 1] 3681 	ld a,(PINNO,sp)
      00A49B 88 02            [ 1] 3682 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A49C E7 02            [ 1] 3683 	ld (GPIO_DDR,x),a 
      00A49C 0A 01            [ 1] 3684 	ld a,(PINNO,sp)
      00A49E 27 26            [ 1] 3685 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4A0 CD 97            [ 1] 3686 	ld (GPIO_CR2,x),a 
      002B30                       3687 9$:	
      002B30                       3688 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4A2 CB A1            [ 2]    1     addw sp,#VSIZE 
      00A4A4 84               [ 4] 3689 	ret
                                   3690 
                                   3691 ;------------------------
                                   3692 ; select Arduino pin 
                                   3693 ; input:
                                   3694 ;   X 	 {0..15} Arduino Dx 
                                   3695 ; output:
                                   3696 ;   A     stm8s208 pin 
                                   3697 ;   X     base address s208 GPIO port 
                                   3698 ;---------------------------
      002B33                       3699 select_pin:
      00A4A5 27               [ 2] 3700 	sllw x 
      00A4A6 07 A1 03         [ 2] 3701 	addw x,#arduino_to_8s208 
      00A4A9 27               [ 2] 3702 	ldw x,(x)
      00A4AA 0D               [ 1] 3703 	ld a,xl 
      00A4AB CC               [ 1] 3704 	push a 
      00A4AC 96               [ 1] 3705 	swapw x 
      00A4AD C2 05            [ 1] 3706 	ld a,#5 
      00A4AE 42               [ 4] 3707 	mul x,a 
      00A4AE C6 00 02         [ 2] 3708 	addw x,#GPIO_BASE 
      00A4B1 AB               [ 1] 3709 	pop a 
      00A4B2 03               [ 4] 3710 	ret 
                                   3711 ; translation from Arduino D0..D15 to stm8s208rb 
      002B43                       3712 arduino_to_8s208:
      00A4B3 C7 00                 3713 .byte 3,6 ; D0 
      00A4B5 02 20                 3714 .byte 3,5 ; D1 
      00A4B7 03 CD                 3715 .byte 4,0 ; D2 
      00A4B9 97 E4                 3716 .byte 2,1 ; D3
      00A4BB 06 00                 3717 .byte 6,0 ; D4
      00A4BB CD 97                 3718 .byte 2,2 ; D5
      00A4BD CB A1                 3719 .byte 2,3 ; D6
      00A4BF 08 27                 3720 .byte 3,1 ; D7
      00A4C1 DA 5B                 3721 .byte 3,3 ; D8
      00A4C3 03 20                 3722 .byte 2,4 ; D9
      00A4C5 1A 05                 3723 .byte 4,5 ; D10
      00A4C6 02 06                 3724 .byte 2,6 ; D11
      00A4C6 5B 01                 3725 .byte 2,7 ; D12
      00A4C8 CD A3                 3726 .byte 2,5 ; D13
      00A4CA E6 CF                 3727 .byte 4,2 ; D14
      00A4CC 00 1A                 3728 .byte 4,1 ; D15
                                   3729 
                                   3730 
                                   3731 ;------------------------------
                                   3732 ; BASIC: RND(expr)
                                   3733 ; return random number 
                                   3734 ; between 1 and expr inclusive
                                   3735 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3736 ; input:
                                   3737 ; 	none 
                                   3738 ; output:
                                   3739 ;	xstack 	random positive integer 
                                   3740 ;------------------------------
      002B63                       3741 random:
      00A4CE 55 00 04         [ 4] 3742 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A4D1 00 02            [ 1] 3743 	cp a,#1
      00A4D3 85 A3            [ 1] 3744 	jreq 1$
      00A4D5 A4 EA 26         [ 2] 3745 	jp syntax_error
      002B6D                       3746 1$:  
      002B6D                       3747 	_xpop   
      00A4D8 05 CE            [ 1]    1     ld a,(y)
      00A4DA 00               [ 1]    2     ldw x,y 
      00A4DB 1A 20            [ 2]    3     ldw x,(1,x)
      00A4DD 19 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A4DE 89               [ 2] 3748 	pushw x 
      00A4DE 20               [ 1] 3749 	push a  
      00A4DF 35 80            [ 1] 3750 	ld a,#0x80 
      00A4E0 15 01            [ 1] 3751 	bcp a,(1,sp)
      00A4E0 55 00            [ 1] 3752 	jreq 2$
      00A4E2 04 00            [ 1] 3753 	ld a,#ERR_BAD_VALUE
      00A4E4 02 5B 02         [ 2] 3754 	jp tb_error
      002B83                       3755 2$: 
                                   3756 ; acc16=(x<<5)^x 
      00A4E7 CC 97 75         [ 2] 3757 	ldw x,seedx 
      00A4EA 58               [ 2] 3758 	sllw x 
      00A4EA 72               [ 2] 3759 	sllw x 
      00A4EB 00               [ 2] 3760 	sllw x 
      00A4EC 00               [ 2] 3761 	sllw x 
      00A4ED 23               [ 2] 3762 	sllw x 
      00A4EE 05               [ 1] 3763 	ld a,xh 
      00A4EF A6 06 CC         [ 1] 3764 	xor a,seedx 
      00A4F2 96 C4 0D         [ 1] 3765 	ld acc16,a 
      00A4F4 9F               [ 1] 3766 	ld a,xl 
      00A4F4 CD A3 E6         [ 1] 3767 	xor a,seedx+1 
      00A4F7 C7 00 0E         [ 1] 3768 	ld acc8,a 
                                   3769 ; seedx=seedy 
      00A4F7 CF 00 05         [ 2] 3770 	ldw x,seedy 
      00A4FA E6 02 C7         [ 2] 3771 	ldw seedx,x  
                                   3772 ; seedy=seedy^(seedy>>1)
      00A4FD 00 04 35         [ 2] 3773 	ldw x,seedy 
      00A500 03               [ 2] 3774 	srlw x 
      00A501 00               [ 1] 3775 	ld a,xh 
      00A502 02 81 16         [ 1] 3776 	xor a,seedy 
      00A504 C7 00 16         [ 1] 3777 	ld seedy,a  
      00A504 72               [ 1] 3778 	ld a,xl 
      00A505 00 00 23         [ 1] 3779 	xor a,seedy+1 
      00A508 06 A6 06         [ 1] 3780 	ld seedy+1,a 
                                   3781 ; acc16>>3 
      00A50B CC 96 C4         [ 2] 3782 	ldw x,acc16 
      00A50E 81               [ 2] 3783 	srlw x 
      00A50F 54               [ 2] 3784 	srlw x 
      00A50F CD               [ 2] 3785 	srlw x 
                                   3786 ; x=acc16^x 
      00A510 A3               [ 1] 3787 	ld a,xh 
      00A511 E6 CF 00         [ 1] 3788 	xor a,acc16 
      00A514 1A 00 0D         [ 1] 3789 	ld acc16,a 
      00A515 9F               [ 1] 3790 	ld a,xl 
      00A515 85 52 04         [ 1] 3791 	xor a,acc8 
      00A518 89 CE 00         [ 1] 3792 	ld acc8,a 
                                   3793 ; seedy=acc16^seedy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A51B 05 1F 03         [ 1] 3794 	xor a,seedy+1
      00A51E CE               [ 1] 3795 	ld xl,a 
      00A51F 00 01 1F         [ 1] 3796 	ld a,acc16 
      00A522 05 CE 00         [ 1] 3797 	xor a,seedy
      00A525 1A               [ 1] 3798 	ld xh,a 
      00A526 20 CF 16         [ 2] 3799 	ldw seedy,x 
                                   3800 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A528 C6 00 15         [ 1] 3801 	ld a,seedx+1
      00A528 72 00            [ 1] 3802 	and a,#127
      002BD8                       3803 	_xpush 
      00A52A 00 23 05 A6      [ 2]    1     subw y,#CELL_SIZE
      00A52E 06 CC            [ 1]    2     ld (y),a 
      00A530 96 C4 01         [ 2]    3     ldw (1,y),x 
      00A532 84               [ 1] 3804 	pop a 
      00A532 1E               [ 2] 3805 	popw x 
      002BE3                       3806 	_xpush 
      00A533 03 CF 00 05      [ 2]    1     subw y,#CELL_SIZE
      00A537 E6 02            [ 1]    2     ld (y),a 
      00A539 C7 00 04         [ 2]    3     ldw (1,y),x 
      00A53C 1E 05 CF         [ 4] 3807 	call mod24 
      002BEF                       3808 	_xpop
      00A53F 00 01            [ 1]    1     ld a,(y)
      00A541 85               [ 1]    2     ldw x,y 
      00A542 5B 04            [ 2]    3     ldw x,(1,x)
      00A544 FC A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A545 1C 00 01         [ 2] 3809 	addw x,#1 
      00A545 72 01            [ 1] 3810 	adc a,#0  
      00A547 00               [ 4] 3811 	ret 
                                   3812 
                                   3813 ;---------------------------------
                                   3814 ; BASIC: WORDS 
                                   3815 ; affiche la listes des mots du
                                   3816 ; dictionnaire ainsi que le nombre
                                   3817 ; de mots.
                                   3818 ;---------------------------------
                           000001  3819 	WLEN=1 ; word length
                           000002  3820 	LLEN=2 ; character sent to console
                           000003  3821 	WCNT=3 ; count words printed 
                           000003  3822 	VSIZE=3 
      002BFE                       3823 words:
      00A548 23 02            [ 2] 3824 	pushw y
      002C00                       3825 	_vars VSIZE
      00A54A 4F 81            [ 2]    1     sub sp,#VSIZE 
      00A54C 0F 02            [ 1] 3826 	clr (LLEN,sp)
      00A54C 72 09            [ 1] 3827 	clr (WCNT,sp)
      00A54E 00 23 12 5B      [ 2] 3828 	ldw y,#kword_dict+2
      00A552 02               [ 1] 3829 0$:	ldw x,y
      00A553 CD               [ 1] 3830 	ld a,(x)
      00A554 A0 CA            [ 1] 3831 	and a,#15 
      00A556 5B 04            [ 1] 3832 	ld (WLEN,sp),a 
      00A558 72 19            [ 1] 3833 	inc (WCNT,sp)
      00A55A 00               [ 1] 3834 1$:	incw x 
      00A55B 23               [ 1] 3835 	ld a,(x)
      00A55C 72 10 00         [ 4] 3836 	call putc 
      00A55F 23 CC            [ 1] 3837 	inc (LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A561 97 6D            [ 1] 3838 	dec (WLEN,sp)
      00A563 CE 00            [ 1] 3839 	jrne 1$
      00A565 1C C3            [ 1] 3840 	ld a,#70
      00A567 00 1E            [ 1] 3841 	cp a,(LLEN,sp)
      00A569 2B 0C            [ 1] 3842 	jrmi 2$   
      00A56B AE 96            [ 1] 3843 	ld a,#SPACE 
      00A56D 51 CD 89         [ 4] 3844 	call putc 
      00A570 E8 55            [ 1] 3845 	inc (LLEN,sp) 
      00A572 00 04            [ 2] 3846 	jra 3$
      00A574 00 02            [ 1] 3847 2$: ld a,#CR 
      00A576 81 09 0B         [ 4] 3848 	call putc 
      00A577 0F 02            [ 1] 3849 	clr (LLEN,sp)
      00A577 5B 02 00 02      [ 2] 3850 3$:	subw y,#2 
      00A579 90 FE            [ 2] 3851 	ldw y,(y)
      00A579 CD 9C            [ 1] 3852 	jrne 0$ 
      00A57B AA CD            [ 1] 3853 	ld a,#CR 
      00A57D 94 76 5F         [ 4] 3854 	call putc  
      00A580 CF               [ 1] 3855 	clrw x 
      00A581 00 07            [ 1] 3856 	ld a,(WCNT,sp)
      00A583 72               [ 1] 3857 	ld xl,a 
      00A584 5F 00 09         [ 4] 3858 	call prt_i16 
      00A587 72 5F 00         [ 2] 3859 	ldw x,#words_count_msg
      00A58A 0A CE 00         [ 4] 3860 	call puts 
      002C4D                       3861 	_drop VSIZE 
      00A58D 1C CF            [ 2]    1     addw sp,#VSIZE 
      00A58F 00 05            [ 2] 3862 	popw y 
      00A591 E6               [ 4] 3863 	ret 
      00A592 02 C7 00 04 35 03 00  3864 words_count_msg: .asciz " words in dictionary\n"
             02 72 10 00 23 CC 97
             6D 6F 6E 61 72 79 0A
             00
                                   3865 
                                   3866 
                                   3867 ;-----------------------------
                                   3868 ; BASIC: TIMER expr 
                                   3869 ; initialize count down timer 
                                   3870 ;-----------------------------
      00A5A1                       3871 set_timer:
      00A5A1 AE 17 FF         [ 4] 3872 	call arg_list
      00A5A4 94 CC            [ 1] 3873 	cp a,#1 
      00A5A6 97 4E            [ 1] 3874 	jreq 1$
      00A5A8 CC 16 42         [ 2] 3875 	jp syntax_error
      002C72                       3876 1$: 
      002C72                       3877 	_xpop  
      00A5A8 CD 97            [ 1]    1     ld a,(y)
      00A5AA CB               [ 1]    2     ldw x,y 
      00A5AB A1 85            [ 2]    3     ldw x,(1,x)
      00A5AD 27 03 CC 96      [ 2]    4     addw y,#CELL_SIZE 
      00A5B1 C2 CD 97         [ 2] 3878 	ldw timer,x 
      00A5B4 F3               [ 4] 3879 	ret 
                                   3880 
                                   3881 ;------------------------------
                                   3882 ; BASIC: TIMEOUT 
                                   3883 ; return state of timer 
                                   3884 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3885 ;   A:X     0 not timeout 
                                   3886 ;   A:X     -1 timeout 
                                   3887 ;------------------------------
      002C7F                       3888 timeout:
      00A5B5 CF               [ 1] 3889 	clr a 
      00A5B6 00 1A CD         [ 2] 3890 	ldw x,timer 
      00A5B9 89 94            [ 1] 3891 	jreq 1$
      00A5BB 27               [ 1] 3892 	clrw x
      00A5BC 03               [ 4] 3893 	ret  
      00A5BD CD               [ 1] 3894 1$:	cpl a
      00A5BE 89               [ 2] 3895 	cplw x 
      00A5BF 9B               [ 4] 3896 	ret 
                                   3897  	
                                   3898 
                                   3899 
                                   3900 
                                   3901 ;-----------------------------------
                                   3902 ; BASIC: IWDGEN expr1 
                                   3903 ; enable independant watchdog timer
                                   3904 ; expr1 is delay in multiple of 62.5µsec
                                   3905 ; expr1 -> {1..16383}
                                   3906 ;-----------------------------------
      002C8A                       3907 enable_iwdg:
      00A5C0 72 3F 00         [ 4] 3908 	call arg_list
      00A5C3 1A 72            [ 1] 3909 	cp a,#1 
      00A5C5 5C 00            [ 1] 3910 	jreq 1$
      00A5C7 1B 72 3F         [ 2] 3911 	jp syntax_error 
      002C94                       3912 1$: _xpop  
      00A5CA 00 1A            [ 1]    1     ld a,(y)
      00A5CC 72               [ 1]    2     ldw x,y 
      00A5CD 5C 00            [ 2]    3     ldw x,(1,x)
      00A5CF 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5D3 1A 81            [ 1] 3913 	push #0
      00A5D5 35 CC 50 E0      [ 1] 3914 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A5D5 90               [ 1] 3915 	ld a,xh 
      00A5D6 89 AE            [ 1] 3916 	and a,#0x3f
      00A5D8 00               [ 1] 3917 	ld xh,a  
      00A5D9 64 90 AE         [ 2] 3918 2$:	cpw x,#255
      00A5DC 03 E8            [ 2] 3919 	jrule 3$
      00A5DE 20 22            [ 1] 3920 	inc (1,sp)
      00A5E0 98               [ 1] 3921 	rcf 
      00A5E0 90               [ 2] 3922 	rrcw x 
      00A5E1 89 CD            [ 2] 3923 	jra 2$
      00A5E3 99 93 A1 02      [ 1] 3924 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5E7 27               [ 1] 3925 	pop a  
      00A5E8 03 CC 96         [ 1] 3926 	ld IWDG_PR,a 
      00A5EB C2               [ 1] 3927 	ld a,xl
      00A5EC 4A               [ 1] 3928 	dec a 
      00A5EC 90 F6 93 EE      [ 1] 3929 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5F0 01 72 A9         [ 1] 3930 	ld IWDG_RLR,a 
      00A5F3 00 03 89 90      [ 1] 3931 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A5F7 F6               [ 4] 3932 	ret 
                                   3933 
                                   3934 
                                   3935 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   3936 ; BASIC: IWDGREF  
                                   3937 ; refresh independant watchdog count down 
                                   3938 ; timer before it reset MCU. 
                                   3939 ;-----------------------------------
      002CC8                       3940 refresh_iwdg:
      00A5F8 93 EE 01 72      [ 1] 3941 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A5FC A9               [ 4] 3942 	ret 
                                   3943 
                                   3944 
                                   3945 ;-------------------------------------
                                   3946 ; BASIC: LOG2(expr)
                                   3947 ; return logarithm base 2 of expr 
                                   3948 ; this is the position of most significant
                                   3949 ; bit set. 
                                   3950 ; input: 
                                   3951 ; output:
                                   3952 ;   A     TK_INTGR 
                                   3953 ;   xstack log2 
                                   3954 ;*********************************
      002CCD                       3955 log2:
      00A5FD 00 03 90         [ 4] 3956 	call func_args 
      00A600 93 85            [ 1] 3957 	cp a,#1 
      00A602 27 03            [ 1] 3958 	jreq 1$
      00A602 89 AE F4         [ 2] 3959 	jp syntax_error 
      002CD7                       3960 1$: 
      002CD7                       3961 	_xpop    
      00A605 24 65            [ 1]    1     ld a,(y)
      00A607 90               [ 1]    2     ldw x,y 
      00A608 A3 7A            [ 2]    3     ldw x,(1,x)
      00A60A 12 2B 01 5C      [ 2]    4     addw y,#CELL_SIZE 
      00A60E 4D               [ 1] 3962 	tnz a
      00A60E 9E C7            [ 1] 3963 	jrne 2$ 
      00A610 53               [ 2] 3964 	tnzw x 
      00A611 0D 9F            [ 1] 3965 	jrne 2$
      00A613 C7 53            [ 1] 3966 	ld a,#ERR_BAD_VALUE
      00A615 0E 8C 56         [ 2] 3967 	jp tb_error 
      00A618 9E C7            [ 1] 3968 2$: push #24 
      00A61A 53               [ 2] 3969 3$: rlcw x 
      00A61B 0F               [ 1] 3970     rlc a 
      00A61C 9F C7            [ 1] 3971 	jrc 4$
      00A61E 53 10            [ 1] 3972 	dec (1,sp) 
      00A620 72 10            [ 1] 3973 	jrne 3$
      00A622 53               [ 1] 3974 4$: clrw x 
      00A623 08               [ 1] 3975     pop a 
      00A624 72               [ 1] 3976 	dec a
      00A625 10               [ 1] 3977 	rlwa x  
      002CF9                       3978 9$:	
      00A626 53               [ 4] 3979 	ret 
                                   3980 
                                   3981 ;-----------------------------------
                                   3982 ; BASIC: BIT(expr) 
                                   3983 ; expr ->{0..23}
                                   3984 ; return 2^expr 
                                   3985 ; output:
                                   3986 ;    A:X    2^expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   3987 ;-----------------------------------
      002CFA                       3988 bitmask:
      00A627 00 72 10         [ 4] 3989     call func_args 
      00A62A 53 04            [ 1] 3990 	cp a,#1
      00A62C 85 CD            [ 1] 3991 	jreq 1$
      00A62E AA 6E 72         [ 2] 3992 	jp syntax_error 
      002D04                       3993 1$: _xpop 
      00A631 11 53            [ 1]    1     ld a,(y)
      00A633 08               [ 1]    2     ldw x,y 
      00A634 72 11            [ 2]    3     ldw x,(1,x)
      00A636 53 00 90 85      [ 2]    4     addw y,#CELL_SIZE 
      00A63A 81               [ 1] 3994 	ld a,xl 
      00A63B AE 00 01         [ 2] 3995 	ldw x,#1 
      00A63B CD 99            [ 1] 3996 	and a,#23
      00A63D 93 A1            [ 1] 3997 	jreq 9$
      00A63F 02               [ 1] 3998 	push a 
      00A640 27               [ 1] 3999 	clr a 
      002D17                       4000 2$: 
      00A641 12               [ 2] 4001 	slaw x 
      00A642 A1               [ 1] 4002 	rlc a 	
      00A643 01 27            [ 1] 4003 	dec (1,sp)
      00A645 03 CC            [ 1] 4004 	jrne 2$ 
      002D1D                       4005 4$:
      002D1D                       4006     _drop 1 
      00A647 96 C2            [ 2]    1     addw sp,#1 
      00A649 4F               [ 4] 4007 9$:	ret 
                                   4008 
                                   4009 ;------------------------------
                                   4010 ; BASIC: DO 
                                   4011 ; initiate a DO ... UNTIL loop 
                                   4012 ;------------------------------
                           000003  4013 	DOLP_ADR=3 
                           000005  4014 	DOLP_INW=5
                           000004  4015 	VSIZE=4 
      002D20                       4016 do_loop:
      00A64A 5F               [ 2] 4017 	popw x 
      002D21                       4018 	_vars VSIZE 
      00A64B 72 A2            [ 2]    1     sub sp,#VSIZE 
      00A64D 00               [ 2] 4019 	pushw x 
      00A64E 03 90 F7         [ 2] 4020 	ldw x,basicptr 
      00A651 90 EF            [ 2] 4021 	ldw (DOLP_ADR,sp),x
      00A653 01 90 E6         [ 2] 4022 	ldw x,in.w 
      00A656 03 93            [ 2] 4023 	ldw (DOLP_INW,sp),x
      00A658 EE 04 5D 27      [ 1] 4024 	inc loop_depth 
      00A65C 25               [ 4] 4025 	ret 
                                   4026 
                                   4027 ;--------------------------------
                                   4028 ; BASIC: UNTIL expr 
                                   4029 ; loop if exprssion is false 
                                   4030 ; else terminate loop
                                   4031 ;--------------------------------
      002D33                       4032 until: 
      00A65D 90 F6 93 EE      [ 1] 4033 	tnz loop_depth 
      00A661 01 72            [ 1] 4034 	jrne 1$ 
      00A663 A9 00 03         [ 2] 4035 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      002D3C                       4036 1$: 
      00A666 72 A9 00         [ 4] 4037 	call condition  
      002D3F                       4038 	_xpop 
      00A669 03 9F            [ 1]    1     ld a,(y)
      00A66B A4               [ 1]    2     ldw x,y 
      00A66C 07 4E            [ 2]    3     ldw x,(1,x)
      00A66E C7 54 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A672 16               [ 1] 4039 	tnz a 
      00A673 50 CA            [ 1] 4040 	jrne 9$ 
      00A675 72               [ 2] 4041 	tnzw x 
      00A676 10 54            [ 1] 4042 	jrne 9$ 
      00A678 01 AE            [ 2] 4043 	ldw x,(DOLP_ADR,sp)
      00A67A 00 1B 5A         [ 2] 4044 	ldw basicptr,x 
      00A67D 9D 26            [ 1] 4045 	ld a,(2,x)
      00A67F FA 20 08         [ 1] 4046 	ld count,a 
      00A682 72 11            [ 2] 4047 	ldw x,(DOLP_INW,sp)
      00A684 54 01 72         [ 2] 4048 	ldw in.w,x 
      00A687 17               [ 4] 4049 	ret 
      002D5E                       4050 9$:	; remove loop data from stack  
      00A688 50               [ 2] 4051 	popw x
      002D5F                       4052 	_drop VSIZE
      00A689 CA 04            [ 2]    1     addw sp,#VSIZE 
      00A68A 72 5A 00 1F      [ 1] 4053 	dec loop_depth 
      00A68A 81               [ 2] 4054 	jp (x)
                                   4055 
                                   4056 ;--------------------------
                                   4057 ; BASIC: PORTA...PORTI  
                                   4058 ;  return constant value 
                                   4059 ;  PORT  base address 
                                   4060 ;---------------------------
      00A68B                       4061 const_porta:
      00A68B CD 99 8E         [ 2] 4062 	ldw x,#PA_BASE 
      00A68E A1               [ 1] 4063 	clr a 
      00A68F 01               [ 4] 4064 	ret 
      002D6B                       4065 const_portb:
      00A690 27 03 CC         [ 2] 4066 	ldw x,#PB_BASE 
      00A693 96               [ 1] 4067 	clr a 
      00A694 C2               [ 4] 4068 	ret 
      002D70                       4069 const_portc:
      00A695 90 F6 93         [ 2] 4070 	ldw x,#PC_BASE 
      00A698 EE               [ 1] 4071 	clr a 
      00A699 01               [ 4] 4072 	ret 
      002D75                       4073 const_portd:
      00A69A 72 A9 00         [ 2] 4074 	ldw x,#PD_BASE 
      00A69D 03               [ 1] 4075 	clr a 
      00A69E A3               [ 4] 4076 	ret 
      002D7A                       4077 const_porte:
      00A69F 00 05 23         [ 2] 4078 	ldw x,#PE_BASE 
      00A6A2 05               [ 1] 4079 	clr a 
      00A6A3 A6               [ 4] 4080 	ret 
      002D7F                       4081 const_portf:
      00A6A4 0A CC 96         [ 2] 4082 	ldw x,#PF_BASE 
      00A6A7 C4               [ 1] 4083 	clr a 
      00A6A8 9F               [ 4] 4084 	ret 
      002D84                       4085 const_portg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A6A9 C7 00 0F         [ 2] 4086 	ldw x,#PG_BASE 
      00A6AC A6               [ 1] 4087 	clr a 
      00A6AD 05               [ 4] 4088 	ret 
      002D89                       4089 const_porth:
      00A6AE C0 00 0F         [ 2] 4090 	ldw x,#PH_BASE 
      00A6B1 C7               [ 1] 4091 	clr a 
      00A6B2 54               [ 4] 4092 	ret 
      002D8E                       4093 const_porti:
      00A6B3 00 72 16         [ 2] 4094 	ldw x,#PI_BASE 
      00A6B6 54               [ 1] 4095 	clr a 
      00A6B7 02               [ 4] 4096 	ret 
                                   4097 
                                   4098 ;-------------------------------
                                   4099 ; following return constant 
                                   4100 ; related to GPIO register offset 
                                   4101 ;---------------------------------
      002D93                       4102 const_odr:
      00A6B8 72               [ 1] 4103 	clr a 
      00A6B9 10 54 01         [ 2] 4104 	ldw x,#GPIO_ODR
      00A6BC 72               [ 4] 4105 	ret 
      002D98                       4106 const_idr:
      00A6BD 0F               [ 1] 4107 	clr a 
      00A6BE 54 00 FB         [ 2] 4108 	ldw x,#GPIO_IDR
      00A6C1 CE               [ 4] 4109 	ret 
      002D9D                       4110 const_ddr:
      00A6C2 54               [ 1] 4111 	clr a
      00A6C3 04 A6 84         [ 2] 4112 	ldw x,#GPIO_DDR
      00A6C6 81               [ 4] 4113 	ret 
      00A6C7                       4114 const_cr1:
      00A6C7 52               [ 1] 4115 	clr a 
      00A6C8 01 CD 99         [ 2] 4116 	ldw x,#GPIO_CR1
      00A6CB 8E               [ 4] 4117 	ret 
      002DA7                       4118 const_cr2:
      00A6CC A1               [ 1] 4119 	clr a
      00A6CD 01 27 03         [ 2] 4120 	ldw x,#GPIO_CR2
      00A6D0 CC               [ 4] 4121 	ret 
                                   4122 ;-------------------------
                                   4123 ; BASIC: POUT 
                                   4124 ;  constant for port mode
                                   4125 ;  used by PMODE 
                                   4126 ;  to set pin as output
                                   4127 ;------------------------
      002DAC                       4128 const_output:
      00A6D1 96               [ 1] 4129 	clr a 
      00A6D2 C2 90 F6         [ 2] 4130 	ldw x,#OUTP
      00A6D5 93               [ 4] 4131 	ret 
                                   4132 
                                   4133 ;-------------------------
                                   4134 ; BASIC: PINP 
                                   4135 ;  constant for port mode
                                   4136 ;  used by PMODE 
                                   4137 ;  to set pin as input
                                   4138 ;------------------------
      002DB1                       4139 const_input:
      00A6D6 EE               [ 1] 4140 	clr a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A6D7 01 72 A9         [ 2] 4141 	ldw x,#INP 
      00A6DA 00               [ 4] 4142 	ret 
                                   4143 	
                                   4144 ;-----------------------
                                   4145 ; memory area constants
                                   4146 ;-----------------------
      002DB6                       4147 const_eeprom_base:
      00A6DB 03               [ 1] 4148 	clr a  
      00A6DC A3 00 0F         [ 2] 4149 	ldw x,#EEPROM_BASE 
      00A6DF 23               [ 4] 4150 	ret 
                                   4151 
                                   4152 ;---------------------------
                                   4153 ; BASIC: DATA 
                                   4154 ; when the interpreter find 
                                   4155 ; a DATA line it skip it.
                                   4156 ;---------------------------
      002DBB                       4157 data:
      00A6E0 05 A6 0A CC 96   [ 1] 4158 	mov in,count 
      00A6E5 C4               [ 4] 4159 	ret 
                                   4160 
                                   4161 ;------------------------------
                                   4162 ; check if it is a DATA line 
                                   4163 ; input: 
                                   4164 ;    X    line address 
                                   4165 ; output:
                                   4166 ;    Z    set if DATA line 
                                   4167 ;----------------------------
      002DC1                       4168 is_data_line:
      00A6E6 CD               [ 2] 4169 	pushw x 
      00A6E7 AB B3            [ 1] 4170 	ld a,(3,x)
      00A6E9 6B 01            [ 1] 4171 	cp a,#TK_CMD 
      00A6EB E6 01            [ 1] 4172 	jrne 9$
      00A6ED 0D 01            [ 2] 4173 	ldw x,(4,x)
      00A6EF 27 05 44         [ 2] 4174 	cpw x,#data  
      00A6F2 0A               [ 2] 4175 9$: popw x 
      00A6F3 01               [ 4] 4176 	ret 
                                   4177 
                                   4178 ;---------------------------------
                                   4179 ; BASIC: RESTORE [line#]
                                   4180 ; set data_ptr to first data line
                                   4181 ; if no DATA found pointer set to
                                   4182 ; zero.
                                   4183 ; if a line# is given as argument 
                                   4184 ; a data line with that number 
                                   4185 ; is searched and the data pointer 
                                   4186 ; is set to it. If there is no 
                                   4187 ; data line with that number 
                                   4188 ; the program is interrupted. 
                                   4189 ;---------------------------------
      002DCF                       4190 restore:
      00A6F4 26               [ 1] 4191 	clrw x 
      00A6F5 FB A4 01         [ 2] 4192 	ldw data_ptr,x 
      00A6F8 5F 97 4F         [ 2] 4193 	ldw data_ofs,x 
      00A6FB 5B 01 81         [ 2] 4194 	ldw x,txtbgn 
      00A6FE CD 17 4B         [ 4] 4195 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A6FE 52 02            [ 1] 4196 	cp a,#TK_INTGR
      00A700 CD 99            [ 1] 4197 	jrne 0$
      00A702 93 A1 02         [ 4] 4198 	call get_int24
      00A705 27 03            [ 2] 4199 	pushw y 
      00A707 CC               [ 1] 4200 	clr a 
      00A708 96 C2 90         [ 4] 4201 	call search_lineno  
      00A70B F6 93            [ 2] 4202 	popw y 
      00A70D EE               [ 2] 4203 	tnzw x 
      00A70E 01 72            [ 1] 4204 	jrne set_data_pointer 
      00A710 A9 00            [ 2] 4205 	jra data_error 
      002DF0                       4206 0$:
      002DF0                       4207 	_unget_token  
      00A712 03 9F 6B 02 90   [ 1]    1      mov in,in.saved  
                                   4208 ; search first DATA line 	
      00A717 F6 93 EE         [ 2] 4209 1$:	cpw x,txtend
      00A71A 01 72            [ 1] 4210 	jruge data_error 
      002DFA                       4211 2$:	
      00A71C A9 00 03         [ 4] 4212 	call is_data_line 
      00A71F A3 00            [ 1] 4213 	jrne 4$
      00A721 0F 23 05         [ 4] 4214 4$:	call try_next_line 
      00A724 A6 0A            [ 1] 4215 	jrne 4$ 
      00A726 CC               [ 4] 4216 	ret 
                                   4217 
                                   4218 ;---------------------
                                   4219 ; set data pointer 
                                   4220 ; variables at new line 
                                   4221 ; input:
                                   4222 ;    X    line address 
                                   4223 ;----------------------
      002E05                       4224 set_data_pointer:
      00A727 96 C4 CD         [ 2] 4225 	ldw data_ptr,x
      00A72A AB B3            [ 1] 4226 	ld a,(2,x)
      00A72C 6B 01 A6         [ 1] 4227 	ld data_len,a 
      00A72F 01 0D 01 27      [ 1] 4228 	mov data_ofs,#FIRST_DATA_ITEM
      00A733 05               [ 4] 4229 	ret 
                                   4230 
                                   4231 
                                   4232 ;--------------------
                                   4233 ; at end of data line 
                                   4234 ; check if next line 
                                   4235 ; is a data line 
                                   4236 ; input:
                                   4237 ;    X   actual line address 
                                   4238 ;  
                                   4239 ;-------------------
      002E12                       4240 try_next_line: 
      00A734 48 0A            [ 1] 4241 	ld a,(2,x)
      00A736 01 26 FB         [ 1] 4242 	ld acc8,a 
      00A739 0D 02 26 05      [ 1] 4243 	clr acc16 
      00A73D 43 E4 00 20      [ 2] 4244 	addw x,acc16 
      00A741 02 EA 00         [ 2] 4245 	cpw x,txtend 
      00A744 E7 00            [ 1] 4246 	jrult 1$
      00A746 5B 02            [ 2] 4247 	jra data_error 
      002E26                       4248 1$:	
      00A748 81 2D C1         [ 4] 4249 	call is_data_line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A749 27 04            [ 1] 4250 	jreq 2$
      00A749 72 00            [ 1] 4251 	ld a,#1  
      00A74B 00 23            [ 2] 4252 	jra 9$
      00A74D 02 4F 81         [ 4] 4253 2$:	call set_data_pointer
      00A750 4F               [ 1] 4254 	clr a  
      00A750 AE               [ 4] 4255 9$:	ret 
      002E34                       4256 data_error:	
      00A751 A7 77            [ 1] 4257     ld a,#ERR_NO_DATA 
      00A753 CD 89 E8         [ 2] 4258 	jp tb_error 
                                   4259 
                                   4260 
                                   4261 ;---------------------------------
                                   4262 ; BASIC: READ 
                                   4263 ; return next data item | 0 
                                   4264 ;---------------------------------
                           000001  4265 	CTX_BPTR=1 
                           000003  4266 	CTX_IN=3 
                           000004  4267 	CTX_COUNT=4 
                           000005  4268 	INT24=5
                           000007  4269 	VSIZE=7 
      002E39                       4270 read:
      002E39                       4271 	_vars  VSIZE 
      00A756 5B 02            [ 2]    1     sub sp,#VSIZE 
      00A758 52 04 CD         [ 4] 4272 	call save_context
      002E3E                       4273 read01:	
      00A75B A0 BA AE         [ 1] 4274 	ld a,data_ofs
      00A75E 16 90 CF         [ 1] 4275 	cp a,data_len 
      00A761 00 05            [ 1] 4276 	jreq 2$ ; end of line  
      002E46                       4277 0$:
      00A763 7F 72 5F         [ 2] 4278 	ldw x,data_ptr 
      00A766 00 04 5F         [ 2] 4279 	ldw basicptr,x 
      00A769 CF 00 01 72 11   [ 1] 4280 	mov in,data_ofs 
      00A76E 00 23 72 18 00   [ 1] 4281 	mov count,data_len  
      00A773 23 CC 97         [ 4] 4282 	call expression 
      00A776 6D 0A            [ 1] 4283 	cp a,#TK_INTGR 
      00A778 62 72            [ 1] 4284 	jreq 1$ 
      00A77A 65 61 6B         [ 2] 4285 	jp syntax_error 
      002E60                       4286 1$:
      00A77D 20 70 6F         [ 4] 4287 	call next_token ; skip comma
      00A780 69 6E 74         [ 2] 4288 	ldw x,basicptr 
      00A783 2C 20 52         [ 2] 4289 	ldw data_ptr,x 
      00A786 55 4E 20 74 6F   [ 1] 4290 	mov data_ofs,in 
      00A78B 20 72 65         [ 4] 4291 	call rest_context
      002E71                       4292 	_xpop 
      00A78E 73 75            [ 1]    1     ld a,(y)
      00A790 6D               [ 1]    2     ldw x,y 
      00A791 65 2E            [ 2]    3     ldw x,(1,x)
      00A793 0A 00 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A795                       4293 	_drop VSIZE 
      00A795 72 01            [ 2]    1     addw sp,#VSIZE 
      00A797 00               [ 4] 4294 	ret 
      002E7D                       4295 2$: ; end of line reached 
                                   4296 	; try next line 
      00A798 23 01 81         [ 2] 4297 	ldw x,data_ptr  
      00A79B CD 2E 12         [ 4] 4298 	call try_next_line
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A79B CD 95            [ 1] 4299 	jreq 0$ 
      00A79D 1E 81            [ 2] 4300 	jra data_error 
                                   4301 
                                   4302 ;---------------------------------
                                   4303 ; BASIC: SPIEN clkdiv, 0|1  
                                   4304 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4305 ; if clkdiv==-1 disable SPI
                                   4306 ; 0|1 -> disable|enable  
                                   4307 ;--------------------------------- 
                           000005  4308 SPI_CS_BIT=5
      00A79F                       4309 spi_enable:
      00A79F 72 5F 00         [ 4] 4310 	call arg_list 
      00A7A2 19 52            [ 1] 4311 	cp a,#2
      00A7A4 03 CD            [ 1] 4312 	jreq 1$
      00A7A6 97 CB A1         [ 2] 4313 	jp syntax_error 
      002E91                       4314 1$: 
      00A7A9 04 27 03 CC      [ 1] 4315 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7AD 96               [ 2] 4316 	popw x  
      00A7AE C2               [ 2] 4317 	tnzw x 
      00A7AF CD 98            [ 1] 4318 	jreq spi_disable 
      00A7B1 0D               [ 2] 4319 	popw x 
      00A7B2 A4 DF            [ 1] 4320 	ld a,#(1<<SPI_CR1_BR)
      00A7B4 A1               [ 4] 4321 	mul x,a 
      00A7B5 45               [ 1] 4322 	ld a,xl 
      00A7B6 26 0C AE         [ 1] 4323 	ld SPI_CR1,a 
                                   4324 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7B9 40 00 CF 00      [ 1] 4325 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7BD 1A AE 47 FF      [ 1] 4326 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4327 ; configure SPI as master mode 0.	
      00A7C1 4F 20 15 A1      [ 1] 4328 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4329 ; ~CS line controlled by sofware 	
      00A7C5 46 27 06 AE      [ 1] 4330 	bset SPI_CR2,#SPI_CR2_SSM 
      00A7C9 96 02 CC 96      [ 1] 4331     bset SPI_CR2,#SPI_CR2_SSI 
                                   4332 ; enable SPI
      00A7CD C4 1C 52 00      [ 1] 4333 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A7CE 81               [ 4] 4334 	ret 
      002EBA                       4335 spi_disable:
      002EBA                       4336 	_drop #2; throw first argument.
      00A7CE AE B6            [ 2]    1     addw sp,##2 
                                   4337 ; wait spi idle 
      00A7D0 80 CF            [ 1] 4338 1$:	ld a,#0x82 
      00A7D2 00 1A A6         [ 1] 4339 	and a,SPI_SR
      00A7D5 02 AE            [ 1] 4340 	cp a,#2 
      00A7D7 7F FF            [ 1] 4341 	jrne 1$
      00A7D9 72 1D 52 00      [ 1] 4342 	bres SPI_CR1,#SPI_CR1_SPE
      00A7D9 6B 01 1F 02      [ 1] 4343 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A7DD CD 87 89 16      [ 1] 4344 	bres PE_DDR,#SPI_CS_BIT 
      00A7E0 81               [ 4] 4345 	ret 
                                   4346 
      002ED2                       4347 spi_clear_error:
      00A7E0 CD 89            [ 1] 4348 	ld a,#0x78 
      00A7E2 0B 27 08         [ 1] 4349 	bcp a,SPI_SR 
      00A7E5 A6 45            [ 1] 4350 	jreq 1$
      00A7E7 CD 89 8B CD      [ 1] 4351 	clr SPI_SR 
      00A7EB 88               [ 4] 4352 1$: ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4353 
      002EDE                       4354 spi_send_byte:
      00A7EC 07               [ 1] 4355 	push a 
      00A7ED AE 00 80         [ 4] 4356 	call spi_clear_error
      00A7F0 CD               [ 1] 4357 	pop a 
      00A7F1 88 FD 7B 01 1E   [ 2] 4358 	btjf SPI_SR,#SPI_SR_TXE,.
      00A7F6 02 72 B0         [ 1] 4359 	ld SPI_DR,a
      00A7F9 00 1A C2 00 19   [ 2] 4360 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A7FE 22 E0 CD         [ 1] 4361 	ld a,SPI_DR 
      00A801 95               [ 4] 4362 	ret 
                                   4363 
      002EF4                       4364 spi_rcv_byte:
      00A802 1E 1E            [ 1] 4365 	ld a,#255
      00A804 02 A3 47 FF 26   [ 2] 4366 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A809 03 CD 9D         [ 1] 4367 	ld a,SPI_DR 
      00A80C 73               [ 4] 4368 	ret
                                   4369 
                                   4370 ;------------------------------
                                   4371 ; BASIC: SPIWR byte [,byte]
                                   4372 ; write 1 or more byte
                                   4373 ;------------------------------
      00A80D                       4374 spi_write:
      00A80D 5B 03 81         [ 4] 4375 	call expression
      00A810 A1 84            [ 1] 4376 	cp a,#TK_INTGR 
      00A810 CE B6            [ 1] 4377 	jreq 1$
      00A812 80 C3 A8         [ 2] 4378 	jp syntax_error 
      002F09                       4379 1$:	
      00A815 D0               [ 1] 4380 	ld a,xl 
      00A816 81 2E DE         [ 4] 4381 	call spi_send_byte 
      00A817 CD 17 4B         [ 4] 4382 	call next_token 
      00A817 88 4D            [ 1] 4383 	cp a,#TK_COMMA 
      00A819 27 0A            [ 1] 4384 	jrne 2$ 
      00A81B F6 5C            [ 2] 4385 	jra spi_write 
      00A81D 90               [ 1] 4386 2$:	tnz a 
      00A81E F7 90            [ 1] 4387 	jreq 3$
      002F19                       4388 	_unget_token  
      00A820 5C 0A 01 26 F6   [ 1]    1      mov in,in.saved  
      00A825 84               [ 4] 4389 3$:	ret 
                                   4390 
                                   4391 
                                   4392 ;-------------------------------
                                   4393 ; BASIC: SPIRD 	
                                   4394 ; read one byte from SPI 
                                   4395 ;-------------------------------
      002F1F                       4396 spi_read:
      00A826 81 2E F4         [ 4] 4397 	call spi_rcv_byte 
      00A827 5F               [ 1] 4398 	clrw x 
      00A827 88               [ 1] 4399 	ld xl,a 
      00A828 90               [ 1] 4400 	clr a  
      00A829 AE               [ 4] 4401 	ret 
                                   4402 
                                   4403 ;------------------------------
                                   4404 ; BASIC: SPISEL 0|1 
                                   4405 ; set state of ~CS line
                                   4406 ; 0|1 deselect|select  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4407 ;------------------------------
      002F26                       4408 spi_select:
      00A82A 16 E0 90         [ 4] 4409 	call next_token 
      00A82D 89 A6            [ 1] 4410 	cp a,#TK_INTGR 
      00A82F 80 90            [ 1] 4411 	jreq 1$
      00A831 7F 90 5C         [ 2] 4412 	jp syntax_error 
      00A834 4A               [ 2] 4413 1$: tnzw x  
      00A835 26 F9            [ 1] 4414 	jreq cs_high 
      00A837 90 85 84 81      [ 1] 4415 	bres PE_ODR,#SPI_CS_BIT
      00A83B 81               [ 4] 4416 	ret 
      002F38                       4417 cs_high: 
      00A83B 89 90 89 52      [ 1] 4418 	bset PE_ODR,#SPI_CS_BIT
      00A83F 06               [ 4] 4419 	ret 
                                   4420 
                                   4421 ;-------------------------------
                                   4422 ; BASIC: PAD 
                                   4423 ; Return pad buffer address.
                                   4424 ;------------------------------
      002F3D                       4425 pad_ref:
      00A840 CD A8 10         [ 2] 4426 	ldw x,#pad 
      00A843 26               [ 1] 4427 	clr a
      00A844 09               [ 4] 4428 	ret 
                                   4429 
                                   4430 ;****************************
                                   4431 ; expression stack 
                                   4432 ; manipulation routines
                                   4433 ;****************************
                                   4434 
                                   4435 ;-----------------------------
                                   4436 ; BASIC: PUSH expr|rel|cond 
                                   4437 ; push the result on xtack
                                   4438 ;-----------------------------
      002F42                       4439 xpush:
      00A845 AE A8 D2         [ 4] 4440 	call condition 
      00A848 CD               [ 4] 4441 	ret 
                                   4442 
                                   4443 ;------------------------------
                                   4444 ; BASIC: POP 
                                   4445 ; pop top of xstack 
                                   4446 ;------------------------------
      002F46                       4447 xpop:
      002F46                       4448 	_xpop 
      00A849 89 E8            [ 1]    1     ld a,(y)
      00A84B CC               [ 1]    2     ldw x,y 
      00A84C A8 CA            [ 2]    3     ldw x,(1,x)
      00A84E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A84E CE               [ 4] 4449 	ret 
                                   4450 
                                   4451 
                                   4452 ;------------------------------
                                   4453 ; BASIC: ALLOC expr 
                                   4454 ; allocate expr element on xtack 
                                   4455 ;-------------------------------
      002F50                       4456 xalloc: 
      00A84F 00 1C C3         [ 4] 4457 	call expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A852 00 1E            [ 1] 4458 	cp a,#TK_INTGR
      00A854 25 09            [ 1] 4459 	jreq 1$ 
      00A856 AE A9 14         [ 2] 4460 	jp syntax_error
      002F5A                       4461 1$: _xpop 
      00A859 CD 89            [ 1]    1     ld a,(y)
      00A85B E8               [ 1]    2     ldw x,y 
      00A85C CC A8            [ 2]    3     ldw x,(1,x)
      00A85E CA A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A85F 4D               [ 1] 4462 	tnz a 
      00A85F CD 87            [ 1] 4463 	jreq 3$ 
      00A861 C9 72            [ 1] 4464 2$:	ld a,#ERR_BAD_VALUE
      00A863 5F 00 19         [ 2] 4465 	jp tb_error 
      00A866 AE B6 80         [ 2] 4466 3$: cpw x,#XSTACK_SIZE 
      00A869 CF 00            [ 1] 4467 	jrugt 2$
      00A86B 1A CD            [ 1] 4468 	ld a,#CELL_SIZE 
      00A86D 9E               [ 4] 4469 	mul x,a 
      00A86E 93 1F 05         [ 2] 4470 	ldw acc16,x 
      00A871 0F 03 CD A8      [ 2] 4471 	subw y,acc16 
      00A875 27 CE A8 D0      [ 2] 4472 	cpw y,#xstack_full
      00A879 90 FF            [ 1] 4473 	jrugt 9$
      00A87B 72 A9            [ 1] 4474 	ld a,#ERR_MEM_FULL
      00A87D 00 02 1E         [ 2] 4475 	jp tb_error 
      002F85                       4476 9$:	 
      00A880 05               [ 4] 4477 	ret 
                                   4478 
                                   4479 
                                   4480 ;------------------------------
                                   4481 ;  BASIC DROP expr 
                                   4482 ;  expr in range {0..XSTACK_SIZE}
                                   4483 ;  discard n elements from xtack
                                   4484 ;------------------------------
      002F86                       4485 xdrop:
      00A881 90 FF 72         [ 4] 4486 	call expression 
      00A884 A9 00            [ 1] 4487 	cp a,#TK_INTGR
      00A886 02 A6            [ 1] 4488 	jreq 1$ 
      00A888 7C 6B 04         [ 2] 4489 	jp syntax_error 
      002F90                       4490 1$:	_xpop 
      00A88B A3 00            [ 1]    1     ld a,(y)
      00A88D 7C               [ 1]    2     ldw x,y 
      00A88E 22 01            [ 2]    3     ldw x,(1,x)
      00A890 9F 6B 04 CE      [ 2]    4     addw y,#CELL_SIZE 
      00A894 00               [ 1] 4491 	ld a,xl 
      00A895 1C 1F            [ 1] 4492 	and a,#0x1f 
      00A897 01               [ 1] 4493 	clrw x 
      00A898 97               [ 1] 4494 	ld xl,a 
      00A898 1E 01            [ 1] 4495 	ld a,#CELL_SIZE 
      00A89A 7B               [ 4] 4496 	mul x,a 
      00A89B 04 CD A8         [ 2] 4497 	ldw acc16,x  
      00A89E 17 1F 01 AE      [ 2] 4498 	addw y,acc16 
      00A8A2 16 E0 CD 87      [ 2] 4499 	cpw y,#XSTACK_EMPTY 
      00A8A6 E3 AE            [ 2] 4500 	jrule 9$
      00A8A8 00 80 CD 88      [ 2] 4501 	ldw y,#XSTACK_EMPTY 
      00A8AC FD               [ 4] 4502 9$:	ret 
                                   4503 
                                   4504 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



                                   4505 ; check if value in A:X 
                                   4506 ; is inside xstack bound
                                   4507 ; output:
                                   4508 ;    X     slot address  
                                   4509 ;-----------------------
      002FB3                       4510 xstack_bound:
      00A8AD 1E               [ 1] 4511 	tnz a 
      00A8AE 01 C3            [ 1] 4512 	jrne 8$ 
      00A8B0 00 1E 24         [ 2] 4513 1$: cpw x,#XSTACK_SIZE 
      00A8B3 16 1E            [ 1] 4514 	jrugt 8$
      00A8B5 05 72            [ 1] 4515 	ld a,#CELL_SIZE 
      00A8B7 F0               [ 4] 4516 	mul x,a
      00A8B8 03 1F 05         [ 2] 4517 	ldw acc16,x 
      00A8BB A6               [ 1] 4518 	ldw x,y 
      00A8BC 80 A3 00 80      [ 2] 4519 	addw x,acc16 
      00A8C0 24 01 9F         [ 2] 4520 	cpw x,#XSTACK_EMPTY 
      00A8C3 6B 04            [ 1] 4521 	jruge 8$  
      00A8C5 CD               [ 4] 4522 	ret 
      00A8C6 A8 27            [ 1] 4523 8$: ld a,#ERR_BAD_VALUE
      00A8C8 20 CE 5B         [ 2] 4524 	jp tb_error 
                                   4525 
                                   4526 ;-------------------------
                                   4527 ; BASIC: PUT expr, cond 
                                   4528 ; expr -> slot 
                                   4529 ; cond -> valut to put 
                                   4530 ; on xstack 
                                   4531 ;-------------------------
      002FD1                       4532 xput:
      00A8CB 06 90 85         [ 4] 4533 	call arg_list 
      00A8CE 85 81            [ 1] 4534 	cp a,#2 
      00A8D0 42 43            [ 1] 4535 	jreq 1$ 
      00A8D2 43 61 6E         [ 2] 4536 0$:	jp syntax_error
      002FDB                       4537 1$: _xpop   ; value to put 
      00A8D5 27 74            [ 1]    1     ld a,(y)
      00A8D7 20               [ 1]    2     ldw x,y 
      00A8D8 66 6C            [ 2]    3     ldw x,(1,x)
      00A8DA 61 73 68 20      [ 2]    4     addw y,#CELL_SIZE 
      00A8DE 61               [ 2] 4538 	pushw x 
      00A8DF 70               [ 1] 4539 	push a 
      002FE6                       4540 	_xpop    ; slot 
      00A8E0 70 6C            [ 1]    1     ld a,(y)
      00A8E2 69               [ 1]    2     ldw x,y 
      00A8E3 63 61            [ 2]    3     ldw x,(1,x)
      00A8E5 74 69 6F 6E      [ 2]    4     addw y,#CELL_SIZE 
      00A8E9 2C 20 61         [ 4] 4541 	call xstack_bound
      00A8EC 6C 72 65         [ 2] 4542     ldw ptr16,x 
      00A8EF 61               [ 1] 4543 	pop a 
      00A8F0 64               [ 2] 4544 	popw x 
      00A8F1 79 20 6F 6E      [ 4] 4545 	ld [ptr16],a 
      00A8F5 65 20 69 6E      [ 1] 4546 	inc ptr8 
      00A8F9 20 46 4C 41      [ 5] 4547 	ldw [ptr16],x 
      00A8FD 53               [ 4] 4548 	ret 
                                   4549 
                                   4550 ;------------------------
                                   4551 ; BASIC: PICK expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



                                   4552 ; get nième element on 
                                   4553 ; xtack. 
                                   4554 ;-----------------------
      003004                       4555 xpick:
      00A8FE 48 0A 75         [ 4] 4556 	call func_args 
      00A901 73 65            [ 1] 4557 	cp a,#1 
      00A903 20 45            [ 1] 4558 	jreq 1$
      00A905 52 41 53         [ 2] 4559 	jp syntax_error 
      00300E                       4560 1$: _xpop 
      00A908 45 20            [ 1]    1     ld a,(y)
      00A90A 5C               [ 1]    2     ldw x,y 
      00A90B 46 20            [ 2]    3     ldw x,(1,x)
      00A90D 62 65 66 6F      [ 2]    4     addw y,#CELL_SIZE 
      00A911 72 65 00         [ 4] 4561 	call xstack_bound
      00A914 4E               [ 1] 4562     ld a,(x)
      00A915 6F 20            [ 2] 4563 	ldw x,(1,x)				
      00A917 61               [ 4] 4564 	ret 
                                   4565 
                                   4566 
                                   4567 
                                   4568 ;------------------------------
                                   4569 ;      dictionary 
                                   4570 ; format:
                                   4571 ;   link:   2 bytes 
                                   4572 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4573 ;   cmd_name: 16 byte max 
                                   4574 ;   code_addr: 2 bytes 
                                   4575 ;------------------------------
                                   4576 	.macro _dict_entry len,name,code_addr 
                                   4577 	.word LINK 
                                   4578 	LINK=.
                                   4579 name:
                                   4580 	.byte len   	
                                   4581 	.ascii "name"
                                   4582 	.word code_addr  
                                   4583 	.endm 
                                   4584 
                           000000  4585 	LINK=0
                                   4586 ; respect alphabetic order for BASIC names from Z-A
                                   4587 ; this sort order is for a cleaner WORDS cmd output. 	
      00301E                       4588 kword_end:
      00301E                       4589 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00A918 70 70                    1 	.word LINK 
                           003020     2 	LINK=.
      003020                          3 XOR:
      00A91A 6C                       4 	.byte 3+F_XOR   	
      00A91B 69 63 61                 5 	.ascii "XOR"
      00A91E 74 69                    6 	.word TK_XOR  
      003026                       4590 	_dict_entry,5,WRITE,write  
      00A920 6F 6E                    1 	.word LINK 
                           003028     2 	LINK=.
      003028                          3 WRITE:
      00A922 20                       4 	.byte 5   	
      00A923 69 6E 20 52 41           5 	.ascii "WRITE"
      00A928 4D 00                    6 	.word write  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A92A                       4591 	_dict_entry,5,WORDS,words 
      00A92A CD 9A                    1 	.word LINK 
                           003032     2 	LINK=.
      003032                          3 WORDS:
      00A92C CA                       4 	.byte 5   	
      00A92D A1 84 27 03 CC           5 	.ascii "WORDS"
      00A932 96 C2                    6 	.word words  
      00303A                       4592 	_dict_entry 4,WAIT,wait 
      00A934 90 F6                    1 	.word LINK 
                           00303C     2 	LINK=.
      00303C                          3 WAIT:
      00A936 93                       4 	.byte 4   	
      00A937 EE 01 72 A9              5 	.ascii "WAIT"
      00A93B 00 03                    6 	.word wait  
      003043                       4593 	_dict_entry,3+F_IFUNC,USR,usr
      00A93D C7 00                    1 	.word LINK 
                           003045     2 	LINK=.
      003045                          3 USR:
      00A93F 19                       4 	.byte 3+F_IFUNC   	
      00A940 CF 00 1A                 5 	.ascii "USR"
      00A943 29 A1                    6 	.word usr  
      00304B                       4594 	_dict_entry,5,UNTIL,until 
      00A943 CD 97                    1 	.word LINK 
                           00304D     2 	LINK=.
      00304D                          3 UNTIL:
      00A945 CB                       4 	.byte 5   	
      00A946 A1 08 27 02 20           5 	.ascii "UNTIL"
      00A94B 20 CD                    6 	.word until  
      003055                       4595 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A94D 9A CA                    1 	.word LINK 
                           003057     2 	LINK=.
      003057                          3 UFLASH:
      00A94F A1                       4 	.byte 6+F_IFUNC   	
      00A950 84 27 03 CC 96 C2        5 	.ascii "UFLASH"
      00A956 90 F6                    6 	.word uflash  
      003060                       4596 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00A958 93 EE                    1 	.word LINK 
                           003062     2 	LINK=.
      003062                          3 UBOUND:
      00A95A 01                       4 	.byte 6+F_IFUNC   	
      00A95B 72 A9 00 03 9F 5F        5 	.ascii "UBOUND"
      00A961 CD 88                    6 	.word ubound  
      00306B                       4597 	_dict_entry,4,TONE,tone  
      00A963 2D AE                    1 	.word LINK 
                           00306D     2 	LINK=.
      00306D                          3 TONE:
      00A965 00                       4 	.byte 4   	
      00A966 01 CD 88 FD              5 	.ascii "TONE"
      00A96A 20 D7                    6 	.word tone  
      00A96C                       4598 	_dict_entry,2,TO,to
      00A96C 81 6D                    1 	.word LINK 
                           003076     2 	LINK=.
      00A96D                          3 TO:
      00A96D CD                       4 	.byte 2   	
      00A96E 99 8E                    5 	.ascii "TO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A970 A1 01                    6 	.word to  
      00307B                       4599 	_dict_entry,5,TIMER,set_timer
      00A972 27 03                    1 	.word LINK 
                           00307D     2 	LINK=.
      00307D                          3 TIMER:
      00A974 CC                       4 	.byte 5   	
      00A975 96 C2 90 F6 93           5 	.ascii "TIMER"
      00A97A EE 01                    6 	.word set_timer  
      003085                       4600 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A97C 72 A9                    1 	.word LINK 
                           003087     2 	LINK=.
      003087                          3 TIMEOUT:
      00A97E 00                       4 	.byte 7+F_IFUNC   	
      00A97F 03 9F A4 7F 81 55 54     5 	.ascii "TIMEOUT"
      00A984 2C 7F                    6 	.word timeout  
      003091                       4601 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A984 A6 06                    1 	.word LINK 
                           003093     2 	LINK=.
      003093                          3 TICKS:
      00A986 CD                       4 	.byte 5+F_IFUNC   	
      00A987 99 81 CD 97 CB           5 	.ascii "TICKS"
      00A98C A1 02                    6 	.word get_ticks  
      00309B                       4602 	_dict_entry,4,STOP,stop 
      00A98E 27 0E                    1 	.word LINK 
                           00309D     2 	LINK=.
      00309D                          3 STOP:
      00A990 A1                       4 	.byte 4   	
      00A991 04 27 12 A1              5 	.ascii "STOP"
      00A995 82 27                    6 	.word stop  
      0030A4                       4603 	_dict_entry,4,STEP,step 
      00A997 03 CC                    1 	.word LINK 
                           0030A6     2 	LINK=.
      0030A6                          3 STEP:
      00A999 96                       4 	.byte 4   	
      00A99A C2 54 45 50              5 	.ascii "STEP"
      00A99B 22 AF                    6 	.word step  
      0030AD                       4604 	_dict_entry,5,SPIWR,spi_write
      00A99B FD 20                    1 	.word LINK 
                           0030AF     2 	LINK=.
      0030AF                          3 SPIWR:
      00A99D 0B                       4 	.byte 5   	
      00A99E 53 50 49 57 52           5 	.ascii "SPIWR"
      00A99E F6 88                    6 	.word spi_write  
      0030B7                       4605 	_dict_entry,6,SPISEL,spi_select
      00A9A0 CD 97                    1 	.word LINK 
                           0030B9     2 	LINK=.
      0030B9                          3 SPISEL:
      00A9A2 E4                       4 	.byte 6   	
      00A9A3 84 20 03 53 45 4C        5 	.ascii "SPISEL"
      00A9A6 2F 26                    6 	.word spi_select  
      0030C2                       4606 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00A9A6 CD 98                    1 	.word LINK 
                           0030C4     2 	LINK=.
      0030C4                          3 SPIRD:
      00A9A8 0D                       4 	.byte 5+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00A9A9 5F 02 72 A2 00           5 	.ascii "SPIRD"
      00A9AE 03 90                    6 	.word spi_read  
      0030CC                       4607 	_dict_entry,5,SPIEN,spi_enable 
      00A9B0 F7 90                    1 	.word LINK 
                           0030CE     2 	LINK=.
      0030CE                          3 SPIEN:
      00A9B2 EF                       4 	.byte 5   	
      00A9B3 01 A6 07 CD 99           5 	.ascii "SPIEN"
      00A9B8 81 87                    6 	.word spi_enable  
      00A9B9                       4608 	_dict_entry,5,SLEEP,sleep 
      00A9B9 90 F6                    1 	.word LINK 
                           0030D8     2 	LINK=.
      0030D8                          3 SLEEP:
      00A9BB 93                       4 	.byte 5   	
      00A9BC EE 01 72 A9 00           5 	.ascii "SLEEP"
      00A9C1 03 81                    6 	.word sleep  
      00A9C3                       4609     _dict_entry,4,SIZE,cmd_size 
      00A9C3 CD 89                    1 	.word LINK 
                           0030E2     2 	LINK=.
      0030E2                          3 SIZE:
      00A9C5 9B                       4 	.byte 4   	
      00A9C6 81 49 5A 45              5 	.ascii "SIZE"
      00A9C7 1B FD                    6 	.word cmd_size  
      0030E9                       4610 	_dict_entry,4,SAVE,save_app 
      00A9C7 5F C6                    1 	.word LINK 
                           0030EB     2 	LINK=.
      0030EB                          3 SAVE:
      00A9C9 00                       4 	.byte 4   	
      00A9CA 2F C0 00 30              5 	.ascii "SAVE"
      00A9CE 27 03                    6 	.word save_app  
      0030F2                       4611 	_dict_entry 3,RUN,run
      00A9D0 53 A6                    1 	.word LINK 
                           0030F4     2 	LINK=.
      0030F4                          3 RUN:
      00A9D2 FF                       4 	.byte 3   	
      00A9D3 52 55 4E                 5 	.ascii "RUN"
      00A9D3 81 C5                    6 	.word run  
      00A9D4                       4612 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A9D4 CD 99                    1 	.word LINK 
                           0030FC     2 	LINK=.
      0030FC                          3 RSHIFT:
      00A9D6 8E                       4 	.byte 6+F_IFUNC   	
      00A9D7 A1 02 27 03 CC 96        5 	.ascii "RSHIFT"
      00A9DD C2 90                    6 	.word rshift  
      003105                       4613 	_dict_entry,3+F_IFUNC,RND,random 
      00A9DF E6 03                    1 	.word LINK 
                           003107     2 	LINK=.
      003107                          3 RND:
      00A9E1 93                       4 	.byte 3+F_IFUNC   	
      00A9E2 EE 04 A3                 5 	.ascii "RND"
      00A9E5 50 00                    6 	.word random  
      00310D                       4614 	_dict_entry,6,RETURN,return 
      00A9E7 2B 16                    1 	.word LINK 
                           00310F     2 	LINK=.
      00310F                          3 RETURN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00A9E9 A3                       4 	.byte 6   	
      00A9EA 50 29 2A 11 89 90        5 	.ascii "RETURN"
      00A9F0 F6 93                    6 	.word return  
      003118                       4615 	_dict_entry,7,RESTORE,restore 
      00A9F2 EE 01                    1 	.word LINK 
                           00311A     2 	LINK=.
      00311A                          3 RESTORE:
      00A9F4 72                       4 	.byte 7   	
      00A9F5 A9 00 03 72 FB 01 5B     5 	.ascii "RESTORE"
      00A9FC 02 4F                    6 	.word restore  
      003124                       4616 	_dict_entry 3,REM,remark 
      00A9FE 81 1A                    1 	.word LINK 
                           003126     2 	LINK=.
      00A9FF                          3 REM:
      00A9FF A6                       4 	.byte 3   	
      00AA00 0A CC 96                 5 	.ascii "REM"
      00AA03 C4 F9                    6 	.word remark  
      00AA04                       4617 	_dict_entry,6,REBOOT,cold_start
      00AA04 CD A8                    1 	.word LINK 
                           00312E     2 	LINK=.
      00312E                          3 REBOOT:
      00AA06 10                       4 	.byte 6   	
      00AA07 26 13 AE B6 80 72        5 	.ascii "REBOOT"
      00AA0D BB B6                    6 	.word cold_start  
      003137                       4618 	_dict_entry,4+F_IFUNC,READ,read  
      00AA0F 82 1C                    1 	.word LINK 
                           003139     2 	LINK=.
      003139                          3 READ:
      00AA11 00                       4 	.byte 4+F_IFUNC   	
      00AA12 04 1C 00 80              5 	.ascii "READ"
      00AA16 9F A4                    6 	.word read  
      003140                       4619 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00AA18 80 97                    1 	.word LINK 
                           003142     2 	LINK=.
      003142                          3 QKEY:
      00AA1A 20                       4 	.byte 4+F_IFUNC   	
      00AA1B 03 AE B6 80              5 	.ascii "QKEY"
      00AA1F 29 47                    6 	.word qkey  
      003149                       4620 	_dict_entry,3,PUT,xput 
      00AA1F 4F 81                    1 	.word LINK 
                           00314B     2 	LINK=.
      00AA21                          3 PUT:
      00AA21 CD                       4 	.byte 3   	
      00AA22 99 8E A1                 5 	.ascii "PUT"
      00AA25 02 27                    6 	.word xput  
      003151                       4621 	_dict_entry,4,PUSH,xpush   
      00AA27 03 CC                    1 	.word LINK 
                           003153     2 	LINK=.
      003153                          3 PUSH:
      00AA29 96                       4 	.byte 4   	
      00AA2A C2 55 53 48              5 	.ascii "PUSH"
      00AA2B 2F 42                    6 	.word xpush  
      00315A                       4622 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AA2B 90 E6                    1 	.word LINK 
                           00315C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00315C                          3 PORTI:
      00AA2D 03                       4 	.byte 5+F_IFUNC   	
      00AA2E 93 EE 04 CF 00           5 	.ascii "PORTI"
      00AA33 1A 90                    6 	.word const_porti  
      003164                       4623 	_dict_entry,5+F_IFUNC,PORTH,const_porth 
      00AA35 F6 93                    1 	.word LINK 
                           003166     2 	LINK=.
      003166                          3 PORTH:
      00AA37 EE                       4 	.byte 5+F_IFUNC   	
      00AA38 01 72 A9 00 03           5 	.ascii "PORTH"
      00AA3D 90 F7                    6 	.word const_porth  
      00316E                       4624 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AA3F 90 EF                    1 	.word LINK 
                           003170     2 	LINK=.
      003170                          3 PORTG:
      00AA41 01                       4 	.byte 5+F_IFUNC   	
      00AA42 72 CD 00 1A 81           5 	.ascii "PORTG"
      00AA47 2D 84                    6 	.word const_portg  
      003178                       4625 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AA47 72 0D                    1 	.word LINK 
                           00317A     2 	LINK=.
      00317A                          3 PORTF:
      00AA49 52                       4 	.byte 5+F_IFUNC   	
      00AA4A 30 FB 8E CC 81           5 	.ascii "PORTF"
      00AA4F 43 7F                    6 	.word const_portf  
      00AA50                       4626 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AA50 72 0D                    1 	.word LINK 
                           003184     2 	LINK=.
      003184                          3 PORTE:
      00AA52 52                       4 	.byte 5+F_IFUNC   	
      00AA53 30 FB 72 16 00           5 	.ascii "PORTE"
      00AA58 23 8E                    6 	.word const_porte  
      00318C                       4627 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AA5A 81 84                    1 	.word LINK 
                           00318E     2 	LINK=.
      00AA5B                          3 PORTD:
      00AA5B CD                       4 	.byte 5+F_IFUNC   	
      00AA5C 9A CA A1 84 27           5 	.ascii "PORTD"
      00AA61 03 CC                    6 	.word const_portd  
      003196                       4628 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AA63 96 C2                    1 	.word LINK 
                           003198     2 	LINK=.
      003198                          3 PORTC:
      00AA65 90                       4 	.byte 5+F_IFUNC   	
      00AA66 F6 93 EE 01 72           5 	.ascii "PORTC"
      00AA6B A9 00                    6 	.word const_portc  
      0031A0                       4629 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AA6D 03 98                    1 	.word LINK 
                           0031A2     2 	LINK=.
      00AA6E                          3 PORTB:
      00AA6E CF                       4 	.byte 5+F_IFUNC   	
      00AA6F 00 13 CE 00 13           5 	.ascii "PORTB"
      00AA74 5D 27                    6 	.word const_portb  
      0031AA                       4630 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AA76 03 8F                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



                           0031AC     2 	LINK=.
      0031AC                          3 PORTA:
      00AA78 26                       4 	.byte 5+F_IFUNC   	
      00AA79 F7 4F 52 54 41           5 	.ascii "PORTA"
      00AA7A 2D 66                    6 	.word const_porta  
      0031B4                       4631 	_dict_entry 5,PRINT,print 
      00AA7A 81 AC                    1 	.word LINK 
                           0031B6     2 	LINK=.
      00AA7B                          3 PRINT:
      00AA7B CD                       4 	.byte 5   	
      00AA7C 9A CA A1 84 27           5 	.ascii "PRINT"
      00AA81 03 CC                    6 	.word print  
      0031BE                       4632 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AA83 96 C2                    1 	.word LINK 
                           0031C0     2 	LINK=.
      0031C0                          3 POUT:
      00AA85 90                       4 	.byte 4+F_IFUNC   	
      00AA86 F6 93 EE 01              5 	.ascii "POUT"
      00AA8A 72 A9                    6 	.word const_output  
      0031C7                       4633 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AA8C 00 03                    1 	.word LINK 
                           0031C9     2 	LINK=.
      00AA8E                          3 POP:
      00AA8E A3                       4 	.byte 3+F_IFUNC   	
      00AA8F 14 00 2B                 5 	.ascii "POP"
      00AA92 0C 35                    6 	.word xpop  
      0031CF                       4634 	_dict_entry,4,POKE,poke 
      00AA94 0F 50                    1 	.word LINK 
                           0031D1     2 	LINK=.
      0031D1                          3 POKE:
      00AA96 F2                       4 	.byte 4   	
      00AA97 A6 1E 62 A6              5 	.ascii "POKE"
      00AA9B 10 62                    6 	.word poke  
      0031D8                       4635 	_dict_entry,5,PMODE,pin_mode 
      00AA9D 20 1E                    1 	.word LINK 
                           0031DA     2 	LINK=.
      00AA9F                          3 PMODE:
      00AA9F A3                       4 	.byte 5   	
      00AAA0 08 00 2B 09 35           5 	.ascii "PMODE"
      00AAA5 0E 50                    6 	.word pin_mode  
      0031E2                       4636 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AAA7 F2 A6                    1 	.word LINK 
                           0031E4     2 	LINK=.
      0031E4                          3 PINP:
      00AAA9 50                       4 	.byte 4+F_IFUNC   	
      00AAAA 62 20 10 50              5 	.ascii "PINP"
      00AAAD 2D B1                    6 	.word const_input  
      0031EB                       4637 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AAAD 35 07                    1 	.word LINK 
                           0031ED     2 	LINK=.
      0031ED                          3 PICK:
      00AAAF 50                       4 	.byte 4+F_IFUNC   	
      00AAB0 F2 49 43 4B              5 	.ascii "PICK"
      00AAB1 30 04                    6 	.word xpick  
      0031F4                       4638 	_dict_entry,4+F_IFUNC,PEEK,peek 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAB1 A3 00                    1 	.word LINK 
                           0031F6     2 	LINK=.
      0031F6                          3 PEEK:
      00AAB3 40                       4 	.byte 4+F_IFUNC   	
      00AAB4 23 07 72 5C              5 	.ascii "PEEK"
      00AAB8 50 F2                    6 	.word peek  
      0031FD                       4639 	_dict_entry,5,PAUSE,pause 
      00AABA 54 20                    1 	.word LINK 
                           0031FF     2 	LINK=.
      0031FF                          3 PAUSE:
      00AABC F4                       4 	.byte 5   	
      00AABD 50 41 55 53 45           5 	.ascii "PAUSE"
      00AABD 9F 4A                    6 	.word pause  
      003207                       4640 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AABF 27 01                    1 	.word LINK 
                           003209     2 	LINK=.
      003209                          3 PAD:
      00AAC1 4A                       4 	.byte 3+F_IFUNC   	
      00AAC2 50 41 44                 5 	.ascii "PAD"
      00AAC2 A4 3E                    6 	.word pad_ref  
      00320F                       4641 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00AAC4 C7 50                    1 	.word LINK 
                           003211     2 	LINK=.
      003211                          3 OR:
      00AAC6 F1                       4 	.byte 2+F_OR   	
      00AAC7 72 18                    5 	.ascii "OR"
      00AAC9 50 F0                    6 	.word TK_OR  
      003216                       4642 	_dict_entry,2,ON,cmd_on 
      00AACB 8E 81                    1 	.word LINK 
                           003218     2 	LINK=.
      00AACD                          3 ON:
      00AACD C6                       4 	.byte 2   	
      00AACE 00 10                    5 	.ascii "ON"
      00AAD0 CE 00                    6 	.word cmd_on  
      00321D                       4643 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00AAD2 11 81                    1 	.word LINK 
                           00321F     2 	LINK=.
      00AAD4                          3 ODR:
      00AAD4 CD                       4 	.byte 3+F_IFUNC   	
      00AAD5 99 8E A1                 5 	.ascii "ODR"
      00AAD8 01 27                    6 	.word const_odr  
      003225                       4644 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00AADA 03 CC                    1 	.word LINK 
                           003227     2 	LINK=.
      003227                          3 NOT:
      00AADC 96                       4 	.byte 3+F_NOT   	
      00AADD C2 4F 54                 5 	.ascii "NOT"
      00AADE 00 87                    6 	.word TK_NOT  
      00322D                       4645 	_dict_entry,4,NEXT,next 
      00AADE CD 82                    1 	.word LINK 
                           00322F     2 	LINK=.
      00322F                          3 NEXT:
      00AAE0 6E                       4 	.byte 4   	
      00AAE1 90 F6 93 EE              5 	.ascii "NEXT"
      00AAE5 01 72                    6 	.word next  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      003236                       4646 	_dict_entry,3,NEW,new
      00AAE7 A9 00                    1 	.word LINK 
                           003238     2 	LINK=.
      003238                          3 NEW:
      00AAE9 03                       4 	.byte 3   	
      00AAEA 81 45 57                 5 	.ascii "NEW"
      00AAEB 27 15                    6 	.word new  
      00323E                       4647 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00AAEB CD 99                    1 	.word LINK 
                           003240     2 	LINK=.
      003240                          3 LSHIFT:
      00AAED 8E                       4 	.byte 6+F_IFUNC   	
      00AAEE A1 02 27 03 CC 96        5 	.ascii "LSHIFT"
      00AAF4 C2 90                    6 	.word lshift  
      003249                       4648 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00AAF6 F6 93                    1 	.word LINK 
                           00324B     2 	LINK=.
      00324B                          3 LOG2:
      00AAF8 EE                       4 	.byte 4+F_IFUNC   	
      00AAF9 01 72 A9 00              5 	.ascii "LOG2"
      00AAFD 03 90                    6 	.word log2  
      003252                       4649 	_dict_entry 4,LIST,list
      00AAFF 93 90                    1 	.word LINK 
                           003254     2 	LINK=.
      003254                          3 LIST:
      00AB01 F6                       4 	.byte 4   	
      00AB02 93 EE 01 90              5 	.ascii "LIST"
      00AB06 5D 27                    6 	.word list  
      00325B                       4650 	_dict_entry 3,LET,let 
      00AB08 07 98                    1 	.word LINK 
                           00325D     2 	LINK=.
      00325D                          3 LET:
      00AB0A 59                       4 	.byte 3   	
      00AB0B 49 90 5A                 5 	.ascii "LET"
      00AB0E 26 F9                    6 	.word let  
      003263                       4651 	_dict_entry,3+F_CFUNC,KEY,key 
      00AB10 90 F7                    1 	.word LINK 
                           003265     2 	LINK=.
      003265                          3 KEY:
      00AB12 90                       4 	.byte 3+F_CFUNC   	
      00AB13 EF 01 A6                 5 	.ascii "KEY"
      00AB16 84 81                    6 	.word key  
      00AB18                       4652 	_dict_entry,7,IWDGREF,refresh_iwdg
      00AB18 CD 99                    1 	.word LINK 
                           00326D     2 	LINK=.
      00326D                          3 IWDGREF:
      00AB1A 8E                       4 	.byte 7   	
      00AB1B A1 02 27 03 CC 96 C2     5 	.ascii "IWDGREF"
      00AB22 90 F6                    6 	.word refresh_iwdg  
      003277                       4653 	_dict_entry,6,IWDGEN,enable_iwdg
      00AB24 93 EE                    1 	.word LINK 
                           003279     2 	LINK=.
      003279                          3 IWDGEN:
      00AB26 01                       4 	.byte 6   	
      00AB27 72 A9 00 03 90 93        5 	.ascii "IWDGEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB2D 90 F6                    6 	.word enable_iwdg  
      003282                       4654 	_dict_entry,5,INPUT,input_var  
      00AB2F 93 EE                    1 	.word LINK 
                           003284     2 	LINK=.
      003284                          3 INPUT:
      00AB31 01                       4 	.byte 5   	
      00AB32 90 5D 27 07 98           5 	.ascii "INPUT"
      00AB37 56 46                    6 	.word input_var  
      00328C                       4655 	_dict_entry,2,IF,if 
      00AB39 90 5A                    1 	.word LINK 
                           00328E     2 	LINK=.
      00328E                          3 IF:
      00AB3B 26                       4 	.byte 2   	
      00AB3C F9 90                    5 	.ascii "IF"
      00AB3E F7 90                    6 	.word if  
      003293                       4656 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AB40 EF 01                    1 	.word LINK 
                           003295     2 	LINK=.
      003295                          3 IDR:
      00AB42 A6                       4 	.byte 3+F_IFUNC   	
      00AB43 84 81 52                 5 	.ascii "IDR"
      00AB45 2D 98                    6 	.word const_idr  
      00329B                       4657 	_dict_entry,3,HEX,hex_base
      00AB45 A6 84                    1 	.word LINK 
                           00329D     2 	LINK=.
      00329D                          3 HEX:
      00AB47 CD                       4 	.byte 3   	
      00AB48 99 81 CD                 5 	.ascii "HEX"
      00AB4B 97 FD                    6 	.word hex_base  
      0032A3                       4658 	_dict_entry,4,GOTO,goto 
      00AB4D 9F A4                    1 	.word LINK 
                           0032A5     2 	LINK=.
      0032A5                          3 GOTO:
      00AB4F 07                       4 	.byte 4   	
      00AB50 C7 50 C6 81              5 	.ascii "GOTO"
      00AB54 24 6A                    6 	.word goto  
      0032AC                       4659 	_dict_entry,5,GOSUB,gosub 
      00AB54 52 01                    1 	.word LINK 
                           0032AE     2 	LINK=.
      0032AE                          3 GOSUB:
      00AB56 CD                       4 	.byte 5   	
      00AB57 99 93 A1 02 27           5 	.ascii "GOSUB"
      00AB5C 03 CC                    6 	.word gosub  
      0032B6                       4660 	_dict_entry,3,GET,cmd_get 
      00AB5E 96 C2                    1 	.word LINK 
                           0032B8     2 	LINK=.
      0032B8                          3 GET:
      00AB60 90                       4 	.byte 3   	
      00AB61 F6 93 EE                 5 	.ascii "GET"
      00AB64 01 72                    6 	.word cmd_get  
      0032BE                       4661 	_dict_entry,4+F_IFUNC,FREE,free
      00AB66 A9 00                    1 	.word LINK 
                           0032C0     2 	LINK=.
      0032C0                          3 FREE:
      00AB68 03                       4 	.byte 4+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00AB69 CF 00 1A 90              5 	.ascii "FREE"
      00AB6D F6 93                    6 	.word free  
      0032C7                       4662 	_dict_entry,3,FOR,for 
      00AB6F EE 01                    1 	.word LINK 
                           0032C9     2 	LINK=.
      0032C9                          3 FOR:
      00AB71 72                       4 	.byte 3   	
      00AB72 A9 00 03                 5 	.ascii "FOR"
      00AB75 CD AB                    6 	.word for  
      0032CF                       4663 	_dict_entry,4,FCPU,fcpu 
      00AB77 B3 6B                    1 	.word LINK 
                           0032D1     2 	LINK=.
      0032D1                          3 FCPU:
      00AB79 01                       4 	.byte 4   	
      00AB7A A6 01 0D 01              5 	.ascii "FCPU"
      00AB7E 27 0D                    6 	.word fcpu  
      0032D8                       4664 	_dict_entry,5,ERASE,erase 
      00AB80 48 0A                    1 	.word LINK 
                           0032DA     2 	LINK=.
      0032DA                          3 ERASE:
      00AB82 01                       4 	.byte 5   	
      00AB83 26 FB 6B 01 7B           5 	.ascii "ERASE"
      00AB88 01 EA                    6 	.word erase  
      0032E2                       4665 	_dict_entry,3,END,cmd_end  
      00AB8A 03 E7                    1 	.word LINK 
                           0032E4     2 	LINK=.
      0032E4                          3 END:
      00AB8C 03                       4 	.byte 3   	
      00AB8D A6 01 C1                 5 	.ascii "END"
      00AB90 00 0F                    6 	.word cmd_end  
      0032EA                       4666 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AB92 27 10                    1 	.word LINK 
                           0032EC     2 	LINK=.
      0032EC                          3 EEPROM:
      00AB94 7B                       4 	.byte 6+F_IFUNC   	
      00AB95 01 43 E4 04 E7 04        5 	.ascii "EEPROM"
      00AB9B 7B 01                    6 	.word const_eeprom_base  
      0032F5                       4667 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AB9D 43 E4                    1 	.word LINK 
                           0032F7     2 	LINK=.
      0032F7                          3 EEFREE:
      00AB9F 02                       4 	.byte 6+F_IFUNC   	
      00ABA0 E7 02 20 0C 45 45        5 	.ascii "EEFREE"
      00ABA4 1C F3                    6 	.word func_eefree  
      003300                       4668 	_dict_entry,4,EDIT,edit 
      00ABA4 7B 01                    1 	.word LINK 
                           003302     2 	LINK=.
      003302                          3 EDIT:
      00ABA6 EA                       4 	.byte 4   	
      00ABA7 02 E7 02 7B              5 	.ascii "EDIT"
      00ABAB 01 EA                    6 	.word edit  
      003309                       4669 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00ABAD 04 E7                    1 	.word LINK 
                           00330B     2 	LINK=.
      00330B                          3 DWRITE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



      00ABAF 04                       4 	.byte 6+F_CMD   	
      00ABB0 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00ABB0 5B 01                    6 	.word digital_write  
      003314                       4670 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00ABB2 81 0B                    1 	.word LINK 
                           003316     2 	LINK=.
      00ABB3                          3 DROP:
      00ABB3 58                       4 	.byte 4   	
      00ABB4 1C AB C3 FE              5 	.ascii "DROP"
      00ABB8 9F 88                    6 	.word xdrop  
      00331D                       4671 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00ABBA 5E A6                    1 	.word LINK 
                           00331F     2 	LINK=.
      00331F                          3 DREAD:
      00ABBC 05                       4 	.byte 5+F_IFUNC   	
      00ABBD 42 1C 50 00 84           5 	.ascii "DREAD"
      00ABC2 81 47                    6 	.word digital_read  
      00ABC3                       4672 	_dict_entry,2,DO,do_loop
      00ABC3 03 06                    1 	.word LINK 
                           003329     2 	LINK=.
      003329                          3 DO:
      00ABC5 03                       4 	.byte 2   	
      00ABC6 05 04                    5 	.ascii "DO"
      00ABC8 00 02                    6 	.word do_loop  
      00332E                       4673 	_dict_entry,3,DEC,dec_base
      00ABCA 01 06                    1 	.word LINK 
                           003330     2 	LINK=.
      003330                          3 DEC:
      00ABCC 00                       4 	.byte 3   	
      00ABCD 02 02 02                 5 	.ascii "DEC"
      00ABD0 03 03                    6 	.word dec_base  
      003336                       4674 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00ABD2 01 03                    1 	.word LINK 
                           003338     2 	LINK=.
      003338                          3 DDR:
      00ABD4 03                       4 	.byte 3+F_IFUNC   	
      00ABD5 02 04 04                 5 	.ascii "DDR"
      00ABD8 05 02                    6 	.word const_ddr  
      00333E                       4675 	_dict_entry,4,DATA,data  
      00ABDA 06 02                    1 	.word LINK 
                           003340     2 	LINK=.
      003340                          3 DATA:
      00ABDC 07                       4 	.byte 4   	
      00ABDD 02 05 04 02              5 	.ascii "DATA"
      00ABE1 04 01                    6 	.word data  
      00ABE3                       4676 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00ABE3 CD 99                    1 	.word LINK 
                           003349     2 	LINK=.
      003349                          3 CR2:
      00ABE5 8E                       4 	.byte 3+F_IFUNC   	
      00ABE6 A1 01 27                 5 	.ascii "CR2"
      00ABE9 03 CC                    6 	.word const_cr2  
      00334F                       4677 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00ABEB 96 C2                    1 	.word LINK 
                           003351     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00ABED                          3 CR1:
      00ABED 90                       4 	.byte 3+F_IFUNC   	
      00ABEE F6 93 EE                 5 	.ascii "CR1"
      00ABF1 01 72                    6 	.word const_cr1  
      003357                       4678 	_dict_entry,5,CONST,cmd_const 
      00ABF3 A9 00                    1 	.word LINK 
                           003359     2 	LINK=.
      003359                          3 CONST:
      00ABF5 03                       4 	.byte 5   	
      00ABF6 89 88 A6 80 15           5 	.ascii "CONST"
      00ABFB 01 27                    6 	.word cmd_const  
      003361                       4679 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00ABFD 05 A6                    1 	.word LINK 
                           003363     2 	LINK=.
      003363                          3 CHAR:
      00ABFF 0A                       4 	.byte 4+F_CFUNC   	
      00AC00 CC 96 C4 52              5 	.ascii "CHAR"
      00AC03 28 ED                    6 	.word func_char  
      00336A                       4680 	_dict_entry,3,BYE,bye 
      00AC03 CE 00                    1 	.word LINK 
                           00336C     2 	LINK=.
      00336C                          3 BYE:
      00AC05 15                       4 	.byte 3   	
      00AC06 58 58 58                 5 	.ascii "BYE"
      00AC09 58 58                    6 	.word bye  
      003372                       4681 	_dict_entry,5,BTOGL,bit_toggle
      00AC0B 9E C8                    1 	.word LINK 
                           003374     2 	LINK=.
      003374                          3 BTOGL:
      00AC0D 00                       4 	.byte 5   	
      00AC0E 15 C7 00 0E 9F           5 	.ascii "BTOGL"
      00AC13 C8 00                    6 	.word bit_toggle  
      00337C                       4682 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AC15 16 C7                    1 	.word LINK 
                           00337E     2 	LINK=.
      00337E                          3 BTEST:
      00AC17 00                       4 	.byte 5+F_IFUNC   	
      00AC18 0F CE 00 17 CF           5 	.ascii "BTEST"
      00AC1D 00 15                    6 	.word bit_test  
      003386                       4683 	_dict_entry,4,BSET,bit_set 
      00AC1F CE 00                    1 	.word LINK 
                           003388     2 	LINK=.
      003388                          3 BSET:
      00AC21 17                       4 	.byte 4   	
      00AC22 54 9E C8 00              5 	.ascii "BSET"
      00AC26 17 C7                    6 	.word bit_set  
      00338F                       4684 	_dict_entry,4,BRES,bit_reset
      00AC28 00 17                    1 	.word LINK 
                           003391     2 	LINK=.
      003391                          3 BRES:
      00AC2A 9F                       4 	.byte 4   	
      00AC2B C8 00 18 C7              5 	.ascii "BRES"
      00AC2F 00 18                    6 	.word bit_reset  
      003398                       4685 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AC31 CE 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



                           00339A     2 	LINK=.
      00339A                          3 BIT:
      00AC33 0E                       4 	.byte 3+F_IFUNC   	
      00AC34 54 54 54                 5 	.ascii "BIT"
      00AC37 9E C8                    6 	.word bitmask  
      0033A0                       4686 	_dict_entry,3,AWU,awu 
      00AC39 00 0E                    1 	.word LINK 
                           0033A2     2 	LINK=.
      0033A2                          3 AWU:
      00AC3B C7                       4 	.byte 3   	
      00AC3C 00 0E 9F                 5 	.ascii "AWU"
      00AC3F C8 00                    6 	.word awu  
      0033A8                       4687 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AC41 0F C7                    1 	.word LINK 
                           0033AA     2 	LINK=.
      0033AA                          3 ASC:
      00AC43 00                       4 	.byte 3+F_IFUNC   	
      00AC44 0F C8 00                 5 	.ascii "ASC"
      00AC47 18 97                    6 	.word ascii  
      0033B0                       4688 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AC49 C6 00                    1 	.word LINK 
                           0033B2     2 	LINK=.
      0033B2                          3 AND:
      00AC4B 0E                       4 	.byte 3+F_AND   	
      00AC4C C8 00 17                 5 	.ascii "AND"
      00AC4F 95 CF                    6 	.word TK_AND  
      0033B8                       4689 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AC51 00 17                    1 	.word LINK 
                           0033BA     2 	LINK=.
      0033BA                          3 ALLOC:
      00AC53 C6                       4 	.byte 5   	
      00AC54 00 16 A4 7F 72           5 	.ascii "ALLOC"
      00AC59 A2 00                    6 	.word xalloc  
      0033C2                       4690 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AC5B 03 90                    1 	.word LINK 
                           0033C4     2 	LINK=.
      0033C4                          3 ADCREAD:
      00AC5D F7                       4 	.byte 7+F_IFUNC   	
      00AC5E 90 EF 01 84 85 72 A2     5 	.ascii "ADCREAD"
      00AC65 00 03                    6 	.word analog_read  
      0033CE                       4691 	_dict_entry,5,ADCON,power_adc 
      00AC67 90 F7                    1 	.word LINK 
                           0033D0     2 	LINK=.
      0033D0                          3 ADCON:
      00AC69 90                       4 	.byte 5   	
      00AC6A EF 01 CD 84 1C           5 	.ascii "ADCON"
      00AC6F 90 F6                    6 	.word power_adc  
      0033D8                       4692 kword_dict::
      0033D8                       4693 	_dict_entry,3+F_IFUNC,ABS,abs
      00AC71 93 EE                    1 	.word LINK 
                           0033DA     2 	LINK=.
      0033DA                          3 ABS:
      00AC73 01                       4 	.byte 3+F_IFUNC   	
      00AC74 72 A9 00                 5 	.ascii "ABS"
      00AC77 03 1C                    6 	.word abs  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



                                   4694 
                           000000  4695 INDIRECT=0 
                           000000  4696 .if INDIRECT 
                                   4697 ;comands and fonctions address table 	
                                   4698 code_addr::
                                   4699 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
                                   4700 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,func_char,const_cr2  ; 8..15
                                   4701 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
                                   4702 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto ; 24..31 
                                   4703 	.word hex_base,const_idr,if,input_var,enable_iwdg,refresh_iwdg,key ; 32..39 
                                   4704 	.word let,list,log2,lshift,next,new ; 40..47
                                   4705 	.word const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
                                   4706 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
                                   4707 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
                                   4708 	.word restore,return, random,rshift,run,free ; 72..79
                                   4709 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
                                   4710 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
                                   4711 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
                                   4712 	.word func_eefree,0 
                                   4713 .endif 
                                   4714 
                                   4715 
                                   4716 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
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
      0033E0                         30 test:
      0033E0                         31     _vars VSIZE 
      00AC79 00 01            [ 2]    1     sub sp,#VSIZE 
      00AC7B A9 00 81         [ 2]   32     ldw x,#LOOP_CNT
      00AC7E 1F 03            [ 2]   33     ldw (CNTR,sp),x  
      00AC7E 90 89 52         [ 2]   34     ldw x,ticks 
      00AC81 03 0F            [ 2]   35     ldw (T,sp),x
      0033EC                         36 1$: ; test add24 
      00AC83 02 0F            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC85 03 90 AE         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC88 B4 5A 93         [ 1]   39     ld acc24,a 
      00AC8B F6 A4 0F         [ 2]   40     ldw acc24+1,x  
      00AC8E 6B 01            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC90 0C 03 5C         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC93 F6 CD 89         [ 4]   43     call add24 
      00AC96 8B 0C            [ 2]   44     ldw x,(CNTR,sp)
      00AC98 02 0A 01         [ 2]   45     subw x,#1
      00AC9B 26 F5            [ 2]   46     ldw (CNTR,sp),x 
      00AC9D A6 46            [ 1]   47     jrne 1$
      00AC9F 11 02 2B         [ 4]   48     call prt_acc24
      00ACA2 09 A6            [ 1]   49     ld a,#SPACE 
      00ACA4 20 CD 89         [ 4]   50     call putc 
      00ACA7 8B 0C 02         [ 2]   51     ldw x,ticks 
      00ACAA 20 07 A6         [ 2]   52     subw x,(T,sp)
      00ACAD 0D CD 89         [ 4]   53     call prt_i16  
      00ACB0 8B 0F            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00ACB2 02 72 A2         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ACB5 00 02 90         [ 2]   58     ldw x,LOOP_CNT
      00ACB8 FE 26            [ 2]   59     ldw (CNTR,sp),x 
      00ACBA CF A6 0D         [ 2]   60     ldw x,ticks 
      00ACBD CD 89            [ 2]   61     ldw (T,sp),x 
      003428                         62 2$: 
      00ACBF 8B 5F            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ACC1 7B 03 97         [ 2]   64     ldw x,#VAL1&0XFFFF
      00ACC4 CD 98 13         [ 1]   65     ld acc24,a 
      00ACC7 AE AC D2         [ 2]   66     ldw acc24+1,x  
      00ACCA CD 89            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00ACCC E8 5B 03         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00ACCF 90 85 81         [ 4]   69     call mul24 
      00ACD2 20 77            [ 2]   70     ldw x,(CNTR,sp)
      00ACD4 6F 72 64         [ 2]   71     subw x,#1
      00ACD7 73 20            [ 2]   72     ldw (CNTR,sp),x 
      00ACD9 69 6E            [ 1]   73     jrne 2$ 
      00ACDB 20 64 69         [ 4]   74    call prt_acc24 
      00ACDE 63 74            [ 1]   75    ld a,#SPACE 
      00ACE0 69 6F 6E         [ 4]   76    call putc 
      00ACE3 61 72 79         [ 2]   77     ldw x,ticks 
      00ACE6 0A 00 01         [ 2]   78     subw x,(T,sp)
      00ACE8 CD 17 93         [ 4]   79     call prt_i16 
      00ACE8 CD 99            [ 1]   80     ld a,#CR 
      00ACEA 93 A1 01         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00ACED 27 03 CC         [ 2]   83     ldw x,LOOP_CNT
      00ACF0 96 C2            [ 2]   84     ldw (CNTR,sp),x 
      00ACF2 CE 00 0F         [ 2]   85     ldw x,ticks 
      00ACF2 90 F6            [ 2]   86     ldw (T,sp),x 
      003464                         87 3$: 
      00ACF4 93 EE            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00ACF6 01 72 A9         [ 2]   89     ldw x,#VAL1&0XFFFF
      00ACF9 00 03 CF         [ 1]   90     ld acc24,a 
      00ACFC 00 13 81         [ 2]   91     ldw acc24+1,x  
      00ACFF A6 00            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00ACFF 4F CE 00         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AD02 13 27 02         [ 4]   94     call mul24 
      00AD05 5F 81            [ 2]   95     ldw x,(CNTR,sp)
      00AD07 43 53 81         [ 2]   96     subw x,#1
      00AD0A 1F 03            [ 2]   97     ldw (CNTR,sp),x 
      00AD0A CD 99            [ 1]   98     jrne 3$ 
      00AD0C 93 A1 01         [ 4]   99     call prt_acc24    
      00AD0F 27 03            [ 1]  100     ld a,#SPACE 
      00AD11 CC 96 C2         [ 4]  101     call putc 
      00AD14 90 F6 93         [ 2]  102     ldw x,ticks 
      00AD17 EE 01 72         [ 2]  103     subw x,(T,sp)
      00AD1A A9 00 03         [ 4]  104     call prt_i16 
      00AD1D 4B 00            [ 1]  105     ld a,#CR 
      00AD1F 35 CC 50         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AD22 E0 9E A4         [ 2]  108     ldw x,LOOP_CNT
      00AD25 3F 95            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00AD27 A3 00 FF         [ 2]  110     ldw x,ticks 
      00AD2A 23 06            [ 2]  111     ldw (T,sp),x 
      0034A0                        112 4$:
      00AD2C 0C 01            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AD2E 98 56 20         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AD31 F5 35 55         [ 1]  115     ld acc24,a 
      00AD34 50 E0 84         [ 2]  116     ldw acc24+1,x  
      00AD37 C7 50            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AD39 E1 9F 4A         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AD3C 35 55 50         [ 4]  119     call mul24 
      00AD3F E0 C7            [ 2]  120     ldw x,(CNTR,sp)
      00AD41 50 E2 35         [ 2]  121     subw x,#1
      00AD44 AA 50            [ 2]  122     ldw (CNTR,sp),x 
      00AD46 E0 81            [ 1]  123     jrne 4$ 
      00AD48 CD 17 AA         [ 4]  124     call prt_acc24 
      00AD48 35 AA            [ 1]  125     ld a,#SPACE 
      00AD4A 50 E0 81         [ 4]  126     call putc 
      00AD4D CE 00 0F         [ 2]  127     ldw x,ticks 
      00AD4D CD 99 8E         [ 2]  128     subw x,(T,sp)
      00AD50 A1 01 27         [ 4]  129     call prt_i16 
      00AD53 03 CC            [ 1]  130     ld a,#CR 
      00AD55 96 C2 0B         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AD57 CE 27 10         [ 2]  133     ldw x,LOOP_CNT
      00AD57 90 F6            [ 2]  134     ldw (CNTR,sp),x 
      00AD59 93 EE 01         [ 2]  135     ldw x,ticks 
      00AD5C 72 A9            [ 2]  136     ldw (T,sp),x 
      0034DC                        137 5$: 
      00AD5E 00 03            [ 1]  138     ld a,#0xff
      00AD60 4D 26 08         [ 2]  139     ldw x,#0xffff
      00AD63 5D 26 05         [ 4]  140     call abs24 
      00AD66 A6 0A CC         [ 1]  141     ld acc24,a 
      00AD69 96 C4 4B         [ 2]  142     ldw acc24+1,x
      00AD6C 18 59            [ 2]  143     ldw x,(CNTR,sp)
      00AD6E 49 25 04         [ 2]  144     subw x,#1
      00AD71 0A 01            [ 2]  145     ldw (CNTR,sp),x 
      00AD73 26 F8            [ 1]  146     jrne 5$ 
      00AD75 5F 84 4A         [ 4]  147     call prt_acc24 
      00AD78 02 20            [ 1]  148     ld a,#SPACE 
      00AD79 CD 09 0B         [ 4]  149     call putc 
      00AD79 81 00 0F         [ 2]  150     ldw x,ticks 
      00AD7A 72 F0 01         [ 2]  151     subw x,(T,sp)
      00AD7A CD 99 8E         [ 4]  152     call prt_i16 
      003504                        153 6$:
      00AD7D A1 01            [ 1]  154     ld a,#CR 
      00AD7F 27 03 CC         [ 4]  155     call putc 
      00AD82 96 C2 90         [ 4]  156     call read_integer 
      00AD85 F6 93 EE 01 72   [ 1]  157     mov farptr,acc24 
      00AD8A A9 00 03 9F AE   [ 1]  158     mov farptr+1,acc16 
      00AD8F 00 01 A4 17 27   [ 1]  159     mov farptr+2,acc8 
      00AD94 0A 88 4F         [ 4]  160     call read_integer 
      00AD97 C6 00 0C         [ 1]  161     ld a,acc24 
      00AD97 58 49 0A         [ 2]  162     ldw x,acc16 
      00AD9A 01 26 FA 00 0C   [ 1]  163     mov acc24,farptr 
      00AD9D 55 00 19 00 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



      00AD9D 5B 01 81 00 0E   [ 1]  165     mov acc8,farptr+2 
      00ADA0 CD 03 02         [ 4]  166     call div24 
      00ADA0 85               [ 1]  167     push a 
      00ADA1 52               [ 2]  168     pushw x 
      00ADA2 04 89 CE         [ 4]  169     call prt_acc24 
      00ADA5 00 05            [ 1]  170     ld a,#SPACE 
      00ADA7 1F 03 CE         [ 4]  171     call putc 
      00ADAA 00               [ 2]  172     popw x
      00ADAB 01 1F 05         [ 2]  173     ldw acc16,x  
      00ADAE 72 5C 00         [ 1]  174     pop acc24 
      00ADB1 20 81 AA         [ 4]  175     call prt_acc24
      00ADB3 20 B8            [ 2]  176     jra 6$
      00354C                        177     _drop VSIZE 
      00ADB3 72 5D            [ 2]    1     addw sp,#VSIZE 
      00ADB5 00               [ 4]  178     ret 
                                    179 
                                    180 
      00354F                        181 read_integer:
      00ADB6 20 26            [ 1]  182     ld a,#'? 
      00ADB8 03 CC 96         [ 4]  183     call putc  
      00ADBB C2 5F 00 03      [ 1]  184 	clr count  
      00ADBC CD 0A 6D         [ 4]  185 	call readln 
      00ADBC CD 9B E3         [ 2]  186 	ldw x,#tib 
      00ADBF 90 F6 93         [ 1]  187 	push count
      00ADC2 EE 01            [ 1]  188 	push #0 
      00ADC4 72 A9 00         [ 2]  189 	addw x,(1,sp)
      00ADC7 03               [ 1]  190 	incw x 
      003567                        191 	_drop 2 
      00ADC8 4D 26            [ 2]    1     addw sp,#2 
      00ADCA 13 5D 26 10      [ 1]  192 	clr in 
      00ADCE 1E 03 CF         [ 4]  193 	call get_token
      00ADD1 00 05            [ 1]  194 	cp a,#TK_INTGR
      00ADD3 E6 02            [ 1]  195 	jreq 3$ 
      00ADD5 C7 00            [ 1]  196 	cp a,#TK_MINUS
      00ADD7 04 1E 05         [ 4]  197 	call get_token 
      00ADDA CF 00            [ 1]  198 	cp a,#TK_INTGR 
      00ADDC 01 81            [ 1]  199 	jreq 2$
      00ADDE CC 16 42         [ 2]  200 	jp syntax_error
      003580                        201 2$:
      00ADDE 85 5B 04         [ 4]  202 	call neg_acc24  	
      003583                        203 3$: 
      00ADE1 72               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
      00ADE2 5A 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00ADE4 20 FC                   32 app_size: .word 0 
      00ADE6                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        0033DA R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      0033D0 R
    ADCON_ID=  000002     |   4 ADCREAD    0033C4 R   |     ADCREAD_=  000004 
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
  4 ALLOC      0033BA R   |   4 AND        0033B2 R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 ASC        0033AA R   |     ASC_IDX =  000006     |     ATMP    =  000001 
    ATTRIB  =  000002     |   4 AUTO_RUN   000157 R   |   4 AWU        0033A2 R
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
  4 BIT        00339A R   |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BIT_IDX =  00000A     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003391 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       003388 R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      00337E R
    BTEST_ID=  000010     |   4 BTOGL      003374 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |     BUFPTR  =  000003     |   4 BYE        00336C R
    BYE_IDX =  000014     |     C       =  000001     |     CAN     =  000018 
  4 CANT_DO    002852 R   |     CAN_DGR =  005426     |     CAN_FPSR=  005427 
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
    CFG_GCR_=  000000     |   4 CHAR       003363 R   |     CHAR_IDX=  000016 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
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
    COMMA   =  00002C     |   4 CONST      003359 R   |   4 CONST_CO   001CDD R
    CONST_ID=  0000B8     |     CONST_RE=  000005     |     COUNT   =  000003 
    CPOS    =  000003     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   4 CR1        003351 R   |     CR1_IDX =  00001A 
  4 CR2        003349 R   |     CR2_IDX =  000018     |     CTRL_A  =  000001 
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
    CX_IN   =  000003     |   4 DATA       003340 R   |     DATA_IDX=  00001C 
    DBG_A   =  000008     |     DBG_CC  =  000009     |     DBG_X   =  000006 
    DBG_Y   =  000004     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        003338 R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        003330 R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
    DIVISOR =  000001     |     DIVSOR  =  000001     |     DLE     =  000010 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |   4 DO         003329 R
    DOLP_ADR=  000003     |     DOLP_INW=  000005     |     DO_IDX  =  000022 
  4 DREAD      00331F R   |     DREAD_ID=  000024     |   4 DROP       003316 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

  4 DWRITE     00330B R   |     DWRITE_I=  000026     |   4 EDIT       003302 R
    EDIT_IDX=  000028     |   4 EEFREE     0032F7 R   |     EEFREE_I=  0000BA 
  4 EEPROM     0032EC R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EEPTR   =  000003 
    EM      =  000019     |   4 END        0032E4 R   |     END_IDX =  00002C 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      0032DA R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_OVER=  000010     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       0032D1 R
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
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   001E84 R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        0032C9 R   |     FOR_IDX =  000034     |   4 FREE       0032C0 R
    FREE_IDX=  00008A     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_AND   =  000080     |     F_CFUNC =  000020     |     F_CMD   =  000000 
    F_CONST =  000030     |     F_IFUNC =  000010     |     F_NOT   =  000070 
    F_OR    =  000090     |     F_XOR   =  0000A0     |   4 GET        0032B8 R
    GET_IDX =  0000B6     |   4 GOSUB      0032AE R   |     GOSUB_ID=  000036 
  4 GOTO       0032A5 R   |     GOTO_IDX=  000038     |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
    GS      =  00001D     |   4 HEX        00329D R   |     HEX_IDX =  00003A 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   4 IDR        003295 R
    IDR_IDX =  00003C     |   4 IF         00328E R   |     IF_IDX  =  00003E 
    IN      =  000005     |     INCR    =  000001     |     INDIRECT=  000000 
    INP     =  000000     |   4 INPUT      003284 R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     003279 R   |     IWDGEN_I=  000042 
  4 IWDGREF    00326D R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        003265 R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        00325D R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  0033DA R   |   4 LIST       003254 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       00324B R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     003240 R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        003238 R
    NEW_IDX =  000052     |   4 NEXT       00322F R   |     NEXT_IDX=  000050 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
    NLEN_MAS=  00000F     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        003227 R   |     NOT_IDX =  0000F8     |     NOT_OP  =  000001 
  4 NOT_SAVE   001F76 R   |   4 NO_APP     002894 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        00321F R   |     ODR_IDX =  000054     |   4 ON         003218 R
    ONOFF   =  000003     |     ON_IDX  =  0000B4     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         003211 R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        003209 R   |     PAD_IDX =  000056 
    PAD_SIZE=  000080     |   4 PAUSE      0031FF R   |     PAUSE_ID=  000058 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       0031F6 R   |     PEEK_IDX=  00005C 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   4 PICK       0031ED R   |     PINNO   =  000001 
  4 PINP       0031E4 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      0031DA R   |     PMODE_ID=  00005A     |   4 POKE       0031D1 R
    POKE_IDX=  000060     |   4 POP        0031C9 R   |   4 PORTA      0031AC R
  4 PORTB      0031A2 R   |   4 PORTC      003198 R   |   4 PORTD      00318E R
  4 PORTE      003184 R   |   4 PORTF      00317A R   |   4 PORTG      003170 R
  4 PORTH      003166 R   |   4 PORTI      00315C R   |   4 POUT       0031C0 R
    POUT_IDX=  000062     |     PREV    =  000001     |   4 PRINT      0031B6 R
    PROD    =  000001     |     PROD_SIG=  000004     |   4 PROG_ADD   001E5A R
  4 PROG_SIZ   001E6C R   |     PRTA_IDX=  000066     |     PRTB_IDX=  000068 
    PRTC_IDX=  00006A     |     PRTD_IDX=  00006C     |     PRTE_IDX=  00006E 
    PRTF_IDX=  000070     |     PRTG_IDX=  000072     |     PRTH_IDX=  000074 
    PRTI_IDX=  000076     |     PRT_IDX =  000064     |     PSIZE   =  000001 
    PSTR    =  000003     |   4 PUSH       003153 R   |   4 PUT        00314B R
  4 QKEY       003142 R   |     QKEY_IDX=  000078     |     QSIGN   =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001E95 R
    RAM_SIZE=  001800     |     RBT_IDX =  00007C     |   4 READ       003139 R
    READ_IDX=  00007A     |   4 REBOOT     00312E R   |     RECLEN  =  000005 
  4 REG_A      000529 R   |   4 REG_CC     00052D R   |   4 REG_EPC    00051C R
  4 REG_SP     000532 R   |   4 REG_X      000525 R   |   4 REG_Y      000521 R
    RELOP   =  000001     |   4 REM        003126 R   |     REM_IDX =  00007E 
  4 RESTORE    00311A R   |     REST_IDX=  000080     |     RETL1   =  000001 
  4 RETURN     00310F R   |     RET_ADDR=  000001     |     RET_BPTR=  000003 
    RET_IDX =  000082     |     RET_INW =  000005     |   4 RND        003107 R
    RND_IDX =  000084     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     0030FC R   |     RSHIFT_I=  000086     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        0030F4 R   |     RUN_IDX =  000088 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       0030EB R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   002850 R
  4 SIZE       0030E2 R   |     SIZE_IDX=  0000B2     |     SKIP    =  000005 
  4 SLEEP      0030D8 R   |     SLEEP_ID=  00008C     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      0030CE R
    SPIEN_ID=  000090     |   4 SPIRD      0030C4 R   |     SPIRD_ID=  00008E 
  4 SPISEL     0030B9 R   |     SPISEL_I=  000092     |   4 SPIWR      0030AF R
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
  4 STATES     0004DF R   |   4 STEP       0030A6 R   |     STEP_IDX=  000096 
  4 STOP       00309D R   |     STOP_IDX=  000098     |     STR     =  000003 
  4 STR_BYTE   001E7D R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      003093 R
    TICKS_ID=  00009A     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_ARR=  005346     |     TIM4_CNT=  005344     |     TIM4_CR1=  005340 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    003087 R
  4 TIMER      00307D R   |     TIMER_ID=  00009C     |     TIM_CR1_=  000007 
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
    TK_VAR  =  000085     |     TK_XOR  =  00008A     |     TMROUT_I=  00009E 
  4 TO         003076 R   |   4 TONE       00306D R   |     TONE_IDX=  0000A2 
    TOWRITE =  000005     |     TO_IDX  =  0000A0     |   4 Timer4Up   000021 R
  4 TrapHand   000012 R   |     U8      =  000001     |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     003062 R
    UBOUND_I=  0000A4     |   4 UBTN_Han   000068 R   |   4 UFLASH     003057 R
    UFLASH_I=  0000A6     |   4 UNTIL      00304D R   |     UNTIL_ID=  0000A8 
    UPDATE  =  000006     |     US      =  00001F     |   4 USER_ABO   000070 R
  4 USR        003045 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000AA     |   4 Uart1RxH   000899 R
  4 UserButt   000044 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       00303C R
    WAIT_IDX=  0000AC     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      003032 R   |     WORDS_ID=  0000AE     |   4 WRITE      003028 R
    WRITE_ID=  0000B0     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        003020 R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  000014 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        002A54 R   |   4 abs24      0001EE R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000BC7 R   |   4 add24      000179 R   |   4 add_char   001332 R
  4 add_spac   00112A R   |   4 analog_r   00260B R   |   4 and_cond   001B11 R
  4 and_fact   001AE1 R   |   4 app        003604 R   |   4 app_sign   003600 R
  4 app_size   003602 R   |   4 app_spac   003600 GR  |   4 arduino_   002B43 R
  4 arg_list   001913 R   |   5 array_si   000020 R   |   4 ascii      002904 R
  4 at_tst     000F9C R   |   4 atoi24     001835 GR  |   4 atoi_exi   0018A4 R
  4 awu        0029FB R   |   4 awu02      002A0E R   |   4 bad_port   00297F R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       002582 R
  4 beep_1kh   002555 GR  |   4 bin_exit   000E03 R   |   4 bit_rese   00215E R
  4 bit_set    00213C R   |   4 bit_test   0021A3 R   |   4 bit_togg   002181 R
  4 bitmask    002CFA R   |   4 bkslsh_t   000F49 R   |   4 bksp       000972 R
  2 block_bu   0016E0 GR  |   4 block_er   000787 R   |   4 break_po   0026F7 R
  4 bye        0029C7 R   |   4 clear_ba   00149E R   |   4 clear_bl   0027A7 R
  4 clear_va   0013F6 R   |   4 clock_in   00008B R   |   4 cloop_1    001D86 R
  4 cmd_cons   001D60 R   |   4 cmd_end    002521 R   |   4 cmd_get    002528 R
  4 cmd_itf    000537 R   |   4 cmd_line   0016D1 R   |   4 cmd_name   001352 R
  4 cmd_on     0023D8 R   |   4 cmd_size   001BFD R   |   4 cold_sta   0000C3 R
  4 colon_ts   000F70 R   |   4 comma_ts   000F7B R   |   4 comp_msg   001621 R
  4 compile    001096 GR  |   4 conditio   001B63 R   |   4 const_cr   002DA2 R
  4 const_cr   002DA7 R   |   4 const_dd   002D9D R   |   4 const_ee   002DB6 R
  4 const_id   002D98 R   |   4 const_in   002DB1 R   |   4 const_lo   001D81 R
  4 const_od   002D93 R   |   4 const_ou   002DAC R   |   4 const_po   002D66 R
  4 const_po   002D6B R   |   4 const_po   002D70 R   |   4 const_po   002D75 R
  4 const_po   002D7A R   |   4 const_po   002D7F R   |   4 const_po   002D84 R
  4 const_po   002D89 R   |   4 const_po   002D8E R   |   4 convert_   000D73 R
  4 convert_   000936 R   |   4 copy_com   000FD1 R   |   5 count      000003 GR
  4 cp24       0001B3 R   |   4 cp24_ax    0001E5 R   |   4 cp_loop    0018C4 R
  4 cpl24      0001F5 R   |   4 cpy_cmd_   001112 R   |   4 cpy_quot   001152 R
  4 create_g   000C9D R   |   4 cs_high    002F38 R   |   4 dash_tst   000F91 R
  4 data       002DBB R   |   4 data_err   002E34 R   |   5 data_len   000009 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001BDC R
  4 decomp_l   0011EA R   |   4 decompil   0011A2 GR  |   4 del_line   000C70 R
  4 delete_l   000A5F R   |   4 delete_n   000982 R   |   4 delete_u   000A24 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

  4 digital_   002647 R   |   4 digital_   00267E R   |   4 div24      000302 R
  4 divu24_8   0002E4 R   |   4 do_loop    002D20 R   |   4 do_progr   00077A R
  4 dup24      00016A R   |   4 edit       001F49 R   |   4 enable_i   002C8A R
  4 eql_tst    00101C R   |   4 equal      001345 R   |   4 erase      00271F R
  4 erase_ex   0007AB R   |   4 erase_fl   0007A1 R   |   4 err_bad_   001582 R
  4 err_buf_   0015F8 R   |   4 err_cmd_   001546 R   |   4 err_div0   00150B R
  4 err_dupl   001560 R   |   4 err_math   0014F2 R   |   4 err_mem_   0014D7 R
  4 err_msg    0014B5 R   |   4 err_no_a   00158E R   |   4 err_no_d   0015C1 R
  4 err_no_f   0015E5 R   |   4 err_no_l   00151A R   |   4 err_no_p   0015D1 R
  4 err_not_   001571 R   |   4 err_over   001605 R   |   4 err_run_   001530 R
  4 err_synt   0014E4 R   |   4 escaped    000D88 GR  |   4 expect     001901 R
  4 expressi   001A4A R   |   4 factor     00195F R   |   5 farptr     000018 R
  4 fcpu       002AC5 R   |   4 fetchc     000627 R   |   4 fill_wri   002797 R
  4 final_te   000BC0 R   |   4 first_li   001EF3 R   |   5 flags      000022 GR
  4 for        002239 R   |   4 free       001BE1 R   |   5 free_eep   000024 R
  7 free_ram   000080 R   |   4 func_arg   00190E R   |   4 func_cha   0028ED R
  4 func_eef   001CF3 R   |   4 ge         001347 R   |   4 get_addr   001773 R
  4 get_arra   00192F R   |   4 get_char   00178D R   |   4 get_cons   001C78 R
  4 get_esca   000942 R   |   4 get_int2   00177D R   |   4 get_targ   002366 R
  4 get_targ   002374 R   |   4 get_tick   002A4D R   |   4 get_toke   000EE2 GR
  4 getc       00091B GR  |   4 gosub      002484 R   |   4 gosub_1    00248F R
  4 gosub_2    002495 R   |   4 goto       00246A R   |   4 goto_1     002474 R
  4 gpio       002954 R   |   4 gt         001343 R   |   4 gt_tst     001027 R
  4 hex_base   001BD7 R   |   4 hex_dump   000667 R   |   4 if         00221C R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   00087D R   |   4 input_ex   0020F4 R   |   4 input_lo   00205E R
  4 input_va   00205A R   |   4 insert_c   0009E1 R   |   4 insert_l   000CC9 R
  4 insert_l   000D38 R   |   4 interp_l   001712 R   |   4 interpre   0016ED R
  4 invalid    00057C R   |   4 invalid_   0005FD R   |   4 is_alnum   000E36 GR
  4 is_alpha   000E1C GR  |   4 is_data_   002DC1 R   |   4 is_digit   000E2D GR
  4 is_symbo   000E3F R   |   4 itoa       0017D0 GR  |   4 itoa_loo   0017F2 R
  4 jp_to_ta   002477 R   |   4 key        002943 R   |   4 kword_di   0033D8 GR
  4 kword_en   00301E R   |   4 le         00134C R   |   4 ledoff     000432 R
  4 ledon      00042D R   |   4 ledtoggl   000437 R   |   4 left_par   000440 R
  4 let        001C35 GR  |   4 let_arra   001C43 R   |   4 let_eval   001C4B R
  4 let_var    001C48 R   |   4 lines_sk   001EF6 R   |   4 list       001EA4 R
  4 list_con   001C87 R   |   4 list_exi   001F38 R   |   4 list_loo   001F16 R
  4 log2       002CCD R   |   4 look_tar   002397 R   |   4 loop_bac   002349 R
  5 loop_dep   00001F R   |   4 loop_don   00235E R   |   4 lshift     002A6B R
  4 lt         00134A R   |   4 lt_tst     001050 R   |   4 mem_peek   000599 R
  4 mod24      00039C R   |   4 move       0013B2 GR  |   4 move_dow   0013D1 R
  4 move_era   000709 R   |   4 move_exi   0013F2 R   |   4 move_lef   0009B9 R
  4 move_loo   0013D6 R   |   4 move_prg   000749 R   |   4 move_rig   0009C7 R
  4 move_up    0013C3 R   |   4 mul24      000274 R   |   4 mul_char   001334 R
  4 mulu24_8   000235 R   |   4 nbr_tst    000F15 R   |   4 ne         00134F R
  4 neg24      0001FE R   |   4 neg_acc2   000218 R   |   4 neg_ax     000210 R
  4 new        002715 R   |   4 next       0022F1 R   |   4 next_lin   0016F5 R
  4 next_tok   00174B GR  |   4 no_match   0018D6 R   |   4 number     00062D R
  4 other      001079 R   |   4 overwrit   000BEC R   |   2 pad        0016E0 GR
  4 pad_ref    002F3D R   |   4 parse_bi   000DE1 R   |   4 parse_in   000D90 R
  4 parse_ke   000E62 R   |   4 parse_qu   000D3B R   |   4 parse_sy   000E4A R
  4 pause      0029DB R   |   4 pause02    0029EE R   |   4 peek       0021FB R
  4 peek_byt   0005C7 R   |   4 pin_mode   002AD4 R   |   4 plus_tst   000FF0 R
  4 poke       0021DA R   |   4 power_ad   0025BB R   |   4 prcnt_ts   001011 R
  4 print      001FB1 R   |   4 print_fa   00060C R   |   4 print_he   000C23 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

  4 print_re   00048C R   |   4 print_st   00058C R   |   4 print_to   0017B8 R
  4 prog_siz   001E13 R   |   4 program_   001E1B R   |   4 program_   000723 R
  4 program_   000749 R   |   4 prt_acc2   0017AA R   |   4 prt_basi   001F8D R
  4 prt_i16    001793 R   |   4 prt_loop   001FB5 R   |   4 prt_peek   00040F GR
  4 prt_reg1   00046D R   |   4 prt_reg8   00044B R   |   4 prt_regs   0003A5 GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       00090B GR
  4 puts       000968 GR  |   4 qgetc      000914 GR  |   4 qkey       002947 GR
  4 qmark_ts   000FA7 R   |   4 qsign      002790 R   |   4 random     002B63 R
  4 read       002E39 R   |   4 read01     002E3E R   |   4 read_int   00354F R
  4 readln     000A6D GR  |   4 readln_l   000A7C R   |   4 readln_q   000C09 R
  4 refresh_   002CC8 R   |   4 regs_sta   0003E8 R   |   4 relation   001A82 R
  4 relop_st   001337 R   |   4 remark     0020F9 GR  |   4 repl       000545 R
  4 repl_exi   00056D R   |   4 reset_co   001FB3 R   |   4 rest_con   00204A R
  4 restore    002DCF R   |   4 return     0024A8 R   |   4 right_al   001140 GR
  4 row_alig   000862 R   |   4 row_eras   0006DC R   |   4 row_eras   000709 R
  4 row_loop   00064A R   |   4 rparnt_t   000F65 R   |   4 rshift     002A98 R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     00160F R
  4 run        0024C5 R   |   4 run_app    000135 R   |   4 run_it     0024F7 R
  4 run_it_0   0024F9 R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027BB R   |   4 save_con   00203A R
  4 scan_blo   00088B R   |   4 search_c   001D1C R   |   4 search_d   0018B6 GR
  4 search_e   0018FE R   |   4 search_l   000C45 GR  |   4 search_l   000C54 R
  4 search_n   0018BA R   |   5 seedx      000014 R   |   5 seedy      000016 R
  4 select_p   002B33 R   |   4 send_esc   000990 R   |   4 send_par   00099B R
  4 set_data   002E05 R   |   4 set_time   002C68 R   |   4 sharp_ts   000F86 R
  4 show_row   000638 R   |   4 single_c   00132D R   |   4 skip       000ECF R
  4 skip_str   001764 R   |   4 slash_ts   001006 R   |   4 sleep      0029D0 R
  4 software   001405 R   |   4 spaces     0009D5 GR  |   4 spi_clea   002ED2 R
  4 spi_disa   002EBA R   |   4 spi_enab   002E87 R   |   4 spi_rcv_   002EF4 R
  4 spi_read   002F1F R   |   4 spi_sele   002F26 R   |   4 spi_send   002EDE R
  4 spi_writ   002EFF R   |   2 stack_fu   00179C GR  |   2 stack_un   001828 R
  4 star_tst   000FFB R   |   4 step       0022AF R   |   4 stop       0026C9 R
  4 store_lo   0022DE R   |   4 str_matc   0018E3 R   |   4 str_tst    000F05 R
  4 strcmp     001391 R   |   4 strcpy     0013A2 GR  |   4 strlen     001386 GR
  4 sub24      000196 R   |   4 symb_loo   000E4B R   |   4 syntax_e   001642 GR
  4 system_i   00144B R   |   5 tab_widt   000023 GR  |   4 tb_error   001644 GR
  4 term       001A07 R   |   4 term01     001A0F R   |   4 term_exi   001A47 R
  4 test       0033E0 R   |   4 test_p     000584 R   |   2 tib        001690 GR
  4 tick_tst   000FBF R   |   5 ticks      00000F R   |   4 timeout    002C7F R
  5 timer      000012 GR  |   4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R
  4 tk_id      001632 R   |   4 to         002269 R   |   4 to_eepro   000772 R
  4 to_flash   000777 R   |   4 to_hex_c   000C3A GR  |   4 to_upper   001829 GR
  4 token_ch   00108F R   |   4 token_ex   001093 R   |   4 tone       002560 R
  4 try_next   002E12 R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   00091B GR  |   4 uart1_in   0008C6 R   |   4 uart1_pu   00090B GR
  4 uart1_qg   000914 GR  |   4 uart1_se   0008D6 R   |   4 ubound     001C2A R
  4 uflash     002984 R   |   4 unlock_e   0006A6 R   |   4 unlock_f   0006C1 R
  4 until      002D33 R   |   4 user_int   000057 R   |   4 usr        0029A1 R
  4 var_name   001198 GR  |   5 vars       000030 GR  |   4 wait       0020FF R
  4 warm_ini   00147C R   |   4 warm_sta   0016CE R   |   4 words      002BFE R
  4 words_co   002C52 R   |   4 write      0028AA R   |   4 write_bl   000827 GR
  4 write_bu   000763 R   |   4 write_by   0007AD R   |   4 write_ee   0007E9 R
  4 write_ex   000822 R   |   4 write_fl   0007D3 R   |   4 write_nb   00084C R
  4 xalloc     002F50 R   |   4 xdrop      002F86 R   |   4 xpick      003004 R
  4 xpop       002F46 R   |   4 xpush      002F42 R   |   4 xput       002FD1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

  4 xstack_b   002FB3 R   |   2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3604   flags    0
   5 DATA       size     7E   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

