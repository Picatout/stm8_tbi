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
                           000040    23         F_IFUNC=0x40 ; integer function keyword
                           000080    24         F_CFUNC=0x80 ; character function keyword
                           0000C0    25         F_CONST=0xC0 ; function keyword that return a constant
                                     26 
                           00008C    27 	STACK_SIZE=140
                           0017FF    28 	STACK_EMPTY=RAM_SIZE-1  
                           000003    29         CELL_SIZE=3
                           00003C    30         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
                           001773    31         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    32 	FRUN=0 ; flags run code in variable flags
                           000001    33 	FTRAP=1 ; inside trap handler 
                           000002    34 	FLOOP=2 ; FOR loop in preparation 
                           000003    35 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    36 	FBREAK=4 ; break point flag 
                           000005    37 	FCOMP=5  ; compiling flags 
                                     38 
                                     39 
                           000006    40         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     41 
                           007FFF    42 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     43 
                           000008    44 	RX_QUEUE_SIZE=8 
                                     45 
                           00F424    46         TIM2_CLK_FREQ=62500
                                     47 
                           000050    48 	TIB_SIZE=80
                           000080    49         PAD_SIZE=BLOCK_SIZE 
                                     50 
                                     51 ;--------------------------------------
                                     52 ;   constantes related to Arduino 
                                     53 ;   API mapping 
                                     54 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000000    55         INP=0
                           000001    56         OUTP=1 
                                     57 
                                     58 ;--------------------------------------
                                     59 ;       token attribute
                                     60 ;--------------------------------------
                                     61         ; bits 4:5 identify token group 
                                     62         ; 0x0n -> miscelinous 
                                     63         ; 0x1n -> +|- operators 
                                     64         ; 0x2n -> *|/|% operators
                                     65         ; 0x3n -> relational operators 
                           000080    66         TK_CMD=128      ; BASIC command   
                           000081    67         TK_IFUNC=129    ; BASIC integer function
                           000082    68         TK_CFUNC=130    ; BASIC character function
                           000083    69         TK_CONST=131    ; BASIC constant 
                           000084    70         TK_INTGR=132    ; 16 bits integer 
                           000085    71         TK_VAR=133
                           000086    72         TK_FLOAT=134    ; float32 
                           000000    73         TK_NONE=0       ; not a token 
                           000002    74         TK_QSTR=2       ; quoted string  
                           000003    75         TK_LABEL=3      ; used for defined, constants, variables
                           000004    76         TK_CHAR=4       ; ASCII character 
                           000005    77         TK_ARRAY=5     ; array variable '@' 
                           000006    78         TK_LPAREN=6     ; left parenthesis '('
                           000007    79         TK_RPAREN=7     ; right parenthesis ')'
                           000008    80         TK_COMMA=8     ; item separator ',' 
                           000009    81         TK_SHARP=9     ; print colon width '#' 
                           00000A    82         TK_COLON=0xa      ; command separator ':' 
                                     83         
                           000010    84         TK_PLUS=0x10    ; addition operator '+'
                           000011    85         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    86         TK_MULT=0x20    ; multiplication operator '*'
                           000021    87         TK_DIV=0x21     ; division operator '/'
                           000022    88         TK_MOD=0x22     ; modulo operator '%'
                                     89 
                                     90         ; don't change these token values 
                                     91         ; values chosen to be used as a mask.
                                     92         ; bit 7   1 for dictionary words else 0 
                                     93         ; bits 6  always 0 
                                     94         ; bits 5:4 identify group 
                                     95         ; bits 3:0 token identifier inside group  
                           000031    96         TK_GT=0x31      ; relation operator '>'
                           000032    97         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033    98         TK_GE=0x33      ; relation operator '>='
                           000034    99         TK_LT=0x34      ; relation operator '<'
                           000036   100         TK_LE=0x36      ; relation operator '<='
                           000035   101         TK_NE=0x35      ; relation operator '<>' not equal 
                                    102         ; token groups 
                           000030   103         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   104         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   105         TK_GRP_ADD=0x10  ; additive operators
                           000020   106         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   107         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   108         CMD_END=2 
                                    109 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                    110 ;--------------------------------------
                                    111 ;   error codes 
                                    112 ;--------------------------------------
                           000000   113     ERR_NONE=0
                           000001   114     ERR_MEM_FULL=1 
                           000002   115     ERR_SYNTAX=2
                           000003   116     ERR_MATH_OVF=3
                           000004   117     ERR_DIV0=4 
                           000005   118     ERR_NO_LINE=5
                           000006   119     ERR_RUN_ONLY=6
                           000007   120     ERR_CMD_ONLY=7
                           000008   121     ERR_DUPLICATE=8
                           000009   122     ERR_NOT_FILE=9
                           00000A   123     ERR_BAD_VALUE=10
                           00000B   124     ERR_NO_ACCESS=11
                           00000C   125     ERR_NO_DATA=12 
                           00000D   126     ERR_NO_PROG=13
                           00000E   127     ERR_NO_FSPACE=14
                           00000F   128     ERR_BUF_FULL=15
                           000010   129     ERR_OVERFLOW=16 
                                    130 
                                    131 ;--------------------------------------
                                    132 ;   assembler flags 
                                    133 ;-------------------------------------
                                    134 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    135 
                                    136      .macro _usec_dly n 
                                    137     ldw x,#(16*n-2)/4
                                    138     decw x
                                    139     nop 
                                    140     jrne .-4
                                    141     .endm 
                                    142     
                                    143     ; load X register with 
                                    144     ; entry point of dictionary
                                    145     ; before calling 'search_dict'
                                    146     .macro _ldx_dict dict_name
                                    147     ldw x,#dict_name+2
                                    148     .endm 
                                    149 
                                    150     ; reset BASIC pointer
                                    151     ; to beginning of last token
                                    152     ; extracted except if it was end of line 
                                    153     .macro _unget_token 
                                    154      mov in,in.saved  
                                    155     .endm
                                    156 
                                    157 
                                    158 ;---------------------------------------
                                    159 ;    xtack manipulation macros 
                                    160 ;    Y is used as xstack pointer  
                                    161 ;----------------------------------------
                                    162     ; pop in A:X from XSTACK 
                                    163     .macro _xpop 
                                    164     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     ldw x,y 
                                    166     ldw x,(1,x)
                                    167     addw y,#CELL_SIZE 
                                    168     .endm 
                                    169 
                                    170     ; push A:X  to XSTACK 
                                    171     .macro _xpush 
                                    172     subw y,#CELL_SIZE
                                    173     ld (y),a 
                                    174     ldw (1,y),x 
                                    175     .endm 
                                    176 
                                    177     ; drop from XSTACK 
                                    178     .macro _xdrop 
                                    179     addw y,#CELL_SIZE 
                                    180     .endm 
                                    181 
                                    182     ; @T fetch top xstack 
                                    183     .macro _at_top
                                    184     ld a,(y)
                                    185     ldw x,y 
                                    186     ldw x,(1,x)
                                    187     .endm 
                                    188 
                                    189     ; @N  fetch next on xstack 
                                    190     .macro _at_next 
                                    191     ld a,(3,y)
                                    192     ldw x,y 
                                    193     ldw x,(4,x)
                                    194     .endm 
                                    195 
                                    196     ; !T put on top of xtack 
                                    197     .macro _store_top 
                                    198     ld (y),a 
                                    199     ldw (1,y),x     
                                    200     .endm 
                                    201 
                                    202     ; !N put next on xstack 
                                    203     .macro _store_next 
                                    204     ld (3,y),a 
                                    205     ldw (4,y),x 
                                    206     .endm 
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
                           000006    28     AND_IDX=ADCREAD_IDX+2     ;
                           000008    29     ASC_IDX=AND_IDX+2     ;
                           00000A    30     AWU_IDX=ASC_IDX+2 
                           00000C    31     BIT_IDX=AWU_IDX+2
                           00000E    32     BRES_IDX=BIT_IDX+2
                           000010    33     BSET_IDX=BRES_IDX+2
                           000012    34     BTEST_IDX=BSET_IDX+2
                           000014    35     BTOGL_IDX=BTEST_IDX+2
                           000016    36     BYE_IDX=BTOGL_IDX+2
                           000018    37     CHAR_IDX=BYE_IDX+2
                           00001A    38     CRH_IDX=CHAR_IDX+2
                           00001C    39     CRL_IDX=CRH_IDX+2
                           00001E    40     DATA_IDX=CRL_IDX+2
                           000020    41     DDR_IDX=DATA_IDX+2
                           000022    42     DEC_IDX=DDR_IDX+2
                           000024    43     DO_IDX=DEC_IDX+2
                           000026    44     DREAD_IDX=DO_IDX+2
                           000028    45     DWRITE_IDX=DREAD_IDX+2
                           00002A    46     EDIT_IDX=DWRITE_IDX+2
                           00002C    47     EEPROM_IDX=EDIT_IDX+2
                           00002E    48     END_IDX=EEPROM_IDX+2
                           000030    49     ERASE_IDX=END_IDX+2
                           000032    50     FCPU_IDX=ERASE_IDX+2
                           000034    51     SAVE_IDX=FCPU_IDX+2
                           000036    52     FOR_IDX=SAVE_IDX+2
                           000038    53     GOSUB_IDX=FOR_IDX+2
                           00003A    54     GOTO_IDX=GOSUB_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           00003C    55     GPIO_IDX=GOTO_IDX+2
                           00003E    56     HEX_IDX=GPIO_IDX+2
                           000040    57     IDR_IDX=HEX_IDX+2
                           000042    58     IF_IDX=IDR_IDX+2
                           000044    59     INPUT_IDX=IF_IDX+2
                           000046    60     INVERT_IDX=INPUT_IDX+2
                           000048    61     IWDGEN_IDX=INVERT_IDX+2
                           00004A    62     IWDGREF_IDX=IWDGEN_IDX+2
                           00004C    63     KEY_IDX=IWDGREF_IDX+2
                           00004E    64     LET_IDX=KEY_IDX+2
                           000050    65     LIST_IDX=LET_IDX+2
                           000052    66     LOG_IDX=LIST_IDX+2
                           000054    67     LSHIFT_IDX=LOG_IDX+2
                                     68 ;    MULDIV_IDX=LSHIFT_IDX+2
                           000056    69     NEXT_IDX=LSHIFT_IDX+2
                           000058    70     NEW_IDX=NEXT_IDX+2
                           00005A    71     NOT_IDX=NEW_IDX+2
                           00005C    72     ODR_IDX=NOT_IDX+2
                           00005E    73     OR_IDX=ODR_IDX+2
                           000060    74     PAD_IDX=OR_IDX+2
                           000062    75     PAUSE_IDX=PAD_IDX+2
                           000064    76     PMODE_IDX=PAUSE_IDX+2
                           000066    77     PEEK_IDX=PMODE_IDX+2
                           000068    78     PINP_IDX=PEEK_IDX+2
                           00006A    79     POKE_IDX=PINP_IDX+2
                           00006C    80     POUT_IDX=POKE_IDX+2
                           00006E    81    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           000070    82     PRTA_IDX=PRT_IDX+2
                           000072    83     PRTB_IDX=PRTA_IDX+2
                           000074    84     PRTC_IDX=PRTB_IDX+2
                           000076    85     PRTD_IDX=PRTC_IDX+2
                           000078    86     PRTE_IDX=PRTD_IDX+2
                           00007A    87     PRTF_IDX=PRTE_IDX+2
                           00007C    88     PRTG_IDX=PRTF_IDX+2
                           00007E    89     PRTH_IDX=PRTG_IDX+2
                           000080    90     PRTI_IDX=PRTH_IDX+2
                           000082    91     QKEY_IDX=PRTI_IDX+2
                           000084    92     READ_IDX=QKEY_IDX+2
                           000086    93     RBT_IDX=READ_IDX+2  ; REBOOT
                           000088    94 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           00008A    95     REST_IDX=REM_IDX+2 ; RESTORE
                           00008C    96     RET_IDX=REST_IDX+2  ; RETURN 
                           00008E    97     RND_IDX=RET_IDX+2 ; RANDOM 
                           000090    98     RSHIFT_IDX=RND_IDX+2
                           000092    99     RUN_IDX=RSHIFT_IDX+2
                           000094   100     FREE_IDX=RUN_IDX+2
                           000096   101     SLEEP_IDX=FREE_IDX+2
                           000098   102     SPIRD_IDX=SLEEP_IDX+2
                           00009A   103     SPIEN_IDX=SPIRD_IDX+2
                           00009C   104     SPISEL_IDX=SPIEN_IDX+2
                           00009E   105     SPIWR_IDX=SPISEL_IDX+2
                           0000A0   106     STEP_IDX=SPIWR_IDX+2
                           0000A2   107     STOP_IDX=STEP_IDX+2
                           0000A4   108     TICKS_IDX=STOP_IDX+2
                           0000A6   109     TIMER_IDX=TICKS_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000A8   110     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000AA   111     TO_IDX=TMROUT_IDX+2
                           0000AC   112     TONE_IDX=TO_IDX+2
                           0000AE   113     UBOUND_IDX=TONE_IDX+2
                           0000B0   114     UFLASH_IDX=UBOUND_IDX+2
                           0000B2   115     UNTIL_IDX=UFLASH_IDX+2
                           0000B4   116     USR_IDX=UNTIL_IDX+2
                           0000B6   117     WAIT_IDX=USR_IDX+2
                           0000B8   118     WORDS_IDX=WAIT_IDX+2
                           0000BA   119     WRITE_IDX=WORDS_IDX+2
                           0000BC   120     XOR_IDX=WRITE_IDX+2
                           0000BE   121     SIZE_IDX=XOR_IDX+2 
                           0000C0   122     ON_IDX=SIZE_IDX+2 
                           0000C2   123     GET_IDX=ON_IDX+2
                           0000C4   124     CONST_IDX=GET_IDX+2
                           0000C6   125     EEFREE_IDX=CONST_IDX+2 
                                    126      
                                    127         
                                    128 
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
      008050 82 00 89 52             79 	int Uart1RxHandler		;int18 UART1 RX full ; default user communication channel.
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
      008096 CD 85 45         [ 4]  120 	call print_registers
      008099 CD 85 F0         [ 4]  121 	call cmd_itf
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
      0080E5 CD 8A 21         [ 4]  174 	call puts 
      0080E8                        175 UBTN_Handler_exit:
      0080E8 AE 17 FF         [ 2]  176     ldw x,#STACK_EMPTY 
      0080EB 94               [ 1]  177     ldw sp,x
      0080EC 9A               [ 1]  178 	rim 
      0080ED CC 97 9B         [ 2]  179 5$:	jp warm_start
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
                                    211 ; on port D:5.
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
      00818E CD 89 7F         [ 4]  273 	call uart1_init
                                    274 ; activate PE_4 (user button interrupt)
      008191 72 18 50 18      [ 1]  275     bset PE_CR2,#USR_BTN_BIT 
                                    276 ; display system information
      008195 9A               [ 1]  277 	rim ; enable interrupts 
      008196 72 5C 00 18      [ 1]  278 	inc seedy+1 
      00819A 72 5C 00 16      [ 1]  279 	inc seedx+1 
      00819E CD 9C 8D         [ 4]  280 	call func_eefree 
      0081A1 CD 9B C4         [ 4]  281 	call ubound 
      0081A4 CD 95 6B         [ 4]  282 	call clear_basic
      0081A7 CD A4 C2         [ 4]  283 	call beep_1khz  
      0081AA CD 95 18         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A6 F7         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 9B         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 49         [ 4]  293 	call warm_init
      0081BC AE B6 04         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 02      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 21         [ 4]  299 	call puts 
      0081CF CD 9D B1         [ 4]  300 	call program_info 
      0081D2 CC A4 66         [ 2]  301 	jp run_it_02  
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
      0001E6                        112     _at_top 
      008250 90 F7            [ 1]    1     ld a,(y)
      008252 90               [ 1]    2     ldw x,y 
      008253 EF 01            [ 2]    3     ldw x,(1,x)
      008255 81               [ 1]  113     cpl a 
      008256 53               [ 2]  114     cplw x 
      0001ED                        115     _store_top 
      008256 88 C3            [ 1]    1     ld (y),a 
      008258 00 0E C2         [ 2]    2     ldw (1,y),x     
      00825B 00               [ 4]  116     ret 
                                    117 
                                    118 ;----------------------------    
                                    119 ; two'2 complement of top  
                                    120 ;---------------------------
      0001F3                        121 neg24: ; (i -- -i )
      0001F3                        122     _at_top
      00825C 0D 84            [ 1]    1     ld a,(y)
      00825E 81               [ 1]    2     ldw x,y 
      00825F EE 01            [ 2]    3     ldw x,(1,x)
      00825F 90               [ 1]  123     cpl  a  
      008260 F6               [ 2]  124     cplw x 
      008261 A1 80 2A         [ 2]  125     addw x,#1
      008264 0E 81            [ 1]  126     adc a,#0
      008266                        127     _store_top  
      008266 90 F6            [ 1]    1     ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008268 93 EE 01         [ 2]    2     ldw (1,y),x     
      00826B 43               [ 4]  128 9$: ret 
                                    129 
                                    130 ;-----------------------------
                                    131 ; negate integer in A:X 
                                    132 ;----------------------------
      000205                        133 neg_ax:
      00826C 53               [ 1]  134     cpl  a  
      00826D 90               [ 2]  135     cplw x 
      00826E F7 90 EF         [ 2]  136     addw x,#1
      008271 01 81            [ 1]  137     adc a,#0
      008273 81               [ 4]  138     ret 
                                    139 
                                    140 ;------------------------------------
                                    141 ;  two's complement of acc24 
                                    142 ;-------------------------------------
      00020D                        143 neg_acc24: ; 
      008273 90 F6 93 EE      [ 1]  144     cpl acc24 
      008277 01 43 53 1C      [ 1]  145     cpl acc16 
      00827B 00 01 A9 00      [ 1]  146     cpl acc8
      00827F 90 F7 90 EF      [ 1]  147     inc acc8 
      008283 01 81            [ 1]  148     jrne 9$
      008285 72 5C 00 0D      [ 1]  149     inc acc16 
      008285 43 53            [ 1]  150     jrne 9$
      008287 1C 00 01 A9      [ 1]  151     inc acc24 
      00828B 00               [ 4]  152 9$: ret 
                                    153 
                                    154 
                                    155 ;--------------------------------------
                                    156 ; unsigned multiply uint24_t by uint8_t
                                    157 ; input:
                                    158 ;	acc24	uint24_t 
                                    159 ;   A		uint8_t
                                    160 ; output:
                                    161 ;   acc24   A*acc24
                                    162 ;      A    overflow, bits 31..24 
                                    163 ;-------------------------------------
                                    164 ; local variables offset  on sp
                           000001   165 	U8   = 1   ; A pushed on stack
                           000001   166 	VSIZE = 1 
      00022A                        167 mulu24_8:
      00828C 81               [ 2]  168 	pushw x    ; save X
                                    169 	; local variable
      00828D 88               [ 1]  170 	push a     ; U8
      00828D 72 53 00 0D      [ 1]  171 	clr acc32 
                                    172 ; multiply bits 7..0 * U8   	
      008291 72               [ 1]  173 	ld xl,a 
      008292 53 00 0E         [ 1]  174 	ld a,acc8 
      008295 72               [ 4]  175 	mul x,a 
      008296 53 00 0F         [ 1]  176 	ld a, acc16 
      008299 72 5C 00         [ 2]  177 	ldw acc16,x
                                    178 ; multiply middle byte, bits 15..8 * U8  	
      00829C 0F               [ 1]  179 	ld xl,a 
      00829D 26 0A            [ 1]  180 	ld a,(U8,sp)
      00829F 72               [ 4]  181 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      0082A0 5C 00 0E         [ 1]  182 	ld a,acc24
      0082A3 26 04 72 5C      [ 1]  183 	clr acc24  
      0082A7 00 0D 81 0C      [ 2]  184 	addw x,acc24
      0082AA CF 00 0C         [ 2]  185 	ldw acc24,x 
                                    186 ; multiply  MSB, bits 23..16 * U8 
      0082AA 89               [ 1]  187 	ld xl,a 
      0082AB 88 72            [ 1]  188 	ld a,(U8,sp)
      0082AD 5F               [ 4]  189 	mul x,a
      0082AE 00 0C 97 C6      [ 2]  190 	addw x,acc32  
      0082B2 00 0F 42         [ 2]  191 	ldw acc32,x 
      0082B5 C6               [ 1]  192 	ld a,xh 
      000259                        193 	_drop VSIZE  
      0082B6 00 0E            [ 2]    1     addw sp,#VSIZE 
      0082B8 CF               [ 2]  194 	popw x 
      0082B9 00               [ 4]  195 	ret 
                                    196 
                                    197 
                                    198 ;-------------------------------
                                    199 ; mul24 i1 i2 -- i1*i2  
                                    200 ; multiply 24 bits integers 
                                    201 ;------------------------------
                           000001   202     PROD=1 
                           000004   203     N1=4
                           000007   204     N2=7
                           00000A   205     PROD_SIGN=10
                           00000A   206     VSIZE=10 
      00025D                        207 mul24:
      00025D                        208     _vars VSIZE
      0082BA 0E 97            [ 2]    1     sub sp,#VSIZE 
      0082BC 7B 01            [ 1]  209     clr (PROD_SIGN,sp)
      0082BE 42 C6            [ 1]  210     clr (PROD,sp)
      0082C0 00               [ 1]  211     clrw x 
      0082C1 0D 72            [ 2]  212     ldw (PROD+1,sp),x
      000266                        213     _xpop 
      0082C3 5F 00            [ 1]    1     ld a,(y)
      0082C5 0D               [ 1]    2     ldw x,y 
      0082C6 72 BB            [ 2]    3     ldw x,(1,x)
      0082C8 00 0D CF 00      [ 2]    4     addw y,#CELL_SIZE 
      0082CC 0D               [ 1]  214     tnz a 
      0082CD 97 7B            [ 1]  215     jrpl 0$
      0082CF 01 42            [ 1]  216     cpl (PROD_SIGN,sp)
      0082D1 72 BB 00         [ 4]  217     call neg_ax 
      000277                        218 0$:    
      0082D4 0C CF            [ 1]  219     ld (N1,sp),a 
      0082D6 00 0C            [ 2]  220     ldw (N1+1,sp),x
      00027B                        221     _at_top 
      0082D8 9E 5B            [ 1]    1     ld a,(y)
      0082DA 01               [ 1]    2     ldw x,y 
      0082DB 85 81            [ 2]    3     ldw x,(1,x)
      0082DD 4D               [ 1]  222     tnz a 
      0082DD 52 0A            [ 1]  223     jrpl 2$ 
      0082DF 0F 0A            [ 1]  224     cpl (PROD_SIGN,sp) 
      0082E1 0F 01 5F         [ 4]  225     call neg_ax
      0082E4 1F 02            [ 1]  226     ld (N2,sp),a 
      0082E6 90 F6            [ 2]  227     ldw (N2+1,sp),x   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      00028C                        228 2$: 
      0082E8 93 EE 01         [ 1]  229     ld acc24,a 
      0082EB 72 A9 00         [ 2]  230     ldw acc16,x 
      0082EE 03 4D            [ 1]  231     ld a,(N1+2,sp); least byte     
      0082F0 2A 05            [ 1]  232     jreq 4$
      0082F2 03 0A CD         [ 4]  233     call mulu24_8
      0082F5 82               [ 1]  234     tnz a 
      0082F6 85 60            [ 1]  235     jrne 8$ ; overflow 
      0082F7 CE 00 0D         [ 2]  236     ldw x,acc16  
      0082F7 6B 04 1F         [ 1]  237     ld a,acc24
      0082FA 05 90            [ 1]  238     jrmi 8$ ; overflow  
      0082FC F6 93            [ 1]  239     ld (PROD,sp),a
      0082FE EE 01            [ 2]  240     ldw (PROD+1,sp),x 
      0002A8                        241 4$:
      008300 4D 2A            [ 1]  242     ld a,(N2,sp) 
      008302 09 03            [ 2]  243     ldw x,(N2+1,sp)
      008304 0A CD 82         [ 1]  244     ld acc24,a 
      008307 85 6B 07         [ 2]  245     ldw acc16,x 
      00830A 1F 08            [ 1]  246     ld a,(N1+1,sp); middle byte     
      00830C 27 1F            [ 1]  247     jreq 5$
      00830C C7 00 0D         [ 4]  248     call mulu24_8
      00830F CF               [ 1]  249     tnz a 
      008310 00 0E            [ 1]  250     jrne 8$ ; overflow 
      008312 7B 06 27         [ 1]  251     ld a,acc24 
      008315 12 CD            [ 1]  252     jrne 8$  ; overflow 
      008317 82 AA 4D         [ 2]  253     ldw x,acc16  
      00831A 26 60 CE         [ 2]  254     addw x,(PROD,sp)
      00831D 00 0E            [ 1]  255     jrv 8$ ; overflow
      00831F C6 00            [ 2]  256     ldw (PROD,sp),x 
      008321 0D 2B            [ 1]  257     ld a,(N2,sp)
      008323 58 6B            [ 2]  258     ldw x,(N2+1,sp)
      008325 01 1F 02         [ 1]  259     ld acc24,a 
      008328 CF 00 0D         [ 2]  260     ldw acc16,x 
      0002D5                        261 5$:
      008328 7B 07            [ 1]  262     ld a,(N1,sp) ; high byte 
      00832A 1E 08            [ 1]  263     jreq 6$
      00832C C7 00 0D         [ 4]  264     call mulu24_8
      00832F CF               [ 1]  265     tnz a 
      008330 00 0E            [ 1]  266     jrne 8$ ; overflow 
      008332 7B 05 27         [ 2]  267     ldw x,acc24 
      008335 1F CD            [ 1]  268     jrne 8$ ; overflow 
      008337 82 AA 4D         [ 1]  269     ld a,acc8 
      00833A 26 40            [ 1]  270     jrmi 8$ ; overflow 
      00833C C6 00            [ 1]  271     add a,(PROD,sp)
      00833E 0D 26            [ 1]  272     ld (PROD,sp),a 
      008340 3B CE            [ 1]  273     jrv 8$ ; overflow 
      0002EF                        274 6$:
      008342 00 0E            [ 1]  275     ld a,(PROD,sp)
      008344 72 FB            [ 2]  276     ldw x,(PROD+1,sp)
      008346 01 29            [ 1]  277     tnz (PROD_SIGN,sp)
      008348 33 1F            [ 1]  278     jreq 9$
      00834A 01 7B 07         [ 4]  279     call neg_ax 
      00834D 1E 08            [ 2]  280     jra 9$ 
      0002FC                        281 8$: ; overflow
      00834F C7 00            [ 1]  282     ld a,#ERR_OVERFLOW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008351 0D CF 00         [ 2]  283     jp tb_error 
      000301                        284 9$:    
      000301                        285     _store_top 
      008354 0E F7            [ 1]    1     ld (y),a 
      008355 90 EF 01         [ 2]    2     ldw (1,y),x     
      000306                        286     _drop VSIZE 
      008355 7B 04            [ 2]    1     addw sp,#VSIZE 
      008357 27               [ 4]  287     ret 
                                    288 
                                    289 ;-------------------------------------
                                    290 ; divide uint24_t by uint8_t
                                    291 ; input:
                                    292 ;	acc24	dividend
                                    293 ;   A 		divisor
                                    294 ; output:
                                    295 ;   acc24	quotient
                                    296 ;   A		remainder
                                    297 ;------------------------------------- 
                                    298 ; offset  on sp of arguments and locals
                           000001   299 	U8   = 1   ; divisor on stack
                           000001   300 	VSIZE =1
      000309                        301 divu24_8:
      008358 16               [ 2]  302 	pushw x ; save x
      008359 CD               [ 1]  303 	push a 
                                    304 	; ld dividend UU:MM bytes in X
      00835A 82 AA 4D         [ 2]  305 	ldw x,acc24
      00835D 26 1D            [ 1]  306 	ld a,(U8,SP) ; divisor
      00835F CE               [ 2]  307 	div x,a ; UU:MM/U8
      008360 00               [ 1]  308 	push a  ;save remainder
      008361 0D 26 18         [ 2]  309     ldw acc24,x ; quotient 
      008364 C6               [ 1]  310 	pop a
      008365 00               [ 1]  311 	ld xh,a
      008366 0F 2B 13         [ 1]  312 	ld a,acc8
      008369 1B               [ 1]  313 	ld xl,a
      00836A 01 6B            [ 1]  314 	ld a,(U8,sp) ; divisor
      00836C 01               [ 2]  315 	div x,a  ; R:LL/U8
      00836D 29 0D            [ 1]  316 	ld (U8,sp),a ; save remainder
      00836F 9F               [ 1]  317 	ld a,xl
      00836F 7B 01 1E         [ 1]  318 	ld acc8,a
      008372 02               [ 1]  319 	pop a
      008373 0D               [ 2]  320 	popw x
      008374 0A               [ 4]  321 	ret
                                    322 
                                    323 
                                    324 ;-------------------------------
                                    325 ; div24 N/T   
                                    326 ; divide 24 bits integers
                                    327 ;  i1 i2 -- i1/i2 
                                    328 ;------------------------------
                           000001   329     DIVISOR=1
                           000004   330     CNTR=4
                           000005   331     QSIGN=5
                           000006   332     RSIGN=6 
                           000006   333     VSIZE=6 
      000327                        334 div24:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      000327                        335     _vars VSIZE 
      008375 27 0A            [ 2]    1     sub sp,#VSIZE 
      008377 CD 82            [ 1]  336     clr (RSIGN,sp)
      008379 85 20            [ 1]  337     clr (QSIGN,sp)
      00032D                        338     _xpop 
      00837B 05 F6            [ 1]    1     ld a,(y)
      00837C 93               [ 1]    2     ldw x,y 
      00837C A6 10            [ 2]    3     ldw x,(1,x)
      00837E CC 97 11 03      [ 2]    4     addw y,#CELL_SIZE 
      008381 4D               [ 1]  339     tnz a 
      008381 90 F7            [ 1]  340     jrpl 0$ 
      008383 90 EF            [ 1]  341     cpl (QSIGN,sp)
      008385 01 5B 0A         [ 4]  342     call neg_ax
      00033E                        343 0$:
      008388 81 01            [ 1]  344     ld  (DIVISOR,sp),a
      008389 1F 02            [ 2]  345     ldw (DIVISOR+1,sp),x
      008389 89 88            [ 1]  346     or a,(DIVISOR+1,sp)
      00838B CE 00            [ 1]  347     or a,(DIVISOR+2,sp)
      00838D 0D 7B            [ 1]  348     jrne 1$ 
      00838F 01 62            [ 1]  349     ld a,#ERR_DIV0 
      008391 88 CF 00         [ 2]  350     jp tb_error 
      00034D                        351 1$: 
      00034D                        352     _at_top
      008394 0D 84            [ 1]    1     ld a,(y)
      008396 95               [ 1]    2     ldw x,y 
      008397 C6 00            [ 2]    3     ldw x,(1,x)
      008399 0F               [ 1]  353     tnz a 
      00839A 97 7B            [ 1]  354     jrpl 2$
      00839C 01 62 6B         [ 4]  355     call neg_ax
      00839F 01 9F            [ 1]  356     cpl (QSIGN,sp)
      0083A1 C7 00            [ 1]  357     cpl (RSIGN,sp)
      00035C                        358 2$: 
      0083A3 0F 84 85         [ 1]  359     ld acc24,a 
      0083A6 81 00 0D         [ 2]  360     ldw acc16,x 
      0083A7 A6 18            [ 1]  361     ld a,#24 
      0083A7 52 06            [ 1]  362     ld (CNTR,sp),a
      0083A9 0F 06            [ 1]  363     ld a,(DIVISOR,sp)
      0083AB 0F 05            [ 2]  364     ldw x,(DIVISOR+1,sp)
      0083AD 90 F6 93         [ 4]  365     call cp24_ax ; A:X-acc24 ?
      0083B0 EE 01            [ 2]  366     jrule 22$ 
                                    367 ; quotient=0, remainder=divisor      
      0083B2 72 A9 00         [ 1]  368     ld a,acc24 
      0083B5 03 4D 2A         [ 2]  369     ldw x,acc16 
      0083B8 05 03 05 CD      [ 1]  370     clr acc24 
      0083BC 82 85 00 0D      [ 1]  371     clr acc16 
      0083BE 72 5F 00 0E      [ 1]  372     clr acc8 
      0083BE 6B 01            [ 2]  373     jra 6$
      000383                        374 22$:     
      0083C0 1F               [ 1]  375     clr a 
      0083C1 02               [ 1]  376     clrw x 
      0083C2 1A               [ 1]  377     rcf  
      000386                        378 3$: 
      0083C3 02 1A 03 26      [ 1]  379     rlc acc8 
      0083C7 05 A6 04 CC      [ 1]  380     rlc acc16
      0083CB 97 11 00 0C      [ 1]  381     rlc acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0083CD 59               [ 2]  382     rlcw x  
      0083CD 90               [ 1]  383     rlc a
      0083CE F6 93 EE         [ 2]  384 4$: subw x,(DIVISOR+1,sp) 
      0083D1 01 4D            [ 1]  385     sbc a,(DIVISOR,sp)
      0083D3 2A 07            [ 1]  386     jrnc 5$
      0083D5 CD 82 85         [ 2]  387     addw x,(DIVISOR+1,sp)
      0083D8 03 05            [ 1]  388     adc a,(DIVISOR,sp)
      0003A0                        389 5$: ; shift carry in QUOTIENT 
      0083DA 03               [ 1]  390     ccf
      0083DB 06 04            [ 1]  391     dec (CNTR,sp)
      0083DC 26 E1            [ 1]  392     jrne 3$ 
      0083DC C7 00 0D CF      [ 1]  393     rlc acc8 
      0083E0 00 0E A6 18      [ 1]  394     rlc acc16 
      0083E4 6B 04 7B 01      [ 1]  395     rlc acc32 
      0003B1                        396 6$:    
      0083E8 1E 02            [ 1]  397     ld (DIVISOR,sp),a 
      0083EA CD 82            [ 2]  398     ldw (DIVISOR+1,sp),x 
      0083EC 56 23 14         [ 1]  399     ld a,acc24 
      0083EF C6 00 0D         [ 2]  400     ldw x,acc16 
      0083F2 CE 00            [ 1]  401     tnz (QSIGN,sp)
      0083F4 0E 72            [ 1]  402     jreq 8$
      0083F6 5F 00 0D         [ 4]  403     call neg_ax 
      0003C2                        404 8$: 
      0003C2                        405     _store_top 
      0083F9 72 5F            [ 1]    1     ld (y),a 
      0083FB 00 0E 72         [ 2]    2     ldw (1,y),x     
      0083FE 5F 00            [ 1]  406     ld a,(DIVISOR,sp)
      008400 0F 20            [ 2]  407     ldw x,(DIVSOR+1,sp)
      0003CB                        408 81$:
      008402 2E 06            [ 1]  409     tnz (RSIGN,sp)
      008403 27 03            [ 1]  410     jreq 9$
      008403 4F 5F 98         [ 4]  411     call neg_ax       
      008406                        412 9$: _drop VSIZE 
      008406 72 59            [ 2]    1     addw sp,#VSIZE 
      008408 00               [ 4]  413     ret 
                                    414 
                                    415 
                                    416 ;-------------------------------
                                    417 ; mod24 A:X % acc24 
                                    418 ; remainder 24 bits integers 
                                    419 ; input:
                                    420 ;    acc24   dividend 
                                    421 ;    A:X     divisor 
                                    422 ; output:
                                    423 ;    acc24   acc24 % A:X 
                                    424 ;------------------------------
      0003D5                        425 mod24:
      008409 0F 72 59         [ 4]  426     call div24 
      0003D8                        427     _store_top  ; replace quotient by remainder 
      00840C 00 0E            [ 1]    1     ld (y),a 
      00840E 72 59 00         [ 2]    2     ldw (1,y),x     
      008411 0D               [ 4]  428     ret 
                                    429 
                                    430 
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
      0003DE                         32 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0003DE                         33 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0003DE                         34 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0003DE                         35 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0003DE                         36 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0003DE                         37 prt_regs::
      008412 59 49 72         [ 2]   38 	ldw x,#regs_state 
      008415 F0 02 12         [ 4]   39 	call puts
                                     40 ; register PC
      008418 01 24            [ 2]   41 	ldw y,(1,sp)
      00841A 05 72 FB         [ 2]   42 	ldw x,#REG_EPC 
      00841D 02 19 01         [ 4]   43 	call prt_reg16 
                                     44 ; register CC 
      008420 7B 08            [ 1]   45 	ld a,(R_CC,sp)
      008420 8C 0A 04         [ 2]   46 	ldw x,#REG_CC 
      008423 26 E1 72         [ 4]   47 	call prt_reg8 
                                     48 ; register A 
      008426 59 00            [ 1]   49 	ld a,(R_A,sp)
      008428 0F 72 59         [ 2]   50 	ldw x,#REG_A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00842B 00 0E 72         [ 4]   51 	call prt_reg8 
                                     52 ; register X 
      00842E 59 00            [ 2]   53 	ldw y,(R_X,sp)
      008430 0C 05 5E         [ 2]   54 	ldw x,#REG_X 
      008431 CD 04 A6         [ 4]   55 	call prt_reg16 
                                     56 ; register Y 
      008431 6B 01            [ 2]   57 	ldw y,(R_Y,sp)
      008433 1F 02 C6         [ 2]   58 	ldw x,#REG_Y 
      008436 00 0D CE         [ 4]   59 	call prt_reg16 
                                     60 ; register SP 
      008439 00 0E            [ 1]   61 	ldw y,sp
      00843B 0D 05 27 03      [ 2]   62 	addw y,#6+ARG_OFS  
      00843F CD 82 85         [ 2]   63 	ldw x,#REG_SP
      008442 CD 04 A6         [ 4]   64 	call prt_reg16
      008442 90 F7            [ 1]   65 	ld a,#CR 
      008444 90 EF 01         [ 4]   66 	call putc
      008447 7B 01 1E         [ 4]   67 	call putc   
      00844A 02               [ 4]   68 	ret 
                                     69 
                                     70 
      00844B 0A 72 65 67 69 73 74    71 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      000448                         81 prt_peek::
      00844B 0D               [ 2]   82 	pushw x 
      00844C 06 27 03 CD      [ 1]   83 	mov base,#16 
      008450 82 85 5B         [ 4]   84 	call prt_i16  
      008453 06 81            [ 1]   85 	ld a,#': 
      008455 CD 09 44         [ 4]   86 	call putc 
      008455 CD 83            [ 1]   87 	ld a,#SPACE 
      008457 A7 90 F7         [ 4]   88 	call putc 
      00845A 90               [ 2]   89 	popw x 
      00845B EF               [ 1]   90 	ld a,(x)
      00845C 01               [ 1]   91 	clrw x 
      00845D 81               [ 1]   92 	ld xl,a 
      00845E 35 0A 00 0A      [ 1]   93 	mov base,#10 
      00845E AE 84 A1         [ 4]   94 	call prt_i16 
      008461 CD               [ 4]   95 	ret 
                                     96 
                                     97 ;----------------------------------------
                                     98 ;   DEBUG support functions
                                     99 ;----------------------------------------
                                    100 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                    101 ; turn LED on 
      000466                        102 ledon:
      008462 8A 21 16 01      [ 1]  103     bset PC_ODR,#LED2_BIT
      008466 AE               [ 4]  104     ret 
                                    105 
                                    106 ; turn LED off 
      00046B                        107 ledoff:
      008467 85 D5 CD 85      [ 1]  108     bres PC_ODR,#LED2_BIT 
      00846B 26               [ 4]  109     ret 
                                    110 
                                    111 ; invert LED status 
      000470                        112 ledtoggle:
      00846C 7B 08            [ 1]  113     ld a,#LED2_MASK
      00846E AE 85 E6         [ 1]  114     xor a,PC_ODR
      008471 CD 85 04         [ 1]  115     ld PC_ODR,a
      008474 7B               [ 4]  116     ret 
                                    117 
      000479                        118 left_paren:
      008475 07 AE            [ 1]  119 	ld a,#SPACE 
      008477 85 E2 CD         [ 4]  120 	call putc
      00847A 85 04            [ 1]  121 	ld a,#'( 
      00847C 16 05 AE         [ 4]  122 	call putc 	
      00847F 85               [ 4]  123 	ret 
                                    124 
                                    125 ;------------------------------
                                    126 ; print 8 bit register 
                                    127 ; input:
                                    128 ;   X  point to register name 
                                    129 ;   A  register value to print 
                                    130 ; output:
                                    131 ;   none
                                    132 ;------------------------------- 
      000484                        133 prt_reg8:
      008480 DE               [ 1]  134 	push a 
      008481 CD 85 26         [ 4]  135 	call puts 
      008484 16 03            [ 1]  136 	ld a,(1,sp) 
      008486 AE               [ 1]  137 	clrw x 
      008487 85               [ 1]  138 	ld xl,a 
      008488 DA CD 85 26      [ 1]  139 	mov base,#16
      00848C 90 96 72         [ 4]  140 	call prt_i16  
      00848F A9 00 08         [ 4]  141 	call left_paren 
      008492 AE               [ 1]  142 	pop a 
      008493 85               [ 1]  143 	clrw x 
      008494 EB               [ 1]  144 	ld xl,a 
      008495 CD 85 26 A6      [ 1]  145 	mov base,#10 
      008499 0D CD 89         [ 4]  146 	call prt_i16  
      00849C C4 CD            [ 1]  147 	ld a,#') 
      00849E 89 C4 81         [ 4]  148 	call putc
      0084A1 0A               [ 4]  149 	ret
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
      0004A6                        159 prt_reg16: 
      0084A2 72 65            [ 2]  160 	pushw y 
      0084A4 67 69 73         [ 4]  161 	call puts 
      0084A7 74 65            [ 2]  162 	ldw x,(1,sp) 
      0084A9 72 73 20 73      [ 1]  163 	mov base,#16 
      0084AD 74 61 74         [ 4]  164 	call prt_i16  
      0084B0 65 0A 2D         [ 4]  165 	call left_paren 
      0084B3 2D               [ 2]  166 	popw x 
      0084B4 2D 2D 2D 2D      [ 1]  167 	mov base,#10 
      0084B8 2D 2D 2D         [ 4]  168 	call prt_i16  
      0084BB 2D 2D            [ 1]  169 	ld a,#') 
      0084BD 2D 2D 2D         [ 4]  170 	call putc
      0084C0 2D               [ 4]  171 	ret 
                                    172 
                                    173 ;------------------------------------
                                    174 ; print registers contents saved on
                                    175 ; stack by trap interrupt.
                                    176 ;------------------------------------
      0004C5                        177 print_registers:
      0084C1 2D 2D 2D         [ 2]  178 	ldw x,#STATES
      0084C4 2D 2D 0A         [ 4]  179 	call puts
                                    180 ; print EPC 
      0084C7 00 05 55         [ 2]  181 	ldw x, #REG_EPC
      0084C8 CD 09 A1         [ 4]  182 	call puts 
      0084C8 89 35            [ 1]  183 	ld a, (11,sp)
      0084CA 10 00 0B         [ 1]  184 	ld acc8,a 
      0084CD CD 98            [ 1]  185 	ld a, (10,sp) 
      0084CF 65 A6 3A         [ 1]  186 	ld acc16,a 
      0084D2 CD 89            [ 1]  187 	ld a,(9,sp) 
      0084D4 C4 A6 20         [ 1]  188 	ld acc24,a
      0084D7 CD               [ 1]  189 	clrw x  
      0084D8 89 C4            [ 1]  190 	ld a,#16
      0084DA 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084DD 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084E0 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084E2 CD 98 65         [ 4]  195 	call prt_reg16  
                                    196 ; print Y 
      0084E5 81 05 5A         [ 2]  197 	ldw x,#REG_Y
      0084E6 16 07            [ 2]  198 	ldw y, (7,sp)
      0084E6 72 1A 50         [ 4]  199 	call prt_reg16  
                                    200 ; print A 
      0084E9 0A 81 62         [ 2]  201 	ldw x,#REG_A
      0084EB 7B 04            [ 1]  202 	ld a, (4,sp) 
      0084EB 72 1B 50         [ 4]  203 	call prt_reg8
                                    204 ; print CC 
      0084EE 0A 81 66         [ 2]  205 	ldw x,#REG_CC 
      0084F0 7B 03            [ 1]  206 	ld a, (3,sp) 
      0084F0 A6 20 C8         [ 4]  207 	call prt_reg8 
                                    208 ; print SP 
      0084F3 50 0A C7         [ 2]  209 	ldw x,#REG_SP
      0084F6 50 0A            [ 1]  210 	ldw y,sp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0084F8 81 A9 00 0C      [ 2]  211 	addw y,#12
      0084F9 CD 04 A6         [ 4]  212 	call prt_reg16  
      0084F9 A6 20            [ 1]  213 	ld a,#'\n' 
      0084FB CD 89 C4         [ 4]  214 	call putc
      0084FE A6               [ 4]  215 	ret
                                    216 
      0084FF 28 CD 89 C4 81 73 74   217 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008504 45 50 43 3A 00         218 REG_EPC: .asciz "EPC:"
      008504 88 CD 8A 21            219 REG_Y:   .asciz "\nY:" 
      008508 7B 01 5F 97            220 REG_X:   .asciz "\nX:"
      00850C 35 10 00 0B            221 REG_A:   .asciz "\nA:" 
      008510 CD 98 65 CD 84         222 REG_CC:  .asciz "\nCC:"
      008515 F9 84 5F 97 35         223 REG_SP:  .asciz "\nSP:"
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
      000570                        235 cmd_itf:
      00851A 0A 00            [ 2]  236 	sub sp,#VSIZE 
      00851C 0B CD 98 65      [ 1]  237 	clr farptr 
      008520 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      008524 C4 81 00 1A      [ 1]  239 	clr farptr+2  
      008526                        240 repl:
      008526 90 89            [ 1]  241 	ld a,#CR 
      008528 CD 8A 21         [ 4]  242 	call putc 
      00852B 1E 01            [ 1]  243 	ld a,#'? 
      00852D 35 10 00         [ 4]  244 	call putc
      008530 0B CD 98 65      [ 1]  245 	clr in.w 
      008534 CD 84 F9 85      [ 1]  246 	clr in 
      008538 35 0A 00         [ 4]  247 	call readln
      00853B 0B CD 98 65      [ 2]  248 	ldw y,#tib  
      00853F A6 29            [ 1]  249 	ld a,(y)
      008541 CD 89            [ 1]  250 	jreq repl  
      008543 C4 81 00 01      [ 1]  251 	inc in 
      008545 CD 18 7B         [ 4]  252 	call to_upper 
      008545 AE 85            [ 1]  253 	cp a,#'Q 
      008547 98 CD            [ 1]  254 	jrne test_p
      0005A6                        255 repl_exit:
      008549 8A 21 AE 85      [ 1]  256 	clr tib 
      00854D D5 CD 8A 21      [ 1]  257 	clr count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      008551 7B 0B C7 00      [ 1]  258 	clr in 
      0005B2                        259 	_drop #VSIZE 	
      008555 0F 7B            [ 2]    1     addw sp,##VSIZE 
      008557 0A               [ 4]  260 	ret  
      0005B5                        261 invalid:
      008558 C7 00 0E         [ 2]  262 	ldw x,#invalid_cmd 
      00855B 7B 09 C7         [ 4]  263 	call puts 
      00855E 00 0D            [ 2]  264 	jra repl 
      0005BD                        265 test_p:	
      008560 5F A6            [ 1]  266     cp a,#'P 
      008562 10 CD            [ 1]  267 	jreq mem_peek
      008564 98 7C            [ 1]  268     cp a,#'S 
      008566 AE 85            [ 1]  269 	jrne invalid 
      0005C5                        270 print_string:	
      008568 DE 16 05         [ 4]  271 	call get_token
      00856B CD 85            [ 1]  272 	cp a,#TK_INTGR 
      00856D 26 AE            [ 1]  273 	jrne invalid 
      00856F 85 DA 16         [ 4]  274 	call puts
      008572 07 CD 85         [ 2]  275 	jp repl 	
      0005D2                        276 mem_peek:
      008575 26 AE            [ 1]  277 	ld a,#SPACE 
      008577 85 E2 7B         [ 4]  278 	call skip  	 
      00857A 04 CD 85 04      [ 2]  279 	addw y,in.w 
      00857E AE 85 E6         [ 2]  280 	ldw x,#pad 
      008581 7B 03 CD         [ 4]  281 	call strcpy
      008584 85 04 AE         [ 2]  282 	ldw x,#pad
      008587 85 EB 90         [ 4]  283 	call atoi24 	
      00858A 96 72 A9         [ 1]  284 	ld a, acc24 
      00858D 00 0C CD         [ 1]  285 	or a,acc16 
      008590 85 26 A6         [ 1]  286 	or a,acc8 
      008593 0A CD            [ 1]  287 	jrne 1$ 
      008595 89 C4            [ 2]  288 	jra peek_byte  
      008597 81 0A 52         [ 2]  289 1$:	ldw x,acc24 
      00859A 65 67 69         [ 2]  290 	ldw farptr,x 
      00859D 73 74 65         [ 1]  291 	ld a,acc8 
      0085A0 72 73 20         [ 1]  292 	ld farptr+2,a 
      000600                        293 peek_byte:
      0085A3 73 74 61         [ 4]  294 	call print_farptr 
      0085A6 74 65            [ 1]  295 	ld a,#8 
      0085A8 20 61            [ 1]  296 	ld (PSIZE,sp),a 
      0085AA 74               [ 1]  297 	clrw x 
      0085AB 20 61 62         [ 4]  298 1$:	call fetchc  
      0085AE 6F               [ 2]  299 	pushw x 
      0085AF 72 74 20         [ 1]  300 	ld acc8,a 
      0085B2 70               [ 1]  301 	clrw x 
      0085B3 6F 69 6E         [ 2]  302 	ldw acc24,x 
      0085B6 74 2E            [ 1]  303 	ld a,#16+128
      0085B8 0A 2D 2D         [ 4]  304 	call prt_acc24
      0085BB 2D               [ 2]  305 	popw x 
      0085BC 2D 2D            [ 1]  306 	dec (PSIZE,sp)
      0085BE 2D 2D            [ 1]  307 	jrne 1$ 
      0085C0 2D 2D            [ 1]  308 	ld a,#8 
      0085C2 2D 2D 2D         [ 1]  309 	add a,farptr+2 
      0085C5 2D 2D 2D         [ 1]  310 	ld farptr+2,a
      0085C8 2D               [ 1]  311 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0085C9 2D 2D 2D         [ 1]  312 	adc a,farptr+1 
      0085CC 2D 2D 2D         [ 1]  313 	ld farptr+1,a 
      0085CF 2D               [ 1]  314 	clr a 
      0085D0 2D 2D 2D         [ 1]  315 	adc a,farptr 
      0085D3 0A 00 45         [ 1]  316 	ld farptr,a 
      0085D6 50 43 3A         [ 2]  317 	jp repl  
                                    318 
      0085D9 00 0A 59 3A 00 0A 58   319 invalid_cmd: .asciz "not a command\n" 
             3A 00 0A 41 3A 00 0A
             43
                                    320 
                                    321 ;----------------------------
                                    322 ; display farptr address
                                    323 ;----------------------------
      000645                        324 print_farptr:
      0085E8 43 3A 00         [ 1]  325 	ld a ,farptr+2 
      0085EB 0A 53 50         [ 1]  326 	ld acc8,a 
      0085EE 3A 00 18         [ 2]  327 	ldw x,farptr 
      0085F0 CF 00 0C         [ 2]  328 	ldw acc24,x 
      0085F0 52               [ 1]  329 	clrw x 
      0085F1 01 72            [ 1]  330 	ld a,#16 
      0085F3 5F 00 19         [ 4]  331 	call prt_acc24
      0085F6 72 5F            [ 1]  332 	ld a,#SPACE 
      0085F8 00 1A 72         [ 4]  333 	call putc 
      0085FB 5F 00 1B         [ 4]  334 	call putc 
      0085FE 81               [ 4]  335 	ret
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
      000660                        346 fetchc: ; @C
      0085FE A6 0D CD 89      [ 5]  347 	ldf a,([farptr],x)
      008602 C4               [ 1]  348 	incw x
      008603 A6               [ 4]  349 	ret
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
      000666                        360 number:
      008604 3F CD 89         [ 4]  361 	call get_token
      008607 C4 72            [ 1]  362 	cp a,#TK_INTGR
      008609 5F 00            [ 1]  363 	jreq 1$
      00860B 01 72 5F         [ 2]  364 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00860E 00               [ 4]  365 1$:	ret
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
      000671                        380 show_row:
      00860F 02               [ 1]  381 	tnz a 
      008610 CD 8B            [ 1]  382 	jrne 1$
      008612 26               [ 4]  383 	ret 
      000675                        384 1$:	
      008613 90               [ 2]  385 	pushw x  
      008614 AE               [ 1]  386 	push a 
      008615 16 68 90 F6      [ 1]  387 	mov tab_width,#4 
      008619 27 E3 72         [ 4]  388 	call prt_i16 
      00861C 5C 00            [ 1]  389 	ld a,#SPACE  
      00861E 02 CD 98         [ 4]  390 	call putc
      000683                        391 row_loop:
      008621 FB A1            [ 2]  392 	ldw x,(ADR,sp)
      008623 51               [ 1]  393 	ld a,(x)
      008624 26               [ 1]  394 	clrw x 
      008625 17               [ 1]  395 	ld xl,a 
      008626 CD 17 E5         [ 4]  396 	call prt_i16 
      008626 72 5F            [ 2]  397 	ldw x,(ADR,sp)
      008628 16               [ 1]  398 	incw x 
      008629 68 72            [ 2]  399 	ldw (ADR,sp),x 
      00862B 5F 00            [ 1]  400 	dec (CNT,sp)
      00862D 04 72            [ 1]  401 	jrne row_loop
      000694                        402 	_drop VSIZE  		
      00862F 5F 00            [ 2]    1     addw sp,#VSIZE 
      008631 02 5B 01 81      [ 1]  403 	mov tab_width,#4
      008635 A6 0D            [ 1]  404 	ld a,#CR 
      008635 AE 86 B6         [ 4]  405 	call putc 
      008638 CD               [ 4]  406 	ret 
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



      0006A0                        419 hex_dump:
      008639 8A               [ 1]  420 	push a 
      0006A1                        421 	_vars VSIZE
      00863A 21 20            [ 2]    1     sub sp,#VSIZE 
      00863C C1 00 0A         [ 1]  422 	ld a,base
      00863D 6B 03            [ 1]  423 	ld (BASE,sp),a 
      00863D A1 50 27 11      [ 1]  424 	mov base,#16
      008641 A1 53 26         [ 1]  425 	ld a,tab_width 
      008644 F0 04            [ 1]  426 	ld (TABW,sp),a
      008645 A6 0D            [ 1]  427 	ld a,#CR 
      008645 CD 8F 8E         [ 4]  428 	call putc 
      008648 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      00864A 26 E9            [ 1]  430 	ld a,#16
      00864C CD 8A 21 CC      [ 2]  431 	cpw y,#16
      008650 85 FE            [ 1]  432 	jrpl 2$
      008652 90 9F            [ 1]  433 	ld a,yl
      0006C2                        434 2$: 	
      008652 A6 20 CD         [ 4]  435 	call show_row 
      008655 8F 7B            [ 2]  436 	ldw y,(BCNT,sp) 
      008657 72 B9 00 01      [ 2]  437 	subw y,#16 
      00865B AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00865F 94 6F            [ 1]  439 	jrpl 1$
      008661 AE 16            [ 1]  440 	ld a,(BASE,sp)
      008663 B8 CD 99         [ 1]  441 	ld base,a
      008666 07 C6            [ 1]  442 	ld a,(TABW,sp)
      008668 00 0D CA         [ 1]  443 	ld tab_width,a 
      0006DB                        444 	_drop VSIZE
      00866B 00 0E            [ 2]    1     addw sp,#VSIZE 
      00866D CA               [ 1]  445 	pop a 
      00866E 00               [ 4]  446 	ret 
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
      0006DF                         45 unlock_eeprom:
      00866F 0F 26 02 20 0C   [ 2]   46 	btjt FLASH_IAPSR,#FLASH_IAPSR_DUL,9$
      008674 CE 00 0D CF      [ 1]   47 	mov FLASH_CR2,#0 
      008678 00 19 C6 00      [ 1]   48 	mov FLASH_NCR2,#0xFF 
      00867C 0F C7 00 1B      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008680 35 56 50 64      [ 1]   50     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008680 CD 86 C5 A6 08   [ 2]   51 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008685 6B               [ 4]   52 9$:	ret
                                     53 
                                     54 ;----------------------------------
                                     55 ; unlock FLASH for writing/erasing
                                     56 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                     57 ; input:
                                     58 ;  none
                                     59 ; output:
                                     60 ;  none
                                     61 ;----------------------------------
      0006FA                         62 unlock_flash:
      008686 01 5F CD 86 E0   [ 2]   63 	btjt FLASH_IAPSR,#FLASH_IAPSR_PUL,9$
      00868B 89 C7 00 0F      [ 1]   64 	mov FLASH_CR2,#0 
      00868F 5F CF 00 0D      [ 1]   65 	mov FLASH_NCR2,#0xFF 
      008693 A6 90 CD 98      [ 1]   66 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008697 7C 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00869B 26 EB A6 08 CB   [ 2]   68 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      0086A0 00               [ 4]   69 9$:	ret
                                     70 
                                     71 ;----------------------------
                                     72 ; erase block code must be 
                                     73 ; executed from RAM
                                     74 ; input:
                                     75 ;-----------------------------
      000715                         76 row_erase:
      0086A1 1B               [ 1]   77 	push a 
      0086A2 C7 00            [ 2]   78 	pushw y 
      0086A4 1B 4F C9 00      [ 1]   79 	mov FLASH_CR2,#(1<<FLASH_CR2_ERASE) 
      0086A8 1A C7 00 1A      [ 1]   80 	mov FLASH_NCR2,#~(1<<FLASH_CR2_ERASE)
      0086AC 4F               [ 1]   81 	clr a 
      0086AD C9 00            [ 1]   82 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0086AF 19 C7 00 19      [ 1]   83 	ldf ([farptr],y),a
      0086B3 CC 85            [ 1]   84     incw y
      0086B5 FE 6E 6F 74      [ 1]   85 	ldf ([farptr],y),a
      0086B9 20 61            [ 1]   86     incw y
      0086BB 20 63 6F 6D      [ 1]   87 	ldf ([farptr],y),a
      0086BF 6D 61            [ 1]   88     incw y
      0086C1 6E 64 0A 00      [ 1]   89 	ldf ([farptr],y),a
      0086C5 72 05 50 5F FB   [ 2]   90 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      0086C5 C6 00            [ 2]   91 	popw y 
      0086C7 1B               [ 1]   92 	pop a 
      0086C8 C7               [ 4]   93 	ret
      000742                         94 row_erase_end:
                                     95 
                                     96 ; copy erase_start in RAM 
      000742                         97 move_erase_to_ram:
      0086C9 00               [ 2]   98 	pushw x 
      0086CA 0F CE            [ 2]   99 	pushw y 
      0086CC 00 19 CF         [ 2]  100 	ldw x,#row_erase_end 
      0086CF 00 0D 5F         [ 2]  101 	subw x,#row_erase
      0086D2 A6 10 CD         [ 2]  102 	ldw acc16,x 
      0086D5 98 7C A6         [ 2]  103 	ldw x,#tib 
      0086D8 20 CD 89 C4      [ 2]  104 	ldw y,#row_erase 
      0086DC CD 89 C4         [ 4]  105 	call move
      0086DF 81 85            [ 2]  106 	popw y
      0086E0 85               [ 2]  107 	popw x
      0086E0 92               [ 4]  108 	ret 
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
      00075C                        123 program_row:
      0086E1 AF               [ 1]  124 	push a 
      0086E2 00 19            [ 2]  125 	pushw y 
      0086E4 5C 81            [ 1]  126 	push #BLOCK_SIZE  
                                    127 ;enable block programming 
      0086E6 72 10 50 5B      [ 1]  128 	bset FLASH_CR2,#FLASH_CR2_PRG 
      0086E6 CD 8F 8E A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086EA 84 27            [ 1]  130 	clrw y 
      0086EC 03               [ 1]  131 1$:	ld a,(x)
      0086ED CC 97 0F 81      [ 1]  132 	ldf ([farptr],y),a
      0086F1 5C               [ 1]  133 	incw x 
      0086F1 4D 26            [ 1]  134 	incw y 
      0086F3 01 81            [ 1]  135 	dec (BCNT,sp)
      0086F5 26 F4            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0086F5 89 88 35 04 00   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
      00077C                        139 	_drop 1 
      0086FA 24 CD            [ 2]    1     addw sp,#1 
      0086FC 98 65            [ 2]  140 	popw y 
      0086FE A6               [ 1]  141 	pop a 
      0086FF 20               [ 4]  142 	ret 
      000782                        143 program_row_end:
                                    144 
                                    145 ;-------------------------
                                    146 ; move program_row to RAM 
                                    147 ; at txtubound address 
                                    148 ;------------------------
      000782                        149 move_prg_to_ram:
      008700 CD               [ 2]  150 	pushw x 
      008701 89 C4            [ 2]  151 	pushw y 
      008703 AE 07 82         [ 2]  152 	ldw x,#program_row_end 
      008703 1E 02 F6         [ 2]  153 	subw x,#program_row 
      008706 5F 97 CD         [ 2]  154 	ldw acc16,x ; bytes to move 
      008709 98 65 1E         [ 2]  155 	ldw x,#tib ; destination address 
      00870C 02 5C 1F 02      [ 2]  156 	ldw y,#program_row ; source address 
      008710 0A 01 26         [ 4]  157 	call move
      008713 EF 5B            [ 2]  158 	popw y 
      008715 03               [ 2]  159 	popw x  
      008716 35               [ 4]  160 	ret 
                                    161 
                                    162 
                                    163 ;-----------------------------
                                    164 ; write a buffer in FLASH/EEPROM 
                                    165 ; input:
                                    166 ;    farptr   destination address 
                                    167 ;    x        buffer address 
                                    168 ;-----------------------------
      00079C                        169 write_buffer:
      008717 04               [ 2]  170 	pushw x 
      008718 00 24 A6 0D      [ 1]  171 	tnz farptr 
      00871C CD 89            [ 1]  172 	jrne to_flash 
      00871E C4 81 19         [ 2]  173 	ldw x,farptr+1 
      008720 A3 35 80         [ 2]  174 	cpw x,#app_space  
      008720 88 52            [ 1]  175 	jruge to_flash 
      0007AB                        176 to_eeprom:
      008722 04 C6 00         [ 4]  177 	call unlock_eeprom
      008725 0B 6B            [ 2]  178 	jra do_programming
      0007B0                        179 to_flash:
      008727 03 35 10         [ 4]  180 	call unlock_flash
      0007B3                        181 do_programming:
      00872A 00               [ 2]  182 	popw x 
      00872B 0B C6 00         [ 4]  183 	call tib
      00872E 24 6B 04 A6      [ 1]  184 	bres FLASH_IAPSR,#FLASH_IAPSR_PUL 
      008732 0D CD 89 C4      [ 1]  185 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL  
      008736 17               [ 4]  186 	ret 
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
      0007C0                        197 block_erase:
      008737 01               [ 2]  198 	pushw x 
      008738 A6 10 90         [ 1]  199 	ld a,farptr 
      00873B A3 00            [ 1]  200 	jrne erase_flash
      00873D 10 2A 02         [ 2]  201 	ldw x,farptr+1
      008740 90 9F 80         [ 2]  202 	cpw x,#app_space 
      008742 24 0C            [ 1]  203 	jruge erase_flash 
                                    204 ; erase eeprom block
      008742 CD 86 F1         [ 4]  205 	call unlock_eeprom 
      008745 16 01 72         [ 4]  206 	call tib 
      008748 A2 00 10 90      [ 1]  207 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      00874C A3 00            [ 2]  208 	jra erase_exit  
                                    209 ; erase flash block:
      0007DA                        210 erase_flash:
      00874E 01 2A E5         [ 4]  211 	call unlock_flash 
      008751 7B 03 C7         [ 4]  212 	call tib 
      008754 00 0B 7B 04      [ 1]  213     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0007E4                        214 erase_exit: 
      008758 C7               [ 2]  215 	popw x 
      008759 00               [ 4]  216 	ret 
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
      0007E6                        232 write_byte:
      00875A 24 5B            [ 2]  233 	pushw y
      0007E8                        234 	_vars VSIZE
      00875C 04 84            [ 2]    1     sub sp,#VSIZE 
      00875E 81 01            [ 1]  235 	ld (BTW,sp),a ; byte to write 
      00875F 0F 02            [ 1]  236 	clr (OPT,sp)  ; OPTION flag
                                    237 ; put addr[15:0] in Y, for bounds check.
      00875F 72 06 50 5F      [ 2]  238 	ldw y,farptr+1   ; Y=addr15:0
                                    239 ; check addr[23:16], if <> 0 then it is extened flash memory
      008763 15 35 00 50      [ 1]  240 	tnz farptr 
      008767 5B 35            [ 1]  241 	jrne write_flash
      008769 FF 50 5C 35      [ 2]  242     cpw y,#app_space 	 
      00876D AE 50            [ 1]  243     jruge write_flash
      00876F 64 35 56 50      [ 2]  244 	cpw y,#EEPROM_BASE  
      008773 64 72            [ 1]  245     jrult write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      008775 07 50 5F FB      [ 2]  246 	cpw y,#OPTION_END 
      008779 81 51            [ 1]  247 	jrugt write_exit
      00877A 20 16            [ 2]  248 	jra write_eeprom 
                                    249 ; write program memory
      00080C                        250 write_flash:
      00877A 72 02 50         [ 4]  251 	call unlock_flash 
      00877D 5F               [ 1]  252 1$:	sim 
      00877E 15 35            [ 1]  253 	ld a,(BTW,sp)
      008780 00 50 5B 35      [ 4]  254 	ldf ([farptr],x),a ; farptr[x]=A
      008784 FF 50 5C 35 56   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008789 50               [ 1]  256     rim 
      00878A 62 35 AE 50      [ 1]  257     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00878E 62 72            [ 2]  258     jra write_exit
                                    259 ; write eeprom and option
      000822                        260 write_eeprom:
      008790 03 50 5F         [ 4]  261 	call unlock_eeprom
                                    262 	; check for data eeprom or option eeprom
      008793 FB 81 48 00      [ 2]  263 	cpw y,#OPTION_BASE
      008795 2B 08            [ 1]  264 	jrmi 1$
      008795 88 90 89 35      [ 2]  265 	cpw y,#OPTION_END+1
      008799 20 50            [ 1]  266 	jrpl 1$
      00879B 5B 35            [ 1]  267 	cpl (OPT,sp)
      000833                        268 1$: 
      00879D DF 50            [ 1]  269     tnz (OPT,sp)
      00879F 5C 4F            [ 1]  270     jreq 2$
                                    271 	; pour modifier une option il faut modifier ces 2 bits
      0087A1 90 5F 91 A7      [ 1]  272     bset FLASH_CR2,#FLASH_CR2_OPT
      0087A5 00 19 90 5C      [ 1]  273     bres FLASH_NCR2,#FLASH_CR2_OPT 
      00083F                        274 2$: 
      0087A9 91 A7            [ 1]  275     ld a,(BTW,sp)
      0087AB 00 19 90 5C      [ 4]  276     ldf ([farptr],x),a
      0087AF 91 A7            [ 1]  277     tnz (OPT,sp)
      0087B1 00 19            [ 1]  278     jreq 3$
      0087B3 90               [ 1]  279     incw x
      0087B4 5C 91            [ 1]  280     ld a,(BTW,sp)
      0087B6 A7               [ 1]  281     cpl a
      0087B7 00 19 72 05      [ 4]  282     ldf ([farptr],x),a
      0087BB 50 5F FB 90 85   [ 2]  283 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0087C0 84 81 50 5F FB   [ 2]  284 	btjf FLASH_IAPSR,#FLASH_IAPSR_HVOFF,.
      0087C2                        285 write_exit:
      0087C2                        286 	_drop VSIZE 
      0087C2 89 90            [ 2]    1     addw sp,#VSIZE 
      0087C4 89 AE            [ 2]  287 	popw y
      0087C6 87               [ 4]  288     ret
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
      000860                        304 	_argofs 3 
                           000005     1     ARG_OFS=2+3 
      000860                        305 	_arg BSIZE 1  ; block size
                           000006     1     BSIZE=ARG_OFS+1 
                                    306 	; local var 
                           000001   307 	XSAVE=1 
                           000002   308 	VSIZE=2 
      000860                        309 write_block::
      0087C7 C2               [ 1]  310 	push a 
      000861                        311 	_vars VSIZE
      0087C8 1D 87            [ 2]    1     sub sp,#VSIZE 
      0087CA 95 CF            [ 2]  312 	ldw (XSAVE,sp),x 
      0087CC 00 0E            [ 2]  313 	ldw x,(BSIZE,sp) 
      0087CE AE 16            [ 1]  314 	jreq 9$
      0087D0 68 90            [ 2]  315 1$:	ldw x,(XSAVE,sp)
      0087D2 AE 87            [ 1]  316 	ld a,(y)
      0087D4 95 CD 94         [ 4]  317 	call write_byte 
      0087D7 7F               [ 1]  318 	incw x 
      0087D8 90 85            [ 1]  319 	incw y 
      0087DA 85 81            [ 2]  320 	ldw (XSAVE,sp),x
      0087DC 1E 06            [ 2]  321 	ldw x,(BSIZE,sp)
      0087DC 88               [ 2]  322 	decw x
      0087DD 90 89            [ 2]  323 	ldw (BSIZE,sp),x 
      0087DF 4B 80            [ 1]  324 	jrne 1$
      00087C                        325 9$:
      0087E1 72 10            [ 2]  326 	ldw x,(XSAVE,sp)
      0087E3 50 5B 72         [ 4]  327 	call incr_farptr
      000881                        328 	_drop VSIZE
      0087E6 11 50            [ 2]    1     addw sp,#VSIZE 
      0087E8 5C               [ 1]  329 	pop a 
      0087E9 90               [ 4]  330 	ret 
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
      000885                        347 write_nbytes:
      0087EA 5F F6            [ 2]  348 	pushw y
      0087EC 91               [ 1]  349 	push a 
      0087ED A7 00            [ 1]  350 	ldw y,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0087EF 19               [ 1]  351 	clrw x 
      00088B                        352 1$:  
      0087F0 5C 90            [ 1]  353 	ld a,(y)
      0087F2 5C 0A            [ 1]  354 	incw y
      0087F4 01 26 F4         [ 4]  355 	call write_byte 
      0087F7 72               [ 1]  356 	incw x 
      0087F8 05 50            [ 1]  357 	dec (1,sp)  
      0087FA 5F FB            [ 1]  358 	jrne 1$ 
      0087FC 5B               [ 1]  359 9$: pop a 
      0087FD 01 90            [ 2]  360 	popw y 
      0087FF 85               [ 4]  361 	ret 
                                    362 
                                    363 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    364 ;;;  flash memory operations
                                    365 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    366 
                                    367 ;--------------------------
                                    368 ; align farptr to BLOCK_SIZE 
                                    369 ;---------------------------
      00089B                        370 row_align:
      008800 84 81            [ 1]  371 	ld a,#0x7f 
      008802 C4 00 1A         [ 1]  372 	and a,farptr+2 
      008802 27 13            [ 1]  373 	jreq 1$ 
      008802 89 90 89         [ 2]  374 	ldw x,farptr+1 
      008805 AE 88 02         [ 2]  375 	addw x,#BLOCK_SIZE 
      008808 1D 87            [ 1]  376 	jrnc 0$
      00880A DC CF 00 0E      [ 1]  377 	inc farptr 
      00880E AE               [ 1]  378 0$: ld a,xl 
      00880F 16 68            [ 1]  379 	and a,#0x80
      008811 90               [ 1]  380 	ld xl,a
      008812 AE 87 DC         [ 2]  381 	ldw farptr+1,x  	
      008815 CD               [ 4]  382 1$:	ret
                                    383 
                                    384 ;--------------------
                                    385 ; input:
                                    386 ;   X     increment 
                                    387 ; output:
                                    388 ;   farptr  incremented 
                                    389 ;---------------------
      0008B6                        390 incr_farptr:
      008816 94 7F 90 85      [ 2]  391 	addw x,farptr+1 
      00881A 85 81            [ 1]  392 	jrnc 1$
      00881C 72 5C 00 18      [ 1]  393 	inc farptr 
      00881C 89 72 5D         [ 2]  394 1$:	ldw farptr+1,x  
      00881F 00               [ 4]  395 	ret 
                                    396 
                                    397 ;-----------------------------------
                                    398 ; scan block for non zero byte 
                                    399 ; block are 128 bytes 
                                    400 ; input:
                                    401 ;    farptr     address block  
                                    402 ; output:
                                    403 ;     A     0 cleared, other not cleared  
                                    404 ;-----------------------------------
      0008C4                        405 scan_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      008820 19               [ 1]  406 	clrw x 
      008821 26 0D CE 00      [ 5]  407 1$: ldf a,([farptr],x) 
      008825 1A A3            [ 1]  408 	jrne 2$
      008827 B6               [ 1]  409 	incw x 
      008828 00 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
      00882B 25 F4            [ 1]  411 	jrult 1$ 
      00882B CD               [ 4]  412 2$:	ret 
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
      0008D2                         66 Uart1RxHandler: ; console receive char 
      00882C 87 5F 20 03 27   [ 2]   67 	btjf UART1_SR,#UART_SR_RXNE,5$
      008830 C6 52 31         [ 1]   68 	ld a,UART1_DR 
      008830 CD 87            [ 1]   69 	cp a,#CTRL_C 
      008832 7A 06            [ 1]   70 	jrne 2$
      008833 CD 09 44         [ 4]   71 	call putc 
      008833 85 CD 16         [ 2]   72 	jp user_interrupted
      0008E4                         73 2$:
      008836 68 72            [ 1]   74 	cp a,#CAN ; CTRL_X 
      008838 13 50            [ 1]   75 	jrne 3$
      00883A 5F 72 17         [ 2]   76 	jp cold_start 	
      00883D 50               [ 1]   77 3$:	push a 
      00883E 5F 81            [ 1]   78 	ld a,#rx1_queue 
      008840 CB 00 2F         [ 1]   79 	add a,rx1_tail 
      008840 89               [ 1]   80 	clrw x 
      008841 C6               [ 1]   81 	ld xl,a 
      008842 00               [ 1]   82 	pop a 
      008843 19               [ 1]   83 	ld (x),a 
      008844 26 14 CE         [ 1]   84 	ld a,rx1_tail 
      008847 00               [ 1]   85 	inc a 
      008848 1A A3            [ 1]   86 	and a,#RX_QUEUE_SIZE-1
      00884A B6 00 24         [ 1]   87 	ld rx1_tail,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      00884D 0C               [11]   88 5$:	iret 
                                     89 
                                     90 ;---------------------------------------------
                                     91 ; initialize UART1, 115200 8N1
                                     92 ; input:
                                     93 ;	none
                                     94 ; output:
                                     95 ;   none
                                     96 ;---------------------------------------------
      0008FF                         97 uart1_init:
      00884E CD 87 5F CD      [ 1]   98     bset PA_DDR,#UART1_TX_PIN
      008852 16 68 72 17      [ 1]   99     bset PA_CR1,#UART1_TX_PIN 
      008856 50 5F 20 0A      [ 1]  100     bset PA_CR2,#UART1_TX_PIN 
                                    101 ; enable UART1 clock
      00885A 72 14 50 C7      [ 1]  102 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      00090F                        103 uart1_set_baud: 
      00885A CD               [ 1]  104 	push a 
                                    105 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    106 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      00885B 87 7A            [ 1]  107 	ld a,#CLK_SWR_HSI
      00885D CD 16 68         [ 1]  108 	cp a,CLK_CMSR 
      008860 72 13            [ 1]  109 	jreq 2$ 
      000917                        110 1$: ; 8 Mhz 	
      008862 50 5F 52 33      [ 1]  111 	mov UART1_BRR2,#0x05 ; must be loaded first
      008864 35 04 52 32      [ 1]  112 	mov UART1_BRR1,#0x4
      008864 85 81            [ 2]  113 	jra 3$
      008866                        114 2$: ; 16 Mhz 	
      008866 90 89 52 02      [ 1]  115 	mov UART1_BRR2,#0x0b ; must be loaded first
      00886A 6B 01 0F 02      [ 1]  116 	mov UART1_BRR1,#0x08
      000929                        117 3$:
      00886E 90 CE 00 1A      [ 1]  118     clr UART1_DR
      008872 72 5D 00 19      [ 1]  119 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008876 26 14 90 A3      [ 1]  120 	bset UART1_CR2,#UART_CR2_SBK
      00887A B6 00 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
      00887F A3 40 00 25      [ 1]  122     clr rx1_head 
      008883 57 90 A3 48      [ 1]  123 	clr rx1_tail
      008887 7F               [ 1]  124 	pop a  
      008888 22               [ 4]  125 	ret
                                    126 
                                    127 ;---------------------------------
                                    128 ; uart1_putc
                                    129 ; send a character via UART1
                                    130 ; input:
                                    131 ;    A  	character to send
                                    132 ;---------------------------------
      000944                        133 putc:: ; console output always on UART1
      000944                        134 uart1_putc:: 
      008889 51 20 16 30 FB   [ 2]  135 	btjf UART1_SR,#UART_SR_TXE,.
      00888C C7 52 31         [ 1]  136 	ld UART1_DR,a 
      00888C CD               [ 4]  137 	ret 
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
      00094D                        148 qgetc::
      00094D                        149 uart1_qgetc::
      00888D 87 7A 9B         [ 1]  150 	ld a,rx1_head 
      008890 7B 01 92         [ 1]  151 	sub a,rx1_tail 
      008893 A7               [ 4]  152 	ret 
                                    153 
                                    154 ;---------------------------------
                                    155 ; wait character from UART1 
                                    156 ; input:
                                    157 ;   none
                                    158 ; output:
                                    159 ;   A 			char  
                                    160 ;--------------------------------	
      000954                        161 getc:: ;console input
      000954                        162 uart1_getc::
      008894 00 19 72         [ 4]  163 	call uart1_qgetc
      008897 05 50            [ 1]  164 	jreq uart1_getc 
      008899 5F               [ 2]  165 	pushw x 
                                    166 ;; rx1_queue must be in page 0 	
      00889A FB 9A            [ 1]  167 	ld a,#rx1_queue
      00889C 72 13 50         [ 1]  168 	add a,rx1_head 
      00889F 5F               [ 1]  169 	clrw x  
      0088A0 20               [ 1]  170 	ld xl,a 
      0088A1 39               [ 1]  171 	ld a,(x)
      0088A2 88               [ 1]  172 	push a
      0088A2 CD 87 5F         [ 1]  173 	ld a,rx1_head 
      0088A5 90               [ 1]  174 	inc a 
      0088A6 A3 48            [ 1]  175 	and a,#RX_QUEUE_SIZE-1
      0088A8 00 2B 08         [ 1]  176 	ld rx1_head,a 
      0088AB 90               [ 1]  177 	pop a  
      0088AC A3               [ 2]  178 	popw x
      0088AD 48               [ 4]  179 	ret 
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
      0088AE 80 2A 02 03 02 82 46   194 convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0
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
      0088B3                        207 get_escape:
      0088B3 0D 02 27         [ 4]  208     call getc 
      0088B6 08 72            [ 1]  209     cp a,#'[ ; this character is expected after ESC 
      0088B8 1E 50            [ 1]  210     jreq 1$
      0088BA 5B               [ 1]  211     clr a
      0088BB 72               [ 4]  212     ret
      0088BC 1F 50 5C         [ 4]  213 1$: call getc 
      0088BF AE 09 6F         [ 2]  214     ldw x,#convert_table
      00098A                        215 2$:
      0088BF 7B               [ 1]  216     cp a,(x)
      0088C0 01 92            [ 1]  217     jreq 4$
      0088C2 A7 00 19         [ 2]  218     addw x,#2
      0088C5 0D               [ 1]  219     tnz (x)
      0088C6 02 27            [ 1]  220     jrne 2$
      0088C8 08               [ 1]  221     clr a
      0088C9 5C               [ 4]  222     ret 
      0088CA 7B               [ 1]  223 4$: incw x 
      0088CB 01               [ 1]  224     ld a,(x)
      0088CC 43 92            [ 1]  225     cp a,#SUP
      0088CE A7 00            [ 1]  226     jrne 5$
      0088D0 19               [ 1]  227     push a 
      0088D1 72 05 50         [ 4]  228     call getc
      0088D4 5F               [ 1]  229     pop a 
      0009A0                        230 5$:
      0088D5 FB               [ 4]  231     ret 
                                    232 
                                    233 
                                    234 ;-----------------------------
                                    235 ; send an ASCIZ string to UART1 
                                    236 ; input: 
                                    237 ;   x 		char * 
                                    238 ; output:
                                    239 ;   none 
                                    240 ;-------------------------------
      0009A1                        241 puts::
      0088D6 72               [ 1]  242     ld a,(x)
      0088D7 0D 50            [ 1]  243 	jreq 1$
      0088D9 5F FB 44         [ 4]  244 	call putc 
      0088DB 5C               [ 1]  245 	incw x 
      0088DB 5B 02            [ 2]  246 	jra puts 
      0088DD 90               [ 4]  247 1$:	ret 
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
      0009AB                        258 bksp:
      0088DE 85 81            [ 1]  259 	ld a,#BS 
      0088E0 CD 09 44         [ 4]  260 	call putc 
      0088E0 88 52            [ 1]  261 	ld a,#SPACE 
      0088E2 02 1F 01         [ 4]  262 	call putc 
      0088E5 1E 06            [ 1]  263 	ld a,#BS 
      0088E7 27 13 1E         [ 4]  264 	call putc 
      0088EA 01               [ 4]  265 	ret 
                                    266 ;---------------------------
                                    267 ; delete n character left of cursor 
                                    268 ; at terminal.
                                    269 ; input: 
                                    270 ;   A   number of characters to delete.
                                    271 ; output:
                                    272 ;    none 
                                    273 ;--------------------------	
      0009BB                        274 delete_nchar:
      0088EB 90               [ 1]  275 	push a 
      0088EC F6 CD            [ 1]  276 0$:	tnz (1,sp)
      0088EE 88 66            [ 1]  277 	jreq 1$
      0088F0 5C 90 5C         [ 4]  278 	call bksp 
      0088F3 1F 01            [ 1]  279 	dec (1,sp)
      0088F5 1E 06            [ 2]  280 	jra 0$
      0088F7 5A               [ 1]  281 1$:	pop a 
      0088F8 1F               [ 4]  282 	ret
                                    283 
                                    284 ;--------------------------
                                    285 ; send ANSI escape sequence
                                    286 ; ANSI: ESC[
                                    287 ; note: ESC is ASCII 27
                                    288 ;       [   is ASCII 91  
                                    289 ;-------------------------- 
      0009C9                        290 send_escape:
      0088F9 06 26            [ 1]  291 	ld a,#ESC 
      0088FB ED 09 44         [ 4]  292 	call putc 
      0088FC A6 5B            [ 1]  293 	ld a,#'[
      0088FC 1E 01 CD         [ 4]  294 	call putc 
      0088FF 89               [ 4]  295 	ret 
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
      0009D4                        311 send_parameter:
      008900 36               [ 2]  312 	pushw x 
      008901 5B               [ 1]  313 	clrw x 
      008902 02               [ 1]  314 	ld xl,a 
      008903 84 81            [ 1]  315 	ld a,#10 
      008905 62               [ 2]  316 	div x,a 
      008905 90               [ 1]  317 	ld xh,a 
      008906 89               [ 1]  318 	ld a,xl
      008907 88               [ 1]  319     tnz a 
      008908 90 93            [ 1]  320     jreq 2$
      00890A 5F 09            [ 1]  321 	cp a,#9 
      00890B 23 02            [ 2]  322 	jrule 1$
      00890B 90 F6            [ 1]  323 	ld a,#'9
      0009E5                        324 1$:
      00890D 90 5C            [ 1]  325 	add a,#'0 
      00890F CD 88 66         [ 4]  326 	call putc
      008912 5C               [ 1]  327 2$:	ld a,xh 
      008913 0A 01            [ 1]  328 	add a,#'0
      008915 26 F4 84         [ 4]  329 	call putc 
      008918 90               [ 2]  330 	popw x 
      008919 85               [ 4]  331 	ret 
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
      0009F2                        344 move_left:
      00891A 81               [ 1]  345 	push a 
      00891B CD 09 C9         [ 4]  346 	call send_escape
      00891B A6               [ 1]  347     pop a
      00891C 7F C4 00         [ 4]  348 	call send_parameter 
      00891F 1B 27            [ 1]  349 	ld a,#'D 
      008921 13 CE 00         [ 4]  350 	call putc 
      008924 1A               [ 4]  351 	ret	
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



      000A00                        362 move_right:
      008925 1C               [ 1]  363 	push a 
      008926 00 80 24         [ 4]  364 	call send_escape
      008929 04               [ 1]  365     pop a
      00892A 72 5C 00         [ 4]  366 	call send_parameter 
      00892D 19 9F            [ 1]  367 	ld a,#'C 
      00892F A4 80 97         [ 4]  368 	call putc 
      008932 CF               [ 4]  369 	ret 
                                    370 
                                    371 
                                    372 ;--------------------------
                                    373 ; print n spaces on terminal
                                    374 ; input:
                                    375 ;  X 		number of spaces 
                                    376 ; output:
                                    377 ;	none 
                                    378 ;---------------------------
      000A0E                        379 spaces::
      008933 00 1A            [ 1]  380 	ld a,#SPACE 
      008935 81               [ 2]  381 1$:	tnzw x
      008936 27 06            [ 1]  382 	jreq 9$
      008936 72 BB 00         [ 4]  383 	call putc 
      008939 1A               [ 2]  384 	decw x
      00893A 24 04            [ 2]  385 	jra 1$
      000A19                        386 9$: 
      00893C 72               [ 4]  387 	ret 
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
                                    398 ;   Y       updated Y 
                                    399 ;-------------------------
                           000001   400 	IPOS=1
                           000002   401 	KCHAR=2 
                           000003   402     LLEN=3 
                           000003   403 	VSISE=3 
      000A1A                        404 insert_char: 
      000A1A                        405 	_vars VSIZE 
      00893D 5C 00            [ 2]    1     sub sp,#VSIZE 
      00893F 19 CF            [ 1]  406     ld (KCHAR,sp),a 
      008941 00               [ 1]  407     ld a,xh 
      008942 1A 81            [ 1]  408 	ld (IPOS,sp),a
      008944 9F               [ 1]  409     ld a,xl 
      008944 5F 92            [ 1]  410     ld (LLEN,sp),a  
      008946 AF               [ 1]  411     ldw x,y
      008947 00               [ 1]  412     incw x 
      008948 19 26            [ 1]  413     ld a,(LLEN,sp)
      00894A 06 5C            [ 1]  414     sub a,(IPOS,sp)
      00894C A3               [ 1]  415     inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00894D 00 80 25         [ 1]  416     ld acc8,a 
      008950 F4 81 00 0D      [ 1]  417     clr acc16
      008952 CD 13 FF         [ 4]  418     call move
      008952 72 0B 52 30      [ 2]  419     ldw y,#tib 
      008956 27 C6            [ 1]  420     ld a,(IPOS,sp)
      008958 52 31 A1         [ 1]  421     ld acc8,a 
      00895B 03 26 06 CD      [ 2]  422     addw y,acc16 
      00895F 89 C4            [ 1]  423     ld a,(KCHAR,sp)
      008961 CC 80            [ 1]  424     ld (y),a
      008963 D7 5C            [ 1]  425     incw y  
      008964 7B 01            [ 1]  426     ld a,(IPOS,sp)
      008964 A1 18 26         [ 4]  427     call move_left
      008967 03 CC 81         [ 2]  428     ldw x,#tib 
      00896A 43 88 A6         [ 4]  429     call puts 
      00896D 27 CB            [ 1]  430     ld a,(LLEN,sp)
      00896F 00 30            [ 1]  431     sub a,(IPOS,sp) 
      008971 5F 97 84         [ 4]  432     call move_left 
      000A5A                        433 	_drop VSIZE 
      008974 F7 C6            [ 2]    1     addw sp,#VSIZE 
      008976 00               [ 4]  434 	ret 
                                    435 
                                    436 
                                    437 ;--------------------------
                                    438 ; delete character under cursor
                                    439 ; input:
                                    440 ;   A       line length   
                                    441 ;   xl      delete position
                                    442 ;   Y       line pointer 
                                    443 ;-------------------------
                           000001   444 	CPOS=1
                           000002   445 	LLEN=2
                           000002   446 	VSIZE=2
      000A5D                        447 delete_under:
      000A5D                        448 	_vars VSIZE 
      008977 30 4C            [ 2]    1     sub sp,#VSIZE 
      008979 A4 07            [ 1]  449     ld (LLEN,sp),a 
      00897B C7               [ 1]  450     ld a,xl 
      00897C 00 30            [ 1]  451     ld (CPOS,sp),a 
      00897E 80               [ 1]  452     ldw x,y ; move destination
      00897F 90 5C            [ 1]  453     incw y  ; move source 
      00897F 72 1A            [ 1]  454     ld a,(LLEN,sp)
      008981 50 02            [ 1]  455     sub a,(CPOS,sp)
      008983 72               [ 1]  456     inc a ; move including zero at end.
      008984 1A 50 03         [ 1]  457     ld acc8,a 
      008987 72 1A 50 04      [ 1]  458     clr acc16 
      00898B 72 14 50         [ 4]  459 	call move 
      00898E C7 AE 16 68      [ 2]  460     ldw y,#tib 
      00898F 7B 01            [ 1]  461     ld a,(CPOS,sp)
      00898F 88 A6 E1         [ 1]  462     ld acc8,a 
      008992 C1 50 C3 27      [ 2]  463     addw y,acc16 
      008996 0A               [ 1]  464     ldw x,y 
      008997 CD 09 A1         [ 4]  465     call puts 
      008997 35 05            [ 1]  466     ld a,#SPACE  
      008999 52 33 35         [ 4]  467     call putc
      00899C 04 52            [ 1]  468     ld a,(LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      00899E 32 20            [ 1]  469     sub a,(CPOS,sp)
      0089A0 08 09 F2         [ 4]  470     call move_left 
      0089A1 0A 02            [ 1]  471     dec (LLEN,sp)
      000A95                        472 	_drop VSIZE 
      0089A1 35 0B            [ 2]    1     addw sp,#VSIZE 
      0089A3 52               [ 4]  473 	ret 
                                    474 
                                    475 ;-----------------------------
                                    476 ; send ANSI sequence to delete
                                    477 ; whole line. Cursor position
                                    478 ; is not updated.
                                    479 ; ANSI: ESC[2K
                                    480 ; input:
                                    481 ;   none
                                    482 ; output:
                                    483 ;   none 
                                    484 ;-----------------------------
      000A98                        485 delete_line:
      0089A4 33 35 08         [ 4]  486     call send_escape
      0089A7 52 32            [ 1]  487 	ld a,#'2
      0089A9 CD 09 44         [ 4]  488 	call putc 
      0089A9 72 5F            [ 1]  489 	ld a,#'K 
      0089AB 52 31 35         [ 4]  490 	call putc 
      0089AE 2C               [ 4]  491 	ret 
                                    492 
                                    493 
                                    494 
                                    495 ;------------------------------------
                                    496 ; read a line of text from terminal
                                    497 ;  touches de contrôle
                                    498 ;    BS   efface caractère à gauche 
                                    499 ;    ln+CTRL_E  edit ligne# 'ln' 
                                    500 ;    CTRL_R  répète dernière ligne saisie
                                    501 ;    CTRL_D  supprime ligne 
                                    502 ;    HOME  va au début de la ligne 
                                    503 ;    KEY_END  va à la fin de la ligne 
                                    504 ;    ARROW_LEFT  un caractère vers la gauche 
                                    505 ;    ARROW_RIGHT  un caractère vers la droite 
                                    506 ;    CTRL_O  commute entre insert/overwrite
                                    507 ; input:
                                    508 ;	none
                                    509 ; local variable on stack:
                                    510 ;	LL  line length
                                    511 ;   RXCHAR last received character 
                                    512 ; output:
                                    513 ;   text in tib  buffer
                                    514 ;   count  line length 
                                    515 ;------------------------------------
                                    516 	; local variables
                           000001   517 	LL_HB=1
                           000001   518 	RXCHAR = 1 ; last char received
                           000002   519 	LL = 2  ; accepted line length
                           000003   520 	CPOS=3  ; cursor position 
                           000004   521 	OVRWR=4 ; overwrite flag 
                           000004   522 	VSIZE=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      000AA6                        523 readln::
      000AA6                        524 	_vars VSIZE 
      0089AF 52 35            [ 2]    1     sub sp,#VSIZE 
      0089B1 72               [ 1]  525 	clrw x 
      0089B2 10 52            [ 2]  526 	ldw (LL,sp),x 
      0089B4 35 72            [ 2]  527 	ldw (CPOS,sp),x 
      0089B6 0D 52            [ 1]  528 	cpl (OVRWR,sp) ; default to overwrite mode 
      0089B8 30 FB 72 5F      [ 2]  529  	ldw y,#tib ; input buffer
      000AB3                        530 readln_loop:
      0089BC 00 2F 72         [ 4]  531 	call getc
      0089BF 5F 00            [ 1]  532 	ld (RXCHAR,sp),a
      0089C1 30 84            [ 1]  533     cp a,#ESC 
      0089C3 81 05            [ 1]  534     jrne 0$
      0089C4 CD 09 7B         [ 4]  535     call get_escape 
      0089C4 6B 01            [ 1]  536     ld (RXCHAR,sp),a 
      0089C4 72 0F            [ 1]  537 0$:	cp a,#CR
      0089C6 52 30            [ 1]  538 	jrne 1$
      0089C8 FB C7 52         [ 2]  539 	jp readln_quit
      0089CB 31 81            [ 1]  540 1$:	cp a,#LF 
      0089CD 26 03            [ 1]  541 	jrne 2$ 
      0089CD CC 0C 4F         [ 2]  542 	jp readln_quit
      000ACF                        543 2$:
      0089CD C6 00            [ 1]  544 	cp a,#BS
      0089CF 2F C0            [ 1]  545 	jrne 3$
                                    546 ; delete left 
      0089D1 00 30            [ 1]  547     tnz (CPOS,sp)
      0089D3 81 DC            [ 1]  548     jreq readln_loop 
      0089D4 A6 01            [ 1]  549     ld a,#1 
      0089D4 CD 09 F2         [ 4]  550     call move_left
      0089D4 CD 89            [ 1]  551     dec (CPOS,sp)
      0089D6 CD 27            [ 2]  552     decw y 
      0089D8 FB 89            [ 1]  553     ld a,(CPOS,sp) 
      0089DA A6 27 CB         [ 2]  554     jp 12$
      000AE5                        555 3$:
      0089DD 00 2F            [ 1]  556 	cp a,#CTRL_D
      0089DF 5F 97            [ 1]  557 	jrne 4$
                                    558 ;delete line 
      0089E1 F6 88 C6         [ 4]  559 	call delete_line 
      0089E4 00 2F            [ 1]  560     ld a,(CPOS,sp)
      0089E6 4C               [ 1]  561     inc a 
      0089E7 A4 07 C7         [ 4]  562     call move_left 
      0089EA 00 2F            [ 1]  563 	ld a,#'> 
      0089EC 84 85 81         [ 4]  564 	call putc 
      0089EF 43 81 44 80      [ 2]  565 	ldw y,#tib
      0089F3 48 82            [ 1]  566 	clr (y)
      0089F5 46 83            [ 1]  567 	clr (LL,sp)
      0089F7 33 84            [ 1]  568 	clr (CPOS,sp)
      0089F9 00 00            [ 2]  569 	jra readln_loop
      0089FB                        570 4$:
      0089FB CD 89            [ 1]  571 	cp a,#CTRL_R 
      0089FD D4 A1            [ 1]  572 	jrne 5$
                                    573 ;reprint 
      0089FF 5B 27            [ 1]  574 	tnz (LL,sp)
      008A01 02 4F            [ 1]  575 	jrne readln_loop
      008A03 81 CD 89         [ 2]  576 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      008A06 D4 AE 89         [ 4]  577 	call strlen 
      008A09 EF AE 16 68      [ 2]  578 	ldw y,#tib 
      008A0A 27 9C            [ 1]  579 	jreq readln_loop
      008A0A F1 27            [ 1]  580 	ld (LL,sp),a 
      008A0C 08 1C            [ 1]  581     ld (CPOS,sp),a
      008A0E 00 02 7D         [ 2]  582 	ldw x,#tib 
      008A11 26 F7 4F         [ 4]  583 	call puts
      008A14 81 5C            [ 1]  584 	clr (LL_HB,sp)
      008A16 F6 A1 84         [ 2]  585 	addw y,(LL_HB,sp)
      008A19 26 05            [ 2]  586 	jra readln_loop 
      000B28                        587 5$:
      008A1B 88 CD            [ 1]  588 	cp a,#CTRL_E 
      008A1D 89 D4            [ 1]  589 	jrne 6$
                                    590 ;edit line number 
      008A1F 84 16 68         [ 2]  591 	ldw x,#tib 
      008A20 CD 18 87         [ 4]  592 	call atoi24
      008A20 81 00 0D         [ 2]  593 	ldw x,acc16
      008A21 CD 0C 89         [ 4]  594 	call search_lineno
      008A21 F6               [ 2]  595 	tnzw x 
      008A22 27 06            [ 1]  596 	jrne 51$
      008A24 CD 89            [ 1]  597 	clr (LL,sp)
      008A26 C4 5C 20 F7      [ 2]  598 	ldw y,#tib
      008A2A 81 7F            [ 1]  599     clr (y) 	
      008A2B CC 0C 4F         [ 2]  600 	jp readln_quit  
      000B46                        601 51$:
      008A2B A6 08 CD         [ 2]  602 	ldw basicptr,x
      008A2E 89 C4            [ 1]  603 	ld a,(2,x)
      008A30 A6 20 CD         [ 1]  604 	ld count,a 
      008A33 89 C4 A6 08      [ 2]  605 	ldw y,#tib 
      008A37 CD 89 C4         [ 4]  606 	call decompile 
      008A3A 81 01            [ 1]  607 	clr (LL_HB,sp)
      008A3B A6 0D            [ 1]  608 	ld a,#CR 
      008A3B 88 0D 01         [ 4]  609 	call putc 
      008A3E 27 07            [ 1]  610 	ld a,#'>
      008A40 CD 8A 2B         [ 4]  611 	call putc
      008A43 0A 01 20         [ 2]  612     ldw x,#tib  
      008A46 F5 84 81         [ 4]  613 	call strlen 
      008A49 6B 02            [ 1]  614 	ld (LL,sp),a 
      008A49 A6 1B CD         [ 4]  615 	call puts 
      008A4C 89 C4            [ 1]  616 	ldw y,x
      008A4E A6 5B            [ 1]  617     ld a,(LL,sp)
      008A50 CD 89            [ 1]  618     ld (CPOS,sp),a  
      008A52 C4 81 B3         [ 2]  619 	jp readln_loop
      008A54                        620 6$:
      008A54 89 5F            [ 1]  621 	cp a,#ARROW_RIGHT
      008A56 97 A6            [ 1]  622    	jrne 7$ 
                                    623 ; right arrow
      008A58 0A 62            [ 1]  624 	ld a,(CPOS,sp)
      008A5A 95 9F            [ 1]  625     cp a,(LL,sp)
      008A5C 4D 27            [ 1]  626     jrmi 61$
      008A5E 0B A1 09         [ 2]  627     jp readln_loop 
      000B82                        628 61$:
      008A61 23 02            [ 1]  629     ld a,#1 
      008A63 A6 39 00         [ 4]  630 	call move_right 
      008A65 0C 03            [ 1]  631 	inc (CPOS,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      008A65 AB 30            [ 1]  632     incw y 
      008A67 CD 89 C4         [ 2]  633     jp readln_loop 
      008A6A 9E AB            [ 1]  634 7$: cp a,#ARROW_LEFT  
      008A6C 30 CD            [ 1]  635 	jrne 8$
                                    636 ; left arrow 
      008A6E 89 C4            [ 1]  637 	tnz (CPOS,sp)
      008A70 85 81            [ 1]  638 	jrne 71$
      008A72 CC 0A B3         [ 2]  639 	jp readln_loop
      000B99                        640 71$:
      008A72 88 CD            [ 1]  641     ld a,#1 
      008A74 8A 49 84         [ 4]  642 	call move_left 
      008A77 CD 8A            [ 1]  643 	dec (CPOS,sp)
      008A79 54 A6            [ 2]  644     decw y 
      008A7B 44 CD 89         [ 2]  645 	jp readln_loop 
      008A7E C4 81            [ 1]  646 8$: cp a,#HOME  
      008A80 26 0E            [ 1]  647 	jrne 9$
                                    648 ; HOME 
      008A80 88 CD            [ 1]  649     ld a,(CPOS,sp)
      008A82 8A 49 84         [ 4]  650     call move_left 
      008A85 CD 8A            [ 1]  651 	clr (CPOS,sp)
      008A87 54 A6 43 CD      [ 2]  652     ldw y,#tib 
      008A8B 89 C4 81         [ 2]  653 	jp readln_loop  
      008A8E A1 83            [ 1]  654 9$: cp a,#KEY_END  
      008A8E A6 20            [ 1]  655 	jrne 10$
                                    656 ; KEY_END 
      008A90 5D 27            [ 1]  657 	ld a,(CPOS,sp)
      008A92 06 CD            [ 1]  658 	cp a,(LL,sp)
      008A94 89 C4            [ 1]  659 	jrne 91$
      008A96 5A 20 F7         [ 2]  660 	jp readln_loop 
      008A99                        661 91$:
      008A99 81 02            [ 1]  662 	ld a,(LL,sp)
      008A9A 10 03            [ 1]  663 	sub a,(CPOS,sp)
      008A9A 52 02 6B         [ 4]  664 	call move_right 
      008A9D 02 9E            [ 1]  665 	ld a,(LL,sp)
      008A9F 6B 01            [ 1]  666 	ld (CPOS,sp),a
      008AA1 9F 6B 03 93      [ 2]  667     ldw y,#tib
      008AA5 5C 7B 03 10      [ 1]  668     clr acc16 
      008AA9 01 4C C7         [ 1]  669     ld acc8,a 
      008AAC 00 0F 72 5F      [ 2]  670     addw y,acc16  
      008AB0 00 0E CD         [ 2]  671 	jp readln_loop 
      008AB3 94 7F            [ 1]  672 10$: cp a,#CTRL_O
      008AB5 90 AE            [ 1]  673 	jrne 11$ 
                                    674 ; toggle between insert/overwrite
      008AB7 16 68            [ 1]  675 	cpl (OVRWR,sp)
      008AB9 7B 01            [ 2]  676 	pushw y 
      008ABB C7 00 0F         [ 4]  677 	call beep_1khz
      008ABE 72 B9            [ 2]  678 	popw y 
      008AC0 00 0E 7B         [ 2]  679 	jp readln_loop 
      008AC3 02 90            [ 1]  680 11$: cp a,#SUP 
      008AC5 F7 90            [ 1]  681     jrne final_test 
                                    682 ; del character under cursor 
      008AC7 5C 7B            [ 1]  683     ld a,(CPOS,sp)
      008AC9 01 CD            [ 1]  684     cp a,(LL,sp)
      008ACB 8A 72            [ 1]  685     jrpl 13$
      000BFB                        686 12$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      008ACD AE               [ 1]  687     ld xl,a    ; cursor position 
      008ACE 16 68            [ 1]  688     ld a,(LL,sp)  ; line length
      008AD0 CD 8A 21         [ 4]  689     call delete_under
      008AD3 7B 03            [ 1]  690     dec (LLEN,sp)
      000C03                        691 13$:
      008AD5 10 01 CD         [ 2]  692     jp readln_loop 
      000C06                        693 final_test:
      008AD8 8A 72            [ 1]  694 	cp a,#SPACE
      008ADA 5B 02            [ 1]  695 	jrpl accept_char
      008ADC 81 0A B3         [ 2]  696 	jp readln_loop
      008ADD                        697 accept_char:
      008ADD 52 02            [ 1]  698 	ld a,#TIB_SIZE-1
      008ADF 6B 02            [ 1]  699 	cp a, (LL,sp)
      008AE1 9F 6B            [ 1]  700 	jrpl 1$
      008AE3 01 93 90         [ 2]  701 	jp readln_loop
      008AE6 5C 7B            [ 1]  702 1$:	tnz (OVRWR,sp)
      008AE8 02 10            [ 1]  703 	jrne overwrite
                                    704 ; insert mode 
      008AEA 01 4C            [ 1]  705     ld a,(CPOS,sp)
      008AEC C7 00            [ 1]  706     cp a,(LL,sp)
      008AEE 0F 72            [ 1]  707     jreq overwrite
      008AF0 5F 00            [ 1]  708     ld a,(LL,sp)
      008AF2 0E               [ 1]  709     ld xl,a 
      008AF3 CD 94            [ 1]  710     ld a,(CPOS,sp)
      008AF5 7F               [ 1]  711     ld xh,a
      008AF6 90 AE            [ 1]  712     ld a,(RXCHAR,sp)
      008AF8 16 68 7B         [ 4]  713     call insert_char
      008AFB 01 C7            [ 1]  714     inc (LLEN,sp)
      008AFD 00 0F            [ 1]  715     inc (CPOS,sp)
      008AFF 72 B9 00         [ 2]  716     jp readln_loop 
      000C32                        717 overwrite:
      008B02 0E 93            [ 1]  718 	ld a,(RXCHAR,sp)
      008B04 CD 8A            [ 1]  719 	ld (y),a
      008B06 21 A6            [ 1]  720     incw y
      008B08 20 CD 89         [ 4]  721     call putc 
      008B0B C4 7B            [ 1]  722 	ld a,(CPOS,sp)
      008B0D 02 10            [ 1]  723 	cp a,(LL,sp)
      008B0F 01 CD            [ 1]  724 	jrmi 1$
      008B11 8A 72            [ 1]  725 	clr (y)
      008B13 0A 02            [ 1]  726 	inc (LL,sp)
      008B15 5B 02            [ 1]  727     inc (CPOS,sp)
      008B17 81 0A B3         [ 2]  728 	jp readln_loop 
      008B18                        729 1$:	
      008B18 CD 8A            [ 1]  730 	inc (CPOS,sp)
      008B1A 49 A6 32         [ 2]  731 	jp readln_loop 
      000C4F                        732 readln_quit:
      008B1D CD 89 C4 A6      [ 2]  733 	ldw y,#tib
      008B21 4B CD            [ 1]  734     clr (LL_HB,sp) 
      008B23 89 C4 81         [ 2]  735     addw y,(LL_HB,sp)
      008B26 90 7F            [ 1]  736     clr (y)
      008B26 52 04            [ 1]  737 	ld a,(LL,sp)
      008B28 5F 1F 02         [ 1]  738 	ld count,a 
      008B2B 1F 03            [ 1]  739 	ld a,#CR
      008B2D 03 04 90         [ 4]  740 	call putc
      000C64                        741 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      008B30 AE 16            [ 2]    1     addw sp,#VSIZE 
      008B32 68               [ 4]  742 	ret
                                    743 
                                    744 ;------------------------------
                                    745 ; print byte  in hexadecimal 
                                    746 ; on console
                                    747 ; input:
                                    748 ;    A		byte to print
                                    749 ;------------------------------
      008B33                        750 print_hex::
      008B33 CD               [ 1]  751 	push a 
      008B34 89               [ 1]  752 	swap a 
      008B35 D4 6B 01         [ 4]  753 	call to_hex_char 
      008B38 A1 1B 26         [ 4]  754 	call putc 
      008B3B 05 CD            [ 1]  755     ld a,(1,sp) 
      008B3D 89 FB 6B         [ 4]  756 	call to_hex_char
      008B40 01 A1 0D         [ 4]  757 	call putc
      008B43 26 03            [ 1]  758 	ld a,#SPACE 
      008B45 CC 8C CF         [ 4]  759 	call putc 
      008B48 A1               [ 1]  760 	pop a 
      008B49 0A               [ 4]  761 	ret 
                                    762 
                                    763 ;----------------------------------
                                    764 ; convert to hexadecimal digit 
                                    765 ; input:
                                    766 ;   A       digit to convert 
                                    767 ; output:
                                    768 ;   A       hexdecimal character 
                                    769 ;----------------------------------
      000C7E                        770 to_hex_char::
      008B4A 26 03            [ 1]  771 	and a,#15 
      008B4C CC 8C            [ 1]  772 	cp a,#9 
      008B4E CF 02            [ 2]  773 	jrule 1$ 
      008B4F AB 07            [ 1]  774 	add a,#7
      008B4F A1 08            [ 1]  775 1$: add a,#'0 
      008B51 26               [ 4]  776 	ret 
                                    777 
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
      000C89                         51 search_lineno::
      000C89                         52 	_vars VSIZE
      008B52 12 0D            [ 2]    1     sub sp,#VSIZE 
      008B54 03 27            [ 1]   53 	clr (LL,sp)
      008B56 DC A6 01 CD      [ 2]   54 	ldw y,txtbgn
      008B5A 8A               [ 1]   55 	tnz a 
      008B5B 72 0A            [ 1]   56 	jreq search_ln_loop
      008B5D 03 90 5A 7B      [ 2]   57 	ldw y,basicptr 
      000C98                         58 search_ln_loop:
      008B61 03 CC 8C 7B      [ 2]   59 	cpw y,txtend 
      008B65 2A 10            [ 1]   60 	jrpl 8$
      008B65 A1 04            [ 1]   61 	cpw x,(y)
      008B67 26 1A            [ 1]   62 	jreq 9$
      008B69 CD 8B            [ 1]   63 	jrmi 8$ 
      008B6B 18 7B 03         [ 1]   64 	ld a,(2,y)
      008B6E 4C CD            [ 1]   65 	ld (LB,sp),a 
      008B70 8A 72 A6         [ 2]   66 	addw y,(LL,sp)
      008B73 3E CD            [ 2]   67 	jra search_ln_loop 
      000CAE                         68 8$: 
      008B75 89               [ 1]   69 	clrw x 	
      008B76 C4               [ 1]   70 	exgw x,y 
      000CB0                         71 9$: _drop VSIZE
      008B77 90 AE            [ 2]    1     addw sp,#VSIZE 
      008B79 16               [ 1]   72 	exgw x,y   
      008B7A 68               [ 4]   73 	ret 
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
      000CB4                         83 del_line: 
      000CB4                         84 	_vars VSIZE 
      008B7B 90 7F            [ 2]    1     sub sp,#VSIZE 
      008B7D 0F 02            [ 1]   85 	ld a,(2,x) ; line length
      008B7F 0F 03            [ 1]   86 	ld (LLEN+1,sp),a 
      008B81 20 B0            [ 1]   87 	clr (LLEN,sp)
      008B83 90 93            [ 1]   88 	ldw y,x  
      008B83 A1 12 26         [ 2]   89 	addw y,(LLEN,sp) ;SRC  
      008B86 21 0D            [ 2]   90 	ldw (SRC,sp),y  ;save source 
      008B88 02 26 A8 AE      [ 2]   91 	ldw y,txtend 
      008B8C 16 68 CD         [ 2]   92 	subw y,(SRC,sp) ; y=count 
      008B8F 94 53 90 AE      [ 2]   93 	ldw acc16,y 
      008B93 16 68            [ 2]   94 	ldw y,(SRC,sp)    ; source
      008B95 27 9C 6B         [ 4]   95 	call move
      008B98 02 6B 03 AE      [ 2]   96 	ldw y,txtend 
      008B9C 16 68 CD         [ 2]   97 	subw y,(LLEN,sp)
      008B9F 8A 21 0F 01      [ 2]   98 	ldw txtend,y  
      000CDE                         99 	_drop VSIZE     
      008BA3 72 F9            [ 2]    1     addw sp,#VSIZE 
      008BA5 01               [ 4]  100 	ret 
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
      000CE1                        115 create_gap:
      000CE1                        116 	_vars VSIZE
      008BA6 20 8B            [ 2]    1     sub sp,#VSIZE 
      008BA8 1F 03            [ 2]  117 	ldw (SRC,sp),x 
      008BA8 A1 05            [ 2]  118 	ldw (LEN,sp),y 
      008BAA 26 49 AE 16      [ 2]  119 	ldw acc16,y 
      008BAE 68 CD            [ 1]  120 	ldw y,x ; SRC
      008BB0 99 07 CE 00      [ 2]  121 	addw x,acc16  
      008BB4 0E CD            [ 2]  122 	ldw (DEST,sp),x 
                                    123 ;compute size to move 	
      008BB6 8D 09 5D         [ 2]  124 	ldw x,txtend 
      008BB9 26 0B 0F         [ 2]  125 	subw x,(SRC,sp)
      008BBC 02 90 AE         [ 2]  126 	ldw acc16,x ; size to move
      008BBF 16 68            [ 2]  127 	ldw x,(DEST,sp) 
      008BC1 90 7F CC         [ 4]  128 	call move
      008BC4 8C CF 1D         [ 2]  129 	ldw x,txtend
      008BC6 72 FB 05         [ 2]  130 	addw x,(LEN,sp)
      008BC6 CF 00 05         [ 2]  131 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      000D0A                        132 9$:	_drop VSIZE 
      008BC9 E6 02            [ 2]    1     addw sp,#VSIZE 
      008BCB C7               [ 4]  133 	ret 
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
      000D0D                        150 insert_line:
      000D0D                        151 	_vars VSIZE 
      008BCC 00 04            [ 2]    1     sub sp,#VSIZE 
      008BCE 90 AE 16         [ 2]  152 	ldw x,txtend  
      008BD1 68 CD 92         [ 2]  153 	cpw x,txtbgn 
      008BD4 77 0F            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BD6 01 A6 0D         [ 2]  156 	ldw x,#2 
      008BD9 CD 89 C4 A6      [ 4]  157 	ld a,([ptr16],x)
      008BDD 3E CD            [ 1]  158 	cp a,#3
      008BDF 89 C4            [ 1]  159 	jreq insert_ln_exit
      008BE1 AE               [ 1]  160 	clrw x 
      008BE2 16               [ 1]  161 	ld xl,a
      008BE3 68 CD            [ 2]  162 	ldw (LLEN,sp),x 
      008BE5 94 53 6B         [ 2]  163 	ldw x,txtbgn
      008BE8 02 CD            [ 2]  164 	ldw (DEST,sp),x 
      008BEA 8A 21 90         [ 2]  165 	ldw x,txtend 
      008BED 93 7B            [ 2]  166 	jra 4$
      008BEF 02 6B 03 CC      [ 5]  167 0$:	ldw x,[ptr16]
                                    168 ; line number
      008BF3 8B 33            [ 2]  169 	ldw (LINENO,sp),x 
      008BF5 AE 00 02         [ 2]  170 	ldw x,#2 
      008BF5 A1 81 26 15      [ 4]  171 	ld a,([ptr16],x)
      008BF9 7B               [ 1]  172 	ld xl,a
                                    173 ; line length
      008BFA 03 11            [ 2]  174 	ldw (LLEN,sp),x
                                    175 ; check if that line number already exit 	
      008BFC 02 2B            [ 2]  176 	ldw x,(LINENO,sp)
      008BFE 03               [ 1]  177 	clr a 
      008BFF CC 8B 33         [ 4]  178 	call search_lineno 
      008C02 5D               [ 2]  179 	tnzw x 
      008C02 A6 01            [ 1]  180 	jrne 2$
                                    181 ; line doesn't exit
                                    182 ; it will be inserted at this point.  	
      008C04 CD 8A            [ 2]  183 	ldw (DEST,sp),y 
      008C06 80 0C            [ 2]  184 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                    185 ; line exit delete it.
                                    186 ; it will be replaced by new one 	
      008C08 03 90            [ 2]  187 2$: ldw (DEST,sp),x 
      008C0A 5C CC 8B         [ 4]  188 	call del_line
      000D52                        189 3$: 
                                    190 ; insert new line or leave if LLEN==3
                                    191 ; LLEN==3 means empty line 
      008C0D 33 A1            [ 1]  192 	ld a,#3
      008C0F 80 26            [ 1]  193 	cp a,(LLEN+1,sp)
      008C11 13 0D            [ 1]  194 	jreq insert_ln_exit ; empty line exit.
                                    195 ; if insertion point at txtend 
                                    196 ; move no need to create a gap 
      008C13 03 26            [ 2]  197 	ldw x,(DEST,sp)
      008C15 03 CC 8B         [ 2]  198 	cpw x,txtend 
      008C18 33 09            [ 1]  199 	jreq 4$ 
                                    200 ; must create a gap
                                    201 ; at insertion point  
      008C19 1E 01            [ 2]  202 	ldw x,(DEST,sp)
      008C19 A6 01            [ 2]  203 	ldw y,(LLEN,sp)
      008C1B CD 8A 72         [ 4]  204 	call create_gap
      008C1E 0A 03            [ 2]  205 	jra 5$
      000D68                        206 4$: 
      008C20 90 5A CC         [ 2]  207 	addw x,(LLEN,sp)
      008C23 8B 33 A1         [ 2]  208 	ldw txtend,x 	 
                                    209 ; move new line in gap 
      008C26 82 26            [ 2]  210 5$:	ldw x,(LLEN,sp)
      008C28 0E 7B 03         [ 2]  211 	ldw acc16,x 
      008C2B CD 8A 72 0F      [ 2]  212 	ldw y,#pad ;SRC 
      008C2F 03 90            [ 2]  213 	ldw x,(DEST,sp) ; dest address 
      008C31 AE 16 68         [ 4]  214 	call move 
      000D7C                        215 insert_ln_exit:	
      000D7C                        216 	_drop VSIZE
      008C34 CC 8B            [ 2]    1     addw sp,#VSIZE 
      008C36 33               [ 4]  217 	ret
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
      000D7F                        233 parse_quote: 
      000D7F                        234 	_vars VSIZE 
      008C37 A1 83            [ 2]    1     sub sp,#VSIZE 
      008C39 26               [ 1]  235 	clr a
      008C3A 26 7B            [ 1]  236 1$:	ld (PREV,sp),a 
      000D84                        237 2$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      008C3C 03 11 02         [ 4]  238 	ld a,([in.w],y)
      008C3F 26 03            [ 1]  239 	jreq 6$
      008C41 CC 8B 33 01      [ 1]  240 	inc in 
      008C44 6B 02            [ 1]  241 	ld (CURR,sp),a 
      008C44 7B 02            [ 1]  242 	ld a,#'\
      008C46 10 03            [ 1]  243 	cp a, (PREV,sp)
      008C48 CD 8A            [ 1]  244 	jrne 3$
      008C4A 80 7B            [ 1]  245 	clr (PREV,sp)
      008C4C 02 6B            [ 1]  246 	ld a,(CURR,sp)
      008C4E 03 90            [ 4]  247 	callr convert_escape
      008C50 AE               [ 1]  248 	ld (x),a 
      008C51 16               [ 1]  249 	incw x 
      008C52 68 72            [ 2]  250 	jra 2$
      000D9F                        251 3$:
      008C54 5F 00            [ 1]  252 	ld a,(CURR,sp)
      008C56 0E C7            [ 1]  253 	cp a,#'\'
      008C58 00 0F            [ 1]  254 	jreq 1$
      008C5A 72 B9            [ 1]  255 	cp a,#'"
      008C5C 00 0E            [ 1]  256 	jreq 6$ 
      008C5E CC               [ 1]  257 	ld (x),a 
      008C5F 8B               [ 1]  258 	incw x 
      008C60 33 A1            [ 2]  259 	jra 2$
      000DAD                        260 6$:
      008C62 0F               [ 1]  261 	clr (x)
      008C63 26               [ 1]  262 	incw x 
      008C64 0C 03            [ 1]  263 	ldw y,x 
      008C66 04               [ 1]  264 	clrw x 
      008C67 90 89            [ 1]  265 	ld a,#TK_QSTR  
      000DB4                        266 	_drop VSIZE
      008C69 CD A4            [ 2]    1     addw sp,#VSIZE 
      008C6B C2               [ 4]  267 	ret 
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
      000DB7                        278 convert_escape:
      008C6C 90               [ 2]  279 	pushw x 
      008C6D 85 CC 8B         [ 2]  280 	ldw x,#escaped 
      008C70 33               [ 1]  281 1$:	cp a,(x)
      008C71 A1 84            [ 1]  282 	jreq 2$
      008C73 26               [ 1]  283 	tnz (x)
      008C74 11 7B            [ 1]  284 	jreq 3$
      008C76 03               [ 1]  285 	incw x 
      008C77 11 02            [ 2]  286 	jra 1$
      008C79 2A 08 CC         [ 2]  287 2$: subw x,#escaped 
      008C7B 9F               [ 1]  288 	ld a,xl 
      008C7B 97 7B            [ 1]  289 	add a,#7
      008C7D 02               [ 2]  290 3$:	popw x 
      008C7E CD               [ 4]  291 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                    292 
      008C7F 8A DD 0A 02 76 66 72   293 escaped:: .asciz "abtnvfr"
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
      008C83                        310 parse_integer: ; { -- n }
      008C83 CC               [ 2]  311 	pushw x 	
      008C84 8B 33            [ 1]  312 	push #0 ; TCHAR
      008C86 4B 0A            [ 1]  313 	push #10 ; BASE=10
      008C86 A1 20            [ 1]  314 	cp a,#'$
      008C88 2A 03            [ 1]  315 	jrne 2$ 
      000DDD                        316     _drop #1
      008C8A CC 8B            [ 2]    1     addw sp,##1 
      008C8C 33 10            [ 1]  317 	push #16  ; BASE=16
      008C8D F7               [ 1]  318 2$:	ld (x),a 
      008C8D A6               [ 1]  319 	incw x 
      008C8E 4F 11 02         [ 4]  320 	ld a,([in.w],y)
      008C91 2A 03 CC 8B      [ 1]  321 	inc in 
      008C95 33 0D 04         [ 4]  322 	call to_upper 
      008C98 26 18            [ 1]  323 	ld (TCHAR,sp),a 
      008C9A 7B 03 11         [ 4]  324 	call is_digit 
      008C9D 02 27            [ 1]  325 	jrc 2$
      008C9F 12 7B            [ 1]  326 	ld a,#16 
      008CA1 02 97            [ 1]  327 	cp a,(BASE,sp)
      008CA3 7B 03            [ 1]  328 	jrne 3$ 
      008CA5 95 7B            [ 1]  329 	ld a,(TCHAR,sp)
      008CA7 01 CD            [ 1]  330 	cp a,#'A 
      008CA9 8A 9A            [ 1]  331 	jrmi 3$ 
      008CAB 0C 02            [ 1]  332 	cp a,#'G 
      008CAD 0C 03            [ 1]  333 	jrmi 2$ 
      008CAF CC 8B 33 01      [ 1]  334 3$: dec in 	
      008CB2 7F               [ 1]  335     clr (x)
      008CB2 7B 01            [ 2]  336 	ldw x,(XSAVE,sp)
      008CB4 90 F7 90         [ 4]  337 	call atoi24
      008CB7 5C CD            [ 1]  338 	ldw y,x
      008CB9 89 C4 7B         [ 1]  339 	ld a,acc24 
      008CBC 03 11            [ 1]  340 	ld (y),a 
      008CBE 02 2B 09 90      [ 2]  341 	addw y,#1  
      008CC2 7F 0C 02         [ 2]  342 	ldw x,acc16 
      008CC5 0C 03            [ 2]  343 	ldw (y),x 
      008CC7 CC 8B 33 02      [ 2]  344 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      008CCA A6 84            [ 1]  345 	ld a,#TK_INTGR
      000E24                        346 	_drop VSIZE  
      008CCA 0C 03            [ 2]    1     addw sp,#VSIZE 
      008CCC CC               [ 4]  347 	ret 	
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
      000E27                        364 parse_binary: ; { -- n }
      008CCD 8B 33            [ 1]  365 	push #0
      008CCF 4B 00            [ 1]  366 	push #0
      008CCF 90 AE            [ 1]  367 	push #0
      000E2D                        368 2$:	
      008CD1 16 68 0F         [ 4]  369 	ld a,([in.w],y)
      008CD4 01 72 F9 01      [ 1]  370 	inc in 
      008CD8 90 7F            [ 1]  371 	cp a,#'0 
      008CDA 7B 02            [ 1]  372 	jreq 3$
      008CDC C7 00            [ 1]  373 	cp a,#'1 
      008CDE 04 A6            [ 1]  374 	jreq 3$ 
      008CE0 0D CD            [ 2]  375 	jra bin_exit 
      008CE2 89 C4            [ 1]  376 3$: sub a,#'0 
      008CE4 5B               [ 1]  377 	rrc a
      008CE5 04 81            [ 1]  378 	rlc (BINARY+2,sp) 
      008CE7 09 02            [ 1]  379 	rlc (BINARY+1,sp)
      008CE7 88 4E            [ 1]  380 	rlc (BINARY,sp) 
      008CE9 CD 8C            [ 2]  381 	jra 2$  
      000E49                        382 bin_exit:
      008CEB FE CD 89 C4      [ 1]  383 	dec in 
      008CEF 7B 01            [ 1]  384 	ldw y,x
      008CF1 CD 8C            [ 1]  385 	ld a,(BINARY,sp)
      008CF3 FE CD 89         [ 1]  386 	ld acc24,a 
      008CF6 C4 A6            [ 2]  387 	ldw x,(BINARY+1,sp)
      008CF8 20 CD 89         [ 2]  388 	ldw acc16,x
      008CFB C4 84            [ 2]  389 	ldw (y),x 
      008CFD 81 A9 00 02      [ 2]  390 	addw y,#2  
      008CFE A6 84            [ 1]  391 	ld a,#TK_INTGR 	
      000E61                        392 	_drop VSIZE 
      008CFE A4 0F            [ 2]    1     addw sp,#VSIZE 
      008D00 A1               [ 4]  393 	ret
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
      000E64                        402 is_alpha::
      008D01 09 23            [ 1]  403 	cp a,#'A 
      008D03 02               [ 1]  404 	ccf 
      008D04 AB 07            [ 1]  405 	jrnc 9$ 
      008D06 AB 30            [ 1]  406 	cp a,#'Z+1 
      008D08 81 07            [ 1]  407 	jrc 9$ 
      008D09 A1 61            [ 1]  408 	cp a,#'a 
      008D09 52               [ 1]  409 	ccf 
      008D0A 02 0F            [ 1]  410 	jrnc 9$
      008D0C 01 90            [ 1]  411 	cp a,#'z+1
      008D0E CE               [ 4]  412 9$: ret 	
                                    413 
                                    414 ;------------------------------------
                                    415 ; check if character in {'0'..'9'}
                                    416 ; input:
                                    417 ;    A  character to test
                                    418 ; output:
                                    419 ;    Carry  0 not digit | 1 digit
                                    420 ;------------------------------------
      000E75                        421 is_digit::
      008D0F 00 1C            [ 1]  422 	cp a,#'0
      008D11 4D 27            [ 1]  423 	jrc 1$
      008D13 04 90            [ 1]  424     cp a,#'9+1
      008D15 CE               [ 1]  425 	ccf 
      008D16 00               [ 1]  426 1$:	ccf 
      008D17 05               [ 4]  427     ret
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
      008D18                        438 is_alnum::
      008D18 90 C3 00         [ 4]  439 	call is_digit
      008D1B 1E 2A            [ 1]  440 	jrc 1$ 
      008D1D 10 90 F3         [ 4]  441 	call is_alpha
      008D20 27               [ 4]  442 1$:	ret 
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



      000E87                        453 is_symbol_char: 
      008D21 0E 2B            [ 1]  454 	cp a,#'_ 
      008D23 0A 90            [ 1]  455 	jrne 1$
      008D25 E6               [ 1]  456 	scf 
      008D26 02 6B            [ 2]  457 	jra 9$ 
      008D28 02 72 F9         [ 4]  458 1$:	call is_alnum 
      008D2B 01               [ 4]  459 9$: ret 
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
      000E92                        473 parse_symbol:
      008D2C 20               [ 1]  474 	incw x ; keep space for TK_ID 
      000E93                        475 symb_loop: 
                                    476 ; symbol are converted to upper case 
      008D2D EA 18 7B         [ 4]  477 	call to_upper  
      008D2E F7               [ 1]  478 	ld (x), a 
      008D2E 5F               [ 1]  479 	incw x
      008D2F 51 5B 02         [ 4]  480 	ld a,([in.w],y)
      008D32 51 81 00 01      [ 1]  481 	inc in 
      008D34 CD 0E 87         [ 4]  482 	call is_symbol_char 
      008D34 52 04            [ 1]  483 	jrc symb_loop 
      008D36 E6               [ 1]  484 	clr (x)
      008D37 02 6B 02 0F      [ 1]  485 	dec in  
      008D3B 01               [ 4]  486 	ret 
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
                                    497 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC  
                                    498 ;   pad 	keyword|var_name  
                                    499 ;--------------------------  
                           000001   500 	XFIRST=1
                           000002   501 	VSIZE=2
      000EAA                        502 parse_keyword: 
      008D3C 90               [ 2]  503 	pushw x ; preserve *symbol 
      008D3D 93 72 F9         [ 4]  504 	call parse_symbol
      008D40 01 17            [ 2]  505 	ldw x,(XFIRST,sp) 
      008D42 03 90            [ 1]  506 	ld a,(2,x)
      008D44 CE 00            [ 1]  507 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                    508 ; one letter variable name 
      008D46 1E 72            [ 1]  509 	ld a,(1,x) 
      008D48 F2 03            [ 1]  510 	sub a,#'A 
      008D4A 90 CF 00         [ 2]  511 	ldw x,#3 
      008D4D 0E               [ 4]  512 	mul x,a 
      008D4E 16 03 CD         [ 2]  513 	addw x,#vars 
      008D51 94 7F            [ 1]  514 	ld a,#TK_VAR 
      008D53 90 CE            [ 2]  515 	jra 4$ 
      000EC3                        516 2$: ; check for keyword, otherwise syntax error.
      000EC3                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D55 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D58 F2 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D5A 90 CF            [ 1]  519 	incw y 
      008D5C 00 1E 5B         [ 4]  520 	call search_dict
      008D5F 04               [ 1]  521 	tnz a
      008D60 81 17            [ 1]  522 	jrne 4$ 
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D61 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008D61 52 06            [ 1]  526 	ld a,#TK_LABEL 
      008D63 1F 03            [ 1]  527 	ld (y),a 
      008D65 17 05            [ 1]  528 	incw y
      000ED8                        529 24$:	
      008D67 90 CF            [ 1]  530     ld a,(y)
      008D69 00 0E            [ 1]  531 	jreq 3$
      008D6B 90 93            [ 1]  532 	incw y 
      008D6D 72 BB            [ 2]  533 	jra 24$ 
      008D6F 00 0E            [ 1]  534 3$: incw y 
      008D71 1F 01            [ 1]  535 	ld a,#TK_LABEL 
      008D73 CE               [ 1]  536 	clrw x 	
      008D74 00 1E            [ 2]  537 	jra 5$ 
      000EE7                        538 4$:	
      008D76 72 F0            [ 2]  539 	ldw y,(XFIRST,sp)
      008D78 03 CF 00         [ 2]  540 	cpw x,#LET_IDX 
      008D7B 0E 1E            [ 1]  541 	jreq 5$  ; don't compile LET command 
      008D7D 01 CD            [ 1]  542 	ld (y),a 
      008D7F 94 7F            [ 1]  543 	incw y 
      008D81 CE 00            [ 2]  544 	ldw (y),x
      008D83 1E 72 FB 05      [ 2]  545 	addw y,#2  
      000EF8                        546 5$:	_drop VSIZE 
      008D87 CF 00            [ 2]    1     addw sp,#VSIZE 
      008D89 1E               [ 4]  547 	ret  	
                                    548 
                                    549 ;------------------------------------
                                    550 ; skip character c in text starting from 'in'
                                    551 ; input:
                                    552 ;	 y 		point to text buffer
                                    553 ;    a 		character to skip
                                    554 ; output:  
                                    555 ;	'in' ajusted to new position
                                    556 ;------------------------------------
                           000001   557 	C = 1 ; local var
      000EFB                        558 skip:
      008D8A 5B               [ 1]  559 	push a
      008D8B 06 81 00         [ 4]  560 1$:	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008D8D 27 0A            [ 1]  561 	jreq 2$
      008D8D 52 08            [ 1]  562 	cp a,(C,sp)
      008D8F CE 00            [ 1]  563 	jrne 2$
      008D91 1E C3 00 1C      [ 1]  564 	inc in
      008D95 26 19            [ 2]  565 	jra 1$
      000F0B                        566 2$: _drop 1 
      008D97 AE 00            [ 2]    1     addw sp,#1 
      008D99 02               [ 4]  567 	ret
                                    568 	
                                    569 
                                    570 ;------------------------------------
                                    571 ; scan text for next token
                                    572 ; input: 
                                    573 ;	X 		pointer to buffer where 
                                    574 ;	        token id and value are copied 
                                    575 ; use:
                                    576 ;	Y   pointer to text in tib 
                                    577 ; output:
                                    578 ;   A       token attribute 
                                    579 ;   X 		token value
                                    580 ;   Y       updated position in output buffer   
                                    581 ;------------------------------------
                                    582 	; use to check special character 
                                    583 	.macro _case c t  
                                    584 	ld a,#c 
                                    585 	cp a,(TCHAR,sp) 
                                    586 	jrne t
                                    587 	.endm 
                                    588 
                           000001   589 	TCHAR=1
                           000002   590 	ATTRIB=2
                           000002   591 	VSIZE=2
      000F0E                        592 get_token:: 
      000F0E                        593 	_vars VSIZE
      008D9A 72 D6            [ 2]    1     sub sp,#VSIZE 
                                    594 ;	ld a,in 
                                    595 ;	sub a,count
                                    596 ;   jrmi 0$
                                    597 ;	clr a 
                                    598 ;	ret 
      000F10                        599 0$: 
      008D9C 00 1A A1 03      [ 2]  600 	ldw y,#tib    	
      008DA0 27 5A            [ 1]  601 	ld a,#SPACE
      008DA2 5F 97 1F         [ 4]  602 	call skip
      008DA5 07 CE 00 1C 1F   [ 1]  603 	mov in.saved,in 
      008DAA 01 CE 00         [ 4]  604 	ld a,([in.w],y)
      008DAD 1E 20            [ 1]  605 	jrne 1$
      008DAF 38 72            [ 1]  606 	ldw y,x 
      008DB1 CE 00 1A         [ 2]  607 	jp token_exit ; end of line 
      008DB4 1F 05 AE 00      [ 1]  608 1$:	inc in 
      008DB8 02 72 D6         [ 4]  609 	call to_upper 
      008DBB 00 1A            [ 1]  610 	ld (TCHAR,sp),a 
                                    611 ; check for quoted string
      000F31                        612 str_tst:  	
      000F31                        613 	_case '"' nbr_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008DBD 97 1F            [ 1]    1 	ld a,#'"' 
      008DBF 07 1E            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC1 05 4F            [ 1]    3 	jrne nbr_tst
      008DC3 CD 8D            [ 1]  614 	ld a,#TK_QSTR
      008DC5 09               [ 1]  615 	ld (x),a 
      008DC6 5D               [ 1]  616 	incw x 
      008DC7 26 04 17         [ 4]  617 	call parse_quote
      008DCA 01 20 05         [ 2]  618 	jp token_exit
      000F41                        619 nbr_tst:
                                    620 ; check for hexadecimal number 
      008DCD 1F 01            [ 1]  621 	ld a,#'$'
      008DCF CD 8D            [ 1]  622 	cp a,(TCHAR,sp) 
      008DD1 34 17            [ 1]  623 	jreq 1$
                                    624 ;check for binary number 
      008DD2 A6 26            [ 1]  625 	ld a,#'&
      008DD2 A6 03            [ 1]  626 	cp a,(TCHAR,sp)
      008DD4 11 08            [ 1]  627 	jrne 0$
      008DD6 27 24            [ 1]  628 	ld a,#TK_INTGR
      008DD8 1E               [ 1]  629 	ld (x),a 
      008DD9 01               [ 1]  630 	incw x 
      008DDA C3 00 1E         [ 4]  631 	call parse_binary ; expect binary integer 
      008DDD 27 09 1E         [ 2]  632 	jp token_exit 
                                    633 ; check for decimal number 	
      008DE0 01 16            [ 1]  634 0$:	ld a,(TCHAR,sp)
      008DE2 07 CD 8D         [ 4]  635 	call is_digit
      008DE5 61 20            [ 1]  636 	jrnc 3$
      008DE7 06 84            [ 1]  637 1$:	ld a,#TK_INTGR 
      008DE8 F7               [ 1]  638 	ld (x),a 
      008DE8 72               [ 1]  639 	incw x 
      008DE9 FB 07            [ 1]  640 	ld a,(TCHAR,sp)
      008DEB CF 00 1E         [ 4]  641 	call parse_integer 
      008DEE 1E 07 CF         [ 2]  642 	jp token_exit 
      000F6A                        643 3$: 
      000F6A                        644 	_case '(' bkslsh_tst 
      008DF1 00 0E            [ 1]    1 	ld a,#'(' 
      008DF3 90 AE            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF5 16 B8            [ 1]    3 	jrne bkslsh_tst
      008DF7 1E 01            [ 1]  645 	ld a,#TK_LPAREN
      008DF9 CD 94 7F         [ 2]  646 	jp token_char   	
      008DFC                        647 bkslsh_tst: ; character token 
      000F75                        648 	_case '\',rparnt_tst
      008DFC 5B 08            [ 1]    1 	ld a,#'\' 
      008DFE 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFF 26 16            [ 1]    3 	jrne rparnt_tst
      008DFF 52 02            [ 1]  649 	ld a,#TK_CHAR 
      008E01 4F               [ 1]  650 	ld (x),a 
      008E02 6B               [ 1]  651 	incw x 
      008E03 01 D6 00         [ 4]  652 	ld a,([in.w],y)
      008E04 F7               [ 1]  653 	ld (x),a 
      008E04 91               [ 1]  654 	incw x
      008E05 D6 01            [ 1]  655 	ldw y,x 	 
      008E07 27 24 72 5C      [ 1]  656 	inc in  
      008E0B 00               [ 1]  657 	clrw x 
      008E0C 02               [ 1]  658 	ld xl,a 
      008E0D 6B 02            [ 1]  659 	ld a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008E0F A6 5C 11         [ 2]  660 	jp token_exit 
      000F91                        661 rparnt_tst:		
      000F91                        662 	_case ')' colon_tst 
      008E12 01 26            [ 1]    1 	ld a,#')' 
      008E14 0A 0F            [ 1]    2 	cp a,(TCHAR,sp) 
      008E16 01 7B            [ 1]    3 	jrne colon_tst
      008E18 02 AD            [ 1]  663 	ld a,#TK_RPAREN 
      008E1A 1C F7 5C         [ 2]  664 	jp token_char
      000F9C                        665 colon_tst:
      000F9C                        666 	_case ':' comma_tst 
      008E1D 20 E5            [ 1]    1 	ld a,#':' 
      008E1F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1F 7B 02            [ 1]    3 	jrne comma_tst
      008E21 A1 5C            [ 1]  667 	ld a,#TK_COLON 
      008E23 27 DD A1         [ 2]  668 	jp token_char  
      000FA7                        669 comma_tst:
      000FA7                        670 	_case COMMA sharp_tst 
      008E26 22 27            [ 1]    1 	ld a,#COMMA 
      008E28 04 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2A 5C 20            [ 1]    3 	jrne sharp_tst
      008E2C D7 08            [ 1]  671 	ld a,#TK_COMMA
      008E2D CC 10 C6         [ 2]  672 	jp token_char
      000FB2                        673 sharp_tst:
      000FB2                        674 	_case SHARP dash_tst 
      008E2D 7F 5C            [ 1]    1 	ld a,#SHARP 
      008E2F 90 93            [ 1]    2 	cp a,(TCHAR,sp) 
      008E31 5F A6            [ 1]    3 	jrne dash_tst
      008E33 02 5B            [ 1]  675 	ld a,#TK_SHARP
      008E35 02 81 C6         [ 2]  676 	jp token_char  	 	 
      008E37                        677 dash_tst: 	
      000FBD                        678 	_case '-' at_tst 
      008E37 89 AE            [ 1]    1 	ld a,#'-' 
      008E39 8E 4C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3B F1 27            [ 1]    3 	jrne at_tst
      008E3D 06 7D            [ 1]  679 	ld a,#TK_MINUS  
      008E3F 27 09 5C         [ 2]  680 	jp token_char 
      000FC8                        681 at_tst:
      000FC8                        682 	_case '@' qmark_tst 
      008E42 20 F7            [ 1]    1 	ld a,#'@' 
      008E44 1D 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008E46 4C 9F            [ 1]    3 	jrne qmark_tst
      008E48 AB 07            [ 1]  683 	ld a,#TK_ARRAY 
      008E4A 85 81 61         [ 2]  684 	jp token_char
      000FD3                        685 qmark_tst:
      000FD3                        686 	_case '?' tick_tst 
      008E4D 62 74            [ 1]    1 	ld a,#'?' 
      008E4F 6E 76            [ 1]    2 	cp a,(TCHAR,sp) 
      008E51 66 72            [ 1]    3 	jrne tick_tst
      008E53 00 80            [ 1]  687 	ld a,#TK_CMD  
      008E54 F7               [ 1]  688 	ld (x),a 
      008E54 89               [ 1]  689 	incw x 
      008E55 4B 00            [ 1]  690 	ldw y,x 
      008E57 4B 0A A1         [ 2]  691 	ldw x,#PRT_IDX 
      008E5A 24 26            [ 2]  692 	ldw (y),x 
      008E5C 04 5B 01 4B      [ 2]  693 	addw y,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008E60 10 F7 5C         [ 2]  694 	jp token_exit
      000FEB                        695 tick_tst: ; comment 
      000FEB                        696 	_case TICK plus_tst 
      008E63 91 D6            [ 1]    1 	ld a,#TICK 
      008E65 01 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008E67 5C 00            [ 1]    3 	jrne plus_tst
      008E69 02 CD            [ 1]  697 	ld a,#TK_CMD
      008E6B 98               [ 1]  698 	ld (x),a 
      008E6C FB               [ 1]  699 	incw x
      008E6D 6B 02 CD 8E      [ 2]  700 	ldw y,#REM_IDX
      008E71 F5               [ 2]  701 	ldw (x),y 
      008E72 25 ED A6         [ 2]  702 	addw x,#2  
      000FFD                        703 copy_comment:
      008E75 10 11 01 26      [ 2]  704 	ldw y,#tib 
      008E79 0A 7B 02 A1      [ 2]  705 	addw y,in.w
      008E7D 41 2B            [ 2]  706 	pushw y
      008E7F 04 A1 47         [ 4]  707 	call strcpy
      008E82 2B DD 72         [ 2]  708     subw y,(1,sp)
      008E85 5A 00            [ 1]  709 	ld a,yl 
      008E87 02 7F 1E         [ 1]  710 	add a,in
      008E8A 03 CD 99         [ 1]  711 	ld in,a 
      008E8D 07 90            [ 2]  712 	ldw (1,sp),x
      008E8F 93 C6 00         [ 2]  713 	addw y,(1,sp)
      008E92 0D 90            [ 1]  714 	incw y 
      00101C                        715 	_drop 2 
      008E94 F7 72            [ 2]    1     addw sp,#2 
      008E96 A9 00 01         [ 2]  716 	ldw x,#REM_IDX 
      008E99 CE 00            [ 1]  717 	ld a,#TK_CMD 
      008E9B 0E 90 FF         [ 2]  718 	jp token_exit 
      001026                        719 plus_tst:
      001026                        720 	_case '+' star_tst 
      008E9E 72 A9            [ 1]    1 	ld a,#'+' 
      008EA0 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EA2 A6 84            [ 1]    3 	jrne star_tst
      008EA4 5B 04            [ 1]  721 	ld a,#TK_PLUS  
      008EA6 81 10 C6         [ 2]  722 	jp token_char 
      008EA7                        723 star_tst:
      001031                        724 	_case '*' slash_tst 
      008EA7 4B 00            [ 1]    1 	ld a,#'*' 
      008EA9 4B 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008EAB 4B 00            [ 1]    3 	jrne slash_tst
      008EAD A6 20            [ 1]  725 	ld a,#TK_MULT 
      008EAD 91 D6 01         [ 2]  726 	jp token_char 
      00103C                        727 slash_tst: 
      00103C                        728 	_case '/' prcnt_tst 
      008EB0 72 5C            [ 1]    1 	ld a,#'/' 
      008EB2 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB4 A1 30            [ 1]    3 	jrne prcnt_tst
      008EB6 27 06            [ 1]  729 	ld a,#TK_DIV 
      008EB8 A1 31 27         [ 2]  730 	jp token_char 
      001047                        731 prcnt_tst:
      001047                        732 	_case '%' eql_tst 
      008EBB 02 20            [ 1]    1 	ld a,#'%' 
      008EBD 0B A0            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBF 30 46            [ 1]    3 	jrne eql_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      008EC1 09 03            [ 1]  733 	ld a,#TK_MOD
      008EC3 09 02 09         [ 2]  734 	jp token_char  
                                    735 ; 1 or 2 character tokens 	
      001052                        736 eql_tst:
      001052                        737 	_case '=' gt_tst 		
      008EC6 01 20            [ 1]    1 	ld a,#'=' 
      008EC8 E4 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC9 26 05            [ 1]    3 	jrne gt_tst
      008EC9 72 5A            [ 1]  738 	ld a,#TK_EQUAL
      008ECB 00 02 90         [ 2]  739 	jp token_char 
      00105D                        740 gt_tst:
      00105D                        741 	_case '>' lt_tst 
      008ECE 93 7B            [ 1]    1 	ld a,#'>' 
      008ED0 01 C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED2 00 0D            [ 1]    3 	jrne lt_tst
      008ED4 1E 02            [ 1]  742 	ld a,#TK_GT 
      008ED6 CF 00            [ 1]  743 	ld (ATTRIB,sp),a 
      008ED8 0E 90 FF         [ 4]  744 	ld a,([in.w],y)
      008EDB 72 A9 00 02      [ 1]  745 	inc in 
      008EDF A6 84            [ 1]  746 	cp a,#'=
      008EE1 5B 03            [ 1]  747 	jrne 1$
      008EE3 81 33            [ 1]  748 	ld a,#TK_GE 
      008EE4 20 50            [ 2]  749 	jra token_char  
      008EE4 A1 41            [ 1]  750 1$: cp a,#'<
      008EE6 8C 24            [ 1]  751 	jrne 2$
      008EE8 0B A1            [ 1]  752 	ld a,#TK_NE 
      008EEA 5B 25            [ 2]  753 	jra token_char 
      008EEC 07 A1 61 8C      [ 1]  754 2$: dec in
      008EF0 24 02            [ 1]  755 	ld a,(ATTRIB,sp)
      008EF2 A1 7B            [ 2]  756 	jra token_char 	 
      001086                        757 lt_tst:
      001086                        758 	_case '<' other
      008EF4 81 3C            [ 1]    1 	ld a,#'<' 
      008EF5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EF5 A1 30            [ 1]    3 	jrne other
      008EF7 25 03            [ 1]  759 	ld a,#TK_LT 
      008EF9 A1 3A            [ 1]  760 	ld (ATTRIB,sp),a 
      008EFB 8C 8C 81         [ 4]  761 	ld a,([in.w],y)
      008EFE 72 5C 00 01      [ 1]  762 	inc in 
      008EFE CD 8E            [ 1]  763 	cp a,#'=
      008F00 F5 25            [ 1]  764 	jrne 1$
      008F02 03 CD            [ 1]  765 	ld a,#TK_LE 
      008F04 8E E4            [ 2]  766 	jra token_char 
      008F06 81 3E            [ 1]  767 1$: cp a,#'>
      008F07 26 04            [ 1]  768 	jrne 2$
      008F07 A1 5F            [ 1]  769 	ld a,#TK_NE 
      008F09 26 03            [ 2]  770 	jra token_char 
      008F0B 99 20 03 CD      [ 1]  771 2$: dec in 
      008F0F 8E FE            [ 1]  772 	ld a,(ATTRIB,sp)
      008F11 81 17            [ 2]  773 	jra token_char 	
      008F12                        774 other: ; not a special character 	 
      008F12 5C 01            [ 1]  775 	ld a,(TCHAR,sp)
      008F13 CD 0E 64         [ 4]  776 	call is_alpha 
      008F13 CD 98            [ 1]  777 	jrc 30$ 
      008F15 FB F7 5C         [ 2]  778 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      0010B9                        779 30$: 
      008F18 91 D6 01         [ 4]  780 	call parse_keyword
      008F1B 72 5C 00         [ 2]  781 	cpw x,#remark 
      008F1E 02 CD            [ 1]  782 	jrne token_exit 
      008F20 8F 07            [ 1]  783 	ldw y,x 
      008F22 25 EF 7F         [ 2]  784 	jp copy_comment 
      0010C6                        785 token_char:
      008F25 72               [ 1]  786 	ld (x),a 
      008F26 5A               [ 1]  787 	incw x
      008F27 00 02            [ 1]  788 	ldw y,x 
      0010CA                        789 token_exit:
      0010CA                        790 	_drop VSIZE 
      008F29 81 02            [ 2]    1     addw sp,#VSIZE 
      008F2A 81               [ 4]  791 	ret
                                    792 
                                    793 
                                    794 ;-----------------------------------
                                    795 ; create token list fromm text line 
                                    796 ; save this list in pad buffer 
                                    797 ;  compiled line format: 
                                    798 ;    line_no  2 bytes {0...32767}
                                    799 ;    count    1 byte  
                                    800 ;    tokens   variable length 
                                    801 ;   
                                    802 ; input:
                                    803 ;   none
                                    804 ; modified variables:
                                    805 ;   basicptr     token list buffer address 
                                    806 ;   in.w  		 3|count, i.e. index in buffer
                                    807 ;   count        length of line | 0  
                                    808 ;-----------------------------------
                           000001   809 	XSAVE=1
                           000002   810 	VSIZE=2
      0010CD                        811 compile::
      008F2A 89 CD            [ 2]  812 	pushw y 
      0010CF                        813 	_vars VSIZE 
      008F2C 8F 12            [ 2]    1     sub sp,#VSIZE 
      008F2E 1E 01 E6 02 26   [ 1]  814 	mov basicptr,txtbgn
      008F33 0F E6 01 A0      [ 1]  815 	bset flags,#FCOMP 
      008F37 41 AE            [ 1]  816 	ld a,#0
      008F39 00 03 42         [ 2]  817 	ldw x,#0
      008F3C 1C 00 31         [ 2]  818 	ldw pad,x ; destination buffer 
      008F3F A6 85 20         [ 1]  819 	ld pad+2,a ; count 
      008F42 24 16 BB         [ 2]  820 	ldw x,#pad+3
      008F43 72 5F 00 01      [ 1]  821 	clr in 
      008F43 AE B3 14         [ 4]  822 	call get_token
      008F46 16 01            [ 1]  823 	cp a,#TK_INTGR
      008F48 90 5C            [ 1]  824 	jrne 2$
      008F4A CD 99 71         [ 2]  825 	cpw x,#1 
      008F4D 4D 26            [ 1]  826 	jrpl 1$
      008F4F 17 16            [ 1]  827 	ld a,#ERR_BAD_VALUE
      008F51 01 A6 03         [ 2]  828 	jp tb_error
      008F54 90 F7 90         [ 2]  829 1$:	ldw pad,x 
      008F57 5C AE 16 BB      [ 2]  830 	ldw y,#pad+3 
      008F58 90 A3 17 74      [ 2]  831 2$:	cpw y,#stack_full 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F58 90 F6            [ 1]  832 	jrult 3$
      008F5A 27 04            [ 1]  833 	ld a,#ERR_BUF_FULL 
      008F5C 90 5C 20         [ 2]  834 	jp tb_error 
      00110F                        835 3$:	
      008F5F F8               [ 1]  836 	ldw x,y 
      008F60 90 5C A6         [ 4]  837 	call get_token 
      008F63 03 5F            [ 1]  838 	cp a,#TK_NONE 
      008F65 20 11            [ 1]  839 	jrne 2$ 
                                    840 ; compilation completed  
      008F67 72 A2 16 B8      [ 2]  841 	subw y,#pad
      008F67 16 01            [ 1]  842     ld a,yl
      008F69 A3 00 4E         [ 2]  843 	ldw x,#pad 
      008F6C 27 0A 90         [ 2]  844 	ldw ptr16,x 
      008F6F F7 90            [ 1]  845 	ld (2,x),a 
      008F71 5C               [ 2]  846 	ldw x,(x)
      008F72 90 FF            [ 1]  847 	jreq 10$
      008F74 72 A9 00         [ 4]  848 	call insert_line
      008F77 02 5B 02 81      [ 1]  849 	clr  count 
      008F7B 20 0F            [ 2]  850 	jra  11$ 
      001131                        851 10$: ; line# is zero 
      008F7B 88 91 D6         [ 2]  852 	ldw x,ptr16  
      008F7E 01 27 0A         [ 2]  853 	ldw basicptr,x 
      008F81 11 01            [ 1]  854 	ld a,(2,x)
      008F83 26 06 72         [ 1]  855 	ld count,a 
      008F86 5C 00 02 20      [ 1]  856 	mov in,#3 
      001140                        857 11$:
      001140                        858 	_drop VSIZE 
      008F8A F1 5B            [ 2]    1     addw sp,#VSIZE 
      008F8C 01 81 00 22      [ 1]  859 	bres flags,#FCOMP 
      008F8E 90 85            [ 2]  860 	popw y 
      008F8E 52               [ 4]  861 	ret 
                                    862 
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
      001149                         48 cpy_cmd_name:
      008F8F 02               [ 1]   49 	ld a,(x)
      008F90 5C               [ 1]   50 	incw x
      008F90 90 AE            [ 1]   51 	and a,#15  
      008F92 16               [ 1]   52 	push a 
      008F93 68 A6            [ 1]   53     tnz (1,sp) 
      008F95 20 CD            [ 1]   54 	jreq 9$
      008F97 8F               [ 1]   55 1$:	ld a,(x)
      008F98 7B 55            [ 1]   56 	ld (y),a  
      008F9A 00               [ 1]   57 	incw x
      008F9B 02 00            [ 1]   58 	incw y 
      008F9D 03 91            [ 1]   59 	dec (1,sp)	 
      008F9F D6 01            [ 1]   60 	jrne 1$
      008FA1 26               [ 1]   61 9$: pop a 
      008FA2 05               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      00115E                         72 add_space:
      008FA3 90 93            [ 2]   73 	decw y 
      008FA5 CC 91            [ 1]   74 	ld a,(y)
      008FA7 4A 72            [ 1]   75 	incw y
      008FA9 5C 00            [ 1]   76 	cp a,#') 
      008FAB 02 CD            [ 1]   77 	jreq 0$
      008FAD 98 FB 6B         [ 4]   78 	call is_alnum 
      008FB0 01 06            [ 1]   79 	jrnc 1$
      008FB1                         80 0$: 
      008FB1 A6 22            [ 1]   81 	ld a,#SPACE 
      008FB3 11 01            [ 1]   82 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      008FB5 26 0A            [ 1]   83 	incw y 
      008FB7 A6               [ 4]   84 1$: ret 
                                     85 
                                     86 ;--------------------------
                                     87 ;  align text in buffer 
                                     88 ;  to tab_width padding 
                                     89 ;  left with  SPACE 
                                     90 ; input:
                                     91 ;   X      str*
                                     92 ;   A      str_length 
                                     93 ; output:
                                     94 ;   X      ajusted
                                     95 ;--------------------------
      001174                         96 right_align::
      008FB8 02               [ 1]   97 	push a 
      008FB9 F7 5C            [ 1]   98 0$: ld a,(1,sp)
      008FBB CD 8D FF         [ 1]   99 	cp a,tab_width 
      008FBE CC 91            [ 1]  100 	jrpl 1$
      008FC0 4A 20            [ 1]  101 	ld a,#SPACE 
      008FC1 5A               [ 2]  102 	decw x
      008FC1 A6               [ 1]  103 	ld (x),a  
      008FC2 24 11            [ 1]  104 	inc (1,sp)
      008FC4 01 27            [ 2]  105 	jra 0$ 
      008FC6 17               [ 1]  106 1$: pop a 	
      008FC7 A6               [ 4]  107 	ret 
                                    108 
                                    109 ;--------------------------
                                    110 ; print TK_QSTR
                                    111 ; converting control character
                                    112 ; to backslash sequence
                                    113 ; input:
                                    114 ;   X        char *
                                    115 ;   Y        dest. buffer 
                                    116 ; output:
                                    117 ;   X        moved forward 
                                    118 ;   Y        moved forward 
                                    119 ;-----------------------------
      001186                        120 cpy_quote:
      008FC8 26 11            [ 1]  121 	ld a,#'"
      008FCA 01 26            [ 1]  122 	ld (y),a 
      008FCC 0A A6            [ 1]  123 	incw y 
      008FCE 84               [ 2]  124 	pushw x 
      008FCF F7 5C CD         [ 4]  125 	call skip_string 
      008FD2 8E               [ 2]  126 	popw x 
      008FD3 A7               [ 1]  127 1$:	ld a,(x)
      008FD4 CC 91            [ 1]  128 	jreq 9$
      008FD6 4A               [ 1]  129 	incw x 
      008FD7 7B 01            [ 1]  130 	cp a,#SPACE 
      008FD9 CD 8E            [ 1]  131 	jrult 3$
      008FDB F5 24            [ 1]  132 	ld (y),a
      008FDD 0C A6            [ 1]  133 	incw y 
      008FDF 84 F7            [ 1]  134 	cp a,#'\ 
      008FE1 5C 7B            [ 1]  135 	jrne 1$ 
      0011A1                        136 2$:
      008FE3 01 CD            [ 1]  137 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FE5 8E 54            [ 1]  138 	incw y  
      008FE7 CC 91            [ 2]  139 	jra 1$
      008FE9 4A               [ 1]  140 3$: push a 
      008FEA A6 5C            [ 1]  141 	ld a,#'\
      008FEA A6 28            [ 1]  142 	ld (y),a 
      008FEC 11 01            [ 1]  143 	incw y  
      008FEE 26               [ 1]  144 	pop a 
      008FEF 05 A6            [ 1]  145 	sub a,#7
      008FF1 06 CC 91         [ 1]  146 	ld acc8,a 
      008FF4 46 5F 00 0D      [ 1]  147 	clr acc16
      008FF5 89               [ 2]  148 	pushw x
      008FF5 A6 5C 11         [ 2]  149 	ldw x,#escaped 
      008FF8 01 26 16 A6      [ 2]  150 	addw x,acc16 
      008FFC 04               [ 1]  151 	ld a,(x)
      008FFD F7               [ 2]  152 	popw x
      008FFE 5C 91            [ 2]  153 	jra 2$
      009000 D6 01            [ 1]  154 9$: ld a,#'"
      009002 F7 5C            [ 1]  155 	ld (y),a 
      009004 90 93            [ 1]  156 	incw y  
      009006 72               [ 1]  157 	incw x 
      009007 5C               [ 4]  158 	ret
                                    159 
                                    160 ;--------------------------
                                    161 ; return variable name 
                                    162 ; from its address.
                                    163 ; input:
                                    164 ;   X    variable address
                                    165 ; output:
                                    166 ;   A     variable letter
                                    167 ;--------------------------
      0011CC                        168 var_name::
      009008 00 02 5F         [ 2]  169 		subw x,#vars 
      00900B 97 A6            [ 1]  170 		ld a,#3
      00900D 04               [ 2]  171 		div x,a 
      00900E CC               [ 1]  172 		ld a,xl 
      00900F 91 4A            [ 1]  173 		add a,#'A 
      009011 81               [ 4]  174 		ret 
                                    175 
                                    176 ;-----------------------------
                                    177 ; return cmd  idx from its 
                                    178 ; code address 
                                    179 ; input:
                                    180 ;   X      code address 
                                    181 ; output:
                                    182 ;   X      cmd_idx
                                    183 ;-----------------------------
      0011D6                        184 get_cmd_idx:
      009011 A6 29            [ 2]  185 	pushw y
      009013 11 01 26 05      [ 2]  186 	ldw y,#code_addr 
      009017 A6 07 CC 91      [ 2]  187 	ldw ptr16,y 
      00901B 46 5F            [ 1]  188 	clrw y 
      00901C 91 D3 19         [ 5]  189 1$:	cpw x,([ptr16],y)
      00901C A6 3A            [ 1]  190 	jreq 3$ 
      00901E 11 01            [ 1]  191 	incw y 
      009020 26 05 A6         [ 4]  192 	ld a,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009023 0A CC            [ 1]  193 	incw y
      009025 91 46 19         [ 4]  194 	or a,([ptr16],y)	
      009027 26 EF            [ 1]  195 	jrne 1$
      009027 A6               [ 1]  196 3$: ldw x,y 
      009028 2C 11            [ 2]  197 	popw y 
      00902A 01               [ 4]  198 	ret
                                    199 
                                    200 
                                    201 ;-------------------------------------
                                    202 ; decompile tokens list 
                                    203 ; to original text line 
                                    204 ; input:
                                    205 ;   [basicptr]  pointer at line 
                                    206 ;   Y           output buffer
                                    207 ; output:
                                    208 ;   A           length 
                                    209 ;   Y           after string  
                                    210 ;------------------------------------
                           000001   211 	BASE_SAV=1
                           000002   212 	WIDTH_SAV=2
                           000003   213 	STR=3
                           000004   214 	VSIZE=4 
      0011F7                        215 decompile::
      0011F7                        216 	_vars VSIZE
      00902B 26 05            [ 2]    1     sub sp,#VSIZE 
      00902D A6 08 CC         [ 1]  217 	ld a,base
      009030 91 46            [ 1]  218 	ld (BASE_SAV,sp),a  
      009032 C6 00 23         [ 1]  219 	ld a,tab_width 
      009032 A6 23            [ 1]  220 	ld (WIDTH_SAV,sp),a 
      009034 11 01            [ 2]  221 	ldw (STR,sp),y   
      009036 26 05 A6 09      [ 5]  222 	ldw x,[basicptr] ; line number 
      00903A CC 91 46 0A      [ 1]  223 	mov base,#10
      00903D 35 05 00 23      [ 1]  224 	mov tab_width,#5
      00903D A6 2D 11 01      [ 1]  225 	clr acc24 
      009041 26 05 A6         [ 2]  226 	ldw acc16,x
      009044 11               [ 1]  227 	clr a ; unsigned conversion 
      009045 CC 91 46         [ 4]  228 	call itoa  
      009048 CD 11 74         [ 4]  229 	call right_align 
      009048 A6               [ 1]  230 	push a 
      009049 40 11            [ 1]  231 1$:	ldw y,x ; source
      00904B 01 26            [ 2]  232 	ldw x,(STR+1,sp) ; destination
      00904D 05 A6 05         [ 4]  233 	call strcpy 
      009050 CC 91            [ 1]  234 	clrw y 
      009052 46               [ 1]  235 	pop a 
      009053 90 97            [ 1]  236 	ld yl,a 
      009053 A6 3F 11         [ 2]  237 	addw y,(STR,sp)
      009056 01 26            [ 1]  238 	ld a,#SPACE 
      009058 12 A6            [ 1]  239 	ld (y),a 
      00905A 80 F7            [ 1]  240 	incw y 
      00905C 5C 90 93 AE      [ 1]  241 	clr tab_width
      009060 00 6E 90         [ 2]  242 	ldw x,#3
      009063 FF 72 A9         [ 2]  243 	ldw in.w,x 
      00123F                        244 decomp_loop:
      009066 00 02            [ 2]  245 	pushw y
      009068 CC 91 4A         [ 4]  246 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00906B 90 85            [ 2]  247 	popw y 
      00906B A6               [ 1]  248 	tnz a  
      00906C 27 11            [ 1]  249 	jrne 1$
      00906E 01 26 35         [ 2]  250 	jp 20$
      009071 A6 80            [ 1]  251 1$:	jrmi 2$
      009073 F7 5C 90         [ 2]  252 	jp 6$
      001251                        253 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      009076 AE 00            [ 1]  254 	cp a,#TK_VAR 
      009078 88 FF            [ 1]  255 	jrne 3$
                                    256 ;; TK_VAR 
      00907A 1C 00 02         [ 4]  257 	call add_space
      00907D CD 17 C5         [ 4]  258 	call get_addr   
      00907D 90 AE 16         [ 4]  259 	call var_name
      009080 68 72            [ 1]  260 	ld (y),a 
      009082 B9 00            [ 1]  261 	incw y  
      009084 01 90            [ 2]  262 	jra decomp_loop
      001264                        263 3$:
      009086 89 CD            [ 1]  264 	cp a,#TK_INTGR
      009088 94 6F            [ 1]  265 	jrne 4$
                                    266 ;; TK_INTGR
      00908A 72 F2 01         [ 4]  267 	call get_int24 
      00908D 90 9F CB         [ 1]  268 	ld acc24,a 
      009090 00 02 C7         [ 2]  269 	ldw acc16,x 
      009093 00 02 1F         [ 4]  270 	call add_space
      009096 01 72            [ 2]  271 	pushw y 
      009098 F9 01            [ 1]  272 	ld a,#255 ; signed conversion 
      00909A 90 5C 5B         [ 4]  273 	call itoa  
      00909D 02 AE            [ 2]  274 	ldw y,(1,sp) 
      00909F 00               [ 1]  275 	push a 
      0090A0 88               [ 1]  276 	exgw x,y 
      0090A1 A6 80 CC         [ 4]  277 	call strcpy 
      0090A4 91 4A            [ 1]  278 	clrw y
      0090A6 84               [ 1]  279 	pop a  
      0090A6 A6 2B            [ 1]  280 	ld yl,a 
      0090A8 11 01 26         [ 2]  281 	addw y,(1,sp)
      00128A                        282 	_drop 2 
      0090AB 05 A6            [ 2]    1     addw sp,#2 
      0090AD 10 CC            [ 2]  283 	jra decomp_loop
      00128E                        284 4$: ; dictionary keyword 
      0090AF 91               [ 2]  285 	ldw x,(x)
      0090B0 46 5C 00 01      [ 1]  286 	inc in 
      0090B1 72 5C 00 01      [ 1]  287 	inc in 
      0090B1 A6 2A 11         [ 2]  288 	cpw x,#REM_IDX
      0090B4 01 26            [ 1]  289 	jrne 5$
      0090B6 05 A6 20         [ 2]  290 	ldw x,basicptr 
                                    291 ; copy comment to buffer 
      0090B9 CC 91 46         [ 4]  292 	call add_space
      0090BC A6 27            [ 1]  293 	ld a,#''
      0090BC A6 2F            [ 1]  294 	ld (y),a 
      0090BE 11 01            [ 1]  295 	incw y 
      0012A8                        296 46$:
      0090C0 26 05 A6 21      [ 4]  297 	ld a,([in.w],x)
      0090C4 CC 91 46 01      [ 1]  298 	inc in  
      0090C7 90 F7            [ 1]  299 	ld (y),a 
      0090C7 A6 25            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0090C9 11 01 26         [ 1]  301 	ld a,in 
      0090CC 05 A6 22         [ 1]  302 	cp a,count 
      0090CF CC 91            [ 1]  303 	jrmi 46$
      0090D1 46 13 66         [ 2]  304 	jp 20$  
      0090D2 A3 00 4E         [ 2]  305 5$: cpw x,#LET_IDX 
      0090D2 A6 3D            [ 1]  306 	jrne 51$
      0090D4 11 01 26         [ 2]  307 	jp decomp_loop ; down display LET 	
      0012C7                        308 51$: ; insert command name 
      0090D7 05 A6 32         [ 4]  309 	call add_space  
      0090DA CC 91            [ 2]  310 	pushw y
      0090DC 46 13 A1         [ 4]  311 	call cmd_name
      0090DD 90 85            [ 2]  312 	popw y 
      0090DD A6 3E 11         [ 4]  313 	call cpy_cmd_name
      0090E0 01 26 23         [ 2]  314 	jp decomp_loop 
      0012D7                        315 6$:
                                    316 ; label?
      0090E3 A6 31            [ 1]  317 	cp a,#TK_LABEL 
      0090E5 6B 02            [ 1]  318 	jrne 64$
                                    319 ; copy label string to output buffer   	
      0090E7 91 D6            [ 1]  320 	ld a,#32 
      0090E9 01 72            [ 1]  321 	ld (y),a 
      0090EB 5C 00            [ 1]  322 	incw y 
      0012E1                        323 61$:
      0090ED 02               [ 2]  324 	pushw x 
      0090EE A1 3D 26         [ 4]  325 	call skip_string 
      0090F1 04               [ 2]  326 	popw x 
      0012E6                        327 62$:	
      0090F2 A6               [ 1]  328 	ld a,(x)
      0090F3 33 20            [ 1]  329 	jreq 63$ 
      0090F5 50               [ 1]  330 	incw x  
      0090F6 A1 3C            [ 1]  331 	ld (y),a 
      0090F8 26 04            [ 1]  332 	incw y 
      0090FA A6 35            [ 2]  333 	jra 62$ 
      0012F0                        334 63$: 
      0090FC 20 48            [ 1]  335 	ld a,#32 
      0090FE 72 5A            [ 1]  336 	ld (y),a 
      009100 00 02            [ 1]  337 	incw y 
      009102 7B 02 20         [ 2]  338 	jp decomp_loop
      0012F9                        339 64$:
      009105 40 02            [ 1]  340 	cp a,#TK_QSTR 
      009106 26 09            [ 1]  341 	jrne 7$
                                    342 ;; TK_QSTR
      009106 A6 3C 11         [ 4]  343 	call add_space
      009109 01 26 23         [ 4]  344 	call cpy_quote  
      00910C A6 34 6B         [ 2]  345 	jp decomp_loop
      001306                        346 7$:
      00910F 02 91            [ 1]  347 	cp a,#TK_CHAR 
      009111 D6 01            [ 1]  348 	jrne 8$
                                    349 ;; TK_CHAR
      009113 72 5C 00         [ 4]  350 	call add_space 
      009116 02 A1            [ 1]  351 	ld a,#'\ 
      009118 3D 26            [ 1]  352 	ld (y),a 
      00911A 04 A6            [ 1]  353 	incw y
      00911C 36               [ 1]  354 	ld a,(x)
      00911D 20 27 A1 3E      [ 1]  355 	inc in  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009121 26 04            [ 2]  356 	jra 81$
      009123 A6 35            [ 1]  357 8$: cp a,#TK_COLON 
      009125 20 1F            [ 1]  358 	jrne 9$
      009127 72 5A            [ 1]  359 	ld a,#':
      001320                        360 81$:
      009129 00 02            [ 1]  361 	ld (y),a 
      00912B 7B 02            [ 1]  362 	incw y 
      001324                        363 82$:
      00912D 20 17 3F         [ 2]  364 	jp decomp_loop
      00912F                        365 9$: 
      00912F 7B 01            [ 1]  366 	cp a,#TK_SHARP
      009131 CD 8E            [ 1]  367 	jrugt 10$ 
      009133 E4 25            [ 1]  368 	sub a,#TK_ARRAY 
      009135 03               [ 1]  369 	clrw x 
      009136 CC               [ 1]  370 	ld xl,a
      009137 97 0F 7C         [ 2]  371 	addw x,#single_char 
      009139 F6               [ 1]  372 	ld a,(x)
      009139 CD 8F            [ 2]  373 	jra 81$ 
      001335                        374 10$: 
      00913B 2A A3            [ 1]  375 	cp a,#TK_MINUS 
      00913D A0 84            [ 1]  376 	jrugt 11$
      00913F 26 09            [ 1]  377 	sub a,#TK_PLUS 
      009141 90               [ 1]  378 	clrw x 
      009142 93               [ 1]  379 	ld xl,a 
      009143 CC 90 7D         [ 2]  380 	addw x,#add_char 
      009146 F6               [ 1]  381 	ld a,(x)
      009146 F7 5C            [ 2]  382 	jra 81$
      001343                        383 11$:
      009148 90 93            [ 1]  384     cp a,#TK_MOD 
      00914A 22 0A            [ 1]  385 	jrugt 12$
      00914A 5B 02            [ 1]  386 	sub a,#TK_MULT
      00914C 81               [ 1]  387 	clrw x 
      00914D 97               [ 1]  388 	ld xl,a 
      00914D 90 89 52         [ 2]  389 	addw x,#mul_char
      009150 02               [ 1]  390 	ld a,(x)
      009151 55 00            [ 2]  391 	jra 81$
      001351                        392 12$:
      009153 1C 00            [ 1]  393 	sub a,#TK_GT  
      009155 05               [ 1]  394 	sll a 
      009156 72               [ 1]  395 	clrw x 
      009157 1A               [ 1]  396 	ld xl,a 
      009158 00 23 A6         [ 2]  397 	addw x,#relop_str 
      00915B 00               [ 2]  398 	ldw x,(x)
      00915C AE               [ 1]  399 	ld a,(x)
      00915D 00               [ 1]  400 	incw x 
      00915E 00 CF            [ 1]  401 	ld (y),a
      009160 16 B8            [ 1]  402 	incw y 
      009162 C7               [ 1]  403 	ld a,(x)
      009163 16 BA            [ 1]  404 	jrne 81$
      009165 AE 16 BB         [ 2]  405 	jp decomp_loop 
      001366                        406 20$: 
      009168 72 5F            [ 1]  407 	clr (y)
      00916A 00 02            [ 2]  408 	ldw x,(STR,sp)
      00916C CD 8F            [ 1]  409 	ld a,(BASE_SAV,sp)
      00916E 8E A1 84         [ 1]  410 	ld base,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009171 26 11            [ 1]  411 	ld a,(WIDTH_SAV,sp)
      009173 A3 00 01         [ 1]  412 	ld tab_width,a
      009176 2A 05 A6         [ 2]  413 	subw y,(STR,sp) 
      009179 0A CC            [ 1]  414 	ld a,yl 
      001379                        415 	_drop VSIZE 
      00917B 97 11            [ 2]    1     addw sp,#VSIZE 
      00917D CF               [ 4]  416 	ret 
                                    417 
      00917E 16 B8 90 AE 16         418 single_char: .byte '@','(',')',',','#'
      009183 BB 90                  419 add_char: .byte '+','-'
      009185 A3 17 74               420 mul_char: .byte '*','/','%'
      009188 25 05 A6 0F CC 97 11   421 relop_str: .word gt,equal,ge,lt,le,ne 
             99 13 9B 13 9E
      00918F 3E 00                  422 gt: .asciz ">"
      00918F 93 CD                  423 equal: .asciz "="
      009191 8F 8E A1               424 ge: .asciz ">="
      009194 00 26                  425 lt: .asciz "<"
      009196 ED 72 A2               426 le: .asciz "<="
      009199 16 B8 90               427 ne:  .asciz "<>"
                                    428 
                                    429 ;----------------------------------
                                    430 ; search in kword_dict name
                                    431 ; from its execution address 
                                    432 ; input:
                                    433 ;   X       	cmd_index 
                                    434 ; output:
                                    435 ;   X 			cstr*  | 0 
                                    436 ;--------------------------------
                           000001   437 	CMDX=1 
                           000003   438 	LINK=3 
                           000004   439 	VSIZE=4
      0013A1                        440 cmd_name:
      0013A1                        441 	_vars VSIZE 
      00919C 9F AE            [ 2]    1     sub sp,#VSIZE 
      00919E 16 B8 CF 00      [ 1]  442 	clr acc16 
      0091A2 1A E7            [ 2]  443 	ldw (CMDX,sp),x  
      0091A4 02 FE 27         [ 2]  444 	ldw x,#kword_dict	
      0091A7 09 CD            [ 2]  445 1$:	ldw (LINK,sp),x
      0091A9 8D 8D            [ 1]  446 	ld a,(2,x)
      0091AB 72 5F            [ 1]  447 	and a,#15 
      0091AD 00 04 20         [ 1]  448 	ld acc8,a 
      0091B0 0F 00 03         [ 2]  449 	addw x,#3
      0091B1 72 BB 00 0D      [ 2]  450 	addw x,acc16
      0091B1 CE               [ 2]  451 	ldw x,(x) ; command index  
      0091B2 00 1A            [ 2]  452 	cpw x,(CMDX,sp)
      0091B4 CF 00            [ 1]  453 	jreq 2$
      0091B6 05 E6            [ 2]  454 	ldw x,(LINK,sp)
      0091B8 02               [ 2]  455 	ldw x,(x) 
      0091B9 C7 00 04         [ 2]  456 	subw x,#2  
      0091BC 35 03            [ 1]  457 	jrne 1$
      0091BE 00 02            [ 2]  458 	jra 9$
      0091C0 1E 03            [ 2]  459 2$: ldw x,(LINK,sp)
      0091C0 5B 02 72         [ 2]  460 	addw x,#2 	
      0013D0                        461 9$:	_drop VSIZE
      0091C3 1B 00            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091C5 23               [ 4]  462 	ret
                                    463 
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
      0013D3                        116 strlen::
      0091C6 90               [ 2]  117 	pushw x 
      0091C7 85               [ 1]  118 	clr a
      0091C8 81               [ 1]  119 1$:	tnz (x) 
      0091C9 27 04            [ 1]  120 	jreq 9$ 
      0091C9 F6               [ 1]  121 	inc a 
      0091CA 5C               [ 1]  122 	incw x 
      0091CB A4 0F            [ 2]  123 	jra 1$ 
      0091CD 88               [ 2]  124 9$:	popw x 
      0091CE 0D               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0013DE                        135 strcmp:
      0091CF 01               [ 1]  136 	ld a,(x)
      0091D0 27 0A            [ 1]  137 	jreq 5$ 
      0091D2 F6 90            [ 1]  138 	cp a,(y) 
      0091D4 F7 5C            [ 1]  139 	jrne 4$ 
      0091D6 90               [ 1]  140 	incw x 
      0091D7 5C 0A            [ 1]  141 	incw y 
      0091D9 01 26            [ 2]  142 	jra strcmp 
      0013EA                        143 4$: ; not same  
      0091DB F6               [ 1]  144 	clr a 
      0091DC 84               [ 4]  145 	ret 
      0013EC                        146 5$: ; same 
      0091DD 81 01            [ 1]  147 	ld a,#1 
      0091DE 81               [ 4]  148 	ret 
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
      0013EF                        159 strcpy::
      0091DE 90               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091DF 5A               [ 2]  161 	pushw x 
      0091E0 90 F6            [ 1]  162 1$: ld a,(y)
      0091E2 90 5C            [ 1]  163 	jreq 9$ 
      0091E4 A1               [ 1]  164 	ld (x),a 
      0091E5 29               [ 1]  165 	incw x 
      0091E6 27 05            [ 1]  166 	incw y 
      0091E8 CD 8E            [ 2]  167 	jra 1$ 
      0091EA FE               [ 1]  168 9$:	clr (x)
      0091EB 24               [ 2]  169 	popw x 
      0091EC 06               [ 1]  170 	pop a 
      0091ED 81               [ 4]  171 	ret 
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
                           000001   182 	INCR=1 ; increament high byte 
                           000002   183 	LB=2 ; increament low byte 
                           000002   184 	VSIZE=2
      0013FF                        185 move::
      0091ED A6               [ 1]  186 	push a 
      001400                        187 	_vars VSIZE 
      0091EE 20 90            [ 2]    1     sub sp,#VSIZE 
      0091F0 F7 90            [ 1]  188 	clr (INCR,sp)
      0091F2 5C 81            [ 1]  189 	clr (LB,sp)
      0091F4 90 89            [ 2]  190 	pushw y 
      0091F4 88 7B            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      0091F6 01 C1            [ 2]  192 	popw y 
      0091F8 00 24            [ 1]  193 	jreq move_exit ; x==y 
      0091FA 2A 08            [ 1]  194 	jrmi move_down
      001410                        195 move_up: ; start from top address with incr=-1
      0091FC A6 20 5A F7      [ 2]  196 	addw x,acc16
      009200 0C 01 20 F1      [ 2]  197 	addw y,acc16
      009204 84 81            [ 1]  198 	cpl (INCR,sp)
      009206 03 02            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009206 A6 22            [ 2]  200 	jra move_loop  
      00141E                        201 move_down: ; start from bottom address with incr=1 
      009208 90               [ 2]  202     decw x 
      009209 F7 90            [ 2]  203 	decw y
      00920B 5C 89            [ 1]  204 	inc (LB,sp) ; incr=1 
      001423                        205 move_loop:	
      00920D CD 98 36         [ 1]  206     ld a, acc16 
      009210 85 F6 27         [ 1]  207 	or a, acc8
      009213 30 5C            [ 1]  208 	jreq move_exit 
      009215 A1 20 25         [ 2]  209 	addw x,(INCR,sp)
      009218 0E 90 F7         [ 2]  210 	addw y,(INCR,sp) 
      00921B 90 5C            [ 1]  211 	ld a,(y)
      00921D A1               [ 1]  212 	ld (x),a 
      00921E 5C               [ 2]  213 	pushw x 
      00921F 26 F0 0D         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009221 5A               [ 2]  215 	decw x 
      009221 90 F7 90         [ 2]  216 	ldw acc16,x 
      009224 5C               [ 2]  217 	popw x 
      009225 20 EA            [ 2]  218 	jra move_loop
      00143F                        219 move_exit:
      00143F                        220 	_drop VSIZE
      009227 88 A6            [ 2]    1     addw sp,#VSIZE 
      009229 5C               [ 1]  221 	pop a 
      00922A 90               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001443                        231 clear_vars:
      00922B F7               [ 2]  232 	pushw x 
      00922C 90               [ 1]  233 	push a  
      00922D 5C 84 A0         [ 2]  234 	ldw x,#vars 
      009230 07 C7            [ 1]  235 	ld a,#CELL_SIZE*26 
      009232 00               [ 1]  236 1$:	clr (x)
      009233 0F               [ 1]  237 	incw x 
      009234 72               [ 1]  238 	dec a 
      009235 5F 00            [ 1]  239 	jrne 1$
      009237 0E               [ 1]  240 	pop a 
      009238 89               [ 2]  241 	popw x 
      009239 AE               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      00923A 8E 4C 72 BB 00 0E F6   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             85 20 DD A6 22 90 F7
             90 5C 5C 81 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    252 
      00924C                        253 system_information:
      00924C 1D 00 31         [ 2]  254 	ldw x,#software 
      00924F A6 03 62         [ 4]  255 	call puts 
      009252 9F AB            [ 1]  256 	ld a,#MAJOR 
      009254 41 81 0E         [ 1]  257 	ld acc8,a 
      009256 5F               [ 1]  258 	clrw x 
      009256 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009259 AE B3 1A 90      [ 1]  260 	clr tab_width  
      00925D CF 00 1A 90      [ 1]  261 	mov base, #10 
      009261 5F 91 D3         [ 4]  262 	call prt_acc24 
      009264 1A 27            [ 1]  263 	ld a,#'.
      009266 0C 90 5C         [ 4]  264 	call putc 
      009269 91 D6            [ 1]  265 	ld a,#MINOR 
      00926B 1A 90 5C         [ 1]  266 	ld acc8,a 
      00926E 91               [ 1]  267 	clrw x 
      00926F DA 1A 26         [ 2]  268 	ldw acc24,x 
      009272 EF 93 90         [ 4]  269 	call prt_acc24
      009275 85 81            [ 1]  270 	ld a,#CR 
      009277 CD 09 44         [ 4]  271 	call putc
                                    272 ;call test 
      009277 52               [ 4]  273 	ret
                                    274 
      0014C9                        275 warm_init:
      009278 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00927C 6B 01 C6 00      [ 1]  277 	clr flags 
      009280 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009284 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009288 05 35 0A 00      [ 1]  280 	mov base,#10 
      00928C 0B 35 05         [ 2]  281 	ldw x,#0 
      00928F 00 24 72         [ 2]  282 	ldw basicptr,x 
      009292 5F 00 0D         [ 2]  283 	ldw in.w,x 
      009295 CF 00 0E 4F      [ 1]  284 	clr count
      009299 CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      0014EB                        291 clear_basic:
      00929A 98               [ 2]  292 	pushw x 
      00929B A2 CD 91 F4      [ 1]  293 	clr count
      00929F 88 90 93 1E      [ 1]  294 	clr in  
      0092A3 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092A6 6F 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092A9 84 90 97         [ 2]  297 	ldw txtend,x 
      0092AC 72 F9 03         [ 4]  298 	call clear_vars 
      0092AF A6               [ 2]  299 	popw x
      0092B0 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001502                        305 err_msg:
      0092B1 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092BD 00 01 15 93 15 AD 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             BE 15 CF
      0092BF 15 DB 16 0E 16 1E 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             32 16 45
      0092BF 90 89                  309 	.word err_overflow 
                                    310 
      0092C1 CD 98 10 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092C9 CC 93 E6 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             57 72 72 6F 72 0A 00
      0092D1 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092D1 A1 85 26 0F CD 91 DE   314 err_div0: .asciz "division by 0\n" 
             CD 98 45 CD 92 4C 90
             F7
      0092E0 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092E4 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092E4 A1 84 26 26 CD 98 4F   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 DE 90 89 A6 FF CD
             98 A2 16 01 88
      0092FE 51 CD 94 6F 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      00930E 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      00930E FE 72 5C 00 02 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 A3 00 88
      00931A 26 23 CE 00 05 CD 91   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             DE A6 27 90 F7 90 5C
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      009328 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      009328 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      00933C CC 93 E6 A3 00 4E 26   324 err_no_fspace: .asciz "File system full.\n" 
             03 CC 92 BF 20 66 75
             6C 6C 2E 0A 00
      009347 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      009347 CD 91 DE 90 89 CD 94   326 err_overflow: .asciz "overflow\n" 
             21 90 85
                                    327 
      009351 CD 91 C9 CC 92 BF 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009357 0A 63 6F 6D 70 69 6C   329 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      009357 A1 03 26 1E A6 20 90   330 tk_id: .asciz "last token id: "
             F7 90 5C 20 69 64 3A
             20 00
                                    331 
      009361                        332 syntax_error::
      009361 89 CD            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      001691                        335 tb_error::
      009363 98 36 85 22 4C   [ 2]  336 	btjt flags,#FCOMP,1$
      009366 88               [ 1]  337 	push a 
      009366 F6 27 07         [ 2]  338 	ldw x, #rt_msg 
      009369 5C 90 F7         [ 4]  339 	call puts 
      00936C 90               [ 1]  340 	pop a 
      00936D 5C 20 F6         [ 2]  341 	ldw x, #err_msg 
      009370 72 5F 00 0D      [ 1]  342 	clr acc16 
      009370 A6               [ 1]  343 	sll a
      009371 20 90 F7 90      [ 1]  344 	rlc acc16  
      009375 5C CC 92         [ 1]  345 	ld acc8, a 
      009378 BF BB 00 0D      [ 2]  346 	addw x,acc16 
      009379 FE               [ 2]  347 	ldw x,(x)
      009379 A1 02 26         [ 4]  348 	call puts
      00937C 09 CD 91         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      00937F DE CD 92         [ 1]  351 ld a,count 
      009382 06 CC            [ 1]  352 clrw y 
      009384 92 BF            [ 1]  353 rlwa y  
      009386 CD 06 A0         [ 4]  354 call hex_dump
      009386 A1 04 26         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      009389 10 CD 91         [ 1]  357 	ld a,in 
      00938C DE A6 5C         [ 4]  358 	call prt_basic_line
      00938F 90 F7 90         [ 2]  359 	ldw x,#tk_id 
      009392 5C F6 72         [ 4]  360 	call puts 
      009395 5C 00 02         [ 1]  361 	ld a,in.saved 
      009398 20               [ 1]  362 	clrw x 
      009399 06               [ 1]  363 	ld xl,a 
      00939A A1 0A 26 09      [ 2]  364 	addw x,basicptr 
      00939E A6               [ 1]  365 	ld a,(x)
      00939F 3A               [ 1]  366 	clrw x 
      0093A0 97               [ 1]  367 	ld xl,a 
      0093A0 90 F7 90         [ 4]  368 	call prt_i16
      0093A3 5C 35            [ 2]  369 	jra 6$
      0093A4                        370 1$:	
      0093A4 CC               [ 1]  371 	push a 
      0093A5 92 BF 6E         [ 2]  372 	ldw x,#comp_msg
      0093A7 CD 09 A1         [ 4]  373 	call puts 
      0093A7 A1               [ 1]  374 	pop a 
      0093A8 09 22 0A         [ 2]  375 	ldw x, #err_msg 
      0093AB A0 05 5F 97      [ 1]  376 	clr acc16 
      0093AF 1C               [ 1]  377 	sll a
      0093B0 93 FC F6 20      [ 1]  378 	rlc acc16  
      0093B4 EB 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093B5 72 BB 00 0D      [ 2]  380 	addw x,acc16 
      0093B5 A1               [ 2]  381 	ldw x,(x)
      0093B6 11 22 0A         [ 4]  382 	call puts
      0093B9 A0 10 5F         [ 2]  383 	ldw x,#tib
      0093BC 97 1C 94         [ 4]  384 	call puts 
      0093BF 01 F6            [ 1]  385 	ld a,#CR 
      0093C1 20 DD 44         [ 4]  386 	call putc
      0093C3 CE 00 00         [ 2]  387 	ldw x,in.w
      0093C3 A1 22 22         [ 4]  388 	call spaces
      0093C6 0A A0            [ 1]  389 	ld a,#'^
      0093C8 20 5F 97         [ 4]  390 	call putc 
      0093CB 1C 94 03         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093CE F6               [ 1]  392     ldw sp,x
                                    393 
      00171B                        394 warm_start:
      0093CF 20 CF C9         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      0093D1                        399 cmd_line: ; user interface 
      0093D1 A0 31            [ 1]  400 	ld a,#CR 
      0093D3 48 5F 97         [ 4]  401 	call putc 
      0093D6 1C 94            [ 1]  402 	ld a,#'> 
      0093D8 06 FE F6         [ 4]  403 	call putc
      0093DB 5C 90 F7         [ 4]  404 	call readln
      0093DE 90 5C F6 26      [ 1]  405 	tnz count 
      0093E2 BD CC            [ 1]  406 	jreq cmd_line
      0093E4 92 BF CD         [ 4]  407 	call compile
                                    408 
                                    409 ;;;;;;;;;;;;;;;;;;;;;;	
                                    410 ;pushw y 
                                    411 ;ldw x,txtbgn  
                                    412 ;ldw y,txtend
                                    413 ;ldw acc16,x   
                                    414 ;subw y,acc16 
                                    415 ;call hex_dump
                                    416 ;popw y 
                                    417 ;;;;;;;;;;;;;;;;;;;;;;
                                    418 
                                    419 ; if text begin with a line number
                                    420 ; the compiler set count to zero    
                                    421 ; so code is not interpreted
      0093E6 72 5D 00 03      [ 1]  422 	tnz count 
      0093E6 90 7F            [ 1]  423 	jreq cmd_line
                                    424 	
                                    425 ; if direct command 
                                    426 ; it's ready to interpret 
                                    427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    428 ;; This is the interpreter loop
                                    429 ;; for each BASIC code line. 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00173A                        431 interpreter: 
      0093E8 1E 03 7B         [ 1]  432 	ld a,in 
      0093EB 01 C7 00         [ 1]  433 	cp a,count 
      0093EE 0B 7B            [ 1]  434 	jrmi interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      001742                        435 next_line:
      0093F0 02 C7 00 24 72   [ 2]  436 	btjf flags, #FRUN, cmd_line
      0093F5 F2 03 90         [ 2]  437 	ldw x,basicptr
      0093F8 9F 5B 04 81      [ 2]  438 	addw x,in.w 
      0093FC 40 28 29         [ 2]  439 	cpw x,txtend 
      0093FF 2C 23            [ 1]  440 	jrpl warm_start
      009401 2B 2D 2A         [ 2]  441 	ldw basicptr,x ; start of next line  
      009404 2F 25            [ 1]  442 	ld a,(2,x)
      009406 94 12 94         [ 1]  443 	ld count,a 
      009409 14 94 16 94      [ 1]  444 	mov in,#3 ; skip first 3 bytes of line 
      00175F                        445 interp_loop:
      00940D 19 94 1B         [ 4]  446 	call next_token
      009410 94 1E            [ 1]  447 	cp a,#TK_NONE 
      009412 3E 00            [ 1]  448 	jreq next_line 
      009414 3D 00            [ 1]  449 	cp a,#TK_CMD
      009416 3E 3D            [ 1]  450 	jrne 1$
      009418 00 3C 00         [ 4]  451 	call get_code_addr
      00941B 3C               [ 4]  452 	call (x) 
      00941C 3D 00            [ 2]  453 	jra interp_loop 
      001770                        454 1$:	 
      00941E 3C 3E            [ 1]  455 	cp a,#TK_VAR
      009420 00 05            [ 1]  456 	jrne 2$
      009421 CD 1B 62         [ 4]  457 	call let_var  
      009421 52 04            [ 2]  458 	jra interp_loop 
      001779                        459 2$:	
      009423 72 5F            [ 1]  460 	cp a,#TK_ARRAY 
      009425 00 0E            [ 1]  461 	jrne 3$
      009427 1F 01 AE         [ 4]  462 	call let_array 
      00942A B3 12            [ 2]  463 	jra interp_loop
      001782                        464 3$:	
      00942C 1F 03            [ 1]  465 	cp a,#TK_COLON 
      00942E E6 02            [ 1]  466 	jreq interp_loop
      009430 A4 0F            [ 1]  467 4$: cp a,#TK_LABEL
      009432 C7 00 0F         [ 4]  468 	call skip_string 
      009435 1C 00            [ 2]  469 	jra interp_loop 
      009437 03 72 BB         [ 2]  470 5$:	jp syntax_error 
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
      001790                        481 next_token::
                                    482 ;	clrw x 
      00943A 00 0E FE         [ 1]  483 	ld a,in 
      00943D 13 01 27         [ 1]  484 	ld in.saved,a ; in case "_unget_token" needed 
                                    485 ; don't replace sub by "cp a,count" 
                                    486 ; if end of line must return with A=0   	
      009440 0A 1E 03         [ 1]  487 	sub a,count 
      009443 FE 1D            [ 1]  488 	jreq 9$ ; end of line 
      00179B                        489 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009445 00 02 26         [ 2]  490 	ldw x,basicptr 
      009448 E3 20 05 1E      [ 2]  491 	addw x,in.w 
      00944C 03               [ 1]  492 	ld a,(x)
      00944D 1C               [ 1]  493 	incw x
      00944E 00 02 5B 04      [ 1]  494 	inc in   
      009452 81               [ 4]  495 9$: ret 
                                    496 
                                    497 ;------------------------
                                    498 ; get cmd and function 
                                    499 ; code address 
                                    500 ; input:
                                    501 ;    X   * cmd|func index 
                                    502 ;        in code_addr table 
                                    503 ;------------------------
      000001                        504 get_code_addr:
      000002 FE               [ 2]  505 	ldw x,(x)
      000003 DE 32 9A         [ 2]  506 	ldw x,(code_addr,x)
      000004                        507 skip_2_bytes:
      000005 72 5C 00 01      [ 1]  508 	inc in 
      000007 72 5C 00 01      [ 1]  509 	inc in 
      000009 81               [ 4]  510 	ret
                                    511 
                                    512 ;-------------------------
                                    513 ;  skip .asciz in BASIC line 
                                    514 ;  name 
                                    515 ;  input:
                                    516 ;     x		* string 
                                    517 ;  output:
                                    518 ;     none 
                                    519 ;-------------------------
      00000A                        520 skip_string:
      00000B F6               [ 1]  521 	ld a,(x)
      00000C 27 03            [ 1]  522 	jreq 1$
      00000D 5C               [ 1]  523 	incw x 
      00000E 20 FA            [ 2]  524 	jra skip_string 
      00000F 5C               [ 1]  525 1$: incw x 	
      000010 72 B0 00 04      [ 2]  526 	subw x,basicptr 
      000013 CF 00 00         [ 2]  527 	ldw in.w,x 
      000015 81               [ 4]  528 	ret 
                                    529 
                                    530 ;---------------------
                                    531 ; extract 16 bits  
                                    532 ; address from BASIC
                                    533 ; code 
                                    534 ; input:
                                    535 ;    X    *address
                                    536 ; output:
                                    537 ;    X    address 
                                    538 ;-------------------- 
      000017                        539 get_addr:
      000019 FE               [ 2]  540 	ldw x,(x)
      00001A 72 5C 00 01      [ 1]  541 	inc in 
      00001B 72 5C 00 01      [ 1]  542 	inc in 
      00001C 81               [ 4]  543 	ret 
                                    544 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    545 ;--------------------
                                    546 ; extract int24_t  
                                    547 ; value from BASIC 
                                    548 ; code 
                                    549 ; input:
                                    550 ;    X   *integer 
                                    551 ; output:
                                    552 ;    A:X   int24  
                                    553 ;--------------------
      00001E                        554 get_int24:
      000020 F6               [ 1]  555 	ld a,(x)
      000021 EE 01            [ 2]  556 	ldw x,(1,x)
                                    557 ; skip 3 bytes 
      000023 72 5C 00 01      [ 1]  558 	inc in 
      000024 72 5C 00 01      [ 1]  559 	inc in 
      000025 72 5C 00 01      [ 1]  560 	inc in 
      000027 81               [ 4]  561 	ret 
                                    562 
                                    563 ;-------------------------
                                    564 ; get character from 
                                    565 ; BASIC code 
                                    566 ; input:
                                    567 ;    X   *char 
                                    568 ; output:
                                    569 ;    A    char 
                                    570 ;-------------------------
      00002F                        571 get_char:
      000030 F6               [ 1]  572 	ld a,(x)
      000031 72 5C 00 01      [ 1]  573 	inc in  
      00007C 81               [ 4]  574     ret 
                                    575 
                                    576 ;-----------------------------------
                                    577 ; print a 16 bit integer 
                                    578 ; using variable 'base' as conversion
                                    579 ; format.
                                    580 ; input:
                                    581 ;    X       integer to print 
                                    582 ;   'base'    conversion base 
                                    583 ; output:
                                    584 ;   terminal  
                                    585 ;-----------------------------------
      00007C                        586 prt_i16:
      00007E 72 5F 00 0C      [ 1]  587 	clr acc24 
      000080 CF 00 0D         [ 2]  588 	ldw acc16,x 
      009453 A6 10            [ 1]  589 	ld a,#16
      009453 89 4F 7D         [ 1]  590 	cp a,base
      009456 27 04            [ 1]  591 	jreq prt_acc24  
      009458 4C 5C 20 F9 85   [ 2]  592 	btjf acc16,#7,prt_acc24
      00945D 81 53 00 0C      [ 1]  593 	cpl acc24 ; sign extend 
                                    594 	
                                    595 ;------------------------------------
                                    596 ; print integer in acc24 
                                    597 ; input:
                                    598 ;	acc24 		integer to print 
                                    599 ;	'base' 		numerical base for conversion 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    600 ;   'tab_width' field width 
                                    601 ;    A 			signed||unsigned conversion
                                    602 ;  output:
                                    603 ;    A          string length
                                    604 ;------------------------------------
      00945E                        605 prt_acc24:
      00945E F6 27            [ 1]  606 	ld a,#255  ; signed conversion  
      009460 0B 90 F1         [ 4]  607     call itoa  ; conversion entier en  .asciz
      009463 26 05 5C         [ 4]  608 	call right_align  
      009466 90               [ 1]  609 	push a 
      009467 5C 20 F4         [ 4]  610 	call puts
      00946A 84               [ 1]  611 	pop a 
      00946A 4F               [ 4]  612     ret	
                                    613 
                                    614 ;---------------------------------------
                                    615 ;  print value at xstack top 
                                    616 ;---------------------------------------
      00180A                        617 print_top: 
      00180A                        618 	_xpop 
      00946B 81 F6            [ 1]    1     ld a,(y)
      00946C 93               [ 1]    2     ldw x,y 
      00946C A6 01            [ 2]    3     ldw x,(1,x)
      00946E 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00946F C7 00 0C         [ 1]  619 	ld acc24,a 
      00946F 88 89 90         [ 2]  620 	ldw acc16,x 
      009472 F6 27 06         [ 4]  621 	call prt_acc24 
      009475 F7 5C            [ 1]  622 	ld a,#SPACE
      009477 90 5C 20         [ 4]  623 	call putc 
      00947A F6               [ 4]  624 	ret 
                                    625 
                                    626 ;------------------------------------
                                    627 ; convert integer in acc24 to string
                                    628 ; input:
                                    629 ;   'base'	conversion base 
                                    630 ;	acc24	integer to convert
                                    631 ;   A       0=unsigned, else signed 
                                    632 ; output:
                                    633 ;   X  		pointer to first char of string
                                    634 ;   A       string length
                                    635 ;------------------------------------
                           000001   636 	SIGN=1  ; integer sign 
                           000002   637 	LEN=2 
                           000003   638 	PSTR=3
                           000004   639 	VSIZE=4 ;locals size
      001822                        640 itoa::
      001822                        641 	_vars VSIZE
      00947B 7F 85            [ 2]    1     sub sp,#VSIZE 
      00947D 84 81            [ 1]  642 	clr (LEN,sp) ; string length  
      00947F 0F 01            [ 1]  643 	clr (SIGN,sp)    ; sign
      00947F 88               [ 1]  644 	tnz A
      009480 52 02            [ 1]  645 	jreq 1$ ; unsigned conversion  
      009482 0F 01 0F         [ 1]  646 	ld a,base 
      009485 02 90            [ 1]  647 	cp a,#10
      009487 89 13            [ 1]  648 	jrne 1$
                                    649 	; base 10 string display with negative sign if bit 23==1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      009489 01 90 85 27 31   [ 2]  650 	btjf acc24,#7,1$
      00948E 2B 0E            [ 1]  651 	cpl (SIGN,sp)
      009490 CD 02 0D         [ 4]  652 	call neg_acc24
      00183C                        653 1$:
                                    654 ; initialize string pointer 
      009490 72 BB 00         [ 2]  655 	ldw x,#tib 
      009493 0E 72 B9         [ 2]  656 	addw x,#TIB_SIZE
      009496 00               [ 2]  657 	decw x 
      009497 0E               [ 1]  658 	clr (x)
      001844                        659 itoa_loop:
      009498 03 01 03         [ 1]  660     ld a,base
                                    661 ;	ldw (PSTR,sp),x 
      00949B 02 20 05         [ 4]  662     call divu24_8 ; acc24/A 
                                    663 ;	ldw x,(PSTR,sp)
      00949E AB 30            [ 1]  664     add a,#'0  ; remainder of division
      00949E 5A 90            [ 1]  665     cp a,#'9+1
      0094A0 5A 0C            [ 1]  666     jrmi 2$
      0094A2 02 07            [ 1]  667     add a,#7 
      0094A3                        668 2$:	
      0094A3 C6               [ 2]  669 	decw x
      0094A4 00               [ 1]  670     ld (x),a
      0094A5 0E CA            [ 1]  671 	inc (LEN,sp)
                                    672 	; if acc24==0 conversion done
      0094A7 00 0F 27         [ 1]  673 	ld a,acc24
      0094AA 14 72 FB         [ 1]  674 	or a,acc16
      0094AD 01 72 F9         [ 1]  675 	or a,acc8
      0094B0 01 90            [ 1]  676     jrne itoa_loop
                                    677 	;conversion done, next add '$' or '-' as required
      0094B2 F6 F7 89         [ 1]  678 	ld a,base 
      0094B5 CE 00            [ 1]  679 	cp a,#16
      0094B7 0E 5A            [ 1]  680 	jreq 8$
      0094B9 CF 00            [ 1]  681 	ld a,(SIGN,sp)
      0094BB 0E 85            [ 1]  682     jreq 10$
      0094BD 20 E4            [ 1]  683     ld a,#'-
      0094BF 20 02            [ 2]  684 	jra 9$ 
      001870                        685 8$:	
      0094BF 5B 02            [ 1]  686 	ld a,#'$ 
      0094C1 84               [ 2]  687 9$: decw x
      0094C2 81               [ 1]  688     ld (x),a
      0094C3 0C 02            [ 1]  689 	inc (LEN,sp)
      001876                        690 10$:
      0094C3 89 88            [ 1]  691 	ld a,(LEN,sp)
      001878                        692 	_drop VSIZE
      0094C5 AE 00            [ 2]    1     addw sp,#VSIZE 
      0094C7 31               [ 4]  693 	ret
                                    694 
                                    695 ;------------------------------------
                                    696 ; convert alpha to uppercase
                                    697 ; input:
                                    698 ;    a  character to convert
                                    699 ; output:
                                    700 ;    a  uppercase character
                                    701 ;------------------------------------
      00187B                        702 to_upper::
      0094C8 A6 4E            [ 1]  703 	cp a,#'a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094CA 7F 5C            [ 1]  704 	jrpl 1$
      0094CC 4A               [ 4]  705 0$:	ret
      0094CD 26 FB            [ 1]  706 1$: cp a,#'z	
      0094CF 84 85            [ 1]  707 	jrugt 0$
      0094D1 81 0A            [ 1]  708 	sub a,#32
      0094D3 0A               [ 4]  709 	ret
                                    710 	
                                    711 ;------------------------------------
                                    712 ; convert pad content in integer
                                    713 ; input:
                                    714 ;    x		* .asciz to convert
                                    715 ; output:
                                    716 ;    acc24      int24_t
                                    717 ;------------------------------------
                                    718 	; local variables
                           000001   719 	SIGN=1 ; 1 byte, 
                           000002   720 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   721 	TEMP=3 ; 1 byte, temporary storage
                           000003   722 	VSIZE=3 ; 3 bytes reserved for local storage
      001887                        723 atoi24::
      0094D4 54               [ 2]  724 	pushw x 
      001888                        725 	_vars VSIZE
      0094D5 69 6E            [ 2]    1     sub sp,#VSIZE 
                                    726 	; acc24=0 
      0094D7 79 20 42 41      [ 1]  727 	clr acc24    
      0094DB 53 49 43 20      [ 1]  728 	clr acc16
      0094DF 66 6F 72 20      [ 1]  729 	clr acc8 
      0094E3 53 54            [ 1]  730 	clr (SIGN,sp)
      0094E5 4D 38            [ 1]  731 	ld a,#10
      0094E7 0A 43            [ 1]  732 	ld (BASE,sp),a ; default base decimal
      0094E9 6F               [ 1]  733 	ld a,(x)
      0094EA 70 79            [ 1]  734 	jreq 9$  ; completed if 0
      0094EC 72 69            [ 1]  735 	cp a,#'-
      0094EE 67 68            [ 1]  736 	jrne 1$
      0094F0 74 2C            [ 1]  737 	cpl (SIGN,sp)
      0094F2 20 4A            [ 2]  738 	jra 2$
      0094F4 61 63            [ 1]  739 1$: cp a,#'$
      0094F6 71 75            [ 1]  740 	jrne 3$
      0094F8 65 73            [ 1]  741 	ld a,#16
      0094FA 20 44            [ 1]  742 	ld (BASE,sp),a
      0094FC 65               [ 1]  743 2$:	incw x
      0094FD 73               [ 1]  744 	ld a,(x)
      0018B1                        745 3$:	
      0094FE 63 68            [ 1]  746 	cp a,#'a
      009500 65 6E            [ 1]  747 	jrmi 4$
      009502 65 73            [ 1]  748 	sub a,#32
      009504 20 32            [ 1]  749 4$:	cp a,#'0
      009506 30 31            [ 1]  750 	jrmi 9$
      009508 39 2C            [ 1]  751 	sub a,#'0
      00950A 32 30            [ 1]  752 	cp a,#10
      00950C 32 32            [ 1]  753 	jrmi 5$
      00950E 0A 76            [ 1]  754 	sub a,#7
      009510 65 72            [ 1]  755 	cp a,(BASE,sp)
      009512 73 69            [ 1]  756 	jrpl 9$
      009514 6F 6E            [ 1]  757 5$:	ld (TEMP,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009516 20 00            [ 1]  758 	ld a,(BASE,sp)
      009518 CD 02 2A         [ 4]  759 	call mulu24_8
      009518 AE 94            [ 1]  760 	ld a,(TEMP,sp)
      00951A D2 CD 8A         [ 1]  761 	add a,acc24+2
      00951D 21 A6 02         [ 1]  762 	ld acc24+2,a
      009520 C7               [ 1]  763 	clr a
      009521 00 0F 5F         [ 1]  764 	adc a,acc24+1
      009524 CF 00 0D         [ 1]  765 	ld acc24+1,a
      009527 72               [ 1]  766 	clr a
      009528 5F 00 24         [ 1]  767 	adc a,acc24
      00952B 35 0A 00         [ 1]  768 	ld acc24,a
      00952E 0B CD            [ 2]  769 	jra 2$
      009530 98 7C            [ 1]  770 9$:	tnz (SIGN,sp)
      009532 A6 2E            [ 1]  771     jreq atoi_exit
      009534 CD 89 C4         [ 4]  772     call neg_acc24
      0018ED                        773 atoi_exit: 
      0018ED                        774 	_drop VSIZE
      009537 A6 00            [ 2]    1     addw sp,#VSIZE 
      009539 C7               [ 2]  775 	popw x ; restore x
      00953A 00               [ 4]  776 	ret
                                    777 
                                    778 
                                    779 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    780 ;;   TINY BASIC  operators,
                                    781 ;;   commands and functions 
                                    782 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    783 
                                    784 ;---------------------------------
                                    785 ; dictionary search 
                                    786 ; input:
                                    787 ;	X 		dictionary entry point, name field  
                                    788 ;   y		.asciz name to search 
                                    789 ; output:
                                    790 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    791 ;  X		cmd_index
                                    792 ;---------------------------------
                           000001   793 	NLEN=1 ; cmd length 
                           000002   794 	XSAVE=2
                           000004   795 	YSAVE=4
                           000005   796 	VSIZE=5 
      0018F1                        797 search_dict::
      0018F1                        798 	_vars VSIZE 
      00953B 0F 5F            [ 2]    1     sub sp,#VSIZE 
      00953D CF 00            [ 2]  799 	ldw (YSAVE,sp),y 
      0018F5                        800 search_next:
      00953F 0D CD            [ 2]  801 	ldw (XSAVE,sp),x 
                                    802 ; get name length in dictionary	
      009541 98               [ 1]  803 	ld a,(x)
      009542 7C A6            [ 1]  804 	and a,#0xf 
      009544 0D CD            [ 1]  805 	ld (NLEN,sp),a  
      009546 89 C4            [ 2]  806 	ldw y,(YSAVE,sp) ; name pointer 
      009548 81               [ 1]  807 	incw x 
      009549                        808 cp_loop:
      009549 90 AE            [ 1]  809 	ld a,(y)
      00954B 17 73            [ 1]  810 	jreq str_match 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00954D 72 5F            [ 1]  811 	tnz (NLEN,sp)
      00954F 00 23            [ 1]  812 	jreq no_match  
      009551 72               [ 1]  813 	cp a,(x)
      009552 5F 00            [ 1]  814 	jrne no_match 
      009554 20 35            [ 1]  815 	incw y 
      009556 04               [ 1]  816 	incw x
      009557 00 24            [ 1]  817 	dec (NLEN,sp)
      009559 35 0A            [ 2]  818 	jra cp_loop 
      001911                        819 no_match:
      00955B 00 0B            [ 2]  820 	ldw x,(XSAVE,sp) 
      00955D AE 00 00         [ 2]  821 	subw x,#2 ; move X to link field
      009560 CF 00            [ 1]  822 	push #TK_NONE 
      009562 05               [ 2]  823 	ldw x,(x) ; next word link 
      009563 CF               [ 1]  824 	pop a ; TK_NONE 
      009564 00 01            [ 1]  825 	jreq search_exit  ; not found  
                                    826 ;try next 
      009566 72 5F            [ 2]  827 	jra search_next
      00191E                        828 str_match:
      009568 00 04            [ 2]  829 	ldw x,(XSAVE,sp)
      00956A 81               [ 1]  830 	ld a,(X)
      00956B 6B 01            [ 1]  831 	ld (NLEN,sp),a ; needed to test keyword type  
      00956B 89 72            [ 1]  832 	and a,#0xf 
                                    833 ; move x to procedure address field 	
      00956D 5F               [ 1]  834 	inc a 
      00956E 00 04 72         [ 1]  835 	ld acc8,a 
      009571 5F 00 02 AE      [ 1]  836 	clr acc16 
      009575 00 80 CF 00      [ 2]  837 	addw x,acc16 
      009579 1C               [ 2]  838 	ldw x,(x) ; routine index  
                                    839 ;determine keyword type bits 7:6 
      00957A CF 00            [ 1]  840 	ld a,(NLEN,sp)
      00957C 1E               [ 1]  841 	swap a 
      00957D CD 94            [ 1]  842 	and a,#0xc
      00957F C3               [ 1]  843 	srl a
      009580 85               [ 1]  844 	srl a 
      009581 81 80            [ 1]  845 	add a,#128
      009582                        846 search_exit: 
      00193B                        847 	_drop VSIZE 
      009582 00 00            [ 2]    1     addw sp,#VSIZE 
      009584 95               [ 4]  848 	ret 
                                    849 
                                    850 ;---------------------
                                    851 ; check if next token
                                    852 ;  is of expected type 
                                    853 ; input:
                                    854 ;   A 		 expected token attribute
                                    855 ;  ouput:
                                    856 ;   none     if fail call syntax_error 
                                    857 ;--------------------
      00193E                        858 expect:
      009585 A4               [ 1]  859 	push a 
      009586 95 B1 95         [ 4]  860 	call next_token 
      009589 BF 95            [ 1]  861 	cp a,(1,sp)
      00958B D8 95            [ 1]  862 	jreq 1$
      00958D E7 95 FD         [ 2]  863 	jp syntax_error
      009590 96               [ 1]  864 1$: pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009591 13               [ 4]  865 	ret 
                                    866 
                                    867 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    868 ; parse arguments list 
                                    869 ; between ()
                                    870 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00194B                        871 func_args:
      009592 96 2D            [ 1]  872 	ld a,#TK_LPAREN 
      009594 96 3E 96         [ 4]  873 	call expect 
                                    874 ; expected to continue in arg_list 
                                    875 ; caller must check for TK_RPAREN 
                                    876 
                                    877 ;-------------------------------
                                    878 ; parse embedded BASIC routines 
                                    879 ; arguments list.
                                    880 ; arg_list::=  expr[','expr]*
                                    881 ; all arguments are of int24_t type
                                    882 ; and pushed on stack 
                                    883 ; input:
                                    884 ;   none
                                    885 ; output:
                                    886 ;   xstack{n}   arguments pushed on xstack
                                    887 ;   A 	number of arguments pushed on xstack  
                                    888 ;--------------------------------
      001950                        889 arg_list:
      009597 4F 96            [ 1]  890 	push #0  
      009599 5B 96 8E         [ 4]  891 1$: call expression
      00959C 96 9E            [ 1]  892 	cp a,#TK_NONE 
      00959E 96 B2            [ 1]  893 	jreq 5$
      0095A0 96 C5            [ 1]  894 	cp a,#TK_INTGR
      0095A2 96 D2            [ 1]  895 	jrne 4$
      00195D                        896 3$: 
      0095A4 4D 65            [ 1]  897 	inc (1,sp)
      0095A6 6D 6F 72         [ 4]  898 	call next_token 
      0095A9 79 20            [ 1]  899 	cp a,#TK_COMMA 
      0095AB 66 75            [ 1]  900 	jreq 1$ 
      0095AD 6C 6C            [ 1]  901 	cp a,#TK_NONE 
      0095AF 0A 00            [ 1]  902 	jreq 5$ 
      0095B1 73 79            [ 1]  903 4$:	cp a,#TK_RPAREN 
      0095B3 6E 74            [ 1]  904 	jreq 5$
      00196E                        905 	_unget_token 
      0095B5 61 78 20 65 72   [ 1]    1      mov in,in.saved  
      0095BA 72               [ 1]  906 5$:	pop a  
      0095BB 6F               [ 4]  907 	ret 
                                    908 
                                    909 ;--------------------------------
                                    910 ;   BASIC commnands 
                                    911 ;--------------------------------
                                    912 
                                    913 ;--------------------------------
                                    914 ;  arithmetic and relational 
                                    915 ;  routines
                                    916 ;  operators precedence
                                    917 ;  highest to lowest
                                    918 ;  operators on same row have 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    919 ;  same precedence and are executed
                                    920 ;  from left to right.
                                    921 ;	'*','/','%'
                                    922 ;   '-','+'
                                    923 ;   '=','>','<','>=','<=','<>','><'
                                    924 ;   '<>' and '><' are equivalent for not equal.
                                    925 ;--------------------------------
                                    926 
                                    927 ;---------------------
                                    928 ; return array element
                                    929 ; address from @(expr)
                                    930 ; input:
                                    931 ;   A 		TK_ARRAY
                                    932 ; output:
                                    933 ;	X 		element address 
                                    934 ;----------------------
      001975                        935 get_array_element:
      0095BC 72 0A 00         [ 4]  936 	call func_args 
      0095BF 6D 61            [ 1]  937 	cp a,#1
      0095C1 74 68            [ 1]  938 	jreq 1$
      0095C3 20 6F 70         [ 2]  939 	jp syntax_error
      00197F                        940 1$: _xpop 
      0095C6 65 72            [ 1]    1     ld a,(y)
      0095C8 61               [ 1]    2     ldw x,y 
      0095C9 74 69            [ 2]    3     ldw x,(1,x)
      0095CB 6F 6E 20 6F      [ 2]    4     addw y,#CELL_SIZE 
                                    941     ; ignore A, index < 65536 in any case 
                                    942 	; check for bounds 
      0095CF 76 65 72         [ 2]  943 	cpw x,array_size 
      0095D2 66 6C            [ 2]  944 	jrule 3$
                                    945 ; bounds {1..array_size}	
      0095D4 6F 77            [ 1]  946 2$: ld a,#ERR_BAD_VALUE 
      0095D6 0A 00 64         [ 2]  947 	jp tb_error 
      0095D9 69               [ 2]  948 3$: tnzw  x
      0095DA 76 69            [ 1]  949 	jreq 2$ 
      0095DC 73               [ 2]  950 	pushw x 
      0095DD 69               [ 2]  951 	sllw x 
      0095DE 6F 6E 20         [ 2]  952 	addw x,(1,sp) ; index*size_of(int24)
      0095E1 62 79            [ 2]  953 	ldw (1,sp),x  
      0095E3 20 30 0A         [ 2]  954 	ldw x,#tib ; array is below tib 
      0095E6 00 69 6E         [ 2]  955 	subw x,(1,sp)
      0019A2                        956 	_drop 2   
      0095E9 76 61            [ 2]    1     addw sp,#2 
      0095EB 6C               [ 4]  957 	ret 
                                    958 
                                    959 
                                    960 ;***********************************
                                    961 ;   expression parse,execute 
                                    962 ;***********************************
                                    963 ;-----------------------------------
                                    964 ; factor ::= ['+'|'-'|e]  var | @ |
                                    965 ;			 integer | function |
                                    966 ;			 '('relation')' 
                                    967 ; output:
                                    968 ;   A       token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    969 ;   xstack  value  
                                    970 ; ---------------------------------
                           000001   971 	NEG=1
                           000001   972 	VSIZE=1
      0019A5                        973 factor:
      0019A5                        974 	_vars VSIZE 
      0095EC 69 64            [ 2]    1     sub sp,#VSIZE 
      0095EE 20 6C            [ 1]  975 	clr (NEG,sp)
      0095F0 69 6E 65         [ 4]  976 	call next_token
      0095F3 20 6E            [ 1]  977 1$:	cp a,#TK_PLUS 
      0095F5 75 6D            [ 1]  978 	jreq 2$
      0095F7 62 65            [ 1]  979 	cp a,#TK_MINUS 
      0095F9 72 2E            [ 1]  980 	jrne 4$ 
      0095FB 0A 00            [ 1]  981 	cpl (NEG,sp)
      0019B6                        982 2$:	
      0095FD 72 75 6E         [ 4]  983 	call next_token 
      0019B9                        984 4$:	
      009600 20 74            [ 1]  985 	cp a,#TK_IFUNC 
      009602 69 6D            [ 1]  986 	jrne 5$ 
      009604 65 20 6F         [ 4]  987 	call get_code_addr 
      009607 6E               [ 4]  988 	call (x); result in A:X  
      009608 6C 79            [ 2]  989 	jra 18$ 
      0019C3                        990 5$:
      00960A 20 75            [ 1]  991 	cp a,#TK_INTGR
      00960C 73 61            [ 1]  992 	jrne 6$
      00960E 67 65 2E         [ 4]  993 	call get_int24 ; A:X
      009611 0A 00            [ 2]  994 	jra 18$
      0019CC                        995 6$:
      009613 63 6F            [ 1]  996 	cp a,#TK_ARRAY
      009615 6D 6D            [ 1]  997 	jrne 7$
      009617 61 6E 64         [ 4]  998 	call get_array_element
      00961A 20 6C            [ 2]  999     jra 71$
      0019D5                       1000 7$:
      00961C 69 6E            [ 1] 1001 	cp a,#TK_VAR 
      00961E 65 20            [ 1] 1002 	jrne 8$
      009620 6F 6E 6C         [ 4] 1003 	call get_addr 
      0019DC                       1004 71$: ; put value in A:X
      009623 79               [ 1] 1005 	ld a,(x)
      009624 20 75            [ 2] 1006 	ldw x,(1,x)
      009626 73 61            [ 2] 1007 	jra 18$
      0019E1                       1008 8$:
      009628 67 65            [ 1] 1009 	cp a,#TK_LABEL 
      00962A 2E 0A            [ 1] 1010 	jrne 9$ 
      00962C 00               [ 2] 1011 	pushw x 
      00962D 64 75 70         [ 4] 1012 	call skip_string
      009630 6C               [ 2] 1013 	popw x 
      009631 69 63 61         [ 4] 1014 	call search_const 
      009634 74               [ 2] 1015 	tnzw x 
      009635 65 20            [ 1] 1016 	jreq 16$
      009637 6E 61 6D         [ 4] 1017 	call get_const_value ; in A:X 
      00963A 65 2E            [ 2] 1018 	jra 18$
      0019F5                       1019 9$: 
      00963C 0A 00            [ 1] 1020 	cp a,#TK_CFUNC 
      00963E 46 69            [ 1] 1021 	jrne 12$
      009640 6C 65 20         [ 4] 1022 	call get_code_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009643 6E               [ 4] 1023 	call(x)
      009644 6F               [ 1] 1024 	clrw x 
      009645 74               [ 1] 1025 	rlwa x  ; char>int24 in A:X 
      009646 20 66            [ 2] 1026 	jra 18$ 	 
      001A01                       1027 12$:			
      009648 6F 75            [ 1] 1028 	cp a,#TK_LPAREN
      00964A 6E 64            [ 1] 1029 	jrne 16$
      00964C 2E 0A 00         [ 4] 1030 	call expression
      00964F 62 61            [ 1] 1031 	ld a,#TK_RPAREN 
      009651 64 20 76         [ 4] 1032 	call expect
      001A0D                       1033 	_xpop 
      009654 61 6C            [ 1]    1     ld a,(y)
      009656 75               [ 1]    2     ldw x,y 
      009657 65 2E            [ 2]    3     ldw x,(1,x)
      009659 0A 00 46 69      [ 2]    4     addw y,#CELL_SIZE 
      00965D 6C 65            [ 2] 1034 	jra 18$	
      001A18                       1035 16$:
      00965F 20 69 6E         [ 2] 1036 	jp syntax_error
      001A1B                       1037 18$: 
      009662 20 65            [ 1] 1038 	tnz (NEG,sp)
      009664 78 74            [ 1] 1039 	jreq 20$
      009666 65 6E 64         [ 4] 1040 	call neg_ax   
      001A22                       1041 20$:
      001A22                       1042 	_xpush 
      009669 65 64 20 6D      [ 2]    1     subw y,#CELL_SIZE
      00966D 65 6D            [ 1]    2     ld (y),a 
      00966F 6F 72 79         [ 2]    3     ldw (1,y),x 
      001A2B                       1043 	_drop VSIZE
      009672 2C 20            [ 2]    1     addw sp,#VSIZE 
      009674 63               [ 4] 1044 	ret
                                   1045 
                                   1046 
                                   1047 ;-----------------------------------
                                   1048 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1049 ; output:
                                   1050 ;   A    	token attribute 
                                   1051 ;	xstack		value 
                                   1052 ;-----------------------------------
                           000001  1053 	MULOP=1
                           000001  1054 	VSIZE=1
      001A2E                       1055 term:
      001A2E                       1056 	_vars VSIZE
      009675 61 6E            [ 2]    1     sub sp,#VSIZE 
                                   1057 ; first factor 	
      009677 27 74 20         [ 4] 1058 	call factor
      001A33                       1059 term01:	 ; check for  operator '*'|'/'|'%' 
      00967A 62 65 20         [ 4] 1060 	call next_token
      00967D 72 75            [ 1] 1061 	ld (MULOP,sp),a
      00967F 6E 20            [ 1] 1062 	cp a,#CMD_END
      009681 66 72            [ 1] 1063 	jrult 8$
      009683 6F 6D            [ 1] 1064 	and a,#TK_GRP_MASK
      009685 20 74            [ 1] 1065 	cp a,#TK_GRP_MULT
      009687 68 65            [ 1] 1066 	jreq 1$
      009689 72 65            [ 2] 1067 	jra 8$
      001A44                       1068 1$:	; got *|/|%
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



                                   1069 ;second factor
      00968B 2E 0A 00         [ 4] 1070 	call factor
      001A47                       1071 2$: ; select operation 	
      00968E 4E 6F            [ 1] 1072 	ld a,(MULOP,sp) 
      009690 20 64            [ 1] 1073 	cp a,#TK_MULT 
      009692 61 74            [ 1] 1074 	jrne 3$
                                   1075 ; '*' operator
      009694 61 20 66         [ 4] 1076 	call mul24 
      009697 6F 75            [ 2] 1077 	jra term01
      009699 6E 64            [ 1] 1078 3$: cp a,#TK_DIV 
      00969B 2E 0A            [ 1] 1079 	jrne 4$ 
                                   1080 ; '/' operator	
      00969D 00 4E 6F         [ 4] 1081 	call div24 
      0096A0 20 70            [ 2] 1082 	jra term01 
      001A5B                       1083 4$: ; '%' operator
      0096A2 72 6F 67         [ 4] 1084 	call mod24
      0096A5 72 61            [ 2] 1085 	jra term01 
      001A60                       1086 8$: ; term end 
      001A60                       1087 	_unget_token
      0096A7 6D 20 69 6E 20   [ 1]    1      mov in,in.saved  
      001A65                       1088 9$: 
      001A65                       1089 term_exit:
      001A65                       1090 	_drop VSIZE 
      0096AC 52 41            [ 2]    1     addw sp,#VSIZE 
      0096AE 4D               [ 4] 1091 	ret 
                                   1092 
                                   1093 ;-------------------------------
                                   1094 ;  expr ::= term [['+'|'-'] term]*
                                   1095 ;  result range {-32768..32767}
                                   1096 ;  output:
                                   1097 ;   A    token attribute 
                                   1098 ;   xstack	 result    
                                   1099 ;-------------------------------
                           000001  1100 	OP=1 
                           000001  1101 	VSIZE=1 
      001A68                       1102 expression:
      001A68                       1103 	_vars VSIZE 
      0096AF 21 0A            [ 2]    1     sub sp,#VSIZE 
                                   1104 ; first term 	
      0096B1 00 46 69         [ 4] 1105 	call term
      001A6D                       1106 1$:	; operator '+'|'-'
      0096B4 6C 65 20         [ 4] 1107 	call next_token
      0096B7 73 79            [ 1] 1108 	ld (OP,sp),a 
      0096B9 73 74            [ 1] 1109 	cp a,#CMD_END 
      0096BB 65 6D            [ 1] 1110 	jrult 8$ 
      0096BD 20 66            [ 1] 1111 	and a,#TK_GRP_MASK
      0096BF 75 6C            [ 1] 1112 	cp a,#TK_GRP_ADD 
      0096C1 6C 2E            [ 1] 1113 	jreq 2$ 
      0096C3 0A 00            [ 2] 1114 	jra 8$
      001A7E                       1115 2$: ; second term 
      0096C5 42 75 66         [ 4] 1116 	call term
      0096C8 66 65            [ 1] 1117 	ld a,(OP,sp)
      0096CA 72 20            [ 1] 1118 	cp a,#TK_PLUS 
      0096CC 66 75            [ 1] 1119 	jrne 4$
                                   1120 ; '+' operator	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      0096CE 6C 6C 0A         [ 4] 1121 	call add24
      0096D1 00 6F            [ 2] 1122 	jra 1$ 
      001A8C                       1123 4$:	; '-' operator 
      0096D3 76 65 72         [ 4] 1124 	call sub24
      0096D6 66 6C            [ 2] 1125 	jra 1$
      001A91                       1126 8$: ; end of expression 
      001A91                       1127 	_unget_token	
      0096D8 6F 77 0A 00 0A   [ 1]    1      mov in,in.saved  
      001A96                       1128 9$: ; expression value on xstack 
      0096DD 72 75            [ 1] 1129 	ld a,#TK_INTGR 	
      001A98                       1130 expr_exit:
      001A98                       1131 	_drop VSIZE 
      0096DF 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096E1 74               [ 4] 1132 	ret 
                                   1133 
                                   1134 ;---------------------------------------------
                                   1135 ; rel ::= expr rel_op expr
                                   1136 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1137 ;  relation return  integer , zero is false 
                                   1138 ;  output:
                                   1139 ;    A 		token attribute  
                                   1140 ;	 xstack		value  
                                   1141 ;---------------------------------------------
                           000001  1142 	RELOP=1
                           000001  1143 	VSIZE=1 
      001A9B                       1144 relation: 
      001A9B                       1145 	_vars VSIZE
      0096E2 69 6D            [ 2]    1     sub sp,#VSIZE 
      0096E4 65 20 65         [ 4] 1146 	call expression
                                   1147 ; expect rel_op or leave 
      0096E7 72 72 6F         [ 4] 1148 	call next_token 
      0096EA 72 2C            [ 1] 1149 	ld (RELOP,sp),a 
      0096EC 20 00            [ 1] 1150 	and a,#TK_GRP_MASK
      0096EE 0A 63            [ 1] 1151 	cp a,#TK_GRP_RELOP 
      0096F0 6F 6D            [ 1] 1152 	jrne 8$
      001AAB                       1153 2$:	; expect another expression
      0096F2 70 69 6C         [ 4] 1154 	call expression
      0096F5 65 20 65         [ 4] 1155 	call cp24 
      001AB1                       1156 	_xpop  
      0096F8 72 72            [ 1]    1     ld a,(y)
      0096FA 6F               [ 1]    2     ldw x,y 
      0096FB 72 2C            [ 2]    3     ldw x,(1,x)
      0096FD 20 00 6C 61      [ 2]    4     addw y,#CELL_SIZE 
      009701 73               [ 1] 1157 	tnz a 
      009702 74 20            [ 1] 1158 	jrmi 4$
      009704 74 6F            [ 1] 1159 	jrne 5$
      009706 6B 65 6E 20      [ 1] 1160 	mov acc8,#2 ; i1==i2
      00970A 69 64            [ 2] 1161 	jra 6$ 
      001AC5                       1162 4$: ; i1<i2
      00970C 3A 20 00 0E      [ 1] 1163 	mov acc8,#4 
      00970F 20 04            [ 2] 1164 	jra 6$
      001ACB                       1165 5$: ; i1>i2
      00970F A6 02 00 0E      [ 1] 1166 	mov acc8,#1  
      009711                       1167 6$:
      009711 72               [ 1] 1168 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009712 0A 00 23         [ 1] 1169 	ld a, acc8  
      009715 4C 88            [ 1] 1170 	and a,(RELOP,sp)
      009717 AE 96            [ 1] 1171 	jreq rel_exit
      009719 DC               [ 2] 1172 	cplw x 
      00971A CD 8A            [ 1] 1173 	ld a,#255 
      00971C 21 84            [ 2] 1174 	jra rel_exit   	
      00971E AE 95            [ 1] 1175 8$: ld a,(RELOP,sp)
      009720 82 72            [ 1] 1176 	jreq 10$ 
      001AE0                       1177 	_unget_token
      009722 5F 00 0E 48 72   [ 1]    1      mov in,in.saved  
      001AE5                       1178 10$:
      001AE5                       1179 	_xpop 
      009727 59 00            [ 1]    1     ld a,(y)
      009729 0E               [ 1]    2     ldw x,y 
      00972A C7 00            [ 2]    3     ldw x,(1,x)
      00972C 0F 72 BB 00      [ 2]    4     addw y,#CELL_SIZE 
      001AEE                       1180 rel_exit: 
      001AEE                       1181 	_drop VSIZE
      009730 0E FE            [ 2]    1     addw sp,#VSIZE 
      009732 CD               [ 4] 1182 	ret 
                                   1183 
                                   1184 ;--------------------------------------------
                                   1185 ; BASIC: HEX 
                                   1186 ; select hexadecimal base for integer print
                                   1187 ;---------------------------------------------
      001AF1                       1188 hex_base:
      009733 8A 21 CE 00      [ 1] 1189 	mov base,#16 
      009737 05               [ 4] 1190 	ret 
                                   1191 
                                   1192 ;--------------------------------------------
                                   1193 ; BASIC: DEC 
                                   1194 ; select decimal base for integer print
                                   1195 ;---------------------------------------------
      001AF6                       1196 dec_base:
      009738 C6 00 04 90      [ 1] 1197 	mov base,#10
      00973C 5F               [ 4] 1198 	ret 
                                   1199 
                                   1200 ;------------------------
                                   1201 ; BASIC: FREE 
                                   1202 ; return free size in RAM 
                                   1203 ; output:
                                   1204 ;   A:x		size 
                                   1205 ;--------------------------
      001AFB                       1206 free:
      00973D 90 02            [ 2] 1207 	pushw y 
      00973F CD               [ 1] 1208 	clr a 
      009740 87 20 CE         [ 2] 1209 	ldw x,#tib 
      009743 00 05 C6 00      [ 2] 1210 	ldw y,txtbgn 
      009747 02 CD 9F 23      [ 2] 1211 	cpw y,#app_space
      00974B AE 96            [ 1] 1212 	jrult 1$
      00974D FF CD 8A         [ 2] 1213 	subw x,#free_ram 
      009750 21 C6            [ 2] 1214 	jra 2$ 
      001B10                       1215 1$:	
      009752 00 03 5F 97      [ 2] 1216 	subw x,txtend
      009756 72 BB            [ 2] 1217 2$:	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009758 00               [ 4] 1218 	ret 
                                   1219 
                                   1220 ;------------------------------
                                   1221 ; BASIC: SIZE 
                                   1222 ; command that print 
                                   1223 ; program start addres and size 
                                   1224 ;------------------------------
      001B17                       1225 cmd_size:
      009759 05 F6 5F         [ 1] 1226 	push base 
      00975C 97 CD 98         [ 2] 1227 	ldw x,#PROG_ADDR 
      00975F 65 20 35         [ 4] 1228 	call puts 
      009762 CE 00 1B         [ 2] 1229 	ldw x,txtbgn     
      009762 88 AE 96 EE      [ 1] 1230 	mov base,#16 
      009766 CD 8A 21         [ 4] 1231 	call prt_i16
      009769 84 AE 95         [ 1] 1232 	pop base 
      00976C 82 72 5F         [ 2] 1233 	ldw x,#PROG_SIZE 
      00976F 00 0E 48         [ 4] 1234 	call puts 
      009772 72 59 00         [ 2] 1235 	ldw x,txtend 
      009775 0E C7 00 0F      [ 2] 1236 	subw x,txtbgn 
      009779 72 BB 00         [ 4] 1237 	call prt_i16
      00977C 0E FE CD         [ 2] 1238 	ldw x,#STR_BYTES 
      00977F 8A 21 AE         [ 4] 1239 	call puts  
      009782 16               [ 4] 1240 	ret 
                                   1241 
                                   1242 
                                   1243 ;------------------------
                                   1244 ; BASIC: UBOUND  
                                   1245 ; return array variable size 
                                   1246 ; and set 'array_size' variable 
                                   1247 ; output:
                                   1248 ;   A:X 	array_size
                                   1249 ;--------------------------
      001B44                       1250 ubound:
      009783 68 CD 8A         [ 4] 1251 	call free 
      009786 21 A6            [ 1] 1252 	ld a,#CELL_SIZE 
      009788 0D               [ 4] 1253 	mul x,a 
      009789 CD 89 C4         [ 2] 1254 	ldw array_size,x
      00978C CE               [ 1] 1255 	clr a 
      00978D 00               [ 4] 1256 	ret 
                                   1257 
                                   1258 ;-----------------------------
                                   1259 ; BASIC: LET var=expr 
                                   1260 ; variable assignement 
                                   1261 ; output:
                                   1262 ;   A 		TK_NONE 
                                   1263 ;-----------------------------
      001B4F                       1264 let::
      00978E 01 CD 8A         [ 4] 1265 	call next_token 
      009791 8E A6            [ 1] 1266 	cp a,#TK_VAR 
      009793 5E CD            [ 1] 1267 	jreq let_var
      009795 89 C4            [ 1] 1268 	cp a,#TK_ARRAY 
      009797 AE 17            [ 1] 1269 	jreq  let_array
      009799 FF 94 8F         [ 2] 1270 	jp syntax_error
      00979B                       1271 let_array:
      00979B CD 95 49         [ 4] 1272 	call get_array_element
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00979E 20 03            [ 2] 1273 	jra let_eval 
      001B62                       1274 let_var:
      00979E A6 0D CD         [ 4] 1275 	call get_addr
      001B65                       1276 let_eval:
      0097A1 89 C4 A6         [ 2] 1277 	ldw ptr16,x  ; variable address 
      0097A4 3E CD 89         [ 4] 1278 	call next_token 
      0097A7 C4 CD            [ 1] 1279 	cp a,#TK_EQUAL
      0097A9 8B 26            [ 1] 1280 	jreq 1$
      0097AB 72 5D 00         [ 2] 1281 	jp syntax_error
      001B72                       1282 1$:	
      0097AE 04 27 ED         [ 4] 1283 	call expression    
      0097B1 CD 91            [ 1] 1284 	cp a,#TK_INTGR 
      0097B3 4D 72            [ 1] 1285 	jreq 2$
      0097B5 5D 00 04         [ 2] 1286 	jp syntax_error
      001B7C                       1287 2$:	
      001B7C                       1288 	_xpop ; value 
      0097B8 27 E4            [ 1]    1     ld a,(y)
      0097BA 93               [ 1]    2     ldw x,y 
      0097BA C6 00            [ 2]    3     ldw x,(1,x)
      0097BC 02 C1 00 04      [ 2]    4     addw y,#CELL_SIZE 
      001B85                       1289 3$:
      0097C0 2B 1D 00 19      [ 4] 1290 	ld [ptr16],a
      0097C2 72 5C 00 1A      [ 1] 1291 	inc ptr8  
      0097C2 72 01 00 23      [ 5] 1292 	ldw [ptr16],x 
      0097C6 D7               [ 4] 1293 	ret 
                                   1294 
                                   1295 
                                   1296 ;--------------------------
                                   1297 ; return constant value 
                                   1298 ; from it's record address
                                   1299 ; input:
                                   1300 ;	X	*const record 
                                   1301 ; output:
                                   1302 ;   A:X   const  value
                                   1303 ;--------------------------
      001B92                       1304 get_const_value: ; -- i 
      0097C7 CE               [ 1] 1305 	ld a,(x) ; record size 
      0097C8 00 05            [ 1] 1306 	sub a,#3 ; * value 
      0097CA 72               [ 1] 1307 	push a 
      0097CB BB 00            [ 1] 1308 	push #0 
      0097CD 01 C3 00         [ 2] 1309 	addw x,(1,sp)
      0097D0 1E               [ 1] 1310 	ld a,(x)
      0097D1 2A C8            [ 2] 1311 	ldw x,(1,x)
      001B9E                       1312 	_drop 2
      0097D3 CF 00            [ 2]    1     addw sp,#2 
      0097D5 05               [ 4] 1313 	ret 
                                   1314 
                                   1315 
                                   1316 ;--------------------------
                                   1317 ; list constants in EEPROM 
                                   1318 ; call when using LIST \C 
                                   1319 ;-------------------------
                           000001  1320 	COUNT=1
                           000003  1321 	YTEMP=3
                           000004  1322 	VSIZE=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      001BA1                       1323 list_const:
      0097D6 E6 02            [ 2] 1324 	pushw y 
      001BA3                       1325 	_vars 4 
      0097D8 C7 00            [ 2]    1     sub sp,#4 
      0097DA 04               [ 1] 1326 	clrw x 
      0097DB 35 03            [ 2] 1327 	ldw (COUNT,sp),x  
      0097DD 00 02 40 00      [ 2] 1328 	ldw Y,#EEPROM_BASE 
      0097DF 90 C3 00 24      [ 2] 1329 1$:	cpw y,free_eeprom 
      0097DF CD 98            [ 1] 1330 	jruge 9$
      0097E1 10 A1            [ 2] 1331     ldw (YTEMP,sp),y 
      0097E3 00               [ 1] 1332 	ldw x,y
      0097E4 27               [ 1] 1333 	incw x 
      0097E5 DC A1 80         [ 4] 1334 	call puts  
      0097E8 26 06            [ 1] 1335 	ld a,#'= 
      0097EA CD 98 29         [ 4] 1336 	call putc 
      0097ED FD 20            [ 2] 1337 	ldw x,(YTEMP,sp)
      0097EF EF 1B 92         [ 4] 1338 	call get_const_value 
      0097F0 C7 00 0C         [ 1] 1339 	ld acc24,a 
      0097F0 A1 85 26         [ 2] 1340 	ldw acc16,x 
      0097F3 05 CD 9B         [ 4] 1341 	call prt_acc24
      0097F6 E2 20            [ 1] 1342 	ld a,#CR 
      0097F8 E6 09 44         [ 4] 1343 	call putc 
      0097F9 1E 01            [ 2] 1344 	ldw x,(COUNT,sp)
      0097F9 A1               [ 1] 1345 	incw x 
      0097FA 05 26            [ 2] 1346 	ldw (COUNT,sp),x 
      0097FC 05 CD 9B DD      [ 1] 1347 	clr acc16 
      009800 20 DD            [ 2] 1348 	ldw y,(YTEMP,sp)
      009802 90 F6            [ 1] 1349 	ld a,(y)
      009802 A1 0A 27         [ 1] 1350 	ld acc8,a
      009805 D9 A1 03 CD      [ 2] 1351 	addw y,acc16 
      009809 98 36            [ 2] 1352 	jra 1$ 
      001BE7                       1353 9$:	
      00980B 20 D2            [ 2] 1354 	ldw x,(COUNT,sp)
      00980D CC 97 0F         [ 4] 1355 	call prt_i16 
      009810 AE 1B F7         [ 2] 1356 	ldw x,#CONST_COUNT 
      009810 C6 00 02         [ 4] 1357 	call puts 
      001BF2                       1358 	_drop VSIZE 
      009813 C7 00            [ 2]    1     addw sp,#VSIZE 
      009815 03 C0            [ 2] 1359 	popw y 
      009817 00               [ 4] 1360 	ret 
                                   1361 
      009818 04 27 0D 6E 73 74 61  1362 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1363 
                                   1364 
                                   1365 ;--------------------------
                                   1366 ; BASIC: EEFREE 
                                   1367 ; eeprom_free 
                                   1368 ; search end of data  
                                   1369 ; in EEPROM 
                                   1370 ; input:
                                   1371 ;    none 
                                   1372 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1373 ;    A:X     address free
                                   1374 ;-------------------------
      00981B                       1375 func_eefree:
      00981B CE 00 05         [ 2] 1376 	ldw x,#EEPROM_BASE 
      00981E 72 BB 00 01      [ 1] 1377 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009822 F6 5C 72         [ 2] 1378     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009825 5C 00            [ 1] 1379 	jruge 8$ ; no free space 
      009827 02               [ 1] 1380 2$: ld a,(x)
      009828 81 0C            [ 1] 1381 	jrne 3$
      009829 5C               [ 1] 1382 	incw x 
      009829 FE DE B3 1A      [ 1] 1383 	dec acc8 
      00982D 26 F6            [ 1] 1384 	jrne 2$
      00982D 72 5C 00         [ 2] 1385 	subw x,#8 
      009830 02 72            [ 2] 1386 	jra 9$  
      009832 5C               [ 1] 1387 3$: ld a,(x)
      009833 00               [ 1] 1388 	incw x
      009834 02               [ 1] 1389 	tnz a  
      009835 81 FB            [ 1] 1390 	jrne 3$
      009836 5A               [ 2] 1391 	decw x   
      009836 F6 27            [ 2] 1392 	jra 1$ 
      009838 03               [ 1] 1393 8$: clrw x ; no free space 
      009839 5C               [ 1] 1394 9$: clr a 
      00983A 20 FA 5C         [ 2] 1395 	ldw free_eeprom,x ; save in system variable 
      00983D 72               [ 4] 1396 	ret 
                                   1397 
                           000005  1398 CONST_REC_XTRA_BYTES=5 
                                   1399 ;--------------------------
                                   1400 ; search constant name 
                                   1401 ; format of constant record  
                                   1402 ;   .byte record length 
                                   1403 ;         = strlen(name)+5 
                                   1404 ;   .asciz name (variable length)
                                   1405 ;   .int24 value (3 bytes )
                                   1406 ; a constant record use 7+ bytes
                                   1407 ; constants are saved in EEPROM  
                                   1408 ; input:
                                   1409 ;    X     *name
                                   1410 ; output:
                                   1411 ;    X     address|0
                                   1412 ; use:
                                   1413 ;   A,Y, acc16 
                                   1414 ;-------------------------
                           000001  1415 	NAMEPTR=1 ; target name pointer 
                           000003  1416 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1417 	RECLEN=5  ; record length of target
                           000005  1418 	VSIZE=5
      001C36                       1419 search_const:
      00983E B0 00            [ 2] 1420 	pushw y 
      001C38                       1421 	_vars VSIZE
      009840 05 CF            [ 2]    1     sub sp,#VSIZE 
      009842 00 01 81 0D      [ 1] 1422 	clr acc16 
      009845 CD 13 D3         [ 4] 1423 	call strlen 
      009845 FE 72            [ 1] 1424 	add a,#CONST_REC_XTRA_BYTES
      009847 5C 00            [ 1] 1425 	ld (RECLEN,sp),a    
      009849 02 72            [ 2] 1426 	ldw (NAMEPTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00984B 5C 00 02 81      [ 2] 1427 	ldw y,#EEPROM_BASE 
      00984F 1E 01            [ 2] 1428 1$:	ldw x,(NAMEPTR,sp)
      00984F F6 EE            [ 2] 1429 	ldw (EEPTR,sp),y
      009851 01 72 5C 00      [ 2] 1430 	cpw y, free_eeprom 
      009855 02 72            [ 1] 1431 	jruge 7$ ; no match found 
      009857 5C 00            [ 1] 1432 	ld a,(y)
      009859 02 72            [ 1] 1433 	cp a,(RECLEN,sp)
      00985B 5C 00            [ 1] 1434 	jrne 2$ 
      00985D 02 81            [ 1] 1435 	incw y 
      00985F CD 13 DE         [ 4] 1436 	call strcmp
      00985F F6 72            [ 1] 1437 	jrne 8$ ; match found 
      001C62                       1438 2$: ; skip this one 	
      009861 5C 00            [ 2] 1439 	ldW Y,(EEPTR,sp)
      009863 02 81            [ 1] 1440 	ld a,(y)
      009865 C7 00 0E         [ 1] 1441 	ld acc8,a 
      009865 72 5F 00 0D      [ 2] 1442 	addw y,acc16 
      009869 CF 00            [ 2] 1443 	jra 1$  
      001C6F                       1444 7$: ; no match found 
      00986B 0E A6            [ 1] 1445 	clr (EEPTR,sp)
      00986D 10 C1            [ 1] 1446 	clr (EEPTR+1,sp)
      001C73                       1447 8$: ; match found 
      00986F 00 0B            [ 2] 1448 	ldw x,(EEPTR,sp) ; record address 
      001C75                       1449 9$:	_DROP VSIZE
      009871 27 09            [ 2]    1     addw sp,#VSIZE 
      009873 72 0F            [ 2] 1450 	 popw y 
      009875 00               [ 4] 1451 	 ret 
                                   1452 
                                   1453 
                                   1454 ;--------------------------------------------
                                   1455 ; BASIC: CONST name=value [, name=value]*
                                   1456 ; define constant(s) saved in EEPROM
                                   1457 ;--------------------------------------------
                           000001  1458 	CNAME=1 
                           000003  1459 	BUFPTR=3
                           000005  1460 	RECLEN=5
                           000006  1461 	UPDATE=6
                           000007  1462 	YSAVE=7
                           000008  1463 	VSIZE=8 
      001C7A                       1464 cmd_const:
      009876 0E 04            [ 2] 1465 	pushw y 
      001C7C                       1466 	_vars VSIZE 
      009878 72 53            [ 2]    1     sub sp,#VSIZE 
      00987A 00 0D            [ 1] 1467 	clr (UPDATE,sp)
      00987C CD 17 90         [ 4] 1468 	call next_token 
      00987C A6 FF            [ 1] 1469 	cp a,#TK_CHAR 
      00987E CD 98            [ 1] 1470 	jrne 0$
      009880 A2 CD 91         [ 4] 1471 	call get_char 
      009883 F4 88            [ 1] 1472 	and a,#0xDF 
      009885 CD 8A            [ 1] 1473 	cp a,#'U 
      009887 21 84            [ 1] 1474 	jrne 1$
      009889 81 06            [ 1] 1475 	cpl (UPDATE,sp)
      00988A 20 07            [ 2] 1476 	jra const_loop 
      00988A 90 F6            [ 1] 1477 0$: cp a,#TK_LABEL 
      00988C 93 EE            [ 1] 1478 	jreq cloop_1
      00988E 01 72 A9         [ 2] 1479 1$: jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      001C9B                       1480 const_loop: 
      009891 00 03            [ 1] 1481 	ld a,#TK_LABEL 
      009893 C7 00 0D         [ 4] 1482 	call expect  
      001CA0                       1483 cloop_1: 
      009896 CF 00            [ 2] 1484 	ldw (CNAME,sp),x ; *const_name
      009898 0E CD 98         [ 4] 1485 	call skip_string
      00989B 7C A6            [ 2] 1486 	ldw x,(CNAME,sp)
      00989D 20 CD 89         [ 4] 1487 	call strlen  
      0098A0 C4 81            [ 1] 1488 	add a,#CONST_REC_XTRA_BYTES 
      0098A2 6B 05            [ 1] 1489 	ld (RECLEN,sp),a 
                                   1490 ; copy name in buffer  
      0098A2 52 04            [ 2] 1491 	ldw y,(CNAME,sp) 
      0098A4 0F 02 0F         [ 2] 1492 	ldw x,#tib  
      0098A7 01 4D            [ 1] 1493 	ld a,(RECLEN,sp)
      0098A9 27               [ 1] 1494 	ld (x),a 
      0098AA 11               [ 1] 1495 	incw x  
      0098AB C6 00 0B         [ 4] 1496 	call strcpy 
      0098AE A1 0A            [ 2] 1497 	ldw (BUFPTR,sp),x 
                                   1498 ; x not updated by strcpy 
                                   1499 ; BUFPTR must be incremented 
                                   1500 ; to point after name 
      0098B0 26               [ 1] 1501 	clrw x 
      0098B1 0A 72            [ 1] 1502 	ld a,(RECLEN,sp)
      0098B3 0F 00            [ 1] 1503 	sub a,#CONST_REC_XTRA_BYTES-1
      0098B5 0D               [ 1] 1504 	ld xl,a  
      0098B6 05 03 01         [ 2] 1505 	addw x,(BUFPTR,sp)
      0098B9 CD 82            [ 2] 1506 	ldw (BUFPTR,sp),x 
      0098BB 8D 32            [ 1] 1507 	ld a,#TK_EQUAL 
      0098BC CD 19 3E         [ 4] 1508 	call expect 
      0098BC AE 16            [ 2] 1509 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0098BE 68 1C 00         [ 4] 1510 	call expression 
      0098C1 50 5A            [ 1] 1511 	cp a,#TK_INTGR 
      0098C3 7F 03            [ 1] 1512 	jreq 5$ 
      0098C4 CC 16 8F         [ 2] 1513 	jp syntax_error 
      001CD8                       1514 5$:	_xpop 
      0098C4 C6 00            [ 1]    1     ld a,(y)
      0098C6 0B               [ 1]    2     ldw x,y 
      0098C7 CD 83            [ 2]    3     ldw x,(1,x)
      0098C9 89 AB 30 A1      [ 2]    4     addw y,#CELL_SIZE 
      0098CD 3A 2B            [ 2] 1515 	ldw (YSAVE,sp),y ; save xtack pointer 
      0098CF 02 AB            [ 2] 1516 	ldw y,(BUFPTR,sp)
      0098D1 07 F7            [ 1] 1517 	ld (y),a 
      0098D2 90 EF 01         [ 2] 1518 	ldw (1,y),x 
                                   1519 ; record completed in buffer 
                                   1520 ; check if constant already exist 
                                   1521 ; if exist and \U option then update  
      0098D2 5A F7 0C 02      [ 1] 1522 	clr farptr 
      0098D6 C6 00            [ 2] 1523 	ldw x,(CNAME,sp)
      0098D8 0D CA 00         [ 4] 1524 	call search_const 
      0098DB 0E               [ 2] 1525 	tnzw x 
      0098DC CA 00            [ 1] 1526 	jreq 6$ ; new constant  
      0098DE 0F 26            [ 1] 1527 	tnz (UPDATE,sp)
      0098E0 E3 C6            [ 1] 1528 	jreq 8$ 
      0098E2 00 0B            [ 2] 1529 	jra 7$	
      001CFC                       1530 6$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0098E4 A1 10 27         [ 2] 1531 	ldw x,free_eeprom  
      001CFF                       1532 7$:	
      0098E7 08 7B 01         [ 2] 1533 	ldw farptr+1,x 
      0098EA 27 0A A6         [ 2] 1534 	ldw x,#tib 
      0098ED 2D 20            [ 1] 1535 	ld a,(RECLEN,sp)
      0098EF 02 08 85         [ 4] 1536 	call write_nbytes
                                   1537 ; update free_eeprom 
      0098F0 5F               [ 1] 1538 	clrw x 
      0098F0 A6 24            [ 1] 1539 	ld a,(RECLEN,sp)
      0098F2 5A               [ 1] 1540 	ld xl,a 
      0098F3 F7 0C 02 24      [ 2] 1541 	addw x,free_eeprom 
      0098F6 CF 00 24         [ 2] 1542 	ldw free_eeprom,x
      001D15                       1543 8$: ; check for next constant 
      0098F6 7B 02 5B         [ 4] 1544 	call next_token 
      0098F9 04 81            [ 1] 1545 	cp a,#TK_COMMA 
      0098FB 26 03            [ 1] 1546 	jrne 9$ ; no other constant 
      0098FB A1 61 2A         [ 2] 1547 	jp const_loop 
      001D1F                       1548 9$: 
      001D1F                       1549 	_unget_token    
      0098FE 01 81 A1 7A 22   [ 1]    1      mov in,in.saved  
      001D24                       1550 10$: 
      001D24                       1551 	_drop VSIZE 
      009903 FB A0            [ 2]    1     addw sp,#VSIZE 
      009905 20 81            [ 2] 1552 	popw y ; restore xstack pointer 
      009907 81               [ 4] 1553 	ret 
                                   1554 
                                   1555 
                                   1556 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1557 ; return program size 
                                   1558 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001D29                       1559 prog_size:
      009907 89 52 03         [ 2] 1560 	ldw x,txtend 
      00990A 72 5F 00 0D      [ 2] 1561 	subw x,txtbgn 
      00990E 72               [ 4] 1562 	ret 
                                   1563 
                                   1564 ;----------------------------
                                   1565 ; print program information 
                                   1566 ;---------------------------
      001D31                       1567 program_info: 
      00990F 5F 00 0E         [ 2] 1568 	ldw x,#PROG_ADDR 
      009912 72 5F 00         [ 4] 1569 	call puts 
      009915 0F 0F 01         [ 2] 1570 	ldw x,txtbgn 
      009918 A6 0A 6B 02      [ 1] 1571 	mov base,#16 
      00991C F6 27 47         [ 4] 1572 	call prt_i16
      00991F A1 2D 26 04      [ 1] 1573 	mov base,#10  
      009923 03 01 20         [ 2] 1574 	ldw x,#PROG_SIZE
      009926 08 A1 24         [ 4] 1575 	call puts 
      009929 26 06 A6         [ 4] 1576 	call prog_size 
      00992C 10 6B 02         [ 4] 1577 	call prt_i16 
      00992F 5C F6 93         [ 2] 1578 	ldw x,#STR_BYTES 
      009931 CD 09 A1         [ 4] 1579 	call puts
      009931 A1 61 2B         [ 2] 1580 	ldw x,txtbgn
      009934 02 A0 20         [ 2] 1581 	cpw x,#app 
      009937 A1 30            [ 1] 1582 	jrult 2$
      009939 2B 2B A0         [ 2] 1583 	ldw x,#FLASH_MEM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00993C 30 A1            [ 2] 1584 	jra 3$
      00993E 0A 2B 06         [ 2] 1585 2$: ldw x,#RAM_MEM 	 
      009941 A0 07 11         [ 4] 1586 3$:	call puts 
      009944 02 2A            [ 1] 1587 	ld a,#CR 
      009946 1F 6B 03         [ 4] 1588 	call putc
      009949 7B               [ 4] 1589 	ret 
                                   1590 
      00994A 02 CD 82 AA 7B 03 CB  1591 PROG_ADDR: .asciz "program address: "
             00 0F C7 00 0F 4F C9
             00 0E C7 00
      00995C 0E 4F C9 00 0D C7 00  1592 PROG_SIZE: .asciz ", program size: "
             0D 20 C9 0D 01 27 03
             CD 82 8D
      00996D 20 62 79 74 65 73 00  1593 STR_BYTES: .asciz " bytes" 
      00996D 5B 03 85 81 46 4C 41  1594 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009971 20 69 6E 20 52 41 4D  1595 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1596 
                                   1597 
                                   1598 ;----------------------------
                                   1599 ; BASIC: LIST [[start][,end]]
                                   1600 ; list program lines 
                                   1601 ; form start to end 
                                   1602 ; if empty argument list then 
                                   1603 ; list all.
                                   1604 ;----------------------------
                           000001  1605 	FIRST=1
                           000003  1606 	LAST=3 
                           000005  1607 	LN_PTR=5
                           000006  1608 	VSIZE=6 
      001DBA                       1609 list:
      009971 52 05 17 04 05   [ 2] 1610 	btjf flags,#FRUN,0$
      009975 A6 07            [ 1] 1611 	ld a,#ERR_CMD_ONLY
      009975 1F 02 F6         [ 2] 1612 	jp tb_error
      001DC4                       1613 0$:	 
      009978 A4 0F 6B         [ 4] 1614 	call next_token 
      00997B 01 16            [ 1] 1615 	cp a,#TK_CHAR 
      00997D 04 5C            [ 1] 1616 	jrne 2$
      00997F CD 17 DF         [ 4] 1617 	call get_char 
      00997F 90 F6            [ 1] 1618 	and a,#0xDF 
      009981 27 1B            [ 1] 1619 	cp a,#'C 
      009983 0D 01            [ 1] 1620 	jrne 1$
      009985 27 0A F1         [ 4] 1621 	call list_const
      009988 26               [ 4] 1622 	ret 
      009989 07 90 5C         [ 2] 1623 1$: jp syntax_error 
      001DDB                       1624 2$:	_unget_token 
      00998C 5C 0A 01 20 EE   [ 1]    1      mov in,in.saved  
      009991 CD 1D 29         [ 4] 1625 	call prog_size 
      009991 1E 02            [ 1] 1626 	jrugt 3$
      009993 1D               [ 4] 1627 	ret 
      001DE6                       1628 3$: _vars VSIZE
      009994 00 02            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009996 4B 00 FE         [ 2] 1629 	ldw x,txtbgn 
      009999 84 27            [ 2] 1630 	ldw (LN_PTR,sp),x 
      00999B 1F               [ 2] 1631 	ldw x,(x) 
      00999C 20 D7            [ 2] 1632 	ldw (FIRST,sp),x ; list from first line 
      00999E AE 7F FF         [ 2] 1633 	ldw x,#MAX_LINENO ; biggest line number 
      00999E 1E 02            [ 2] 1634 	ldw (LAST,sp),x 
      0099A0 F6 6B 01         [ 4] 1635 	call arg_list
      0099A3 A4               [ 1] 1636 	tnz a
      0099A4 0F 4C            [ 1] 1637 	jreq list_loop 
      0099A6 C7 00            [ 1] 1638 	cp a,#2 
      0099A8 0F 72            [ 1] 1639 	jreq 4$
      0099AA 5F 00            [ 1] 1640 	cp a,#1 
      0099AC 0E 72            [ 1] 1641 	jreq first_line 
      0099AE BB 00 0E         [ 2] 1642 	jp syntax_error 
      0099B1 FE               [ 2] 1643 4$:	popw x 
      0099B2 7B 01            [ 2] 1644 	ldw (LAST+2,sp),x 
      001E09                       1645 first_line:
      0099B4 4E               [ 2] 1646 	popw x
      0099B5 A4 0C            [ 2] 1647 	ldw (FIRST,sp),x 
      001E0C                       1648 lines_skip:
      0099B7 44 44 AB         [ 2] 1649 	ldw x,txtbgn
      0099BA 80 05            [ 2] 1650 2$:	ldw (LN_PTR,sp),x 
      0099BB C3 00 1D         [ 2] 1651 	cpw x,txtend 
      0099BB 5B 05            [ 1] 1652 	jrpl list_exit 
      0099BD 81               [ 2] 1653 	ldw x,(x) ;line# 
      0099BE 13 01            [ 2] 1654 	cpw x,(FIRST,sp)
      0099BE 88 CD            [ 1] 1655 	jrpl list_loop 
      0099C0 98 10            [ 2] 1656 	ldw x,(LN_PTR,sp) 
      0099C2 11 01            [ 1] 1657 	ld a,(2,x)
      0099C4 27 03 CC         [ 1] 1658 	ld acc8,a 
      0099C7 97 0F 84 81      [ 1] 1659 	clr acc16 
      0099CB 72 BB 00 0D      [ 2] 1660 	addw x,acc16
      0099CB A6 06            [ 2] 1661 	jra 2$ 
                                   1662 ; print loop
      001E2C                       1663 list_loop:
      0099CD CD 99            [ 2] 1664 	ldw x,(LN_PTR,sp)
      0099CF BE 02            [ 1] 1665 	ld a,(2,x) 
      0099D0 CD 1E A3         [ 4] 1666 	call prt_basic_line
      0099D0 4B 00            [ 2] 1667 	ldw x,(LN_PTR,sp)
      0099D2 CD 9A            [ 1] 1668 	ld a,(2,x)
      0099D4 E8 A1 00         [ 1] 1669 	ld acc8,a 
      0099D7 27 1A A1 84      [ 1] 1670 	clr acc16 
      0099DB 26 0D 00 0D      [ 2] 1671 	addw x,acc16
      0099DD C3 00 1D         [ 2] 1672 	cpw x,txtend 
      0099DD 0C 01            [ 1] 1673 	jrpl list_exit
      0099DF CD 98            [ 2] 1674 	ldw (LN_PTR,sp),x
      0099E1 10               [ 2] 1675 	ldw x,(x)
      0099E2 A1 08            [ 2] 1676 	cpw x,(LAST,sp)  
      0099E4 27 EC            [ 1] 1677 	jrslt list_loop
      001E4E                       1678 list_exit:
      0099E6 A1 00 27 09 A1   [ 1] 1679 	mov in,count 
      0099EB 07 27 05         [ 2] 1680 	ldw x,#pad 
      0099EE 55 00 03         [ 2] 1681 	ldw basicptr,x 
      001E59                       1682 	_drop VSIZE 
      0099F1 00 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099F3 84 81 31         [ 4] 1683 	call program_info 
      0099F5 81               [ 4] 1684 	ret
                                   1685 
                                   1686 
                                   1687 ;--------------------------
                                   1688 ; BASIC: EDIT 
                                   1689 ;  copy program in FLASH 
                                   1690 ;  to RAM for edition 
                                   1691 ;-------------------------
      001E5F                       1692 edit:
      0099F5 CD 99 CB         [ 4] 1693 	call qsign 
      0099F8 A1 01            [ 1] 1694 	jreq 1$ 
      0099FA 27 03 CC         [ 2] 1695 	ldw x,#NOT_SAVED 
      0099FD 97 0F 90         [ 4] 1696 	call puts 
      009A00 F6               [ 4] 1697 	ret 
      001E6B                       1698 1$: 
      009A01 93 EE 01 72      [ 2] 1699 	ldw y,#app_sign ; source address 
      009A05 A9 00 03         [ 2] 1700     ldw x,app_size  
      009A08 C3 00 21         [ 2] 1701 	addw x,#4 
      009A0B 23 05 A6         [ 2] 1702 	ldw acc16,x  ; bytes to copy 
      009A0E 0A CC 97         [ 2] 1703 	ldw x,#rsign ; destination address 
      009A11 11 5D 27         [ 4] 1704 	call move  
      009A14 F8 89 58         [ 2] 1705 	ldw x,#free_ram 
      009A17 72 FB 01         [ 2] 1706 	ldw txtbgn,x 
      009A1A 1F 01 AE 16      [ 2] 1707 	addw x,rsize  
      009A1E 68 72 F0         [ 2] 1708 	ldw txtend,x 
      009A21 01               [ 4] 1709 	ret 
                                   1710 
      009A22 5B 02 81 61 70 70 6C  1711 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1712 
                                   1713 
                                   1714 ;--------------------------
                                   1715 ; decompile line from token list
                                   1716 ; and print it. 
                                   1717 ; input:
                                   1718 ;   A       stop at this position 
                                   1719 ;   X 		pointer at line
                                   1720 ; output:
                                   1721 ;   none 
                                   1722 ;--------------------------	
      009A25                       1723 prt_basic_line:
      009A25 52 01            [ 2] 1724 	pushw y 
      009A27 0F 01 CD         [ 1] 1725 	ld count,a 
      009A2A 98 10            [ 1] 1726 	ld a,(2,x)
      009A2C A1 10 27         [ 1] 1727 	cp a,count 
      009A2F 06 A1            [ 1] 1728 	jrpl 1$ 
      009A31 11 26 05         [ 1] 1729 	ld count,a 
      009A34 03 01 04         [ 2] 1730 1$:	ldw basicptr,x 
      009A36 90 AE 16 68      [ 2] 1731 	ldw y,#tib  
      009A36 CD 98 10         [ 4] 1732 	call decompile 
      009A39 CD 09 A1         [ 4] 1733 	call puts 
      009A39 A1 81            [ 1] 1734 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A3B 26 06 CD         [ 4] 1735 	call putc 
      009A3E 98 29            [ 2] 1736 	popw y 
      009A40 FD               [ 4] 1737 	ret 
                                   1738 
                                   1739 
                                   1740 ;---------------------------------
                                   1741 ; BASIC: PRINT|? arg_list 
                                   1742 ; print values from argument list
                                   1743 ;----------------------------------
                           000001  1744 	CCOMMA=1
                           000001  1745 	VSIZE=1
      001EC7                       1746 print:
      001EC7                       1747 	_vars VSIZE 
      009A41 20 58            [ 2]    1     sub sp,#VSIZE 
      009A43                       1748 reset_comma:
      009A43 A1 84            [ 1] 1749 	clr (CCOMMA,sp)
      001ECB                       1750 prt_loop:
      009A45 26 05 CD         [ 4] 1751 	call next_token
      009A48 98 4F            [ 1] 1752 	cp a,#CMD_END 
      009A4A 20 4F            [ 1] 1753 	jrult 0$
      009A4C A1 0A            [ 1] 1754 	cp a,#TK_COLON 
      009A4C A1 05            [ 1] 1755 	jreq 0$
      009A4E 26 05            [ 1] 1756 	cp a,#TK_CMD
      009A50 CD 99            [ 1] 1757 	jrne 10$
      001EDA                       1758 0$:
      001EDA                       1759 	_unget_token 
      009A52 F5 20 07 00 01   [ 1]    1      mov in,in.saved  
      009A55 20 5A            [ 2] 1760 	jra print_exit 
      001EE1                       1761 10$:	
      009A55 A1 85            [ 1] 1762 	cp a,#TK_QSTR
      009A57 26 08            [ 1] 1763 	jreq 1$
      009A59 CD 98            [ 1] 1764 	cp a,#TK_CHAR 
      009A5B 45 1B            [ 1] 1765 	jreq 2$ 
      009A5C A1 82            [ 1] 1766 	cp a,#TK_CFUNC 
      009A5C F6 EE            [ 1] 1767 	jreq 3$
      009A5E 01 20            [ 1] 1768 	cp a,#TK_COMMA 
      009A60 3A 24            [ 1] 1769 	jreq 4$
      009A61 A1 09            [ 1] 1770 	cp a,#TK_SHARP 
      009A61 A1 03            [ 1] 1771 	jreq 5$
      009A63 26 10            [ 2] 1772 	jra 7$ 
      001EF7                       1773 1$:	; print string 
      009A65 89 CD 98         [ 4] 1774 	call puts
      009A68 36               [ 1] 1775 	incw x
      009A69 85 CD 9C B6      [ 2] 1776 	subw x,basicptr 
      009A6D 5D 27 28         [ 2] 1777 	ldw in.w,x  
      009A70 CD 9C            [ 2] 1778 	jra reset_comma
      001F04                       1779 2$:	; print character 
      009A72 12 20 26         [ 4] 1780 	call get_char 
      009A75 CD 09 44         [ 4] 1781 	call putc 
      009A75 A1 82            [ 2] 1782 	jra reset_comma 
      001F0C                       1783 3$: ; print character function value  	
      009A77 26 08 CD         [ 4] 1784 	call get_code_addr 
      009A7A 98               [ 4] 1785 	call (x)
      009A7B 29 FD 5F         [ 4] 1786 	call putc
      009A7E 02 20            [ 2] 1787 	jra reset_comma 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      001F15                       1788 4$: ; set comma state 
      009A80 1A 01            [ 1] 1789 	cpl (CCOMMA,sp)
      009A81 20 B2            [ 2] 1790 	jra prt_loop   
      001F19                       1791 5$: ; # character must be followed by an integer   
      009A81 A1 06 26         [ 4] 1792 	call next_token
      009A84 13 CD            [ 1] 1793 	cp a,#TK_INTGR 
      009A86 9A E8            [ 1] 1794 	jreq 6$
      009A88 A6 07 CD         [ 2] 1795 	jp syntax_error 
      001F23                       1796 6$: ; set tab width
      009A8B 99 BE 90         [ 4] 1797 	call get_int24 
      009A8E F6               [ 1] 1798 	ld a,xl 
      009A8F 93 EE            [ 1] 1799 	and a,#15 
      009A91 01 72 A9         [ 1] 1800 	ld tab_width,a 
      009A94 00 03            [ 2] 1801 	jra reset_comma 
      001F2E                       1802 7$:	
      001F2E                       1803 	_unget_token 
      009A96 20 03 02 00 01   [ 1]    1      mov in,in.saved  
      009A98 CD 1A 68         [ 4] 1804 	call expression  
      009A98 CC 97 0F         [ 4] 1805     call print_top
      009A9B 20 8E            [ 2] 1806 	jra reset_comma 
      001F3B                       1807 print_exit:
      009A9B 0D 01            [ 1] 1808 	tnz (CCOMMA,sp)
      009A9D 27 03            [ 1] 1809 	jrne 9$
      009A9F CD 82            [ 1] 1810 	ld a,#CR 
      009AA1 85 09 44         [ 4] 1811     call putc 
      009AA2                       1812 9$:	_drop VSIZE 
      009AA2 72 A2            [ 2]    1     addw sp,#VSIZE 
      009AA4 00               [ 4] 1813 	ret 
                                   1814 
                                   1815 ;----------------------
                                   1816 ; 'save_context' and
                                   1817 ; 'rest_context' must be 
                                   1818 ; called at the same 
                                   1819 ; call stack depth 
                                   1820 ; i.e. SP must have the 
                                   1821 ; save value at  
                                   1822 ; entry point of both 
                                   1823 ; routine. 
                                   1824 ;---------------------
                           000004  1825 	CTXT_SIZE=4 ; size of saved data 
                                   1826 ;--------------------
                                   1827 ; save current BASIC
                                   1828 ; interpreter context 
                                   1829 ; on stack 
                                   1830 ;--------------------
      001F47                       1831 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001F47                       1832 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001F47                       1833 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001F47                       1834 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001F47                       1835 save_context:
      009AA5 03 90 F7         [ 2] 1836 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009AA8 90 EF            [ 2] 1837 	ldw (BPTR,sp),x
      009AAA 01 5B 01         [ 1] 1838 	ld a,in 
      009AAD 81 05            [ 1] 1839 	ld (IN,sp),a
      009AAE C6 00 03         [ 1] 1840 	ld a,count 
      009AAE 52 01            [ 1] 1841 	ld (CNT,sp),a  
      009AB0 CD               [ 4] 1842 	ret
                                   1843 
                                   1844 ;-----------------------
                                   1845 ; restore previously saved 
                                   1846 ; BASIC interpreter context 
                                   1847 ; from stack 
                                   1848 ;-------------------------
      001F57                       1849 rest_context:
      009AB1 9A 25            [ 2] 1850 	ldw x,(BPTR,sp)
      009AB3 CF 00 04         [ 2] 1851 	ldw basicptr,x 
      009AB3 CD 98            [ 1] 1852 	ld a,(IN,sp)
      009AB5 10 6B 01         [ 1] 1853 	ld in,a
      009AB8 A1 02            [ 1] 1854 	ld a,(CNT,sp)
      009ABA 25 24 A4         [ 1] 1855 	ld count,a  
      009ABD 30               [ 4] 1856 	ret
                                   1857 
                                   1858 
                                   1859 
                                   1860 ;------------------------------------------
                                   1861 ; BASIC: INPUT [string]var[,[string]var]
                                   1862 ; input value in variables 
                                   1863 ; [string] optionally can be used as prompt 
                                   1864 ;-----------------------------------------
                           000001  1865 	CX_BPTR=1
                           000003  1866 	CX_IN=3
                           000004  1867 	CX_CNT=4
                           000005  1868 	SKIP=5
                           000005  1869 	VSIZE=5
      001F67                       1870 input_var:
      009ABE A1 20            [ 2] 1871 	pushw y 
      001F69                       1872 	_vars VSIZE 
      009AC0 27 02            [ 2]    1     sub sp,#VSIZE 
      001F6B                       1873 input_loop:
      009AC2 20 1C            [ 1] 1874 	clr (SKIP,sp)
      009AC4 CD 17 90         [ 4] 1875 	call next_token 
      009AC4 CD 9A            [ 1] 1876 	cp a,#TK_QSTR 
      009AC6 25 10            [ 1] 1877 	jrne 1$ 
      009AC7 CD 09 A1         [ 4] 1878 	call puts 
      009AC7 7B               [ 1] 1879 	incw x 
      009AC8 01 A1 20 26      [ 2] 1880 	subw x,basicptr 
      009ACC 05 CD 82         [ 2] 1881 	ldw in.w,x 
      009ACF DD 20            [ 1] 1882 	cpl (SKIP,sp)
      009AD1 E1 A1 21         [ 4] 1883 	call next_token 
      009AD4 26 05            [ 1] 1884 1$: cp a,#TK_VAR  
      009AD6 CD 83            [ 1] 1885 	jreq 2$ 
      009AD8 A7 20 D8         [ 2] 1886 	jp syntax_error
      009ADB CD 17 C5         [ 4] 1887 2$:	call get_addr
      009ADB CD 84 55         [ 2] 1888 	ldw ptr16,x 
      009ADE 20 D3            [ 1] 1889 	tnz (SKIP,sp)
      009AE0 26 06            [ 1] 1890 	jrne 21$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009AE0 55 00 03         [ 4] 1891 	call var_name 
      009AE3 00 02 44         [ 4] 1892 	call putc   
      009AE5                       1893 21$:
      009AE5 A6 3A            [ 1] 1894 	ld a,#':
      009AE5 5B 01 81         [ 4] 1895 	call putc 
      009AE8 CD 1F 47         [ 4] 1896 	call save_context 
      009AE8 52 01 CD 9A      [ 1] 1897 	clr count  
      009AEC AE 0A A6         [ 4] 1898 	call readln 
      009AED AE 16 68         [ 2] 1899 	ldw x,#tib 
      009AED CD 98 10         [ 1] 1900 	push count
      009AF0 6B 01            [ 1] 1901 	push #0 
      009AF2 A1 02 25         [ 2] 1902 	addw x,(1,sp)
      009AF5 1B               [ 1] 1903 	incw x 
      001FB6                       1904 	_drop 2 
      009AF6 A4 30            [ 2]    1     addw sp,#2 
      009AF8 A1 10 27 02      [ 1] 1905 	clr in 
      009AFC 20 13 0E         [ 4] 1906 	call get_token
      009AFE A1 84            [ 1] 1907 	cp a,#TK_INTGR
      009AFE CD 9A            [ 1] 1908 	jreq 3$ 
      009B00 AE 7B            [ 1] 1909 	cp a,#TK_MINUS
      009B02 01 A1 10         [ 4] 1910 	call get_token 
      009B05 26 05            [ 1] 1911 	cp a,#TK_INTGR 
      009B07 CD 81            [ 1] 1912 	jreq 22$
      009B09 EA 20 E1         [ 4] 1913 	call rest_context 
      009B0C CC 16 8F         [ 2] 1914 	jp syntax_error
      001FD2                       1915 22$:
      009B0C CD 82 07         [ 4] 1916 	call neg_acc24	
      001FD5                       1917 3$: 
      009B0F 20 DC 0C         [ 1] 1918 	ld a,acc24 
      009B11 CE 00 0D         [ 2] 1919 	ldw x,acc16 
      009B11 55 00 03 00      [ 4] 1920 	ld [ptr16],a
      009B15 02 5C 00 1A      [ 1] 1921 	inc ptr8  
      009B16 72 CF 00 19      [ 5] 1922 	ldw [ptr16],x 
      009B16 A6 84 57         [ 4] 1923 	call rest_context
      009B18 CD 17 90         [ 4] 1924 	call next_token 
      009B18 5B 01            [ 1] 1925 	cp a,#TK_COMMA
      009B1A 81 03            [ 1] 1926 	jrne 4$ 
      009B1B CC 1F 6B         [ 2] 1927 	jp input_loop
      001FF4                       1928 4$:
      009B1B 52 01            [ 1] 1929 	cp a,#TK_NONE 
      009B1D CD 9A            [ 1] 1930 	jreq input_exit  
      009B1F E8 CD            [ 1] 1931 	cp a,#TK_COLON 
      009B21 98 10            [ 1] 1932     jreq input_exit 
      009B23 6B 01 A4         [ 2] 1933 	jp syntax_error 
      001FFF                       1934 input_exit:
      001FFF                       1935 	_drop VSIZE 
      009B26 30 A1            [ 2]    1     addw sp,#VSIZE 
      009B28 30 26            [ 2] 1936 	popw y 
      009B2A 31               [ 4] 1937 	ret 
                                   1938 
                                   1939 
                                   1940 ;---------------------
                                   1941 ; BASIC: REM | ' 
                                   1942 ; skip comment to end of line 
                                   1943 ;---------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B2B                       1944 remark::
      009B2B CD 9A E8 CD 82   [ 1] 1945 	mov in,count 
      009B30 24               [ 4] 1946  	ret 
                                   1947 
                                   1948 
                                   1949 ;---------------------
                                   1950 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   1951 ; read in loop 'addr'  
                                   1952 ; apply & 'mask' to value 
                                   1953 ; loop while result==0.  
                                   1954 ; 'xor_mask' is used to 
                                   1955 ; invert the wait logic.
                                   1956 ; i.e. loop while not 0.
                                   1957 ;---------------------
                           000001  1958 	XMASK=1 
                           000002  1959 	MASK=2
                           000003  1960 	ADDR=3
                           000004  1961 	VSIZE=4
      00200A                       1962 wait: 
      00200A                       1963 	_vars VSIZE
      009B31 90 F6            [ 2]    1     sub sp,#VSIZE 
      009B33 93 EE            [ 1] 1964 	clr (XMASK,sp) 
      009B35 01 72 A9         [ 4] 1965 	call arg_list 
      009B38 00 03            [ 1] 1966 	cp a,#2
      009B3A 4D 2B            [ 1] 1967 	jruge 0$
      009B3C 08 26 0C         [ 2] 1968 	jp syntax_error 
      009B3F 35 02            [ 1] 1969 0$:	cp a,#3
      009B41 00 0F            [ 1] 1970 	jrult 1$
      00201C                       1971 	_xpop  ; xor mask 
      009B43 20 0A            [ 1]    1     ld a,(y)
      009B45 93               [ 1]    2     ldw x,y 
      009B45 35 04            [ 2]    3     ldw x,(1,x)
      009B47 00 0F 20 04      [ 2]    4     addw y,#CELL_SIZE 
      009B4B 9F               [ 1] 1972 	ld a,xl 
      009B4B 35 01            [ 1] 1973 	ld (XMASK,sp),a 
      002028                       1974 1$: _xpop ; mask
      009B4D 00 0F            [ 1]    1     ld a,(y)
      009B4F 93               [ 1]    2     ldw x,y 
      009B4F 5F C6            [ 2]    3     ldw x,(1,x)
      009B51 00 0F 14 01      [ 2]    4     addw y,#CELL_SIZE 
      009B55 27               [ 1] 1975     ld a,xl  
      009B56 17 53            [ 1] 1976 	ld (MASK,sp),a 
      002034                       1977 	_xpop ; address 
      009B58 A6 FF            [ 1]    1     ld a,(y)
      009B5A 20               [ 1]    2     ldw x,y 
      009B5B 12 7B            [ 2]    3     ldw x,(1,x)
      009B5D 01 27 05 55      [ 2]    4     addw y,#CELL_SIZE 
      009B61 00               [ 1] 1978 2$:	ld a,(x)
      009B62 03 00            [ 1] 1979 	and a,(MASK,sp)
      009B64 02 01            [ 1] 1980 	xor a,(XMASK,sp)
      009B65 27 F9            [ 1] 1981 	jreq 2$ 
      002044                       1982 	_drop VSIZE 
      009B65 90 F6            [ 2]    1     addw sp,#VSIZE 
      009B67 93               [ 4] 1983 	ret 
                                   1984 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



                                   1985 ;---------------------
                                   1986 ; BASIC: BSET addr,mask
                                   1987 ; set bits at 'addr' corresponding 
                                   1988 ; to those of 'mask' that are at 1.
                                   1989 ; arguments:
                                   1990 ; 	addr 		memory address RAM|PERIPHERAL 
                                   1991 ;   mask        mask|addr
                                   1992 ; output:
                                   1993 ;	none 
                                   1994 ;--------------------------
      002047                       1995 bit_set:
      009B68 EE 01 72         [ 4] 1996 	call arg_list 
      009B6B A9 00            [ 1] 1997 	cp a,#2	 
      009B6D 03 03            [ 1] 1998 	jreq 1$ 
      009B6E CC 16 8F         [ 2] 1999 	jp syntax_error
      002051                       2000 1$: 
      002051                       2001 	_xpop ; mask 
      009B6E 5B 01            [ 1]    1     ld a,(y)
      009B70 81               [ 1]    2     ldw x,y 
      009B71 EE 01            [ 2]    3     ldw x,(1,x)
      009B71 35 10 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009B75 81               [ 1] 2002 	ld a,xl
      009B76 88               [ 1] 2003 	push a  
      00205C                       2004 	_xpop ; addr  
      009B76 35 0A            [ 1]    1     ld a,(y)
      009B78 00               [ 1]    2     ldw x,y 
      009B79 0B 81            [ 2]    3     ldw x,(1,x)
      009B7B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B7B 90               [ 1] 2005 	pop a 
      009B7C 89               [ 1] 2006 	or a,(x)
      009B7D 4F               [ 1] 2007 	ld (x),a
      009B7E AE               [ 4] 2008 	ret 
                                   2009 
                                   2010 ;---------------------
                                   2011 ; BASIC: BRES addr,mask
                                   2012 ; reset bits at 'addr' corresponding 
                                   2013 ; to those of 'mask' that are at 1.
                                   2014 ; arguments:
                                   2015 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2016 ;   mask	    ~mask&*addr  
                                   2017 ; output:
                                   2018 ;	none 
                                   2019 ;--------------------------
      002069                       2020 bit_reset:
      009B7F 16 68 90         [ 4] 2021 	call arg_list 
      009B82 CE 00            [ 1] 2022 	cp a,#2  
      009B84 1C 90            [ 1] 2023 	jreq 1$ 
      009B86 A3 B6 00         [ 2] 2024 	jp syntax_error
      002073                       2025 1$: 
      002073                       2026 	_xpop ; mask 
      009B89 25 05            [ 1]    1     ld a,(y)
      009B8B 1D               [ 1]    2     ldw x,y 
      009B8C 00 80            [ 2]    3     ldw x,(1,x)
      009B8E 20 04 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B90 9F               [ 1] 2027 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009B90 72               [ 1] 2028 	cpl a
      009B91 B0               [ 1] 2029 	push a  
      00207F                       2030 	_xpop ; addr  
      009B92 00 1E            [ 1]    1     ld a,(y)
      009B94 90               [ 1]    2     ldw x,y 
      009B95 85 81            [ 2]    3     ldw x,(1,x)
      009B97 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009B97 3B               [ 1] 2031 	pop a 
      009B98 00               [ 1] 2032 	and a,(x)
      009B99 0B               [ 1] 2033 	ld (x),a 
      009B9A AE               [ 4] 2034 	ret 
                                   2035 
                                   2036 ;---------------------
                                   2037 ; BASIC: BTOGL addr,mask
                                   2038 ; toggle bits at 'addr' corresponding 
                                   2039 ; to those of 'mask' that are at 1.
                                   2040 ; arguments:
                                   2041 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2042 ;   mask	    mask^*addr  
                                   2043 ; output:
                                   2044 ;	none 
                                   2045 ;--------------------------
      00208C                       2046 bit_toggle:
      009B9B 9D F0 CD         [ 4] 2047 	call arg_list 
      009B9E 8A 21            [ 1] 2048 	cp a,#2 
      009BA0 CE 00            [ 1] 2049 	jreq 1$ 
      009BA2 1C 35 10         [ 2] 2050 	jp syntax_error
      002096                       2051 1$: _xpop ; mask 
      009BA5 00 0B            [ 1]    1     ld a,(y)
      009BA7 CD               [ 1]    2     ldw x,y 
      009BA8 98 65            [ 2]    3     ldw x,(1,x)
      009BAA 32 00 0B AE      [ 2]    4     addw y,#CELL_SIZE 
      009BAE 9E               [ 1] 2052 	ld a,xl
      009BAF 02               [ 1] 2053 	push a 
      0020A1                       2054 	_xpop  ; addr  
      009BB0 CD 8A            [ 1]    1     ld a,(y)
      009BB2 21               [ 1]    2     ldw x,y 
      009BB3 CE 00            [ 2]    3     ldw x,(1,x)
      009BB5 1E 72 B0 00      [ 2]    4     addw y,#CELL_SIZE 
      009BB9 1C               [ 1] 2055 	pop a 
      009BBA CD               [ 1] 2056 	xor a,(x)
      009BBB 98               [ 1] 2057 	ld (x),a 
      009BBC 65               [ 4] 2058 	ret 
                                   2059 
                                   2060 
                                   2061 ;---------------------
                                   2062 ; BASIC: BTEST(addr,bit)
                                   2063 ; return bit value at 'addr' 
                                   2064 ; bit is in range {0..7}.
                                   2065 ; arguments:
                                   2066 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2067 ;   bit 	    bit position {0..7}  
                                   2068 ; output:
                                   2069 ;	A:X       bit value  
                                   2070 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      0020AE                       2071 bit_test:
      009BBD AE 9E 13         [ 4] 2072 	call func_args 
      009BC0 CD 8A            [ 1] 2073 	cp a,#2
      009BC2 21 81            [ 1] 2074 	jreq 0$
      009BC4 CC 16 8F         [ 2] 2075 	jp syntax_error
      0020B8                       2076 0$:	
      0020B8                       2077 	_xpop 
      009BC4 CD 9B            [ 1]    1     ld a,(y)
      009BC6 7B               [ 1]    2     ldw x,y 
      009BC7 A6 03            [ 2]    3     ldw x,(1,x)
      009BC9 42 CF 00 21      [ 2]    4     addw y,#CELL_SIZE 
      009BCD 4F               [ 1] 2078 	ld a,xl 
      009BCE 81 07            [ 1] 2079 	and a,#7
      009BCF 88               [ 1] 2080 	push a   
      009BCF CD 98            [ 1] 2081 	ld a,#1 
      009BD1 10 A1            [ 1] 2082 1$: tnz (1,sp)
      009BD3 85 27            [ 1] 2083 	jreq 2$
      009BD5 0C               [ 1] 2084 	sll a 
      009BD6 A1 05            [ 1] 2085 	dec (1,sp)
      009BD8 27 03            [ 2] 2086 	jra 1$
      009BDA CC 97            [ 1] 2087 2$: ld (1,sp),a  
      0020D2                       2088 	_xpop ; address  
      009BDC 0F F6            [ 1]    1     ld a,(y)
      009BDD 93               [ 1]    2     ldw x,y 
      009BDD CD 99            [ 2]    3     ldw x,(1,x)
      009BDF F5 20 03 03      [ 2]    4     addw y,#CELL_SIZE 
      009BE2 84               [ 1] 2089 	pop a 
      009BE2 CD               [ 1] 2090 	and a,(x)
      009BE3 98 45            [ 1] 2091 	jreq 3$
      009BE5 A6 01            [ 1] 2092 	ld a,#1 
      009BE5 CF               [ 1] 2093 3$:	clrw x 
      009BE6 00               [ 1] 2094 	ld xl,a
      009BE7 1A               [ 1] 2095 	clr a  
      009BE8 CD               [ 4] 2096 	ret
                                   2097 
                                   2098 ;--------------------
                                   2099 ; BASIC: POKE addr,byte
                                   2100 ; put a byte at addr 
                                   2101 ;--------------------
      0020E5                       2102 poke:
      009BE9 98 10 A1         [ 4] 2103 	call arg_list 
      009BEC 32 27            [ 1] 2104 	cp a,#2
      009BEE 03 CC            [ 1] 2105 	jreq 1$
      009BF0 97 0F 8F         [ 2] 2106 	jp syntax_error
      009BF2                       2107 1$:	
      0020EF                       2108 	_xpop ; byte   
      009BF2 CD 9A            [ 1]    1     ld a,(y)
      009BF4 E8               [ 1]    2     ldw x,y 
      009BF5 A1 84            [ 2]    3     ldw x,(1,x)
      009BF7 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      009BFB 0F               [ 1] 2109     ld a,xl 
      009BFC 88               [ 1] 2110 	push a 
      0020FA                       2111 	_xpop ; address 
      009BFC 90 F6            [ 1]    1     ld a,(y)
      009BFE 93               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009BFF EE 01            [ 2]    3     ldw x,(1,x)
      009C01 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C05 84               [ 1] 2112 	pop a 
      009C05 72               [ 1] 2113 	ld (x),a 
      009C06 C7               [ 4] 2114 	ret 
                                   2115 
                                   2116 ;-----------------------
                                   2117 ; BASIC: PEEK(addr)
                                   2118 ; get the byte at addr 
                                   2119 ; input:
                                   2120 ;	none 
                                   2121 ; output:
                                   2122 ;	X 		value 
                                   2123 ;-----------------------
      002106                       2124 peek:
      009C07 00 1A 72         [ 4] 2125 	call func_args
      009C0A 5C 00            [ 1] 2126 	cp a,#1 
      009C0C 1B 72            [ 1] 2127 	jreq 1$
      009C0E CF 00 1A         [ 2] 2128 	jp syntax_error
      002110                       2129 1$: _xpop ; address  
      009C11 81 F6            [ 1]    1     ld a,(y)
      009C12 93               [ 1]    2     ldw x,y 
      009C12 F6 A0            [ 2]    3     ldw x,(1,x)
      009C14 03 88 4B 00      [ 2]    4     addw y,#CELL_SIZE 
      009C18 72 FB 01         [ 1] 2130 	ld farptr,a 
      009C1B F6 EE 01         [ 2] 2131 	ldw ptr16,x 
      009C1E 5B 02 81 18      [ 5] 2132 	ldf a,[farptr]
      009C21 5F               [ 1] 2133 	clrw x 
      009C21 90               [ 1] 2134 	ld xl,a 
      009C22 89               [ 1] 2135 	clr a 
      009C23 52               [ 4] 2136 	ret 
                                   2137 
                                   2138 ;---------------------------
                                   2139 ; BASIC IF expr : instructions
                                   2140 ; evaluate expr and if true 
                                   2141 ; execute instructions on same line. 
                                   2142 ;----------------------------
      002127                       2143 if: 
      009C24 04 5F 1F         [ 4] 2144 	call relation 
      009C27 01               [ 1] 2145 	tnz  a  
      009C28 90 AE            [ 1] 2146 	jrne 9$ 
                                   2147 ;skip to next line
      009C2A 40 00 90 C3 00   [ 1] 2148 	mov in,count
      002132                       2149 	_drop 2 
      009C2F 25 24            [ 2]    1     addw sp,#2 
      009C31 35 17 03         [ 2] 2150 	jp next_line
      009C34 93               [ 4] 2151 9$:	ret 
                                   2152 
                                   2153 ;------------------------
                                   2154 ; BASIC: FOR var=expr 
                                   2155 ; set variable to expression 
                                   2156 ; leave variable address 
                                   2157 ; on stack and set
                                   2158 ; FLOOP bit in 'flags'
                                   2159 ;-----------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



                           000001  2160 	RETL1=1 ; return address  
                           000003  2161 	FSTEP=3  ; variable increment int24
                           000006  2162 	LIMIT=6 ; loop limit, int24  
                           000009  2163 	CVAR=9   ; control variable 
                           00000B  2164 	INW=11   ;  in.w saved
                           00000D  2165 	BPTR=13 ; baseptr saved
                           00000D  2166 	VSIZE=13  
      002138                       2167 for: ; { -- var_addr }
      009C35 5C               [ 2] 2168 	popw x ; call return address 
      002139                       2169 	_vars VSIZE 
      009C36 CD 8A            [ 2]    1     sub sp,#VSIZE 
      009C38 21               [ 2] 2170 	pushw x  ; RETL1 
      009C39 A6 3D            [ 1] 2171 	ld a,#TK_VAR 
      009C3B CD 89 C4         [ 4] 2172 	call expect
      009C3E 1E 03 CD         [ 4] 2173 	call get_addr
      009C41 9C 12            [ 2] 2174 	ldw (CVAR,sp),x  ; control variable 
      009C43 C7 00 0D         [ 4] 2175 	call let_eval 
      009C46 CF 00 0E CD      [ 1] 2176 	bset flags,#FLOOP 
      009C4A 98 7C A6         [ 4] 2177 	call next_token 
      009C4D 0D CD            [ 1] 2178 	cp a,#TK_CMD 
      009C4F 89 C4            [ 1] 2179 	jreq 1$
      009C51 1E 01 5C         [ 2] 2180 	jp syntax_error
      002157                       2181 1$:  
      009C54 1F 01 72         [ 4] 2182 	call get_code_addr
      009C57 5F 00 0E         [ 2] 2183 	cpw x,#to   
      009C5A 16 03            [ 1] 2184 	jreq to
      009C5C 90 F6 C7         [ 2] 2185 	jp syntax_error 
                                   2186 
                                   2187 ;-----------------------------------
                                   2188 ; BASIC: TO expr 
                                   2189 ; second part of FOR loop initilization
                                   2190 ; leave limit on stack and set 
                                   2191 ; FTO bit in 'flags'
                                   2192 ;-----------------------------------
      002162                       2193 to: ; { var_addr -- var_addr limit step }
      009C5F 00 0F 72 B9 00   [ 2] 2194 	btjt flags,#FLOOP,1$
      009C64 0E 20 C5         [ 2] 2195 	jp syntax_error
      009C67 CD 1A 68         [ 4] 2196 1$: call expression   
      009C67 1E 01            [ 1] 2197 	cp a,#TK_INTGR 
      009C69 CD 98            [ 1] 2198 	jreq 2$ 
      009C6B 65 AE 9C         [ 2] 2199 	jp syntax_error
      002174                       2200 2$: _xpop
      009C6E 77 CD            [ 1]    1     ld a,(y)
      009C70 8A               [ 1]    2     ldw x,y 
      009C71 21 5B            [ 2]    3     ldw x,(1,x)
      009C73 04 90 85 81      [ 2]    4     addw y,#CELL_SIZE 
      009C77 20 63            [ 1] 2201 	ld (LIMIT,sp),a 
      009C79 6F 6E            [ 2] 2202 	ldw (LIMIT+1,sp),x
      009C7B 73 74 61         [ 4] 2203 	call next_token
      009C7E 6E 74            [ 1] 2204 	cp a,#TK_NONE  
      009C80 73 20            [ 1] 2205 	jreq 4$ 
      009C82 69 6E            [ 1] 2206 	cp a,#TK_CMD
      009C84 20 45            [ 1] 2207 	jrne 3$
      009C86 45 50 52         [ 4] 2208 	call get_code_addr
      009C89 4F 4D 0A         [ 2] 2209 	cpw x,#step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009C8C 00 0E            [ 1] 2210 	jreq step
      009C8D                       2211 3$:	
      002194                       2212 	_unget_token   	 
      009C8D AE 40 00 35 08   [ 1]    1      mov in,in.saved  
      002199                       2213 4$:	
      009C92 00 0F            [ 1] 2214 	clr (FSTEP,sp) 
      009C94 A3 47 F8         [ 2] 2215 	ldw x,#1   ; default step  
      009C97 24 17            [ 2] 2216 	ldw (FSTEP+1,sp),x 
      009C99 F6 26            [ 2] 2217 	jra store_loop_addr 
                                   2218 
                                   2219 
                                   2220 ;----------------------------------
                                   2221 ; BASIC: STEP expr 
                                   2222 ; optional third par of FOR loop
                                   2223 ; initialization. 	
                                   2224 ;------------------------------------
      0021A2                       2225 step: ; {var limit -- var limit step}
      009C9B 0C 5C 72 5A 00   [ 2] 2226 	btjt flags,#FLOOP,1$
      009CA0 0F 26 F6         [ 2] 2227 	jp syntax_error
      009CA3 1D 00 08         [ 4] 2228 1$: call expression 
      009CA6 20 09            [ 1] 2229 	cp a,#TK_INTGR
      009CA8 F6 5C            [ 1] 2230 	jreq 2$
      009CAA 4D 26 FB         [ 2] 2231 	jp syntax_error
      0021B4                       2232 2$:	
      0021B4                       2233 	_xpop 
      009CAD 5A 20            [ 1]    1     ld a,(y)
      009CAF E0               [ 1]    2     ldw x,y 
      009CB0 5F 4F            [ 2]    3     ldw x,(1,x)
      009CB2 CF 00 25 81      [ 2]    4     addw y,#CELL_SIZE 
      009CB6 6B 03            [ 1] 2234 	ld (FSTEP,sp),a 
      009CB6 90 89            [ 2] 2235 	ldw (FSTEP+1,sp),x ; step
                                   2236 ; if step < 0 decrement LIMIT 
      009CB8 52               [ 1] 2237 	tnz a
      009CB9 05 72            [ 1] 2238 	jrpl store_loop_addr 
      009CBB 5F 00            [ 1] 2239 	ld a,(LIMIT,sp)
      009CBD 0E CD            [ 2] 2240 	ldw x,(LIMIT+1,sp)
      009CBF 94 53 AB         [ 2] 2241 	subw x,#1 
      009CC2 05 6B            [ 1] 2242 	sbc a,#0 
      009CC4 05 1F            [ 1] 2243 	ld (LIMIT,sp),a 
      009CC6 01 90            [ 2] 2244 	ldw (LIMIT+1,sp),x 
                                   2245 ; leave loop back entry point on cstack 
                                   2246 ; cstack is 1 call deep from interpreter
      0021D1                       2247 store_loop_addr:
      009CC8 AE 40 00         [ 2] 2248 	ldw x,basicptr
      009CCB 1E 01            [ 2] 2249 	ldw (BPTR,sp),x 
      009CCD 17 03 90         [ 2] 2250 	ldw x,in.w 
      009CD0 C3 00            [ 2] 2251 	ldw (INW,sp),x   
      009CD2 25 24 1A 90      [ 1] 2252 	bres flags,#FLOOP 
      009CD6 F6 11 05 26      [ 1] 2253 	inc loop_depth  
      009CDA 07               [ 4] 2254 	ret 
                                   2255 
                                   2256 ;--------------------------------
                                   2257 ; BASIC: NEXT var 
                                   2258 ; FOR loop control 
                                   2259 ; increment variable with step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



                                   2260 ; and compare with limit 
                                   2261 ; loop if threshold not crossed.
                                   2262 ; else stack. 
                                   2263 ; and decrement 'loop_depth' 
                                   2264 ;--------------------------------
      0021E4                       2265 next: ; {var limit step retl1 -- [var limit step ] }
      009CDB 90 5C CD 94      [ 1] 2266 	tnz loop_depth 
      009CDF 5E 26            [ 1] 2267 	jrne 1$ 
      009CE1 11 16 8F         [ 2] 2268 	jp syntax_error 
      009CE2                       2269 1$: 
      009CE2 16 03            [ 1] 2270 	ld a,#TK_VAR 
      009CE4 90 F6 C7         [ 4] 2271 	call expect
      009CE7 00 0F 72         [ 4] 2272 	call get_addr 
                                   2273 ; check for good variable after NEXT 	 
      009CEA B9 00            [ 2] 2274 	cpw x,(CVAR,sp)
      009CEC 0E 20            [ 1] 2275 	jreq 2$  
      009CEE DC 16 8F         [ 2] 2276 	jp syntax_error ; not the good one 
      009CEF                       2277 2$: 
      009CEF 0F 03 0F         [ 2] 2278 	ldw ptr16,x 
                                   2279 	; increment variable 
      009CF2 04               [ 1] 2280 	ld a,(x)
      009CF3 EE 01            [ 2] 2281 	ldw x,(1,x)  ; get var value 
      009CF3 1E 03 5B         [ 2] 2282 	addw x,(FSTEP+1,sp) ; var+step 
      009CF6 05 90            [ 1] 2283 	adc a,(FSTEP,sp)
      009CF8 85 81 00 19      [ 4] 2284 	ld [ptr16],a
      009CFA 72 5C 00 1A      [ 1] 2285 	inc ptr8  
      009CFA 90 89 52 08      [ 5] 2286 	ldw [ptr16],x 
      009CFE 0F 06 CD         [ 1] 2287 	ld acc24,a 
      009D01 98 10 A1         [ 2] 2288 	ldw acc16,x 
      009D04 04 26            [ 1] 2289 	ld a,(LIMIT,sp)
      009D06 0D CD            [ 2] 2290 	ldw x,(LIMIT+1,sp)
      009D08 98 5F A4 DF      [ 2] 2291 	subw x,acc16 
      009D0C A1 55 26         [ 1] 2292 	sbc a,acc24
      009D0F 08 03            [ 1] 2293 	xor a,(FSTEP,sp)
      009D11 06 20            [ 1] 2294 	xor a,#0x80
      009D13 07 A1            [ 1] 2295 	jrmi loop_back  
      009D15 03 27            [ 2] 2296 	jra loop_done   
                                   2297 ; check sign of STEP  
      009D17 08 CC            [ 1] 2298 	ld a,(FSTEP,sp)
      009D19 97 0F            [ 1] 2299 	jrpl 4$
                                   2300 ;negative step
      009D1B C6 00 0E         [ 1] 2301     ld a,acc8 
      009D1B A6 03            [ 1] 2302 	jrslt loop_back   
      009D1D CD 99            [ 2] 2303 	jra loop_done  
      002237                       2304 4$: ; positive step
      009D1F BE 0E 00 0E 15   [ 2] 2305 	btjt acc8,#7,loop_done 
      009D20                       2306 loop_back:
      009D20 1F 01            [ 2] 2307 	ldw x,(BPTR,sp)
      009D22 CD 98 36         [ 2] 2308 	ldw basicptr,x 
      009D25 1E 01 CD 94 53   [ 2] 2309 	btjf flags,#FRUN,1$ 
      009D2A AB 05            [ 1] 2310 	ld a,(2,x)
      009D2C 6B 05 16         [ 1] 2311 	ld count,a
      009D2F 01 AE            [ 2] 2312 1$:	ldw x,(INW,sp)
      009D31 16 68 7B         [ 2] 2313 	ldw in.w,x 
      009D34 05               [ 4] 2314 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      002251                       2315 loop_done:
                                   2316 	; remove loop data from stack  
      009D35 F7               [ 2] 2317 	popw x
      002252                       2318 	_drop VSIZE 
      009D36 5C CD            [ 2]    1     addw sp,#VSIZE 
      009D38 94 6F 1F 03      [ 1] 2319 	dec loop_depth 
      009D3C 5F               [ 2] 2320 	jp (x)
                                   2321 
                                   2322 ;----------------------------
                                   2323 ; called by goto/gosub
                                   2324 ; to get target line number 
                                   2325 ; output:
                                   2326 ;    x    line address 
                                   2327 ;---------------------------
      002259                       2328 get_target_line:
      009D3D 7B 05 A0         [ 4] 2329 	call next_token  
      009D40 04 97            [ 1] 2330 	cp a,#TK_INTGR
      009D42 72 FB            [ 1] 2331 	jreq get_target_line_addr 
      009D44 03 1F            [ 1] 2332 	cp a,#TK_LABEL 
      009D46 03 A6            [ 1] 2333 	jreq look_target_symbol 
      009D48 32 CD 99         [ 2] 2334 	jp syntax_error
                                   2335 ; the target is a line number 
                                   2336 ; search it. 
      002267                       2337 get_target_line_addr:
      009D4B BE 16            [ 2] 2338 	pushw y 
      009D4D 07 CD 9A         [ 4] 2339 	call get_int24 ; line # 
      009D50 E8               [ 1] 2340 	clr a
      009D51 A1 84 27 03      [ 2] 2341 	ldw y,basicptr 
      009D55 CC 97            [ 2] 2342 	ldw y,(y)
      009D57 0F 90            [ 2] 2343 	pushw y 
      009D59 F6 93            [ 2] 2344 	cpw x,(1,sp)
      002277                       2345 	_drop 2  
      009D5B EE 01            [ 2]    1     addw sp,#2 
      009D5D 72 A9            [ 1] 2346 	jrult 11$
      009D5F 00               [ 1] 2347 	inc a 
      00227C                       2348 11$: ; scan program for this line# 	
      009D60 03 17 07         [ 4] 2349 	call search_lineno  
      009D63 16               [ 2] 2350 	tnzw x ; 0| line# address 
      009D64 03 90            [ 1] 2351 	jrne 2$ 
      009D66 F7 90            [ 1] 2352 	ld a,#ERR_NO_LINE 
      009D68 EF 01 72         [ 2] 2353 	jp tb_error 
      009D6B 5F 00            [ 2] 2354 2$:	popw y  
      009D6D 19               [ 4] 2355 	ret 
                                   2356 
                                   2357 ; the GOTO|GOSUB target is a symbol.
      00228A                       2358 look_target_symbol:
      009D6E 1E 01            [ 2] 2359 	pushw y 
      009D70 CD               [ 2] 2360 	pushw x 
      009D71 9C B6 5D 27      [ 1] 2361 	clr acc16 
      009D75 06 0D 06 27      [ 2] 2362 	ldw y,txtbgn 
      009D79 1B 20 03         [ 1] 2363 1$:	ld a,(3,y) ; first TK_ID on line 
      009D7C A1 03            [ 1] 2364 	cp a,#TK_LABEL 
      009D7C CE 00            [ 1] 2365 	jreq 3$ 
      009D7E 25 E6 02         [ 1] 2366 2$:	ld a,(2,y); line length 
      009D7F C7 00 0E         [ 1] 2367 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D7F CF 00 1A AE      [ 2] 2368 	addw y,acc16 ;point to next line 
      009D83 16 68 7B 05      [ 2] 2369 	cpw y,txtend 
      009D87 CD 89            [ 1] 2370 	jrult 1$
      009D89 05 5F            [ 1] 2371 	ld a,#ERR_BAD_VALUE
      009D8B 7B 05 97         [ 2] 2372 	jp tb_error 
      0022B1                       2373 3$: ; found a TK_LABEL 
                                   2374 	; compare with GOTO|GOSUB target 
      009D8E 72 BB            [ 2] 2375 	pushw y ; line address 
      009D90 00 25 CF 00      [ 2] 2376 	addw y,#4 ; label string 
      009D94 25 03            [ 2] 2377 	ldw x,(3,sp) ; target string 
      009D95 CD 13 DE         [ 4] 2378 	call strcmp
      009D95 CD 98            [ 1] 2379 	jrne 4$
      009D97 10 A1            [ 2] 2380 	popw y 
      009D99 08 26            [ 2] 2381 	jra 2$ 
      0022C2                       2382 4$: ; target found 
      009D9B 03               [ 2] 2383 	popw x ;  address line target  
      0022C3                       2384 	_drop 2 ; target string 
      009D9C CC 9D            [ 2]    1     addw sp,#2 
      009D9E 1B 85            [ 2] 2385 	popw y 
      009D9F 81               [ 4] 2386 	ret
                                   2387 
                                   2388 
                                   2389 ;--------------------------------
                                   2390 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2391 ; selective goto or gosub 
                                   2392 ;--------------------------------
      0022C8                       2393 cmd_on:
      009D9F 55 00 03 00 02   [ 2] 2394 	btjt flags,#FRUN,0$ 
      009DA4 A6 06            [ 1] 2395 	ld a,#ERR_RUN_ONLY
      009DA4 5B 08 90         [ 2] 2396 	jp tb_error 
      009DA7 85 81 68         [ 4] 2397 0$:	call expression 
      009DA9 A1 84            [ 1] 2398 	cp a,#TK_INTGR
      009DA9 CE 00            [ 1] 2399 	jreq 1$
      009DAB 1E 72 B0         [ 2] 2400 	jp syntax_error
      0022DC                       2401 1$: _xpop
      009DAE 00 1C            [ 1]    1     ld a,(y)
      009DB0 81               [ 1]    2     ldw x,y 
      009DB1 EE 01            [ 2]    3     ldw x,(1,x)
      009DB1 AE 9D F0 CD      [ 2]    4     addw y,#CELL_SIZE 
                                   2402 ; the selector is the element indice 
                                   2403 ; in the list of arguments. {1..#elements} 
      009DB5 8A               [ 1] 2404 	ld a,xl ; keep only bits 7..0
      009DB6 21 CE            [ 1] 2405 	jreq 9$ ; element # begin at 1. 
      009DB8 00               [ 1] 2406 	push a  ; selector  
      009DB9 1C 35 10         [ 4] 2407 	call next_token
      009DBC 00 0B            [ 1] 2408 	cp a,#TK_CMD 
      009DBE CD 98            [ 1] 2409 	jreq 2$ 
      009DC0 65 35 0A         [ 2] 2410 	jp syntax_error 
      009DC3 00 0B AE         [ 4] 2411 2$: call get_code_addr
                                   2412 ;; must be a GOTO or GOSUB 
      009DC6 9E 02 CD         [ 2] 2413 	cpw x,#goto 
      009DC9 8A 21            [ 1] 2414 	jreq 4$
      009DCB CD 9D A9         [ 2] 2415 	cpw x,#gosub 
      009DCE CD 98            [ 1] 2416 	jreq 4$ 
      009DD0 65 AE 9E         [ 2] 2417 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      002303                       2418 4$: 
      009DD3 13               [ 1] 2419 	pop a 
      009DD4 CD               [ 2] 2420 	pushw x ; save routine address 	
      009DD5 8A               [ 1] 2421 	push a  ; selector  
      002306                       2422 5$: ; skip elements in list until selector==0 
      009DD6 21 CE            [ 1] 2423 	dec (1,sp)
      009DD8 00 1C            [ 1] 2424 	jreq 6$ 
                                   2425 ; can be a line# or a label 
      009DDA A3 B6 04         [ 4] 2426 	call next_token 
      009DDD 25 05            [ 1] 2427 	cp a,#TK_INTGR 
      009DDF AE 9E            [ 1] 2428 	jreq 52$
      009DE1 1A 20            [ 1] 2429 	cp a,#TK_LABEL 
      009DE3 03 AE            [ 1] 2430 	jreq 54$
      009DE5 9E 2B CD         [ 2] 2431 	jp syntax_error 
      002318                       2432 52$: ; got a line number 
      009DE8 8A 21 A6         [ 1] 2433 	ld a,in ; skip over int24 value 
      009DEB 0D CD            [ 1] 2434 	add a,#CELL_SIZE ; integer size  
      009DED 89 C4 81         [ 1] 2435 	ld in,a 
      009DF0 70 72            [ 2] 2436 	jra 56$
      009DF2 6F 67 72         [ 4] 2437 54$: call skip_string ; skip over label 	
      002325                       2438 56$: ; if another element comma present 
      009DF5 61 6D 20         [ 4] 2439 	call next_token
      009DF8 61 64            [ 1] 2440 	cp a,#TK_COMMA 
      009DFA 64 72            [ 1] 2441 	jreq 5$ 
                                   2442 ; arg list exhausted, selector to big 
                                   2443 ; continue execution on next line 
      00232C                       2444 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009DFC 65 73            [ 2]    1     addw sp,#3 
      009DFE 73 3A            [ 2] 2445 	jra 9$
      002330                       2446 6$: ;at selected position  
      002330                       2447 	_drop 1 ; discard selector
      009E00 20 00            [ 2]    1     addw sp,#1 
                                   2448 ; here only the routine address 
                                   2449 ; of GOTO|GOSUB is on stack 
      009E02 2C 20 70         [ 4] 2450     call get_target_line
      009E05 72 6F 67         [ 2] 2451 	ldw ptr16,x 	
      009E08 72 61 6D 20 73   [ 1] 2452 	mov in,count ; move to end of line  
      009E0D 69               [ 2] 2453 	popw x ; cmd address, GOTO||GOSUB 
      009E0E 7A 65 3A         [ 2] 2454 	cpw x,#goto 
      009E11 20 00            [ 1] 2455 	jrne 7$ 
      009E13 20 62 79         [ 2] 2456 	ldw x,ptr16 
      009E16 74 65            [ 2] 2457 	jra jp_to_target
      002348                       2458 7$: 
      009E18 73 00            [ 2] 2459 	jra gosub_2 ; target in ptr16 
      00234A                       2460 9$: ; expr out of range skip to end of line
                                   2461     ; this will force a fall to next line  
      009E1A 20 69 6E 20 46   [ 1] 2462 	mov in,count
      00234F                       2463 	_drop 2
      009E1F 4C 41            [ 2]    1     addw sp,#2 
      009E21 53 48 20         [ 2] 2464 	jp next_line  
                                   2465 
                                   2466 
                                   2467 ;------------------------
                                   2468 ; BASIC: GOTO line# 
                                   2469 ; jump to line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



                                   2470 ; here cstack is 2 call deep from interpreter 
                                   2471 ;------------------------
      002354                       2472 goto:
      009E24 6D 65 6D 6F 72   [ 2] 2473 	btjt flags,#FRUN,goto_1  
      009E29 79 00            [ 1] 2474 	ld a,#ERR_RUN_ONLY
      009E2B 20 69 6E         [ 2] 2475 	jp tb_error 
      00235E                       2476 goto_1:
      009E2E 20 52 41         [ 4] 2477 	call get_target_line
      002361                       2478 jp_to_target:
      009E31 4D 20 6D         [ 2] 2479 	ldw basicptr,x 
      009E34 65 6D            [ 1] 2480 	ld a,(2,x)
      009E36 6F 72 79         [ 1] 2481 	ld count,a 
      009E39 00 03 00 01      [ 1] 2482 	mov in,#3 
      009E3A 81               [ 4] 2483 	ret 
                                   2484 
                                   2485 
                                   2486 ;--------------------
                                   2487 ; BASIC: GOSUB line#
                                   2488 ; basic subroutine call
                                   2489 ; actual line# and basicptr 
                                   2490 ; are saved on cstack
                                   2491 ; here cstack is 2 call deep from interpreter 
                                   2492 ;--------------------
                           000001  2493 	TARGET=1   ; target address 
                           000003  2494 	RET_ADDR=3 ; subroutine return address 
                           000005  2495 	RET_BPTR=5 ; basicptr return point 
                           000007  2496 	RET_INW=7  ; in.w return point 
                           000004  2497 	VSIZE=4  
      00236E                       2498 gosub:
      009E3A 72 01 00 23 05   [ 2] 2499 	btjt flags,#FRUN,gosub_1 
      009E3F A6 07            [ 1] 2500 	ld a,#ERR_RUN_ONLY
      009E41 CC 97 11         [ 2] 2501 	jp tb_error 
      009E44 81               [ 4] 2502 	ret 
      002379                       2503 gosub_1:
      009E44 CD 98 10         [ 4] 2504 	call get_target_line 
      009E47 A1 04 26         [ 2] 2505 	ldw ptr16,x 
      00237F                       2506 gosub_2: 
      009E4A 10               [ 2] 2507 	popw x 
      002380                       2508 	_vars VSIZE  
      009E4B CD 98            [ 2]    1     sub sp,#VSIZE 
      009E4D 5F               [ 2] 2509 	pushw x ; RET_ADDR 
      009E4E A4 DF A1         [ 2] 2510 	ldw x,ptr16 
      009E51 43               [ 2] 2511 	pushw x ; TARGET
                                   2512 ; save BASIC subroutine return point.   
      009E52 26 04 CD         [ 2] 2513 	ldw x,basicptr
      009E55 9C 21            [ 2] 2514 	ldw (RET_BPTR,sp),x 
      009E57 81 CC 97         [ 2] 2515 	ldw x,in.w 
      009E5A 0F 55            [ 2] 2516 	ldw (RET_INW,sp),x
      009E5C 00               [ 2] 2517 	popw x 
      009E5D 03 00            [ 2] 2518 	jra jp_to_target
                                   2519 
                                   2520 ;------------------------
                                   2521 ; BASIC: RETURN 
                                   2522 ; exit from BASIC subroutine 
                                   2523 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



                           000003  2524 	RET_BPTR=3 ; basicptr return point 
                           000005  2525 	RET_INW=5  ; in.w return point 
                           000004  2526 	VSIZE=4  
      002394                       2527 return:
      009E5F 02 CD 9D A9 22   [ 2] 2528 	btjt flags,#FRUN,0$ 
      009E64 01 81            [ 1] 2529 	ld a,#ERR_RUN_ONLY
      009E66 52 06 CE         [ 2] 2530 	jp tb_error 
      00239E                       2531 0$:	
      009E69 00 1C            [ 2] 2532 	ldw x,(RET_ADDR,sp) 
      009E6B 1F 05 FE         [ 2] 2533 	ldw basicptr,x
      009E6E 1F 01            [ 1] 2534 	ld a,(2,x)
      009E70 AE 7F FF         [ 1] 2535 	ld count,a  
      009E73 1F 03            [ 2] 2536 	ldw x,(RET_INW,sp)
      009E75 CD 99 D0         [ 2] 2537 	ldw in.w,x 
      009E78 4D               [ 2] 2538 	popw x 
      0023AE                       2539 	_drop VSIZE 
      009E79 27 31            [ 2]    1     addw sp,#VSIZE 
      009E7B A1               [ 2] 2540 	pushw x
      009E7C 02               [ 4] 2541 	ret  
                                   2542 
                                   2543 ;----------------------------------
                                   2544 ; BASIC: RUN
                                   2545 ; run BASIC program in RAM
                                   2546 ;----------------------------------- 
      0023B2                       2547 run: 
      009E7D 27 07 A1 01 27   [ 2] 2548 	btjf flags,#FRUN,0$  
      009E82 06               [ 1] 2549 	clr a 
      009E83 CC               [ 4] 2550 	ret
      0023B9                       2551 0$: 
      009E84 97 0F 85 1F 05   [ 2] 2552 	btjf flags,#FBREAK,1$
      009E89                       2553 	_drop 2 
      009E89 85 1F            [ 2]    1     addw sp,#2 
      009E8B 01 1F 57         [ 4] 2554 	call rest_context
      009E8C                       2555 	_drop CTXT_SIZE 
      009E8C CE 00            [ 2]    1     addw sp,#CTXT_SIZE 
      009E8E 1C 1F 05 C3      [ 1] 2556 	bres flags,#FBREAK 
      009E92 00 1E 2A 38      [ 1] 2557 	bset flags,#FRUN 
      009E96 FE 13 01         [ 2] 2558 	jp interpreter 
      009E99 2A 11 1E         [ 2] 2559 1$:	ldw x,txtbgn
      009E9C 05 E6 02         [ 2] 2560 	cpw x,txtend 
      009E9F C7 00            [ 1] 2561 	jrmi run_it 
      009EA1 0F 72 5F         [ 2] 2562 	ldw x,#err_no_prog
      009EA4 00 0E 72         [ 4] 2563 	call puts 
      009EA7 BB 00 0E 20 E3   [ 1] 2564 	mov in,count
      009EAC 81               [ 4] 2565 	ret 
      0023E4                       2566 run_it:	 
      0023E4                       2567 	_drop 2 ; drop return address 
      009EAC 1E 05            [ 2]    1     addw sp,#2 
      0023E6                       2568 run_it_02: 
      009EAE E6 02 CD         [ 4] 2569     call ubound 
      009EB1 9F 23 1E         [ 4] 2570 	call clear_vars 
                                   2571 ; clear data pointer 
      009EB4 05               [ 1] 2572 	clrw x 
      009EB5 E6 02 C7         [ 2] 2573 	ldw data_ptr,x 
      009EB8 00 0F 72 5F      [ 1] 2574 	clr data_ofs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009EBC 00 0E 72 BB      [ 1] 2575 	clr data_len 
                                   2576 ; initialize BASIC pointer 
      009EC0 00 0E C3         [ 2] 2577 	ldw x,txtbgn 
      009EC3 00 1E 2A         [ 2] 2578 	ldw basicptr,x 
      009EC6 07 1F            [ 1] 2579 	ld a,(2,x)
      009EC8 05 FE 13         [ 1] 2580 	ld count,a
      009ECB 03 2F DE 01      [ 1] 2581 	mov in,#3	
      009ECE 72 10 00 22      [ 1] 2582 	bset flags,#FRUN 
      009ECE 55 00 04         [ 2] 2583 	jp interpreter 
                                   2584 
                                   2585 
                                   2586 ;----------------------
                                   2587 ; BASIC: END
                                   2588 ; end running program
                                   2589 ;---------------------- 
      00240E                       2590 cmd_end: 
                                   2591 ; clean stack 
      009ED1 00 02 AE         [ 2] 2592 	ldw x,#STACK_EMPTY
      009ED4 16               [ 1] 2593 	ldw sp,x 
      009ED5 B8 CF 00         [ 2] 2594 	jp warm_start
                                   2595 
                                   2596 ;---------------------------
                                   2597 ; BASIC: GET var 
                                   2598 ; receive a key in variable 
                                   2599 ; don't wait 
                                   2600 ;---------------------------
      002415                       2601 cmd_get:
      009ED8 05 5B 06         [ 4] 2602 	call next_token 
      009EDB CD 9D            [ 1] 2603 	cp a,#TK_VAR 
      009EDD B1 81            [ 1] 2604 	jreq 0$
      009EDF CC 16 8F         [ 2] 2605 	jp syntax_error 
      009EDF CD A6 F7         [ 4] 2606 0$: call get_addr 
      009EE2 27 07 AE         [ 2] 2607 	ldw ptr16,x 
      009EE5 9F 0C CD         [ 4] 2608 	call qgetc 
      009EE8 8A 21            [ 1] 2609 	jreq 2$
      009EEA 81 09 54         [ 4] 2610 	call getc  
      009EEB 72 3F 00 19      [ 4] 2611 2$: clr [ptr16]
      009EEB 90 AE B6 00      [ 1] 2612 	inc ptr8 
      009EEF CE B6 02 1C      [ 4] 2613 	clr [ptr16]
      009EF3 00 04 CF 00      [ 1] 2614 	inc ptr8 
      009EF7 0E AE 00 7C      [ 4] 2615 	ld [ptr16],a 
      009EFB CD               [ 4] 2616 	ret 
                                   2617 
                                   2618 
                                   2619 ;-----------------
                                   2620 ; 1 Khz beep 
                                   2621 ;-----------------
      002442                       2622 beep_1khz:: 
      009EFC 94 7F AE         [ 2] 2623 	ldw x,#100
      009EFF 00 80 CF 00      [ 2] 2624 	ldw y,#1000
      009F03 1C 72            [ 2] 2625 	jra beep
                                   2626 
                                   2627 ;-----------------------
                                   2628 ; BASIC: TONE expr1,expr2
                                   2629 ; used TIMER2 channel 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   2630 ; to produce a tone 
                                   2631 ; arguments:
                                   2632 ;    expr1   frequency 
                                   2633 ;    expr2   duration msec.
                                   2634 ;---------------------------
      00244B                       2635 tone:
      009F05 BB 00 7E         [ 4] 2636 	call arg_list 
      009F08 CF 00            [ 1] 2637 	cp a,#2 
      009F0A 1E 81            [ 1] 2638 	jreq 1$
      009F0C 4E 6F 20         [ 2] 2639 	jp syntax_error 
      002455                       2640 1$: 
      002455                       2641 	_xpop 
      009F0F 61 70            [ 1]    1     ld a,(y)
      009F11 70               [ 1]    2     ldw x,y 
      009F12 6C 69            [ 2]    3     ldw x,(1,x)
      009F14 63 61 74 69      [ 2]    4     addw y,#CELL_SIZE 
      009F18 6F               [ 2] 2642 	pushw x ; duration 
      00245F                       2643 	_xpop ; frequency
      009F19 6E 20            [ 1]    1     ld a,(y)
      009F1B 73               [ 1]    2     ldw x,y 
      009F1C 61 76            [ 2]    3     ldw x,(1,x)
      009F1E 65 64 2E 0A      [ 2]    4     addw y,#CELL_SIZE 
      009F22 00 93            [ 1] 2644 	ldw y,x ; frequency 
      009F23 85               [ 2] 2645 	popw x  ; duration 
      00246B                       2646 beep:  
      009F23 90               [ 2] 2647 	pushw x 
      009F24 89 C7 00         [ 2] 2648 	ldw x,#TIM2_CLK_FREQ
      009F27 04               [ 2] 2649 	divw x,y ; cntr=Fclk/freq 
                                   2650 ; round to nearest integer 
      009F28 E6 02 C1 00      [ 2] 2651 	cpw y,#TIM2_CLK_FREQ/2
      009F2C 04 2A            [ 1] 2652 	jrmi 2$
      009F2E 03               [ 1] 2653 	incw x 
      002477                       2654 2$:	 
      009F2F C7               [ 1] 2655 	ld a,xh 
      009F30 00 04 CF         [ 1] 2656 	ld TIM2_ARRH,a 
      009F33 00               [ 1] 2657 	ld a,xl 
      009F34 05 90 AE         [ 1] 2658 	ld TIM2_ARRL,a 
                                   2659 ; 50% duty cycle 
      009F37 16               [ 1] 2660 	ccf 
      009F38 68               [ 2] 2661 	rrcw x 
      009F39 CD               [ 1] 2662 	ld a,xh 
      009F3A 92 77 CD         [ 1] 2663 	ld TIM2_CCR1H,a 
      009F3D 8A               [ 1] 2664 	ld a,xl
      009F3E 21 A6 0D         [ 1] 2665 	ld TIM2_CCR1L,a
      009F41 CD 89 C4 90      [ 1] 2666 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009F45 85 81 53 00      [ 1] 2667 	bset TIM2_CR1,#TIM2_CR1_CEN
      009F47 72 10 53 04      [ 1] 2668 	bset TIM2_EGR,#TIM2_EGR_UG
      009F47 52               [ 2] 2669 	popw x 
      009F48 01 28 E6         [ 4] 2670 	call pause02
      009F49 72 11 53 08      [ 1] 2671 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009F49 0F 01 53 00      [ 1] 2672 	bres TIM2_CR1,#TIM2_CR1_CEN 
      009F4B 81               [ 4] 2673 	ret 
                                   2674 
                                   2675 ;-------------------------------
                                   2676 ; BASIC: ADCON 0|1 [,divisor]  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2677 ; disable/enanble ADC 
                                   2678 ;-------------------------------
                           000003  2679 	ONOFF=3 
                           000001  2680 	DIVSOR=1
                           000004  2681 	VSIZE=4 
      0024A2                       2682 power_adc:
      009F4B CD 98 10         [ 4] 2683 	call arg_list 
      009F4E A1 02            [ 1] 2684 	cp a,#2	
      009F50 25 08            [ 1] 2685 	jreq 1$
      009F52 A1 0A            [ 1] 2686 	cp a,#1 
      009F54 27 04            [ 1] 2687 	jreq 0$ 
      009F56 A1 80 26         [ 2] 2688 	jp syntax_error 
      009F59 07               [ 1] 2689 0$:	clr a 
      009F5A 5F               [ 1] 2690 	clrw x
      0024B2                       2691 	_xpush   ; divisor  
      009F5A 55 00 03 00      [ 2]    1     subw y,#CELL_SIZE
      009F5E 02 20            [ 1]    2     ld (y),a 
      009F60 5A EF 01         [ 2]    3     ldw (1,y),x 
      009F61                       2692 1$: _at_next 
      009F61 A1 02 27         [ 1]    1     ld a,(3,y)
      009F64 12               [ 1]    2     ldw x,y 
      009F65 A1 04            [ 2]    3     ldw x,(4,x)
      009F67 27               [ 2] 2693 	tnzw x 
      009F68 1B A1            [ 1] 2694 	jreq 2$ 
      0024C4                       2695 	_xpop
      009F6A 82 27            [ 1]    1     ld a,(y)
      009F6C 1F               [ 1]    2     ldw x,y 
      009F6D A1 08            [ 2]    3     ldw x,(1,x)
      009F6F 27 24 A1 09      [ 2]    4     addw y,#CELL_SIZE 
      0024CD                       2696 	_xdrop  
      009F73 27 24 20 37      [ 2]    1     addw y,#CELL_SIZE 
      009F77 9F               [ 1] 2697 	ld a,xl
      009F77 CD 8A            [ 1] 2698 	and a,#7
      009F79 21               [ 1] 2699 	swap a 
      009F7A 5C 72 B0         [ 1] 2700 	ld ADC_CR1,a
      009F7D 00 05 CF 00      [ 1] 2701 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009F81 01 20 C5 01      [ 1] 2702 	bset ADC_CR1,#ADC_CR1_ADON 
      009F84                       2703 	_usec_dly 7 
      009F84 CD 98 5F         [ 2]    1     ldw x,#(16*7-2)/4
      009F87 CD               [ 2]    2     decw x
      009F88 89               [ 1]    3     nop 
      009F89 C4 20            [ 1]    4     jrne .-4
      009F8B BD 08            [ 2] 2704 	jra 3$
      009F8C 72 11 54 01      [ 1] 2705 2$: bres ADC_CR1,#ADC_CR1_ADON
      009F8C CD 98 29 FD      [ 1] 2706 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      0024F1                       2707 3$:	
      009F90 CD               [ 4] 2708 	ret
                                   2709 
                                   2710 ;-----------------------------
                                   2711 ; BASIC: ADCREAD (channel)
                                   2712 ; read adc channel {0..5}
                                   2713 ; output:
                                   2714 ;   A 		TK_INTGR 
                                   2715 ;   X 		value 
                                   2716 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      0024F2                       2717 analog_read:
      009F91 89 C4 20         [ 4] 2718 	call func_args 
      009F94 B4 01            [ 1] 2719 	cp a,#1 
      009F95 27 03            [ 1] 2720 	jreq 1$
      009F95 03 01 20         [ 2] 2721 	jp syntax_error
      0024FC                       2722 1$: _xpop 
      009F98 B2 F6            [ 1]    1     ld a,(y)
      009F99 93               [ 1]    2     ldw x,y 
      009F99 CD 98            [ 2]    3     ldw x,(1,x)
      009F9B 10 A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      009F9F 03 CC 97         [ 2] 2723 	cpw x,#5 
      009FA2 0F 05            [ 2] 2724 	jrule 2$
      009FA3 A6 0A            [ 1] 2725 	ld a,#ERR_BAD_VALUE
      009FA3 CD 98 4F         [ 2] 2726 	jp tb_error 
      009FA6 9F               [ 1] 2727 2$: ld a,xl
      009FA7 A4 0F C7         [ 1] 2728 	ld acc8,a 
      009FAA 00 24            [ 1] 2729 	ld a,#5
      009FAC 20 9B 0E         [ 1] 2730 	sub a,acc8 
      009FAE C7 54 00         [ 1] 2731 	ld ADC_CSR,a
      009FAE 55 00 03 00      [ 1] 2732 	bset ADC_CR2,#ADC_CR2_ALIGN
      009FB2 02 CD 9A E8      [ 1] 2733 	bset ADC_CR1,#ADC_CR1_ADON
      009FB6 CD 98 8A 20 8E   [ 2] 2734 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009FBB CE 54 04         [ 2] 2735 	ldw x,ADC_DRH
      009FBB 0D 01            [ 1] 2736 	ld a,#TK_INTGR
      009FBD 26               [ 4] 2737 	ret 
                                   2738 
                                   2739 ;-----------------------
                                   2740 ; BASIC: DREAD(pin)
                                   2741 ; Arduino pins 
                                   2742 ; read state of a digital pin 
                                   2743 ; pin# {0..15}
                                   2744 ; output:
                                   2745 ;    A 		TK_INTGR
                                   2746 ;    X      0|1 
                                   2747 ;-------------------------
                           000001  2748 	PINNO=1
                           000001  2749 	VSIZE=1
      00252E                       2750 digital_read:
      00252E                       2751 	_vars VSIZE 
      009FBE 05 A6            [ 2]    1     sub sp,#VSIZE 
      009FC0 0D CD 89         [ 4] 2752 	call func_args
      009FC3 C4 5B            [ 1] 2753 	cp a,#1
      009FC5 01 81            [ 1] 2754 	jreq 1$
      009FC7 CC 16 8F         [ 2] 2755 	jp syntax_error
      00253A                       2756 1$: _xpop 
      009FC7 CE 00            [ 1]    1     ld a,(y)
      009FC9 05               [ 1]    2     ldw x,y 
      009FCA 1F 03            [ 2]    3     ldw x,(1,x)
      009FCC C6 00 02 6B      [ 2]    4     addw y,#CELL_SIZE 
      009FD0 05 C6 00         [ 2] 2757 	cpw x,#15 
      009FD3 04 6B            [ 2] 2758 	jrule 2$
      009FD5 06 81            [ 1] 2759 	ld a,#ERR_BAD_VALUE
      009FD7 CC 16 91         [ 2] 2760 	jp tb_error 
      009FD7 1E 03 CF         [ 4] 2761 2$:	call select_pin 
      009FDA 00 05            [ 1] 2762 	ld (PINNO,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      009FDC 7B 05            [ 1] 2763 	ld a,(GPIO_IDR,x)
      009FDE C7 00            [ 1] 2764 	tnz (PINNO,sp)
      009FE0 02 7B            [ 1] 2765 	jreq 8$
      009FE2 06               [ 1] 2766 3$: srl a 
      009FE3 C7 00            [ 1] 2767 	dec (PINNO,sp)
      009FE5 04 81            [ 1] 2768 	jrne 3$ 
      009FE7 A4 01            [ 1] 2769 8$: and a,#1 
      009FE7 90               [ 1] 2770 	clrw x 
      009FE8 89               [ 1] 2771 	ld xl,a 
      009FE9 52               [ 1] 2772 	clr a 
      002562                       2773 	_drop VSIZE
      009FEA 05 01            [ 2]    1     addw sp,#VSIZE 
      009FEB 81               [ 4] 2774 	ret
                                   2775 
                                   2776 
                                   2777 ;-----------------------
                                   2778 ; BASIC: DWRITE pin,0|1
                                   2779 ; Arduino pins 
                                   2780 ; write to a digital pin 
                                   2781 ; pin# {0..15}
                                   2782 ; output:
                                   2783 ;    A 		TK_INTGR
                                   2784 ;    X      0|1 
                                   2785 ;-------------------------
                           000001  2786 	PINNO=1
                           000002  2787 	PINVAL=2
                           000002  2788 	VSIZE=2
      002565                       2789 digital_write:
      002565                       2790 	_vars VSIZE 
      009FEB 0F 05            [ 2]    1     sub sp,#VSIZE 
      009FED CD 98 10         [ 4] 2791 	call arg_list  
      009FF0 A1 02            [ 1] 2792 	cp a,#2 
      009FF2 26 10            [ 1] 2793 	jreq 1$
      009FF4 CD 8A 21         [ 2] 2794 	jp syntax_error
      002571                       2795 1$: _xpop 
      009FF7 5C 72            [ 1]    1     ld a,(y)
      009FF9 B0               [ 1]    2     ldw x,y 
      009FFA 00 05            [ 2]    3     ldw x,(1,x)
      009FFC CF 00 01 03      [ 2]    4     addw y,#CELL_SIZE 
      00A000 05               [ 1] 2796 	ld a,xl 
      00A001 CD 98            [ 1] 2797 	ld (PINVAL,sp),a
      00257D                       2798 	_xpop 
      00A003 10 A1            [ 1]    1     ld a,(y)
      00A005 85               [ 1]    2     ldw x,y 
      00A006 27 03            [ 2]    3     ldw x,(1,x)
      00A008 CC 97 0F CD      [ 2]    4     addw y,#CELL_SIZE 
      00A00C 98 45 CF         [ 2] 2799 	cpw x,#15 
      00A00F 00 1A            [ 2] 2800 	jrule 2$
      00A011 0D 05            [ 1] 2801 	ld a,#ERR_BAD_VALUE
      00A013 26 06 CD         [ 2] 2802 	jp tb_error 
      00A016 92 4C CD         [ 4] 2803 2$:	call select_pin 
      00A019 89 C4            [ 1] 2804 	ld (PINNO,sp),a 
      00A01B A6 01            [ 1] 2805 	ld a,#1
      00A01B A6 3A            [ 1] 2806 	tnz (PINNO,sp)
      00A01D CD 89            [ 1] 2807 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



      00A01F C4               [ 1] 2808 3$: sll a
      00A020 CD 9F            [ 1] 2809 	dec (PINNO,sp)
      00A022 C7 72            [ 1] 2810 	jrne 3$
      00A024 5F 00            [ 1] 2811 4$: tnz (PINVAL,sp)
      00A026 04 CD            [ 1] 2812 	jrne 5$
      00A028 8B               [ 1] 2813 	cpl a 
      00A029 26 AE            [ 1] 2814 	and a,(GPIO_ODR,x)
      00A02B 16 68            [ 2] 2815 	jra 8$
      00A02D 3B 00            [ 1] 2816 5$: or a,(GPIO_ODR,x)
      00A02F 04 4B            [ 1] 2817 8$: ld (GPIO_ODR,x),a 
      0025AD                       2818 	_drop VSIZE 
      00A031 00 72            [ 2]    1     addw sp,#VSIZE 
      00A033 FB               [ 4] 2819 	ret
                                   2820 
                                   2821 
                                   2822 ;-----------------------
                                   2823 ; BASIC: STOP
                                   2824 ; stop progam execution  
                                   2825 ; without resetting pointers 
                                   2826 ; the program is resumed
                                   2827 ; with RUN 
                                   2828 ;-------------------------
      0025B0                       2829 stop:
      00A034 01 5C 5B 02 72   [ 2] 2830 	btjt flags,#FRUN,2$
      00A039 5F               [ 1] 2831 	clr a
      00A03A 00               [ 4] 2832 	ret 
      0025B7                       2833 2$:	 
                                   2834 ; create space on cstack to save context 
      00A03B 02 CD 8F         [ 2] 2835 	ldw x,#break_point 
      00A03E 8E A1 84         [ 4] 2836 	call puts 
      0025BD                       2837 	_drop 2 ;drop return address 
      00A041 27 12            [ 2]    1     addw sp,#2 
      0025BF                       2838 	_vars CTXT_SIZE ; context size 
      00A043 A1 11            [ 2]    1     sub sp,#CTXT_SIZE 
      00A045 CD 8F 8E         [ 4] 2839 	call save_context 
      00A048 A1 84 27         [ 2] 2840 	ldw x,#tib 
      00A04B 06 CD 9F         [ 2] 2841 	ldw basicptr,x
      00A04E D7               [ 1] 2842 	clr (x)
      00A04F CC 97 0F 03      [ 1] 2843 	clr count  
      00A052 5F               [ 1] 2844 	clrw x 
      00A052 CD 82 8D         [ 2] 2845 	ldw in.w,x
      00A055 72 11 00 22      [ 1] 2846 	bres flags,#FRUN 
      00A055 C6 00 0D CE      [ 1] 2847 	bset flags,#FBREAK
      00A059 00 0E 72         [ 2] 2848 	jp interpreter 
      00A05C C7 00 1A 72 5C 00 1B  2849 break_point: .asciz "\nbreak point, RUN to resume.\n"
             72 CF 00 1A CD 9F D7
             CD 98 10 A1 08 26 03
             CC 9F EB 75 6D 65 2E
             0A 00
                                   2850 
                                   2851 ;-----------------------
                                   2852 ; BASIC: NEW
                                   2853 ; from command line only 
                                   2854 ; free program memory
                                   2855 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2856 ;------------------------
      00A074                       2857 new: 
      00A074 A1 00 27 07 A1   [ 2] 2858 	btjf flags,#FRUN,0$ 
      00A079 0A               [ 4] 2859 	ret 
      002602                       2860 0$:	
      00A07A 27 03 CC         [ 4] 2861 	call clear_basic 
      00A07D 97               [ 4] 2862 	ret 
                                   2863 
                                   2864 ;-----------------------------------
                                   2865 ; BASIC: ERASE \E | \F 
                                   2866 ; erase all block in range from 
                                   2867 ;  'app_space' to FLASH end (0x20000)
                                   2868 ;  or all EEPROM 
                                   2869 ; that contains a non zero byte.  
                                   2870 ;-----------------------------------
                           000001  2871 	LIMIT=1 
                           000003  2872 	VSIZE = 3 
      002606                       2873 erase:
      00A07E 0F 5F 00 18      [ 1] 2874 	clr farptr 
      00A07F                       2875 	_vars VSIZE 
      00A07F 5B 05            [ 2]    1     sub sp,#VSIZE 
      00A081 90 85 81         [ 4] 2876 	call next_token 
      00A084 A1 04            [ 1] 2877 	cp a,#TK_CHAR 
      00A084 55 00            [ 1] 2878 	jreq 0$ 
      00A086 04 00 02         [ 2] 2879 	jp syntax_error
      00A089 81 17 DF         [ 4] 2880 0$: call get_char 
      00A08A A4 DF            [ 1] 2881 	and a,#0XDF 
      00A08A 52 04            [ 1] 2882 	cp a,#'E
      00A08C 0F 01            [ 1] 2883 	jrne 1$
      00A08E CD 99 D0         [ 2] 2884 	ldw x,#EEPROM_BASE 
      00A091 A1 02 24         [ 2] 2885 	ldw farptr+1,x 
      00A094 03 CC 97         [ 2] 2886 	ldw x,#EEPROM_END
      00A097 0F               [ 1] 2887 	clr a 
      00A098 A1 03            [ 2] 2888 	jra 3$ 
      00A09A 25 0C            [ 1] 2889 1$: cp a,#'F 
      00A09C 90 F6            [ 1] 2890 	jreq 2$
      00A09E 93 EE 01         [ 2] 2891 	ldw x,#err_bad_value
      00A0A1 72 A9 00         [ 2] 2892 	jp tb_error
      002635                       2893 2$:
      00A0A4 03 9F 6B         [ 2] 2894 	ldw x,#app_space  
      00A0A7 01 90 F6         [ 2] 2895 	ldw farptr+1,x 
      00A0AA 93 EE            [ 1] 2896 	ld a,#(FLASH_END>>16)&0XFF 
      00A0AC 01 72 A9         [ 2] 2897 	ldw x,#FLASH_END&0xffff
      002640                       2898 3$:
      00A0AF 00 03            [ 1] 2899 	ld (LIMIT,sp),a 
      00A0B1 9F 6B            [ 2] 2900 	ldw (LIMIT+1,sp),x 
                                   2901  ; operation done from RAM
                                   2902  ; copy code to RAM in tib   
      00A0B3 02 90 F6         [ 4] 2903 	call move_erase_to_ram
      002647                       2904 4$:	 
      00A0B6 93 EE 01         [ 4] 2905     call scan_block 
      00A0B9 72 A9            [ 1] 2906 	jreq 5$  ; block already erased 
      00A0BB 00 03            [ 1] 2907     ld a,#'E 
      00A0BD F6 14 02         [ 4] 2908     call putc 
      00A0C0 18 01 27         [ 4] 2909 	call block_erase   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



                                   2910 ; this block is clean, next  
      00A0C3 F9 5B 04         [ 2] 2911 5$:	ldw x,#BLOCK_SIZE
      00A0C6 81 08 B6         [ 4] 2912 	call incr_farptr
                                   2913 ; check limit, 24 bit substraction  	
      00A0C7 7B 01            [ 1] 2914 	ld a,(LIMIT,sp)
      00A0C7 CD 99            [ 2] 2915 	ldw x,(LIMIT+1,sp)
      00A0C9 D0 A1 02 27      [ 2] 2916 	subw x,farptr+1
      00A0CD 03 CC 97         [ 1] 2917 	sbc a,farptr 
      00A0D0 0F E0            [ 1] 2918 	jrugt 4$ 
      00A0D1 CD 14 EB         [ 4] 2919 9$: call clear_basic
      00A0D1 90 F6            [ 2] 2920 	ldw x,(LIMIT+1,sp)
      00A0D3 93 EE 01         [ 2] 2921 	cpw x,#EEPROM_END
      00A0D6 72 A9            [ 1] 2922 	jrne 10$
      00A0D8 00 03 9F         [ 4] 2923 	call func_eefree 
      002674                       2924 10$:
      002674                       2925 	_drop VSIZE 
      00A0DB 88 90            [ 2]    1     addw sp,#VSIZE 
      00A0DD F6               [ 4] 2926 	ret 
                                   2927 	
                                   2928 
                                   2929 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2930 ;  check for application signature 
                                   2931 ; output:
                                   2932 ;   Carry    0 app present 
                                   2933 ;            1 no app installed  
                                   2934 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      002677                       2935 qsign: 
      00A0DE 93 EE 01         [ 2] 2936 	ldw x,app_sign 
      00A0E1 72 A9 00         [ 2] 2937 	cpw x,SIGNATURE ; "BC" 
      00A0E4 03               [ 4] 2938 	ret 
                                   2939 
                                   2940 ;--------------------------------------
                                   2941 ;  fill write buffer 
                                   2942 ;  input:
                                   2943 ;    y  point to output buffer 
                                   2944 ;    x  point to source 
                                   2945 ;    a  bytes to write in buffer 
                                   2946 ;  output:
                                   2947 ;    y   += A 
                                   2948 ;    X   += A 
                                   2949 ;    A   0 
                                   2950 ;---------------------------------------
      00267E                       2951 fill_write_buffer:
      00A0E5 84               [ 1] 2952 	push a 
      00A0E6 FA               [ 1] 2953 	tnz a 
      00A0E7 F7 81            [ 1] 2954 	jreq 9$ 
      00A0E9 F6               [ 1] 2955 1$: ld a,(x)
      00A0E9 CD               [ 1] 2956 	incw x 
      00A0EA 99 D0            [ 1] 2957 	ld (y),a 
      00A0EC A1 02            [ 1] 2958 	incw y 
      00A0EE 27 03            [ 1] 2959 	dec (1,sp) 
      00A0F0 CC 97            [ 1] 2960 	jrne 1$ 
      00A0F2 0F               [ 1] 2961 9$:	pop a 
      00A0F3 81               [ 4] 2962     ret 	
                                   2963 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



                                   2964 ;--------------------------------------
                                   2965 ;  fill pad buffer with zero 
                                   2966 ;  input:
                                   2967 ;	none 
                                   2968 ;  output:
                                   2969 ;    y     buffer address  
                                   2970 ;--------------------------------------
      00268E                       2971 clear_block_buffer:
      00A0F3 90               [ 1] 2972 	push a 
      00A0F4 F6 93 EE 01      [ 2] 2973 	ldw y,#block_buffer 
      00A0F8 72 A9            [ 2] 2974 	pushw y
      00A0FA 00 03            [ 1] 2975 	ld a,#BLOCK_SIZE   
      00A0FC 9F 43            [ 1] 2976 1$:	clr (y)
      00A0FE 88 90            [ 1] 2977 	incw y
      00A100 F6               [ 1] 2978 	dec a  
      00A101 93 EE            [ 1] 2979 	jrne 1$ 	
      00A103 01 72            [ 2] 2980 9$: popw y 
      00A105 A9               [ 1] 2981 	pop a 			
      00A106 00               [ 4] 2982 	ret 
                                   2983 
                                   2984 
                                   2985 ;---------------------------------------
                                   2986 ; BASIC: SAVE
                                   2987 ; write application from RAM to FLASH
                                   2988 ;--------------------------------------
                           000001  2989 	XTEMP=1
                           000003  2990 	COUNT=3  ; last count bytes written 
                           000004  2991 	CNT_LO=4 ; count low byte 
                           000005  2992 	TOWRITE=5 ; how bytes left to write  
                           000006  2993 	VSIZE=6 
      0026A2                       2994 save_app:
      00A107 03               [ 2] 2995 	pushw x 
      00A108 84 F4            [ 2] 2996 	pushw y 
      0026A5                       2997 	_vars VSIZE
      00A10A F7 81            [ 2]    1     sub sp,#VSIZE 
      00A10C CD 26 77         [ 4] 2998 	call qsign 
      00A10C CD 99            [ 1] 2999 	jrne 1$
      00A10E D0 A1 02         [ 2] 3000 	ldw x,#CANT_DO 
      00A111 27 03 CC         [ 4] 3001 	call puts 
      00A114 97 0F 90         [ 2] 3002 	jp 9$
      0026B5                       3003 1$: 
      00A117 F6 93 EE         [ 2] 3004 	ldw x,txtbgn
      00A11A 01 72 A9         [ 2] 3005 	cpw x,txtend 
      00A11D 00 03            [ 1] 3006 	jrult 2$ 
      00A11F 9F 88 90         [ 2] 3007 	ldw x,#NO_APP
      00A122 F6 93 EE         [ 4] 3008 	call puts 
      00A125 01 72 A9         [ 2] 3009 	jp 9$
      0026C6                       3010 2$: 
                                   3011 ; block programming flash
                                   3012 ; must be done from RAM
                                   3013 ; moved in tib  
      00A128 00 03 84         [ 4] 3014 	call move_prg_to_ram
                                   3015 ; initialize farptr 
                                   3016 ; to app_sign address 
      00A12B F8 F7 81 18      [ 1] 3017 	clr farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      00A12E AE 35 80         [ 2] 3018 	ldw x,#app_sign 
      00A12E CD 99 CB         [ 2] 3019 	ldw farptr+1,x
                                   3020 ; initialize local variables 
      00A131 A1 02 27         [ 4] 3021 	call prog_size
      00A134 03 CC            [ 2] 3022 	ldw (TOWRITE,sp),x
      00A136 97 0F            [ 1] 3023 	clr (COUNT,sp)
                                   3024 ; first bock 
                                   3025 ; containt signature 2 bytes 
                                   3026 ; and size 	2 bytes 
                                   3027 ; use Y as pointer to block_buffer
      00A138 CD 26 8E         [ 4] 3028 	call clear_block_buffer ; -- y=*block_buffer	
                                   3029 ; write signature
      00A138 90 F6 93         [ 2] 3030 	ldw x,SIGNATURE ; "BC" 
      00A13B EE 01            [ 2] 3031 	ldw (y),x 
      00A13D 72 A9 00 03      [ 2] 3032 	addw y,#2
      00A141 9F A4            [ 2] 3033 	ldw x,(TOWRITE,sp)
      00A143 07 88            [ 2] 3034 	ldw (y),x
      00A145 A6 01 0D 01      [ 2] 3035 	addw y,#2   
      00A149 27 05            [ 1] 3036 	ld a,#(BLOCK_SIZE-4)
      00A14B 48 0A            [ 1] 3037 	ld (CNT_LO,sp),a 
      00A14D 01 20 F7         [ 2] 3038 	cpw x,#(BLOCK_SIZE-4) 
      00A150 6B 01            [ 1] 3039 	jrugt 3$
      00A152 90               [ 1] 3040 	ld a,xl 
      00A153 F6 93            [ 1] 3041 3$:	ld (CNT_LO,sp),a   
      00A155 EE 01 72         [ 2] 3042 	ldw x,txtbgn 
      00A158 A9 00            [ 2] 3043 	ldw (XTEMP,sp),x 
      0026FF                       3044 32$: 
      00A15A 03 84            [ 2] 3045 	ldw x,(XTEMP,sp)
      00A15C F4 27            [ 1] 3046 	ld a,(CNT_LO,sp)
      00A15E 02 A6 01         [ 4] 3047 	call fill_write_buffer 
      00A161 5F 97            [ 2] 3048 	ldw (XTEMP,sp),x 
      00A163 4F 81 B8         [ 2] 3049 	ldw x,#block_buffer
      00A165 CD 07 9C         [ 4] 3050 	call write_buffer
      00A165 CD 99 D0         [ 2] 3051 	ldw x,#BLOCK_SIZE 
      00A168 A1 02 27         [ 4] 3052 	call incr_farptr  
                                   3053 ; following blocks 
      00A16B 03 CC            [ 2] 3054 	ldw x,(XTEMP,sp)
      00A16D 97 0F 1D         [ 2] 3055 	cpw x,txtend 
      00A16F 24 16            [ 1] 3056 	jruge 9$ 
      00A16F 90 F6            [ 2] 3057 	ldw x,(TOWRITE,sp)
      00A171 93 EE 01         [ 2] 3058 	subw x,(COUNT,sp)
      00A174 72 A9            [ 2] 3059 	ldw (TOWRITE,sp),x 
      00A176 00 03            [ 1] 3060 	ld a,#BLOCK_SIZE 
      00A178 9F 88 90         [ 2] 3061 	cpw x,#BLOCK_SIZE 
      00A17B F6 93            [ 1] 3062 	jruge 4$ 
      00A17D EE               [ 1] 3063 	ld a,xl 
      00A17E 01 72            [ 1] 3064 4$:	ld (CNT_LO,sp),a 
      00A180 A9 00 03         [ 4] 3065 	call clear_block_buffer 
      00A183 84 F7            [ 2] 3066 	jra 32$ 
      002731                       3067 9$:	_drop VSIZE 
      00A185 81 06            [ 2]    1     addw sp,#VSIZE 
      00A186 90 85            [ 2] 3068     popw y 
      00A186 CD               [ 2] 3069 	popw x 
      00A187 99               [ 4] 3070 	ret 
                                   3071 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3072 
      00A188 CB A1                 3073 SIGNATURE: .ascii "BC"
      00A18A 01 27 03 CC 97 0F 90  3074 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             F6 93 EE 01 72 A9 00
             03 C7 00 19 CF 00 1A
             92 BC 00 19 5F 97 4F
             81 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A1A7 4E 6F 20 61 70 70 6C  3075 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3076 
                                   3077 ;---------------------
                                   3078 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3079 ; write 1 or more byte to FLASH or EEPROM
                                   3080 ; starting at address  
                                   3081 ; input:
                                   3082 ;   expr1  	is address 
                                   3083 ;   expr2,...,exprn   are bytes to write
                                   3084 ; output:
                                   3085 ;   none 
                                   3086 ;---------------------
      002791                       3087 write:
      00A1A7 CD 9B 1B         [ 4] 3088 	call expression
      00A1AA 4D 26            [ 1] 3089 	cp a,#TK_INTGR 
      00A1AC 0A 55            [ 1] 3090 	jreq 0$
      00A1AE 00 04 00         [ 2] 3091 	jp syntax_error
      00279B                       3092 0$: _xpop 
      00A1B1 02 5B            [ 1]    1     ld a,(y)
      00A1B3 02               [ 1]    2     ldw x,y 
      00A1B4 CC 97            [ 2]    3     ldw x,(1,x)
      00A1B6 C2 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A1B8 C7 00 18         [ 1] 3093 	ld farptr,a 
      00A1B8 85 52 0D         [ 2] 3094 	ldw ptr16,x 
      0027AA                       3095 1$:	
      00A1BB 89 A6 85         [ 4] 3096 	call next_token 
      00A1BE CD 99            [ 1] 3097 	cp a,#TK_COMMA 
      00A1C0 BE CD            [ 1] 3098 	jreq 2$ 
      00A1C2 98 45            [ 2] 3099 	jra 9$ ; no more data 
      00A1C4 1F 09 CD         [ 4] 3100 2$:	call expression
      00A1C7 9B E5            [ 1] 3101 	cp a,#TK_INTGR
      00A1C9 72 14            [ 1] 3102 	jreq 3$
      00A1CB 00 23 CD         [ 2] 3103 	jp syntax_error
      0027BD                       3104 3$:	_xpop 
      00A1CE 98 10            [ 1]    1     ld a,(y)
      00A1D0 A1               [ 1]    2     ldw x,y 
      00A1D1 80 27            [ 2]    3     ldw x,(1,x)
      00A1D3 03 CC 97 0F      [ 2]    4     addw y,#CELL_SIZE 
      00A1D7 9F               [ 1] 3105 	ld a,xl 
      00A1D7 CD               [ 1] 3106 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1D8 98 29 A3         [ 4] 3107 	call write_byte
      00A1DB A1 E2 27         [ 2] 3108 	ldw x,#1 
      00A1DE 03 CC 97         [ 4] 3109 	call incr_farptr 
      00A1E1 0F D7            [ 2] 3110 	jra 1$ 
      00A1E2                       3111 9$:
      00A1E2 72               [ 4] 3112 	ret 
                                   3113 
                                   3114 
                                   3115 ;---------------------
                                   3116 ;BASIC: CHAR(expr)
                                   3117 ; évaluate expression 
                                   3118 ; and take the 7 least 
                                   3119 ; bits as ASCII character
                                   3120 ; output: 
                                   3121 ; 	A char 
                                   3122 ;---------------------
      0027D4                       3123 char:
      00A1E3 04 00 23         [ 4] 3124 	call func_args 
      00A1E6 03 CC            [ 1] 3125 	cp a,#1
      00A1E8 97 0F            [ 1] 3126 	jreq 1$
      00A1EA CD 9A E8         [ 2] 3127 	jp syntax_error
      0027DE                       3128 1$:	_xpop
      00A1ED A1 84            [ 1]    1     ld a,(y)
      00A1EF 27               [ 1]    2     ldw x,y 
      00A1F0 03 CC            [ 2]    3     ldw x,(1,x)
      00A1F2 97 0F 90 F6      [ 2]    4     addw y,#CELL_SIZE 
      00A1F6 93               [ 1] 3129 	ld a,xl
      00A1F7 EE 01            [ 1] 3130 	and a,#0x7f 
      00A1F9 72               [ 4] 3131 	ret
                                   3132 
                                   3133 ;---------------------
                                   3134 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3135 ; extract first character 
                                   3136 ; of string argument 
                                   3137 ; output:
                                   3138 ;    A:X    int24 
                                   3139 ;---------------------
      0027EB                       3140 ascii:
      00A1FA A9 00            [ 1] 3141 	ld a,#TK_LPAREN
      00A1FC 03 6B 06         [ 4] 3142 	call expect 
      00A1FF 1F 07 CD         [ 4] 3143 	call next_token 
      00A202 98 10            [ 1] 3144 	cp a,#TK_QSTR 
      00A204 A1 00            [ 1] 3145 	jreq 1$
      00A206 27 11            [ 1] 3146 	cp a,#TK_CHAR 
      00A208 A1 80            [ 1] 3147 	jreq 2$ 
      00A20A 26 08            [ 1] 3148 	cp a,#TK_CFUNC 
      00A20C CD 98            [ 1] 3149 	jreq 0$
      00A20E 29 A3 A2         [ 2] 3150 	jp syntax_error
      002802                       3151 0$: ; cfunc 
      00A211 22               [ 4] 3152 	call (x)
      00A212 27 0E            [ 2] 3153 	jra 3$
      00A214                       3154 1$: ; quoted string 
      00A214 55               [ 1] 3155 	ld a,(x)
      00A215 00               [ 1] 3156 	push a  
      00A216 03 00 02         [ 4] 3157 	call skip_string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A219 84               [ 1] 3158 	pop a  	
      00A219 0F 03            [ 2] 3159 	jra 3$ 
      00280D                       3160 2$: ; character 
      00A21B AE 00 01         [ 4] 3161 	call get_char 
      00A21E 1F               [ 1] 3162 3$:	clrw x 
      00A21F 04               [ 1] 3163 	rlwa x   
      002812                       3164 4$:	_xpush  
      00A220 20 2F 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A222 90 F7            [ 1]    2     ld (y),a 
      00A222 72 04 00         [ 2]    3     ldw (1,y),x 
      00A225 23 03            [ 1] 3165 	ld a,#TK_RPAREN 
      00A227 CC 97 0F         [ 4] 3166 	call expect
      002820                       3167 9$:	
      002820                       3168 	_xpop  
      00A22A CD 9A            [ 1]    1     ld a,(y)
      00A22C E8               [ 1]    2     ldw x,y 
      00A22D A1 84            [ 2]    3     ldw x,(1,x)
      00A22F 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A233 0F               [ 4] 3169 	ret 
                                   3170 
                                   3171 ;---------------------
                                   3172 ;BASIC: KEY
                                   3173 ; wait for a character 
                                   3174 ; received from STDIN 
                                   3175 ; input:
                                   3176 ;	none 
                                   3177 ; output:
                                   3178 ;	a	 character 
                                   3179 ;---------------------
      00A234                       3180 key:
      00A234 90 F6 93         [ 4] 3181 	call getc 
      00A237 EE               [ 4] 3182 	ret
                                   3183 
                                   3184 ;----------------------
                                   3185 ; BASIC: QKEY
                                   3186 ; Return true if there 
                                   3187 ; is a character in 
                                   3188 ; waiting in STDIN 
                                   3189 ; input:
                                   3190 ;  none 
                                   3191 ; output:
                                   3192 ;   A     0|-1
                                   3193 ;-----------------------
      00282E                       3194 qkey:: 
      00A238 01               [ 1] 3195 	clrw x 
      00A239 72 A9 00         [ 1] 3196 	ld a,rx1_head
      00A23C 03 6B 03         [ 1] 3197 	sub a,rx1_tail 
      00A23F 1F 04            [ 1] 3198 	jreq 9$ 
      00A241 4D               [ 2] 3199 	cplw x
      00A242 2A 0D            [ 1] 3200 	ld a,#255    
      00283A                       3201 9$: 
      00A244 7B               [ 4] 3202 	ret 
                                   3203 
                                   3204 ;---------------------
                                   3205 ; BASIC: GPIO(port,reg)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



                                   3206 ; return gpio register address 
                                   3207 ; expr {PORTA..PORTI}
                                   3208 ; input:
                                   3209 ;   none 
                                   3210 ; output:
                                   3211 ;   A:X 	gpio register address
                                   3212 ;----------------------------
                                   3213 ;	N=PORT
                                   3214 ;	T=REG 
      00283B                       3215 gpio:
      00A245 06 1E 07         [ 4] 3216 	call func_args 
      00A248 1D 00            [ 1] 3217 	cp a,#2
      00A24A 01 A2            [ 1] 3218 	jreq 1$
      00A24C 00 6B 06         [ 2] 3219 	jp syntax_error  
      002845                       3220 1$:	_at_next 
      00A24F 1F 07 03         [ 1]    1     ld a,(3,y)
      00A251 93               [ 1]    2     ldw x,y 
      00A251 CE 00            [ 2]    3     ldw x,(4,x)
      00A253 05 1F 0D         [ 2] 3221 	cpw x,#PA_BASE 
      00A256 CE 00            [ 1] 3222 	jrmi bad_port
      00A258 01 1F 0B         [ 2] 3223 	cpw x,#PI_BASE+1 
      00A25B 72 15            [ 1] 3224 	jrpl bad_port
      00A25D 00               [ 2] 3225 	pushw x 
      002856                       3226 	_xpop
      00A25E 23 72            [ 1]    1     ld a,(y)
      00A260 5C               [ 1]    2     ldw x,y 
      00A261 00 20            [ 2]    3     ldw x,(1,x)
      00A263 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A264 72 FB 01         [ 2] 3227 	addw x,(1,sp)
      002862                       3228 	_drop 2 
      00A264 72 5D            [ 2]    1     addw sp,#2 
      00A266 00               [ 1] 3229 	clr a 
      00A267 20               [ 4] 3230 	ret
      002866                       3231 bad_port:
      00A268 26 03            [ 1] 3232 	ld a,#ERR_BAD_VALUE
      00A26A CC 97 0F         [ 2] 3233 	jp tb_error
                                   3234 
                                   3235 
                                   3236 ;-------------------------
                                   3237 ; BASIC: UFLASH 
                                   3238 ; return free flash address
                                   3239 ; input:
                                   3240 ;  none 
                                   3241 ; output:
                                   3242 ;	A		TK_INTGR
                                   3243 ;   xstack	free address 
                                   3244 ;---------------------------
      00A26D                       3245 uflash:
      00A26D A6 85 CD         [ 2] 3246 	ldw x,app_sign
      00A270 99 BE CD         [ 2] 3247 	cpw x,#4243 ; signature "BC" 
      00A273 98 45            [ 1] 3248 	jreq 1$
      00A275 13 09 27         [ 2] 3249 	ldw x,app_size 
      00A278 03 CC 97         [ 2] 3250 	addw x,#app
      00A27B 0F 03            [ 2] 3251 	jra 2$
      00A27C AE 35 80         [ 2] 3252 1$:	ldw x,#app_space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A27C CF               [ 1] 3253 2$:	clr a 
      00A27D 00               [ 4] 3254 	ret 
                                   3255 
                                   3256 
                                   3257 ;---------------------
                                   3258 ; BASIC: USR(addr[,arg])
                                   3259 ; execute a function written 
                                   3260 ; in binary code.
                                   3261 ; binary fonction should 
                                   3262 ; return token attribute in A 
                                   3263 ; and value in YL:X. 
                                   3264 ; input:
                                   3265 ;   addr	routine address 
                                   3266 ;   arg 	is an optional argument 
                                   3267 ; output:
                                   3268 ;   A 		token attribute 
                                   3269 ;   xstack  returned value 
                                   3270 ;---------------------
      002880                       3271 usr:
      00A27E 1A               [ 2] 3272 	pushw x 
      00A27F F6 EE            [ 2] 3273 	pushw y 	
      00A281 01 72 FB         [ 4] 3274 	call func_args 
      00A284 04 19            [ 1] 3275 	cp a,#1 
      00A286 03 72            [ 1] 3276 	jreq 1$
      00A288 C7 00            [ 1] 3277 	cp a,#2
      00A28A 1A 72            [ 1] 3278 	jreq 1$  
      00A28C 5C 00 1B         [ 2] 3279 	jp syntax_error 
      00A28F 72               [ 1] 3280 1$: push a 
      002892                       3281 	_xpop 
      00A290 CF 00            [ 1]    1     ld a,(y)
      00A292 1A               [ 1]    2     ldw x,y 
      00A293 C7 00            [ 2]    3     ldw x,(1,x)
      00A295 0D CF 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      00A299 7B 06            [ 1] 3282 	ldw y,x  ; arg|addr 
      00A29B 1E               [ 1] 3283     pop a 
      00A29C 07 72            [ 1] 3284 	cp a,#1 
      00A29E B0 00            [ 1] 3285 	jreq 3$
      0028A2                       3286 	_xpop  ; x=code addr  
      00A2A0 0E C2            [ 1]    1     ld a,(y)
      00A2A2 00               [ 1]    2     ldw x,y 
      00A2A3 0D 18            [ 2]    3     ldw x,(1,x)
      00A2A5 03 A8 80 2B      [ 2]    4     addw y,#CELL_SIZE 
      00A2A9 12               [ 1] 3287 	exgw x,y ; y=code addr, x=arg 
      00A2AA 20 25            [ 4] 3288 3$: call (y)
      00A2AC 7B               [ 1] 3289 	push a 
      00A2AD 03 2A            [ 1] 3290 	ld a,yl  
      0028B1                       3291 	_xpush 
      00A2AF 07 C6 00 0F      [ 2]    1     subw y,#CELL_SIZE
      00A2B3 2F 07            [ 1]    2     ld (y),a 
      00A2B5 20 1A 01         [ 2]    3     ldw (1,y),x 
      00A2B7 84               [ 1] 3292 	pop a 
      00A2B7 72 0E            [ 2] 3293 	popw y 
      00A2B9 00               [ 2] 3294 	popw x 
      00A2BA 0F               [ 4] 3295 	ret 
                                   3296 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



                                   3297 
                                   3298 ;------------------------------
                                   3299 ; BASIC: BYE 
                                   3300 ; halt mcu in its lowest power mode 
                                   3301 ; wait for reset or external interrupt
                                   3302 ; do a cold start on wakeup.
                                   3303 ;------------------------------
      0028BF                       3304 bye:
      00A2BB 15 0D 52 30 FB   [ 2] 3305 	btjf UART1_SR,#UART_SR_TC,.
      00A2BC 8E               [10] 3306 	halt
      00A2BC 1E 0D CF         [ 2] 3307 	jp cold_start  
                                   3308 
                                   3309 ;----------------------------------
                                   3310 ; BASIC: SLEEP 
                                   3311 ; halt mcu until reset or external
                                   3312 ; interrupt.
                                   3313 ; Resume progam after SLEEP command
                                   3314 ;----------------------------------
      0028C8                       3315 sleep:
      00A2BF 00 05 72 01 00   [ 2] 3316 	btjf UART1_SR,#UART_SR_TC,.
      00A2C4 23 05 E6 02      [ 1] 3317 	bset flags,#FSLEEP
      00A2C8 C7               [10] 3318 	halt 
      00A2C9 00               [ 4] 3319 	ret 
                                   3320 
                                   3321 ;-------------------------------
                                   3322 ; BASIC: PAUSE expr 
                                   3323 ; suspend execution for n msec.
                                   3324 ; input:
                                   3325 ;	none
                                   3326 ; output:
                                   3327 ;	none 
                                   3328 ;------------------------------
      0028D3                       3329 pause:
      00A2CA 04 1E 0B         [ 4] 3330 	call expression
      00A2CD CF 00            [ 1] 3331 	cp a,#TK_INTGR
      00A2CF 01 81            [ 1] 3332 	jreq 1$ 
      00A2D1 CC 16 8F         [ 2] 3333 	jp syntax_error
      0028DD                       3334 1$: _xpop 
      00A2D1 85 5B            [ 1]    1     ld a,(y)
      00A2D3 0D               [ 1]    2     ldw x,y 
      00A2D4 72 5A            [ 2]    3     ldw x,(1,x)
      00A2D6 00 20 FC 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2D9                       3335 pause02:
      00A2D9 CD 98 10         [ 2] 3336 	ldw timer,x 
      00A2DC A1 84 27         [ 2] 3337 1$: ldw x,timer 
      00A2DF 07               [ 2] 3338 	tnzw x 
      00A2E0 A1 03            [ 1] 3339 	jreq 2$
      00A2E2 27               [10] 3340 	wfi 
      00A2E3 26 CC            [ 1] 3341 	jrne 1$
      00A2E5 97               [ 1] 3342 2$:	clr a 
      00A2E6 0F               [ 4] 3343 	ret 
                                   3344 
                                   3345 ;------------------------------
                                   3346 ; BASIC: AWU expr
                                   3347 ; halt mcu for 'expr' milliseconds
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3348 ; use Auto wakeup peripheral
                                   3349 ; all oscillators stopped except LSI
                                   3350 ; range: 1ms - 511ms
                                   3351 ; input:
                                   3352 ;  none
                                   3353 ; output:
                                   3354 ;  none:
                                   3355 ;------------------------------
      00A2E7                       3356 awu:
      00A2E7 90 89 CD         [ 4] 3357   call expression
      00A2EA 98 4F            [ 1] 3358   cp a,#TK_INTGR
      00A2EC 4F 90            [ 1] 3359   jreq 1$
      00A2EE CE 00 05         [ 2] 3360   jp syntax_error
      0028FE                       3361 1$: _xpop 
      00A2F1 90 FE            [ 1]    1     ld a,(y)
      00A2F3 90               [ 1]    2     ldw x,y 
      00A2F4 89 13            [ 2]    3     ldw x,(1,x)
      00A2F6 01 5B 02 25      [ 2]    4     addw y,#CELL_SIZE 
      002907                       3362 awu02:
      00A2FA 01 4C 00         [ 2] 3363   cpw x,#5120
      00A2FC 2B 0C            [ 1] 3364   jrmi 1$ 
      00A2FC CD 8D 09 5D      [ 1] 3365   mov AWU_TBR,#15 
      00A300 26 05            [ 1] 3366   ld a,#30
      00A302 A6               [ 2] 3367   div x,a
      00A303 05 CC            [ 1] 3368   ld a,#16
      00A305 97               [ 2] 3369   div x,a 
      00A306 11 90            [ 2] 3370   jra 4$
      002918                       3371 1$: 
      00A308 85 81 00         [ 2] 3372   cpw x,#2048
      00A30A 2B 09            [ 1] 3373   jrmi 2$ 
      00A30A 90 89 89 72      [ 1] 3374   mov AWU_TBR,#14
      00A30E 5F 00            [ 1] 3375   ld a,#80
      00A310 0E               [ 2] 3376   div x,a 
      00A311 90 CE            [ 2] 3377   jra 4$   
      002926                       3378 2$:
      00A313 00 1C 90 E6      [ 1] 3379   mov AWU_TBR,#7
      00292A                       3380 3$:  
                                   3381 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A317 03 A1 03         [ 2] 3382   cpw x,#64 
      00A31A 27 15            [ 2] 3383   jrule 4$ 
      00A31C 90 E6 02 C7      [ 1] 3384   inc AWU_TBR 
      00A320 00               [ 2] 3385   srlw x 
      00A321 0F 72            [ 2] 3386   jra 3$ 
      002936                       3387 4$:
      00A323 B9               [ 1] 3388   ld a, xl
      00A324 00               [ 1] 3389   dec a 
      00A325 0E 90            [ 1] 3390   jreq 5$
      00A327 C3               [ 1] 3391   dec a 	
      00293B                       3392 5$: 
      00A328 00 1E            [ 1] 3393   and a,#0x3e 
      00A32A 25 E9 A6         [ 1] 3394   ld AWU_APR,a 
      00A32D 0A CC 97 11      [ 1] 3395   bset AWU_CSR,#AWU_CSR_AWUEN
      00A331 8E               [10] 3396   halt 
                                   3397 
      00A331 90               [ 4] 3398   ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3399 
                                   3400 ;------------------------------
                                   3401 ; BASIC: TICKS
                                   3402 ; return msec ticks counter value 
                                   3403 ; input:
                                   3404 ; 	none 
                                   3405 ; output:
                                   3406 ;	X 		TK_INTGR
                                   3407 ;-------------------------------
      002946                       3408 get_ticks:
      00A332 89 72 A9         [ 1] 3409 	ld a,ticks 
      00A335 00 04 1E         [ 2] 3410 	ldw x,ticks+1 
      00A338 03               [ 4] 3411 	ret 
                                   3412 
                                   3413 ;------------------------------
                                   3414 ; BASIC: ABS(expr)
                                   3415 ; return absolute value of expr.
                                   3416 ; input:
                                   3417 ;   none
                                   3418 ; output:
                                   3419 ;   xstack    positive int24 
                                   3420 ;-------------------------------
      00294D                       3421 abs:
      00A339 CD 94 5E         [ 4] 3422 	call func_args 
      00A33C 26 04            [ 1] 3423 	cp a,#1 
      00A33E 90 85            [ 1] 3424 	jreq 0$ 
      00A340 20 DA 8F         [ 2] 3425 	jp syntax_error
      00A342                       3426 0$:  
      00A342 85 5B 02         [ 4] 3427 	call abs24 
      00295A                       3428 	_xpop 
      00A345 90 85            [ 1]    1     ld a,(y)
      00A347 81               [ 1]    2     ldw x,y 
      00A348 EE 01            [ 2]    3     ldw x,(1,x)
      00A348 72 00 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A34C 05               [ 4] 3429 	ret 
                                   3430 
                                   3431 ;------------------------------
                                   3432 ; BASIC: AND(expr1,expr2)
                                   3433 ; Apply bit AND relation between
                                   3434 ; the 2 arguments, i.e expr1 & expr2 
                                   3435 ; output:
                                   3436 ; 	A 		TK_INTGR
                                   3437 ;   X 		result 
                                   3438 ;------------------------------
      002964                       3439 bit_and: ; i1 i2 -- i1 & i2 
      00A34D A6 06 CC         [ 4] 3440 	call func_args 
      00A350 97 11            [ 1] 3441 	cp a,#2
      00A352 CD 9A            [ 1] 3442 	jreq 1$
      00A354 E8 A1 84         [ 2] 3443 	jp syntax_error 
      00296E                       3444 1$:	_xpop 
      00A357 27 03            [ 1]    1     ld a,(y)
      00A359 CC               [ 1]    2     ldw x,y 
      00A35A 97 0F            [ 2]    3     ldw x,(1,x)
      00A35C 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A360 01               [ 2] 3445     pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A361 72               [ 1] 3446 	push  a 
      002979                       3447 	_at_top 
      00A362 A9 00            [ 1]    1     ld a,(y)
      00A364 03               [ 1]    2     ldw x,y 
      00A365 9F 27            [ 2]    3     ldw x,(1,x)
      00A367 62 88            [ 1] 3448 	and a,(1,sp)
      00A369 CD               [ 1] 3449 	rlwa x 
      00A36A 98 10            [ 1] 3450 	and a,(2,sp)
      00A36C A1               [ 1] 3451 	rlwa x 
      00A36D 80 27            [ 1] 3452 	and a,(3,sp)
      00A36F 03               [ 1] 3453 	rlwa x 
      002987                       3454 	_drop 3 
      00A370 CC 97            [ 2]    1     addw sp,#3 
      002989                       3455 	_store_top 
      00A372 0F CD            [ 1]    1     ld (y),a 
      00A374 98 29 A3         [ 2]    2     ldw (1,y),x     
      00A377 A3 D4            [ 1] 3456 	ld a,#TK_INTGR
      00A379 27               [ 4] 3457 	ret
                                   3458 
                                   3459 ;------------------------------
                                   3460 ; BASIC: OR(expr1,expr2)
                                   3461 ; Apply bit OR relation between
                                   3462 ; the 2 arguments, i.e expr1 | expr2 
                                   3463 ; output:
                                   3464 ; 	A 		TK_INTGR
                                   3465 ;   X 		result 
                                   3466 ;------------------------------
      002991                       3467 bit_or:
      00A37A 08 A3 A3         [ 4] 3468 	call func_args 
      00A37D EE 27            [ 1] 3469 	cp a,#2
      00A37F 03 CC            [ 1] 3470 	jreq 1$
      00A381 97 0F 8F         [ 2] 3471 	jp syntax_error 
      00A383                       3472 1$:	_xpop 
      00A383 84 89            [ 1]    1     ld a,(y)
      00A385 88               [ 1]    2     ldw x,y 
      00A386 EE 01            [ 2]    3     ldw x,(1,x)
      00A386 0A 01 27 26      [ 2]    4     addw y,#CELL_SIZE 
      00A38A CD               [ 2] 3473     pushw x 
      00A38B 98               [ 1] 3474 	push  a 
      0029A6                       3475 	_at_top 
      00A38C 10 A1            [ 1]    1     ld a,(y)
      00A38E 84               [ 1]    2     ldw x,y 
      00A38F 27 07            [ 2]    3     ldw x,(1,x)
      00A391 A1 03            [ 1] 3476 	or a,(1,sp)
      00A393 27 0D            [ 1] 3477 	ld yl,a 
      00A395 CC               [ 1] 3478 	ld a,xh 
      00A396 97 0F            [ 1] 3479 	or a,(2,sp)
      00A398 95               [ 1] 3480 	ld xh,a 
      00A398 C6               [ 1] 3481 	ld a,xl 
      00A399 00 02            [ 1] 3482 	or a,(3,sp)
      00A39B AB               [ 1] 3483 	ld xl,a 
      00A39C 03 C7            [ 1] 3484 	ld a,yl 
      0029B9                       3485 	_drop 3 
      00A39E 00 02            [ 2]    1     addw sp,#3 
      0029BB                       3486 	_store_top 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A3A0 20 03            [ 1]    1     ld (y),a 
      00A3A2 CD 98 36         [ 2]    2     ldw (1,y),x     
      00A3A5 A6 84            [ 1] 3487 	ld a,#TK_INTGR
      00A3A5 CD               [ 4] 3488 	ret
                                   3489 
                                   3490 ;------------------------------
                                   3491 ; BASIC: XOR(expr1,expr2)
                                   3492 ; Apply bit XOR relation between
                                   3493 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3494 ; output:
                                   3495 ; 	A 		TK_INTGR
                                   3496 ;   X 		result 
                                   3497 ;------------------------------
      0029C3                       3498 bit_xor:
      00A3A6 98 10 A1         [ 4] 3499 	call func_args 
      00A3A9 08 27            [ 1] 3500 	cp a,#2
      00A3AB DA 5B            [ 1] 3501 	jreq 1$
      00A3AD 03 20 1A         [ 2] 3502 	jp syntax_error 
      00A3B0                       3503 1$:	_xpop 
      00A3B0 5B 01            [ 1]    1     ld a,(y)
      00A3B2 CD               [ 1]    2     ldw x,y 
      00A3B3 A2 D9            [ 2]    3     ldw x,(1,x)
      00A3B5 CF 00 1A 55      [ 2]    4     addw y,#CELL_SIZE 
      00A3B9 00               [ 2] 3504     pushw x 
      00A3BA 04               [ 1] 3505 	push  a 
      0029D8                       3506 	_at_top 
      00A3BB 00 02            [ 1]    1     ld a,(y)
      00A3BD 85               [ 1]    2     ldw x,y 
      00A3BE A3 A3            [ 2]    3     ldw x,(1,x)
      00A3C0 D4 26            [ 1] 3507 	xor a,(1,sp)
      00A3C2 05 CE            [ 1] 3508 	ld yl,a 
      00A3C4 00               [ 1] 3509 	ld a,xh 
      00A3C5 1A 20            [ 1] 3510 	xor a,(2,sp)
      00A3C7 19               [ 1] 3511 	ld xh,a 
      00A3C8 9F               [ 1] 3512 	ld a,xl 
      00A3C8 20 35            [ 1] 3513 	xor a,(3,sp)
      00A3CA 97               [ 1] 3514 	ld xl,a 
      00A3CA 55 00            [ 1] 3515 	ld a,yl 
      0029EB                       3516 	_drop 3 
      00A3CC 04 00            [ 2]    1     addw sp,#3 
      0029ED                       3517 	_store_top 
      00A3CE 02 5B            [ 1]    1     ld (y),a 
      00A3D0 02 CC 97         [ 2]    2     ldw (1,y),x     
      00A3D3 C2 84            [ 1] 3518 	ld a,#TK_INTGR
      00A3D4 81               [ 4] 3519 	ret
                                   3520 
                                   3521 ;------------------------------
                                   3522 ; BASIC: LSHIFT(expr1,expr2)
                                   3523 ; logical shift left expr1 by 
                                   3524 ; expr2 bits 
                                   3525 ; output:
                                   3526 ; 	A 		TK_INTGR
                                   3527 ;   X 		result 
                                   3528 ;------------------------------
      0029F5                       3529 lshift:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A3D4 72 00 00         [ 4] 3530 	call func_args
      00A3D7 23 05            [ 1] 3531 	cp a,#2 
      00A3D9 A6 06            [ 1] 3532 	jreq 1$
      00A3DB CC 97 11         [ 2] 3533 	jp syntax_error
      00A3DE                       3534 1$: _xpop 
      00A3DE CD A2            [ 1]    1     ld a,(y)
      00A3E0 D9               [ 1]    2     ldw x,y 
      00A3E1 EE 01            [ 2]    3     ldw x,(1,x)
      00A3E1 CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A3E5 02 C7            [ 1] 3535     ldw y,x    
      002A0A                       3536 	_at_top  ; T@ 
      00A3E7 00 04            [ 1]    1     ld a,(y)
      00A3E9 35               [ 1]    2     ldw x,y 
      00A3EA 03 00            [ 2]    3     ldw x,(1,x)
      00A3EC 02 81            [ 2] 3537 	tnzw y 
      00A3EE 27 07            [ 1] 3538 	jreq 4$
      00A3EE 72               [ 1] 3539 2$:	rcf 
      00A3EF 00               [ 2] 3540 	rlcw x 
      00A3F0 00               [ 1] 3541 	rlc a 
      00A3F1 23 06            [ 2] 3542 	decw y 
      00A3F3 A6 06            [ 1] 3543 	jrne 2$
      002A1A                       3544 4$: _store_top  ; T! 
      00A3F5 CC 97            [ 1]    1     ld (y),a 
      00A3F7 11 81 01         [ 2]    2     ldw (1,y),x     
      00A3F9 A6 84            [ 1] 3545 	ld a,#TK_INTGR
      00A3F9 CD               [ 4] 3546 	ret
                                   3547 
                                   3548 ;------------------------------
                                   3549 ; BASIC: RSHIFT(expr1,expr2)
                                   3550 ; logical shift right expr1 by 
                                   3551 ; expr2 bits.
                                   3552 ; output:
                                   3553 ; 	A 		TK_INTGR
                                   3554 ;   X 		result 
                                   3555 ;------------------------------
      002A22                       3556 rshift:
      00A3FA A2 D9 CF         [ 4] 3557 	call func_args
      00A3FD 00 1A            [ 1] 3558 	cp a,#2 
      00A3FF 27 03            [ 1] 3559 	jreq 1$
      00A3FF 85 52 04         [ 2] 3560 	jp syntax_error
      002A2C                       3561 1$: _xpop 
      00A402 89 CE            [ 1]    1     ld a,(y)
      00A404 00               [ 1]    2     ldw x,y 
      00A405 1A 89            [ 2]    3     ldw x,(1,x)
      00A407 CE 00 05 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A40B 05 CE            [ 1] 3562     ldw y,x   
      002A37                       3563 	_at_top  ; T@  
      00A40D 00 01            [ 1]    1     ld a,(y)
      00A40F 1F               [ 1]    2     ldw x,y 
      00A410 07 85            [ 2]    3     ldw x,(1,x)
      00A412 20 CD            [ 2] 3564 	tnzw y 
      00A414 27 07            [ 1] 3565 	jreq 4$
      00A414 72               [ 1] 3566 2$:	rcf 
      00A415 00               [ 2] 3567 	rrcw x
      00A416 00               [ 1] 3568 	rrc a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A417 23 05            [ 2] 3569 	decw y 
      00A419 A6 06            [ 1] 3570 	jrne 2$
      002A47                       3571 4$: _store_top  ; T! 
      00A41B CC 97            [ 1]    1     ld (y),a 
      00A41D 11 EF 01         [ 2]    2     ldw (1,y),x     
      00A41E A6 84            [ 1] 3572 	ld a,#TK_INTGR
      00A41E 1E               [ 4] 3573 	ret
                                   3574 
                                   3575 ;--------------------------
                                   3576 ; BASIC: FCPU integer
                                   3577 ; set CPU frequency 
                                   3578 ;-------------------------- 
                                   3579 
      002A4F                       3580 fcpu:
      00A41F 03 CF            [ 1] 3581 	ld a,#TK_INTGR
      00A421 00 05 E6         [ 4] 3582 	call expect 
      00A424 02 C7 00         [ 4] 3583 	call get_int24 
      00A427 04               [ 1] 3584 	ld a,xl 
      00A428 1E 05            [ 1] 3585 	and a,#7 
      00A42A CF 00 01         [ 1] 3586 	ld CLK_CKDIVR,a 
      00A42D 85               [ 4] 3587 	ret 
                                   3588 
                                   3589 ;------------------------------
                                   3590 ; BASIC: PMODE pin#, mode 
                                   3591 ; Arduino pin. 
                                   3592 ; define pin as input or output
                                   3593 ; pin#: {0..15}
                                   3594 ; mode: INPUT|OUTPUT  
                                   3595 ;------------------------------
                           000001  3596 	PINNO=1
                           000001  3597 	VSIZE=1
      002A5E                       3598 pin_mode:
      002A5E                       3599 	_vars VSIZE 
      00A42E 5B 04            [ 2]    1     sub sp,#VSIZE 
      00A430 89 81 50         [ 4] 3600 	call arg_list 
      00A432 A1 02            [ 1] 3601 	cp a,#2 
      00A432 72 01            [ 1] 3602 	jreq 1$
      00A434 00 23 02         [ 2] 3603 	jp syntax_error 
      002A6A                       3604 1$: _xpop 
      00A437 4F 81            [ 1]    1     ld a,(y)
      00A439 93               [ 1]    2     ldw x,y 
      00A439 72 09            [ 2]    3     ldw x,(1,x)
      00A43B 00 23 12 5B      [ 2]    4     addw y,#CELL_SIZE 
      00A43F 02 CD            [ 1] 3605 	ldw y,x ; mode 
      002A75                       3606 	_xpop ; Dx pin 
      00A441 9F D7            [ 1]    1     ld a,(y)
      00A443 5B               [ 1]    2     ldw x,y 
      00A444 04 72            [ 2]    3     ldw x,(1,x)
      00A446 19 00 23 72      [ 2]    4     addw y,#CELL_SIZE 
      00A44A 10 00 23         [ 4] 3607 	call select_pin 
      00A44D CC 97            [ 1] 3608 	ld (PINNO,sp),a  
      00A44F BA CE            [ 1] 3609 	ld a,#1 
      00A451 00 1C            [ 1] 3610 	tnz (PINNO,sp)
      00A453 C3 00            [ 1] 3611 	jreq 4$
      00A455 1E               [ 1] 3612 2$:	sll a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



      00A456 2B 0C            [ 1] 3613 	dec (PINNO,sp)
      00A458 AE 96            [ 1] 3614 	jrne 2$ 
      00A45A 9E CD            [ 1] 3615 	ld (PINNO,sp),a
      00A45C 8A 21            [ 1] 3616 	ld a,(PINNO,sp)
      00A45E 55 00            [ 1] 3617 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A460 04 00            [ 1] 3618 	ld (GPIO_CR1,x),a 
      00A462 02 81 00 01      [ 2] 3619 4$:	cpw y,#OUTP 
      00A464 27 10            [ 1] 3620 	jreq 6$
                                   3621 ; input mode
                                   3622 ; disable external interrupt 
      00A464 5B 02            [ 1] 3623 	ld a,(PINNO,sp)
      00A466 43               [ 1] 3624 	cpl a 
      00A466 CD 9B            [ 1] 3625 	and a,(GPIO_CR2,x)
      00A468 C4 CD            [ 1] 3626 	ld (GPIO_CR2,x),a 
                                   3627 ;clear bit in DDR for input mode 
      00A46A 94 C3            [ 1] 3628 	ld a,(PINNO,sp)
      00A46C 5F               [ 1] 3629 	cpl a 
      00A46D CF 00            [ 1] 3630 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A46F 07 72            [ 1] 3631 	ld (GPIO_DDR,x),a 
      00A471 5F 00            [ 2] 3632 	jra 9$
      002AAC                       3633 6$: ;output mode  
      00A473 09 72            [ 1] 3634 	ld a,(PINNO,sp)
      00A475 5F 00            [ 1] 3635 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A477 0A CE            [ 1] 3636 	ld (GPIO_DDR,x),a 
      00A479 00 1C            [ 1] 3637 	ld a,(PINNO,sp)
      00A47B CF 00            [ 1] 3638 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A47D 05 E6            [ 1] 3639 	ld (GPIO_CR2,x),a 
      002AB8                       3640 9$:	
      002AB8                       3641 	_drop VSIZE 
      00A47F 02 C7            [ 2]    1     addw sp,#VSIZE 
      00A481 00               [ 4] 3642 	ret
                                   3643 
                                   3644 ;------------------------
                                   3645 ; select Arduino pin 
                                   3646 ; input:
                                   3647 ;   X 	 {0..15} Arduino Dx 
                                   3648 ; output:
                                   3649 ;   A     stm8s208 pin 
                                   3650 ;   X     base address s208 GPIO port 
                                   3651 ;---------------------------
      002ABB                       3652 select_pin:
      00A482 04               [ 2] 3653 	sllw x 
      00A483 35 03 00         [ 2] 3654 	addw x,#arduino_to_8s208 
      00A486 02               [ 2] 3655 	ldw x,(x)
      00A487 72               [ 1] 3656 	ld a,xl 
      00A488 10               [ 1] 3657 	push a 
      00A489 00               [ 1] 3658 	swapw x 
      00A48A 23 CC            [ 1] 3659 	ld a,#5 
      00A48C 97               [ 4] 3660 	mul x,a 
      00A48D BA 50 00         [ 2] 3661 	addw x,#GPIO_BASE 
      00A48E 84               [ 1] 3662 	pop a 
      00A48E AE               [ 4] 3663 	ret 
                                   3664 ; translation from Arduino D0..D15 to stm8s208rb 
      002ACB                       3665 arduino_to_8s208:
      00A48F 17 FF                 3666 .byte 3,6 ; D0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A491 94 CC                 3667 .byte 3,5 ; D1 
      00A493 97 9B                 3668 .byte 4,0 ; D2 
      00A495 02 01                 3669 .byte 2,1 ; D3
      00A495 CD 98                 3670 .byte 6,0 ; D4
      00A497 10 A1                 3671 .byte 2,2 ; D5
      00A499 85 27                 3672 .byte 2,3 ; D6
      00A49B 03 CC                 3673 .byte 3,1 ; D7
      00A49D 97 0F                 3674 .byte 3,3 ; D8
      00A49F CD 98                 3675 .byte 2,4 ; D9
      00A4A1 45 CF                 3676 .byte 4,5 ; D10
      00A4A3 00 1A                 3677 .byte 2,6 ; D11
      00A4A5 CD 89                 3678 .byte 2,7 ; D12
      00A4A7 CD 27                 3679 .byte 2,5 ; D13
      00A4A9 03 CD                 3680 .byte 4,2 ; D14
      00A4AB 89 D4                 3681 .byte 4,1 ; D15
                                   3682 
                                   3683 
                                   3684 ;------------------------------
                                   3685 ; BASIC: RND(expr)
                                   3686 ; return random number 
                                   3687 ; between 1 and expr inclusive
                                   3688 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3689 ; input:
                                   3690 ; 	none 
                                   3691 ; output:
                                   3692 ;	xstack 	random positive integer 
                                   3693 ;------------------------------
      002AEB                       3694 random:
      00A4AD 72 3F 00         [ 4] 3695 	call func_args 
      00A4B0 1A 72            [ 1] 3696 	cp a,#1
      00A4B2 5C 00            [ 1] 3697 	jreq 1$
      00A4B4 1B 72 3F         [ 2] 3698 	jp syntax_error
      002AF5                       3699 1$:  
      002AF5                       3700 	_xpop   
      00A4B7 00 1A            [ 1]    1     ld a,(y)
      00A4B9 72               [ 1]    2     ldw x,y 
      00A4BA 5C 00            [ 2]    3     ldw x,(1,x)
      00A4BC 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A4C0 1A               [ 2] 3701 	pushw x 
      00A4C1 81               [ 1] 3702 	push a  
      00A4C2 A6 80            [ 1] 3703 	ld a,#0x80 
      00A4C2 AE 00            [ 1] 3704 	bcp a,(1,sp)
      00A4C4 64 90            [ 1] 3705 	jreq 2$
      00A4C6 AE 03            [ 1] 3706 	ld a,#ERR_BAD_VALUE
      00A4C8 E8 20 20         [ 2] 3707 	jp tb_error
      00A4CB                       3708 2$: 
                                   3709 ; acc16=(x<<5)^x 
      00A4CB CD 99 D0         [ 2] 3710 	ldw x,seedx 
      00A4CE A1               [ 2] 3711 	sllw x 
      00A4CF 02               [ 2] 3712 	sllw x 
      00A4D0 27               [ 2] 3713 	sllw x 
      00A4D1 03               [ 2] 3714 	sllw x 
      00A4D2 CC               [ 2] 3715 	sllw x 
      00A4D3 97               [ 1] 3716 	ld a,xh 
      00A4D4 0F 00 14         [ 1] 3717 	xor a,seedx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4D5 C7 00 0D         [ 1] 3718 	ld acc16,a 
      00A4D5 90               [ 1] 3719 	ld a,xl 
      00A4D6 F6 93 EE         [ 1] 3720 	xor a,seedx+1 
      00A4D9 01 72 A9         [ 1] 3721 	ld acc8,a 
                                   3722 ; seedx=seedy 
      00A4DC 00 03 89         [ 2] 3723 	ldw x,seedy 
      00A4DF 90 F6 93         [ 2] 3724 	ldw seedx,x  
                                   3725 ; seedy=seedy^(seedy>>1)
      00A4E2 EE 01 72         [ 2] 3726 	ldw x,seedy 
      00A4E5 A9               [ 2] 3727 	srlw x 
      00A4E6 00               [ 1] 3728 	ld a,xh 
      00A4E7 03 90 93         [ 1] 3729 	xor a,seedy 
      00A4EA 85 00 16         [ 1] 3730 	ld seedy,a  
      00A4EB 9F               [ 1] 3731 	ld a,xl 
      00A4EB 89 AE F4         [ 1] 3732 	xor a,seedy+1 
      00A4EE 24 65 90         [ 1] 3733 	ld seedy+1,a 
                                   3734 ; acc16>>3 
      00A4F1 A3 7A 12         [ 2] 3735 	ldw x,acc16 
      00A4F4 2B               [ 2] 3736 	srlw x 
      00A4F5 01               [ 2] 3737 	srlw x 
      00A4F6 5C               [ 2] 3738 	srlw x 
                                   3739 ; x=acc16^x 
      00A4F7 9E               [ 1] 3740 	ld a,xh 
      00A4F7 9E C7 53         [ 1] 3741 	xor a,acc16 
      00A4FA 0D 9F C7         [ 1] 3742 	ld acc16,a 
      00A4FD 53               [ 1] 3743 	ld a,xl 
      00A4FE 0E 8C 56         [ 1] 3744 	xor a,acc8 
      00A501 9E C7 53         [ 1] 3745 	ld acc8,a 
                                   3746 ; seedy=acc16^seedy 
      00A504 0F 9F C7         [ 1] 3747 	xor a,seedy+1
      00A507 53               [ 1] 3748 	ld xl,a 
      00A508 10 72 10         [ 1] 3749 	ld a,acc16 
      00A50B 53 08 72         [ 1] 3750 	xor a,seedy
      00A50E 10               [ 1] 3751 	ld xh,a 
      00A50F 53 00 72         [ 2] 3752 	ldw seedy,x 
                                   3753 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A512 10 53 04         [ 1] 3754 	ld a,seedx+1
      00A515 85 CD            [ 1] 3755 	and a,#127
      002B60                       3756 	_xpush 
      00A517 A9 66 72 11      [ 2]    1     subw y,#CELL_SIZE
      00A51B 53 08            [ 1]    2     ld (y),a 
      00A51D 72 11 53         [ 2]    3     ldw (1,y),x 
      00A520 00               [ 1] 3757 	pop a 
      00A521 81               [ 2] 3758 	popw x 
      00A522                       3759 	_xpush 
      00A522 CD 99 D0 A1      [ 2]    1     subw y,#CELL_SIZE
      00A526 02 27            [ 1]    2     ld (y),a 
      00A528 12 A1 01         [ 2]    3     ldw (1,y),x 
      00A52B 27 03 CC         [ 4] 3760 	call mod24 
      002B77                       3761 	_xpop
      00A52E 97 0F            [ 1]    1     ld a,(y)
      00A530 4F               [ 1]    2     ldw x,y 
      00A531 5F 72            [ 2]    3     ldw x,(1,x)
      00A533 A2 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      00A537 F7 90 EF         [ 2] 3762 	addw x,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A53A 01 90            [ 1] 3763 	adc a,#0  
      00A53C E6               [ 4] 3764 	ret 
                                   3765 
                                   3766 ;---------------------------------
                                   3767 ; BASIC: WORDS 
                                   3768 ; affiche la listes des mots du
                                   3769 ; dictionnaire ainsi que le nombre
                                   3770 ; de mots.
                                   3771 ;---------------------------------
                           000001  3772 	WLEN=1 ; word length
                           000002  3773 	LLEN=2 ; character sent to console
                           000003  3774 	WCNT=3 ; count words printed 
                           000003  3775 	VSIZE=3 
      002B86                       3776 words:
      002B86                       3777 	_vars VSIZE
      00A53D 03 93            [ 2]    1     sub sp,#VSIZE 
      00A53F EE 04            [ 1] 3778 	clr (LLEN,sp)
      00A541 5D 27            [ 1] 3779 	clr (WCNT,sp)
      00A543 25 90 F6 93      [ 2] 3780 	ldw y,#kword_dict+2
      00A547 EE               [ 1] 3781 0$:	ldw x,y
      00A548 01               [ 1] 3782 	ld a,(x)
      00A549 72 A9            [ 1] 3783 	and a,#15 
      00A54B 00 03            [ 1] 3784 	ld (WLEN,sp),a 
      00A54D 72 A9            [ 1] 3785 	inc (WCNT,sp)
      00A54F 00               [ 1] 3786 1$:	incw x 
      00A550 03               [ 1] 3787 	ld a,(x)
      00A551 9F A4 07         [ 4] 3788 	call putc 
      00A554 4E C7            [ 1] 3789 	inc (LLEN,sp)
      00A556 54 01            [ 1] 3790 	dec (WLEN,sp)
      00A558 72 16            [ 1] 3791 	jrne 1$
      00A55A 50 CA            [ 1] 3792 	ld a,#70
      00A55C 72 10            [ 1] 3793 	cp a,(LLEN,sp)
      00A55E 54 01            [ 1] 3794 	jrmi 2$   
      00A560 AE 00            [ 1] 3795 	ld a,#SPACE 
      00A562 1B 5A 9D         [ 4] 3796 	call putc 
      00A565 26 FA            [ 1] 3797 	inc (LLEN,sp) 
      00A567 20 08            [ 2] 3798 	jra 3$
      00A569 72 11            [ 1] 3799 2$: ld a,#CR 
      00A56B 54 01 72         [ 4] 3800 	call putc 
      00A56E 17 50            [ 1] 3801 	clr (LLEN,sp)
      00A570 CA A2 00 02      [ 2] 3802 3$:	subw y,#2 
      00A571 90 FE            [ 2] 3803 	ldw y,(y)
      00A571 81 CF            [ 1] 3804 	jrne 0$ 
      00A572 A6 0D            [ 1] 3805 	ld a,#CR 
      00A572 CD 99 CB         [ 4] 3806 	call putc  
      00A575 A1               [ 1] 3807 	clrw x 
      00A576 01 27            [ 1] 3808 	ld a,(WCNT,sp)
      00A578 03               [ 1] 3809 	ld xl,a 
      00A579 CC 97 0F         [ 4] 3810 	call prt_i16 
      00A57C 90 F6 93         [ 2] 3811 	ldw x,#words_count_msg
      00A57F EE 01 72         [ 4] 3812 	call puts 
      002BD3                       3813 	_drop VSIZE 
      00A582 A9 00            [ 2]    1     addw sp,#VSIZE 
      00A584 03               [ 4] 3814 	ret 
      00A585 A3 00 05 23 05 A6 0A  3815 words_count_msg: .asciz " words in dictionary\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal  CC-Bits]



             69 6E 20 64 69 63 74
             69 6F 6E 61 72 79 0A
             00
                                   3816 
                                   3817 
                                   3818 ;-----------------------------
                                   3819 ; BASIC: TIMER expr 
                                   3820 ; initialize count down timer 
                                   3821 ;-----------------------------
      002BEC                       3822 set_timer:
      00A58D 97 11 9F         [ 4] 3823 	call arg_list
      00A590 C7 00            [ 1] 3824 	cp a,#1 
      00A592 0F A6            [ 1] 3825 	jreq 1$
      00A594 05 C0 00         [ 2] 3826 	jp syntax_error
      002BF6                       3827 1$: 
      002BF6                       3828 	_xpop  
      00A597 0F C7            [ 1]    1     ld a,(y)
      00A599 54               [ 1]    2     ldw x,y 
      00A59A 00 72            [ 2]    3     ldw x,(1,x)
      00A59C 16 54 02 72      [ 2]    4     addw y,#CELL_SIZE 
      00A5A0 10 54 01         [ 2] 3829 	ldw timer,x 
      00A5A3 72               [ 4] 3830 	ret 
                                   3831 
                                   3832 ;------------------------------
                                   3833 ; BASIC: TIMEOUT 
                                   3834 ; return state of timer 
                                   3835 ; output:
                                   3836 ;   A:X     0 not timeout 
                                   3837 ;   A:X     -1 timeout 
                                   3838 ;------------------------------
      002C03                       3839 timeout:
      00A5A4 0F 54 00         [ 2] 3840 	ldw x,timer 
      00A5A7 FB               [ 1] 3841 	clr a 
      00A5A8 CE 54            [ 2] 3842 	jra logical_not 
                                   3843 
                                   3844 ;--------------------------------
                                   3845 ; BASIC NOT(expr) 
                                   3846 ; return logical complement of expr
                                   3847 ;--------------------------------
      002C09                       3848 func_not:
      00A5AA 04 A6 84         [ 4] 3849 	call func_args  
      00A5AD 81 01            [ 1] 3850 	cp a,#1
      00A5AE 27 03            [ 1] 3851 	jreq 1$
      00A5AE 52 01 CD         [ 2] 3852 	jp syntax_error
      002C13                       3853 1$: _xpop 
      00A5B1 99 CB            [ 1]    1     ld a,(y)
      00A5B3 A1               [ 1]    2     ldw x,y 
      00A5B4 01 27            [ 2]    3     ldw x,(1,x)
      00A5B6 03 CC 97 0F      [ 2]    4     addw y,#CELL_SIZE 
      002C1C                       3854 logical_not: 
      00A5BA 90               [ 1] 3855 	tnz a 
      00A5BB F6 93            [ 1] 3856 	jrne 2$
      00A5BD EE               [ 2] 3857 	tnzw x 
      00A5BE 01 72            [ 1] 3858 	jrne 2$  
      00A5C0 A9               [ 1] 3859 	cpl a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A5C1 00               [ 2] 3860 	cplw x  
      00A5C2 03               [ 4] 3861 	ret 
      00A5C3 A3               [ 1] 3862 2$: clr a 
      00A5C4 00               [ 1] 3863 	clrw x 
      00A5C5 0F               [ 4] 3864 	ret 
                                   3865 
                                   3866 
                                   3867 ;-----------------------------------
                                   3868 ; BASIC: IWDGEN expr1 
                                   3869 ; enable independant watchdog timer
                                   3870 ; expr1 is delay in multiple of 62.5µsec
                                   3871 ; expr1 -> {1..16383}
                                   3872 ;-----------------------------------
      002C28                       3873 enable_iwdg:
      00A5C6 23 05 A6         [ 4] 3874 	call arg_list
      00A5C9 0A CC            [ 1] 3875 	cp a,#1 
      00A5CB 97 11            [ 1] 3876 	jreq 1$
      00A5CD CD AB 3B         [ 2] 3877 	jp syntax_error 
      002C32                       3878 1$: _xpop  
      00A5D0 6B 01            [ 1]    1     ld a,(y)
      00A5D2 E6               [ 1]    2     ldw x,y 
      00A5D3 01 0D            [ 2]    3     ldw x,(1,x)
      00A5D5 01 27 05 44      [ 2]    4     addw y,#CELL_SIZE 
      00A5D9 0A 01            [ 1] 3879 	push #0
      00A5DB 26 FB A4 01      [ 1] 3880 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A5DF 5F               [ 1] 3881 	ld a,xh 
      00A5E0 97 4F            [ 1] 3882 	and a,#0x3f
      00A5E2 5B               [ 1] 3883 	ld xh,a  
      00A5E3 01 81 FF         [ 2] 3884 2$:	cpw x,#255
      00A5E5 23 06            [ 2] 3885 	jrule 3$
      00A5E5 52 02            [ 1] 3886 	inc (1,sp)
      00A5E7 CD               [ 1] 3887 	rcf 
      00A5E8 99               [ 2] 3888 	rrcw x 
      00A5E9 D0 A1            [ 2] 3889 	jra 2$
      00A5EB 02 27 03 CC      [ 1] 3890 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5EF 97               [ 1] 3891 	pop a  
      00A5F0 0F 90 F6         [ 1] 3892 	ld IWDG_PR,a 
      00A5F3 93               [ 1] 3893 	ld a,xl
      00A5F4 EE               [ 1] 3894 	dec a 
      00A5F5 01 72 A9 00      [ 1] 3895 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A5F9 03 9F 6B         [ 1] 3896 	ld IWDG_RLR,a 
      00A5FC 02 90 F6 93      [ 1] 3897 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A600 EE               [ 4] 3898 	ret 
                                   3899 
                                   3900 
                                   3901 ;-----------------------------------
                                   3902 ; BASIC: IWDGREF  
                                   3903 ; refresh independant watchdog count down 
                                   3904 ; timer before it reset MCU. 
                                   3905 ;-----------------------------------
      002C66                       3906 refresh_iwdg:
      00A601 01 72 A9 00      [ 1] 3907 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A605 03               [ 4] 3908 	ret 
                                   3909 
                                   3910 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3911 ;-------------------------------------
                                   3912 ; BASIC: LOG(expr)
                                   3913 ; return logarithm base 2 of expr 
                                   3914 ; this is the position of most significant
                                   3915 ; bit set. 
                                   3916 ; input: 
                                   3917 ; output:
                                   3918 ;   A     TK_INTGR 
                                   3919 ;   xstack log2 
                                   3920 ;*********************************
      002C6B                       3921 log2:
      00A606 A3 00 0F         [ 4] 3922 	call func_args 
      00A609 23 05            [ 1] 3923 	cp a,#1 
      00A60B A6 0A            [ 1] 3924 	jreq 1$
      00A60D CC 97 11         [ 2] 3925 	jp syntax_error 
      002C75                       3926 1$: 
      002C75                       3927 	_xpop    
      00A610 CD AB            [ 1]    1     ld a,(y)
      00A612 3B               [ 1]    2     ldw x,y 
      00A613 6B 01            [ 2]    3     ldw x,(1,x)
      00A615 A6 01 0D 01      [ 2]    4     addw y,#CELL_SIZE 
      00A619 27               [ 1] 3928 	tnz a
      00A61A 05 48            [ 1] 3929 	jrne 2$ 
      00A61C 0A               [ 2] 3930 	tnzw x 
      00A61D 01 26            [ 1] 3931 	jrne 2$
      00A61F FB 0D            [ 1] 3932 	ld a,#ERR_BAD_VALUE
      00A621 02 26 05         [ 2] 3933 	jp tb_error 
      00A624 43 E4            [ 1] 3934 2$: push #24 
      00A626 00               [ 2] 3935 3$: rlcw x 
      00A627 20               [ 1] 3936     rlc a 
      00A628 02 EA            [ 1] 3937 	jrc 4$
      00A62A 00 E7            [ 1] 3938 	dec (1,sp) 
      00A62C 00 5B            [ 1] 3939 	jrne 3$
      00A62E 02               [ 1] 3940 4$: clrw x 
      00A62F 81               [ 1] 3941     pop a 
      00A630 4A               [ 1] 3942 	dec a
      00A630 72               [ 1] 3943 	rlwa x  
      002C97                       3944 9$:	
      00A631 00               [ 4] 3945 	ret 
                                   3946 
                                   3947 ;-----------------------------------
                                   3948 ; BASIC: BIT(expr) 
                                   3949 ; expr ->{0..23}
                                   3950 ; return 2^expr 
                                   3951 ; output:
                                   3952 ;    A:X    2^expr 
                                   3953 ;-----------------------------------
      002C98                       3954 bitmask:
      00A632 00 23 02         [ 4] 3955     call func_args 
      00A635 4F 81            [ 1] 3956 	cp a,#1
      00A637 27 03            [ 1] 3957 	jreq 1$
      00A637 AE A6 5E         [ 2] 3958 	jp syntax_error 
      002CA2                       3959 1$: _xpop 
      00A63A CD 8A            [ 1]    1     ld a,(y)
      00A63C 21               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A63D 5B 02            [ 2]    3     ldw x,(1,x)
      00A63F 52 04 CD 9F      [ 2]    4     addw y,#CELL_SIZE 
      00A643 C7               [ 1] 3960 	ld a,xl 
      00A644 AE 16 68         [ 2] 3961 	ldw x,#1 
      00A647 CF 00            [ 1] 3962 	and a,#23
      00A649 05 7F            [ 1] 3963 	jreq 9$
      00A64B 72               [ 1] 3964 	push a 
      00A64C 5F               [ 1] 3965 	clr a 
      002CB5                       3966 2$: 
      00A64D 00               [ 2] 3967 	slaw x 
      00A64E 04               [ 1] 3968 	rlc a 	
      00A64F 5F CF            [ 1] 3969 	dec (1,sp)
      00A651 00 01            [ 1] 3970 	jrne 2$ 
      002CBB                       3971 4$:
      002CBB                       3972     _drop 1 
      00A653 72 11            [ 2]    1     addw sp,#1 
      00A655 00               [ 4] 3973 9$:	ret 
                                   3974 
                                   3975 ;------------------------------
                                   3976 ; BASIC: INVERT(expr)
                                   3977 ; 1's complement 
                                   3978 ;--------------------------------
      002CBE                       3979 invert:
      00A656 23 72 18         [ 4] 3980 	call func_args
      00A659 00 23            [ 1] 3981 	cp a,#1 
      00A65B CC 97            [ 1] 3982 	jreq 1$
      00A65D BA 0A 62         [ 2] 3983 	jp syntax_error
      002CC8                       3984 1$: _xpop 
      00A660 72 65            [ 1]    1     ld a,(y)
      00A662 61               [ 1]    2     ldw x,y 
      00A663 6B 20            [ 2]    3     ldw x,(1,x)
      00A665 70 6F 69 6E      [ 2]    4     addw y,#CELL_SIZE 
      00A669 74               [ 1] 3985 	cpl a 
      00A66A 2C               [ 2] 3986 	cplw x 
      00A66B 20               [ 4] 3987 	ret 
                                   3988 
                                   3989 ;------------------------------
                                   3990 ; BASIC: DO 
                                   3991 ; initiate a DO ... UNTIL loop 
                                   3992 ;------------------------------
                           000003  3993 	DOLP_ADR=3 
                           000005  3994 	DOLP_INW=5
                           000004  3995 	VSIZE=4 
      002CD4                       3996 do_loop:
      00A66C 52               [ 2] 3997 	popw x 
      002CD5                       3998 	_vars VSIZE 
      00A66D 55 4E            [ 2]    1     sub sp,#VSIZE 
      00A66F 20               [ 2] 3999 	pushw x 
      00A670 74 6F 20         [ 2] 4000 	ldw x,basicptr 
      00A673 72 65            [ 2] 4001 	ldw (DOLP_ADR,sp),x
      00A675 73 75 6D         [ 2] 4002 	ldw x,in.w 
      00A678 65 2E            [ 2] 4003 	ldw (DOLP_INW,sp),x
      00A67A 0A 00 00 1F      [ 1] 4004 	inc loop_depth 
      00A67C 81               [ 4] 4005 	ret 
                                   4006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4007 ;--------------------------------
                                   4008 ; BASIC: UNTIL expr 
                                   4009 ; loop if exprssion is false 
                                   4010 ; else terminate loop
                                   4011 ;--------------------------------
      002CE7                       4012 until: 
      00A67C 72 01 00 23      [ 1] 4013 	tnz loop_depth 
      00A680 01 81            [ 1] 4014 	jrne 1$ 
      00A682 CC 16 8F         [ 2] 4015 	jp syntax_error 
      002CF0                       4016 1$: 
      00A682 CD 95 6B         [ 4] 4017 	call relation 
      00A685 81               [ 1] 4018 	tnz a 
      00A686 26 13            [ 1] 4019 	jrne 9$ 
      00A686 72               [ 2] 4020 	tnzw x   
      00A687 5F 00            [ 1] 4021 	jrne 9$
      00A689 19 52            [ 2] 4022 	ldw x,(DOLP_ADR,sp)
      00A68B 03 CD 98         [ 2] 4023 	ldw basicptr,x 
      00A68E 10 A1            [ 1] 4024 	ld a,(2,x)
      00A690 04 27 03         [ 1] 4025 	ld count,a 
      00A693 CC 97            [ 2] 4026 	ldw x,(DOLP_INW,sp)
      00A695 0F CD 98         [ 2] 4027 	ldw in.w,x 
      00A698 5F               [ 4] 4028 	ret 
      002D09                       4029 9$:	; remove loop data from stack  
      00A699 A4               [ 2] 4030 	popw x
      002D0A                       4031 	_drop VSIZE
      00A69A DF A1            [ 2]    1     addw sp,#VSIZE 
      00A69C 45 26 0C AE      [ 1] 4032 	dec loop_depth 
      00A6A0 40               [ 2] 4033 	jp (x)
                                   4034 
                                   4035 ;--------------------------
                                   4036 ; BASIC: PORTA...PORTI  
                                   4037 ;  return constant value 
                                   4038 ;  PORT  base address 
                                   4039 ;---------------------------
      002D11                       4040 const_porta:
      00A6A1 00 CF 00         [ 2] 4041 	ldw x,#PA_BASE 
      00A6A4 1A               [ 1] 4042 	clr a 
      00A6A5 AE               [ 4] 4043 	ret 
      002D16                       4044 const_portb:
      00A6A6 47 FF 4F         [ 2] 4045 	ldw x,#PB_BASE 
      00A6A9 20               [ 1] 4046 	clr a 
      00A6AA 15               [ 4] 4047 	ret 
      002D1B                       4048 const_portc:
      00A6AB A1 46 27         [ 2] 4049 	ldw x,#PC_BASE 
      00A6AE 06               [ 1] 4050 	clr a 
      00A6AF AE               [ 4] 4051 	ret 
      002D20                       4052 const_portd:
      00A6B0 96 4F CC         [ 2] 4053 	ldw x,#PD_BASE 
      00A6B3 97               [ 1] 4054 	clr a 
      00A6B4 11               [ 4] 4055 	ret 
      00A6B5                       4056 const_porte:
      00A6B5 AE B6 00         [ 2] 4057 	ldw x,#PE_BASE 
      00A6B8 CF               [ 1] 4058 	clr a 
      00A6B9 00               [ 4] 4059 	ret 
      002D2A                       4060 const_portf:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A6BA 1A A6 02         [ 2] 4061 	ldw x,#PF_BASE 
      00A6BD AE               [ 1] 4062 	clr a 
      00A6BE 7F               [ 4] 4063 	ret 
      002D2F                       4064 const_portg:
      00A6BF FF 50 1E         [ 2] 4065 	ldw x,#PG_BASE 
      00A6C0 4F               [ 1] 4066 	clr a 
      00A6C0 6B               [ 4] 4067 	ret 
      002D34                       4068 const_porth:
      00A6C1 01 1F 02         [ 2] 4069 	ldw x,#PH_BASE 
      00A6C4 CD               [ 1] 4070 	clr a 
      00A6C5 87               [ 4] 4071 	ret 
      002D39                       4072 const_porti:
      00A6C6 C2 50 28         [ 2] 4073 	ldw x,#PI_BASE 
      00A6C7 4F               [ 1] 4074 	clr a 
      00A6C7 CD               [ 4] 4075 	ret 
                                   4076 
                                   4077 ;-------------------------------
                                   4078 ; following return constant 
                                   4079 ; related to GPIO register offset 
                                   4080 ;---------------------------------
      002D3E                       4081 const_odr:
      00A6C8 89               [ 1] 4082 	clr a 
      00A6C9 44 27 08         [ 2] 4083 	ldw x,#GPIO_ODR
      00A6CC A6               [ 4] 4084 	ret 
      002D43                       4085 const_idr:
      00A6CD 45               [ 1] 4086 	clr a 
      00A6CE CD 89 C4         [ 2] 4087 	ldw x,#GPIO_IDR
      00A6D1 CD               [ 4] 4088 	ret 
      002D48                       4089 const_ddr:
      00A6D2 88               [ 1] 4090 	clr a
      00A6D3 40 AE 00         [ 2] 4091 	ldw x,#GPIO_DDR
      00A6D6 80               [ 4] 4092 	ret 
      002D4D                       4093 const_cr1:
      00A6D7 CD               [ 1] 4094 	clr a 
      00A6D8 89 36 7B         [ 2] 4095 	ldw x,#GPIO_CR1
      00A6DB 01               [ 4] 4096 	ret 
      002D52                       4097 const_cr2:
      00A6DC 1E               [ 1] 4098 	clr a
      00A6DD 02 72 B0         [ 2] 4099 	ldw x,#GPIO_CR2
      00A6E0 00               [ 4] 4100 	ret 
                                   4101 ;-------------------------
                                   4102 ; BASIC: POUT 
                                   4103 ;  constant for port mode
                                   4104 ;  used by PMODE 
                                   4105 ;  to set pin as output
                                   4106 ;------------------------
      002D57                       4107 const_output:
      00A6E1 1A               [ 1] 4108 	clr a 
      00A6E2 C2 00 19         [ 2] 4109 	ldw x,#OUTP
      00A6E5 22               [ 4] 4110 	ret 
                                   4111 
                                   4112 ;-------------------------
                                   4113 ; BASIC: PINP 
                                   4114 ;  constant for port mode
                                   4115 ;  used by PMODE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



                                   4116 ;  to set pin as input
                                   4117 ;------------------------
      002D5C                       4118 const_input:
      00A6E6 E0               [ 1] 4119 	clr a  
      00A6E7 CD 95 6B         [ 2] 4120 	ldw x,#INP 
      00A6EA 1E               [ 4] 4121 	ret 
                                   4122 	
                                   4123 ;-----------------------
                                   4124 ; memory area constants
                                   4125 ;-----------------------
      002D61                       4126 const_eeprom_base:
      00A6EB 02               [ 1] 4127 	clr a  
      00A6EC A3 47 FF         [ 2] 4128 	ldw x,#EEPROM_BASE 
      00A6EF 26               [ 4] 4129 	ret 
                                   4130 
                                   4131 ;---------------------------
                                   4132 ; BASIC: DATA 
                                   4133 ; when the interpreter find 
                                   4134 ; a DATA line it skip it.
                                   4135 ;---------------------------
      002D66                       4136 data:
      00A6F0 03 CD 9C 8D 01   [ 1] 4137 	mov in,count 
      00A6F4 81               [ 4] 4138 	ret 
                                   4139 
                                   4140 ;------------------------------
                                   4141 ; check if it is a DATA line 
                                   4142 ; input: 
                                   4143 ;    X    line address 
                                   4144 ; output:
                                   4145 ;    Z    set if DATA line 
                                   4146 ;----------------------------
      002D6C                       4147 is_data_line:
      00A6F4 5B 03            [ 2] 4148 	ldw x,(4,x)
      00A6F6 81 32 9A         [ 2] 4149 	ldw x,(code_addr,x)
      00A6F7 A3 2D 66         [ 2] 4150 	cpw x,#data 
      00A6F7 CE               [ 4] 4151 	ret 
                                   4152 
                                   4153 ;---------------------------
                                   4154 ; set DATA pointer at line# 
                                   4155 ; specified by X 
                                   4156 ;---------------------------
      002D75                       4157 data_line:
      00A6F8 B6 00            [ 2] 4158 	pushw y 
      00A6FA C3               [ 1] 4159 	clr a 
      00A6FB A7 B7 81         [ 4] 4160 	call search_lineno
      00A6FE 5D               [ 2] 4161 	tnzw x 
      00A6FE 88 4D            [ 1] 4162 	jrne 3$
      00A700 27 0A            [ 1] 4163 2$:	ld a,#ERR_NO_LINE 
      00A702 F6 5C 90         [ 2] 4164 	jp tb_error
      002D83                       4165 3$: ; check if valid data line 
      00A705 F7 90            [ 1] 4166     ldw y,x 
      00A707 5C 0A 01         [ 4] 4167 	call is_data_line 
      00A70A 26 F6            [ 1] 4168 	jrne 2$ 
      002D8A                       4169 set_data_ptr: 	
      00A70C 84 81 00 06      [ 2] 4170 	ldw data_ptr,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A70E 90 E6 02         [ 1] 4171 	ld a,(2,y)
      00A70E 88 90 AE         [ 1] 4172 	ld data_len,a 
      00A711 16 B8 90 89      [ 1] 4173 	mov data_ofs,#FIRST_DATA_ITEM 
      00A715 A6 80            [ 2] 4174 	popw y 
      00A717 90               [ 4] 4175 	ret
                                   4176 
                                   4177 ;---------------------------------
                                   4178 ; BASIC: RESTORE [line#]
                                   4179 ; set data_ptr to first data line
                                   4180 ; if no DATA found pointer set to
                                   4181 ; zero.
                                   4182 ; if a line# is given as argument 
                                   4183 ; a data line with that number 
                                   4184 ; is searched and the data pointer 
                                   4185 ; is set to it. If there is no 
                                   4186 ; data line with that number 
                                   4187 ; the program is interrupted. 
                                   4188 ;---------------------------------
      002D9B                       4189 restore:
      00A718 7F 90 5C 4A      [ 1] 4190 	clr data_ptr 
      00A71C 26 F9 90 85      [ 1] 4191 	clr data_ptr+1
      00A720 84 81 00 08      [ 1] 4192 	clr data_ofs 
      00A722 72 5F 00 09      [ 1] 4193 	clr data_len
      00A722 89 90 89         [ 4] 4194 	call next_token 
      00A725 52 06            [ 1] 4195 	cp a,#TK_INTGR
      00A727 CD A6            [ 1] 4196 	jrne 0$
      00A729 F7 26 09         [ 4] 4197 	call get_int24 
      00A72C AE A7            [ 2] 4198 	jra data_line 
      002DB7                       4199 0$:	
      002DB7                       4200 	_unget_token  
      00A72E B9 CD 8A 21 CC   [ 1]    1      mov in,in.saved  
      00A733 A7 B1 1B         [ 2] 4201 	ldw x,txtbgn
      00A735 90 89            [ 2] 4202 	pushw y 
                                   4203 ; search first DATA line 
      002DC1                       4204 data_search_loop: 	
      00A735 CE 00 1C         [ 2] 4205 	cpw x,txtend
      00A738 C3 00            [ 1] 4206 	jruge restore_error 
      00A73A 1E 25            [ 1] 4207 	ldw y,x 
      00A73C 09 AE A7         [ 4] 4208 	call is_data_line 
      00A73F FB CD            [ 1] 4209 	jreq set_data_ptr
      002DCD                       4210 try_next_line: 
      00A741 8A               [ 1] 4211 	ldw x,y 
      00A742 21 CC            [ 1] 4212 	ld a,(2,x)
      00A744 A7 B1 0E         [ 1] 4213 	ld acc8,a 
      00A746 72 5F 00 0D      [ 1] 4214 	clr acc16 
      00A746 CD 88 02 72      [ 2] 4215 	addw x,acc16 
      00A74A 5F 00            [ 2] 4216 	jra data_search_loop
      002DDD                       4217 restore_error:	
      00A74C 19 AE            [ 1] 4218     ld a,#ERR_NO_DATA 
      00A74E B6 00 CF         [ 2] 4219 	jp tb_error 
                                   4220 
                                   4221 
                                   4222 ;---------------------------------
                                   4223 ; BASIC: READ 
                                   4224 ; return next data item | 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4225 ;---------------------------------
                           000001  4226 	CTX_BPTR=1 
                           000003  4227 	CTX_IN=3 
                           000004  4228 	CTX_COUNT=4 
                           000005  4229 	INT24=5
                           000007  4230 	VSIZE=7 
      002DE2                       4231 read:
      002DE2                       4232 	_vars  VSIZE 
      00A751 00 1A            [ 2]    1     sub sp,#VSIZE 
      002DE4                       4233 read01:	
      00A753 CD 9D A9         [ 1] 4234 	ld a,data_ofs
      00A756 1F 05 0F         [ 1] 4235 	cp a,data_len 
      00A759 03 CD            [ 1] 4236 	jreq 2$ ; end of line  
      00A75B A7 0E CE         [ 4] 4237 	call save_context
      00A75E A7 B7 90         [ 2] 4238 	ldw x,data_ptr 
      00A761 FF 72 A9         [ 2] 4239 	ldw basicptr,x 
      00A764 00 02 1E 05 90   [ 1] 4240 	mov in,data_ofs 
      00A769 FF 72 A9 00 02   [ 1] 4241 	mov count,data_len  
      00A76E A6 7C 6B         [ 4] 4242 	call expression 
      00A771 04 A3            [ 1] 4243 	cp a,#TK_INTGR 
      00A773 00 7C            [ 1] 4244 	jreq 1$ 
      00A775 22 01 9F         [ 2] 4245 	jp syntax_error 
      002E09                       4246 1$:
      00A778 6B 04 CE         [ 4] 4247 	call next_token ; skip comma
      00A77B 00 1C 1F         [ 2] 4248 	ldw x,basicptr 
      00A77E 01 00 06         [ 2] 4249 	ldw data_ptr,x 
      00A77F 55 00 01 00 08   [ 1] 4250 	mov data_ofs,in 
      00A77F 1E 01 7B         [ 4] 4251 	call rest_context
      002E1A                       4252 	_xpop 
      00A782 04 CD            [ 1]    1     ld a,(y)
      00A784 A6               [ 1]    2     ldw x,y 
      00A785 FE 1F            [ 2]    3     ldw x,(1,x)
      00A787 01 AE 16 B8      [ 2]    4     addw y,#CELL_SIZE 
      002E23                       4253 	_drop VSIZE 
      00A78B CD 88            [ 2]    1     addw sp,#VSIZE 
      00A78D 1C               [ 4] 4254 	ret 
      002E26                       4255 2$: ; end of line reached 
      00A78E AE 00 80 CD      [ 2] 4256 	ldw y, data_ptr 
      00A792 89 36 1E 01      [ 1] 4257 	clr data_ptr
      00A796 C3 00 1E 24      [ 1] 4258 	clr data_ptr+1   
      00A79A 16 1E 05 72      [ 1] 4259 	clr data_ofs 
      00A79E F0 03 1F 05      [ 1] 4260 	clr data_len 
      00A7A2 A6 80 A3         [ 4] 4261 	call try_next_line 
      00A7A5 00 80            [ 2] 4262 	jra read01
                                   4263 
                                   4264 
                                   4265 ;---------------------------------
                                   4266 ; BASIC: SPIEN clkdiv, 0|1  
                                   4267 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4268 ; if clkdiv==-1 disable SPI
                                   4269 ; 0|1 -> disable|enable  
                                   4270 ;--------------------------------- 
                           000005  4271 SPI_CS_BIT=5
      002E3F                       4272 spi_enable:
      00A7A7 24 01 9F         [ 4] 4273 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A7AA 6B 04            [ 1] 4274 	cp a,#2
      00A7AC CD A7            [ 1] 4275 	jreq 1$
      00A7AE 0E 20 CE         [ 2] 4276 	jp syntax_error 
      002E49                       4277 1$: 
      00A7B1 5B 06 90 85      [ 1] 4278 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A7B5 85               [ 2] 4279 	popw x  
      00A7B6 81               [ 2] 4280 	tnzw x 
      00A7B7 42 43            [ 1] 4281 	jreq spi_disable 
      00A7B9 43               [ 2] 4282 	popw x 
      00A7BA 61 6E            [ 1] 4283 	ld a,#(1<<SPI_CR1_BR)
      00A7BC 27               [ 4] 4284 	mul x,a 
      00A7BD 74               [ 1] 4285 	ld a,xl 
      00A7BE 20 66 6C         [ 1] 4286 	ld SPI_CR1,a 
                                   4287 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A7C1 61 73 68 20      [ 1] 4288 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A7C5 61 70 70 6C      [ 1] 4289 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4290 ; configure SPI as master mode 0.	
      00A7C9 69 63 61 74      [ 1] 4291 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4292 ; ~CS line controlled by sofware 	
      00A7CD 69 6F 6E 2C      [ 1] 4293 	bset SPI_CR2,#SPI_CR2_SSM 
      00A7D1 20 61 6C 72      [ 1] 4294     bset SPI_CR2,#SPI_CR2_SSI 
                                   4295 ; enable SPI
      00A7D5 65 61 64 79      [ 1] 4296 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A7D9 20               [ 4] 4297 	ret 
      002E72                       4298 spi_disable:
      002E72                       4299 	_drop #2; throw first argument.
      00A7DA 6F 6E            [ 2]    1     addw sp,##2 
                                   4300 ; wait spi idle 
      00A7DC 65 20            [ 1] 4301 1$:	ld a,#0x82 
      00A7DE 69 6E 20         [ 1] 4302 	and a,SPI_SR
      00A7E1 46 4C            [ 1] 4303 	cp a,#2 
      00A7E3 41 53            [ 1] 4304 	jrne 1$
      00A7E5 48 0A 75 73      [ 1] 4305 	bres SPI_CR1,#SPI_CR1_SPE
      00A7E9 65 20 45 52      [ 1] 4306 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A7ED 41 53 45 20      [ 1] 4307 	bres PE_DDR,#SPI_CS_BIT 
      00A7F1 5C               [ 4] 4308 	ret 
                                   4309 
      002E8A                       4310 spi_clear_error:
      00A7F2 46 20            [ 1] 4311 	ld a,#0x78 
      00A7F4 62 65 66         [ 1] 4312 	bcp a,SPI_SR 
      00A7F7 6F 72            [ 1] 4313 	jreq 1$
      00A7F9 65 00 4E 6F      [ 1] 4314 	clr SPI_SR 
      00A7FD 20               [ 4] 4315 1$: ret 
                                   4316 
      002E96                       4317 spi_send_byte:
      00A7FE 61               [ 1] 4318 	push a 
      00A7FF 70 70 6C         [ 4] 4319 	call spi_clear_error
      00A802 69               [ 1] 4320 	pop a 
      00A803 63 61 74 69 6F   [ 2] 4321 	btjf SPI_SR,#SPI_SR_TXE,.
      00A808 6E 20 69         [ 1] 4322 	ld SPI_DR,a
      00A80B 6E 20 52 41 4D   [ 2] 4323 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A810 00 52 04         [ 1] 4324 	ld a,SPI_DR 
      00A811 81               [ 4] 4325 	ret 
                                   4326 
      002EAC                       4327 spi_rcv_byte:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A811 CD 9A            [ 1] 4328 	ld a,#255
      00A813 E8 A1 84 27 03   [ 2] 4329 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A818 CC 97 0F         [ 1] 4330 	ld a,SPI_DR 
      00A81B 90               [ 4] 4331 	ret
                                   4332 
                                   4333 ;------------------------------
                                   4334 ; BASIC: SPIWR byte [,byte]
                                   4335 ; write 1 or more byte
                                   4336 ;------------------------------
      002EB7                       4337 spi_write:
      00A81C F6 93 EE         [ 4] 4338 	call expression
      00A81F 01 72            [ 1] 4339 	cp a,#TK_INTGR 
      00A821 A9 00            [ 1] 4340 	jreq 1$
      00A823 03 C7 00         [ 2] 4341 	jp syntax_error 
      002EC1                       4342 1$:	
      00A826 19               [ 1] 4343 	ld a,xl 
      00A827 CF 00 1A         [ 4] 4344 	call spi_send_byte 
      00A82A CD 17 90         [ 4] 4345 	call next_token 
      00A82A CD 98            [ 1] 4346 	cp a,#TK_COMMA 
      00A82C 10 A1            [ 1] 4347 	jrne 2$ 
      00A82E 08 27            [ 2] 4348 	jra spi_write 
      00A830 02               [ 1] 4349 2$:	tnz a 
      00A831 20 20            [ 1] 4350 	jreq 3$
      002ED1                       4351 	_unget_token  
      00A833 CD 9A E8 A1 84   [ 1]    1      mov in,in.saved  
      00A838 27               [ 4] 4352 3$:	ret 
                                   4353 
                                   4354 
                                   4355 ;-------------------------------
                                   4356 ; BASIC: SPIRD 	
                                   4357 ; read one byte from SPI 
                                   4358 ;-------------------------------
      002ED7                       4359 spi_read:
      00A839 03 CC 97         [ 4] 4360 	call spi_rcv_byte 
      00A83C 0F               [ 1] 4361 	clrw x 
      00A83D 90               [ 1] 4362 	ld xl,a 
      00A83E F6               [ 1] 4363 	clr a  
      00A83F 93               [ 4] 4364 	ret 
                                   4365 
                                   4366 ;------------------------------
                                   4367 ; BASIC: SPISEL 0|1 
                                   4368 ; set state of ~CS line
                                   4369 ; 0|1 deselect|select  
                                   4370 ;------------------------------
      002EDE                       4371 spi_select:
      00A840 EE 01 72         [ 4] 4372 	call next_token 
      00A843 A9 00            [ 1] 4373 	cp a,#TK_INTGR 
      00A845 03 9F            [ 1] 4374 	jreq 1$
      00A847 5F CD 88         [ 2] 4375 	jp syntax_error 
      00A84A 66               [ 2] 4376 1$: tnzw x  
      00A84B AE 00            [ 1] 4377 	jreq cs_high 
      00A84D 01 CD 89 36      [ 1] 4378 	bres PE_ODR,#SPI_CS_BIT
      00A851 20               [ 4] 4379 	ret 
      002EF0                       4380 cs_high: 
      00A852 D7 1A 50 14      [ 1] 4381 	bset PE_ODR,#SPI_CS_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A853 81               [ 4] 4382 	ret 
                                   4383 
                                   4384 ;-------------------------------
                                   4385 ; BASIC: PAD 
                                   4386 ; Return pad buffer address.
                                   4387 ;------------------------------
      002EF5                       4388 pad_ref:
      00A853 81 16 B8         [ 2] 4389 	ldw x,#pad 
      00A854 4F               [ 1] 4390 	clr a
      00A854 CD               [ 4] 4391 	ret 
                                   4392 
                                   4393 
                                   4394 ;------------------------------
                                   4395 ;      dictionary 
                                   4396 ; format:
                                   4397 ;   link:   2 bytes 
                                   4398 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4399 ;   cmd_name: 16 byte max 
                                   4400 ;   cmd_index: 2 bytes 
                                   4401 ;------------------------------
                                   4402 	.macro _dict_entry len,name,cmd_idx 
                                   4403 	.word LINK 
                                   4404 	LINK=.
                                   4405 name:
                                   4406 	.byte len 	
                                   4407 	.ascii "name"
                                   4408 	.word cmd_idx 
                                   4409 	.endm 
                                   4410 
                           000000  4411 	LINK=0
                                   4412 ; respect alphabetic order for BASIC names from Z-A
                                   4413 ; this sort order is for a cleaner WORDS cmd output. 	
      002EFA                       4414 kword_end:
      002EFA                       4415 	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      00A855 99 CB                    1 	.word LINK 
                           002EFC     2 	LINK=.
      002EFC                          3 XOR:
      00A857 A1                       4 	.byte 3+F_IFUNC 	
      00A858 01 27 03                 5 	.ascii "XOR"
      00A85B CC 97                    6 	.word XOR_IDX 
      002F02                       4416 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A85D 0F 90                    1 	.word LINK 
                           002F04     2 	LINK=.
      002F04                          3 WRITE:
      00A85F F6                       4 	.byte 5 	
      00A860 93 EE 01 72 A9           5 	.ascii "WRITE"
      00A865 00 03                    6 	.word WRITE_IDX 
      002F0C                       4417 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A867 9F A4                    1 	.word LINK 
                           002F0E     2 	LINK=.
      002F0E                          3 WORDS:
      00A869 7F                       4 	.byte 5 	
      00A86A 81 4F 52 44 53           5 	.ascii "WORDS"
      00A86B 00 B8                    6 	.word WORDS_IDX 
      002F16                       4418 	_dict_entry 4,WAIT,WAIT_IDX;wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A86B A6 06                    1 	.word LINK 
                           002F18     2 	LINK=.
      002F18                          3 WAIT:
      00A86D CD                       4 	.byte 4 	
      00A86E 99 BE CD 98              5 	.ascii "WAIT"
      00A872 10 A1                    6 	.word WAIT_IDX 
      002F1F                       4419 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A874 02 27                    1 	.word LINK 
                           002F21     2 	LINK=.
      002F21                          3 USR:
      00A876 0E                       4 	.byte 3+F_IFUNC 	
      00A877 A1 04 27                 5 	.ascii "USR"
      00A87A 12 A1                    6 	.word USR_IDX 
      002F27                       4420 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A87C 82 27                    1 	.word LINK 
                           002F29     2 	LINK=.
      002F29                          3 UNTIL:
      00A87E 03                       4 	.byte 5 	
      00A87F CC 97 0F 49 4C           5 	.ascii "UNTIL"
      00A882 00 B2                    6 	.word UNTIL_IDX 
      002F31                       4421 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A882 FD 20                    1 	.word LINK 
                           002F33     2 	LINK=.
      002F33                          3 UFLASH:
      00A884 0B                       4 	.byte 6+F_IFUNC 	
      00A885 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A885 F6 88                    6 	.word UFLASH_IDX 
      002F3C                       4422 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A887 CD 98                    1 	.word LINK 
                           002F3E     2 	LINK=.
      002F3E                          3 UBOUND:
      00A889 36                       4 	.byte 6+F_IFUNC 	
      00A88A 84 20 03 55 4E 44        5 	.ascii "UBOUND"
      00A88D 00 AE                    6 	.word UBOUND_IDX 
      002F47                       4423 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A88D CD 98                    1 	.word LINK 
                           002F49     2 	LINK=.
      002F49                          3 TONE:
      00A88F 5F                       4 	.byte 4 	
      00A890 5F 02 72 A2              5 	.ascii "TONE"
      00A894 00 03                    6 	.word TONE_IDX 
      002F50                       4424 	_dict_entry,2,TO,TO_IDX;to
      00A896 90 F7                    1 	.word LINK 
                           002F52     2 	LINK=.
      002F52                          3 TO:
      00A898 90                       4 	.byte 2 	
      00A899 EF 01                    5 	.ascii "TO"
      00A89B A6 07                    6 	.word TO_IDX 
      002F57                       4425 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A89D CD 99                    1 	.word LINK 
                           002F59     2 	LINK=.
      002F59                          3 TIMER:
      00A89F BE                       4 	.byte 5 	
      00A8A0 54 49 4D 45 52           5 	.ascii "TIMER"
      00A8A0 90 F6                    6 	.word TIMER_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      002F61                       4426 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A8A2 93 EE                    1 	.word LINK 
                           002F63     2 	LINK=.
      002F63                          3 TIMEOUT:
      00A8A4 01                       4 	.byte 7+F_IFUNC 	
      00A8A5 72 A9 00 03 81 55 54     5 	.ascii "TIMEOUT"
      00A8AA 00 A8                    6 	.word TMROUT_IDX 
      002F6D                       4427 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A8AA CD 89                    1 	.word LINK 
                           002F6F     2 	LINK=.
      002F6F                          3 TICKS:
      00A8AC D4                       4 	.byte 5+F_IFUNC 	
      00A8AD 81 49 43 4B 53           5 	.ascii "TICKS"
      00A8AE 00 A4                    6 	.word TICKS_IDX 
      002F77                       4428 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A8AE 5F C6                    1 	.word LINK 
                           002F79     2 	LINK=.
      002F79                          3 STOP:
      00A8B0 00                       4 	.byte 4 	
      00A8B1 2F C0 00 30              5 	.ascii "STOP"
      00A8B5 27 03                    6 	.word STOP_IDX 
      002F80                       4429 	_dict_entry,4,STEP,STEP_IDX;step 
      00A8B7 53 A6                    1 	.word LINK 
                           002F82     2 	LINK=.
      002F82                          3 STEP:
      00A8B9 FF                       4 	.byte 4 	
      00A8BA 53 54 45 50              5 	.ascii "STEP"
      00A8BA 81 A0                    6 	.word STEP_IDX 
      00A8BB                       4430 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A8BB CD 99                    1 	.word LINK 
                           002F8B     2 	LINK=.
      002F8B                          3 SPIWR:
      00A8BD CB                       4 	.byte 5 	
      00A8BE A1 02 27 03 CC           5 	.ascii "SPIWR"
      00A8C3 97 0F                    6 	.word SPIWR_IDX 
      002F93                       4431 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A8C5 90 E6                    1 	.word LINK 
                           002F95     2 	LINK=.
      002F95                          3 SPISEL:
      00A8C7 03                       4 	.byte 6 	
      00A8C8 93 EE 04 A3 50 00        5 	.ascii "SPISEL"
      00A8CE 2B 16                    6 	.word SPISEL_IDX 
      002F9E                       4432 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A8D0 A3 50                    1 	.word LINK 
                           002FA0     2 	LINK=.
      002FA0                          3 SPIRD:
      00A8D2 29                       4 	.byte 5+F_IFUNC 	
      00A8D3 2A 11 89 90 F6           5 	.ascii "SPIRD"
      00A8D8 93 EE                    6 	.word SPIRD_IDX 
      002FA8                       4433 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A8DA 01 72                    1 	.word LINK 
                           002FAA     2 	LINK=.
      002FAA                          3 SPIEN:
      00A8DC A9                       4 	.byte 5 	
      00A8DD 00 03 72 FB 01           5 	.ascii "SPIEN"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A8E2 5B 02                    6 	.word SPIEN_IDX 
      002FB2                       4434 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A8E4 4F 81                    1 	.word LINK 
                           002FB4     2 	LINK=.
      00A8E6                          3 SLEEP:
      00A8E6 A6                       4 	.byte 5 	
      00A8E7 0A CC 97 11 50           5 	.ascii "SLEEP"
      00A8EB 00 96                    6 	.word SLEEP_IDX 
      002FBC                       4435     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A8EB CE B6                    1 	.word LINK 
                           002FBE     2 	LINK=.
      002FBE                          3 SIZE:
      00A8ED 00                       4 	.byte 4 	
      00A8EE A3 10 93 27              5 	.ascii "SIZE"
      00A8F2 08 CE                    6 	.word SIZE_IDX 
      002FC5                       4436 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A8F4 B6 02                    1 	.word LINK 
                           002FC7     2 	LINK=.
      002FC7                          3 SAVE:
      00A8F6 1C                       4 	.byte 4 	
      00A8F7 B6 04 20 03              5 	.ascii "SAVE"
      00A8FB AE B6                    6 	.word SAVE_IDX 
      002FCE                       4437 	_dict_entry 3,RUN,RUN_IDX;run
      00A8FD 00 4F                    1 	.word LINK 
                           002FD0     2 	LINK=.
      002FD0                          3 RUN:
      00A8FF 81                       4 	.byte 3 	
      00A900 52 55 4E                 5 	.ascii "RUN"
      00A900 89 90                    6 	.word RUN_IDX 
      002FD6                       4438 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A902 89 CD                    1 	.word LINK 
                           002FD8     2 	LINK=.
      002FD8                          3 RSHIFT:
      00A904 99                       4 	.byte 6+F_IFUNC 	
      00A905 CB A1 01 27 07 A1        5 	.ascii "RSHIFT"
      00A90B 02 27                    6 	.word RSHIFT_IDX 
      002FE1                       4439 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A90D 03 CC                    1 	.word LINK 
                           002FE3     2 	LINK=.
      002FE3                          3 RND:
      00A90F 97                       4 	.byte 3+F_IFUNC 	
      00A910 0F 88 90                 5 	.ascii "RND"
      00A913 F6 93                    6 	.word RND_IDX 
      002FE9                       4440 	_dict_entry,6,RETURN,RET_IDX;return 
      00A915 EE 01                    1 	.word LINK 
                           002FEB     2 	LINK=.
      002FEB                          3 RETURN:
      00A917 72                       4 	.byte 6 	
      00A918 A9 00 03 90 93 84        5 	.ascii "RETURN"
      00A91E A1 01                    6 	.word RET_IDX 
      002FF4                       4441 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A920 27 0A                    1 	.word LINK 
                           002FF6     2 	LINK=.
      002FF6                          3 RESTORE:
      00A922 90                       4 	.byte 7 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A923 F6 93 EE 01 72 A9 00     5 	.ascii "RESTORE"
      00A92A 03 51                    6 	.word REST_IDX 
      003000                       4442 	_dict_entry 3,REM,REM_IDX;remark 
      00A92C 90 FD                    1 	.word LINK 
                           003002     2 	LINK=.
      003002                          3 REM:
      00A92E 88                       4 	.byte 3 	
      00A92F 90 9F 72                 5 	.ascii "REM"
      00A932 A2 00                    6 	.word REM_IDX 
      003008                       4443 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A934 03 90                    1 	.word LINK 
                           00300A     2 	LINK=.
      00300A                          3 REBOOT:
      00A936 F7                       4 	.byte 6 	
      00A937 90 EF 01 84 90 85        5 	.ascii "REBOOT"
      00A93D 85 81                    6 	.word RBT_IDX 
      00A93F                       4444 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A93F 72 0D                    1 	.word LINK 
                           003015     2 	LINK=.
      003015                          3 READ:
      00A941 52                       4 	.byte 4+F_IFUNC 	
      00A942 30 FB 8E CC              5 	.ascii "READ"
      00A946 81 43                    6 	.word READ_IDX 
      00A948                       4445 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A948 72 0D                    1 	.word LINK 
                           00301E     2 	LINK=.
      00301E                          3 QKEY:
      00A94A 52                       4 	.byte 4+F_IFUNC 	
      00A94B 30 FB 72 16              5 	.ascii "QKEY"
      00A94F 00 23                    6 	.word QKEY_IDX 
      003025                       4446 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A951 8E 81                    1 	.word LINK 
                           003027     2 	LINK=.
      00A953                          3 PORTI:
      00A953 CD                       4 	.byte 5+F_IFUNC 	
      00A954 9A E8 A1 84 27           5 	.ascii "PORTI"
      00A959 03 CC                    6 	.word PRTI_IDX 
      00302F                       4447 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A95B 97 0F                    1 	.word LINK 
                           003031     2 	LINK=.
      003031                          3 PORTH:
      00A95D 90                       4 	.byte 5+F_IFUNC 	
      00A95E F6 93 EE 01 72           5 	.ascii "PORTH"
      00A963 A9 00                    6 	.word PRTH_IDX 
      003039                       4448 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A965 03 31                    1 	.word LINK 
                           00303B     2 	LINK=.
      00A966                          3 PORTG:
      00A966 CF                       4 	.byte 5+F_IFUNC 	
      00A967 00 13 CE 00 13           5 	.ascii "PORTG"
      00A96C 5D 27                    6 	.word PRTG_IDX 
      003043                       4449 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A96E 03 8F                    1 	.word LINK 
                           003045     2 	LINK=.
      003045                          3 PORTF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A970 26                       4 	.byte 5+F_IFUNC 	
      00A971 F7 4F 81 54 46           5 	.ascii "PORTF"
      00A974 00 7A                    6 	.word PRTF_IDX 
      00304D                       4450 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00A974 CD 9A                    1 	.word LINK 
                           00304F     2 	LINK=.
      00304F                          3 PORTE:
      00A976 E8                       4 	.byte 5+F_IFUNC 	
      00A977 A1 84 27 03 CC           5 	.ascii "PORTE"
      00A97C 97 0F                    6 	.word PRTE_IDX 
      003057                       4451 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00A97E 90 F6                    1 	.word LINK 
                           003059     2 	LINK=.
      003059                          3 PORTD:
      00A980 93                       4 	.byte 5+F_IFUNC 	
      00A981 EE 01 72 A9 00           5 	.ascii "PORTD"
      00A986 03 76                    6 	.word PRTD_IDX 
      00A987                       4452 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00A987 A3 14                    1 	.word LINK 
                           003063     2 	LINK=.
      003063                          3 PORTC:
      00A989 00                       4 	.byte 5+F_IFUNC 	
      00A98A 2B 0C 35 0F 50           5 	.ascii "PORTC"
      00A98F F2 A6                    6 	.word PRTC_IDX 
      00306B                       4453 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00A991 1E 62                    1 	.word LINK 
                           00306D     2 	LINK=.
      00306D                          3 PORTB:
      00A993 A6                       4 	.byte 5+F_IFUNC 	
      00A994 10 62 20 1E 42           5 	.ascii "PORTB"
      00A998 00 72                    6 	.word PRTB_IDX 
      003075                       4454 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00A998 A3 08                    1 	.word LINK 
                           003077     2 	LINK=.
      003077                          3 PORTA:
      00A99A 00                       4 	.byte 5+F_IFUNC 	
      00A99B 2B 09 35 0E 50           5 	.ascii "PORTA"
      00A9A0 F2 A6                    6 	.word PRTA_IDX 
      00307F                       4455 	_dict_entry 5,PRINT,PRT_IDX;print 
      00A9A2 50 62                    1 	.word LINK 
                           003081     2 	LINK=.
      003081                          3 PRINT:
      00A9A4 20                       4 	.byte 5 	
      00A9A5 10 52 49 4E 54           5 	.ascii "PRINT"
      00A9A6 00 6E                    6 	.word PRT_IDX 
      003089                       4456 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00A9A6 35 07                    1 	.word LINK 
                           00308B     2 	LINK=.
      00308B                          3 POUT:
      00A9A8 50                       4 	.byte 4+F_IFUNC 	
      00A9A9 F2 4F 55 54              5 	.ascii "POUT"
      00A9AA 00 6C                    6 	.word POUT_IDX 
      003092                       4457 	_dict_entry,4,POKE,POKE_IDX;poke 
      00A9AA A3 00                    1 	.word LINK 
                           003094     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      003094                          3 POKE:
      00A9AC 40                       4 	.byte 4 	
      00A9AD 23 07 72 5C              5 	.ascii "POKE"
      00A9B1 50 F2                    6 	.word POKE_IDX 
      00309B                       4458 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00A9B3 54 20                    1 	.word LINK 
                           00309D     2 	LINK=.
      00309D                          3 PMODE:
      00A9B5 F4                       4 	.byte 5 	
      00A9B6 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A9B6 9F 4A                    6 	.word PMODE_IDX 
      0030A5                       4459 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00A9B8 27 01                    1 	.word LINK 
                           0030A7     2 	LINK=.
      0030A7                          3 PINP:
      00A9BA 4A                       4 	.byte 4+F_IFUNC 	
      00A9BB 50 49 4E 50              5 	.ascii "PINP"
      00A9BB A4 3E                    6 	.word PINP_IDX 
      0030AE                       4460 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00A9BD C7 50                    1 	.word LINK 
                           0030B0     2 	LINK=.
      0030B0                          3 PEEK:
      00A9BF F1                       4 	.byte 4+F_IFUNC 	
      00A9C0 72 18 50 F0              5 	.ascii "PEEK"
      00A9C4 8E 81                    6 	.word PEEK_IDX 
      00A9C6                       4461 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00A9C6 C6 00                    1 	.word LINK 
                           0030B9     2 	LINK=.
      0030B9                          3 PAUSE:
      00A9C8 10                       4 	.byte 5 	
      00A9C9 CE 00 11 81 45           5 	.ascii "PAUSE"
      00A9CD 00 62                    6 	.word PAUSE_IDX 
      0030C1                       4462 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00A9CD CD 99                    1 	.word LINK 
                           0030C3     2 	LINK=.
      0030C3                          3 PAD:
      00A9CF CB                       4 	.byte 3+F_IFUNC 	
      00A9D0 A1 01 27                 5 	.ascii "PAD"
      00A9D3 03 CC                    6 	.word PAD_IDX 
      0030C9                       4463 	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      00A9D5 97 0F                    1 	.word LINK 
                           0030CB     2 	LINK=.
      00A9D7                          3 OR:
      00A9D7 CD                       4 	.byte 2+F_IFUNC 	
      00A9D8 82 5F                    5 	.ascii "OR"
      00A9DA 90 F6                    6 	.word OR_IDX 
      0030D0                       4464 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00A9DC 93 EE                    1 	.word LINK 
                           0030D2     2 	LINK=.
      0030D2                          3 ON:
      00A9DE 01                       4 	.byte 2 	
      00A9DF 72 A9                    5 	.ascii "ON"
      00A9E1 00 03                    6 	.word ON_IDX 
      0030D7                       4465 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00A9E3 81 D2                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



                           0030D9     2 	LINK=.
      00A9E4                          3 ODR:
      00A9E4 CD                       4 	.byte 3+F_IFUNC 	
      00A9E5 99 CB A1                 5 	.ascii "ODR"
      00A9E8 02 27                    6 	.word ODR_IDX 
      0030DF                       4466 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00A9EA 03 CC                    1 	.word LINK 
                           0030E1     2 	LINK=.
      0030E1                          3 NOT:
      00A9EC 97                       4 	.byte 3+F_IFUNC 	
      00A9ED 0F 90 F6                 5 	.ascii "NOT"
      00A9F0 93 EE                    6 	.word NOT_IDX 
      0030E7                       4467 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00A9F2 01 72                    1 	.word LINK 
                           0030E9     2 	LINK=.
      0030E9                          3 NEXT:
      00A9F4 A9                       4 	.byte 4 	
      00A9F5 00 03 89 88              5 	.ascii "NEXT"
      00A9F9 90 F6                    6 	.word NEXT_IDX 
      0030F0                       4468 	_dict_entry,3,NEW,NEW_IDX;new
      00A9FB 93 EE                    1 	.word LINK 
                           0030F2     2 	LINK=.
      0030F2                          3 NEW:
      00A9FD 01                       4 	.byte 3 	
      00A9FE 14 01 02                 5 	.ascii "NEW"
      00AA01 14 02                    6 	.word NEW_IDX 
                                   4469 ;	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      0030F8                       4470 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA03 02 14                    1 	.word LINK 
                           0030FA     2 	LINK=.
      0030FA                          3 LSHIFT:
      00AA05 03                       4 	.byte 6+F_IFUNC 	
      00AA06 02 5B 03 90 F7 90        5 	.ascii "LSHIFT"
      00AA0C EF 01                    6 	.word LSHIFT_IDX 
      003103                       4471 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AA0E A6 84                    1 	.word LINK 
                           003105     2 	LINK=.
      003105                          3 LOG:
      00AA10 81                       4 	.byte 3+F_IFUNC 	
      00AA11 4C 4F 47                 5 	.ascii "LOG"
      00AA11 CD 99                    6 	.word LOG_IDX 
      00310B                       4472 	_dict_entry 4,LIST,LIST_IDX;list
      00AA13 CB A1                    1 	.word LINK 
                           00310D     2 	LINK=.
      00310D                          3 LIST:
      00AA15 02                       4 	.byte 4 	
      00AA16 27 03 CC 97              5 	.ascii "LIST"
      00AA1A 0F 90                    6 	.word LIST_IDX 
      003114                       4473 	_dict_entry 3,LET,LET_IDX;let 
      00AA1C F6 93                    1 	.word LINK 
                           003116     2 	LINK=.
      003116                          3 LET:
      00AA1E EE                       4 	.byte 3 	
      00AA1F 01 72 A9                 5 	.ascii "LET"
      00AA22 00 03                    6 	.word LET_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00311C                       4474 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AA24 89 88                    1 	.word LINK 
                           00311E     2 	LINK=.
      00311E                          3 KEY:
      00AA26 90                       4 	.byte 3+F_CFUNC 	
      00AA27 F6 93 EE                 5 	.ascii "KEY"
      00AA2A 01 1A                    6 	.word KEY_IDX 
      003124                       4475 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AA2C 01 90                    1 	.word LINK 
                           003126     2 	LINK=.
      003126                          3 IWDGREF:
      00AA2E 97                       4 	.byte 7 	
      00AA2F 9E 1A 02 95 9F 1A 03     5 	.ascii "IWDGREF"
      00AA36 97 90                    6 	.word IWDGREF_IDX 
      003130                       4476 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AA38 9F 5B                    1 	.word LINK 
                           003132     2 	LINK=.
      003132                          3 IWDGEN:
      00AA3A 03                       4 	.byte 6 	
      00AA3B 90 F7 90 EF 01 A6        5 	.ascii "IWDGEN"
      00AA41 84 81                    6 	.word IWDGEN_IDX 
      00AA43                       4477 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AA43 CD 99                    1 	.word LINK 
                           00313D     2 	LINK=.
      00313D                          3 INVERT:
      00AA45 CB                       4 	.byte 6+F_IFUNC 	
      00AA46 A1 02 27 03 CC 97        5 	.ascii "INVERT"
      00AA4C 0F 90                    6 	.word INVERT_IDX 
      003146                       4478 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AA4E F6 93                    1 	.word LINK 
                           003148     2 	LINK=.
      003148                          3 INPUT:
      00AA50 EE                       4 	.byte 5 	
      00AA51 01 72 A9 00 03           5 	.ascii "INPUT"
      00AA56 89 88                    6 	.word INPUT_IDX 
      003150                       4479 	_dict_entry,2,IF,IF_IDX;if 
      00AA58 90 F6                    1 	.word LINK 
                           003152     2 	LINK=.
      003152                          3 IF:
      00AA5A 93                       4 	.byte 2 	
      00AA5B EE 01                    5 	.ascii "IF"
      00AA5D 18 01                    6 	.word IF_IDX 
      003157                       4480 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AA5F 90 97                    1 	.word LINK 
                           003159     2 	LINK=.
      003159                          3 IDR:
      00AA61 9E                       4 	.byte 3+F_IFUNC 	
      00AA62 18 02 95                 5 	.ascii "IDR"
      00AA65 9F 18                    6 	.word IDR_IDX 
      00315F                       4481 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AA67 03 97                    1 	.word LINK 
                           003161     2 	LINK=.
      003161                          3 HEX:
      00AA69 90                       4 	.byte 3 	
      00AA6A 9F 5B 03                 5 	.ascii "HEX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA6D 90 F7                    6 	.word HEX_IDX 
      003167                       4482 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AA6F 90 EF                    1 	.word LINK 
                           003169     2 	LINK=.
      003169                          3 GPIO:
      00AA71 01                       4 	.byte 4+F_IFUNC 	
      00AA72 A6 84 81 4F              5 	.ascii "GPIO"
      00AA75 00 3C                    6 	.word GPIO_IDX 
      003170                       4483 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AA75 CD 99                    1 	.word LINK 
                           003172     2 	LINK=.
      003172                          3 GOTO:
      00AA77 CB                       4 	.byte 4 	
      00AA78 A1 02 27 03              5 	.ascii "GOTO"
      00AA7C CC 97                    6 	.word GOTO_IDX 
      003179                       4484 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AA7E 0F 90                    1 	.word LINK 
                           00317B     2 	LINK=.
      00317B                          3 GOSUB:
      00AA80 F6                       4 	.byte 5 	
      00AA81 93 EE 01 72 A9           5 	.ascii "GOSUB"
      00AA86 00 03                    6 	.word GOSUB_IDX 
      003183                       4485 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AA88 90 93                    1 	.word LINK 
                           003185     2 	LINK=.
      003185                          3 GET:
      00AA8A 90                       4 	.byte 3 	
      00AA8B F6 93 EE                 5 	.ascii "GET"
      00AA8E 01 90                    6 	.word GET_IDX 
      00318B                       4486 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AA90 5D 27                    1 	.word LINK 
                           00318D     2 	LINK=.
      00318D                          3 FREE:
      00AA92 07                       4 	.byte 4+F_IFUNC 	
      00AA93 98 59 49 90              5 	.ascii "FREE"
      00AA97 5A 26                    6 	.word FREE_IDX 
      003194                       4487 	_dict_entry,3,FOR,FOR_IDX;for 
      00AA99 F9 90                    1 	.word LINK 
                           003196     2 	LINK=.
      003196                          3 FOR:
      00AA9B F7                       4 	.byte 3 	
      00AA9C 90 EF 01                 5 	.ascii "FOR"
      00AA9F A6 84                    6 	.word FOR_IDX 
      00319C                       4488 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AAA1 81 96                    1 	.word LINK 
                           00319E     2 	LINK=.
      00AAA2                          3 FCPU:
      00AAA2 CD                       4 	.byte 4 	
      00AAA3 99 CB A1 02              5 	.ascii "FCPU"
      00AAA7 27 03                    6 	.word FCPU_IDX 
      0031A5                       4489 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AAA9 CC 97                    1 	.word LINK 
                           0031A7     2 	LINK=.
      0031A7                          3 ERASE:
      00AAAB 0F                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAAC 90 F6 93 EE 01           5 	.ascii "ERASE"
      00AAB1 72 A9                    6 	.word ERASE_IDX 
      0031AF                       4490 	_dict_entry,3,END,END_IDX;cmd_end  
      00AAB3 00 03                    1 	.word LINK 
                           0031B1     2 	LINK=.
      0031B1                          3 END:
      00AAB5 90                       4 	.byte 3 	
      00AAB6 93 90 F6                 5 	.ascii "END"
      00AAB9 93 EE                    6 	.word END_IDX 
      0031B7                       4491 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AABB 01 90                    1 	.word LINK 
                           0031B9     2 	LINK=.
      0031B9                          3 EEPROM:
      00AABD 5D                       4 	.byte 6+F_IFUNC 	
      00AABE 27 07 98 56 46 90        5 	.ascii "EEPROM"
      00AAC4 5A 26                    6 	.word EEPROM_IDX 
      0031C2                       4492 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AAC6 F9 90                    1 	.word LINK 
                           0031C4     2 	LINK=.
      0031C4                          3 EEFREE:
      00AAC8 F7                       4 	.byte 6+F_IFUNC 	
      00AAC9 90 EF 01 A6 84 81        5 	.ascii "EEFREE"
      00AACF 00 C6                    6 	.word EEFREE_IDX 
      0031CD                       4493 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AACF A6 84                    1 	.word LINK 
                           0031CF     2 	LINK=.
      0031CF                          3 EDIT:
      00AAD1 CD                       4 	.byte 4 	
      00AAD2 99 BE CD 98              5 	.ascii "EDIT"
      00AAD6 4F 9F                    6 	.word EDIT_IDX 
      0031D6                       4494 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AAD8 A4 07                    1 	.word LINK 
                           0031D8     2 	LINK=.
      0031D8                          3 DWRITE:
      00AADA C7                       4 	.byte 6+F_CMD 	
      00AADB 50 C6 81 49 54 45        5 	.ascii "DWRITE"
      00AADE 00 28                    6 	.word DWRITE_IDX 
      0031E1                       4495 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AADE 52 01                    1 	.word LINK 
                           0031E3     2 	LINK=.
      0031E3                          3 DREAD:
      00AAE0 CD                       4 	.byte 5+F_IFUNC 	
      00AAE1 99 D0 A1 02 27           5 	.ascii "DREAD"
      00AAE6 03 CC                    6 	.word DREAD_IDX 
      0031EB                       4496 	_dict_entry,2,DO,DO_IDX;do_loop
      00AAE8 97 0F                    1 	.word LINK 
                           0031ED     2 	LINK=.
      0031ED                          3 DO:
      00AAEA 90                       4 	.byte 2 	
      00AAEB F6 93                    5 	.ascii "DO"
      00AAED EE 01                    6 	.word DO_IDX 
      0031F2                       4497 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AAEF 72 A9                    1 	.word LINK 
                           0031F4     2 	LINK=.
      0031F4                          3 DEC:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAF1 00                       4 	.byte 3 	
      00AAF2 03 90 93                 5 	.ascii "DEC"
      00AAF5 90 F6                    6 	.word DEC_IDX 
      0031FA                       4498 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AAF7 93 EE                    1 	.word LINK 
                           0031FC     2 	LINK=.
      0031FC                          3 DDR:
      00AAF9 01                       4 	.byte 3+F_IFUNC 	
      00AAFA 72 A9 00                 5 	.ascii "DDR"
      00AAFD 03 CD                    6 	.word DDR_IDX 
      003202                       4499 	_dict_entry,4,DATA,DATA_IDX;data  
      00AAFF AB 3B                    1 	.word LINK 
                           003204     2 	LINK=.
      003204                          3 DATA:
      00AB01 6B                       4 	.byte 4 	
      00AB02 01 A6 01 0D              5 	.ascii "DATA"
      00AB06 01 27                    6 	.word DATA_IDX 
      00320B                       4500 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AB08 0D 48                    1 	.word LINK 
                           00320D     2 	LINK=.
      00320D                          3 CRL:
      00AB0A 0A                       4 	.byte 3+F_IFUNC 	
      00AB0B 01 26 FB                 5 	.ascii "CRL"
      00AB0E 6B 01                    6 	.word CRL_IDX 
      003213                       4501 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AB10 7B 01                    1 	.word LINK 
                           003215     2 	LINK=.
      003215                          3 CRH:
      00AB12 EA                       4 	.byte 3+F_IFUNC 	
      00AB13 03 E7 03                 5 	.ascii "CRH"
      00AB16 90 A3                    6 	.word CRH_IDX 
      00321B                       4502 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB18 00 01                    1 	.word LINK 
                           00321D     2 	LINK=.
      00321D                          3 CONST:
      00AB1A 27                       4 	.byte 5 	
      00AB1B 10 7B 01 43 E4           5 	.ascii "CONST"
      00AB20 04 E7                    6 	.word CONST_IDX 
      003225                       4503 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB22 04 7B                    1 	.word LINK 
                           003227     2 	LINK=.
      003227                          3 CHAR:
      00AB24 01                       4 	.byte 4+F_CFUNC 	
      00AB25 43 E4 02 E7              5 	.ascii "CHAR"
      00AB29 02 20                    6 	.word CHAR_IDX 
      00322E                       4504 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AB2B 0C 27                    1 	.word LINK 
                           003230     2 	LINK=.
      00AB2C                          3 BYE:
      00AB2C 7B                       4 	.byte 3 	
      00AB2D 01 EA 02                 5 	.ascii "BYE"
      00AB30 E7 02                    6 	.word BYE_IDX 
      003236                       4505 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AB32 7B 01                    1 	.word LINK 
                           003238     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      003238                          3 BTOGL:
      00AB34 EA                       4 	.byte 5 	
      00AB35 04 E7 04 47 4C           5 	.ascii "BTOGL"
      00AB38 00 14                    6 	.word BTOGL_IDX 
      003240                       4506 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AB38 5B 01                    1 	.word LINK 
                           003242     2 	LINK=.
      003242                          3 BTEST:
      00AB3A 81                       4 	.byte 5+F_IFUNC 	
      00AB3B 42 54 45 53 54           5 	.ascii "BTEST"
      00AB3B 58 1C                    6 	.word BTEST_IDX 
      00324A                       4507 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AB3D AB 4B                    1 	.word LINK 
                           00324C     2 	LINK=.
      00324C                          3 BSET:
      00AB3F FE                       4 	.byte 4 	
      00AB40 9F 88 5E A6              5 	.ascii "BSET"
      00AB44 05 42                    6 	.word BSET_IDX 
      003253                       4508 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AB46 1C 50                    1 	.word LINK 
                           003255     2 	LINK=.
      003255                          3 BRES:
      00AB48 00                       4 	.byte 4 	
      00AB49 84 81 45 53              5 	.ascii "BRES"
      00AB4B 00 0E                    6 	.word BRES_IDX 
      00325C                       4509 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AB4B 03 06                    1 	.word LINK 
                           00325E     2 	LINK=.
      00325E                          3 BIT:
      00AB4D 03                       4 	.byte 3+F_IFUNC 	
      00AB4E 05 04 00                 5 	.ascii "BIT"
      00AB51 02 01                    6 	.word BIT_IDX 
      003264                       4510 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AB53 06 00                    1 	.word LINK 
                           003266     2 	LINK=.
      003266                          3 AWU:
      00AB55 02                       4 	.byte 3 	
      00AB56 02 02 03                 5 	.ascii "AWU"
      00AB59 03 01                    6 	.word AWU_IDX 
      00326C                       4511 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AB5B 03 03                    1 	.word LINK 
                           00326E     2 	LINK=.
      00326E                          3 ASC:
      00AB5D 02                       4 	.byte 3+F_IFUNC 	
      00AB5E 04 04 05                 5 	.ascii "ASC"
      00AB61 02 06                    6 	.word ASC_IDX 
      003274                       4512 	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      00AB63 02 07                    1 	.word LINK 
                           003276     2 	LINK=.
      003276                          3 AND:
      00AB65 02                       4 	.byte 3+F_IFUNC 	
      00AB66 05 04 02                 5 	.ascii "AND"
      00AB69 04 01                    6 	.word AND_IDX 
      00AB6B                       4513 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AB6B CD 99                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



                           00327E     2 	LINK=.
      00327E                          3 ADCREAD:
      00AB6D CB                       4 	.byte 7+F_IFUNC 	
      00AB6E A1 01 27 03 CC 97 0F     5 	.ascii "ADCREAD"
      00AB75 00 04                    6 	.word ADCREAD_IDX 
      003288                       4514 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AB75 90 F6                    1 	.word LINK 
                           00328A     2 	LINK=.
      00328A                          3 ADCON:
      00AB77 93                       4 	.byte 5 	
      00AB78 EE 01 72 A9 00           5 	.ascii "ADCON"
      00AB7D 03 89                    6 	.word ADCON_IDX 
      003292                       4515 kword_dict::
      003292                       4516 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AB7F 88 A6                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 ABS:
      00AB81 80                       4 	.byte 3+F_IFUNC 	
      00AB82 15 01 27                 5 	.ascii "ABS"
      00AB85 05 A6                    6 	.word ABS_IDX 
                                   4517 
                                   4518 ;comands and fonctions address table 	
      00329A                       4519 code_addr::
      00AB87 0A CC 97 11 24 F2 29  4520 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             64 27 EB 28 F4 2C 98
      00AB8B 20 69 20 47 20 AE 20  4521 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             8C 28 BF 27 D4 2D 52
      00AB8B CE 00 15 58 58 58 58  4522 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             58 9E C8 00 15 C7 00
      00AB99 0E 9F C8 00 16 C7 00  4523 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             0F CE 00 17 CF 00 15
             CE 00 17 54 9E C8
      00ABAD 00 17 C7 00 17 9F C8  4524 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             00 18 C7 00 18 CE 00
             0E 54
      00ABBD 54 54 9E C8 00 0E C7  4525 	.word let,list,log2,lshift,next,new ; 40..47
             00 0E 9F C8 00
      00ABC9 0F C7 00 0F C8 00 18  4526 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             97 C6 00 0E C8 00 17
             95 CF
      00ABD9 00 17 C6 00 16 A4 7F  4527 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             72 A2 00 03 90 F7 90
             EF 01
      00ABE9 84 85 72 A2 00 03 90  4528 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             F7 90 EF 01 CD 84 55
             90 F6
      00ABF9 93 EE 01 72 A9 00 03  4529 	.word restore,return, random,rshift,run,free ; 72..79
             1C 00 01 A9 00
      00AC05 81 C8 2E D7 2E 3F 2E  4530 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             DE 2E B7 21 A2 25 B0
             29 46
      00AC06 2B EC 2C 03 21 62 24  4531 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             4B 1B 44 28 6B 2C E7
             28 80
      00AC06 52 03 0F 02 0F 03 90  4532 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal  AE-Bits]



             C3 1B 17 22 C8 24 15
             1C 7A
      00AC0E B3 14 93 F6           4533 	.word func_eefree,0 
                                   4534 
                                   4535 
                                   4536 
                                   4537 
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
      003364                         30 test:
      003364                         31     _vars VSIZE 
      00AC12 A4 0F            [ 2]    1     sub sp,#VSIZE 
      00AC14 6B 01 0C         [ 2]   32     ldw x,#LOOP_CNT
      00AC17 03 5C            [ 2]   33     ldw (CNTR,sp),x  
      00AC19 F6 CD 89         [ 2]   34     ldw x,ticks 
      00AC1C C4 0C            [ 2]   35     ldw (T,sp),x
      003370                         36 1$: ; test add24 
      00AC1E 02 0A            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC20 01 26 F5         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC23 A6 46 11         [ 1]   39     ld acc24,a 
      00AC26 02 2B 09         [ 2]   40     ldw acc24+1,x  
      00AC29 A6 20            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC2B CD 89 C4         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC2E 0C 02 20         [ 4]   43     call add24 
      00AC31 07 A6            [ 2]   44     ldw x,(CNTR,sp)
      00AC33 0D CD 89         [ 2]   45     subw x,#1
      00AC36 C4 0F            [ 2]   46     ldw (CNTR,sp),x 
      00AC38 02 72            [ 1]   47     jrne 1$
      00AC3A A2 00 02         [ 4]   48     call prt_acc24
      00AC3D 90 FE            [ 1]   49     ld a,#SPACE 
      00AC3F 26 CF A6         [ 4]   50     call putc 
      00AC42 0D CD 89         [ 2]   51     ldw x,ticks 
      00AC45 C4 5F 7B         [ 2]   52     subw x,(T,sp)
      00AC48 03 97 CD         [ 4]   53     call prt_i16  
      00AC4B 98 65            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AC4D AE AC 56         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AC50 CD 8A 21         [ 2]   58     ldw x,LOOP_CNT
      00AC53 5B 03            [ 2]   59     ldw (CNTR,sp),x 
      00AC55 81 20 77         [ 2]   60     ldw x,ticks 
      00AC58 6F 72            [ 2]   61     ldw (T,sp),x 
      0033AC                         62 2$: 
      00AC5A 64 73            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AC5C 20 69 6E         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AC5F 20 64 69         [ 1]   65     ld acc24,a 
      00AC62 63 74 69         [ 2]   66     ldw acc24+1,x  
      00AC65 6F 6E            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AC67 61 72 79         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AC6A 0A 00 5D         [ 4]   69     call mul24 
      00AC6C 1E 03            [ 2]   70     ldw x,(CNTR,sp)
      00AC6C CD 99 D0         [ 2]   71     subw x,#1
      00AC6F A1 01            [ 2]   72     ldw (CNTR,sp),x 
      00AC71 27 03            [ 1]   73     jrne 2$ 
      00AC73 CC 97 0F         [ 4]   74    call prt_acc24 
      00AC76 A6 20            [ 1]   75    ld a,#SPACE 
      00AC76 90 F6 93         [ 4]   76    call putc 
      00AC79 EE 01 72         [ 2]   77     ldw x,ticks 
      00AC7C A9 00 03         [ 2]   78     subw x,(T,sp)
      00AC7F CF 00 13         [ 4]   79     call prt_i16 
      00AC82 81 0D            [ 1]   80     ld a,#CR 
      00AC83 CD 09 44         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AC83 CE 00 13         [ 2]   83     ldw x,LOOP_CNT
      00AC86 4F 20            [ 2]   84     ldw (CNTR,sp),x 
      00AC88 13 00 0F         [ 2]   85     ldw x,ticks 
      00AC89 1F 01            [ 2]   86     ldw (T,sp),x 
      0033E8                         87 3$: 
      00AC89 CD 99            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AC8B CB A1 01         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AC8E 27 03 CC         [ 1]   90     ld acc24,a 
      00AC91 97 0F 90         [ 2]   91     ldw acc24+1,x  
      00AC94 F6 93            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AC96 EE 01 72         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AC99 A9 00 03         [ 4]   94     call mul24 
      00AC9C 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00AC9C 4D 26 06         [ 2]   96     subw x,#1
      00AC9F 5D 26            [ 2]   97     ldw (CNTR,sp),x 
      00ACA1 03 43            [ 1]   98     jrne 3$ 
      00ACA3 53 81 4F         [ 4]   99     call prt_acc24    
      00ACA6 5F 81            [ 1]  100     ld a,#SPACE 
      00ACA8 CD 09 44         [ 4]  101     call putc 
      00ACA8 CD 99 D0         [ 2]  102     ldw x,ticks 
      00ACAB A1 01 27         [ 2]  103     subw x,(T,sp)
      00ACAE 03 CC 97         [ 4]  104     call prt_i16 
      00ACB1 0F 90            [ 1]  105     ld a,#CR 
      00ACB3 F6 93 EE         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00ACB6 01 72 A9         [ 2]  108     ldw x,LOOP_CNT
      00ACB9 00 03            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00ACBB 4B 00 35         [ 2]  110     ldw x,ticks 
      00ACBE CC 50            [ 2]  111     ldw (T,sp),x 
      003424                        112 4$:
      00ACC0 E0 9E            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00ACC2 A4 3F 95         [ 2]  114     ldw x,#VAL1&0XFFFF
      00ACC5 A3 00 FF         [ 1]  115     ld acc24,a 
      00ACC8 23 06 0C         [ 2]  116     ldw acc24+1,x  
      00ACCB 01 98            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ACCD 56 20 F5         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ACD0 35 55 50         [ 4]  119     call mul24 
      00ACD3 E0 84            [ 2]  120     ldw x,(CNTR,sp)
      00ACD5 C7 50 E1         [ 2]  121     subw x,#1
      00ACD8 9F 4A            [ 2]  122     ldw (CNTR,sp),x 
      00ACDA 35 55            [ 1]  123     jrne 4$ 
      00ACDC 50 E0 C7         [ 4]  124     call prt_acc24 
      00ACDF 50 E2            [ 1]  125     ld a,#SPACE 
      00ACE1 35 AA 50         [ 4]  126     call putc 
      00ACE4 E0 81 0F         [ 2]  127     ldw x,ticks 
      00ACE6 72 F0 01         [ 2]  128     subw x,(T,sp)
      00ACE6 35 AA 50         [ 4]  129     call prt_i16 
      00ACE9 E0 81            [ 1]  130     ld a,#CR 
      00ACEB CD 09 44         [ 4]  131     call putc 
                                    132 ; test abs24 
      00ACEB CD 99 CB         [ 2]  133     ldw x,LOOP_CNT
      00ACEE A1 01            [ 2]  134     ldw (CNTR,sp),x 
      00ACF0 27 03 CC         [ 2]  135     ldw x,ticks 
      00ACF3 97 0F            [ 2]  136     ldw (T,sp),x 
      00ACF5                        137 5$: 
      00ACF5 90 F6            [ 1]  138     ld a,#0xff
      00ACF7 93 EE 01         [ 2]  139     ldw x,#0xffff
      00ACFA 72 A9 00         [ 4]  140     call abs24 
      00ACFD 03 4D 26         [ 1]  141     ld acc24,a 
      00AD00 08 5D 26         [ 2]  142     ldw acc24+1,x
      00AD03 05 A6            [ 2]  143     ldw x,(CNTR,sp)
      00AD05 0A CC 97         [ 2]  144     subw x,#1
      00AD08 11 4B            [ 2]  145     ldw (CNTR,sp),x 
      00AD0A 18 59            [ 1]  146     jrne 5$ 
      00AD0C 49 25 04         [ 4]  147     call prt_acc24 
      00AD0F 0A 01            [ 1]  148     ld a,#SPACE 
      00AD11 26 F8 5F         [ 4]  149     call putc 
      00AD14 84 4A 02         [ 2]  150     ldw x,ticks 
      00AD17 72 F0 01         [ 2]  151     subw x,(T,sp)
      00AD17 81 17 E5         [ 4]  152     call prt_i16 
      00AD18                        153 6$:
      00AD18 CD 99            [ 1]  154     ld a,#CR 
      00AD1A CB A1 01         [ 4]  155     call putc 
      00AD1D 27 03 CC         [ 4]  156     call read_integer 
      00AD20 97 0F 90 F6 93   [ 1]  157     mov farptr,acc24 
      00AD25 EE 01 72 A9 00   [ 1]  158     mov farptr+1,acc16 
      00AD2A 03 9F AE 00 01   [ 1]  159     mov farptr+2,acc8 
      00AD2F A4 17 27         [ 4]  160     call read_integer 
      00AD32 0A 88 4F         [ 1]  161     ld a,acc24 
      00AD35 CE 00 0D         [ 2]  162     ldw x,acc16 
      00AD35 58 49 0A 01 26   [ 1]  163     mov acc24,farptr 
      00AD3A FA 00 19 00 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00AD3B 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00AD3B 5B 01 81         [ 4]  166     call div24 
      00AD3E 88               [ 1]  167     push a 
      00AD3E CD               [ 2]  168     pushw x 
      00AD3F 99 CB A1         [ 4]  169     call prt_acc24 
      00AD42 01 27            [ 1]  170     ld a,#SPACE 
      00AD44 03 CC 97         [ 4]  171     call putc 
      00AD47 0F               [ 2]  172     popw x
      00AD48 90 F6 93         [ 2]  173     ldw acc16,x  
      00AD4B EE 01 72         [ 1]  174     pop acc24 
      00AD4E A9 00 03         [ 4]  175     call prt_acc24
      00AD51 43 53            [ 2]  176     jra 6$
      0034D0                        177     _drop VSIZE 
      00AD53 81 08            [ 2]    1     addw sp,#VSIZE 
      00AD54 81               [ 4]  178     ret 
                                    179 
                                    180 
      0034D3                        181 read_integer:
      00AD54 85 52            [ 1]  182     ld a,#'? 
      00AD56 04 89 CE         [ 4]  183     call putc  
      00AD59 00 05 1F 03      [ 1]  184 	clr count  
      00AD5D CE 00 01         [ 4]  185 	call readln 
      00AD60 1F 05 72         [ 2]  186 	ldw x,#tib 
      00AD63 5C 00 20         [ 1]  187 	push count
      00AD66 81 00            [ 1]  188 	push #0 
      00AD67 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00AD67 72               [ 1]  190 	incw x 
      0034EB                        191 	_drop 2 
      00AD68 5D 00            [ 2]    1     addw sp,#2 
      00AD6A 20 26 03 CC      [ 1]  192 	clr in 
      00AD6E 97 0F 0E         [ 4]  193 	call get_token
      00AD70 A1 84            [ 1]  194 	cp a,#TK_INTGR
      00AD70 CD 9B            [ 1]  195 	jreq 3$ 
      00AD72 1B 4D            [ 1]  196 	cp a,#TK_MINUS
      00AD74 26 13 5D         [ 4]  197 	call get_token 
      00AD77 26 10            [ 1]  198 	cp a,#TK_INTGR 
      00AD79 1E 03            [ 1]  199 	jreq 2$
      00AD7B CF 00 05         [ 2]  200 	jp syntax_error
      003504                        201 2$:
      00AD7E E6 02 C7         [ 4]  202 	call neg_acc24  	
      003507                        203 3$: 
      00AD81 00               [ 4]  204     ret 
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
      00AD82 04 1E                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AD84 05 CF                   32 app_size: .word 0 
      003584                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003294 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      00328A R
    ADCON_ID=  000002     |   4 ADCREAD    00327E R   |     ADCREAD_=  000004 
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
  4 AND        003276 R   |     AND_IDX =  000006     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        00326E R
    ASC_IDX =  000008     |     ATTRIB  =  000002     |   4 AUTO_RUN   000157 R
  4 AWU        003266 R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  00000A 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   4 BIT        00325E R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000C     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000D 
  4 BRES       003255 R   |     BRES_IDX=  00000E     |     BS      =  000008 
  4 BSET       00324C R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      003242 R   |     BTEST_ID=  000012     |   4 BTOGL      003238 R
    BTOGL_ID=  000014     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        003230 R   |     BYE_IDX =  000016     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    002739 R   |     CAN_DGR =  005426 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       003227 R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]

Symbol Table

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
    CLK_SWR_=  0000D2     |     CMDX    =  000001     |     CMD_END =  000002 
    CNAME   =  000001     |     CNT     =  000006     |     CNTR    =  000003 
    CNT_LO  =  000004     |     COMMA   =  00002C     |   4 CONST      00321D R
  4 CONST_CO   001BF7 R   |     CONST_ID=  0000C4     |     CONST_RE=  000005 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        003215 R
    CRH_IDX =  00001A     |   4 CRL        00320D R   |     CRL_IDX =  00001C 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       003204 R
    DATA_IDX=  00001E     |     DBG_A   =  000008     |     DBG_CC  =  000009 
    DBG_X   =  000006     |     DBG_Y   =  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        0031FC R   |     DDR_IDX =  000020     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        0031F4 R
    DEC_IDX =  000022     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |     DIVISOR =  000001     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  4 DO         0031ED R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
    DO_IDX  =  000024     |   4 DREAD      0031E3 R   |     DREAD_ID=  000026 
  4 DWRITE     0031D8 R   |     DWRITE_I=  000028     |   4 EDIT       0031CF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

    EDIT_IDX=  00002A     |   4 EEFREE     0031C4 R   |     EEFREE_I=  0000C6 
  4 EEPROM     0031B9 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002C     |     EEPROM_S=  000800     |     EEPTR   =  000003 
    EM      =  000019     |   4 END        0031B1 R   |     END_IDX =  00002E 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      0031A7 R   |     ERASE_ID=  000030     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_OVER=  000010     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       00319E R
    FCPU_IDX=  000032     |     FF      =  00000C     |     FHSE    =  7A1200 
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
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   001D9A R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        003196 R   |     FOR_IDX =  000036     |   4 FREE       00318D R
    FREE_IDX=  000094     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   4 GET        003185 R   |     GET_IDX =  0000C2 
  4 GOSUB      00317B R   |     GOSUB_ID=  000038     |   4 GOTO       003172 R
    GOTO_IDX=  00003A     |   4 GPIO       003169 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003C     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        003161 R
    HEX_IDX =  00003E     |     HOME    =  000082     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
  4 IDR        003159 R   |     IDR_IDX =  000040     |   4 IF         003152 R
    IF_IDX  =  000042     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003148 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_ID=  000044 
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
  4 INVERT     00313D R   |     INVERT_I=  000046     |     INW     =  00000B 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  4 IWDGEN     003132 R   |     IWDGEN_I=  000048     |   4 IWDGREF    003126 R
    IWDGREF_=  00004A     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        00311E R
    KEY_END =  000083     |     KEY_IDX =  00004C     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        003116 R
    LET_IDX =  00004E     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  003294 R   |   4 LIST       00310D R
    LIST_IDX=  000050     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG        003105 R
    LOG_IDX =  000052     |     LOOP_CNT=  002710     |   4 LSHIFT     0030FA R
    LSHIFT_I=  000054     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000004     |     N2      =  000007     |     NAFR    =  004804 
    NAK     =  000015     |     NAMEPTR =  000001     |     NCLKOPT =  004808 
    NEG     =  000001     |   4 NEW        0030F2 R   |     NEW_IDX =  000058 
  4 NEXT       0030E9 R   |     NEXT_IDX=  000056     |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NLEN    =  000001     |     NOPT1   =  004802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        0030E1 R   |     NOT_IDX =  00005A 
  4 NOT_SAVE   001E8C R   |   4 NO_APP     00277B R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        0030D9 R   |     ODR_IDX =  00005C     |   4 ON         0030D2 R
    ONOFF   =  000003     |     ON_IDX  =  0000C0     |     OP      =  000001 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         0030CB R   |     OR_IDX  =  00005E 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        0030C3 R   |     PAD_IDX =  000060 
    PAD_SIZE=  000080     |   4 PAUSE      0030B9 R   |     PAUSE_ID=  000062 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       0030B0 R   |     PEEK_IDX=  000066 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       0030A7 R
    PINP_IDX=  000068     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      00309D R
    PMODE_ID=  000064     |   4 POKE       003094 R   |     POKE_IDX=  00006A 
  4 PORTA      003077 R   |   4 PORTB      00306D R   |   4 PORTC      003063 R
  4 PORTD      003059 R   |   4 PORTE      00304F R   |   4 PORTF      003045 R
  4 PORTG      00303B R   |   4 PORTH      003031 R   |   4 PORTI      003027 R
  4 POUT       00308B R   |     POUT_IDX=  00006C     |     PREV    =  000001 
  4 PRINT      003081 R   |     PROD    =  000001     |     PROD_SIG=  00000A 
  4 PROG_ADD   001D70 R   |   4 PROG_SIZ   001D82 R   |     PRTA_IDX=  000070 
    PRTB_IDX=  000072     |     PRTC_IDX=  000074     |     PRTD_IDX=  000076 
    PRTE_IDX=  000078     |     PRTF_IDX=  00007A     |     PRTG_IDX=  00007C 
    PRTH_IDX=  00007E     |     PRTI_IDX=  000080     |     PRT_IDX =  00006E 
    PSIZE   =  000001     |     PSTR    =  000003     |   4 QKEY       00301E R
    QKEY_IDX=  000082     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001DAB R   |     RAM_SIZE=  001800 
    RBT_IDX =  000086     |   4 READ       003015 R   |     READ_IDX=  000084 
  4 REBOOT     00300A R   |     RECLEN  =  000005     |   4 REG_A      000562 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

  4 REG_CC     000566 R   |   4 REG_EPC    000555 R   |   4 REG_SP     00056B R
  4 REG_X      00055E R   |   4 REG_Y      00055A R   |     RELOP   =  000001 
  4 REM        003002 R   |     REM_IDX =  000088     |   4 RESTORE    002FF6 R
    REST_IDX=  00008A     |     RETL1   =  000001     |   4 RETURN     002FEB R
    RET_ADDR=  000003     |     RET_BPTR=  000003     |     RET_IDX =  00008C 
    RET_INW =  000005     |   4 RND        002FE3 R   |     RND_IDX =  00008E 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     002FD8 R
    RSHIFT_I=  000090     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        002FD0 R   |     RUN_IDX =  000092     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       002FC7 R
    SAVE_IDX=  000034     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   002737 R   |   4 SIZE       002FBE R
    SIZE_IDX=  0000BE     |     SKIP    =  000005     |   4 SLEEP      002FB4 R
    SLEEP_ID=  000096     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      002FAA R   |     SPIEN_ID=  00009A 
  4 SPIRD      002FA0 R   |     SPIRD_ID=  000098     |   4 SPISEL     002F95 R
    SPISEL_I=  00009C     |   4 SPIWR      002F8B R   |     SPIWR_ID=  00009E 
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
    STACK_EM=  0017FF     |     STACK_SI=  00008C     |   4 STATES     000518 R
  4 STEP       002F82 R   |     STEP_IDX=  0000A0     |   4 STOP       002F79 R
    STOP_IDX=  0000A2     |     STR     =  000003     |   4 STR_BYTE   001D93 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TARGET  =  000001     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      002F6F R
    TICKS_ID=  0000A4     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_CCM=  000007     |     TIM1_CCM=  000002     |     TIM1_CCM=  000004 
    TIM1_CCM=  000005     |     TIM1_CCM=  000006     |     TIM1_CCM=  000003 
    TIM1_CCM=  00525B     |     TIM1_CCM=  000000     |     TIM1_CCM=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    002F63 R
  4 TIMER      002F59 R   |     TIMER_ID=  0000A6     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000005     |     TK_CFUNC=  000082 
    TK_CHAR =  000004     |     TK_CMD  =  000080     |     TK_COLON=  00000A 
    TK_COMMA=  000008     |     TK_CONST=  000083     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_FLOAT=  000086     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000081     |     TK_INTGR=  000084     |     TK_LABEL=  000003 
    TK_LE   =  000036     |     TK_LPARE=  000006     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000007     |     TK_SHARP=  000009 
    TK_VAR  =  000085     |     TMROUT_I=  0000A8     |   4 TO         002F52 R
  4 TONE       002F49 R   |     TONE_IDX=  0000AC     |     TOWRITE =  000005 
    TO_IDX  =  0000AA     |   4 Timer4Up   000021 R   |   4 TrapHand   000012 R
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
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   4 UBOUND     002F3E R   |     UBOUND_I=  0000AE 
  4 UBTN_Han   000068 R   |   4 UFLASH     002F33 R   |     UFLASH_I=  0000B0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 UNTIL      002F29 R   |     UNTIL_ID=  0000B2     |     UPDATE  =  000006 
    US      =  00001F     |   4 USER_ABO   000070 R   |   4 USR        002F21 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000B4     |   4 Uart1RxH   0008D2 R   |   4 UserButt   000044 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VSISE   =  000003 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002F18 R
    WAIT_IDX=  0000B6     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002F0E R   |     WORDS_ID=  0000B8     |   4 WRITE      002F04 R
    WRITE_ID=  0000BA     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002EFC R   |     XOR_IDX =  0000BC 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        00294D R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000C0D R   |   4 add24      00016A R   |   4 add_char   001381 R
  4 add_spac   00115E R   |   4 analog_r   0024F2 R   |   4 app        003584 R
  4 app_sign   003580 R   |   4 app_size   003582 R   |   4 app_spac   003580 GR
  4 arduino_   002ACB R   |   4 arg_list   001950 R   |   5 array_si   000020 R
  4 ascii      0027EB R   |   4 at_tst     000FC8 R   |   4 atoi24     001887 GR
  4 atoi_exi   0018ED R   |   4 awu        0028F4 R   |   4 awu02      002907 R
  4 bad_port   002866 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       00246B R   |   4 beep_1kh   002442 GR  |   4 bin_exit   000E49 R
  4 bit_and    002964 R   |   4 bit_or     002991 R   |   4 bit_rese   002069 R
  4 bit_set    002047 R   |   4 bit_test   0020AE R   |   4 bit_togg   00208C R
  4 bit_xor    0029C3 R   |   4 bitmask    002C98 R   |   4 bkslsh_t   000F75 R
  4 bksp       0009AB R   |   2 block_bu   0016B8 GR  |   4 block_er   0007C0 R
  4 break_po   0025DE R   |   4 bye        0028BF R   |   4 char       0027D4 R
  4 clear_ba   0014EB R   |   4 clear_bl   00268E R   |   4 clear_va   001443 R
  4 clock_in   00008B R   |   4 cloop_1    001CA0 R   |   4 cmd_cons   001C7A R
  4 cmd_end    00240E R   |   4 cmd_get    002415 R   |   4 cmd_itf    000570 R
  4 cmd_line   00171E R   |   4 cmd_name   0013A1 R   |   4 cmd_on     0022C8 R
  4 cmd_size   001B17 R   |   4 code_add   00329A GR  |   4 cold_sta   0000C3 R
  4 colon_ts   000F9C R   |   4 comma_ts   000FA7 R   |   4 comp_msg   00166E R
  4 compile    0010CD GR  |   4 const_cr   002D4D R   |   4 const_cr   002D52 R
  4 const_dd   002D48 R   |   4 const_ee   002D61 R   |   4 const_id   002D43 R
  4 const_in   002D5C R   |   4 const_lo   001C9B R   |   4 const_od   002D3E R
  4 const_ou   002D57 R   |   4 const_po   002D11 R   |   4 const_po   002D16 R
  4 const_po   002D1B R   |   4 const_po   002D20 R   |   4 const_po   002D25 R
  4 const_po   002D2A R   |   4 const_po   002D2F R   |   4 const_po   002D34 R
  4 const_po   002D39 R   |   4 convert_   000DB7 R   |   4 convert_   00096F R
  4 copy_com   000FFD R   |   5 count      000003 GR  |   4 cp24       0001A4 R
  4 cp24_ax    0001D6 R   |   4 cp_loop    0018FF R   |   4 cpl24      0001E6 R
  4 cpy_cmd_   001149 R   |   4 cpy_quot   001186 R   |   4 create_g   000CE1 R
  4 cs_high    002EF0 R   |   4 dash_tst   000FBD R   |   4 data       002D66 R
  5 data_len   000009 R   |   4 data_lin   002D75 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 data_sea   002DC1 R   |   4 dec_base   001AF6 R
  4 decomp_l   00123F R   |   4 decompil   0011F7 GR  |   4 del_line   000CB4 R
  4 delete_l   000A98 R   |   4 delete_n   0009BB R   |   4 delete_u   000A5D R
  4 digital_   00252E R   |   4 digital_   002565 R   |   4 div24      000327 R
  4 divu24_8   000309 R   |   4 do_loop    002CD4 R   |   4 do_progr   0007B3 R
  4 edit       001E5F R   |   4 enable_i   002C28 R   |   4 eql_tst    001052 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 equal      001394 R   |   4 erase      002606 R   |   4 erase_ex   0007E4 R
  4 erase_fl   0007DA R   |   4 err_bad_   0015CF R   |   4 err_buf_   001645 R
  4 err_cmd_   001593 R   |   4 err_div0   001558 R   |   4 err_dupl   0015AD R
  4 err_math   00153F R   |   4 err_mem_   001524 R   |   4 err_msg    001502 R
  4 err_no_a   0015DB R   |   4 err_no_d   00160E R   |   4 err_no_f   001632 R
  4 err_no_l   001567 R   |   4 err_no_p   00161E R   |   4 err_not_   0015BE R
  4 err_over   001652 R   |   4 err_run_   00157D R   |   4 err_synt   001531 R
  4 escaped    000DCC GR  |   4 expect     00193E R   |   4 expr_exi   001A98 R
  4 expressi   001A68 R   |   4 factor     0019A5 R   |   5 farptr     000018 R
  4 fcpu       002A4F R   |   4 fetchc     000660 R   |   4 fill_wri   00267E R
  4 final_te   000C06 R   |   4 first_li   001E09 R   |   5 flags      000022 GR
  4 for        002138 R   |   4 free       001AFB R   |   5 free_eep   000024 R
  7 free_ram   000080 R   |   4 func_arg   00194B R   |   4 func_eef   001C0D R
  4 func_not   002C09 R   |   4 ge         001396 R   |   4 get_addr   0017C5 R
  4 get_arra   001975 R   |   4 get_char   0017DF R   |   4 get_cmd_   0011D6 R
  4 get_code   0017A9 R   |   4 get_cons   001B92 R   |   4 get_esca   00097B R
  4 get_int2   0017CF R   |   4 get_targ   002259 R   |   4 get_targ   002267 R
  4 get_tick   002946 R   |   4 get_toke   000F0E GR  |   4 getc       000954 GR
  4 gosub      00236E R   |   4 gosub_1    002379 R   |   4 gosub_2    00237F R
  4 goto       002354 R   |   4 goto_1     00235E R   |   4 gpio       00283B R
  4 gt         001392 R   |   4 gt_tst     00105D R   |   4 hex_base   001AF1 R
  4 hex_dump   0006A0 R   |   4 if         002127 R   |   5 in         000001 GR
  5 in.saved   000002 GR  |   5 in.w       000000 GR  |   4 incr_far   0008B6 R
  4 input_ex   001FFF R   |   4 input_lo   001F6B R   |   4 input_va   001F67 R
  4 insert_c   000A1A R   |   4 insert_l   000D0D R   |   4 insert_l   000D7C R
  4 interp_l   00175F R   |   4 interpre   00173A R   |   4 invalid    0005B5 R
  4 invalid_   000636 R   |   4 invert     002CBE R   |   4 is_alnum   000E7E GR
  4 is_alpha   000E64 GR  |   4 is_data_   002D6C R   |   4 is_digit   000E75 GR
  4 is_symbo   000E87 R   |   4 itoa       001822 GR  |   4 itoa_loo   001844 R
  4 jp_to_ta   002361 R   |   4 key        00282A R   |   4 kword_di   003292 GR
  4 kword_en   002EFA R   |   4 le         00139B R   |   4 ledoff     00046B R
  4 ledon      000466 R   |   4 ledtoggl   000470 R   |   4 left_par   000479 R
  4 let        001B4F GR  |   4 let_arra   001B5D R   |   4 let_eval   001B65 R
  4 let_var    001B62 R   |   4 lines_sk   001E0C R   |   4 list       001DBA R
  4 list_con   001BA1 R   |   4 list_exi   001E4E R   |   4 list_loo   001E2C R
  4 log2       002C6B R   |   4 logical_   002C1C R   |   4 look_tar   00228A R
  4 loop_bac   00223C R   |   5 loop_dep   00001F R   |   4 loop_don   002251 R
  4 lshift     0029F5 R   |   4 lt         001399 R   |   4 lt_tst     001086 R
  4 mem_peek   0005D2 R   |   4 mod24      0003D5 R   |   4 move       0013FF GR
  4 move_dow   00141E R   |   4 move_era   000742 R   |   4 move_exi   00143F R
  4 move_lef   0009F2 R   |   4 move_loo   001423 R   |   4 move_prg   000782 R
  4 move_rig   000A00 R   |   4 move_up    001410 R   |   4 mul24      00025D R
  4 mul_char   001383 R   |   4 mulu24_8   00022A R   |   4 nbr_tst    000F41 R
  4 ne         00139E R   |   4 neg24      0001F3 R   |   4 neg_acc2   00020D R
  4 neg_ax     000205 R   |   4 new        0025FC R   |   4 next       0021E4 R
  4 next_lin   001742 R   |   4 next_tok   001790 GR  |   4 no_match   001911 R
  4 number     000666 R   |   4 other      0010AF R   |   4 overwrit   000C32 R
  2 pad        0016B8 GR  |   4 pad_ref    002EF5 R   |   4 parse_bi   000E27 R
  4 parse_in   000DD4 R   |   4 parse_ke   000EAA R   |   4 parse_qu   000D7F R
  4 parse_sy   000E92 R   |   4 pause      0028D3 R   |   4 pause02    0028E6 R
  4 peek       002106 R   |   4 peek_byt   000600 R   |   4 pin_mode   002A5E R
  4 plus_tst   001026 R   |   4 poke       0020E5 R   |   4 power_ad   0024A2 R
  4 prcnt_ts   001047 R   |   4 print      001EC7 R   |   4 print_ex   001F3B R
  4 print_fa   000645 R   |   4 print_he   000C67 GR  |   4 print_re   0004C5 R
  4 print_st   0005C5 R   |   4 print_to   00180A R   |   4 prog_siz   001D29 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 program_   001D31 R   |   4 program_   00075C R   |   4 program_   000782 R
  4 prt_acc2   0017FC R   |   4 prt_basi   001EA3 R   |   4 prt_i16    0017E5 R
  4 prt_loop   001ECB R   |   4 prt_peek   000448 GR  |   4 prt_reg1   0004A6 R
  4 prt_reg8   000484 R   |   4 prt_regs   0003DE GR  |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       000944 GR  |   4 puts       0009A1 GR
  4 qgetc      00094D GR  |   4 qkey       00282E GR  |   4 qmark_ts   000FD3 R
  4 qsign      002677 R   |   4 random     002AEB R   |   4 read       002DE2 R
  4 read01     002DE4 R   |   4 read_int   0034D3 R   |   4 readln     000AA6 GR
  4 readln_l   000AB3 R   |   4 readln_q   000C4F R   |   4 refresh_   002C66 R
  4 regs_sta   000421 R   |   4 rel_exit   001AEE R   |   4 relation   001A9B R
  4 relop_st   001386 R   |   4 remark     002004 GR  |   4 repl       00057E R
  4 repl_exi   0005A6 R   |   4 reset_co   001EC9 R   |   4 rest_con   001F57 R
  4 restore    002D9B R   |   4 restore_   002DDD R   |   4 return     002394 R
  4 right_al   001174 GR  |   4 row_alig   00089B R   |   4 row_eras   000715 R
  4 row_eras   000742 R   |   4 row_loop   000683 R   |   4 rparnt_t   000F91 R
  4 rshift     002A22 R   |   7 rsign      00007C R   |   7 rsize      00007E R
  4 rt_msg     00165C R   |   4 run        0023B2 R   |   4 run_app    000135 R
  4 run_it     0023E4 R   |   4 run_it_0   0023E6 R   |   5 rx1_head   00002E R
  5 rx1_queu   000026 R   |   5 rx1_tail   00002F R   |   4 save_app   0026A2 R
  4 save_con   001F47 R   |   4 scan_blo   0008C4 R   |   4 search_c   001C36 R
  4 search_d   0018F1 GR  |   4 search_e   00193B R   |   4 search_l   000C89 GR
  4 search_l   000C98 R   |   4 search_n   0018F5 R   |   5 seedx      000014 R
  5 seedy      000016 R   |   4 select_p   002ABB R   |   4 send_esc   0009C9 R
  4 send_par   0009D4 R   |   4 set_data   002D8A R   |   4 set_time   002BEC R
  4 sharp_ts   000FB2 R   |   4 show_row   000671 R   |   4 single_c   00137C R
  4 skip       000EFB R   |   4 skip_2_b   0017AD R   |   4 skip_str   0017B6 R
  4 slash_ts   00103C R   |   4 sleep      0028C8 R   |   4 software   001452 R
  4 spaces     000A0E GR  |   4 spi_clea   002E8A R   |   4 spi_disa   002E72 R
  4 spi_enab   002E3F R   |   4 spi_rcv_   002EAC R   |   4 spi_read   002ED7 R
  4 spi_sele   002EDE R   |   4 spi_send   002E96 R   |   4 spi_writ   002EB7 R
  2 stack_fu   001774 GR  |   2 stack_un   001800 R   |   4 star_tst   001031 R
  4 step       0021A2 R   |   4 stop       0025B0 R   |   4 store_lo   0021D1 R
  4 str_matc   00191E R   |   4 str_tst    000F31 R   |   4 strcmp     0013DE R
  4 strcpy     0013EF GR  |   4 strlen     0013D3 GR  |   4 sub24      000187 R
  4 symb_loo   000E93 R   |   4 syntax_e   00168F GR  |   4 system_i   001498 R
  5 tab_widt   000023 GR  |   4 tb_error   001691 GR  |   4 term       001A2E R
  4 term01     001A33 R   |   4 term_exi   001A65 R   |   4 test       003364 R
  4 test_p     0005BD R   |   2 tib        001668 GR  |   4 tick_tst   000FEB R
  5 ticks      00000F R   |   4 timeout    002C03 R   |   5 timer      000012 GR
  4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R   |   4 tk_id      00167F R
  4 to         002162 R   |   4 to_eepro   0007AB R   |   4 to_flash   0007B0 R
  4 to_hex_c   000C7E GR  |   4 to_upper   00187B GR  |   4 token_ch   0010C6 R
  4 token_ex   0010CA R   |   4 tone       00244B R   |   4 try_next   002DCD R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   000954 GR
  4 uart1_in   0008FF R   |   4 uart1_pu   000944 GR  |   4 uart1_qg   00094D GR
  4 uart1_se   00090F R   |   4 ubound     001B44 R   |   4 uflash     00286B R
  4 unlock_e   0006DF R   |   4 unlock_f   0006FA R   |   4 until      002CE7 R
  4 user_int   000057 R   |   4 usr        002880 R   |   4 var_name   0011CC GR
  5 vars       000030 GR  |   4 wait       00200A R   |   4 warm_ini   0014C9 R
  4 warm_sta   00171B R   |   4 words      002B86 R   |   4 words_co   002BD6 R
  4 write      002791 R   |   4 write_bl   000860 GR  |   4 write_bu   00079C R
  4 write_by   0007E6 R   |   4 write_ee   000822 R   |   4 write_ex   00085B R
  4 write_fl   00080C R   |   4 write_nb   000885 R   |   2 xstack_f   001738 GR
  2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3584   flags    0
   5 DATA       size     7E   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

