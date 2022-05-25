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
                           000087    73         TK_AND=135      ;
                           000088    74         TK_OR=136       ;
                           000089    75         TK_XOR=137      ; 
                           000000    76         TK_NONE=0       ; not a token 
                           000002    77         TK_QSTR=2       ; quoted string  
                           000003    78         TK_LABEL=3      ; used for defined, constants, variables
                           000004    79         TK_CHAR=4       ; ASCII character 
                           000005    80         TK_ARRAY=5     ; array variable '@' 
                           000006    81         TK_LPAREN=6     ; left parenthesis '('
                           000007    82         TK_RPAREN=7     ; right parenthesis ')'
                           000008    83         TK_COMMA=8     ; item separator ',' 
                           000009    84         TK_SHARP=9     ; print colon width '#' 
                           00000A    85         TK_COLON=0xa      ; command separator ':' 
                                     86         
                           000010    87         TK_PLUS=0x10    ; addition operator '+'
                           000011    88         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    89         TK_MULT=0x20    ; multiplication operator '*'
                           000021    90         TK_DIV=0x21     ; division operator '/'
                           000022    91         TK_MOD=0x22     ; modulo operator '%'
                                     92 
                                     93         ; don't change these token values 
                                     94         ; values chosen to be used as a mask.
                                     95         ; bit 7   1 for dictionary words else 0 
                                     96         ; bits 6  always 0 
                                     97         ; bits 5:4 identify group 
                                     98         ; bits 3:0 token identifier inside group  
                           000031    99         TK_GT=0x31      ; relation operator '>'
                           000032   100         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   101         TK_GE=0x33      ; relation operator '>='
                           000034   102         TK_LT=0x34      ; relation operator '<'
                           000036   103         TK_LE=0x36      ; relation operator '<='
                           000035   104         TK_NE=0x35      ; relation operator '<>' not equal 
                                    105         ; token groups 
                           000030   106         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   107         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   108         TK_GRP_ADD=0x10  ; additive operators
                           000020   109         TK_GRP_MULT=0x20 ; multiplicative operators
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000030   110         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   111         CMD_END=2 
                                    112 
                                    113 ;--------------------------------------
                                    114 ;   error codes 
                                    115 ;--------------------------------------
                           000000   116     ERR_NONE=0
                           000001   117     ERR_MEM_FULL=1 
                           000002   118     ERR_SYNTAX=2
                           000003   119     ERR_MATH_OVF=3
                           000004   120     ERR_DIV0=4 
                           000005   121     ERR_NO_LINE=5
                           000006   122     ERR_RUN_ONLY=6
                           000007   123     ERR_CMD_ONLY=7
                           000008   124     ERR_DUPLICATE=8
                           000009   125     ERR_NOT_FILE=9
                           00000A   126     ERR_BAD_VALUE=10
                           00000B   127     ERR_NO_ACCESS=11
                           00000C   128     ERR_NO_DATA=12 
                           00000D   129     ERR_NO_PROG=13
                           00000E   130     ERR_NO_FSPACE=14
                           00000F   131     ERR_BUF_FULL=15
                           000010   132     ERR_OVERFLOW=16 
                                    133 
                                    134 ;--------------------------------------
                                    135 ;   assembler flags 
                                    136 ;-------------------------------------
                                    137 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    138 
                                    139      .macro _usec_dly n 
                                    140     ldw x,#(16*n-2)/4
                                    141     decw x
                                    142     nop 
                                    143     jrne .-4
                                    144     .endm 
                                    145     
                                    146     ; load X register with 
                                    147     ; entry point of dictionary
                                    148     ; before calling 'search_dict'
                                    149     .macro _ldx_dict dict_name
                                    150     ldw x,#dict_name+2
                                    151     .endm 
                                    152 
                                    153     ; reset BASIC pointer
                                    154     ; to beginning of last token
                                    155     ; extracted except if it was end of line 
                                    156     .macro _unget_token 
                                    157      mov in,in.saved  
                                    158     .endm
                                    159 
                                    160 
                                    161 ;---------------------------------------
                                    162 ;    xtack manipulation macros 
                                    163 ;    Y is used as xstack pointer  
                                    164 ;----------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165     ; pop in A:X from XSTACK 
                                    166     .macro _xpop 
                                    167     ld a,(y)
                                    168     ldw x,y 
                                    169     ldw x,(1,x)
                                    170     addw y,#CELL_SIZE 
                                    171     .endm 
                                    172 
                                    173     ; push A:X  to XSTACK 
                                    174     .macro _xpush 
                                    175     subw y,#CELL_SIZE
                                    176     ld (y),a 
                                    177     ldw (1,y),x 
                                    178     .endm 
                                    179 
                                    180     ; drop from XSTACK 
                                    181     .macro _xdrop 
                                    182     addw y,#CELL_SIZE 
                                    183     .endm 
                                    184 
                                    185     ; @T fetch top xstack 
                                    186     .macro _at_top
                                    187     ld a,(y)
                                    188     ldw x,y 
                                    189     ldw x,(1,x)
                                    190     .endm 
                                    191 
                                    192     ; @N  fetch next on xstack 
                                    193     .macro _at_next 
                                    194     ld a,(3,y)
                                    195     ldw x,y 
                                    196     ldw x,(4,x)
                                    197     .endm 
                                    198 
                                    199     ; !T put on top of xtack 
                                    200     .macro _store_top 
                                    201     ld (y),a 
                                    202     ldw (1,y),x     
                                    203     .endm 
                                    204 
                                    205     ; !N put next on xstack 
                                    206     .macro _store_next 
                                    207     ld (3,y),a 
                                    208     ldw (4,y),x 
                                    209     .endm 
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
                           000018    37     CRH_IDX=CHAR_IDX+2
                           00001A    38     CRL_IDX=CRH_IDX+2
                           00001C    39     DATA_IDX=CRL_IDX+2
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
                           00003A    54     GPIO_IDX=GOTO_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                           00003C    55     HEX_IDX=GPIO_IDX+2
                           00003E    56     IDR_IDX=HEX_IDX+2
                           000040    57     IF_IDX=IDR_IDX+2
                           000042    58     INPUT_IDX=IF_IDX+2
                           000044    59     INVERT_IDX=INPUT_IDX+2
                           000046    60     IWDGEN_IDX=INVERT_IDX+2
                           000048    61     IWDGREF_IDX=IWDGEN_IDX+2
                           00004A    62     KEY_IDX=IWDGREF_IDX+2
                           00004C    63     LET_IDX=KEY_IDX+2
                           00004E    64     LIST_IDX=LET_IDX+2
                           000050    65     LOG_IDX=LIST_IDX+2
                           000052    66     LSHIFT_IDX=LOG_IDX+2
                           000054    67     NEXT_IDX=LSHIFT_IDX+2
                           000056    68     NEW_IDX=NEXT_IDX+2
                           000058    69     NOT_IDX=NEW_IDX+2
                           00005A    70     ODR_IDX=NOT_IDX+2
                           00005C    71     PAD_IDX=ODR_IDX+2
                           00005E    72     PAUSE_IDX=PAD_IDX+2
                           000060    73     PMODE_IDX=PAUSE_IDX+2
                           000062    74     PEEK_IDX=PMODE_IDX+2
                           000064    75     PINP_IDX=PEEK_IDX+2
                           000066    76     POKE_IDX=PINP_IDX+2
                           000068    77     POUT_IDX=POKE_IDX+2
                           00006A    78    	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
                           00006C    79     PRTA_IDX=PRT_IDX+2
                           00006E    80     PRTB_IDX=PRTA_IDX+2
                           000070    81     PRTC_IDX=PRTB_IDX+2
                           000072    82     PRTD_IDX=PRTC_IDX+2
                           000074    83     PRTE_IDX=PRTD_IDX+2
                           000076    84     PRTF_IDX=PRTE_IDX+2
                           000078    85     PRTG_IDX=PRTF_IDX+2
                           00007A    86     PRTH_IDX=PRTG_IDX+2
                           00007C    87     PRTI_IDX=PRTH_IDX+2
                           00007E    88     QKEY_IDX=PRTI_IDX+2
                           000080    89     READ_IDX=QKEY_IDX+2
                           000082    90     RBT_IDX=READ_IDX+2  ; REBOOT
                           000084    91 	REM_IDX=RBT_IDX+2 ; REMARK command index 
                           000086    92     REST_IDX=REM_IDX+2 ; RESTORE
                           000088    93     RET_IDX=REST_IDX+2  ; RETURN 
                           00008A    94     RND_IDX=RET_IDX+2 ; RANDOM 
                           00008C    95     RSHIFT_IDX=RND_IDX+2
                           00008E    96     RUN_IDX=RSHIFT_IDX+2
                           000090    97     FREE_IDX=RUN_IDX+2
                           000092    98     SLEEP_IDX=FREE_IDX+2
                           000094    99     SPIRD_IDX=SLEEP_IDX+2
                           000096   100     SPIEN_IDX=SPIRD_IDX+2
                           000098   101     SPISEL_IDX=SPIEN_IDX+2
                           00009A   102     SPIWR_IDX=SPISEL_IDX+2
                           00009C   103     STEP_IDX=SPIWR_IDX+2
                           00009E   104     STOP_IDX=STEP_IDX+2
                           0000A0   105     TICKS_IDX=STOP_IDX+2
                           0000A2   106     TIMER_IDX=TICKS_IDX+2
                           0000A4   107     TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
                           0000A6   108     TO_IDX=TMROUT_IDX+2
                           0000A8   109     TONE_IDX=TO_IDX+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           0000AA   110     UBOUND_IDX=TONE_IDX+2
                           0000AC   111     UFLASH_IDX=UBOUND_IDX+2
                           0000AE   112     UNTIL_IDX=UFLASH_IDX+2
                           0000B0   113     USR_IDX=UNTIL_IDX+2
                           0000B2   114     WAIT_IDX=USR_IDX+2
                           0000B4   115     WORDS_IDX=WAIT_IDX+2
                           0000B6   116     WRITE_IDX=WORDS_IDX+2
                           0000B8   117     SIZE_IDX=WRITE_IDX+2 
                           0000BA   118     ON_IDX=SIZE_IDX+2 
                           0000BC   119     GET_IDX=ON_IDX+2
                           0000BE   120     CONST_IDX=GET_IDX+2
                           0000C0   121     EEFREE_IDX=CONST_IDX+2 
                                    122      
                                    123         
                                    124 
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
      0080ED CC 97 AC         [ 2]  179 5$:	jp warm_start
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
      00819E CD 9D 98         [ 4]  280 	call func_eefree 
      0081A1 CD 9C CF         [ 4]  281 	call ubound 
      0081A4 CD 95 7C         [ 4]  282 	call clear_basic
      0081A7 CD A5 D9         [ 4]  283 	call beep_1khz  
      0081AA CD 95 29         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 0E         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 AC         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 5A         [ 4]  293 	call warm_init
      0081BC AE B6 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 21         [ 4]  299 	call puts 
      0081CF CD 9E BC         [ 4]  300 	call program_info 
      0081D2 CC A5 7D         [ 2]  301 	jp run_it_02  
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
      00837E CC 97 22 03      [ 2]    4     addw y,#CELL_SIZE 
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
      0083CB 97 22 00 0C      [ 1]  381     rlc acc24 
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
      0084CF 76 A6 3A         [ 1]  186 	ld acc16,a 
      0084D2 CD 89            [ 1]  187 	ld a,(9,sp) 
      0084D4 C4 A6 20         [ 1]  188 	ld acc24,a
      0084D7 CD               [ 1]  189 	clrw x  
      0084D8 89 C4            [ 1]  190 	ld a,#16
      0084DA 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084DD 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084E0 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084E2 CD 98 76         [ 4]  195 	call prt_reg16  
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
      008510 CD 98 76 CD 84         222 REG_CC:  .asciz "\nCC:"
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
      00851C 0B CD 98 76      [ 1]  237 	clr farptr 
      008520 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      008524 C4 81 00 1A      [ 1]  239 	clr farptr+2  
      008526                        240 repl:
      008526 90 89            [ 1]  241 	ld a,#CR 
      008528 CD 8A 21         [ 4]  242 	call putc 
      00852B 1E 01            [ 1]  243 	ld a,#'? 
      00852D 35 10 00         [ 4]  244 	call putc
      008530 0B CD 98 76      [ 1]  245 	clr in.w 
      008534 CD 84 F9 85      [ 1]  246 	clr in 
      008538 35 0A 00         [ 4]  247 	call readln
      00853B 0B CD 98 76      [ 2]  248 	ldw y,#tib  
      00853F A6 29            [ 1]  249 	ld a,(y)
      008541 CD 89            [ 1]  250 	jreq repl  
      008543 C4 81 00 01      [ 1]  251 	inc in 
      008545 CD 18 8C         [ 4]  252 	call to_upper 
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
      008564 98 8D            [ 1]  268     cp a,#'S 
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
      00861E 02 CD 99         [ 4]  390 	call putc
      000683                        391 row_loop:
      008621 0C A1            [ 2]  392 	ldw x,(ADR,sp)
      008623 51               [ 1]  393 	ld a,(x)
      008624 26               [ 1]  394 	clrw x 
      008625 17               [ 1]  395 	ld xl,a 
      008626 CD 17 F6         [ 4]  396 	call prt_i16 
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
      008645 CD 8F 9F         [ 4]  428 	call putc 
      008648 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      00864A 26 E9            [ 1]  430 	ld a,#16
      00864C CD 8A 21 CC      [ 2]  431 	cpw y,#16
      008650 85 FE            [ 1]  432 	jrpl 2$
      008652 90 9F            [ 1]  433 	ld a,yl
      0006C2                        434 2$: 	
      008652 A6 20 CD         [ 4]  435 	call show_row 
      008655 8F 8C            [ 2]  436 	ldw y,(BCNT,sp) 
      008657 72 B9 00 01      [ 2]  437 	subw y,#16 
      00865B AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00865F 94 80            [ 1]  439 	jrpl 1$
      008661 AE 16            [ 1]  440 	ld a,(BASE,sp)
      008663 B8 CD 99         [ 1]  441 	ld base,a
      008666 18 C6            [ 1]  442 	ld a,(TABW,sp)
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
      008697 8D 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
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
      0086D5 98 8D A6         [ 2]  103 	ldw x,#tib 
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
      0086E6 CD 8F 9F A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086EA 84 27            [ 1]  130 	clrw y 
      0086EC 03               [ 1]  131 1$:	ld a,(x)
      0086ED CC 97 20 81      [ 1]  132 	ldf ([farptr],y),a
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
      0086FC 98 76            [ 2]  140 	popw y 
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
      008709 98 76 1E         [ 2]  155 	ldw x,#tib ; destination address 
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
      008720 A3 36 00         [ 2]  174 	cpw x,#app_space  
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
      008740 90 9F 00         [ 2]  202 	cpw x,#app_space 
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
      0087D7 90               [ 1]  318 	incw x 
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
      008816 94 90 90 85      [ 2]  391 	addw x,farptr+1 
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
      008828 80 24 05         [ 2]  410 	cpw x,#BLOCK_SIZE 
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
      00884A B6 80 24         [ 1]   87 	ld rx1_tail,a 
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
      00887A B6 80 24 0E 90   [ 2]  121     btjf UART1_SR,#UART_SR_TC,.
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
      008952 CD 14 10         [ 4]  418     call move
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
      008A20 CD 18 98         [ 4]  592 	call atoi24
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
      008AB3 94 90            [ 1]  672 10$: cp a,#CTRL_O
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
      008AF5 90               [ 1]  711     ld xh,a
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
      008B8F 94 64 90 AE      [ 2]   93 	ldw acc16,y 
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
      008BB0 99 18 CE 00      [ 2]  121 	addw x,acc16  
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
      008BD4 88 0F            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BD6 01 A6 0D         [ 2]  156 	ldw x,#2 
      008BD9 CD 89 C4 A6      [ 4]  157 	ld a,([ptr16],x)
      008BDD 3E CD            [ 1]  158 	cp a,#3
      008BDF 89 C4            [ 1]  159 	jreq insert_ln_exit
      008BE1 AE               [ 1]  160 	clrw x 
      008BE2 16               [ 1]  161 	ld xl,a
      008BE3 68 CD            [ 2]  162 	ldw (LLEN,sp),x 
      008BE5 94 64 6B         [ 2]  163 	ldw x,txtbgn
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
      008C69 CD A5            [ 2]    1     addw sp,#VSIZE 
      008C6B D9               [ 4]  267 	ret 
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
      008D2D EA 18 8C         [ 4]  477 	call to_upper  
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
      008D51 94 90            [ 1]  514 	ld a,#TK_VAR 
      008D53 90 CE            [ 2]  515 	jra 4$ 
      000EC3                        516 2$: ; check for keyword, otherwise syntax error.
      000EC3                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D55 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D58 F2 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D5A 90 CF            [ 1]  519 	incw y 
      008D5C 00 1E 5B         [ 4]  520 	call search_dict
      008D5F 04               [ 1]  521 	tnz a
      008D60 81 28            [ 1]  522 	jrne 4$
                                    523 ; not in this dictionary 
                                    524 ; search for operators dictionary 
      008D61 1E 01            [ 2]  525 	ldw x,(XFIRST,sp)
      008D61 52               [ 1]  526 	incw x  ; *name to search for
      008D62 06 1F 03         [ 4]  527 	call search_op_dict
      008D65 17               [ 1]  528 	tnz a
      008D66 05 90            [ 1]  529 	jreq 22$
                                    530 ; operator 
      008D68 CF 00            [ 2]  531 	ldw y,(XFIRST,sp)
      008D6A 0E 90            [ 1]  532 	ld (y),a 
      008D6C 93 72            [ 1]  533 	incw y 
      008D6E BB 00            [ 2]  534 	jra 5$
      000EE1                        535 22$:	 
                                    536 ; not in dictionary
                                    537 ; compile it as TK_LABEL
      008D70 0E 1F            [ 2]  538 	ldw y,(XFIRST,sp)
      008D72 01 CE            [ 1]  539 	ld a,#TK_LABEL 
      008D74 00 1E            [ 1]  540 	ld (y),a 
      008D76 72 F0            [ 1]  541 	incw y
      000EE9                        542 24$:	
      008D78 03 CF            [ 1]  543     ld a,(y)
      008D7A 00 0E            [ 1]  544 	jreq 3$
      008D7C 1E 01            [ 1]  545 	incw y 
      008D7E CD 94            [ 2]  546 	jra 24$ 
      008D80 90 CE            [ 1]  547 3$: incw y 
      008D82 00 1E            [ 1]  548 	ld a,#TK_LABEL 
      008D84 72               [ 1]  549 	clrw x 	
      008D85 FB 05            [ 2]  550 	jra 5$ 
      000EF8                        551 4$:	
      008D87 CF 00            [ 2]  552 	ldw y,(XFIRST,sp)
      008D89 1E 5B 06         [ 2]  553 	cpw x,#LET_IDX 
      008D8C 81 0A            [ 1]  554 	jreq 5$  ; don't compile LET command 
      008D8D 90 F7            [ 1]  555 	ld (y),a 
      008D8D 52 08            [ 1]  556 	incw y 
      008D8F CE 00            [ 2]  557 	ldw (y),x
      008D91 1E C3 00 1C      [ 2]  558 	addw y,#2  
      000F09                        559 5$:	_drop VSIZE 
      008D95 26 19            [ 2]    1     addw sp,#VSIZE 
      008D97 AE               [ 4]  560 	ret  	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                    561 
                                    562 ;------------------------------------
                                    563 ; skip character c in text starting from 'in'
                                    564 ; input:
                                    565 ;	 y 		point to text buffer
                                    566 ;    a 		character to skip
                                    567 ; output:  
                                    568 ;	'in' ajusted to new position
                                    569 ;------------------------------------
                           000001   570 	C = 1 ; local var
      000F0C                        571 skip:
      008D98 00               [ 1]  572 	push a
      008D99 02 72 D6         [ 4]  573 1$:	ld a,([in.w],y)
      008D9C 00 1A            [ 1]  574 	jreq 2$
      008D9E A1 03            [ 1]  575 	cp a,(C,sp)
      008DA0 27 5A            [ 1]  576 	jrne 2$
      008DA2 5F 97 1F 07      [ 1]  577 	inc in
      008DA6 CE 00            [ 2]  578 	jra 1$
      000F1C                        579 2$: _drop 1 
      008DA8 1C 1F            [ 2]    1     addw sp,#1 
      008DAA 01               [ 4]  580 	ret
                                    581 	
                                    582 
                                    583 ;------------------------------------
                                    584 ; scan text for next token
                                    585 ; input: 
                                    586 ;	X 		pointer to buffer where 
                                    587 ;	        token id and value are copied 
                                    588 ; use:
                                    589 ;	Y   pointer to text in tib 
                                    590 ; output:
                                    591 ;   A       token attribute 
                                    592 ;   X 		token value
                                    593 ;   Y       updated position in output buffer   
                                    594 ;------------------------------------
                                    595 	; use to check special character 
                                    596 	.macro _case c t  
                                    597 	ld a,#c 
                                    598 	cp a,(TCHAR,sp) 
                                    599 	jrne t
                                    600 	.endm 
                                    601 
                           000001   602 	TCHAR=1
                           000002   603 	ATTRIB=2
                           000002   604 	VSIZE=2
      000F1F                        605 get_token:: 
      000F1F                        606 	_vars VSIZE
      008DAB CE 00            [ 2]    1     sub sp,#VSIZE 
                                    607 ;	ld a,in 
                                    608 ;	sub a,count
                                    609 ;   jrmi 0$
                                    610 ;	clr a 
                                    611 ;	ret 
      000F21                        612 0$: 
      008DAD 1E 20 38 72      [ 2]  613 	ldw y,#tib    	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      008DB1 CE 00            [ 1]  614 	ld a,#SPACE
      008DB3 1A 1F 05         [ 4]  615 	call skip
      008DB6 AE 00 02 72 D6   [ 1]  616 	mov in.saved,in 
      008DBB 00 1A 97         [ 4]  617 	ld a,([in.w],y)
      008DBE 1F 07            [ 1]  618 	jrne 1$
      008DC0 1E 05            [ 1]  619 	ldw y,x 
      008DC2 4F CD 8D         [ 2]  620 	jp token_exit ; end of line 
      008DC5 09 5D 26 04      [ 1]  621 1$:	inc in 
      008DC9 17 01 20         [ 4]  622 	call to_upper 
      008DCC 05 1F            [ 1]  623 	ld (TCHAR,sp),a 
                                    624 ; check for quoted string
      000F42                        625 str_tst:  	
      000F42                        626 	_case '"' nbr_tst
      008DCE 01 CD            [ 1]    1 	ld a,#'"' 
      008DD0 8D 34            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD2 26 0A            [ 1]    3 	jrne nbr_tst
      008DD2 A6 03            [ 1]  627 	ld a,#TK_QSTR
      008DD4 11               [ 1]  628 	ld (x),a 
      008DD5 08               [ 1]  629 	incw x 
      008DD6 27 24 1E         [ 4]  630 	call parse_quote
      008DD9 01 C3 00         [ 2]  631 	jp token_exit
      000F52                        632 nbr_tst:
                                    633 ; check for hexadecimal number 
      008DDC 1E 27            [ 1]  634 	ld a,#'$'
      008DDE 09 1E            [ 1]  635 	cp a,(TCHAR,sp) 
      008DE0 01 16            [ 1]  636 	jreq 1$
                                    637 ;check for binary number 
      008DE2 07 CD            [ 1]  638 	ld a,#'&
      008DE4 8D 61            [ 1]  639 	cp a,(TCHAR,sp)
      008DE6 20 06            [ 1]  640 	jrne 0$
      008DE8 A6 84            [ 1]  641 	ld a,#TK_INTGR
      008DE8 72               [ 1]  642 	ld (x),a 
      008DE9 FB               [ 1]  643 	incw x 
      008DEA 07 CF 00         [ 4]  644 	call parse_binary ; expect binary integer 
      008DED 1E 1E 07         [ 2]  645 	jp token_exit 
                                    646 ; check for decimal number 	
      008DF0 CF 00            [ 1]  647 0$:	ld a,(TCHAR,sp)
      008DF2 0E 90 AE         [ 4]  648 	call is_digit
      008DF5 16 B8            [ 1]  649 	jrnc 3$
      008DF7 1E 01            [ 1]  650 1$:	ld a,#TK_INTGR 
      008DF9 CD               [ 1]  651 	ld (x),a 
      008DFA 94               [ 1]  652 	incw x 
      008DFB 90 01            [ 1]  653 	ld a,(TCHAR,sp)
      008DFC CD 0D D4         [ 4]  654 	call parse_integer 
      008DFC 5B 08 81         [ 2]  655 	jp token_exit 
      008DFF                        656 3$: 
      000F7B                        657 	_case '(' bkslsh_tst 
      008DFF 52 02            [ 1]    1 	ld a,#'(' 
      008E01 4F 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E03 01 05            [ 1]    3 	jrne bkslsh_tst
      008E04 A6 06            [ 1]  658 	ld a,#TK_LPAREN
      008E04 91 D6 01         [ 2]  659 	jp token_char   	
      000F86                        660 bkslsh_tst: ; character token 
      000F86                        661 	_case '\',rparnt_tst
      008E07 27 24            [ 1]    1 	ld a,#'\' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008E09 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0B 00 02            [ 1]    3 	jrne rparnt_tst
      008E0D 6B 02            [ 1]  662 	ld a,#TK_CHAR 
      008E0F A6               [ 1]  663 	ld (x),a 
      008E10 5C               [ 1]  664 	incw x 
      008E11 11 01 26         [ 4]  665 	ld a,([in.w],y)
      008E14 0A               [ 1]  666 	ld (x),a 
      008E15 0F               [ 1]  667 	incw x
      008E16 01 7B            [ 1]  668 	ldw y,x 	 
      008E18 02 AD 1C F7      [ 1]  669 	inc in  
      008E1C 5C               [ 1]  670 	clrw x 
      008E1D 20               [ 1]  671 	ld xl,a 
      008E1E E5 04            [ 1]  672 	ld a,#TK_CHAR 
      008E1F CC 10 DB         [ 2]  673 	jp token_exit 
      000FA2                        674 rparnt_tst:		
      000FA2                        675 	_case ')' colon_tst 
      008E1F 7B 02            [ 1]    1 	ld a,#')' 
      008E21 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E23 27 DD            [ 1]    3 	jrne colon_tst
      008E25 A1 22            [ 1]  676 	ld a,#TK_RPAREN 
      008E27 27 04 F7         [ 2]  677 	jp token_char
      000FAD                        678 colon_tst:
      000FAD                        679 	_case ':' comma_tst 
      008E2A 5C 20            [ 1]    1 	ld a,#':' 
      008E2C D7 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2D 26 05            [ 1]    3 	jrne comma_tst
      008E2D 7F 5C            [ 1]  680 	ld a,#TK_COLON 
      008E2F 90 93 5F         [ 2]  681 	jp token_char  
      000FB8                        682 comma_tst:
      000FB8                        683 	_case COMMA sharp_tst 
      008E32 A6 02            [ 1]    1 	ld a,#COMMA 
      008E34 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008E36 81 05            [ 1]    3 	jrne sharp_tst
      008E37 A6 08            [ 1]  684 	ld a,#TK_COMMA
      008E37 89 AE 8E         [ 2]  685 	jp token_char
      000FC3                        686 sharp_tst:
      000FC3                        687 	_case SHARP dash_tst 
      008E3A 4C F1            [ 1]    1 	ld a,#SHARP 
      008E3C 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3E 7D 27            [ 1]    3 	jrne dash_tst
      008E40 09 5C            [ 1]  688 	ld a,#TK_SHARP
      008E42 20 F7 1D         [ 2]  689 	jp token_char  	 	 
      000FCE                        690 dash_tst: 	
      000FCE                        691 	_case '-' at_tst 
      008E45 8E 4C            [ 1]    1 	ld a,#'-' 
      008E47 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008E49 07 85            [ 1]    3 	jrne at_tst
      008E4B 81 61            [ 1]  692 	ld a,#TK_MINUS  
      008E4D 62 74 6E         [ 2]  693 	jp token_char 
      000FD9                        694 at_tst:
      000FD9                        695 	_case '@' qmark_tst 
      008E50 76 66            [ 1]    1 	ld a,#'@' 
      008E52 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008E54 26 05            [ 1]    3 	jrne qmark_tst
      008E54 89 4B            [ 1]  696 	ld a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      008E56 00 4B 0A         [ 2]  697 	jp token_char
      000FE4                        698 qmark_tst:
      000FE4                        699 	_case '?' tick_tst 
      008E59 A1 24            [ 1]    1 	ld a,#'?' 
      008E5B 26 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008E5D 5B 01            [ 1]    3 	jrne tick_tst
      008E5F 4B 10            [ 1]  700 	ld a,#TK_CMD  
      008E61 F7               [ 1]  701 	ld (x),a 
      008E62 5C               [ 1]  702 	incw x 
      008E63 91 D6            [ 1]  703 	ldw y,x 
      008E65 01 72 5C         [ 2]  704 	ldw x,#PRT_IDX 
      008E68 00 02            [ 2]  705 	ldw (y),x 
      008E6A CD 99 0C 6B      [ 2]  706 	addw y,#2
      008E6E 02 CD 8E         [ 2]  707 	jp token_exit
      000FFC                        708 tick_tst: ; comment 
      000FFC                        709 	_case TICK plus_tst 
      008E71 F5 25            [ 1]    1 	ld a,#TICK 
      008E73 ED A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008E75 10 11            [ 1]    3 	jrne plus_tst
      008E77 01 26            [ 1]  710 	ld a,#TK_CMD
      008E79 0A               [ 1]  711 	ld (x),a 
      008E7A 7B               [ 1]  712 	incw x
      008E7B 02 A1 41 2B      [ 2]  713 	ldw y,#REM_IDX
      008E7F 04               [ 2]  714 	ldw (x),y 
      008E80 A1 47 2B         [ 2]  715 	addw x,#2  
      00100E                        716 copy_comment:
      008E83 DD 72 5A 00      [ 2]  717 	ldw y,#tib 
      008E87 02 7F 1E 03      [ 2]  718 	addw y,in.w
      008E8B CD 99            [ 2]  719 	pushw y
      008E8D 18 90 93         [ 4]  720 	call strcpy
      008E90 C6 00 0D         [ 2]  721     subw y,(1,sp)
      008E93 90 F7            [ 1]  722 	ld a,yl 
      008E95 72 A9 00         [ 1]  723 	add a,in
      008E98 01 CE 00         [ 1]  724 	ld in,a 
      008E9B 0E 90            [ 2]  725 	ldw (1,sp),x
      008E9D FF 72 A9         [ 2]  726 	addw y,(1,sp)
      008EA0 00 02            [ 1]  727 	incw y 
      00102D                        728 	_drop 2 
      008EA2 A6 84            [ 2]    1     addw sp,#2 
      008EA4 5B 04 81         [ 2]  729 	ldw x,#REM_IDX 
      008EA7 A6 80            [ 1]  730 	ld a,#TK_CMD 
      008EA7 4B 00 4B         [ 2]  731 	jp token_exit 
      001037                        732 plus_tst:
      001037                        733 	_case '+' star_tst 
      008EAA 00 4B            [ 1]    1 	ld a,#'+' 
      008EAC 00 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EAD 26 05            [ 1]    3 	jrne star_tst
      008EAD 91 D6            [ 1]  734 	ld a,#TK_PLUS  
      008EAF 01 72 5C         [ 2]  735 	jp token_char 
      001042                        736 star_tst:
      001042                        737 	_case '*' slash_tst 
      008EB2 00 02            [ 1]    1 	ld a,#'*' 
      008EB4 A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB6 27 06            [ 1]    3 	jrne slash_tst
      008EB8 A1 31            [ 1]  738 	ld a,#TK_MULT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      008EBA 27 02 20         [ 2]  739 	jp token_char 
      00104D                        740 slash_tst: 
      00104D                        741 	_case '/' prcnt_tst 
      008EBD 0B A0            [ 1]    1 	ld a,#'/' 
      008EBF 30 46            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC1 09 03            [ 1]    3 	jrne prcnt_tst
      008EC3 09 02            [ 1]  742 	ld a,#TK_DIV 
      008EC5 09 01 20         [ 2]  743 	jp token_char 
      001058                        744 prcnt_tst:
      001058                        745 	_case '%' eql_tst 
      008EC8 E4 25            [ 1]    1 	ld a,#'%' 
      008EC9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC9 72 5A            [ 1]    3 	jrne eql_tst
      008ECB 00 02            [ 1]  746 	ld a,#TK_MOD
      008ECD 90 93 7B         [ 2]  747 	jp token_char  
                                    748 ; 1 or 2 character tokens 	
      001063                        749 eql_tst:
      001063                        750 	_case '=' gt_tst 		
      008ED0 01 C7            [ 1]    1 	ld a,#'=' 
      008ED2 00 0D            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED4 1E 02            [ 1]    3 	jrne gt_tst
      008ED6 CF 00            [ 1]  751 	ld a,#TK_EQUAL
      008ED8 0E 90 FF         [ 2]  752 	jp token_char 
      00106E                        753 gt_tst:
      00106E                        754 	_case '>' lt_tst 
      008EDB 72 A9            [ 1]    1 	ld a,#'>' 
      008EDD 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EDF A6 84            [ 1]    3 	jrne lt_tst
      008EE1 5B 03            [ 1]  755 	ld a,#TK_GT 
      008EE3 81 02            [ 1]  756 	ld (ATTRIB,sp),a 
      008EE4 91 D6 00         [ 4]  757 	ld a,([in.w],y)
      008EE4 A1 41 8C 24      [ 1]  758 	inc in 
      008EE8 0B A1            [ 1]  759 	cp a,#'=
      008EEA 5B 25            [ 1]  760 	jrne 1$
      008EEC 07 A1            [ 1]  761 	ld a,#TK_GE 
      008EEE 61 8C            [ 2]  762 	jra token_char  
      008EF0 24 02            [ 1]  763 1$: cp a,#'<
      008EF2 A1 7B            [ 1]  764 	jrne 2$
      008EF4 81 35            [ 1]  765 	ld a,#TK_NE 
      008EF5 20 48            [ 2]  766 	jra token_char 
      008EF5 A1 30 25 03      [ 1]  767 2$: dec in
      008EF9 A1 3A            [ 1]  768 	ld a,(ATTRIB,sp)
      008EFB 8C 8C            [ 2]  769 	jra token_char 	 
      001097                        770 lt_tst:
      001097                        771 	_case '<' other
      008EFD 81 3C            [ 1]    1 	ld a,#'<' 
      008EFE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EFE CD 8E            [ 1]    3 	jrne other
      008F00 F5 25            [ 1]  772 	ld a,#TK_LT 
      008F02 03 CD            [ 1]  773 	ld (ATTRIB,sp),a 
      008F04 8E E4 81         [ 4]  774 	ld a,([in.w],y)
      008F07 72 5C 00 01      [ 1]  775 	inc in 
      008F07 A1 5F            [ 1]  776 	cp a,#'=
      008F09 26 03            [ 1]  777 	jrne 1$
      008F0B 99 20            [ 1]  778 	ld a,#TK_LE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008F0D 03 CD            [ 2]  779 	jra token_char 
      008F0F 8E FE            [ 1]  780 1$: cp a,#'>
      008F11 81 04            [ 1]  781 	jrne 2$
      008F12 A6 35            [ 1]  782 	ld a,#TK_NE 
      008F12 5C 1F            [ 2]  783 	jra token_char 
      008F13 72 5A 00 01      [ 1]  784 2$: dec in 
      008F13 CD 99            [ 1]  785 	ld a,(ATTRIB,sp)
      008F15 0C F7            [ 2]  786 	jra token_char 	
      0010C0                        787 other: ; not a special character 	 
      008F17 5C 91            [ 1]  788 	ld a,(TCHAR,sp)
      008F19 D6 01 72         [ 4]  789 	call is_alpha 
      008F1C 5C 00            [ 1]  790 	jrc 30$ 
      008F1E 02 CD 8F         [ 2]  791 	jp syntax_error 
      0010CA                        792 30$: 
      008F21 07 25 EF         [ 4]  793 	call parse_keyword
      008F24 7F 72 5A         [ 2]  794 	cpw x,#remark 
      008F27 00 02            [ 1]  795 	jrne token_exit 
      008F29 81 93            [ 1]  796 	ldw y,x 
      008F2A CC 10 0E         [ 2]  797 	jp copy_comment 
      0010D7                        798 token_char:
      008F2A 89               [ 1]  799 	ld (x),a 
      008F2B CD               [ 1]  800 	incw x
      008F2C 8F 12            [ 1]  801 	ldw y,x 
      0010DB                        802 token_exit:
      0010DB                        803 	_drop VSIZE 
      008F2E 1E 01            [ 2]    1     addw sp,#VSIZE 
      008F30 E6               [ 4]  804 	ret
                                    805 
                                    806 
                                    807 ;-----------------------------------
                                    808 ; create token list fromm text line 
                                    809 ; save this list in pad buffer 
                                    810 ;  compiled line format: 
                                    811 ;    line_no  2 bytes {0...32767}
                                    812 ;    count    1 byte  
                                    813 ;    tokens   variable length 
                                    814 ;   
                                    815 ; input:
                                    816 ;   none
                                    817 ; modified variables:
                                    818 ;   basicptr     token list buffer address 
                                    819 ;   in.w  		 3|count, i.e. index in buffer
                                    820 ;   count        length of line | 0  
                                    821 ;-----------------------------------
                           000001   822 	XSAVE=1
                           000002   823 	VSIZE=2
      0010DE                        824 compile::
      008F31 02 26            [ 2]  825 	pushw y 
      0010E0                        826 	_vars VSIZE 
      008F33 0F E6            [ 2]    1     sub sp,#VSIZE 
      008F35 01 A0 41 AE 00   [ 1]  827 	mov basicptr,txtbgn
      008F3A 03 42 1C 00      [ 1]  828 	bset flags,#FCOMP 
      008F3E 31 A6            [ 1]  829 	ld a,#0
      008F40 85 20 35         [ 2]  830 	ldw x,#0
      008F43 CF 16 B8         [ 2]  831 	ldw pad,x ; destination buffer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F43 AE B3 DC         [ 1]  832 	ld pad+2,a ; count 
      008F46 16 01 90         [ 2]  833 	ldw x,#pad+3
      008F49 5C CD 99 82      [ 1]  834 	clr in 
      008F4D 4D 26 28         [ 4]  835 	call get_token
      008F50 1E 01            [ 1]  836 	cp a,#TK_INTGR
      008F52 5C CD            [ 1]  837 	jrne 2$
      008F54 B0 20 4D         [ 2]  838 	cpw x,#1 
      008F57 27 08            [ 1]  839 	jrpl 1$
      008F59 16 01            [ 1]  840 	ld a,#ERR_BAD_VALUE
      008F5B 90 F7 90         [ 2]  841 	jp tb_error
      008F5E 5C 20 28         [ 2]  842 1$:	ldw pad,x 
      008F61 90 AE 16 BB      [ 2]  843 	ldw y,#pad+3 
      008F61 16 01 A6 03      [ 2]  844 2$:	cpw y,#stack_full 
      008F65 90 F7            [ 1]  845 	jrult 3$
      008F67 90 5C            [ 1]  846 	ld a,#ERR_BUF_FULL 
      008F69 CC 16 A2         [ 2]  847 	jp tb_error 
      001120                        848 3$:	
      008F69 90               [ 1]  849 	ldw x,y 
      008F6A F6 27 04         [ 4]  850 	call get_token 
      008F6D 90 5C            [ 1]  851 	cp a,#TK_NONE 
      008F6F 20 F8            [ 1]  852 	jrne 2$ 
                                    853 ; compilation completed  
      008F71 90 5C A6 03      [ 2]  854 	subw y,#pad
      008F75 5F 20            [ 1]  855     ld a,yl
      008F77 11 16 B8         [ 2]  856 	ldw x,#pad 
      008F78 CF 00 19         [ 2]  857 	ldw ptr16,x 
      008F78 16 01            [ 1]  858 	ld (2,x),a 
      008F7A A3               [ 2]  859 	ldw x,(x)
      008F7B 00 4C            [ 1]  860 	jreq 10$
      008F7D 27 0A 90         [ 4]  861 	call insert_line
      008F80 F7 90 5C 90      [ 1]  862 	clr  count 
      008F84 FF 72            [ 2]  863 	jra  11$ 
      001142                        864 10$: ; line# is zero 
      008F86 A9 00 02         [ 2]  865 	ldw x,ptr16  
      008F89 5B 02 81         [ 2]  866 	ldw basicptr,x 
      008F8C E6 02            [ 1]  867 	ld a,(2,x)
      008F8C 88 91 D6         [ 1]  868 	ld count,a 
      008F8F 01 27 0A 11      [ 1]  869 	mov in,#3 
      001151                        870 11$:
      001151                        871 	_drop VSIZE 
      008F93 01 26            [ 2]    1     addw sp,#VSIZE 
      008F95 06 72 5C 00      [ 1]  872 	bres flags,#FCOMP 
      008F99 02 20            [ 2]  873 	popw y 
      008F9B F1               [ 4]  874 	ret 
                                    875 
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
      00115A                         48 cpy_cmd_name:
      008F9C 5B               [ 1]   49 	ld a,(x)
      008F9D 01               [ 1]   50 	incw x
      008F9E 81 0F            [ 1]   51 	and a,#15  
      008F9F 88               [ 1]   52 	push a 
      008F9F 52 02            [ 1]   53     tnz (1,sp) 
      008FA1 27 0A            [ 1]   54 	jreq 9$
      008FA1 90               [ 1]   55 1$:	ld a,(x)
      008FA2 AE 16            [ 1]   56 	ld (y),a  
      008FA4 68               [ 1]   57 	incw x
      008FA5 A6 20            [ 1]   58 	incw y 
      008FA7 CD 8F            [ 1]   59 	dec (1,sp)	 
      008FA9 8C 55            [ 1]   60 	jrne 1$
      008FAB 00               [ 1]   61 9$: pop a 
      008FAC 02               [ 4]   62 	ret	
                                     63 
                                     64 ;--------------------------
                                     65 ; add a space after letter or 
                                     66 ; digit.
                                     67 ; input:
                                     68 ;   Y     pointer to buffer 
                                     69 ; output:
                                     70 ;   Y    moved to end 
                                     71 ;--------------------------
      00116F                         72 add_space:
      008FAD 00 03            [ 2]   73 	decw y 
      008FAF 91 D6            [ 1]   74 	ld a,(y)
      008FB1 01 26            [ 1]   75 	incw y
      008FB3 05 90            [ 1]   76 	cp a,#') 
      008FB5 93 CC            [ 1]   77 	jreq 0$
      008FB7 91 5B 72         [ 4]   78 	call is_alnum 
      008FBA 5C 00            [ 1]   79 	jrnc 1$
      00117E                         80 0$: 
      008FBC 02 CD            [ 1]   81 	ld a,#SPACE 
      008FBE 99 0C            [ 1]   82 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      008FC0 6B 01            [ 1]   83 	incw y 
      008FC2 81               [ 4]   84 1$: ret 
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
      001185                         96 right_align::
      008FC2 A6               [ 1]   97 	push a 
      008FC3 22 11            [ 1]   98 0$: ld a,(1,sp)
      008FC5 01 26 0A         [ 1]   99 	cp a,tab_width 
      008FC8 A6 02            [ 1]  100 	jrpl 1$
      008FCA F7 5C            [ 1]  101 	ld a,#SPACE 
      008FCC CD               [ 2]  102 	decw x
      008FCD 8D               [ 1]  103 	ld (x),a  
      008FCE FF CC            [ 1]  104 	inc (1,sp)
      008FD0 91 5B            [ 2]  105 	jra 0$ 
      008FD2 84               [ 1]  106 1$: pop a 	
      008FD2 A6               [ 4]  107 	ret 
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
      001197                        120 cpy_quote:
      008FD3 24 11            [ 1]  121 	ld a,#'"
      008FD5 01 27            [ 1]  122 	ld (y),a 
      008FD7 17 A6            [ 1]  123 	incw y 
      008FD9 26               [ 2]  124 	pushw x 
      008FDA 11 01 26         [ 4]  125 	call skip_string 
      008FDD 0A               [ 2]  126 	popw x 
      008FDE A6               [ 1]  127 1$:	ld a,(x)
      008FDF 84 F7            [ 1]  128 	jreq 9$
      008FE1 5C               [ 1]  129 	incw x 
      008FE2 CD 8E            [ 1]  130 	cp a,#SPACE 
      008FE4 A7 CC            [ 1]  131 	jrult 3$
      008FE6 91 5B            [ 1]  132 	ld (y),a
      008FE8 7B 01            [ 1]  133 	incw y 
      008FEA CD 8E            [ 1]  134 	cp a,#'\ 
      008FEC F5 24            [ 1]  135 	jrne 1$ 
      0011B2                        136 2$:
      008FEE 0C A6            [ 1]  137 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FF0 84 F7            [ 1]  138 	incw y  
      008FF2 5C 7B            [ 2]  139 	jra 1$
      008FF4 01               [ 1]  140 3$: push a 
      008FF5 CD 8E            [ 1]  141 	ld a,#'\
      008FF7 54 CC            [ 1]  142 	ld (y),a 
      008FF9 91 5B            [ 1]  143 	incw y  
      008FFB 84               [ 1]  144 	pop a 
      008FFB A6 28            [ 1]  145 	sub a,#7
      008FFD 11 01 26         [ 1]  146 	ld acc8,a 
      009000 05 A6 06 CC      [ 1]  147 	clr acc16
      009004 91               [ 2]  148 	pushw x
      009005 57 0D CC         [ 2]  149 	ldw x,#escaped 
      009006 72 BB 00 0D      [ 2]  150 	addw x,acc16 
      009006 A6               [ 1]  151 	ld a,(x)
      009007 5C               [ 2]  152 	popw x
      009008 11 01            [ 2]  153 	jra 2$
      00900A 26 16            [ 1]  154 9$: ld a,#'"
      00900C A6 04            [ 1]  155 	ld (y),a 
      00900E F7 5C            [ 1]  156 	incw y  
      009010 91               [ 1]  157 	incw x 
      009011 D6               [ 4]  158 	ret
                                    159 
                                    160 ;--------------------------
                                    161 ; return variable name 
                                    162 ; from its address.
                                    163 ; input:
                                    164 ;   X    variable address
                                    165 ; output:
                                    166 ;   A     variable letter
                                    167 ;--------------------------
      0011DD                        168 var_name::
      009012 01 F7 5C         [ 2]  169 		subw x,#vars 
      009015 90 93            [ 1]  170 		ld a,#3
      009017 72               [ 2]  171 		div x,a 
      009018 5C               [ 1]  172 		ld a,xl 
      009019 00 02            [ 1]  173 		add a,#'A 
      00901B 5F               [ 4]  174 		ret 
                                    175 
                                    176 ;-----------------------------
                                    177 ; return cmd  idx from its 
                                    178 ; code address 
                                    179 ; input:
                                    180 ;   X      code address 
                                    181 ; output:
                                    182 ;   X      cmd_idx
                                    183 ;-----------------------------
      0011E7                        184 get_cmd_idx:
      00901C 97 A6            [ 2]  185 	pushw y
      00901E 04 CC 91 5B      [ 2]  186 	ldw y,#code_addr 
      009022 90 CF 00 19      [ 2]  187 	ldw ptr16,y 
      009022 A6 29            [ 1]  188 	clrw y 
      009024 11 01 26         [ 5]  189 1$:	cpw x,([ptr16],y)
      009027 05 A6            [ 1]  190 	jreq 3$ 
      009029 07 CC            [ 1]  191 	incw y 
      00902B 91 57 19         [ 4]  192 	ld a,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00902D 90 5C            [ 1]  193 	incw y
      00902D A6 3A 11         [ 4]  194 	or a,([ptr16],y)	
      009030 01 26            [ 1]  195 	jrne 1$
      009032 05               [ 1]  196 3$: ldw x,y 
      009033 A6 0A            [ 2]  197 	popw y 
      009035 CC               [ 4]  198 	ret
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
      001208                        215 decompile::
      001208                        216 	_vars VSIZE
      009036 91 57            [ 2]    1     sub sp,#VSIZE 
      009038 C6 00 0A         [ 1]  217 	ld a,base
      009038 A6 2C            [ 1]  218 	ld (BASE_SAV,sp),a  
      00903A 11 01 26         [ 1]  219 	ld a,tab_width 
      00903D 05 A6            [ 1]  220 	ld (WIDTH_SAV,sp),a 
      00903F 08 CC            [ 2]  221 	ldw (STR,sp),y   
      009041 91 57 00 04      [ 5]  222 	ldw x,[basicptr] ; line number 
      009043 35 0A 00 0A      [ 1]  223 	mov base,#10
      009043 A6 23 11 01      [ 1]  224 	mov tab_width,#5
      009047 26 05 A6 09      [ 1]  225 	clr acc24 
      00904B CC 91 57         [ 2]  226 	ldw acc16,x
      00904E 4F               [ 1]  227 	clr a ; unsigned conversion 
      00904E A6 2D 11         [ 4]  228 	call itoa  
      009051 01 26 05         [ 4]  229 	call right_align 
      009054 A6               [ 1]  230 	push a 
      009055 11 CC            [ 1]  231 1$:	ldw y,x ; source
      009057 91 57            [ 2]  232 	ldw x,(STR+1,sp) ; destination
      009059 CD 14 00         [ 4]  233 	call strcpy 
      009059 A6 40            [ 1]  234 	clrw y 
      00905B 11               [ 1]  235 	pop a 
      00905C 01 26            [ 1]  236 	ld yl,a 
      00905E 05 A6 05         [ 2]  237 	addw y,(STR,sp)
      009061 CC 91            [ 1]  238 	ld a,#SPACE 
      009063 57 F7            [ 1]  239 	ld (y),a 
      009064 90 5C            [ 1]  240 	incw y 
      009064 A6 3F 11 01      [ 1]  241 	clr tab_width
      009068 26 12 A6         [ 2]  242 	ldw x,#3
      00906B 80 F7 5C         [ 2]  243 	ldw in.w,x 
      001250                        244 decomp_loop:
      00906E 90 93            [ 2]  245 	pushw y
      009070 AE 00 6A         [ 4]  246 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009073 90 FF            [ 2]  247 	popw y 
      009075 72               [ 1]  248 	tnz a  
      009076 A9 00            [ 1]  249 	jrne 1$
      009078 02 CC 91         [ 2]  250 	jp 20$
      00907B 5B 03            [ 1]  251 1$:	jrmi 2$
      00907C CC 12 E8         [ 2]  252 	jp 6$
      001262                        253 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR
      00907C A6 27            [ 1]  254 	cp a,#TK_VAR 
      00907E 11 01            [ 1]  255 	jrne 3$
                                    256 ;; TK_VAR 
      009080 26 35 A6         [ 4]  257 	call add_space
      009083 80 F7 5C         [ 4]  258 	call get_addr   
      009086 90 AE 00         [ 4]  259 	call var_name
      009089 84 FF            [ 1]  260 	ld (y),a 
      00908B 1C 00            [ 1]  261 	incw y  
      00908D 02 DB            [ 2]  262 	jra decomp_loop
      00908E                        263 3$:
      00908E 90 AE            [ 1]  264 	cp a,#TK_INTGR
      009090 16 68            [ 1]  265 	jrne 4$
                                    266 ;; TK_INTGR
      009092 72 B9 00         [ 4]  267 	call get_int24 
      009095 01 90 89         [ 1]  268 	ld acc24,a 
      009098 CD 94 80         [ 2]  269 	ldw acc16,x 
      00909B 72 F2 01         [ 4]  270 	call add_space
      00909E 90 9F            [ 2]  271 	pushw y 
      0090A0 CB 00            [ 1]  272 	ld a,#255 ; signed conversion 
      0090A2 02 C7 00         [ 4]  273 	call itoa  
      0090A5 02 1F            [ 2]  274 	ldw y,(1,sp) 
      0090A7 01               [ 1]  275 	push a 
      0090A8 72               [ 1]  276 	exgw x,y 
      0090A9 F9 01 90         [ 4]  277 	call strcpy 
      0090AC 5C 5B            [ 1]  278 	clrw y
      0090AE 02               [ 1]  279 	pop a  
      0090AF AE 00            [ 1]  280 	ld yl,a 
      0090B1 84 A6 80         [ 2]  281 	addw y,(1,sp)
      00129B                        282 	_drop 2 
      0090B4 CC 91            [ 2]    1     addw sp,#2 
      0090B6 5B B1            [ 2]  283 	jra decomp_loop
      0090B7                        284 4$: ; dictionary keyword 
      0090B7 A6               [ 2]  285 	ldw x,(x)
      0090B8 2B 11 01 26      [ 1]  286 	inc in 
      0090BC 05 A6 10 CC      [ 1]  287 	inc in 
      0090C0 91 57 84         [ 2]  288 	cpw x,#REM_IDX
      0090C2 26 23            [ 1]  289 	jrne 5$
      0090C2 A6 2A 11         [ 2]  290 	ldw x,basicptr 
                                    291 ; copy comment to buffer 
      0090C5 01 26 05         [ 4]  292 	call add_space
      0090C8 A6 20            [ 1]  293 	ld a,#''
      0090CA CC 91            [ 1]  294 	ld (y),a 
      0090CC 57 5C            [ 1]  295 	incw y 
      0090CD                        296 46$:
      0090CD A6 2F 11 01      [ 4]  297 	ld a,([in.w],x)
      0090D1 26 05 A6 21      [ 1]  298 	inc in  
      0090D5 CC 91            [ 1]  299 	ld (y),a 
      0090D7 57 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0090D8 C6 00 01         [ 1]  301 	ld a,in 
      0090D8 A6 25 11         [ 1]  302 	cp a,count 
      0090DB 01 26            [ 1]  303 	jrmi 46$
      0090DD 05 A6 22         [ 2]  304 	jp 20$  
      0090E0 CC 91 57         [ 2]  305 5$: cpw x,#LET_IDX 
      0090E3 26 03            [ 1]  306 	jrne 51$
      0090E3 A6 3D 11         [ 2]  307 	jp decomp_loop ; down display LET 	
      0012D8                        308 51$: ; insert command name 
      0090E6 01 26 05         [ 4]  309 	call add_space  
      0090E9 A6 32            [ 2]  310 	pushw y
      0090EB CC 91 57         [ 4]  311 	call cmd_name
      0090EE 90 85            [ 2]  312 	popw y 
      0090EE A6 3E 11         [ 4]  313 	call cpy_cmd_name
      0090F1 01 26 23         [ 2]  314 	jp decomp_loop 
      0012E8                        315 6$:
                                    316 ; label?
      0090F4 A6 31            [ 1]  317 	cp a,#TK_LABEL 
      0090F6 6B 02            [ 1]  318 	jrne 64$
                                    319 ; copy label string to output buffer   	
      0090F8 91 D6            [ 1]  320 	ld a,#32 
      0090FA 01 72            [ 1]  321 	ld (y),a 
      0090FC 5C 00            [ 1]  322 	incw y 
      0012F2                        323 61$:
      0090FE 02               [ 2]  324 	pushw x 
      0090FF A1 3D 26         [ 4]  325 	call skip_string 
      009102 04               [ 2]  326 	popw x 
      0012F7                        327 62$:	
      009103 A6               [ 1]  328 	ld a,(x)
      009104 33 20            [ 1]  329 	jreq 63$ 
      009106 50               [ 1]  330 	incw x  
      009107 A1 3C            [ 1]  331 	ld (y),a 
      009109 26 04            [ 1]  332 	incw y 
      00910B A6 35            [ 2]  333 	jra 62$ 
      001301                        334 63$: 
      00910D 20 48            [ 1]  335 	ld a,#32 
      00910F 72 5A            [ 1]  336 	ld (y),a 
      009111 00 02            [ 1]  337 	incw y 
      009113 7B 02 20         [ 2]  338 	jp decomp_loop
      00130A                        339 64$:
      009116 40 02            [ 1]  340 	cp a,#TK_QSTR 
      009117 26 09            [ 1]  341 	jrne 7$
                                    342 ;; TK_QSTR
      009117 A6 3C 11         [ 4]  343 	call add_space
      00911A 01 26 23         [ 4]  344 	call cpy_quote  
      00911D A6 34 6B         [ 2]  345 	jp decomp_loop
      001317                        346 7$:
      009120 02 91            [ 1]  347 	cp a,#TK_CHAR 
      009122 D6 01            [ 1]  348 	jrne 8$
                                    349 ;; TK_CHAR
      009124 72 5C 00         [ 4]  350 	call add_space 
      009127 02 A1            [ 1]  351 	ld a,#'\ 
      009129 3D 26            [ 1]  352 	ld (y),a 
      00912B 04 A6            [ 1]  353 	incw y
      00912D 36               [ 1]  354 	ld a,(x)
      00912E 20 27 A1 3E      [ 1]  355 	inc in  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009132 26 04            [ 2]  356 	jra 81$
      009134 A6 35            [ 1]  357 8$: cp a,#TK_COLON 
      009136 20 1F            [ 1]  358 	jrne 9$
      009138 72 5A            [ 1]  359 	ld a,#':
      001331                        360 81$:
      00913A 00 02            [ 1]  361 	ld (y),a 
      00913C 7B 02            [ 1]  362 	incw y 
      001335                        363 82$:
      00913E 20 17 50         [ 2]  364 	jp decomp_loop
      009140                        365 9$: 
      009140 7B 01            [ 1]  366 	cp a,#TK_SHARP
      009142 CD 8E            [ 1]  367 	jrugt 10$ 
      009144 E4 25            [ 1]  368 	sub a,#TK_ARRAY 
      009146 03               [ 1]  369 	clrw x 
      009147 CC               [ 1]  370 	ld xl,a
      009148 97 20 8D         [ 2]  371 	addw x,#single_char 
      00914A F6               [ 1]  372 	ld a,(x)
      00914A CD 8F            [ 2]  373 	jra 81$ 
      001346                        374 10$: 
      00914C 2A A3            [ 1]  375 	cp a,#TK_MINUS 
      00914E A1 92            [ 1]  376 	jrugt 11$
      009150 26 09            [ 1]  377 	sub a,#TK_PLUS 
      009152 90               [ 1]  378 	clrw x 
      009153 93               [ 1]  379 	ld xl,a 
      009154 CC 90 8E         [ 2]  380 	addw x,#add_char 
      009157 F6               [ 1]  381 	ld a,(x)
      009157 F7 5C            [ 2]  382 	jra 81$
      001354                        383 11$:
      009159 90 93            [ 1]  384     cp a,#TK_MOD 
      00915B 22 0A            [ 1]  385 	jrugt 12$
      00915B 5B 02            [ 1]  386 	sub a,#TK_MULT
      00915D 81               [ 1]  387 	clrw x 
      00915E 97               [ 1]  388 	ld xl,a 
      00915E 90 89 52         [ 2]  389 	addw x,#mul_char
      009161 02               [ 1]  390 	ld a,(x)
      009162 55 00            [ 2]  391 	jra 81$
      001362                        392 12$:
      009164 1C 00            [ 1]  393 	sub a,#TK_GT  
      009166 05               [ 1]  394 	sll a 
      009167 72               [ 1]  395 	clrw x 
      009168 1A               [ 1]  396 	ld xl,a 
      009169 00 23 A6         [ 2]  397 	addw x,#relop_str 
      00916C 00               [ 2]  398 	ldw x,(x)
      00916D AE               [ 1]  399 	ld a,(x)
      00916E 00               [ 1]  400 	incw x 
      00916F 00 CF            [ 1]  401 	ld (y),a
      009171 16 B8            [ 1]  402 	incw y 
      009173 C7               [ 1]  403 	ld a,(x)
      009174 16 BA            [ 1]  404 	jrne 81$
      009176 AE 16 BB         [ 2]  405 	jp decomp_loop 
      001377                        406 20$: 
      009179 72 5F            [ 1]  407 	clr (y)
      00917B 00 02            [ 2]  408 	ldw x,(STR,sp)
      00917D CD 8F            [ 1]  409 	ld a,(BASE_SAV,sp)
      00917F 9F A1 84         [ 1]  410 	ld base,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009182 26 11            [ 1]  411 	ld a,(WIDTH_SAV,sp)
      009184 A3 00 01         [ 1]  412 	ld tab_width,a
      009187 2A 05 A6         [ 2]  413 	subw y,(STR,sp) 
      00918A 0A CC            [ 1]  414 	ld a,yl 
      00138A                        415 	_drop VSIZE 
      00918C 97 22            [ 2]    1     addw sp,#VSIZE 
      00918E CF               [ 4]  416 	ret 
                                    417 
      00918F 16 B8 90 AE 16         418 single_char: .byte '@','(',')',',','#'
      009194 BB 90                  419 add_char: .byte '+','-'
      009196 A3 17 74               420 mul_char: .byte '*','/','%'
      009199 25 05 A6 0F CC 97 22   421 relop_str: .word gt,equal,ge,lt,le,ne 
             AA 13 AC 13 AF
      0091A0 3E 00                  422 gt: .asciz ">"
      0091A0 93 CD                  423 equal: .asciz "="
      0091A2 8F 9F A1               424 ge: .asciz ">="
      0091A5 00 26                  425 lt: .asciz "<"
      0091A7 ED 72 A2               426 le: .asciz "<="
      0091AA 16 B8 90               427 ne:  .asciz "<>"
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
      0013B2                        440 cmd_name:
      0013B2                        441 	_vars VSIZE 
      0091AD 9F AE            [ 2]    1     sub sp,#VSIZE 
      0091AF 16 B8 CF 00      [ 1]  442 	clr acc16 
      0091B3 1A E7            [ 2]  443 	ldw (CMDX,sp),x  
      0091B5 02 FE 27         [ 2]  444 	ldw x,#kword_dict	
      0091B8 09 CD            [ 2]  445 1$:	ldw (LINK,sp),x
      0091BA 8D 8D            [ 1]  446 	ld a,(2,x)
      0091BC 72 5F            [ 1]  447 	and a,#15 
      0091BE 00 04 20         [ 1]  448 	ld acc8,a 
      0091C1 0F 00 03         [ 2]  449 	addw x,#3
      0091C2 72 BB 00 0D      [ 2]  450 	addw x,acc16
      0091C2 CE               [ 2]  451 	ldw x,(x) ; command index  
      0091C3 00 1A            [ 2]  452 	cpw x,(CMDX,sp)
      0091C5 CF 00            [ 1]  453 	jreq 2$
      0091C7 05 E6            [ 2]  454 	ldw x,(LINK,sp)
      0091C9 02               [ 2]  455 	ldw x,(x) 
      0091CA C7 00 04         [ 2]  456 	subw x,#2  
      0091CD 35 03            [ 1]  457 	jrne 1$
      0091CF 00 02            [ 2]  458 	jra 9$
      0091D1 1E 03            [ 2]  459 2$: ldw x,(LINK,sp)
      0091D1 5B 02 72         [ 2]  460 	addw x,#2 	
      0013E1                        461 9$:	_drop VSIZE
      0091D4 1B 00            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091D6 23               [ 4]  462 	ret
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
      0013E4                        116 strlen::
      0091D7 90               [ 2]  117 	pushw x 
      0091D8 85               [ 1]  118 	clr a
      0091D9 81               [ 1]  119 1$:	tnz (x) 
      0091DA 27 04            [ 1]  120 	jreq 9$ 
      0091DA F6               [ 1]  121 	inc a 
      0091DB 5C               [ 1]  122 	incw x 
      0091DC A4 0F            [ 2]  123 	jra 1$ 
      0091DE 88               [ 2]  124 9$:	popw x 
      0091DF 0D               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      0013EF                        135 strcmp:
      0091E0 01               [ 1]  136 	ld a,(x)
      0091E1 27 0A            [ 1]  137 	jreq 5$ 
      0091E3 F6 90            [ 1]  138 	cp a,(y) 
      0091E5 F7 5C            [ 1]  139 	jrne 4$ 
      0091E7 90               [ 1]  140 	incw x 
      0091E8 5C 0A            [ 1]  141 	incw y 
      0091EA 01 26            [ 2]  142 	jra strcmp 
      0013FB                        143 4$: ; not same  
      0091EC F6               [ 1]  144 	clr a 
      0091ED 84               [ 4]  145 	ret 
      0013FD                        146 5$: ; same 
      0091EE 81 01            [ 1]  147 	ld a,#1 
      0091EF 81               [ 4]  148 	ret 
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
      001400                        159 strcpy::
      0091EF 90               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091F0 5A               [ 2]  161 	pushw x 
      0091F1 90 F6            [ 1]  162 1$: ld a,(y)
      0091F3 90 5C            [ 1]  163 	jreq 9$ 
      0091F5 A1               [ 1]  164 	ld (x),a 
      0091F6 29               [ 1]  165 	incw x 
      0091F7 27 05            [ 1]  166 	incw y 
      0091F9 CD 8E            [ 2]  167 	jra 1$ 
      0091FB FE               [ 1]  168 9$:	clr (x)
      0091FC 24               [ 2]  169 	popw x 
      0091FD 06               [ 1]  170 	pop a 
      0091FE 81               [ 4]  171 	ret 
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
      001410                        185 move::
      0091FE A6               [ 1]  186 	push a 
      001411                        187 	_vars VSIZE 
      0091FF 20 90            [ 2]    1     sub sp,#VSIZE 
      009201 F7 90            [ 1]  188 	clr (INCR,sp)
      009203 5C 81            [ 1]  189 	clr (LB,sp)
      009205 90 89            [ 2]  190 	pushw y 
      009205 88 7B            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009207 01 C1            [ 2]  192 	popw y 
      009209 00 24            [ 1]  193 	jreq move_exit ; x==y 
      00920B 2A 08            [ 1]  194 	jrmi move_down
      001421                        195 move_up: ; start from top address with incr=-1
      00920D A6 20 5A F7      [ 2]  196 	addw x,acc16
      009211 0C 01 20 F1      [ 2]  197 	addw y,acc16
      009215 84 81            [ 1]  198 	cpl (INCR,sp)
      009217 03 02            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009217 A6 22            [ 2]  200 	jra move_loop  
      00142F                        201 move_down: ; start from bottom address with incr=1 
      009219 90               [ 2]  202     decw x 
      00921A F7 90            [ 2]  203 	decw y
      00921C 5C 89            [ 1]  204 	inc (LB,sp) ; incr=1 
      001434                        205 move_loop:	
      00921E CD 98 47         [ 1]  206     ld a, acc16 
      009221 85 F6 27         [ 1]  207 	or a, acc8
      009224 30 5C            [ 1]  208 	jreq move_exit 
      009226 A1 20 25         [ 2]  209 	addw x,(INCR,sp)
      009229 0E 90 F7         [ 2]  210 	addw y,(INCR,sp) 
      00922C 90 5C            [ 1]  211 	ld a,(y)
      00922E A1               [ 1]  212 	ld (x),a 
      00922F 5C               [ 2]  213 	pushw x 
      009230 26 F0 0D         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009232 5A               [ 2]  215 	decw x 
      009232 90 F7 90         [ 2]  216 	ldw acc16,x 
      009235 5C               [ 2]  217 	popw x 
      009236 20 EA            [ 2]  218 	jra move_loop
      001450                        219 move_exit:
      001450                        220 	_drop VSIZE
      009238 88 A6            [ 2]    1     addw sp,#VSIZE 
      00923A 5C               [ 1]  221 	pop a 
      00923B 90               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001454                        231 clear_vars:
      00923C F7               [ 2]  232 	pushw x 
      00923D 90               [ 1]  233 	push a  
      00923E 5C 84 A0         [ 2]  234 	ldw x,#vars 
      009241 07 C7            [ 1]  235 	ld a,#CELL_SIZE*26 
      009243 00               [ 1]  236 1$:	clr (x)
      009244 0F               [ 1]  237 	incw x 
      009245 72               [ 1]  238 	dec a 
      009246 5F 00            [ 1]  239 	jrne 1$
      009248 0E               [ 1]  240 	pop a 
      009249 89               [ 2]  241 	popw x 
      00924A AE               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      00924B 8E 4C 72 BB 00 0E F6   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
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
      00925D                        253 system_information:
      00925D 1D 00 31         [ 2]  254 	ldw x,#software 
      009260 A6 03 62         [ 4]  255 	call puts 
      009263 9F AB            [ 1]  256 	ld a,#MAJOR 
      009265 41 81 0E         [ 1]  257 	ld acc8,a 
      009267 5F               [ 1]  258 	clrw x 
      009267 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00926A AE B3 E2 90      [ 1]  260 	clr tab_width  
      00926E CF 00 1A 90      [ 1]  261 	mov base, #10 
      009272 5F 91 D3         [ 4]  262 	call prt_acc24 
      009275 1A 27            [ 1]  263 	ld a,#'.
      009277 0C 90 5C         [ 4]  264 	call putc 
      00927A 91 D6            [ 1]  265 	ld a,#MINOR 
      00927C 1A 90 5C         [ 1]  266 	ld acc8,a 
      00927F 91               [ 1]  267 	clrw x 
      009280 DA 1A 26         [ 2]  268 	ldw acc24,x 
      009283 EF 93 90         [ 4]  269 	call prt_acc24
      009286 85 81            [ 1]  270 	ld a,#CR 
      009288 CD 09 44         [ 4]  271 	call putc
                                    272 ;call test 
      009288 52               [ 4]  273 	ret
                                    274 
      0014DA                        275 warm_init:
      009289 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00928D 6B 01 C6 00      [ 1]  277 	clr flags 
      009291 24 6B 02 17      [ 1]  278 	clr loop_depth 
      009295 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      009299 05 35 0A 00      [ 1]  280 	mov base,#10 
      00929D 0B 35 05         [ 2]  281 	ldw x,#0 
      0092A0 00 24 72         [ 2]  282 	ldw basicptr,x 
      0092A3 5F 00 0D         [ 2]  283 	ldw in.w,x 
      0092A6 CF 00 0E 4F      [ 1]  284 	clr count
      0092AA CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      0014FC                        291 clear_basic:
      0092AB 98               [ 2]  292 	pushw x 
      0092AC B3 CD 92 05      [ 1]  293 	clr count
      0092B0 88 90 93 1E      [ 1]  294 	clr in  
      0092B4 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092B7 80 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092BA 84 90 97         [ 2]  297 	ldw txtend,x 
      0092BD 72 F9 03         [ 4]  298 	call clear_vars 
      0092C0 A6               [ 2]  299 	popw x
      0092C1 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      001513                        305 err_msg:
      0092C2 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092CE 00 01 15 A4 15 BE 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CF 15 E0
      0092D0 15 EC 16 1F 16 2F 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             43 16 56
      0092D0 90 89                  309 	.word err_overflow 
                                    310 
      0092D2 CD 98 21 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092DA CC 93 F7 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             68 72 72 6F 72 0A 00
      0092E2 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092E2 A1 85 26 0F CD 91 EF   314 err_div0: .asciz "division by 0\n" 
             CD 98 56 CD 92 5D 90
             F7
      0092F1 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      0092F5 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092F5 A1 84 26 26 CD 98 60   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 EF 90 89 A6 FF CD
             98 B3 16 01 88
      00930F 51 CD 94 80 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      00931F 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      00931F FE 72 5C 00 02 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 A3 00 84
      00932B 26 23 CE 00 05 CD 91   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             EF A6 27 90 F7 90 5C
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      009339 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      009339 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      00934D CC 93 F7 A3 00 4C 26   324 err_no_fspace: .asciz "File system full.\n" 
             03 CC 92 D0 20 66 75
             6C 6C 2E 0A 00
      009358 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      009358 CD 91 EF 90 89 CD 94   326 err_overflow: .asciz "overflow\n" 
             32 90 85
                                    327 
      009362 CD 91 DA CC 92 D0 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009368 0A 63 6F 6D 70 69 6C   329 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      009368 A1 03 26 1E A6 20 90   330 tk_id: .asciz "last token id: "
             F7 90 5C 20 69 64 3A
             20 00
                                    331 
      009372                        332 syntax_error::
      009372 89 CD            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      0016A2                        335 tb_error::
      009374 98 47 85 22 4C   [ 2]  336 	btjt flags,#FCOMP,1$
      009377 88               [ 1]  337 	push a 
      009377 F6 27 07         [ 2]  338 	ldw x, #rt_msg 
      00937A 5C 90 F7         [ 4]  339 	call puts 
      00937D 90               [ 1]  340 	pop a 
      00937E 5C 20 F6         [ 2]  341 	ldw x, #err_msg 
      009381 72 5F 00 0D      [ 1]  342 	clr acc16 
      009381 A6               [ 1]  343 	sll a
      009382 20 90 F7 90      [ 1]  344 	rlc acc16  
      009386 5C CC 92         [ 1]  345 	ld acc8, a 
      009389 D0 BB 00 0D      [ 2]  346 	addw x,acc16 
      00938A FE               [ 2]  347 	ldw x,(x)
      00938A A1 02 26         [ 4]  348 	call puts
      00938D 09 CD 91         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      009390 EF CD 92         [ 1]  351 ld a,count 
      009393 17 CC            [ 1]  352 clrw y 
      009395 92 D0            [ 1]  353 rlwa y  
      009397 CD 06 A0         [ 4]  354 call hex_dump
      009397 A1 04 26         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      00939A 10 CD 91         [ 1]  357 	ld a,in 
      00939D EF A6 5C         [ 4]  358 	call prt_basic_line
      0093A0 90 F7 90         [ 2]  359 	ldw x,#tk_id 
      0093A3 5C F6 72         [ 4]  360 	call puts 
      0093A6 5C 00 02         [ 1]  361 	ld a,in.saved 
      0093A9 20               [ 1]  362 	clrw x 
      0093AA 06               [ 1]  363 	ld xl,a 
      0093AB A1 0A 26 09      [ 2]  364 	addw x,basicptr 
      0093AF A6               [ 1]  365 	ld a,(x)
      0093B0 3A               [ 1]  366 	clrw x 
      0093B1 97               [ 1]  367 	ld xl,a 
      0093B1 90 F7 90         [ 4]  368 	call prt_i16
      0093B4 5C 35            [ 2]  369 	jra 6$
      0093B5                        370 1$:	
      0093B5 CC               [ 1]  371 	push a 
      0093B6 92 D0 7F         [ 2]  372 	ldw x,#comp_msg
      0093B8 CD 09 A1         [ 4]  373 	call puts 
      0093B8 A1               [ 1]  374 	pop a 
      0093B9 09 22 0A         [ 2]  375 	ldw x, #err_msg 
      0093BC A0 05 5F 97      [ 1]  376 	clr acc16 
      0093C0 1C               [ 1]  377 	sll a
      0093C1 94 0D F6 20      [ 1]  378 	rlc acc16  
      0093C5 EB 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093C6 72 BB 00 0D      [ 2]  380 	addw x,acc16 
      0093C6 A1               [ 2]  381 	ldw x,(x)
      0093C7 11 22 0A         [ 4]  382 	call puts
      0093CA A0 10 5F         [ 2]  383 	ldw x,#tib
      0093CD 97 1C 94         [ 4]  384 	call puts 
      0093D0 12 F6            [ 1]  385 	ld a,#CR 
      0093D2 20 DD 44         [ 4]  386 	call putc
      0093D4 CE 00 00         [ 2]  387 	ldw x,in.w
      0093D4 A1 22 22         [ 4]  388 	call spaces
      0093D7 0A A0            [ 1]  389 	ld a,#'^
      0093D9 20 5F 97         [ 4]  390 	call putc 
      0093DC 1C 94 14         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093DF F6               [ 1]  392     ldw sp,x
                                    393 
      00172C                        394 warm_start:
      0093E0 20 CF DA         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      0093E2                        399 cmd_line: ; user interface 
      0093E2 A0 31            [ 1]  400 	ld a,#CR 
      0093E4 48 5F 97         [ 4]  401 	call putc 
      0093E7 1C 94            [ 1]  402 	ld a,#'> 
      0093E9 17 FE F6         [ 4]  403 	call putc
      0093EC 5C 90 F7         [ 4]  404 	call readln
      0093EF 90 5C F6 26      [ 1]  405 	tnz count 
      0093F3 BD CC            [ 1]  406 	jreq cmd_line
      0093F5 92 D0 DE         [ 4]  407 	call compile
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
      0093F7 72 5D 00 03      [ 1]  422 	tnz count 
      0093F7 90 7F            [ 1]  423 	jreq cmd_line
                                    424 	
                                    425 ; if direct command 
                                    426 ; it's ready to interpret 
                                    427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    428 ;; This is the interpreter loop
                                    429 ;; for each BASIC code line. 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00174B                        431 interpreter: 
      0093F9 1E 03 7B         [ 1]  432 	ld a,in 
      0093FC 01 C7 00         [ 1]  433 	cp a,count 
      0093FF 0B 7B            [ 1]  434 	jrmi interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      001753                        435 next_line:
      009401 02 C7 00 24 72   [ 2]  436 	btjf flags, #FRUN, cmd_line
      009406 F2 03 90         [ 2]  437 	ldw x,basicptr
      009409 9F 5B 04 81      [ 2]  438 	addw x,in.w 
      00940D 40 28 29         [ 2]  439 	cpw x,txtend 
      009410 2C 23            [ 1]  440 	jrpl warm_start
      009412 2B 2D 2A         [ 2]  441 	ldw basicptr,x ; start of next line  
      009415 2F 25            [ 1]  442 	ld a,(2,x)
      009417 94 23 94         [ 1]  443 	ld count,a 
      00941A 25 94 27 94      [ 1]  444 	mov in,#3 ; skip first 3 bytes of line 
      001770                        445 interp_loop:
      00941E 2A 94 2C         [ 4]  446 	call next_token
      009421 94 2F            [ 1]  447 	cp a,#TK_NONE 
      009423 3E 00            [ 1]  448 	jreq next_line 
      009425 3D 00            [ 1]  449 	cp a,#TK_CMD
      009427 3E 3D            [ 1]  450 	jrne 1$
      009429 00 3C 00         [ 4]  451 	call get_code_addr
      00942C 3C               [ 4]  452 	call (x) 
      00942D 3D 00            [ 2]  453 	jra interp_loop 
      001781                        454 1$:	 
      00942F 3C 3E            [ 1]  455 	cp a,#TK_VAR
      009431 00 05            [ 1]  456 	jrne 2$
      009432 CD 1C 6D         [ 4]  457 	call let_var  
      009432 52 04            [ 2]  458 	jra interp_loop 
      00178A                        459 2$:	
      009434 72 5F            [ 1]  460 	cp a,#TK_ARRAY 
      009436 00 0E            [ 1]  461 	jrne 3$
      009438 1F 01 AE         [ 4]  462 	call let_array 
      00943B B3 DA            [ 2]  463 	jra interp_loop
      001793                        464 3$:	
      00943D 1F 03            [ 1]  465 	cp a,#TK_COLON 
      00943F E6 02            [ 1]  466 	jreq interp_loop
      009441 A4 0F            [ 1]  467 4$: cp a,#TK_LABEL
      009443 C7 00 0F         [ 4]  468 	call skip_string 
      009446 1C 00            [ 2]  469 	jra interp_loop 
      009448 03 72 BB         [ 2]  470 5$:	jp syntax_error 
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
      0017A1                        481 next_token::
                                    482 ;	clrw x 
      00944B 00 0E FE         [ 1]  483 	ld a,in 
      00944E 13 01 27         [ 1]  484 	ld in.saved,a ; in case "_unget_token" needed 
                                    485 ; don't replace sub by "cp a,count" 
                                    486 ; if end of line must return with A=0   	
      009451 0A 1E 03         [ 1]  487 	sub a,count 
      009454 FE 1D            [ 1]  488 	jreq 9$ ; end of line 
      0017AC                        489 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009456 00 02 26         [ 2]  490 	ldw x,basicptr 
      009459 E3 20 05 1E      [ 2]  491 	addw x,in.w 
      00945D 03               [ 1]  492 	ld a,(x)
      00945E 1C               [ 1]  493 	incw x
      00945F 00 02 5B 04      [ 1]  494 	inc in   
      009463 81               [ 4]  495 9$: ret 
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
      000003 DE 33 62         [ 2]  506 	ldw x,(code_addr,x)
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
      009464 A6 10            [ 1]  589 	ld a,#16
      009464 89 4F 7D         [ 1]  590 	cp a,base
      009467 27 04            [ 1]  591 	jreq prt_acc24  
      009469 4C 5C 20 F9 85   [ 2]  592 	btjf acc16,#7,prt_acc24
      00946E 81 53 00 0C      [ 1]  593 	cpl acc24 ; sign extend 
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
      00946F                        605 prt_acc24:
      00946F F6 27            [ 1]  606 	ld a,#255  ; signed conversion  
      009471 0B 90 F1         [ 4]  607     call itoa  ; conversion entier en  .asciz
      009474 26 05 5C         [ 4]  608 	call right_align  
      009477 90               [ 1]  609 	push a 
      009478 5C 20 F4         [ 4]  610 	call puts
      00947B 84               [ 1]  611 	pop a 
      00947B 4F               [ 4]  612     ret	
                                    613 
                                    614 ;---------------------------------------
                                    615 ;  print value at xstack top 
                                    616 ;---------------------------------------
      00181B                        617 print_top: 
      00181B                        618 	_xpop 
      00947C 81 F6            [ 1]    1     ld a,(y)
      00947D 93               [ 1]    2     ldw x,y 
      00947D A6 01            [ 2]    3     ldw x,(1,x)
      00947F 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009480 C7 00 0C         [ 1]  619 	ld acc24,a 
      009480 88 89 90         [ 2]  620 	ldw acc16,x 
      009483 F6 27 06         [ 4]  621 	call prt_acc24 
      009486 F7 5C            [ 1]  622 	ld a,#SPACE
      009488 90 5C 20         [ 4]  623 	call putc 
      00948B F6               [ 4]  624 	ret 
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
      001833                        640 itoa::
      001833                        641 	_vars VSIZE
      00948C 7F 85            [ 2]    1     sub sp,#VSIZE 
      00948E 84 81            [ 1]  642 	clr (LEN,sp) ; string length  
      009490 0F 01            [ 1]  643 	clr (SIGN,sp)    ; sign
      009490 88               [ 1]  644 	tnz A
      009491 52 02            [ 1]  645 	jreq 1$ ; unsigned conversion  
      009493 0F 01 0F         [ 1]  646 	ld a,base 
      009496 02 90            [ 1]  647 	cp a,#10
      009498 89 13            [ 1]  648 	jrne 1$
                                    649 	; base 10 string display with negative sign if bit 23==1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      00949A 01 90 85 27 31   [ 2]  650 	btjf acc24,#7,1$
      00949F 2B 0E            [ 1]  651 	cpl (SIGN,sp)
      0094A1 CD 02 0D         [ 4]  652 	call neg_acc24
      00184D                        653 1$:
                                    654 ; initialize string pointer 
      0094A1 72 BB 00         [ 2]  655 	ldw x,#tib 
      0094A4 0E 72 B9         [ 2]  656 	addw x,#TIB_SIZE
      0094A7 00               [ 2]  657 	decw x 
      0094A8 0E               [ 1]  658 	clr (x)
      001855                        659 itoa_loop:
      0094A9 03 01 03         [ 1]  660     ld a,base
                                    661 ;	ldw (PSTR,sp),x 
      0094AC 02 20 05         [ 4]  662     call divu24_8 ; acc24/A 
                                    663 ;	ldw x,(PSTR,sp)
      0094AF AB 30            [ 1]  664     add a,#'0  ; remainder of division
      0094AF 5A 90            [ 1]  665     cp a,#'9+1
      0094B1 5A 0C            [ 1]  666     jrmi 2$
      0094B3 02 07            [ 1]  667     add a,#7 
      0094B4                        668 2$:	
      0094B4 C6               [ 2]  669 	decw x
      0094B5 00               [ 1]  670     ld (x),a
      0094B6 0E CA            [ 1]  671 	inc (LEN,sp)
                                    672 	; if acc24==0 conversion done
      0094B8 00 0F 27         [ 1]  673 	ld a,acc24
      0094BB 14 72 FB         [ 1]  674 	or a,acc16
      0094BE 01 72 F9         [ 1]  675 	or a,acc8
      0094C1 01 90            [ 1]  676     jrne itoa_loop
                                    677 	;conversion done, next add '$' or '-' as required
      0094C3 F6 F7 89         [ 1]  678 	ld a,base 
      0094C6 CE 00            [ 1]  679 	cp a,#16
      0094C8 0E 5A            [ 1]  680 	jreq 8$
      0094CA CF 00            [ 1]  681 	ld a,(SIGN,sp)
      0094CC 0E 85            [ 1]  682     jreq 10$
      0094CE 20 E4            [ 1]  683     ld a,#'-
      0094D0 20 02            [ 2]  684 	jra 9$ 
      001881                        685 8$:	
      0094D0 5B 02            [ 1]  686 	ld a,#'$ 
      0094D2 84               [ 2]  687 9$: decw x
      0094D3 81               [ 1]  688     ld (x),a
      0094D4 0C 02            [ 1]  689 	inc (LEN,sp)
      001887                        690 10$:
      0094D4 89 88            [ 1]  691 	ld a,(LEN,sp)
      001889                        692 	_drop VSIZE
      0094D6 AE 00            [ 2]    1     addw sp,#VSIZE 
      0094D8 31               [ 4]  693 	ret
                                    694 
                                    695 ;------------------------------------
                                    696 ; convert alpha to uppercase
                                    697 ; input:
                                    698 ;    a  character to convert
                                    699 ; output:
                                    700 ;    a  uppercase character
                                    701 ;------------------------------------
      00188C                        702 to_upper::
      0094D9 A6 4E            [ 1]  703 	cp a,#'a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094DB 7F 5C            [ 1]  704 	jrpl 1$
      0094DD 4A               [ 4]  705 0$:	ret
      0094DE 26 FB            [ 1]  706 1$: cp a,#'z	
      0094E0 84 85            [ 1]  707 	jrugt 0$
      0094E2 81 0A            [ 1]  708 	sub a,#32
      0094E4 0A               [ 4]  709 	ret
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
      001898                        723 atoi24::
      0094E5 54               [ 2]  724 	pushw x 
      001899                        725 	_vars VSIZE
      0094E6 69 6E            [ 2]    1     sub sp,#VSIZE 
                                    726 	; acc24=0 
      0094E8 79 20 42 41      [ 1]  727 	clr acc24    
      0094EC 53 49 43 20      [ 1]  728 	clr acc16
      0094F0 66 6F 72 20      [ 1]  729 	clr acc8 
      0094F4 53 54            [ 1]  730 	clr (SIGN,sp)
      0094F6 4D 38            [ 1]  731 	ld a,#10
      0094F8 0A 43            [ 1]  732 	ld (BASE,sp),a ; default base decimal
      0094FA 6F               [ 1]  733 	ld a,(x)
      0094FB 70 79            [ 1]  734 	jreq 9$  ; completed if 0
      0094FD 72 69            [ 1]  735 	cp a,#'-
      0094FF 67 68            [ 1]  736 	jrne 1$
      009501 74 2C            [ 1]  737 	cpl (SIGN,sp)
      009503 20 4A            [ 2]  738 	jra 2$
      009505 61 63            [ 1]  739 1$: cp a,#'$
      009507 71 75            [ 1]  740 	jrne 3$
      009509 65 73            [ 1]  741 	ld a,#16
      00950B 20 44            [ 1]  742 	ld (BASE,sp),a
      00950D 65               [ 1]  743 2$:	incw x
      00950E 73               [ 1]  744 	ld a,(x)
      0018C2                        745 3$:	
      00950F 63 68            [ 1]  746 	cp a,#'a
      009511 65 6E            [ 1]  747 	jrmi 4$
      009513 65 73            [ 1]  748 	sub a,#32
      009515 20 32            [ 1]  749 4$:	cp a,#'0
      009517 30 31            [ 1]  750 	jrmi 9$
      009519 39 2C            [ 1]  751 	sub a,#'0
      00951B 32 30            [ 1]  752 	cp a,#10
      00951D 32 32            [ 1]  753 	jrmi 5$
      00951F 0A 76            [ 1]  754 	sub a,#7
      009521 65 72            [ 1]  755 	cp a,(BASE,sp)
      009523 73 69            [ 1]  756 	jrpl 9$
      009525 6F 6E            [ 1]  757 5$:	ld (TEMP,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009527 20 00            [ 1]  758 	ld a,(BASE,sp)
      009529 CD 02 2A         [ 4]  759 	call mulu24_8
      009529 AE 94            [ 1]  760 	ld a,(TEMP,sp)
      00952B E3 CD 8A         [ 1]  761 	add a,acc24+2
      00952E 21 A6 02         [ 1]  762 	ld acc24+2,a
      009531 C7               [ 1]  763 	clr a
      009532 00 0F 5F         [ 1]  764 	adc a,acc24+1
      009535 CF 00 0D         [ 1]  765 	ld acc24+1,a
      009538 72               [ 1]  766 	clr a
      009539 5F 00 24         [ 1]  767 	adc a,acc24
      00953C 35 0A 00         [ 1]  768 	ld acc24,a
      00953F 0B CD            [ 2]  769 	jra 2$
      009541 98 8D            [ 1]  770 9$:	tnz (SIGN,sp)
      009543 A6 2E            [ 1]  771     jreq atoi_exit
      009545 CD 89 C4         [ 4]  772     call neg_acc24
      0018FE                        773 atoi_exit: 
      0018FE                        774 	_drop VSIZE
      009548 A6 00            [ 2]    1     addw sp,#VSIZE 
      00954A C7               [ 2]  775 	popw x ; restore x
      00954B 00               [ 4]  776 	ret
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
      001902                        797 search_dict::
      001902                        798 	_vars VSIZE 
      00954C 0F 5F            [ 2]    1     sub sp,#VSIZE 
      00954E CF 00            [ 2]  799 	ldw (YSAVE,sp),y 
      001906                        800 search_next:
      009550 0D CD            [ 2]  801 	ldw (XSAVE,sp),x 
                                    802 ; get name length in dictionary	
      009552 98               [ 1]  803 	ld a,(x)
      009553 8D A6            [ 1]  804 	and a,#0xf 
      009555 0D CD            [ 1]  805 	ld (NLEN,sp),a  
      009557 89 C4            [ 2]  806 	ldw y,(YSAVE,sp) ; name pointer 
      009559 81               [ 1]  807 	incw x 
      00955A                        808 cp_loop:
      00955A 90 AE            [ 1]  809 	ld a,(y)
      00955C 17 73            [ 1]  810 	jreq str_match 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00955E 72 5F            [ 1]  811 	tnz (NLEN,sp)
      009560 00 23            [ 1]  812 	jreq no_match  
      009562 72               [ 1]  813 	cp a,(x)
      009563 5F 00            [ 1]  814 	jrne no_match 
      009565 20 35            [ 1]  815 	incw y 
      009567 04               [ 1]  816 	incw x
      009568 00 24            [ 1]  817 	dec (NLEN,sp)
      00956A 35 0A            [ 2]  818 	jra cp_loop 
      001922                        819 no_match:
      00956C 00 0B            [ 2]  820 	ldw x,(XSAVE,sp) 
      00956E AE 00 00         [ 2]  821 	subw x,#2 ; move X to link field
      009571 CF 00            [ 1]  822 	push #TK_NONE 
      009573 05               [ 2]  823 	ldw x,(x) ; next word link 
      009574 CF               [ 1]  824 	pop a ; TK_NONE 
      009575 00 01            [ 1]  825 	jreq search_exit  ; not found  
                                    826 ;try next 
      009577 72 5F            [ 2]  827 	jra search_next
      00192F                        828 str_match:
      009579 00 04            [ 2]  829 	ldw x,(XSAVE,sp)
      00957B 81               [ 1]  830 	ld a,(X)
      00957C 6B 01            [ 1]  831 	ld (NLEN,sp),a ; needed to test keyword type  
      00957C 89 72            [ 1]  832 	and a,#0xf 
                                    833 ; move x to procedure address field 	
      00957E 5F               [ 1]  834 	inc a 
      00957F 00 04 72         [ 1]  835 	ld acc8,a 
      009582 5F 00 02 AE      [ 1]  836 	clr acc16 
      009586 00 80 CF 00      [ 2]  837 	addw x,acc16 
      00958A 1C               [ 2]  838 	ldw x,(x) ; routine index  
                                    839 ;determine keyword type bits 7:6 
      00958B CF 00            [ 1]  840 	ld a,(NLEN,sp)
      00958D 1E               [ 1]  841 	swap a 
      00958E CD 94            [ 1]  842 	and a,#0xc
      009590 D4               [ 1]  843 	srl a
      009591 85               [ 1]  844 	srl a 
      009592 81 80            [ 1]  845 	add a,#128
      009593                        846 search_exit: 
      00194C                        847 	_drop VSIZE 
      009593 00 00            [ 2]    1     addw sp,#VSIZE 
      009595 95               [ 4]  848 	ret 
                                    849 
                                    850 ;---------------------
                                    851 ; check if next token
                                    852 ;  is of expected type 
                                    853 ; input:
                                    854 ;   A 		 expected token attribute
                                    855 ;  ouput:
                                    856 ;   none     if fail call syntax_error 
                                    857 ;--------------------
      00194F                        858 expect:
      009596 B5               [ 1]  859 	push a 
      009597 95 C2 95         [ 4]  860 	call next_token 
      00959A D0 95            [ 1]  861 	cp a,(1,sp)
      00959C E9 95            [ 1]  862 	jreq 1$
      00959E F8 96 0E         [ 2]  863 	jp syntax_error
      0095A1 96               [ 1]  864 1$: pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      0095A2 24               [ 4]  865 	ret 
                                    866 
                                    867 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    868 ; parse arguments list 
                                    869 ; between ()
                                    870 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00195C                        871 func_args:
      0095A3 96 3E            [ 1]  872 	ld a,#TK_LPAREN 
      0095A5 96 4F 96         [ 4]  873 	call expect 
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
      001961                        889 arg_list:
      0095A8 60 96            [ 1]  890 	push #0
      0095AA 6C 96 9F         [ 4]  891 1$:	call condition 
      0095AD 96               [ 1]  892 	tnz a 
      0095AE AF 96            [ 1]  893 	jreq 6$  
      0095B0 C3 96            [ 1]  894 	inc (1,sp)
      0095B2 D6 96 E3         [ 4]  895 	call next_token 
      0095B5 4D 65            [ 1]  896 	cp a,#TK_COMMA 
      0095B7 6D 6F            [ 1]  897 	jreq 1$ 
      0095B9 72               [ 1]  898 6$:	pop a  
      0095BA 79               [ 4]  899 	ret 
                                    900 
                                    901 ;--------------------------------
                                    902 ;   BASIC commnands 
                                    903 ;--------------------------------
                                    904 
                                    905 ;--------------------------------
                                    906 ;  arithmetic and relational 
                                    907 ;  routines
                                    908 ;  operators precedence
                                    909 ;  highest to lowest
                                    910 ;  operators on same row have 
                                    911 ;  same precedence and are executed
                                    912 ;  from left to right.
                                    913 ;	'*','/','%'
                                    914 ;   '-','+'
                                    915 ;   '=','>','<','>=','<=','<>','><'
                                    916 ;   '<>' and '><' are equivalent for not equal.
                                    917 ;--------------------------------
                                    918 
                                    919 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    920 ; return array element
                                    921 ; address from @(expr)
                                    922 ; input:
                                    923 ;   A 		TK_ARRAY
                                    924 ; output:
                                    925 ;	X 		element address 
                                    926 ;----------------------
      001974                        927 get_array_element:
      0095BB 20 66 75         [ 4]  928 	call func_args 
      0095BE 6C 6C            [ 1]  929 	cp a,#1
      0095C0 0A 00            [ 1]  930 	jreq 1$
      0095C2 73 79 6E         [ 2]  931 	jp syntax_error
      00197E                        932 1$: _xpop 
      0095C5 74 61            [ 1]    1     ld a,(y)
      0095C7 78               [ 1]    2     ldw x,y 
      0095C8 20 65            [ 2]    3     ldw x,(1,x)
      0095CA 72 72 6F 72      [ 2]    4     addw y,#CELL_SIZE 
                                    933     ; ignore A, index < 65536 in any case 
                                    934 	; check for bounds 
      0095CE 0A 00 6D         [ 2]  935 	cpw x,array_size 
      0095D1 61 74            [ 2]  936 	jrule 3$
                                    937 ; bounds {1..array_size}	
      0095D3 68 20            [ 1]  938 2$: ld a,#ERR_BAD_VALUE 
      0095D5 6F 70 65         [ 2]  939 	jp tb_error 
      0095D8 72               [ 2]  940 3$: tnzw  x
      0095D9 61 74            [ 1]  941 	jreq 2$ 
      0095DB 69               [ 2]  942 	pushw x 
      0095DC 6F               [ 2]  943 	sllw x 
      0095DD 6E 20 6F         [ 2]  944 	addw x,(1,sp) ; index*size_of(int24)
      0095E0 76 65            [ 2]  945 	ldw (1,sp),x  
      0095E2 72 66 6C         [ 2]  946 	ldw x,#tib ; array is below tib 
      0095E5 6F 77 0A         [ 2]  947 	subw x,(1,sp)
      0019A1                        948 	_drop 2   
      0095E8 00 64            [ 2]    1     addw sp,#2 
      0095EA 69               [ 4]  949 	ret 
                                    950 
                                    951 
                                    952 ;***********************************
                                    953 ;   expression parse,execute 
                                    954 ;***********************************
                                    955 ;-----------------------------------
                                    956 ; factor ::= ['+'|'-'|e]  var | @ |
                                    957 ;			 integer | function |
                                    958 ;			 '('relation')' 
                                    959 ; output:
                                    960 ;   A       token attribute 
                                    961 ;   xstack  value  
                                    962 ; ---------------------------------
                           000001   963 	NEG=1
                           000001   964 	VSIZE=1
      0019A4                        965 factor:
      0019A4                        966 	_vars VSIZE 
      0095EB 76 69            [ 2]    1     sub sp,#VSIZE 
      0095ED 73 69            [ 1]  967 	clr (NEG,sp)
      0095EF 6F 6E 20         [ 4]  968 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0095F2 62               [ 1]  969 	tnz a 
      0095F3 79 20            [ 1]  970 	jrne 1$ 
      0095F5 30 0A 00         [ 2]  971 	jp 22$ 
      0095F8 69 6E            [ 1]  972 1$:	cp a,#TK_PLUS 
      0095FA 76 61            [ 1]  973 	jreq 2$
      0095FC 6C 69            [ 1]  974 	cp a,#TK_MINUS 
      0095FE 64 20            [ 1]  975 	jrne 4$ 
      009600 6C 69            [ 1]  976 	cpl (NEG,sp)
      0019BB                        977 2$:	
      009602 6E 65 20         [ 4]  978 	call next_token
      0019BE                        979 4$:
      009605 6E               [ 1]  980 	tnz a 
      009606 75 6D            [ 1]  981 	jrne 41$ 
      009608 62 65 72         [ 2]  982 	jp syntax_error  
      0019C4                        983 41$:	
      00960B 2E 0A            [ 1]  984 	cp a,#TK_IFUNC 
      00960D 00 72            [ 1]  985 	jrne 5$ 
      00960F 75 6E 20         [ 4]  986 	call get_code_addr 
      009612 74               [ 4]  987 	call (x); result in A:X  
      009613 69 6D            [ 2]  988 	jra 18$ 
      0019CE                        989 5$:
      009615 65 20            [ 1]  990 	cp a,#TK_INTGR
      009617 6F 6E            [ 1]  991 	jrne 6$
      009619 6C 79 20         [ 4]  992 	call get_int24 ; A:X
      00961C 75 73            [ 2]  993 	jra 18$
      0019D7                        994 6$:
      00961E 61 67            [ 1]  995 	cp a,#TK_ARRAY
      009620 65 2E            [ 1]  996 	jrne 7$
      009622 0A 00 63         [ 4]  997 	call get_array_element
      009625 6F 6D            [ 2]  998     jra 71$
      0019E0                        999 7$:
      009627 6D 61            [ 1] 1000 	cp a,#TK_VAR 
      009629 6E 64            [ 1] 1001 	jrne 8$
      00962B 20 6C 69         [ 4] 1002 	call get_addr 
      0019E7                       1003 71$: ; put value in A:X
      00962E 6E               [ 1] 1004 	ld a,(x)
      00962F 65 20            [ 2] 1005 	ldw x,(1,x)
      009631 6F 6E            [ 2] 1006 	jra 18$
      0019EC                       1007 8$:
      009633 6C 79            [ 1] 1008 	cp a,#TK_LABEL 
      009635 20 75            [ 1] 1009 	jrne 9$ 
      009637 73               [ 2] 1010 	pushw x 
      009638 61 67 65         [ 4] 1011 	call skip_string
      00963B 2E               [ 2] 1012 	popw x 
      00963C 0A 00 64         [ 4] 1013 	call search_const 
      00963F 75               [ 2] 1014 	tnzw x 
      009640 70 6C            [ 1] 1015 	jreq 16$
      009642 69 63 61         [ 4] 1016 	call get_const_value ; in A:X 
      009645 74 65            [ 2] 1017 	jra 18$
      001A00                       1018 9$: 
      009647 20 6E            [ 1] 1019 	cp a,#TK_CFUNC 
      009649 61 6D            [ 1] 1020 	jrne 12$
      00964B 65 2E 0A         [ 4] 1021 	call get_code_addr 
      00964E 00               [ 4] 1022 	call(x)
      00964F 46               [ 1] 1023 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009650 69               [ 1] 1024 	rlwa x  ; char>int24 in A:X 
      009651 6C 65            [ 2] 1025 	jra 18$ 	 
      001A0C                       1026 12$:			
      009653 20 6E            [ 1] 1027 	cp a,#TK_LPAREN
      009655 6F 74            [ 1] 1028 	jrne 16$
      009657 20 66 6F         [ 4] 1029 	call expression
      00965A 75 6E            [ 1] 1030 	ld a,#TK_RPAREN 
      00965C 64 2E 0A         [ 4] 1031 	call expect
      001A18                       1032 	_xpop 
      00965F 00 62            [ 1]    1     ld a,(y)
      009661 61               [ 1]    2     ldw x,y 
      009662 64 20            [ 2]    3     ldw x,(1,x)
      009664 76 61 6C 75      [ 2]    4     addw y,#CELL_SIZE 
      009668 65 2E            [ 2] 1033 	jra 18$	
      001A23                       1034 16$:
      001A23                       1035 	_unget_token 
      00966A 0A 00 46 69 6C   [ 1]    1      mov in,in.saved  
      00966F 65               [ 1] 1036 	clr a 
      009670 20 69            [ 2] 1037 	jra 22$ 
      001A2B                       1038 18$: 
      009672 6E 20            [ 1] 1039 	tnz (NEG,sp)
      009674 65 78            [ 1] 1040 	jreq 20$
      009676 74 65 6E         [ 4] 1041 	call neg_ax   
      001A32                       1042 20$:
      001A32                       1043 	_xpush 
      009679 64 65 64 20      [ 2]    1     subw y,#CELL_SIZE
      00967D 6D 65            [ 1]    2     ld (y),a 
      00967F 6D 6F 72         [ 2]    3     ldw (1,y),x 
      009682 79 2C            [ 1] 1044 	ld a,#TK_INTGR
      001A3D                       1045 22$:
      001A3D                       1046 	_drop VSIZE
      009684 20 63            [ 2]    1     addw sp,#VSIZE 
      009686 61               [ 4] 1047 	ret
                                   1048 
                                   1049 
                                   1050 ;-----------------------------------
                                   1051 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1052 ; output:
                                   1053 ;   A    	token attribute 
                                   1054 ;	xstack		value 
                                   1055 ;-----------------------------------
                           000001  1056 	MULOP=1
                           000001  1057 	VSIZE=1
      001A40                       1058 term:
      001A40                       1059 	_vars VSIZE
      009687 6E 27            [ 2]    1     sub sp,#VSIZE 
                                   1060 ; first factor 	
      009689 74 20 62         [ 4] 1061 	call factor
      00968C 65               [ 1] 1062 	tnz a 
      00968D 20 72            [ 1] 1063 	jreq term_exit  
      001A48                       1064 term01:	 ; check for  operator '*'|'/'|'%' 
      00968F 75 6E 20         [ 4] 1065 	call next_token
      009692 66 72            [ 1] 1066 	ld (MULOP,sp),a
      009694 6F 6D            [ 1] 1067 	and a,#TK_GRP_MASK
      009696 20 74            [ 1] 1068 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009698 68 65            [ 1] 1069 	jreq 1$
      00969A 72 65            [ 1] 1070 	ld a,#TK_INTGR
      001A55                       1071 	_unget_token 
      00969C 2E 0A 00 4E 6F   [ 1]    1      mov in,in.saved  
      0096A1 20 64            [ 2] 1072 	jra term_exit 
      001A5C                       1073 1$:	; got *|/|%
                                   1074 ;second factor
      0096A3 61 74 61         [ 4] 1075 	call factor
      0096A6 20               [ 1] 1076 	tnz a 
      0096A7 66 6F            [ 1] 1077 	jrne 2$ 
      0096A9 75 6E 64         [ 2] 1078 	jp syntax_error 
      001A65                       1079 2$: ; select operation 	
      0096AC 2E 0A            [ 1] 1080 	ld a,(MULOP,sp) 
      0096AE 00 4E            [ 1] 1081 	cp a,#TK_MULT 
      0096B0 6F 20            [ 1] 1082 	jrne 3$
                                   1083 ; '*' operator
      0096B2 70 72 6F         [ 4] 1084 	call mul24 
      0096B5 67 72            [ 2] 1085 	jra term01
      0096B7 61 6D            [ 1] 1086 3$: cp a,#TK_DIV 
      0096B9 20 69            [ 1] 1087 	jrne 4$ 
                                   1088 ; '/' operator	
      0096BB 6E 20 52         [ 4] 1089 	call div24 
      0096BE 41 4D            [ 2] 1090 	jra term01 
      001A79                       1091 4$: ; '%' operator
      0096C0 21 0A 00         [ 4] 1092 	call mod24
      0096C3 46 69            [ 2] 1093 	jra term01 
      001A7E                       1094 9$: 
      0096C5 6C 65            [ 1] 1095 	ld a,#TK_INTGR
      001A80                       1096 term_exit:
      001A80                       1097 	_drop VSIZE 
      0096C7 20 73            [ 2]    1     addw sp,#VSIZE 
      0096C9 79               [ 4] 1098 	ret 
                                   1099 
                                   1100 ;-------------------------------
                                   1101 ;  expr ::= term [['+'|'-'] term]*
                                   1102 ;  result range {-32768..32767}
                                   1103 ;  output:
                                   1104 ;   A    token attribute 
                                   1105 ;   xstack	 result    
                                   1106 ;-------------------------------
                           000001  1107 	OP=1 
                           000001  1108 	VSIZE=1 
      001A83                       1109 expression:
      001A83                       1110 	_vars VSIZE 
      0096CA 73 74            [ 2]    1     sub sp,#VSIZE 
                                   1111 ; first term 	
      0096CC 65 6D 20         [ 4] 1112 	call term
      0096CF 66               [ 1] 1113 	tnz a 
      0096D0 75 6C            [ 1] 1114 	jreq 9$
      001A8B                       1115 1$:	; operator '+'|'-'
      0096D2 6C 2E 0A         [ 4] 1116 	call next_token
      0096D5 00 42            [ 1] 1117 	ld (OP,sp),a 
      0096D7 75 66            [ 1] 1118 	and a,#TK_GRP_MASK
      0096D9 66 65            [ 1] 1119 	cp a,#TK_GRP_ADD 
      0096DB 72 20            [ 1] 1120 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001A96                       1121 	_unget_token 
      0096DD 66 75 6C 6C 0A   [ 1]    1      mov in,in.saved  
      0096E2 00 6F            [ 1] 1122 	ld a,#TK_INTGR
      0096E4 76 65            [ 2] 1123 	jra 9$ 
      001A9F                       1124 2$: ; second term 
      0096E6 72 66 6C         [ 4] 1125 	call term
      0096E9 6F               [ 1] 1126 	tnz a 
      0096EA 77 0A            [ 1] 1127 	jrne 3$
      0096EC 00 0A 72         [ 2] 1128 	jp syntax_error
      001AA8                       1129 3$:
      0096EF 75 6E            [ 1] 1130 	ld a,(OP,sp)
      0096F1 20 74            [ 1] 1131 	cp a,#TK_PLUS 
      0096F3 69 6D            [ 1] 1132 	jrne 4$
                                   1133 ; '+' operator	
      0096F5 65 20 65         [ 4] 1134 	call add24
      0096F8 72 72            [ 2] 1135 	jra 1$ 
      001AB3                       1136 4$:	; '-' operator 
      0096FA 6F 72 2C         [ 4] 1137 	call sub24
      0096FD 20 00            [ 2] 1138 	jra 1$
      001AB8                       1139 9$:
      001AB8                       1140 	_drop VSIZE 
      0096FF 0A 63            [ 2]    1     addw sp,#VSIZE 
      009701 6F               [ 4] 1141 	ret 
                                   1142 
                                   1143 ;---------------------------------------------
                                   1144 ; rel ::= expr rel_op expr
                                   1145 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1146 ;  relation return  integer , zero is false 
                                   1147 ;  output:
                                   1148 ;	 xstack		value  
                                   1149 ;---------------------------------------------
                           000001  1150 	RELOP=1
                           000001  1151 	VSIZE=1 
      001ABB                       1152 relation: 
      001ABB                       1153 	_vars VSIZE
      009702 6D 70            [ 2]    1     sub sp,#VSIZE 
      009704 69 6C 65         [ 4] 1154 	call expression
      009707 20               [ 1] 1155 	tnz a 
      009708 65 72            [ 1] 1156 	jreq 9$ 
                                   1157 ; expect rel_op or leave 
      00970A 72 6F 72         [ 4] 1158 	call next_token 
      00970D 2C 20            [ 1] 1159 	ld (RELOP,sp),a 
      00970F 00 6C            [ 1] 1160 	and a,#TK_GRP_MASK
      009711 61 73            [ 1] 1161 	cp a,#TK_GRP_RELOP 
      009713 74 20            [ 1] 1162 	jreq 2$
      009715 74 6F            [ 1] 1163 	ld a,#TK_INTGR 
      001AD0                       1164 	_unget_token 
      009717 6B 65 6E 20 69   [ 1]    1      mov in,in.saved  
      00971C 64 3A            [ 2] 1165 	jra 9$ 
      001AD7                       1166 2$:	; expect another expression
      00971E 20 00 83         [ 4] 1167 	call expression
      009720 4D               [ 1] 1168 	tnz a 
      009720 A6 02            [ 1] 1169 	jrne 3$
      009722 CC 16 A0         [ 2] 1170 	jp syntax_error 
      001AE0                       1171 3$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009722 72 0A 00         [ 4] 1172 	call cp24 
      001AE3                       1173 	_xpop  
      009725 23 4C            [ 1]    1     ld a,(y)
      009727 88               [ 1]    2     ldw x,y 
      009728 AE 96            [ 2]    3     ldw x,(1,x)
      00972A ED CD 8A 21      [ 2]    4     addw y,#CELL_SIZE 
      00972E 84               [ 1] 1174 	tnz a 
      00972F AE 95            [ 1] 1175 	jrmi 4$
      009731 93 72            [ 1] 1176 	jrne 5$
      009733 5F 00 0E 48      [ 1] 1177 	mov acc8,#2 ; i1==i2
      009737 72 59            [ 2] 1178 	jra 6$ 
      001AF7                       1179 4$: ; i1<i2
      009739 00 0E C7 00      [ 1] 1180 	mov acc8,#4 
      00973D 0F 72            [ 2] 1181 	jra 6$
      001AFD                       1182 5$: ; i1>i2
      00973F BB 00 0E FE      [ 1] 1183 	mov acc8,#1  
      001B01                       1184 6$: ; 0=false, -1=true 
      009743 CD               [ 1] 1185 	clrw x 
      009744 8A 21 CE         [ 1] 1186 	ld a, acc8  
      009747 00 05            [ 1] 1187 	and a,(RELOP,sp)
      009749 C6 00            [ 1] 1188 	jreq 7$
      00974B 04               [ 2] 1189 	cplw x 
      00974C 90 5F            [ 1] 1190 	ld a,#255 
      001B0C                       1191 7$:	_xpush 
      00974E 90 02 CD 87      [ 2]    1     subw y,#CELL_SIZE
      009752 20 CE            [ 1]    2     ld (y),a 
      009754 00 05 C6         [ 2]    3     ldw (1,y),x 
      009757 00 02            [ 1] 1192 	ld a,#TK_INTGR
      001B17                       1193 9$: 
      001B17                       1194 	_drop VSIZE
      009759 CD A0            [ 2]    1     addw sp,#VSIZE 
      00975B 2E               [ 4] 1195 	ret 
                                   1196 
                                   1197 ;-------------------------------------------
                                   1198 ;  AND factor:   relation | (condition)
                                   1199 ;  output:
                                   1200 ;     A      TK_INTGR|0
                                   1201 ;-------------------------------------------
      001B1A                       1202 and_factor:
      00975C AE 97 10         [ 4] 1203 	call next_token  
      00975F CD               [ 1] 1204 	tnz a 
      009760 8A 21            [ 1] 1205 	jreq 8$ 
      009762 C6 00            [ 1] 1206 	cp a,#TK_LPAREN 
      009764 03 5F            [ 1] 1207 	jrne 1$
      009766 97 72 BB         [ 4] 1208 	call condition
      009769 00 05            [ 1] 1209 	ld a,#TK_RPAREN 
      00976B F6 5F 97         [ 4] 1210 	call expect
      00976E CD               [ 4] 1211 	ret
      001B2D                       1212 1$: _unget_token 
      00976F 98 76 20 35 01   [ 1]    1      mov in,in.saved  
      009773 CD 1A BB         [ 4] 1213 	call relation 
      009773 88               [ 4] 1214 8$: ret 
                                   1215 
                                   1216 
                                   1217 ;--------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1218 ;  AND operator as priority over OR||XOR 
                                   1219 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1220 ;          
                                   1221 ;  output:
                                   1222 ;     A     TK_INTGR|0
                                   1223 ;    xtack   value 
                                   1224 ;--------------------------------------------
      001B36                       1225 and_cond:
      009774 AE 96 FF         [ 4] 1226 	call and_factor
      009777 CD               [ 1] 1227 	tnz a 
      009778 8A 21            [ 1] 1228 	jreq 9$  
      00977A 84 AE 95         [ 4] 1229 1$: call next_token 
      00977D 93               [ 1] 1230 	tnz a 
      00977E 72 5F            [ 1] 1231 	jreq 6$ 
      009780 00 0E            [ 1] 1232 	cp a,#TK_AND 
      009782 48 72            [ 1] 1233 	jreq 3$
      001B46                       1234 	_unget_token 
      009784 59 00 0E C7 00   [ 1]    1      mov in,in.saved  
      009789 0F 72            [ 2] 1235 	jra 6$ 
      00978B BB 00 0E         [ 4] 1236 3$:	call and_factor  
      00978E FE               [ 1] 1237 	tnz a 
      00978F CD 8A            [ 1] 1238 	jrne 4$
      009791 21 AE 16         [ 2] 1239 	jp syntax_error 
      001B56                       1240 4$:	
      001B56                       1241 	_xpop 
      009794 68 CD            [ 1]    1     ld a,(y)
      009796 8A               [ 1]    2     ldw x,y 
      009797 21 A6            [ 2]    3     ldw x,(1,x)
      009799 0D CD 89 C4      [ 2]    4     addw y,#CELL_SIZE 
      00979D CE 00 01         [ 1] 1242 	ld acc24,a 
      0097A0 CD 8A 8E         [ 2] 1243 	ldw acc16,x
      001B65                       1244 	_xpop 
      0097A3 A6 5E            [ 1]    1     ld a,(y)
      0097A5 CD               [ 1]    2     ldw x,y 
      0097A6 89 C4            [ 2]    3     ldw x,(1,x)
      0097A8 AE 17 FF 94      [ 2]    4     addw y,#CELL_SIZE 
      0097AC C4 00 0C         [ 1] 1245 	and a,acc24 
      0097AC CD               [ 1] 1246 	rlwa x 
      0097AD 95 5A 0D         [ 1] 1247 	and a,acc16 
      0097AF 02               [ 1] 1248 	rlwa x 
      0097AF A6 0D CD         [ 1] 1249 	and a,acc8 
      0097B2 89               [ 1] 1250 	rlwa x
      001B7A                       1251 	_xpush
      0097B3 C4 A6 3E CD      [ 2]    1     subw y,#CELL_SIZE
      0097B7 89 C4            [ 1]    2     ld (y),a 
      0097B9 CD 8B 26         [ 2]    3     ldw (1,y),x 
      0097BC 72 5D            [ 2] 1252 	jra 1$  
      0097BE 00 04            [ 1] 1253 6$: ld a,#TK_INTGR 
      0097C0 27               [ 4] 1254 9$:	ret 	 
                                   1255 
                                   1256 
                                   1257 ;--------------------------------------------
                                   1258 ; condition for IF and UNTIL 
                                   1259 ; operators: OR,XOR 
                                   1260 ; format:  and_cond [ OP and_cond ]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1261 ; output:
                                   1262 ;    A        INTGR|0 
                                   1263 ;    xstack   value 
                                   1264 ;--------------------------------------------
                           000001  1265 	ATMP=1
                           000002  1266 	OP=2
                           000002  1267 	VSIZE=2 
      001B88                       1268 condition:
      001B88                       1269 	_vars VSIZE 
      0097C1 ED CD            [ 2]    1     sub sp,#VSIZE 
      0097C3 91 5E 72         [ 4] 1270 	call and_cond
      0097C6 5D               [ 1] 1271 	tnz a 
      0097C7 00 04            [ 1] 1272 	jreq 9$ 
      0097C9 27 E4 A1         [ 4] 1273 1$:	call next_token 
      0097CB A1 88            [ 1] 1274 	cp a,#TK_OR 
      0097CB C6 00            [ 1] 1275 	jreq 2$
      0097CD 02 C1            [ 1] 1276 	cp a,#TK_XOR
      0097CF 00 04            [ 1] 1277 	jreq 2$ 
      001B9B                       1278 	_unget_token 
      0097D1 2B 1D 02 00 01   [ 1]    1      mov in,in.saved  
      0097D3 20 55            [ 2] 1279 	jra 8$ 
      0097D3 72 01            [ 1] 1280 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097D5 00 23 D7         [ 4] 1281 	call and_cond
      0097D8 CE 00            [ 1] 1282 	cp a,#TK_INTGR 
      0097DA 05 72            [ 1] 1283 	jreq 3$
      0097DC BB 00 01         [ 2] 1284 	jp syntax_error 
      001BAE                       1285 3$:	 
      001BAE                       1286 	_xpop  ; rigth arg 
      0097DF C3 00            [ 1]    1     ld a,(y)
      0097E1 1E               [ 1]    2     ldw x,y 
      0097E2 2A C8            [ 2]    3     ldw x,(1,x)
      0097E4 CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      0097E8 02 C7 00         [ 1] 1287 	ld acc24,a 
      0097EB 04 35 03         [ 2] 1288 	ldw acc16,x 
      001BBD                       1289 	_xpop  ; left arg  
      0097EE 00 02            [ 1]    1     ld a,(y)
      0097F0 93               [ 1]    2     ldw x,y 
      0097F0 CD 98            [ 2]    3     ldw x,(1,x)
      0097F2 21 A1 00 27      [ 2]    4     addw y,#CELL_SIZE 
      0097F6 DC A1            [ 1] 1290 	ld (ATMP,sp),a 
      0097F8 80 26            [ 1] 1291 	ld a,(OP,sp)
      0097FA 06 CD            [ 1] 1292 	cp a,#TK_XOR 
      0097FC 98 3A            [ 1] 1293 	jreq 5$ 
      001BCE                       1294 4$: ; A:X OR acc24   
      0097FE FD 20            [ 1] 1295 	ld a,(ATMP,sp)
      009800 EF 00 0C         [ 1] 1296 	or a,acc24 
      009801 02               [ 1] 1297 	rlwa x 
      009801 A1 85 26         [ 1] 1298 	or a,acc16 
      009804 05               [ 1] 1299 	rlwa x 
      009805 CD 9C ED         [ 1] 1300 	or a,acc8 
      009808 20               [ 1] 1301 	rlwa x 
      009809 E6 0E            [ 2] 1302 	jra 6$  
      00980A                       1303 5$: ; A:X XOR acc24 
      00980A A1 05            [ 1] 1304 	ld a,(ATMP,sp)
      00980C 26 05 CD         [ 1] 1305 	xor a,acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00980F 9C               [ 1] 1306 	rlwa x 
      009810 E8 20 DD         [ 1] 1307 	xor a,acc16 
      009813 02               [ 1] 1308 	rlwa x 
      009813 A1 0A 27         [ 1] 1309 	xor a,acc8 
      009816 D9               [ 1] 1310 	rlwa x 
      001BEC                       1311 6$: _xpush
      009817 A1 03 CD 98      [ 2]    1     subw y,#CELL_SIZE
      00981B 47 20            [ 1]    2     ld (y),a 
      00981D D2 CC 97         [ 2]    3     ldw (1,y),x 
      009820 20 99            [ 2] 1312 	jra 1$ 
      009821 A6 84            [ 1] 1313 8$:	ld a,#TK_INTGR 
      001BF9                       1314 9$:	_drop VSIZE 
      009821 C6 00            [ 2]    1     addw sp,#VSIZE 
      009823 02               [ 4] 1315 	ret 
                                   1316 
                                   1317 
                                   1318 ;--------------------------------------------
                                   1319 ; BASIC: HEX 
                                   1320 ; select hexadecimal base for integer print
                                   1321 ;---------------------------------------------
      001BFC                       1322 hex_base:
      009824 C7 00 03 C0      [ 1] 1323 	mov base,#16 
      009828 00               [ 4] 1324 	ret 
                                   1325 
                                   1326 ;--------------------------------------------
                                   1327 ; BASIC: DEC 
                                   1328 ; select decimal base for integer print
                                   1329 ;---------------------------------------------
      001C01                       1330 dec_base:
      009829 04 27 0D 0A      [ 1] 1331 	mov base,#10
      00982C 81               [ 4] 1332 	ret 
                                   1333 
                                   1334 ;------------------------
                                   1335 ; BASIC: FREE 
                                   1336 ; return free size in RAM 
                                   1337 ; output:
                                   1338 ;   A:x		size 
                                   1339 ;--------------------------
      001C06                       1340 free:
      00982C CE 00            [ 2] 1341 	pushw y 
      00982E 05               [ 1] 1342 	clr a 
      00982F 72 BB 00         [ 2] 1343 	ldw x,#tib 
      009832 01 F6 5C 72      [ 2] 1344 	ldw y,txtbgn 
      009836 5C 00 02 81      [ 2] 1345 	cpw y,#app_space
      00983A 25 05            [ 1] 1346 	jrult 1$
      00983A FE DE B3         [ 2] 1347 	subw x,#free_ram 
      00983D E2 04            [ 2] 1348 	jra 2$ 
      00983E                       1349 1$:	
      00983E 72 5C 00 02      [ 2] 1350 	subw x,txtend
      009842 72 5C            [ 2] 1351 2$:	popw y 
      009844 00               [ 4] 1352 	ret 
                                   1353 
                                   1354 ;------------------------------
                                   1355 ; BASIC: SIZE 
                                   1356 ; command that print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1357 ; program start addres and size 
                                   1358 ;------------------------------
      001C22                       1359 cmd_size:
      009845 02 81 0A         [ 1] 1360 	push base 
      009847 AE 1E 7B         [ 2] 1361 	ldw x,#PROG_ADDR 
      009847 F6 27 03         [ 4] 1362 	call puts 
      00984A 5C 20 FA         [ 2] 1363 	ldw x,txtbgn     
      00984D 5C 72 B0 00      [ 1] 1364 	mov base,#16 
      009851 05 CF 00         [ 4] 1365 	call prt_i16
      009854 01 81 0A         [ 1] 1366 	pop base 
      009856 AE 1E 8D         [ 2] 1367 	ldw x,#PROG_SIZE 
      009856 FE 72 5C         [ 4] 1368 	call puts 
      009859 00 02 72         [ 2] 1369 	ldw x,txtend 
      00985C 5C 00 02 81      [ 2] 1370 	subw x,txtbgn 
      009860 CD 17 F6         [ 4] 1371 	call prt_i16
      009860 F6 EE 01         [ 2] 1372 	ldw x,#STR_BYTES 
      009863 72 5C 00         [ 4] 1373 	call puts  
      009866 02               [ 4] 1374 	ret 
                                   1375 
                                   1376 
                                   1377 ;------------------------
                                   1378 ; BASIC: UBOUND  
                                   1379 ; return array variable size 
                                   1380 ; and set 'array_size' variable 
                                   1381 ; output:
                                   1382 ;   A:X 	array_size
                                   1383 ;--------------------------
      001C4F                       1384 ubound:
      009867 72 5C 00         [ 4] 1385 	call free 
      00986A 02 72            [ 1] 1386 	ld a,#CELL_SIZE 
      00986C 5C               [ 4] 1387 	mul x,a 
      00986D 00 02 81         [ 2] 1388 	ldw array_size,x
      009870 4F               [ 1] 1389 	clr a 
      009870 F6               [ 4] 1390 	ret 
                                   1391 
                                   1392 ;-----------------------------
                                   1393 ; BASIC: LET var=expr 
                                   1394 ; variable assignement 
                                   1395 ; output:
                                   1396 ;   A 		TK_NONE 
                                   1397 ;-----------------------------
      001C5A                       1398 let::
      009871 72 5C 00         [ 4] 1399 	call next_token 
      009874 02 81            [ 1] 1400 	cp a,#TK_VAR 
      009876 27 0C            [ 1] 1401 	jreq let_var
      009876 72 5F            [ 1] 1402 	cp a,#TK_ARRAY 
      009878 00 0D            [ 1] 1403 	jreq  let_array
      00987A CF 00 0E         [ 2] 1404 	jp syntax_error
      001C68                       1405 let_array:
      00987D A6 10 C1         [ 4] 1406 	call get_array_element
      009880 00 0B            [ 2] 1407 	jra let_eval 
      001C6D                       1408 let_var:
      009882 27 09 72         [ 4] 1409 	call get_addr
      001C70                       1410 let_eval:
      009885 0F 00 0E         [ 2] 1411 	ldw ptr16,x  ; variable address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009888 04 72 53         [ 4] 1412 	call next_token 
      00988B 00 0D            [ 1] 1413 	cp a,#TK_EQUAL
      00988D 27 03            [ 1] 1414 	jreq 1$
      00988D A6 FF CD         [ 2] 1415 	jp syntax_error
      001C7D                       1416 1$:	
      009890 98 B3 CD         [ 4] 1417 	call condition   
      009893 92 05            [ 1] 1418 	cp a,#TK_INTGR 
      009895 88 CD            [ 1] 1419 	jreq 2$
      009897 8A 21 84         [ 2] 1420 	jp syntax_error
      001C87                       1421 2$:	
      001C87                       1422 	_xpop ; value 
      00989A 81 F6            [ 1]    1     ld a,(y)
      00989B 93               [ 1]    2     ldw x,y 
      00989B 90 F6            [ 2]    3     ldw x,(1,x)
      00989D 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      001C90                       1423 3$:
      0098A1 A9 00 03 C7      [ 4] 1424 	ld [ptr16],a
      0098A5 00 0D CF 00      [ 1] 1425 	inc ptr8  
      0098A9 0E CD 98 8D      [ 5] 1426 	ldw [ptr16],x 
      0098AD A6               [ 4] 1427 	ret 
                                   1428 
                                   1429 
                                   1430 ;--------------------------
                                   1431 ; return constant value 
                                   1432 ; from it's record address
                                   1433 ; input:
                                   1434 ;	X	*const record 
                                   1435 ; output:
                                   1436 ;   A:X   const  value
                                   1437 ;--------------------------
      001C9D                       1438 get_const_value: ; -- i 
      0098AE 20               [ 1] 1439 	ld a,(x) ; record size 
      0098AF CD 89            [ 1] 1440 	sub a,#3 ; * value 
      0098B1 C4               [ 1] 1441 	push a 
      0098B2 81 00            [ 1] 1442 	push #0 
      0098B3 72 FB 01         [ 2] 1443 	addw x,(1,sp)
      0098B3 52               [ 1] 1444 	ld a,(x)
      0098B4 04 0F            [ 2] 1445 	ldw x,(1,x)
      001CA9                       1446 	_drop 2
      0098B6 02 0F            [ 2]    1     addw sp,#2 
      0098B8 01               [ 4] 1447 	ret 
                                   1448 
                                   1449 
                                   1450 ;--------------------------
                                   1451 ; list constants in EEPROM 
                                   1452 ; call when using LIST \C 
                                   1453 ;-------------------------
                           000001  1454 	COUNT=1
                           000003  1455 	YTEMP=3
                           000004  1456 	VSIZE=4 
      001CAC                       1457 list_const:
      0098B9 4D 27            [ 2] 1458 	pushw y 
      001CAE                       1459 	_vars 4 
      0098BB 11 C6            [ 2]    1     sub sp,#4 
      0098BD 00               [ 1] 1460 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      0098BE 0B A1            [ 2] 1461 	ldw (COUNT,sp),x  
      0098C0 0A 26 0A 72      [ 2] 1462 	ldw Y,#EEPROM_BASE 
      0098C4 0F 00 0D 05      [ 2] 1463 1$:	cpw y,free_eeprom 
      0098C8 03 01            [ 1] 1464 	jruge 9$
      0098CA CD 82            [ 2] 1465     ldw (YTEMP,sp),y 
      0098CC 8D               [ 1] 1466 	ldw x,y
      0098CD 5C               [ 1] 1467 	incw x 
      0098CD AE 16 68         [ 4] 1468 	call puts  
      0098D0 1C 00            [ 1] 1469 	ld a,#'= 
      0098D2 50 5A 7F         [ 4] 1470 	call putc 
      0098D5 1E 03            [ 2] 1471 	ldw x,(YTEMP,sp)
      0098D5 C6 00 0B         [ 4] 1472 	call get_const_value 
      0098D8 CD 83 89         [ 1] 1473 	ld acc24,a 
      0098DB AB 30 A1         [ 2] 1474 	ldw acc16,x 
      0098DE 3A 2B 02         [ 4] 1475 	call prt_acc24
      0098E1 AB 07            [ 1] 1476 	ld a,#CR 
      0098E3 CD 09 44         [ 4] 1477 	call putc 
      0098E3 5A F7            [ 2] 1478 	ldw x,(COUNT,sp)
      0098E5 0C               [ 1] 1479 	incw x 
      0098E6 02 C6            [ 2] 1480 	ldw (COUNT,sp),x 
      0098E8 00 0D CA 00      [ 1] 1481 	clr acc16 
      0098EC 0E CA            [ 2] 1482 	ldw y,(YTEMP,sp)
      0098EE 00 0F            [ 1] 1483 	ld a,(y)
      0098F0 26 E3 C6         [ 1] 1484 	ld acc8,a
      0098F3 00 0B A1 10      [ 2] 1485 	addw y,acc16 
      0098F7 27 08            [ 2] 1486 	jra 1$ 
      001CF2                       1487 9$:	
      0098F9 7B 01            [ 2] 1488 	ldw x,(COUNT,sp)
      0098FB 27 0A A6         [ 4] 1489 	call prt_i16 
      0098FE 2D 20 02         [ 2] 1490 	ldw x,#CONST_COUNT 
      009901 CD 09 A1         [ 4] 1491 	call puts 
      001CFD                       1492 	_drop VSIZE 
      009901 A6 24            [ 2]    1     addw sp,#VSIZE 
      009903 5A F7            [ 2] 1493 	popw y 
      009905 0C               [ 4] 1494 	ret 
                                   1495 
      009906 02 63 6F 6E 73 74 61  1496 CONST_COUNT: .asciz " constants in EEPROM\n"
             6E 74 73 20 69 6E 20
             45 45 50 52 4F 4D 0A
             00
                                   1497 
                                   1498 
                                   1499 ;--------------------------
                                   1500 ; BASIC: EEFREE 
                                   1501 ; eeprom_free 
                                   1502 ; search end of data  
                                   1503 ; in EEPROM 
                                   1504 ; input:
                                   1505 ;    none 
                                   1506 ; output:
                                   1507 ;    A:X     address free
                                   1508 ;-------------------------
      009907                       1509 func_eefree:
      009907 7B 02 5B         [ 2] 1510 	ldw x,#EEPROM_BASE 
      00990A 04 81 00 0E      [ 1] 1511 1$:	mov acc8,#8 ; count 8 consecutive zeros
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      00990C A3 47 F8         [ 2] 1512     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      00990C A1 61            [ 1] 1513 	jruge 8$ ; no free space 
      00990E 2A               [ 1] 1514 2$: ld a,(x)
      00990F 01 81            [ 1] 1515 	jrne 3$
      009911 A1               [ 1] 1516 	incw x 
      009912 7A 22 FB A0      [ 1] 1517 	dec acc8 
      009916 20 81            [ 1] 1518 	jrne 2$
      009918 1D 00 08         [ 2] 1519 	subw x,#8 
      009918 89 52            [ 2] 1520 	jra 9$  
      00991A 03               [ 1] 1521 3$: ld a,(x)
      00991B 72               [ 1] 1522 	incw x
      00991C 5F               [ 1] 1523 	tnz a  
      00991D 00 0D            [ 1] 1524 	jrne 3$
      00991F 72               [ 2] 1525 	decw x   
      009920 5F 00            [ 2] 1526 	jra 1$ 
      009922 0E               [ 1] 1527 8$: clrw x ; no free space 
      009923 72               [ 1] 1528 9$: clr a 
      009924 5F 00 0F         [ 2] 1529 	ldw free_eeprom,x ; save in system variable 
      009927 0F               [ 4] 1530 	ret 
                                   1531 
                           000005  1532 CONST_REC_XTRA_BYTES=5 
                                   1533 ;--------------------------
                                   1534 ; search constant name 
                                   1535 ; format of constant record  
                                   1536 ;   .byte record length 
                                   1537 ;         = strlen(name)+5 
                                   1538 ;   .asciz name (variable length)
                                   1539 ;   .int24 value (3 bytes )
                                   1540 ; a constant record use 7+ bytes
                                   1541 ; constants are saved in EEPROM  
                                   1542 ; input:
                                   1543 ;    X     *name
                                   1544 ; output:
                                   1545 ;    X     address|0
                                   1546 ; use:
                                   1547 ;   A,Y, acc16 
                                   1548 ;-------------------------
                           000001  1549 	NAMEPTR=1 ; target name pointer 
                           000003  1550 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1551 	RECLEN=5  ; record length of target
                           000005  1552 	VSIZE=5
      001D41                       1553 search_const:
      009928 01 A6            [ 2] 1554 	pushw y 
      001D43                       1555 	_vars VSIZE
      00992A 0A 6B            [ 2]    1     sub sp,#VSIZE 
      00992C 02 F6 27 47      [ 1] 1556 	clr acc16 
      009930 A1 2D 26         [ 4] 1557 	call strlen 
      009933 04 03            [ 1] 1558 	add a,#CONST_REC_XTRA_BYTES
      009935 01 20            [ 1] 1559 	ld (RECLEN,sp),a    
      009937 08 A1            [ 2] 1560 	ldw (NAMEPTR,sp),x
      009939 24 26 06 A6      [ 2] 1561 	ldw y,#EEPROM_BASE 
      00993D 10 6B            [ 2] 1562 1$:	ldw x,(NAMEPTR,sp)
      00993F 02 5C            [ 2] 1563 	ldw (EEPTR,sp),y
      009941 F6 C3 00 24      [ 2] 1564 	cpw y, free_eeprom 
      009942 24 1A            [ 1] 1565 	jruge 7$ ; no match found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009942 A1 61            [ 1] 1566 	ld a,(y)
      009944 2B 02            [ 1] 1567 	cp a,(RECLEN,sp)
      009946 A0 20            [ 1] 1568 	jrne 2$ 
      009948 A1 30            [ 1] 1569 	incw y 
      00994A 2B 2B A0         [ 4] 1570 	call strcmp
      00994D 30 A1            [ 1] 1571 	jrne 8$ ; match found 
      001D6D                       1572 2$: ; skip this one 	
      00994F 0A 2B            [ 2] 1573 	ldW Y,(EEPTR,sp)
      009951 06 A0            [ 1] 1574 	ld a,(y)
      009953 07 11 02         [ 1] 1575 	ld acc8,a 
      009956 2A 1F 6B 03      [ 2] 1576 	addw y,acc16 
      00995A 7B 02            [ 2] 1577 	jra 1$  
      001D7A                       1578 7$: ; no match found 
      00995C CD 82            [ 1] 1579 	clr (EEPTR,sp)
      00995E AA 7B            [ 1] 1580 	clr (EEPTR+1,sp)
      001D7E                       1581 8$: ; match found 
      009960 03 CB            [ 2] 1582 	ldw x,(EEPTR,sp) ; record address 
      001D80                       1583 9$:	_DROP VSIZE
      009962 00 0F            [ 2]    1     addw sp,#VSIZE 
      009964 C7 00            [ 2] 1584 	 popw y 
      009966 0F               [ 4] 1585 	 ret 
                                   1586 
                                   1587 
                                   1588 ;--------------------------------------------
                                   1589 ; BASIC: CONST name=value [, name=value]*
                                   1590 ; define constant(s) saved in EEPROM
                                   1591 ;--------------------------------------------
                           000001  1592 	CNAME=1 
                           000003  1593 	BUFPTR=3
                           000005  1594 	RECLEN=5
                           000006  1595 	UPDATE=6
                           000007  1596 	YSAVE=7
                           000008  1597 	VSIZE=8 
      001D85                       1598 cmd_const:
      009967 4F C9            [ 2] 1599 	pushw y 
      001D87                       1600 	_vars VSIZE 
      009969 00 0E            [ 2]    1     sub sp,#VSIZE 
      00996B C7 00            [ 1] 1601 	clr (UPDATE,sp)
      00996D 0E 4F C9         [ 4] 1602 	call next_token 
      009970 00 0D            [ 1] 1603 	cp a,#TK_CHAR 
      009972 C7 00            [ 1] 1604 	jrne 0$
      009974 0D 20 C9         [ 4] 1605 	call get_char 
      009977 0D 01            [ 1] 1606 	and a,#0xDF 
      009979 27 03            [ 1] 1607 	cp a,#'U 
      00997B CD 82            [ 1] 1608 	jrne 1$
      00997D 8D 06            [ 1] 1609 	cpl (UPDATE,sp)
      00997E 20 07            [ 2] 1610 	jra const_loop 
      00997E 5B 03            [ 1] 1611 0$: cp a,#TK_LABEL 
      009980 85 81            [ 1] 1612 	jreq cloop_1
      009982 CC 16 A0         [ 2] 1613 1$: jp syntax_error
      001DA6                       1614 const_loop: 
      009982 52 05            [ 1] 1615 	ld a,#TK_LABEL 
      009984 17 04 4F         [ 4] 1616 	call expect  
      009986                       1617 cloop_1: 
      009986 1F 02            [ 2] 1618 	ldw (CNAME,sp),x ; *const_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009988 F6 A4 0F         [ 4] 1619 	call skip_string
      00998B 6B 01            [ 2] 1620 	ldw x,(CNAME,sp)
      00998D 16 04 5C         [ 4] 1621 	call strlen  
      009990 AB 05            [ 1] 1622 	add a,#CONST_REC_XTRA_BYTES 
      009990 90 F6            [ 1] 1623 	ld (RECLEN,sp),a 
                                   1624 ; copy name in buffer  
      009992 27 1B            [ 2] 1625 	ldw y,(CNAME,sp) 
      009994 0D 01 27         [ 2] 1626 	ldw x,#tib  
      009997 0A F1            [ 1] 1627 	ld a,(RECLEN,sp)
      009999 26               [ 1] 1628 	ld (x),a 
      00999A 07               [ 1] 1629 	incw x  
      00999B 90 5C 5C         [ 4] 1630 	call strcpy 
      00999E 0A 01            [ 2] 1631 	ldw (BUFPTR,sp),x 
                                   1632 ; x not updated by strcpy 
                                   1633 ; BUFPTR must be incremented 
                                   1634 ; to point after name 
      0099A0 20               [ 1] 1635 	clrw x 
      0099A1 EE 05            [ 1] 1636 	ld a,(RECLEN,sp)
      0099A2 A0 04            [ 1] 1637 	sub a,#CONST_REC_XTRA_BYTES-1
      0099A2 1E               [ 1] 1638 	ld xl,a  
      0099A3 02 1D 00         [ 2] 1639 	addw x,(BUFPTR,sp)
      0099A6 02 4B            [ 2] 1640 	ldw (BUFPTR,sp),x 
      0099A8 00 FE            [ 1] 1641 	ld a,#TK_EQUAL 
      0099AA 84 27 1F         [ 4] 1642 	call expect 
      0099AD 20 D7            [ 2] 1643 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099AF CD 1A 83         [ 4] 1644 	call expression 
      0099AF 1E 02            [ 1] 1645 	cp a,#TK_INTGR 
      0099B1 F6 6B            [ 1] 1646 	jreq 5$ 
      0099B3 01 A4 0F         [ 2] 1647 	jp syntax_error 
      001DE3                       1648 5$:	_xpop 
      0099B6 4C C7            [ 1]    1     ld a,(y)
      0099B8 00               [ 1]    2     ldw x,y 
      0099B9 0F 72            [ 2]    3     ldw x,(1,x)
      0099BB 5F 00 0E 72      [ 2]    4     addw y,#CELL_SIZE 
      0099BF BB 00            [ 2] 1649 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099C1 0E FE            [ 2] 1650 	ldw y,(BUFPTR,sp)
      0099C3 7B 01            [ 1] 1651 	ld (y),a 
      0099C5 4E A4 0C         [ 2] 1652 	ldw (1,y),x 
                                   1653 ; record completed in buffer 
                                   1654 ; check if constant already exist 
                                   1655 ; if exist and \U option then update  
      0099C8 44 44 AB 80      [ 1] 1656 	clr farptr 
      0099CC 1E 01            [ 2] 1657 	ldw x,(CNAME,sp)
      0099CC 5B 05 81         [ 4] 1658 	call search_const 
      0099CF 5D               [ 2] 1659 	tnzw x 
      0099CF 88 CD            [ 1] 1660 	jreq 6$ ; new constant  
      0099D1 98 21            [ 1] 1661 	tnz (UPDATE,sp)
      0099D3 11 01            [ 1] 1662 	jreq 8$ 
      0099D5 27 03            [ 2] 1663 	jra 7$	
      001E07                       1664 6$:	
      0099D7 CC 97 20         [ 2] 1665 	ldw x,free_eeprom  
      001E0A                       1666 7$:	
      0099DA 84 81 19         [ 2] 1667 	ldw farptr+1,x 
      0099DC AE 16 68         [ 2] 1668 	ldw x,#tib 
      0099DC A6 06            [ 1] 1669 	ld a,(RECLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099DE CD 99 CF         [ 4] 1670 	call write_nbytes
                                   1671 ; update free_eeprom 
      0099E1 5F               [ 1] 1672 	clrw x 
      0099E1 4B 00            [ 1] 1673 	ld a,(RECLEN,sp)
      0099E3 CD               [ 1] 1674 	ld xl,a 
      0099E4 9C 08 4D 27      [ 2] 1675 	addw x,free_eeprom 
      0099E8 09 0C 01         [ 2] 1676 	ldw free_eeprom,x
      001E20                       1677 8$: ; check for next constant 
      0099EB CD 98 21         [ 4] 1678 	call next_token 
      0099EE A1 08            [ 1] 1679 	cp a,#TK_COMMA 
      0099F0 27 F1            [ 1] 1680 	jrne 9$ ; no other constant 
      0099F2 84 81 A6         [ 2] 1681 	jp const_loop 
      0099F4                       1682 9$: 
      001E2A                       1683 	_unget_token    
      0099F4 CD 99 DC A1 01   [ 1]    1      mov in,in.saved  
      001E2F                       1684 10$: 
      001E2F                       1685 	_drop VSIZE 
      0099F9 27 03            [ 2]    1     addw sp,#VSIZE 
      0099FB CC 97            [ 2] 1686 	popw y ; restore xstack pointer 
      0099FD 20               [ 4] 1687 	ret 
                                   1688 
                                   1689 
                                   1690 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1691 ; return program size 
                                   1692 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E34                       1693 prog_size:
      0099FE 90 F6 93         [ 2] 1694 	ldw x,txtend 
      009A01 EE 01 72 A9      [ 2] 1695 	subw x,txtbgn 
      009A05 00               [ 4] 1696 	ret 
                                   1697 
                                   1698 ;----------------------------
                                   1699 ; print program information 
                                   1700 ;---------------------------
      001E3C                       1701 program_info: 
      009A06 03 C3 00         [ 2] 1702 	ldw x,#PROG_ADDR 
      009A09 21 23 05         [ 4] 1703 	call puts 
      009A0C A6 0A CC         [ 2] 1704 	ldw x,txtbgn 
      009A0F 97 22 5D 27      [ 1] 1705 	mov base,#16 
      009A13 F8 89 58         [ 4] 1706 	call prt_i16
      009A16 72 FB 01 1F      [ 1] 1707 	mov base,#10  
      009A1A 01 AE 16         [ 2] 1708 	ldw x,#PROG_SIZE
      009A1D 68 72 F0         [ 4] 1709 	call puts 
      009A20 01 5B 02         [ 4] 1710 	call prog_size 
      009A23 81 17 F6         [ 4] 1711 	call prt_i16 
      009A24 AE 1E 9E         [ 2] 1712 	ldw x,#STR_BYTES 
      009A24 52 01 0F         [ 4] 1713 	call puts
      009A27 01 CD 98         [ 2] 1714 	ldw x,txtbgn
      009A2A 21 4D 26         [ 2] 1715 	cpw x,#app 
      009A2D 03 CC            [ 1] 1716 	jrult 2$
      009A2F 9A BD A1         [ 2] 1717 	ldw x,#FLASH_MEM 
      009A32 10 27            [ 2] 1718 	jra 3$
      009A34 06 A1 11         [ 2] 1719 2$: ldw x,#RAM_MEM 	 
      009A37 26 05 03         [ 4] 1720 3$:	call puts 
      009A3A 01 0D            [ 1] 1721 	ld a,#CR 
      009A3B CD 09 44         [ 4] 1722 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A3B CD               [ 4] 1723 	ret 
                                   1724 
      009A3C 98 21 6F 67 72 61 6D  1725 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A3E 2C 20 70 72 6F 67 72  1726 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A3E 4D 26 03 CC 97 20 00  1727 STR_BYTES: .asciz " bytes" 
      009A44 20 69 6E 20 46 4C 41  1728 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A44 A1 81 26 06 CD 98 3A  1729 RAM_MEM:   .asciz " in RAM memory" 
             FD 20 5D 6D 6F 72 79
             00
                                   1730 
                                   1731 
                                   1732 ;----------------------------
                                   1733 ; BASIC: LIST [[start][,end]]
                                   1734 ; list program lines 
                                   1735 ; form start to end 
                                   1736 ; if empty argument list then 
                                   1737 ; list all.
                                   1738 ;----------------------------
                           000001  1739 	FIRST=1
                           000003  1740 	LAST=3 
                           000005  1741 	LN_PTR=5
                           000006  1742 	VSIZE=6 
      009A4E                       1743 list:
      009A4E A1 84 26 05 CD   [ 2] 1744 	btjf flags,#FRUN,0$
      009A53 98 60            [ 1] 1745 	ld a,#ERR_CMD_ONLY
      009A55 20 54 A2         [ 2] 1746 	jp tb_error
      009A57                       1747 0$:	 
      009A57 A1 05 26         [ 4] 1748 	call next_token 
      009A5A 05 CD            [ 1] 1749 	cp a,#TK_CHAR 
      009A5C 99 F4            [ 1] 1750 	jrne 2$
      009A5E 20 07 F0         [ 4] 1751 	call get_char 
      009A60 A4 DF            [ 1] 1752 	and a,#0xDF 
      009A60 A1 85            [ 1] 1753 	cp a,#'C 
      009A62 26 08            [ 1] 1754 	jrne 1$
      009A64 CD 98 56         [ 4] 1755 	call list_const
      009A67 81               [ 4] 1756 	ret 
      009A67 F6 EE 01         [ 2] 1757 1$: jp syntax_error 
      001EE6                       1758 2$:	_unget_token 
      009A6A 20 3F 02 00 01   [ 1]    1      mov in,in.saved  
      009A6C CD 1E 34         [ 4] 1759 	call prog_size 
      009A6C A1 03            [ 1] 1760 	jrugt 3$
      009A6E 26               [ 4] 1761 	ret 
      001EF1                       1762 3$: _vars VSIZE
      009A6F 10 89            [ 2]    1     sub sp,#VSIZE 
      009A71 CD 98 47         [ 2] 1763 	ldw x,txtbgn 
      009A74 85 CD            [ 2] 1764 	ldw (LN_PTR,sp),x 
      009A76 9D               [ 2] 1765 	ldw x,(x) 
      009A77 C1 5D            [ 2] 1766 	ldw (FIRST,sp),x ; list from first line 
      009A79 27 28 CD         [ 2] 1767 	ldw x,#MAX_LINENO ; biggest line number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009A7C 9D 1D            [ 2] 1768 	ldw (LAST,sp),x 
      009A7E 20 2B 61         [ 4] 1769 	call arg_list
      009A80 4D               [ 1] 1770 	tnz a
      009A80 A1 82            [ 1] 1771 	jreq list_loop 
      009A82 26 08            [ 1] 1772 	cp a,#2 
      009A84 CD 98            [ 1] 1773 	jreq 4$
      009A86 3A FD            [ 1] 1774 	cp a,#1 
      009A88 5F 02            [ 1] 1775 	jreq first_line 
      009A8A 20 1F A0         [ 2] 1776 	jp syntax_error 
      009A8C 85               [ 2] 1777 4$:	popw x 
      009A8C A1 06            [ 2] 1778 	ldw (LAST+2,sp),x 
      001F14                       1779 first_line:
      009A8E 26               [ 2] 1780 	popw x
      009A8F 13 CD            [ 2] 1781 	ldw (FIRST,sp),x 
      001F17                       1782 lines_skip:
      009A91 9B 03 A6         [ 2] 1783 	ldw x,txtbgn
      009A94 07 CD            [ 2] 1784 2$:	ldw (LN_PTR,sp),x 
      009A96 99 CF 90         [ 2] 1785 	cpw x,txtend 
      009A99 F6 93            [ 1] 1786 	jrpl list_exit 
      009A9B EE               [ 2] 1787 	ldw x,(x) ;line# 
      009A9C 01 72            [ 2] 1788 	cpw x,(FIRST,sp)
      009A9E A9 00            [ 1] 1789 	jrpl list_loop 
      009AA0 03 20            [ 2] 1790 	ldw x,(LN_PTR,sp) 
      009AA2 08 02            [ 1] 1791 	ld a,(2,x)
      009AA3 C7 00 0E         [ 1] 1792 	ld acc8,a 
      009AA3 55 00 03 00      [ 1] 1793 	clr acc16 
      009AA7 02 4F 20 12      [ 2] 1794 	addw x,acc16
      009AAB 20 E3            [ 2] 1795 	jra 2$ 
                                   1796 ; print loop
      001F37                       1797 list_loop:
      009AAB 0D 01            [ 2] 1798 	ldw x,(LN_PTR,sp)
      009AAD 27 03            [ 1] 1799 	ld a,(2,x) 
      009AAF CD 82 85         [ 4] 1800 	call prt_basic_line
      009AB2 1E 05            [ 2] 1801 	ldw x,(LN_PTR,sp)
      009AB2 72 A2            [ 1] 1802 	ld a,(2,x)
      009AB4 00 03 90         [ 1] 1803 	ld acc8,a 
      009AB7 F7 90 EF 01      [ 1] 1804 	clr acc16 
      009ABB A6 84 00 0D      [ 2] 1805 	addw x,acc16
      009ABD C3 00 1D         [ 2] 1806 	cpw x,txtend 
      009ABD 5B 01            [ 1] 1807 	jrpl list_exit
      009ABF 81 05            [ 2] 1808 	ldw (LN_PTR,sp),x
      009AC0 FE               [ 2] 1809 	ldw x,(x)
      009AC0 52 01            [ 2] 1810 	cpw x,(LAST,sp)  
      009AC2 CD 9A            [ 1] 1811 	jrslt list_loop
      001F59                       1812 list_exit:
      009AC4 24 4D 27 38 01   [ 1] 1813 	mov in,count 
      009AC8 AE 16 B8         [ 2] 1814 	ldw x,#pad 
      009AC8 CD 98 21         [ 2] 1815 	ldw basicptr,x 
      001F64                       1816 	_drop VSIZE 
      009ACB 6B 01            [ 2]    1     addw sp,#VSIZE 
      009ACD A4 30 A1         [ 4] 1817 	call program_info 
      009AD0 20               [ 4] 1818 	ret
                                   1819 
                                   1820 
                                   1821 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   1822 ; BASIC: EDIT 
                                   1823 ;  copy program in FLASH 
                                   1824 ;  to RAM for edition 
                                   1825 ;-------------------------
      001F6A                       1826 edit:
      009AD1 27 09 A6         [ 4] 1827 	call qsign 
      009AD4 84 55            [ 1] 1828 	jreq 1$ 
      009AD6 00 03 00         [ 2] 1829 	ldw x,#NOT_SAVED 
      009AD9 02 20 24         [ 4] 1830 	call puts 
      009ADC 81               [ 4] 1831 	ret 
      001F76                       1832 1$: 
      009ADC CD 9A 24 4D      [ 2] 1833 	ldw y,#app_sign ; source address 
      009AE0 26 03 CC         [ 2] 1834     ldw x,app_size  
      009AE3 97 20 04         [ 2] 1835 	addw x,#4 
      009AE5 CF 00 0D         [ 2] 1836 	ldw acc16,x  ; bytes to copy 
      009AE5 7B 01 A1         [ 2] 1837 	ldw x,#rsign ; destination address 
      009AE8 20 26 05         [ 4] 1838 	call move  
      009AEB CD 82 DD         [ 2] 1839 	ldw x,#free_ram 
      009AEE 20 D8 A1         [ 2] 1840 	ldw txtbgn,x 
      009AF1 21 26 05 CD      [ 2] 1841 	addw x,rsize  
      009AF5 83 A7 20         [ 2] 1842 	ldw txtend,x 
      009AF8 CF               [ 4] 1843 	ret 
                                   1844 
      009AF9 4E 6F 20 61 70 70 6C  1845 NOT_SAVED: .asciz "No application saved.\n"
             69 63 61 74 69 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1846 
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
      001FAE                       1857 prt_basic_line:
      009AF9 CD 84            [ 2] 1858 	pushw y 
      009AFB 55 20 CA         [ 1] 1859 	ld count,a 
      009AFE E6 02            [ 1] 1860 	ld a,(2,x)
      009AFE A6 84 03         [ 1] 1861 	cp a,count 
      009B00 2A 03            [ 1] 1862 	jrpl 1$ 
      009B00 5B 01 81         [ 1] 1863 	ld count,a 
      009B03 CF 00 04         [ 2] 1864 1$:	ldw basicptr,x 
      009B03 52 01 CD 9A      [ 2] 1865 	ldw y,#tib  
      009B07 C0 4D 27         [ 4] 1866 	call decompile 
      009B0A 2D 09 A1         [ 4] 1867 	call puts 
      009B0B A6 0D            [ 1] 1868 	ld a,#CR 
      009B0B CD 98 21         [ 4] 1869 	call putc 
      009B0E 6B 01            [ 2] 1870 	popw y 
      009B10 A4               [ 4] 1871 	ret 
                                   1872 
                                   1873 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   1874 ;---------------------------------
                                   1875 ; BASIC: PRINT|? arg_list 
                                   1876 ; print values from argument list
                                   1877 ;----------------------------------
                           000001  1878 	CCOMMA=1
                           000001  1879 	VSIZE=1
      001FD2                       1880 print:
      001FD2                       1881 	_vars VSIZE 
      009B11 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FD4                       1882 reset_comma:
      009B13 10 27            [ 1] 1883 	clr (CCOMMA,sp)
      001FD6                       1884 prt_loop:
      009B15 09 55 00         [ 4] 1885 	call next_token
      009B18 03 00            [ 1] 1886 	cp a,#CMD_END 
      009B1A 02 A6            [ 1] 1887 	jrult 0$
      009B1C 84 20            [ 1] 1888 	cp a,#TK_COLON 
      009B1E 19 04            [ 1] 1889 	jreq 0$
      009B1F A1 80            [ 1] 1890 	cp a,#TK_CMD
      009B1F CD 9A            [ 1] 1891 	jrne 10$
      001FE5                       1892 0$:
      001FE5                       1893 	_unget_token 
      009B21 C0 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009B26 97 20            [ 2] 1894 	jra 8$ 
      009B28                       1895 10$:	
      009B28 7B 01            [ 1] 1896 	cp a,#TK_QSTR
      009B2A A1 10            [ 1] 1897 	jreq 1$
      009B2C 26 05            [ 1] 1898 	cp a,#TK_CHAR 
      009B2E CD 81            [ 1] 1899 	jreq 2$ 
      009B30 EA 20            [ 1] 1900 	cp a,#TK_CFUNC 
      009B32 D8 1F            [ 1] 1901 	jreq 3$
      009B33 A1 08            [ 1] 1902 	cp a,#TK_COMMA 
      009B33 CD 82            [ 1] 1903 	jreq 4$
      009B35 07 20            [ 1] 1904 	cp a,#TK_SHARP 
      009B37 D3 24            [ 1] 1905 	jreq 5$
      009B38 20 37            [ 2] 1906 	jra 7$ 
      002002                       1907 1$:	; print string 
      009B38 5B 01 81         [ 4] 1908 	call puts
      009B3B 5C               [ 1] 1909 	incw x
      009B3B 52 01 CD 9B      [ 2] 1910 	subw x,basicptr 
      009B3F 03 4D 27         [ 2] 1911 	ldw in.w,x  
      009B42 54 CD            [ 2] 1912 	jra reset_comma
      00200F                       1913 2$:	; print character 
      009B44 98 21 6B         [ 4] 1914 	call get_char 
      009B47 01 A4 30         [ 4] 1915 	call putc 
      009B4A A1 30            [ 2] 1916 	jra reset_comma 
      002017                       1917 3$: ; print character function value  	
      009B4C 27 09 A6         [ 4] 1918 	call get_code_addr 
      009B4F 84               [ 4] 1919 	call (x)
      009B50 55 00 03         [ 4] 1920 	call putc
      009B53 00 02            [ 2] 1921 	jra reset_comma 
      002020                       1922 4$: ; set comma state 
      009B55 20 40            [ 1] 1923 	cpl (CCOMMA,sp)
      009B57 20 B2            [ 2] 1924 	jra prt_loop   
      002024                       1925 5$: ; # character must be followed by an integer   
      009B57 CD 9B 03         [ 4] 1926 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B5A 4D 26            [ 1] 1927 	cp a,#TK_INTGR 
      009B5C 03 CC            [ 1] 1928 	jreq 6$
      009B5E 97 20 A0         [ 2] 1929 	jp syntax_error 
      009B60                       1930 6$: ; set tab width
      009B60 CD 82 24         [ 4] 1931 	call get_int24 
      009B63 90               [ 1] 1932 	ld a,xl 
      009B64 F6 93            [ 1] 1933 	and a,#15 
      009B66 EE 01 72         [ 1] 1934 	ld tab_width,a 
      009B69 A9 00            [ 2] 1935 	jra reset_comma 
      002039                       1936 7$:	
      002039                       1937 	_unget_token 
      009B6B 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B70 0C 35 02         [ 4] 1938 	call condition
      009B73 00               [ 1] 1939 	tnz a 
      009B74 0F 20            [ 1] 1940 	jreq 8$    
      009B76 0A 18 1B         [ 4] 1941     call print_top
      009B77 20 8B            [ 2] 1942 	jra reset_comma 
      002049                       1943 8$:
      009B77 35 04            [ 1] 1944 	tnz (CCOMMA,sp)
      009B79 00 0F            [ 1] 1945 	jrne 9$
      009B7B 20 04            [ 1] 1946 	ld a,#CR 
      009B7D CD 09 44         [ 4] 1947     call putc 
      002052                       1948 9$:	_drop VSIZE 
      009B7D 35 01            [ 2]    1     addw sp,#VSIZE 
      009B7F 00               [ 4] 1949 	ret 
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
      002055                       1967 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002055                       1968 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002055                       1969 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002055                       1970 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002055                       1971 save_context:
      009B80 0F 00 04         [ 2] 1972 	ldw x,basicptr 
      009B81 1F 03            [ 2] 1973 	ldw (BPTR,sp),x
      009B81 5F C6 00         [ 1] 1974 	ld a,in 
      009B84 0F 14            [ 1] 1975 	ld (IN,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009B86 01 27 03         [ 1] 1976 	ld a,count 
      009B89 53 A6            [ 1] 1977 	ld (CNT,sp),a  
      009B8B FF               [ 4] 1978 	ret
                                   1979 
                                   1980 ;-----------------------
                                   1981 ; restore previously saved 
                                   1982 ; BASIC interpreter context 
                                   1983 ; from stack 
                                   1984 ;-------------------------
      002065                       1985 rest_context:
      009B8C 72 A2            [ 2] 1986 	ldw x,(BPTR,sp)
      009B8E 00 03 90         [ 2] 1987 	ldw basicptr,x 
      009B91 F7 90            [ 1] 1988 	ld a,(IN,sp)
      009B93 EF 01 A6         [ 1] 1989 	ld in,a
      009B96 84 06            [ 1] 1990 	ld a,(CNT,sp)
      009B97 C7 00 03         [ 1] 1991 	ld count,a  
      009B97 5B               [ 4] 1992 	ret
                                   1993 
                                   1994 
                                   1995 
                                   1996 ;------------------------------------------
                                   1997 ; BASIC: INPUT [string]var[,[string]var]
                                   1998 ; input value in variables 
                                   1999 ; [string] optionally can be used as prompt 
                                   2000 ;-----------------------------------------
                           000001  2001 	CX_BPTR=1
                           000003  2002 	CX_IN=3
                           000004  2003 	CX_CNT=4
                           000005  2004 	SKIP=5
                           000005  2005 	VSIZE=5
      002075                       2006 input_var:
      009B98 01 81            [ 2] 2007 	pushw y 
      009B9A                       2008 	_vars VSIZE 
      009B9A CD 98            [ 2]    1     sub sp,#VSIZE 
      002079                       2009 input_loop:
      009B9C 21 4D            [ 1] 2010 	clr (SKIP,sp)
      009B9E 27 15 A1         [ 4] 2011 	call next_token 
      009BA1 06 26            [ 1] 2012 	cp a,#TK_QSTR 
      009BA3 09 CD            [ 1] 2013 	jrne 1$ 
      009BA5 9C 08 A6         [ 4] 2014 	call puts 
      009BA8 07               [ 1] 2015 	incw x 
      009BA9 CD 99 CF 81      [ 2] 2016 	subw x,basicptr 
      009BAD 55 00 03         [ 2] 2017 	ldw in.w,x 
      009BB0 00 02            [ 1] 2018 	cpl (SKIP,sp)
      009BB2 CD 9B 3B         [ 4] 2019 	call next_token 
      009BB5 81 85            [ 1] 2020 1$: cp a,#TK_VAR  
      009BB6 27 03            [ 1] 2021 	jreq 2$ 
      009BB6 CD 9B 9A         [ 2] 2022 	jp syntax_error
      009BB9 4D 27 4B         [ 4] 2023 2$:	call get_addr
      009BBC CD 98 21         [ 2] 2024 	ldw ptr16,x 
      009BBF 4D 27            [ 1] 2025 	tnz (SKIP,sp)
      009BC1 43 A1            [ 1] 2026 	jrne 21$ 
      009BC3 87 27 07         [ 4] 2027 	call var_name 
      009BC6 55 00 03         [ 4] 2028 	call putc   
      0020A9                       2029 21$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009BC9 00 02            [ 1] 2030 	ld a,#':
      009BCB 20 38 CD         [ 4] 2031 	call putc 
      009BCE 9B 9A 4D         [ 4] 2032 	call save_context 
      009BD1 26 03 CC 97      [ 1] 2033 	clr count  
      009BD5 20 0A A6         [ 4] 2034 	call readln 
      009BD6 AE 16 68         [ 2] 2035 	ldw x,#tib 
      009BD6 90 F6 93         [ 1] 2036 	push count
      009BD9 EE 01            [ 1] 2037 	push #0 
      009BDB 72 A9 00         [ 2] 2038 	addw x,(1,sp)
      009BDE 03               [ 1] 2039 	incw x 
      0020C4                       2040 	_drop 2 
      009BDF C7 00            [ 2]    1     addw sp,#2 
      009BE1 0D CF 00 0E      [ 1] 2041 	clr in 
      009BE5 90 F6 93         [ 4] 2042 	call get_token
      009BE8 EE 01            [ 1] 2043 	cp a,#TK_INTGR
      009BEA 72 A9            [ 1] 2044 	jreq 3$ 
      009BEC 00 03            [ 1] 2045 	cp a,#TK_MINUS
      009BEE C4 00 0D         [ 4] 2046 	call get_token 
      009BF1 02 C4            [ 1] 2047 	cp a,#TK_INTGR 
      009BF3 00 0E            [ 1] 2048 	jreq 22$
      009BF5 02 C4 00         [ 4] 2049 	call rest_context 
      009BF8 0F 02 72         [ 2] 2050 	jp syntax_error
      0020E0                       2051 22$:
      009BFB A2 00 03         [ 4] 2052 	call neg_acc24	
      0020E3                       2053 3$: 
      009BFE 90 F7 90         [ 1] 2054 	ld a,acc24 
      009C01 EF 01 20         [ 2] 2055 	ldw x,acc16 
      009C04 B7 A6 84 81      [ 4] 2056 	ld [ptr16],a
      009C08 72 5C 00 1A      [ 1] 2057 	inc ptr8  
      009C08 52 02 CD 9B      [ 5] 2058 	ldw [ptr16],x 
      009C0C B6 4D 27         [ 4] 2059 	call rest_context
      009C0F 69 CD 98         [ 4] 2060 	call next_token 
      009C12 21 A1            [ 1] 2061 	cp a,#TK_COMMA
      009C14 88 27            [ 1] 2062 	jrne 4$ 
      009C16 0B A1 89         [ 2] 2063 	jp input_loop
      002102                       2064 4$:
      009C19 27 07            [ 1] 2065 	cp a,#TK_NONE 
      009C1B 55 00            [ 1] 2066 	jreq input_exit  
      009C1D 03 00            [ 1] 2067 	cp a,#TK_COLON 
      009C1F 02 20            [ 1] 2068     jreq input_exit 
      009C21 55 6B 02         [ 2] 2069 	jp syntax_error 
      00210D                       2070 input_exit:
      00210D                       2071 	_drop VSIZE 
      009C24 CD 9B            [ 2]    1     addw sp,#VSIZE 
      009C26 B6 A1            [ 2] 2072 	popw y 
      009C28 84               [ 4] 2073 	ret 
                                   2074 
                                   2075 
                                   2076 ;---------------------
                                   2077 ; BASIC: REM | ' 
                                   2078 ; skip comment to end of line 
                                   2079 ;---------------------- 
      002112                       2080 remark::
      009C29 27 03 CC 97 20   [ 1] 2081 	mov in,count 
      009C2E 81               [ 4] 2082  	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



                                   2083 
                                   2084 
                                   2085 ;---------------------
                                   2086 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2087 ; read in loop 'addr'  
                                   2088 ; apply & 'mask' to value 
                                   2089 ; loop while result==0.  
                                   2090 ; 'xor_mask' is used to 
                                   2091 ; invert the wait logic.
                                   2092 ; i.e. loop while not 0.
                                   2093 ;---------------------
                           000001  2094 	XMASK=1 
                           000002  2095 	MASK=2
                           000003  2096 	ADDR=3
                           000004  2097 	VSIZE=4
      002118                       2098 wait: 
      002118                       2099 	_vars VSIZE
      009C2E 90 F6            [ 2]    1     sub sp,#VSIZE 
      009C30 93 EE            [ 1] 2100 	clr (XMASK,sp) 
      009C32 01 72 A9         [ 4] 2101 	call arg_list 
      009C35 00 03            [ 1] 2102 	cp a,#2
      009C37 C7 00            [ 1] 2103 	jruge 0$
      009C39 0D CF 00         [ 2] 2104 	jp syntax_error 
      009C3C 0E 90            [ 1] 2105 0$:	cp a,#3
      009C3E F6 93            [ 1] 2106 	jrult 1$
      00212A                       2107 	_xpop  ; xor mask 
      009C40 EE 01            [ 1]    1     ld a,(y)
      009C42 72               [ 1]    2     ldw x,y 
      009C43 A9 00            [ 2]    3     ldw x,(1,x)
      009C45 03 6B 01 7B      [ 2]    4     addw y,#CELL_SIZE 
      009C49 02               [ 1] 2108 	ld a,xl 
      009C4A A1 89            [ 1] 2109 	ld (XMASK,sp),a 
      002136                       2110 1$: _xpop ; mask
      009C4C 27 10            [ 1]    1     ld a,(y)
      009C4E 93               [ 1]    2     ldw x,y 
      009C4E 7B 01            [ 2]    3     ldw x,(1,x)
      009C50 CA 00 0D 02      [ 2]    4     addw y,#CELL_SIZE 
      009C54 CA               [ 1] 2111     ld a,xl  
      009C55 00 0E            [ 1] 2112 	ld (MASK,sp),a 
      002142                       2113 	_xpop ; address 
      009C57 02 CA            [ 1]    1     ld a,(y)
      009C59 00               [ 1]    2     ldw x,y 
      009C5A 0F 02            [ 2]    3     ldw x,(1,x)
      009C5C 20 0E 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C5E F6               [ 1] 2114 2$:	ld a,(x)
      009C5E 7B 01            [ 1] 2115 	and a,(MASK,sp)
      009C60 C8 00            [ 1] 2116 	xor a,(XMASK,sp)
      009C62 0D 02            [ 1] 2117 	jreq 2$ 
      002152                       2118 	_drop VSIZE 
      009C64 C8 00            [ 2]    1     addw sp,#VSIZE 
      009C66 0E               [ 4] 2119 	ret 
                                   2120 
                                   2121 ;---------------------
                                   2122 ; BASIC: BSET addr,mask
                                   2123 ; set bits at 'addr' corresponding 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2124 ; to those of 'mask' that are at 1.
                                   2125 ; arguments:
                                   2126 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2127 ;   mask        mask|addr
                                   2128 ; output:
                                   2129 ;	none 
                                   2130 ;--------------------------
      002155                       2131 bit_set:
      009C67 02 C8 00         [ 4] 2132 	call arg_list 
      009C6A 0F 02            [ 1] 2133 	cp a,#2	 
      009C6C 72 A2            [ 1] 2134 	jreq 1$ 
      009C6E 00 03 90         [ 2] 2135 	jp syntax_error
      00215F                       2136 1$: 
      00215F                       2137 	_xpop ; mask 
      009C71 F7 90            [ 1]    1     ld a,(y)
      009C73 EF               [ 1]    2     ldw x,y 
      009C74 01 20            [ 2]    3     ldw x,(1,x)
      009C76 99 A6 84 5B      [ 2]    4     addw y,#CELL_SIZE 
      009C7A 02               [ 1] 2138 	ld a,xl
      009C7B 81               [ 1] 2139 	push a  
      009C7C                       2140 	_xpop ; addr  
      009C7C 35 10            [ 1]    1     ld a,(y)
      009C7E 00               [ 1]    2     ldw x,y 
      009C7F 0B 81            [ 2]    3     ldw x,(1,x)
      009C81 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C81 35               [ 1] 2141 	pop a 
      009C82 0A               [ 1] 2142 	or a,(x)
      009C83 00               [ 1] 2143 	ld (x),a
      009C84 0B               [ 4] 2144 	ret 
                                   2145 
                                   2146 ;---------------------
                                   2147 ; BASIC: BRES addr,mask
                                   2148 ; reset bits at 'addr' corresponding 
                                   2149 ; to those of 'mask' that are at 1.
                                   2150 ; arguments:
                                   2151 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2152 ;   mask	    ~mask&*addr  
                                   2153 ; output:
                                   2154 ;	none 
                                   2155 ;--------------------------
      002177                       2156 bit_reset:
      009C85 81 19 61         [ 4] 2157 	call arg_list 
      009C86 A1 02            [ 1] 2158 	cp a,#2  
      009C86 90 89            [ 1] 2159 	jreq 1$ 
      009C88 4F AE 16         [ 2] 2160 	jp syntax_error
      002181                       2161 1$: 
      002181                       2162 	_xpop ; mask 
      009C8B 68 90            [ 1]    1     ld a,(y)
      009C8D CE               [ 1]    2     ldw x,y 
      009C8E 00 1C            [ 2]    3     ldw x,(1,x)
      009C90 90 A3 B6 80      [ 2]    4     addw y,#CELL_SIZE 
      009C94 25               [ 1] 2163 	ld a,xl 
      009C95 05               [ 1] 2164 	cpl a
      009C96 1D               [ 1] 2165 	push a  
      00218D                       2166 	_xpop ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009C97 00 80            [ 1]    1     ld a,(y)
      009C99 20               [ 1]    2     ldw x,y 
      009C9A 04 01            [ 2]    3     ldw x,(1,x)
      009C9B 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C9B 72               [ 1] 2167 	pop a 
      009C9C B0               [ 1] 2168 	and a,(x)
      009C9D 00               [ 1] 2169 	ld (x),a 
      009C9E 1E               [ 4] 2170 	ret 
                                   2171 
                                   2172 ;---------------------
                                   2173 ; BASIC: BTOGL addr,mask
                                   2174 ; toggle bits at 'addr' corresponding 
                                   2175 ; to those of 'mask' that are at 1.
                                   2176 ; arguments:
                                   2177 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2178 ;   mask	    mask^*addr  
                                   2179 ; output:
                                   2180 ;	none 
                                   2181 ;--------------------------
      00219A                       2182 bit_toggle:
      009C9F 90 85 81         [ 4] 2183 	call arg_list 
      009CA2 A1 02            [ 1] 2184 	cp a,#2 
      009CA2 3B 00            [ 1] 2185 	jreq 1$ 
      009CA4 0B AE 9E         [ 2] 2186 	jp syntax_error
      0021A4                       2187 1$: _xpop ; mask 
      009CA7 FB CD            [ 1]    1     ld a,(y)
      009CA9 8A               [ 1]    2     ldw x,y 
      009CAA 21 CE            [ 2]    3     ldw x,(1,x)
      009CAC 00 1C 35 10      [ 2]    4     addw y,#CELL_SIZE 
      009CB0 00               [ 1] 2188 	ld a,xl
      009CB1 0B               [ 1] 2189 	push a 
      0021AF                       2190 	_xpop  ; addr  
      009CB2 CD 98            [ 1]    1     ld a,(y)
      009CB4 76               [ 1]    2     ldw x,y 
      009CB5 32 00            [ 2]    3     ldw x,(1,x)
      009CB7 0B AE 9F 0D      [ 2]    4     addw y,#CELL_SIZE 
      009CBB CD               [ 1] 2191 	pop a 
      009CBC 8A               [ 1] 2192 	xor a,(x)
      009CBD 21               [ 1] 2193 	ld (x),a 
      009CBE CE               [ 4] 2194 	ret 
                                   2195 
                                   2196 
                                   2197 ;---------------------
                                   2198 ; BASIC: BTEST(addr,bit)
                                   2199 ; return bit value at 'addr' 
                                   2200 ; bit is in range {0..7}.
                                   2201 ; arguments:
                                   2202 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2203 ;   bit 	    bit position {0..7}  
                                   2204 ; output:
                                   2205 ;	A:X       bit value  
                                   2206 ;--------------------------
      0021BC                       2207 bit_test:
      009CBF 00 1E 72         [ 4] 2208 	call func_args 
      009CC2 B0 00            [ 1] 2209 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CC4 1C CD            [ 1] 2210 	jreq 0$
      009CC6 98 76 AE         [ 2] 2211 	jp syntax_error
      0021C6                       2212 0$:	
      0021C6                       2213 	_xpop 
      009CC9 9F 1E            [ 1]    1     ld a,(y)
      009CCB CD               [ 1]    2     ldw x,y 
      009CCC 8A 21            [ 2]    3     ldw x,(1,x)
      009CCE 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CCF 9F               [ 1] 2214 	ld a,xl 
      009CCF CD 9C            [ 1] 2215 	and a,#7
      009CD1 86               [ 1] 2216 	push a   
      009CD2 A6 03            [ 1] 2217 	ld a,#1 
      009CD4 42 CF            [ 1] 2218 1$: tnz (1,sp)
      009CD6 00 21            [ 1] 2219 	jreq 2$
      009CD8 4F               [ 1] 2220 	sll a 
      009CD9 81 01            [ 1] 2221 	dec (1,sp)
      009CDA 20 F7            [ 2] 2222 	jra 1$
      009CDA CD 98            [ 1] 2223 2$: ld (1,sp),a  
      0021E0                       2224 	_xpop ; address  
      009CDC 21 A1            [ 1]    1     ld a,(y)
      009CDE 85               [ 1]    2     ldw x,y 
      009CDF 27 0C            [ 2]    3     ldw x,(1,x)
      009CE1 A1 05 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009CE5 CC               [ 1] 2225 	pop a 
      009CE6 97               [ 1] 2226 	and a,(x)
      009CE7 20 02            [ 1] 2227 	jreq 3$
      009CE8 A6 01            [ 1] 2228 	ld a,#1 
      009CE8 CD               [ 1] 2229 3$:	clrw x 
      009CE9 99               [ 1] 2230 	ld xl,a
      009CEA F4               [ 1] 2231 	clr a  
      009CEB 20               [ 4] 2232 	ret
                                   2233 
                                   2234 ;--------------------
                                   2235 ; BASIC: POKE addr,byte
                                   2236 ; put a byte at addr 
                                   2237 ;--------------------
      0021F3                       2238 poke:
      009CEC 03 19 61         [ 4] 2239 	call arg_list 
      009CED A1 02            [ 1] 2240 	cp a,#2
      009CED CD 98            [ 1] 2241 	jreq 1$
      009CEF 56 16 A0         [ 2] 2242 	jp syntax_error
      009CF0                       2243 1$:	
      0021FD                       2244 	_xpop ; byte   
      009CF0 CF 00            [ 1]    1     ld a,(y)
      009CF2 1A               [ 1]    2     ldw x,y 
      009CF3 CD 98            [ 2]    3     ldw x,(1,x)
      009CF5 21 A1 32 27      [ 2]    4     addw y,#CELL_SIZE 
      009CF9 03               [ 1] 2245     ld a,xl 
      009CFA CC               [ 1] 2246 	push a 
      002208                       2247 	_xpop ; address 
      009CFB 97 20            [ 1]    1     ld a,(y)
      009CFD 93               [ 1]    2     ldw x,y 
      009CFD CD 9C            [ 2]    3     ldw x,(1,x)
      009CFF 08 A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      009D03 03               [ 1] 2248 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009D04 CC               [ 1] 2249 	ld (x),a 
      009D05 97               [ 4] 2250 	ret 
                                   2251 
                                   2252 ;-----------------------
                                   2253 ; BASIC: PEEK(addr)
                                   2254 ; get the byte at addr 
                                   2255 ; input:
                                   2256 ;	none 
                                   2257 ; output:
                                   2258 ;	X 		value 
                                   2259 ;-----------------------
      002214                       2260 peek:
      009D06 20 19 5C         [ 4] 2261 	call func_args
      009D07 A1 01            [ 1] 2262 	cp a,#1 
      009D07 90 F6            [ 1] 2263 	jreq 1$
      009D09 93 EE 01         [ 2] 2264 	jp syntax_error
      00221E                       2265 1$: _xpop ; address  
      009D0C 72 A9            [ 1]    1     ld a,(y)
      009D0E 00               [ 1]    2     ldw x,y 
      009D0F 03 01            [ 2]    3     ldw x,(1,x)
      009D10 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D10 72 C7 00         [ 1] 2266 	ld farptr,a 
      009D13 1A 72 5C         [ 2] 2267 	ldw ptr16,x 
      009D16 00 1B 72 CF      [ 5] 2268 	ldf a,[farptr]
      009D1A 00               [ 1] 2269 	clrw x 
      009D1B 1A               [ 1] 2270 	ld xl,a 
      009D1C 81               [ 1] 2271 	clr a 
      009D1D 81               [ 4] 2272 	ret 
                                   2273 
                                   2274 ;---------------------------
                                   2275 ; BASIC IF expr : instructions
                                   2276 ; evaluate expr and if true 
                                   2277 ; execute instructions on same line. 
                                   2278 ;----------------------------
      002235                       2279 if: 
      009D1D F6 A0 03         [ 4] 2280 	call condition  
      002238                       2281 	_xpop 
      009D20 88 4B            [ 1]    1     ld a,(y)
      009D22 00               [ 1]    2     ldw x,y 
      009D23 72 FB            [ 2]    3     ldw x,(1,x)
      009D25 01 F6 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      009D29 5B               [ 1] 2282 	tnz  a  
      009D2A 02 81            [ 1] 2283 	jrne 9$ 
                                   2284 ;skip to next line
      009D2C 55 00 03 00 01   [ 1] 2285 	mov in,count
      002249                       2286 	_drop 2 
      009D2C 90 89            [ 2]    1     addw sp,#2 
      009D2E 52 04 5F         [ 2] 2287 	jp next_line
      009D31 1F               [ 4] 2288 9$:	ret 
                                   2289 
                                   2290 ;------------------------
                                   2291 ; BASIC: FOR var=expr 
                                   2292 ; set variable to expression 
                                   2293 ; leave variable address 
                                   2294 ; on stack and set
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2295 ; FLOOP bit in 'flags'
                                   2296 ;-----------------
                           000001  2297 	RETL1=1 ; return address  
                           000003  2298 	FSTEP=3  ; variable increment int24
                           000006  2299 	LIMIT=6 ; loop limit, int24  
                           000009  2300 	CVAR=9   ; control variable 
                           00000B  2301 	INW=11   ;  in.w saved
                           00000D  2302 	BPTR=13 ; baseptr saved
                           00000D  2303 	VSIZE=13  
      00224F                       2304 for: ; { -- var_addr }
      009D32 01               [ 2] 2305 	popw x ; call return address 
      002250                       2306 	_vars VSIZE 
      009D33 90 AE            [ 2]    1     sub sp,#VSIZE 
      009D35 40               [ 2] 2307 	pushw x  ; RETL1 
      009D36 00 90            [ 1] 2308 	ld a,#TK_VAR 
      009D38 C3 00 25         [ 4] 2309 	call expect
      009D3B 24 35 17         [ 4] 2310 	call get_addr
      009D3E 03 93            [ 2] 2311 	ldw (CVAR,sp),x  ; control variable 
      009D40 5C CD 8A         [ 4] 2312 	call let_eval 
      009D43 21 A6 3D CD      [ 1] 2313 	bset flags,#FLOOP 
      009D47 89 C4 1E         [ 4] 2314 	call next_token 
      009D4A 03 CD            [ 1] 2315 	cp a,#TK_CMD 
      009D4C 9D 1D            [ 1] 2316 	jreq 1$
      009D4E C7 00 0D         [ 2] 2317 	jp syntax_error
      00226E                       2318 1$:  
      009D51 CF 00 0E         [ 4] 2319 	call get_code_addr
      009D54 CD 98 8D         [ 2] 2320 	cpw x,#to   
      009D57 A6 0D            [ 1] 2321 	jreq to
      009D59 CD 89 C4         [ 2] 2322 	jp syntax_error 
                                   2323 
                                   2324 ;-----------------------------------
                                   2325 ; BASIC: TO expr 
                                   2326 ; second part of FOR loop initilization
                                   2327 ; leave limit on stack and set 
                                   2328 ; FTO bit in 'flags'
                                   2329 ;-----------------------------------
      002279                       2330 to: ; { var_addr -- var_addr limit step }
      009D5C 1E 01 5C 1F 01   [ 2] 2331 	btjt flags,#FLOOP,1$
      009D61 72 5F 00         [ 2] 2332 	jp syntax_error
      009D64 0E 16 03         [ 4] 2333 1$: call expression   
      009D67 90 F6            [ 1] 2334 	cp a,#TK_INTGR 
      009D69 C7 00            [ 1] 2335 	jreq 2$ 
      009D6B 0F 72 B9         [ 2] 2336 	jp syntax_error
      00228B                       2337 2$: _xpop
      009D6E 00 0E            [ 1]    1     ld a,(y)
      009D70 20               [ 1]    2     ldw x,y 
      009D71 C5 01            [ 2]    3     ldw x,(1,x)
      009D72 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D72 1E 01            [ 1] 2338 	ld (LIMIT,sp),a 
      009D74 CD 98            [ 2] 2339 	ldw (LIMIT+1,sp),x
      009D76 76 AE 9D         [ 4] 2340 	call next_token
      009D79 82 CD            [ 1] 2341 	cp a,#TK_NONE  
      009D7B 8A 21            [ 1] 2342 	jreq 4$ 
      009D7D 5B 04            [ 1] 2343 	cp a,#TK_CMD
      009D7F 90 85            [ 1] 2344 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009D81 81 20 63         [ 4] 2345 	call get_code_addr
      009D84 6F 6E 73         [ 2] 2346 	cpw x,#step 
      009D87 74 61            [ 1] 2347 	jreq step
      0022AB                       2348 3$:	
      0022AB                       2349 	_unget_token   	 
      009D89 6E 74 73 20 69   [ 1]    1      mov in,in.saved  
      0022B0                       2350 4$:	
      009D8E 6E 20            [ 1] 2351 	clr (FSTEP,sp) 
      009D90 45 45 50         [ 2] 2352 	ldw x,#1   ; default step  
      009D93 52 4F            [ 2] 2353 	ldw (FSTEP+1,sp),x 
      009D95 4D 0A            [ 2] 2354 	jra store_loop_addr 
                                   2355 
                                   2356 
                                   2357 ;----------------------------------
                                   2358 ; BASIC: STEP expr 
                                   2359 ; optional third par of FOR loop
                                   2360 ; initialization. 	
                                   2361 ;------------------------------------
      0022B9                       2362 step: ; {var limit -- var limit step}
      009D97 00 04 00 22 03   [ 2] 2363 	btjt flags,#FLOOP,1$
      009D98 CC 16 A0         [ 2] 2364 	jp syntax_error
      009D98 AE 40 00         [ 4] 2365 1$: call expression 
      009D9B 35 08            [ 1] 2366 	cp a,#TK_INTGR
      009D9D 00 0F            [ 1] 2367 	jreq 2$
      009D9F A3 47 F8         [ 2] 2368 	jp syntax_error
      0022CB                       2369 2$:	
      0022CB                       2370 	_xpop 
      009DA2 24 17            [ 1]    1     ld a,(y)
      009DA4 F6               [ 1]    2     ldw x,y 
      009DA5 26 0C            [ 2]    3     ldw x,(1,x)
      009DA7 5C 72 5A 00      [ 2]    4     addw y,#CELL_SIZE 
      009DAB 0F 26            [ 1] 2371 	ld (FSTEP,sp),a 
      009DAD F6 1D            [ 2] 2372 	ldw (FSTEP+1,sp),x ; step
                                   2373 ; if step < 0 decrement LIMIT 
      009DAF 00               [ 1] 2374 	tnz a
      009DB0 08 20            [ 1] 2375 	jrpl store_loop_addr 
      009DB2 09 F6            [ 1] 2376 	ld a,(LIMIT,sp)
      009DB4 5C 4D            [ 2] 2377 	ldw x,(LIMIT+1,sp)
      009DB6 26 FB 5A         [ 2] 2378 	subw x,#1 
      009DB9 20 E0            [ 1] 2379 	sbc a,#0 
      009DBB 5F 4F            [ 1] 2380 	ld (LIMIT,sp),a 
      009DBD CF 00            [ 2] 2381 	ldw (LIMIT+1,sp),x 
                                   2382 ; leave loop back entry point on cstack 
                                   2383 ; cstack is 1 call deep from interpreter
      0022E8                       2384 store_loop_addr:
      009DBF 25 81 04         [ 2] 2385 	ldw x,basicptr
      009DC1 1F 0D            [ 2] 2386 	ldw (BPTR,sp),x 
      009DC1 90 89 52         [ 2] 2387 	ldw x,in.w 
      009DC4 05 72            [ 2] 2388 	ldw (INW,sp),x   
      009DC6 5F 00 0E CD      [ 1] 2389 	bres flags,#FLOOP 
      009DCA 94 64 AB 05      [ 1] 2390 	inc loop_depth  
      009DCE 6B               [ 4] 2391 	ret 
                                   2392 
                                   2393 ;--------------------------------
                                   2394 ; BASIC: NEXT var 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2395 ; FOR loop control 
                                   2396 ; increment variable with step 
                                   2397 ; and compare with limit 
                                   2398 ; loop if threshold not crossed.
                                   2399 ; else stack. 
                                   2400 ; and decrement 'loop_depth' 
                                   2401 ;--------------------------------
      0022FB                       2402 next: ; {var limit step retl1 -- [var limit step ] }
      009DCF 05 1F 01 90      [ 1] 2403 	tnz loop_depth 
      009DD3 AE 40            [ 1] 2404 	jrne 1$ 
      009DD5 00 1E 01         [ 2] 2405 	jp syntax_error 
      002304                       2406 1$: 
      009DD8 17 03            [ 1] 2407 	ld a,#TK_VAR 
      009DDA 90 C3 00         [ 4] 2408 	call expect
      009DDD 25 24 1A         [ 4] 2409 	call get_addr 
                                   2410 ; check for good variable after NEXT 	 
      009DE0 90 F6            [ 2] 2411 	cpw x,(CVAR,sp)
      009DE2 11 05            [ 1] 2412 	jreq 2$  
      009DE4 26 07 90         [ 2] 2413 	jp syntax_error ; not the good one 
      002313                       2414 2$: 
      009DE7 5C CD 94         [ 2] 2415 	ldw ptr16,x 
                                   2416 	; increment variable 
      009DEA 6F               [ 1] 2417 	ld a,(x)
      009DEB 26 11            [ 2] 2418 	ldw x,(1,x)  ; get var value 
      009DED 72 FB 04         [ 2] 2419 	addw x,(FSTEP+1,sp) ; var+step 
      009DED 16 03            [ 1] 2420 	adc a,(FSTEP,sp)
      009DEF 90 F6 C7 00      [ 4] 2421 	ld [ptr16],a
      009DF3 0F 72 B9 00      [ 1] 2422 	inc ptr8  
      009DF7 0E 20 DC 19      [ 5] 2423 	ldw [ptr16],x 
      009DFA C7 00 0C         [ 1] 2424 	ld acc24,a 
      009DFA 0F 03 0F         [ 2] 2425 	ldw acc16,x 
      009DFD 04 06            [ 1] 2426 	ld a,(LIMIT,sp)
      009DFE 1E 07            [ 2] 2427 	ldw x,(LIMIT+1,sp)
      009DFE 1E 03 5B 05      [ 2] 2428 	subw x,acc16 
      009E02 90 85 81         [ 1] 2429 	sbc a,acc24
      009E05 18 03            [ 1] 2430 	xor a,(FSTEP,sp)
      009E05 90 89            [ 1] 2431 	xor a,#0x80
      009E07 52 08            [ 1] 2432 	jrmi loop_back  
      009E09 0F 06            [ 2] 2433 	jra loop_done   
                                   2434 ; check sign of STEP  
      009E0B CD 98            [ 1] 2435 	ld a,(FSTEP,sp)
      009E0D 21 A1            [ 1] 2436 	jrpl 4$
                                   2437 ;negative step
      009E0F 04 26 0D         [ 1] 2438     ld a,acc8 
      009E12 CD 98            [ 1] 2439 	jrslt loop_back   
      009E14 70 A4            [ 2] 2440 	jra loop_done  
      00234E                       2441 4$: ; positive step
      009E16 DF A1 55 26 08   [ 2] 2442 	btjt acc8,#7,loop_done 
      002353                       2443 loop_back:
      009E1B 03 06            [ 2] 2444 	ldw x,(BPTR,sp)
      009E1D 20 07 A1         [ 2] 2445 	ldw basicptr,x 
      009E20 03 27 08 CC 97   [ 2] 2446 	btjf flags,#FRUN,1$ 
      009E25 20 02            [ 1] 2447 	ld a,(2,x)
      009E26 C7 00 03         [ 1] 2448 	ld count,a
      009E26 A6 03            [ 2] 2449 1$:	ldw x,(INW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009E28 CD 99 CF         [ 2] 2450 	ldw in.w,x 
      009E2B 81               [ 4] 2451 	ret 
      002368                       2452 loop_done:
                                   2453 	; remove loop data from stack  
      009E2B 1F               [ 2] 2454 	popw x
      002369                       2455 	_drop VSIZE 
      009E2C 01 CD            [ 2]    1     addw sp,#VSIZE 
      009E2E 98 47 1E 01      [ 1] 2456 	dec loop_depth 
      009E32 CD               [ 2] 2457 	jp (x)
                                   2458 
                                   2459 ;----------------------------
                                   2460 ; called by goto/gosub
                                   2461 ; to get target line number 
                                   2462 ; output:
                                   2463 ;    x    line address 
                                   2464 ;---------------------------
      002370                       2465 get_target_line:
      009E33 94 64 AB         [ 4] 2466 	call next_token  
      009E36 05 6B            [ 1] 2467 	cp a,#TK_INTGR
      009E38 05 16            [ 1] 2468 	jreq get_target_line_addr 
      009E3A 01 AE            [ 1] 2469 	cp a,#TK_LABEL 
      009E3C 16 68            [ 1] 2470 	jreq look_target_symbol 
      009E3E 7B 05 F7         [ 2] 2471 	jp syntax_error
                                   2472 ; the target is a line number 
                                   2473 ; search it. 
      00237E                       2474 get_target_line_addr:
      009E41 5C CD            [ 2] 2475 	pushw y 
      009E43 94 80 1F         [ 4] 2476 	call get_int24 ; line # 
      009E46 03               [ 1] 2477 	clr a
      009E47 5F 7B 05 A0      [ 2] 2478 	ldw y,basicptr 
      009E4B 04 97            [ 2] 2479 	ldw y,(y)
      009E4D 72 FB            [ 2] 2480 	pushw y 
      009E4F 03 1F            [ 2] 2481 	cpw x,(1,sp)
      00238E                       2482 	_drop 2  
      009E51 03 A6            [ 2]    1     addw sp,#2 
      009E53 32 CD            [ 1] 2483 	jrult 11$
      009E55 99               [ 1] 2484 	inc a 
      002393                       2485 11$: ; scan program for this line# 	
      009E56 CF 16 07         [ 4] 2486 	call search_lineno  
      009E59 CD               [ 2] 2487 	tnzw x ; 0| line# address 
      009E5A 9B 03            [ 1] 2488 	jrne 2$ 
      009E5C A1 84            [ 1] 2489 	ld a,#ERR_NO_LINE 
      009E5E 27 03 CC         [ 2] 2490 	jp tb_error 
      009E61 97 20            [ 2] 2491 2$:	popw y  
      009E63 90               [ 4] 2492 	ret 
                                   2493 
                                   2494 ; the GOTO|GOSUB target is a symbol.
      0023A1                       2495 look_target_symbol:
      009E64 F6 93            [ 2] 2496 	pushw y 
      009E66 EE               [ 2] 2497 	pushw x 
      009E67 01 72 A9 00      [ 1] 2498 	clr acc16 
      009E6B 03 17 07 16      [ 2] 2499 	ldw y,txtbgn 
      009E6F 03 90 F7         [ 1] 2500 1$:	ld a,(3,y) ; first TK_ID on line 
      009E72 90 EF            [ 1] 2501 	cp a,#TK_LABEL 
      009E74 01 72            [ 1] 2502 	jreq 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009E76 5F 00 19         [ 1] 2503 2$:	ld a,(2,y); line length 
      009E79 1E 01 CD         [ 1] 2504 	ld acc8,a 
      009E7C 9D C1 5D 27      [ 2] 2505 	addw y,acc16 ;point to next line 
      009E80 06 0D 06 27      [ 2] 2506 	cpw y,txtend 
      009E84 1B 20            [ 1] 2507 	jrult 1$
      009E86 03 0A            [ 1] 2508 	ld a,#ERR_BAD_VALUE
      009E87 CC 16 A2         [ 2] 2509 	jp tb_error 
      0023C8                       2510 3$: ; found a TK_LABEL 
                                   2511 	; compare with GOTO|GOSUB target 
      009E87 CE 00            [ 2] 2512 	pushw y ; line address 
      009E89 25 A9 00 04      [ 2] 2513 	addw y,#4 ; label string 
      009E8A 1E 03            [ 2] 2514 	ldw x,(3,sp) ; target string 
      009E8A CF 00 1A         [ 4] 2515 	call strcmp
      009E8D AE 16            [ 1] 2516 	jrne 4$
      009E8F 68 7B            [ 2] 2517 	popw y 
      009E91 05 CD            [ 2] 2518 	jra 2$ 
      0023D9                       2519 4$: ; target found 
      009E93 89               [ 2] 2520 	popw x ;  address line target  
      0023DA                       2521 	_drop 2 ; target string 
      009E94 05 5F            [ 2]    1     addw sp,#2 
      009E96 7B 05            [ 2] 2522 	popw y 
      009E98 97               [ 4] 2523 	ret
                                   2524 
                                   2525 
                                   2526 ;--------------------------------
                                   2527 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2528 ; selective goto or gosub 
                                   2529 ;--------------------------------
      0023DF                       2530 cmd_on:
      009E99 72 BB 00 25 CF   [ 2] 2531 	btjt flags,#FRUN,0$ 
      009E9E 00 25            [ 1] 2532 	ld a,#ERR_RUN_ONLY
      009EA0 CC 16 A2         [ 2] 2533 	jp tb_error 
      009EA0 CD 98 21         [ 4] 2534 0$:	call expression 
      009EA3 A1 08            [ 1] 2535 	cp a,#TK_INTGR
      009EA5 26 03            [ 1] 2536 	jreq 1$
      009EA7 CC 9E 26         [ 2] 2537 	jp syntax_error
      009EAA                       2538 1$: _xpop
      009EAA 55 00            [ 1]    1     ld a,(y)
      009EAC 03               [ 1]    2     ldw x,y 
      009EAD 00 02            [ 2]    3     ldw x,(1,x)
      009EAF 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
                                   2539 ; the selector is the element indice 
                                   2540 ; in the list of arguments. {1..#elements} 
      009EAF 5B               [ 1] 2541 	ld a,xl ; keep only bits 7..0
      009EB0 08 90            [ 1] 2542 	jreq 9$ ; element # begin at 1. 
      009EB2 85               [ 1] 2543 	push a  ; selector  
      009EB3 81 17 A1         [ 4] 2544 	call next_token
      009EB4 A1 80            [ 1] 2545 	cp a,#TK_CMD 
      009EB4 CE 00            [ 1] 2546 	jreq 2$ 
      009EB6 1E 72 B0         [ 2] 2547 	jp syntax_error 
      009EB9 00 1C 81         [ 4] 2548 2$: call get_code_addr
                                   2549 ;; must be a GOTO or GOSUB 
      009EBC A3 24 6B         [ 2] 2550 	cpw x,#goto 
      009EBC AE 9E            [ 1] 2551 	jreq 4$
      009EBE FB CD 8A         [ 2] 2552 	cpw x,#gosub 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009EC1 21 CE            [ 1] 2553 	jreq 4$ 
      009EC3 00 1C 35         [ 2] 2554 	jp syntax_error 
      00241A                       2555 4$: 
      009EC6 10               [ 1] 2556 	pop a 
      009EC7 00               [ 2] 2557 	pushw x ; save routine address 	
      009EC8 0B               [ 1] 2558 	push a  ; selector  
      00241D                       2559 5$: ; skip elements in list until selector==0 
      009EC9 CD 98            [ 1] 2560 	dec (1,sp)
      009ECB 76 35            [ 1] 2561 	jreq 6$ 
                                   2562 ; can be a line# or a label 
      009ECD 0A 00 0B         [ 4] 2563 	call next_token 
      009ED0 AE 9F            [ 1] 2564 	cp a,#TK_INTGR 
      009ED2 0D CD            [ 1] 2565 	jreq 52$
      009ED4 8A 21            [ 1] 2566 	cp a,#TK_LABEL 
      009ED6 CD 9E            [ 1] 2567 	jreq 54$
      009ED8 B4 CD 98         [ 2] 2568 	jp syntax_error 
      00242F                       2569 52$: ; got a line number 
      009EDB 76 AE 9F         [ 1] 2570 	ld a,in ; skip over int24 value 
      009EDE 1E CD            [ 1] 2571 	add a,#CELL_SIZE ; integer size  
      009EE0 8A 21 CE         [ 1] 2572 	ld in,a 
      009EE3 00 1C            [ 2] 2573 	jra 56$
      009EE5 A3 B6 84         [ 4] 2574 54$: call skip_string ; skip over label 	
      00243C                       2575 56$: ; if another element comma present 
      009EE8 25 05 AE         [ 4] 2576 	call next_token
      009EEB 9F 25            [ 1] 2577 	cp a,#TK_COMMA 
      009EED 20 03            [ 1] 2578 	jreq 5$ 
                                   2579 ; arg list exhausted, selector to big 
                                   2580 ; continue execution on next line 
      002443                       2581 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EEF AE 9F            [ 2]    1     addw sp,#3 
      009EF1 36 CD            [ 2] 2582 	jra 9$
      002447                       2583 6$: ;at selected position  
      002447                       2584 	_drop 1 ; discard selector
      009EF3 8A 21            [ 2]    1     addw sp,#1 
                                   2585 ; here only the routine address 
                                   2586 ; of GOTO|GOSUB is on stack 
      009EF5 A6 0D CD         [ 4] 2587     call get_target_line
      009EF8 89 C4 81         [ 2] 2588 	ldw ptr16,x 	
      009EFB 70 72 6F 67 72   [ 1] 2589 	mov in,count ; move to end of line  
      009F00 61               [ 2] 2590 	popw x ; cmd address, GOTO||GOSUB 
      009F01 6D 20 61         [ 2] 2591 	cpw x,#goto 
      009F04 64 64            [ 1] 2592 	jrne 7$ 
      009F06 72 65 73         [ 2] 2593 	ldw x,ptr16 
      009F09 73 3A            [ 2] 2594 	jra jp_to_target
      00245F                       2595 7$: 
      009F0B 20 00            [ 2] 2596 	jra gosub_2 ; target in ptr16 
      002461                       2597 9$: ; expr out of range skip to end of line
                                   2598     ; this will force a fall to next line  
      009F0D 2C 20 70 72 6F   [ 1] 2599 	mov in,count
      002466                       2600 	_drop 2
      009F12 67 72            [ 2]    1     addw sp,#2 
      009F14 61 6D 20         [ 2] 2601 	jp next_line  
                                   2602 
                                   2603 
                                   2604 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   2605 ; BASIC: GOTO line# 
                                   2606 ; jump to line# 
                                   2607 ; here cstack is 2 call deep from interpreter 
                                   2608 ;------------------------
      00246B                       2609 goto:
      009F17 73 69 7A 65 3A   [ 2] 2610 	btjt flags,#FRUN,goto_1  
      009F1C 20 00            [ 1] 2611 	ld a,#ERR_RUN_ONLY
      009F1E 20 62 79         [ 2] 2612 	jp tb_error 
      002475                       2613 goto_1:
      009F21 74 65 73         [ 4] 2614 	call get_target_line
      002478                       2615 jp_to_target:
      009F24 00 20 69         [ 2] 2616 	ldw basicptr,x 
      009F27 6E 20            [ 1] 2617 	ld a,(2,x)
      009F29 46 4C 41         [ 1] 2618 	ld count,a 
      009F2C 53 48 20 6D      [ 1] 2619 	mov in,#3 
      009F30 65               [ 4] 2620 	ret 
                                   2621 
                                   2622 
                                   2623 ;--------------------
                                   2624 ; BASIC: GOSUB line#
                                   2625 ; basic subroutine call
                                   2626 ; actual line# and basicptr 
                                   2627 ; are saved on cstack
                                   2628 ; here cstack is 2 call deep from interpreter 
                                   2629 ;--------------------
                           000001  2630 	TARGET=1   ; target address 
                           000003  2631 	RET_ADDR=3 ; subroutine return address 
                           000005  2632 	RET_BPTR=5 ; basicptr return point 
                           000007  2633 	RET_INW=7  ; in.w return point 
                           000004  2634 	VSIZE=4  
      002485                       2635 gosub:
      009F31 6D 6F 72 79 00   [ 2] 2636 	btjt flags,#FRUN,gosub_1 
      009F36 20 69            [ 1] 2637 	ld a,#ERR_RUN_ONLY
      009F38 6E 20 52         [ 2] 2638 	jp tb_error 
      009F3B 41               [ 4] 2639 	ret 
      002490                       2640 gosub_1:
      009F3C 4D 20 6D         [ 4] 2641 	call get_target_line 
      009F3F 65 6D 6F         [ 2] 2642 	ldw ptr16,x 
      002496                       2643 gosub_2: 
      009F42 72               [ 2] 2644 	popw x 
      002497                       2645 	_vars VSIZE  
      009F43 79 00            [ 2]    1     sub sp,#VSIZE 
      009F45 89               [ 2] 2646 	pushw x ; RET_ADDR 
      009F45 72 01 00         [ 2] 2647 	ldw x,ptr16 
      009F48 23               [ 2] 2648 	pushw x ; TARGET
                                   2649 ; save BASIC subroutine return point.   
      009F49 05 A6 07         [ 2] 2650 	ldw x,basicptr
      009F4C CC 97            [ 2] 2651 	ldw (RET_BPTR,sp),x 
      009F4E 22 00 00         [ 2] 2652 	ldw x,in.w 
      009F4F 1F 07            [ 2] 2653 	ldw (RET_INW,sp),x
      009F4F CD               [ 2] 2654 	popw x 
      009F50 98 21            [ 2] 2655 	jra jp_to_target
                                   2656 
                                   2657 ;------------------------
                                   2658 ; BASIC: RETURN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2659 ; exit from BASIC subroutine 
                                   2660 ;------------------------
                           000003  2661 	RET_BPTR=3 ; basicptr return point 
                           000005  2662 	RET_INW=5  ; in.w return point 
                           000004  2663 	VSIZE=4  
      0024AB                       2664 return:
      009F52 A1 04 26 10 CD   [ 2] 2665 	btjt flags,#FRUN,0$ 
      009F57 98 70            [ 1] 2666 	ld a,#ERR_RUN_ONLY
      009F59 A4 DF A1         [ 2] 2667 	jp tb_error 
      0024B5                       2668 0$:	
      009F5C 43 26            [ 2] 2669 	ldw x,(RET_ADDR,sp) 
      009F5E 04 CD 9D         [ 2] 2670 	ldw basicptr,x
      009F61 2C 81            [ 1] 2671 	ld a,(2,x)
      009F63 CC 97 20         [ 1] 2672 	ld count,a  
      009F66 55 00            [ 2] 2673 	ldw x,(RET_INW,sp)
      009F68 03 00 02         [ 2] 2674 	ldw in.w,x 
      009F6B CD               [ 2] 2675 	popw x 
      0024C5                       2676 	_drop VSIZE 
      009F6C 9E B4            [ 2]    1     addw sp,#VSIZE 
      009F6E 22               [ 2] 2677 	pushw x
      009F6F 01               [ 4] 2678 	ret  
                                   2679 
                                   2680 ;----------------------------------
                                   2681 ; BASIC: RUN
                                   2682 ; run BASIC program in RAM
                                   2683 ;----------------------------------- 
      0024C9                       2684 run: 
      009F70 81 52 06 CE 00   [ 2] 2685 	btjf flags,#FRUN,0$  
      009F75 1C               [ 1] 2686 	clr a 
      009F76 1F               [ 4] 2687 	ret
      0024D0                       2688 0$: 
      009F77 05 FE 1F 01 AE   [ 2] 2689 	btjf flags,#FBREAK,1$
      0024D5                       2690 	_drop 2 
      009F7C 7F FF            [ 2]    1     addw sp,#2 
      009F7E 1F 03 CD         [ 4] 2691 	call rest_context
      0024DA                       2692 	_drop CTXT_SIZE 
      009F81 99 E1            [ 2]    1     addw sp,#CTXT_SIZE 
      009F83 4D 27 31 A1      [ 1] 2693 	bres flags,#FBREAK 
      009F87 02 27 07 A1      [ 1] 2694 	bset flags,#FRUN 
      009F8B 01 27 06         [ 2] 2695 	jp interpreter 
      009F8E CC 97 20         [ 2] 2696 1$:	ldw x,txtbgn
      009F91 85 1F 05         [ 2] 2697 	cpw x,txtend 
      009F94 2B 0C            [ 1] 2698 	jrmi run_it 
      009F94 85 1F 01         [ 2] 2699 	ldw x,#err_no_prog
      009F97 CD 09 A1         [ 4] 2700 	call puts 
      009F97 CE 00 1C 1F 05   [ 1] 2701 	mov in,count
      009F9C C3               [ 4] 2702 	ret 
      0024FB                       2703 run_it:	 
      0024FB                       2704 	_drop 2 ; drop return address 
      009F9D 00 1E            [ 2]    1     addw sp,#2 
      0024FD                       2705 run_it_02: 
      009F9F 2A 38 FE         [ 4] 2706     call ubound 
      009FA2 13 01 2A         [ 4] 2707 	call clear_vars 
                                   2708 ; clear data pointer 
      009FA5 11               [ 1] 2709 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009FA6 1E 05 E6         [ 2] 2710 	ldw data_ptr,x 
      009FA9 02 C7 00 0F      [ 1] 2711 	clr data_ofs 
      009FAD 72 5F 00 0E      [ 1] 2712 	clr data_len 
                                   2713 ; initialize BASIC pointer 
      009FB1 72 BB 00         [ 2] 2714 	ldw x,txtbgn 
      009FB4 0E 20 E3         [ 2] 2715 	ldw basicptr,x 
      009FB7 E6 02            [ 1] 2716 	ld a,(2,x)
      009FB7 1E 05 E6         [ 1] 2717 	ld count,a
      009FBA 02 CD A0 2E      [ 1] 2718 	mov in,#3	
      009FBE 1E 05 E6 02      [ 1] 2719 	bset flags,#FRUN 
      009FC2 C7 00 0F         [ 2] 2720 	jp interpreter 
                                   2721 
                                   2722 
                                   2723 ;----------------------
                                   2724 ; BASIC: END
                                   2725 ; end running program
                                   2726 ;---------------------- 
      002525                       2727 cmd_end: 
                                   2728 ; clean stack 
      009FC5 72 5F 00         [ 2] 2729 	ldw x,#STACK_EMPTY
      009FC8 0E               [ 1] 2730 	ldw sp,x 
      009FC9 72 BB 00         [ 2] 2731 	jp warm_start
                                   2732 
                                   2733 ;---------------------------
                                   2734 ; BASIC: GET var 
                                   2735 ; receive a key in variable 
                                   2736 ; don't wait 
                                   2737 ;---------------------------
      00252C                       2738 cmd_get:
      009FCC 0E C3 00         [ 4] 2739 	call next_token 
      009FCF 1E 2A            [ 1] 2740 	cp a,#TK_VAR 
      009FD1 07 1F            [ 1] 2741 	jreq 0$
      009FD3 05 FE 13         [ 2] 2742 	jp syntax_error 
      009FD6 03 2F DE         [ 4] 2743 0$: call get_addr 
      009FD9 CF 00 19         [ 2] 2744 	ldw ptr16,x 
      009FD9 55 00 04         [ 4] 2745 	call qgetc 
      009FDC 00 02            [ 1] 2746 	jreq 2$
      009FDE AE 16 B8         [ 4] 2747 	call getc  
      009FE1 CF 00 05 5B      [ 4] 2748 2$: clr [ptr16]
      009FE5 06 CD 9E BC      [ 1] 2749 	inc ptr8 
      009FE9 81 3F 00 19      [ 4] 2750 	clr [ptr16]
      009FEA 72 5C 00 1A      [ 1] 2751 	inc ptr8 
      009FEA CD A8 0E 27      [ 4] 2752 	ld [ptr16],a 
      009FEE 07               [ 4] 2753 	ret 
                                   2754 
                                   2755 
                                   2756 ;-----------------
                                   2757 ; 1 Khz beep 
                                   2758 ;-----------------
      002559                       2759 beep_1khz:: 
      009FEF AE A0 17         [ 2] 2760 	ldw x,#100
      009FF2 CD 8A 21 81      [ 2] 2761 	ldw y,#1000
      009FF6 20 20            [ 2] 2762 	jra beep
                                   2763 
                                   2764 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   2765 ; BASIC: TONE expr1,expr2
                                   2766 ; used TIMER2 channel 1
                                   2767 ; to produce a tone 
                                   2768 ; arguments:
                                   2769 ;    expr1   frequency 
                                   2770 ;    expr2   duration msec.
                                   2771 ;---------------------------
      002562                       2772 tone:
      009FF6 90 AE B6         [ 4] 2773 	call arg_list 
      009FF9 80 CE            [ 1] 2774 	cp a,#2 
      009FFB B6 82            [ 1] 2775 	jreq 1$
      009FFD 1C 00 04         [ 2] 2776 	jp syntax_error 
      00256C                       2777 1$: 
      00256C                       2778 	_xpop 
      00A000 CF 00            [ 1]    1     ld a,(y)
      00A002 0E               [ 1]    2     ldw x,y 
      00A003 AE 00            [ 2]    3     ldw x,(1,x)
      00A005 7C CD 94 90      [ 2]    4     addw y,#CELL_SIZE 
      00A009 AE               [ 2] 2779 	pushw x ; duration 
      002576                       2780 	_xpop ; frequency
      00A00A 00 80            [ 1]    1     ld a,(y)
      00A00C CF               [ 1]    2     ldw x,y 
      00A00D 00 1C            [ 2]    3     ldw x,(1,x)
      00A00F 72 BB 00 7E      [ 2]    4     addw y,#CELL_SIZE 
      00A013 CF 00            [ 1] 2781 	ldw y,x ; frequency 
      00A015 1E               [ 2] 2782 	popw x  ; duration 
      002582                       2783 beep:  
      00A016 81               [ 2] 2784 	pushw x 
      00A017 4E 6F 20         [ 2] 2785 	ldw x,#TIM2_CLK_FREQ
      00A01A 61               [ 2] 2786 	divw x,y ; cntr=Fclk/freq 
                                   2787 ; round to nearest integer 
      00A01B 70 70 6C 69      [ 2] 2788 	cpw y,#TIM2_CLK_FREQ/2
      00A01F 63 61            [ 1] 2789 	jrmi 2$
      00A021 74               [ 1] 2790 	incw x 
      00258E                       2791 2$:	 
      00A022 69               [ 1] 2792 	ld a,xh 
      00A023 6F 6E 20         [ 1] 2793 	ld TIM2_ARRH,a 
      00A026 73               [ 1] 2794 	ld a,xl 
      00A027 61 76 65         [ 1] 2795 	ld TIM2_ARRL,a 
                                   2796 ; 50% duty cycle 
      00A02A 64               [ 1] 2797 	ccf 
      00A02B 2E               [ 2] 2798 	rrcw x 
      00A02C 0A               [ 1] 2799 	ld a,xh 
      00A02D 00 53 0F         [ 1] 2800 	ld TIM2_CCR1H,a 
      00A02E 9F               [ 1] 2801 	ld a,xl
      00A02E 90 89 C7         [ 1] 2802 	ld TIM2_CCR1L,a
      00A031 00 04 E6 02      [ 1] 2803 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A035 C1 00 04 2A      [ 1] 2804 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A039 03 C7 00 04      [ 1] 2805 	bset TIM2_EGR,#TIM2_EGR_UG
      00A03D CF               [ 2] 2806 	popw x 
      00A03E 00 05 90         [ 4] 2807 	call pause02
      00A041 AE 16 68 CD      [ 1] 2808 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A045 92 88 CD 8A      [ 1] 2809 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A049 21               [ 4] 2810 	ret 
                                   2811 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   2812 ;-------------------------------
                                   2813 ; BASIC: ADCON 0|1 [,divisor]  
                                   2814 ; disable/enanble ADC 
                                   2815 ;-------------------------------
                           000003  2816 	ONOFF=3 
                           000001  2817 	DIVSOR=1
                           000004  2818 	VSIZE=4 
      0025B9                       2819 power_adc:
      00A04A A6 0D CD         [ 4] 2820 	call arg_list 
      00A04D 89 C4            [ 1] 2821 	cp a,#2	
      00A04F 90 85            [ 1] 2822 	jreq 1$
      00A051 81 01            [ 1] 2823 	cp a,#1 
      00A052 27 03            [ 1] 2824 	jreq 0$ 
      00A052 52 01 A0         [ 2] 2825 	jp syntax_error 
      00A054 4F               [ 1] 2826 0$:	clr a 
      00A054 0F               [ 1] 2827 	clrw x
      0025C9                       2828 	_xpush   ; divisor  
      00A055 01 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A056 90 F7            [ 1]    2     ld (y),a 
      00A056 CD 98 21         [ 2]    3     ldw (1,y),x 
      0025D2                       2829 1$: _at_next 
      00A059 A1 02 25         [ 1]    1     ld a,(3,y)
      00A05C 08               [ 1]    2     ldw x,y 
      00A05D A1 0A            [ 2]    3     ldw x,(4,x)
      00A05F 27               [ 2] 2830 	tnzw x 
      00A060 04 A1            [ 1] 2831 	jreq 2$ 
      0025DB                       2832 	_xpop
      00A062 80 26            [ 1]    1     ld a,(y)
      00A064 07               [ 1]    2     ldw x,y 
      00A065 EE 01            [ 2]    3     ldw x,(1,x)
      00A065 55 00 03 00      [ 2]    4     addw y,#CELL_SIZE 
      0025E4                       2833 	_xdrop  
      00A069 02 20 5D 03      [ 2]    1     addw y,#CELL_SIZE 
      00A06C 9F               [ 1] 2834 	ld a,xl
      00A06C A1 02            [ 1] 2835 	and a,#7
      00A06E 27               [ 1] 2836 	swap a 
      00A06F 12 A1 04         [ 1] 2837 	ld ADC_CR1,a
      00A072 27 1B A1 82      [ 1] 2838 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A076 27 1F A1 08      [ 1] 2839 	bset ADC_CR1,#ADC_CR1_ADON 
      0025F7                       2840 	_usec_dly 7 
      00A07A 27 24 A1         [ 2]    1     ldw x,#(16*7-2)/4
      00A07D 09               [ 2]    2     decw x
      00A07E 27               [ 1]    3     nop 
      00A07F 24 20            [ 1]    4     jrne .-4
      00A081 37 08            [ 2] 2841 	jra 3$
      00A082 72 11 54 01      [ 1] 2842 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A082 CD 8A 21 5C      [ 1] 2843 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      002608                       2844 3$:	
      00A086 72               [ 4] 2845 	ret
                                   2846 
                                   2847 ;-----------------------------
                                   2848 ; BASIC: ADCREAD (channel)
                                   2849 ; read adc channel {0..5}
                                   2850 ; output:
                                   2851 ;   A 		TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2852 ;   X 		value 
                                   2853 ;-----------------------------
      002609                       2854 analog_read:
      00A087 B0 00 05         [ 4] 2855 	call func_args 
      00A08A CF 00            [ 1] 2856 	cp a,#1 
      00A08C 01 20            [ 1] 2857 	jreq 1$
      00A08E C5 16 A0         [ 2] 2858 	jp syntax_error
      00A08F                       2859 1$: _xpop 
      00A08F CD 98            [ 1]    1     ld a,(y)
      00A091 70               [ 1]    2     ldw x,y 
      00A092 CD 89            [ 2]    3     ldw x,(1,x)
      00A094 C4 20 BD 03      [ 2]    4     addw y,#CELL_SIZE 
      00A097 A3 00 05         [ 2] 2860 	cpw x,#5 
      00A097 CD 98            [ 2] 2861 	jrule 2$
      00A099 3A FD            [ 1] 2862 	ld a,#ERR_BAD_VALUE
      00A09B CD 89 C4         [ 2] 2863 	jp tb_error 
      00A09E 20               [ 1] 2864 2$: ld a,xl
      00A09F B4 00 0E         [ 1] 2865 	ld acc8,a 
      00A0A0 A6 05            [ 1] 2866 	ld a,#5
      00A0A0 03 01 20         [ 1] 2867 	sub a,acc8 
      00A0A3 B2 54 00         [ 1] 2868 	ld ADC_CSR,a
      00A0A4 72 16 54 02      [ 1] 2869 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0A4 CD 98 21 A1      [ 1] 2870 	bset ADC_CR1,#ADC_CR1_ADON
      00A0A8 84 27 03 CC 97   [ 2] 2871 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0AD 20 54 04         [ 2] 2872 	ldw x,ADC_DRH
      00A0AE A6 84            [ 1] 2873 	ld a,#TK_INTGR
      00A0AE CD               [ 4] 2874 	ret 
                                   2875 
                                   2876 ;-----------------------
                                   2877 ; BASIC: DREAD(pin)
                                   2878 ; Arduino pins 
                                   2879 ; read state of a digital pin 
                                   2880 ; pin# {0..15}
                                   2881 ; output:
                                   2882 ;    A 		TK_INTGR
                                   2883 ;    X      0|1 
                                   2884 ;-------------------------
                           000001  2885 	PINNO=1
                           000001  2886 	VSIZE=1
      002645                       2887 digital_read:
      002645                       2888 	_vars VSIZE 
      00A0AF 98 60            [ 2]    1     sub sp,#VSIZE 
      00A0B1 9F A4 0F         [ 4] 2889 	call func_args
      00A0B4 C7 00            [ 1] 2890 	cp a,#1
      00A0B6 24 20            [ 1] 2891 	jreq 1$
      00A0B8 9B 16 A0         [ 2] 2892 	jp syntax_error
      00A0B9                       2893 1$: _xpop 
      00A0B9 55 00            [ 1]    1     ld a,(y)
      00A0BB 03               [ 1]    2     ldw x,y 
      00A0BC 00 02            [ 2]    3     ldw x,(1,x)
      00A0BE CD 9C 08 4D      [ 2]    4     addw y,#CELL_SIZE 
      00A0C2 27 05 CD         [ 2] 2894 	cpw x,#15 
      00A0C5 98 9B            [ 2] 2895 	jrule 2$
      00A0C7 20 8B            [ 1] 2896 	ld a,#ERR_BAD_VALUE
      00A0C9 CC 16 A2         [ 2] 2897 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A0C9 0D 01 26         [ 4] 2898 2$:	call select_pin 
      00A0CC 05 A6            [ 1] 2899 	ld (PINNO,sp),a
      00A0CE 0D CD            [ 1] 2900 	ld a,(GPIO_IDR,x)
      00A0D0 89 C4            [ 1] 2901 	tnz (PINNO,sp)
      00A0D2 5B 01            [ 1] 2902 	jreq 8$
      00A0D4 81               [ 1] 2903 3$: srl a 
      00A0D5 0A 01            [ 1] 2904 	dec (PINNO,sp)
      00A0D5 CE 00            [ 1] 2905 	jrne 3$ 
      00A0D7 05 1F            [ 1] 2906 8$: and a,#1 
      00A0D9 03               [ 1] 2907 	clrw x 
      00A0DA C6               [ 1] 2908 	ld xl,a 
      00A0DB 00               [ 1] 2909 	clr a 
      002679                       2910 	_drop VSIZE
      00A0DC 02 6B            [ 2]    1     addw sp,#VSIZE 
      00A0DE 05               [ 4] 2911 	ret
                                   2912 
                                   2913 
                                   2914 ;-----------------------
                                   2915 ; BASIC: DWRITE pin,0|1
                                   2916 ; Arduino pins 
                                   2917 ; write to a digital pin 
                                   2918 ; pin# {0..15}
                                   2919 ; output:
                                   2920 ;    A 		TK_INTGR
                                   2921 ;    X      0|1 
                                   2922 ;-------------------------
                           000001  2923 	PINNO=1
                           000002  2924 	PINVAL=2
                           000002  2925 	VSIZE=2
      00267C                       2926 digital_write:
      00267C                       2927 	_vars VSIZE 
      00A0DF C6 00            [ 2]    1     sub sp,#VSIZE 
      00A0E1 04 6B 06         [ 4] 2928 	call arg_list  
      00A0E4 81 02            [ 1] 2929 	cp a,#2 
      00A0E5 27 03            [ 1] 2930 	jreq 1$
      00A0E5 1E 03 CF         [ 2] 2931 	jp syntax_error
      002688                       2932 1$: _xpop 
      00A0E8 00 05            [ 1]    1     ld a,(y)
      00A0EA 7B               [ 1]    2     ldw x,y 
      00A0EB 05 C7            [ 2]    3     ldw x,(1,x)
      00A0ED 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
      00A0F1 C7               [ 1] 2933 	ld a,xl 
      00A0F2 00 04            [ 1] 2934 	ld (PINVAL,sp),a
      002694                       2935 	_xpop 
      00A0F4 81 F6            [ 1]    1     ld a,(y)
      00A0F5 93               [ 1]    2     ldw x,y 
      00A0F5 90 89            [ 2]    3     ldw x,(1,x)
      00A0F7 52 05 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0F9 A3 00 0F         [ 2] 2936 	cpw x,#15 
      00A0F9 0F 05            [ 2] 2937 	jrule 2$
      00A0FB CD 98            [ 1] 2938 	ld a,#ERR_BAD_VALUE
      00A0FD 21 A1 02         [ 2] 2939 	jp tb_error 
      00A100 26 10 CD         [ 4] 2940 2$:	call select_pin 
      00A103 8A 21            [ 1] 2941 	ld (PINNO,sp),a 
      00A105 5C 72            [ 1] 2942 	ld a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A107 B0 00            [ 1] 2943 	tnz (PINNO,sp)
      00A109 05 CF            [ 1] 2944 	jreq 4$
      00A10B 00               [ 1] 2945 3$: sll a
      00A10C 01 03            [ 1] 2946 	dec (PINNO,sp)
      00A10E 05 CD            [ 1] 2947 	jrne 3$
      00A110 98 21            [ 1] 2948 4$: tnz (PINVAL,sp)
      00A112 A1 85            [ 1] 2949 	jrne 5$
      00A114 27               [ 1] 2950 	cpl a 
      00A115 03 CC            [ 1] 2951 	and a,(GPIO_ODR,x)
      00A117 97 20            [ 2] 2952 	jra 8$
      00A119 CD 98            [ 1] 2953 5$: or a,(GPIO_ODR,x)
      00A11B 56 CF            [ 1] 2954 8$: ld (GPIO_ODR,x),a 
      0026C4                       2955 	_drop VSIZE 
      00A11D 00 1A            [ 2]    1     addw sp,#VSIZE 
      00A11F 0D               [ 4] 2956 	ret
                                   2957 
                                   2958 
                                   2959 ;-----------------------
                                   2960 ; BASIC: STOP
                                   2961 ; stop progam execution  
                                   2962 ; without resetting pointers 
                                   2963 ; the program is resumed
                                   2964 ; with RUN 
                                   2965 ;-------------------------
      0026C7                       2966 stop:
      00A120 05 26 06 CD 92   [ 2] 2967 	btjt flags,#FRUN,2$
      00A125 5D               [ 1] 2968 	clr a
      00A126 CD               [ 4] 2969 	ret 
      0026CE                       2970 2$:	 
                                   2971 ; create space on cstack to save context 
      00A127 89 C4 F5         [ 2] 2972 	ldw x,#break_point 
      00A129 CD 09 A1         [ 4] 2973 	call puts 
      0026D4                       2974 	_drop 2 ;drop return address 
      00A129 A6 3A            [ 2]    1     addw sp,#2 
      0026D6                       2975 	_vars CTXT_SIZE ; context size 
      00A12B CD 89            [ 2]    1     sub sp,#CTXT_SIZE 
      00A12D C4 CD A0         [ 4] 2976 	call save_context 
      00A130 D5 72 5F         [ 2] 2977 	ldw x,#tib 
      00A133 00 04 CD         [ 2] 2978 	ldw basicptr,x
      00A136 8B               [ 1] 2979 	clr (x)
      00A137 26 AE 16 68      [ 1] 2980 	clr count  
      00A13B 3B               [ 1] 2981 	clrw x 
      00A13C 00 04 4B         [ 2] 2982 	ldw in.w,x
      00A13F 00 72 FB 01      [ 1] 2983 	bres flags,#FRUN 
      00A143 5C 5B 02 72      [ 1] 2984 	bset flags,#FBREAK
      00A147 5F 00 02         [ 2] 2985 	jp interpreter 
      00A14A CD 8F 9F A1 84 27 12  2986 break_point: .asciz "\nbreak point, RUN to resume.\n"
             A1 11 CD 8F 9F A1 84
             27 06 CD A0 E5 CC 97
             20 65 73 75 6D 65 2E
             0A 00
                                   2987 
                                   2988 ;-----------------------
                                   2989 ; BASIC: NEW
                                   2990 ; from command line only 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



                                   2991 ; free program memory
                                   2992 ; and clear variables 
                                   2993 ;------------------------
      00A160                       2994 new: 
      00A160 CD 82 8D 22 01   [ 2] 2995 	btjf flags,#FRUN,0$ 
      00A163 81               [ 4] 2996 	ret 
      002719                       2997 0$:	
      00A163 C6 00 0D         [ 4] 2998 	call clear_basic 
      00A166 CE               [ 4] 2999 	ret 
                                   3000 
                                   3001 ;-----------------------------------
                                   3002 ; BASIC: ERASE \E | \F 
                                   3003 ; erase all block in range from 
                                   3004 ;  'app_space' to FLASH end (0x20000)
                                   3005 ;  or all EEPROM 
                                   3006 ; that contains a non zero byte.  
                                   3007 ;-----------------------------------
                           000001  3008 	LIMIT=1 
                           000003  3009 	VSIZE = 3 
      00271D                       3010 erase:
      00A167 00 0E 72 C7      [ 1] 3011 	clr farptr 
      002721                       3012 	_vars VSIZE 
      00A16B 00 1A            [ 2]    1     sub sp,#VSIZE 
      00A16D 72 5C 00         [ 4] 3013 	call next_token 
      00A170 1B 72            [ 1] 3014 	cp a,#TK_CHAR 
      00A172 CF 00            [ 1] 3015 	jreq 0$ 
      00A174 1A CD A0         [ 2] 3016 	jp syntax_error
      00A177 E5 CD 98         [ 4] 3017 0$: call get_char 
      00A17A 21 A1            [ 1] 3018 	and a,#0XDF 
      00A17C 08 26            [ 1] 3019 	cp a,#'E
      00A17E 03 CC            [ 1] 3020 	jrne 1$
      00A180 A0 F9 00         [ 2] 3021 	ldw x,#EEPROM_BASE 
      00A182 CF 00 19         [ 2] 3022 	ldw farptr+1,x 
      00A182 A1 00 27         [ 2] 3023 	ldw x,#EEPROM_END
      00A185 07               [ 1] 3024 	clr a 
      00A186 A1 0A            [ 2] 3025 	jra 3$ 
      00A188 27 03            [ 1] 3026 1$: cp a,#'F 
      00A18A CC 97            [ 1] 3027 	jreq 2$
      00A18C 20 15 E0         [ 2] 3028 	ldw x,#err_bad_value
      00A18D CC 16 A2         [ 2] 3029 	jp tb_error
      00274C                       3030 2$:
      00A18D 5B 05 90         [ 2] 3031 	ldw x,#app_space  
      00A190 85 81 19         [ 2] 3032 	ldw farptr+1,x 
      00A192 A6 02            [ 1] 3033 	ld a,#(FLASH_END>>16)&0XFF 
      00A192 55 00 04         [ 2] 3034 	ldw x,#FLASH_END&0xffff
      002757                       3035 3$:
      00A195 00 02            [ 1] 3036 	ld (LIMIT,sp),a 
      00A197 81 02            [ 2] 3037 	ldw (LIMIT+1,sp),x 
                                   3038  ; operation done from RAM
                                   3039  ; copy code to RAM in tib   
      00A198 CD 07 42         [ 4] 3040 	call move_erase_to_ram
      00275E                       3041 4$:	 
      00A198 52 04 0F         [ 4] 3042     call scan_block 
      00A19B 01 CD            [ 1] 3043 	jreq 5$  ; block already erased 
      00A19D 99 E1            [ 1] 3044     ld a,#'E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A19F A1 02 24         [ 4] 3045     call putc 
      00A1A2 03 CC 97         [ 4] 3046 	call block_erase   
                                   3047 ; this block is clean, next  
      00A1A5 20 A1 03         [ 2] 3048 5$:	ldw x,#BLOCK_SIZE
      00A1A8 25 0C 90         [ 4] 3049 	call incr_farptr
                                   3050 ; check limit, 24 bit substraction  	
      00A1AB F6 93            [ 1] 3051 	ld a,(LIMIT,sp)
      00A1AD EE 01            [ 2] 3052 	ldw x,(LIMIT+1,sp)
      00A1AF 72 A9 00 03      [ 2] 3053 	subw x,farptr+1
      00A1B3 9F 6B 01         [ 1] 3054 	sbc a,farptr 
      00A1B6 90 F6            [ 1] 3055 	jrugt 4$ 
      00A1B8 93 EE 01         [ 4] 3056 9$: call clear_basic
      00A1BB 72 A9            [ 2] 3057 	ldw x,(LIMIT+1,sp)
      00A1BD 00 03 9F         [ 2] 3058 	cpw x,#EEPROM_END
      00A1C0 6B 02            [ 1] 3059 	jrne 10$
      00A1C2 90 F6 93         [ 4] 3060 	call func_eefree 
      00278B                       3061 10$:
      00278B                       3062 	_drop VSIZE 
      00A1C5 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A1C7 72               [ 4] 3063 	ret 
                                   3064 	
                                   3065 
                                   3066 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3067 ;  check for application signature 
                                   3068 ; output:
                                   3069 ;   Carry    0 app present 
                                   3070 ;            1 no app installed  
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00278E                       3072 qsign: 
      00A1C8 A9 00 03         [ 2] 3073 	ldw x,app_sign 
      00A1CB F6 14 02         [ 2] 3074 	cpw x,SIGNATURE ; "BC" 
      00A1CE 18               [ 4] 3075 	ret 
                                   3076 
                                   3077 ;--------------------------------------
                                   3078 ;  fill write buffer 
                                   3079 ;  input:
                                   3080 ;    y  point to output buffer 
                                   3081 ;    x  point to source 
                                   3082 ;    a  bytes to write in buffer 
                                   3083 ;  output:
                                   3084 ;    y   += A 
                                   3085 ;    X   += A 
                                   3086 ;    A   0 
                                   3087 ;---------------------------------------
      002795                       3088 fill_write_buffer:
      00A1CF 01               [ 1] 3089 	push a 
      00A1D0 27               [ 1] 3090 	tnz a 
      00A1D1 F9 5B            [ 1] 3091 	jreq 9$ 
      00A1D3 04               [ 1] 3092 1$: ld a,(x)
      00A1D4 81               [ 1] 3093 	incw x 
      00A1D5 90 F7            [ 1] 3094 	ld (y),a 
      00A1D5 CD 99            [ 1] 3095 	incw y 
      00A1D7 E1 A1            [ 1] 3096 	dec (1,sp) 
      00A1D9 02 27            [ 1] 3097 	jrne 1$ 
      00A1DB 03               [ 1] 3098 9$:	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1DC CC               [ 4] 3099     ret 	
                                   3100 
                                   3101 ;--------------------------------------
                                   3102 ;  fill pad buffer with zero 
                                   3103 ;  input:
                                   3104 ;	none 
                                   3105 ;  output:
                                   3106 ;    y     buffer address  
                                   3107 ;--------------------------------------
      0027A5                       3108 clear_block_buffer:
      00A1DD 97               [ 1] 3109 	push a 
      00A1DE 20 AE 16 B8      [ 2] 3110 	ldw y,#block_buffer 
      00A1DF 90 89            [ 2] 3111 	pushw y
      00A1DF 90 F6            [ 1] 3112 	ld a,#BLOCK_SIZE   
      00A1E1 93 EE            [ 1] 3113 1$:	clr (y)
      00A1E3 01 72            [ 1] 3114 	incw y
      00A1E5 A9               [ 1] 3115 	dec a  
      00A1E6 00 03            [ 1] 3116 	jrne 1$ 	
      00A1E8 9F 88            [ 2] 3117 9$: popw y 
      00A1EA 90               [ 1] 3118 	pop a 			
      00A1EB F6               [ 4] 3119 	ret 
                                   3120 
                                   3121 
                                   3122 ;---------------------------------------
                                   3123 ; BASIC: SAVE
                                   3124 ; write application from RAM to FLASH
                                   3125 ;--------------------------------------
                           000001  3126 	XTEMP=1
                           000003  3127 	COUNT=3  ; last count bytes written 
                           000004  3128 	CNT_LO=4 ; count low byte 
                           000005  3129 	TOWRITE=5 ; how bytes left to write  
                           000006  3130 	VSIZE=6 
      0027B9                       3131 save_app:
      00A1EC 93               [ 2] 3132 	pushw x 
      00A1ED EE 01            [ 2] 3133 	pushw y 
      0027BC                       3134 	_vars VSIZE
      00A1EF 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A1F1 00 03 84         [ 4] 3135 	call qsign 
      00A1F4 FA F7            [ 1] 3136 	jrne 1$
      00A1F6 81 28 50         [ 2] 3137 	ldw x,#CANT_DO 
      00A1F7 CD 09 A1         [ 4] 3138 	call puts 
      00A1F7 CD 99 E1         [ 2] 3139 	jp 9$
      0027CC                       3140 1$: 
      00A1FA A1 02 27         [ 2] 3141 	ldw x,txtbgn
      00A1FD 03 CC 97         [ 2] 3142 	cpw x,txtend 
      00A200 20 09            [ 1] 3143 	jrult 2$ 
      00A201 AE 28 92         [ 2] 3144 	ldw x,#NO_APP
      00A201 90 F6 93         [ 4] 3145 	call puts 
      00A204 EE 01 72         [ 2] 3146 	jp 9$
      0027DD                       3147 2$: 
                                   3148 ; block programming flash
                                   3149 ; must be done from RAM
                                   3150 ; moved in tib  
      00A207 A9 00 03         [ 4] 3151 	call move_prg_to_ram
                                   3152 ; initialize farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3153 ; to app_sign address 
      00A20A 9F 43 88 90      [ 1] 3154 	clr farptr 
      00A20E F6 93 EE         [ 2] 3155 	ldw x,#app_sign 
      00A211 01 72 A9         [ 2] 3156 	ldw farptr+1,x
                                   3157 ; initialize local variables 
      00A214 00 03 84         [ 4] 3158 	call prog_size
      00A217 F4 F7            [ 2] 3159 	ldw (TOWRITE,sp),x
      00A219 81 03            [ 1] 3160 	clr (COUNT,sp)
                                   3161 ; first bock 
                                   3162 ; containt signature 2 bytes 
                                   3163 ; and size 	2 bytes 
                                   3164 ; use Y as pointer to block_buffer
      00A21A CD 27 A5         [ 4] 3165 	call clear_block_buffer ; -- y=*block_buffer	
                                   3166 ; write signature
      00A21A CD 99 E1         [ 2] 3167 	ldw x,SIGNATURE ; "BC" 
      00A21D A1 02            [ 2] 3168 	ldw (y),x 
      00A21F 27 03 CC 97      [ 2] 3169 	addw y,#2
      00A223 20 90            [ 2] 3170 	ldw x,(TOWRITE,sp)
      00A225 F6 93            [ 2] 3171 	ldw (y),x
      00A227 EE 01 72 A9      [ 2] 3172 	addw y,#2   
      00A22B 00 03            [ 1] 3173 	ld a,#(BLOCK_SIZE-4)
      00A22D 9F 88            [ 1] 3174 	ld (CNT_LO,sp),a 
      00A22F 90 F6 93         [ 2] 3175 	cpw x,#(BLOCK_SIZE-4) 
      00A232 EE 01            [ 1] 3176 	jrugt 3$
      00A234 72               [ 1] 3177 	ld a,xl 
      00A235 A9 00            [ 1] 3178 3$:	ld (CNT_LO,sp),a   
      00A237 03 84 F8         [ 2] 3179 	ldw x,txtbgn 
      00A23A F7 81            [ 2] 3180 	ldw (XTEMP,sp),x 
      00A23C                       3181 32$: 
      00A23C CD 99            [ 2] 3182 	ldw x,(XTEMP,sp)
      00A23E DC A1            [ 1] 3183 	ld a,(CNT_LO,sp)
      00A240 02 27 03         [ 4] 3184 	call fill_write_buffer 
      00A243 CC 97            [ 2] 3185 	ldw (XTEMP,sp),x 
      00A245 20 16 B8         [ 2] 3186 	ldw x,#block_buffer
      00A246 CD 07 9C         [ 4] 3187 	call write_buffer
      00A246 90 F6 93         [ 2] 3188 	ldw x,#BLOCK_SIZE 
      00A249 EE 01 72         [ 4] 3189 	call incr_farptr  
                                   3190 ; following blocks 
      00A24C A9 00            [ 2] 3191 	ldw x,(XTEMP,sp)
      00A24E 03 9F A4         [ 2] 3192 	cpw x,txtend 
      00A251 07 88            [ 1] 3193 	jruge 9$ 
      00A253 A6 01            [ 2] 3194 	ldw x,(TOWRITE,sp)
      00A255 0D 01 27         [ 2] 3195 	subw x,(COUNT,sp)
      00A258 05 48            [ 2] 3196 	ldw (TOWRITE,sp),x 
      00A25A 0A 01            [ 1] 3197 	ld a,#BLOCK_SIZE 
      00A25C 20 F7 6B         [ 2] 3198 	cpw x,#BLOCK_SIZE 
      00A25F 01 90            [ 1] 3199 	jruge 4$ 
      00A261 F6               [ 1] 3200 	ld a,xl 
      00A262 93 EE            [ 1] 3201 4$:	ld (CNT_LO,sp),a 
      00A264 01 72 A9         [ 4] 3202 	call clear_block_buffer 
      00A267 00 03            [ 2] 3203 	jra 32$ 
      002848                       3204 9$:	_drop VSIZE 
      00A269 84 F4            [ 2]    1     addw sp,#VSIZE 
      00A26B 27 02            [ 2] 3205     popw y 
      00A26D A6               [ 2] 3206 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A26E 01               [ 4] 3207 	ret 
                                   3208 
                                   3209 
      00A26F 5F 97                 3210 SIGNATURE: .ascii "BC"
      00A271 4F 81 6E 27 74 20 66  3211 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A273 4E 6F 20 61 70 70 6C  3212 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3213 
                                   3214 ;---------------------
                                   3215 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3216 ; write 1 or more byte to FLASH or EEPROM
                                   3217 ; starting at address  
                                   3218 ; input:
                                   3219 ;   expr1  	is address 
                                   3220 ;   expr2,...,exprn   are bytes to write
                                   3221 ; output:
                                   3222 ;   none 
                                   3223 ;---------------------
      0028A8                       3224 write:
      00A273 CD 99 E1         [ 4] 3225 	call expression
      00A276 A1 02            [ 1] 3226 	cp a,#TK_INTGR 
      00A278 27 03            [ 1] 3227 	jreq 0$
      00A27A CC 97 20         [ 2] 3228 	jp syntax_error
      00A27D                       3229 0$: _xpop 
      00A27D 90 F6            [ 1]    1     ld a,(y)
      00A27F 93               [ 1]    2     ldw x,y 
      00A280 EE 01            [ 2]    3     ldw x,(1,x)
      00A282 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A286 9F 88 90         [ 1] 3230 	ld farptr,a 
      00A289 F6 93 EE         [ 2] 3231 	ldw ptr16,x 
      0028C1                       3232 1$:	
      00A28C 01 72 A9         [ 4] 3233 	call next_token 
      00A28F 00 03            [ 1] 3234 	cp a,#TK_COMMA 
      00A291 84 F7            [ 1] 3235 	jreq 2$ 
      00A293 81 20            [ 2] 3236 	jra 9$ ; no more data 
      00A294 CD 1A 83         [ 4] 3237 2$:	call expression
      00A294 CD 99            [ 1] 3238 	cp a,#TK_INTGR
      00A296 DC A1            [ 1] 3239 	jreq 3$
      00A298 01 27 03         [ 2] 3240 	jp syntax_error
      0028D4                       3241 3$:	_xpop 
      00A29B CC 97            [ 1]    1     ld a,(y)
      00A29D 20               [ 1]    2     ldw x,y 
      00A29E 90 F6            [ 2]    3     ldw x,(1,x)
      00A2A0 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A2A4 A9               [ 1] 3242 	ld a,xl 
      00A2A5 00               [ 1] 3243 	clrw x 
      00A2A6 03 C7 00         [ 4] 3244 	call write_byte
      00A2A9 19 CF 00         [ 2] 3245 	ldw x,#1 
      00A2AC 1A 92 BC         [ 4] 3246 	call incr_farptr 
      00A2AF 00 19            [ 2] 3247 	jra 1$ 
      0028EA                       3248 9$:
      00A2B1 5F               [ 4] 3249 	ret 
                                   3250 
                                   3251 
                                   3252 ;---------------------
                                   3253 ;BASIC: CHAR(expr)
                                   3254 ; évaluate expression 
                                   3255 ; and take the 7 least 
                                   3256 ; bits as ASCII character
                                   3257 ; output: 
                                   3258 ; 	A char 
                                   3259 ;---------------------
      0028EB                       3260 char:
      00A2B2 97 4F 81         [ 4] 3261 	call func_args 
      00A2B5 A1 01            [ 1] 3262 	cp a,#1
      00A2B5 CD 9C            [ 1] 3263 	jreq 1$
      00A2B7 08 90 F6         [ 2] 3264 	jp syntax_error
      0028F5                       3265 1$:	_xpop
      00A2BA 93 EE            [ 1]    1     ld a,(y)
      00A2BC 01               [ 1]    2     ldw x,y 
      00A2BD 72 A9            [ 2]    3     ldw x,(1,x)
      00A2BF 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2C3 0A               [ 1] 3266 	ld a,xl
      00A2C4 55 00            [ 1] 3267 	and a,#0x7f 
      00A2C6 04               [ 4] 3268 	ret
                                   3269 
                                   3270 ;---------------------
                                   3271 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3272 ; extract first character 
                                   3273 ; of string argument 
                                   3274 ; output:
                                   3275 ;    A:X    int24 
                                   3276 ;---------------------
      002902                       3277 ascii:
      00A2C7 00 02            [ 1] 3278 	ld a,#TK_LPAREN
      00A2C9 5B 02 CC         [ 4] 3279 	call expect 
      00A2CC 97 D3 81         [ 4] 3280 	call next_token 
      00A2CF A1 02            [ 1] 3281 	cp a,#TK_QSTR 
      00A2CF 85 52            [ 1] 3282 	jreq 1$
      00A2D1 0D 89            [ 1] 3283 	cp a,#TK_CHAR 
      00A2D3 A6 85            [ 1] 3284 	jreq 2$ 
      00A2D5 CD 99            [ 1] 3285 	cp a,#TK_CFUNC 
      00A2D7 CF CD            [ 1] 3286 	jreq 0$
      00A2D9 98 56 1F         [ 2] 3287 	jp syntax_error
      002919                       3288 0$: ; cfunc 
      00A2DC 09               [ 4] 3289 	call (x)
      00A2DD CD 9C            [ 2] 3290 	jra 3$
      00291C                       3291 1$: ; quoted string 
      00A2DF F0               [ 1] 3292 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A2E0 72               [ 1] 3293 	push a  
      00A2E1 14 00 23         [ 4] 3294 	call skip_string
      00A2E4 CD               [ 1] 3295 	pop a  	
      00A2E5 98 21            [ 2] 3296 	jra 3$ 
      002924                       3297 2$: ; character 
      00A2E7 A1 80 27         [ 4] 3298 	call get_char 
      00A2EA 03               [ 1] 3299 3$:	clrw x 
      00A2EB CC               [ 1] 3300 	rlwa x   
      002929                       3301 4$:	_xpush  
      00A2EC 97 20 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A2EE 90 F7            [ 1]    2     ld (y),a 
      00A2EE CD 98 3A         [ 2]    3     ldw (1,y),x 
      00A2F1 A3 A2            [ 1] 3302 	ld a,#TK_RPAREN 
      00A2F3 F9 27 03         [ 4] 3303 	call expect
      002937                       3304 9$:	
      002937                       3305 	_xpop  
      00A2F6 CC 97            [ 1]    1     ld a,(y)
      00A2F8 20               [ 1]    2     ldw x,y 
      00A2F9 EE 01            [ 2]    3     ldw x,(1,x)
      00A2F9 72 04 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A2FD 03               [ 4] 3306 	ret 
                                   3307 
                                   3308 ;---------------------
                                   3309 ;BASIC: KEY
                                   3310 ; wait for a character 
                                   3311 ; received from STDIN 
                                   3312 ; input:
                                   3313 ;	none 
                                   3314 ; output:
                                   3315 ;	a	 character 
                                   3316 ;---------------------
      002941                       3317 key:
      00A2FE CC 97 20         [ 4] 3318 	call getc 
      00A301 CD               [ 4] 3319 	ret
                                   3320 
                                   3321 ;----------------------
                                   3322 ; BASIC: QKEY
                                   3323 ; Return true if there 
                                   3324 ; is a character in 
                                   3325 ; waiting in STDIN 
                                   3326 ; input:
                                   3327 ;  none 
                                   3328 ; output:
                                   3329 ;   A     0|-1
                                   3330 ;-----------------------
      002945                       3331 qkey:: 
      00A302 9B               [ 1] 3332 	clrw x 
      00A303 03 A1 84         [ 1] 3333 	ld a,rx1_head
      00A306 27 03 CC         [ 1] 3334 	sub a,rx1_tail 
      00A309 97 20            [ 1] 3335 	jreq 9$ 
      00A30B 90               [ 2] 3336 	cplw x
      00A30C F6 93            [ 1] 3337 	ld a,#255    
      002951                       3338 9$: 
      00A30E EE               [ 4] 3339 	ret 
                                   3340 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3341 ;---------------------
                                   3342 ; BASIC: GPIO(port,reg)
                                   3343 ; return gpio register address 
                                   3344 ; expr {PORTA..PORTI}
                                   3345 ; input:
                                   3346 ;   none 
                                   3347 ; output:
                                   3348 ;   A:X 	gpio register address
                                   3349 ;----------------------------
                                   3350 ;	N=PORT
                                   3351 ;	T=REG 
      002952                       3352 gpio:
      00A30F 01 72 A9         [ 4] 3353 	call func_args 
      00A312 00 03            [ 1] 3354 	cp a,#2
      00A314 6B 06            [ 1] 3355 	jreq 1$
      00A316 1F 07 CD         [ 2] 3356 	jp syntax_error  
      00295C                       3357 1$:	_at_next 
      00A319 98 21 A1         [ 1]    1     ld a,(3,y)
      00A31C 00               [ 1]    2     ldw x,y 
      00A31D 27 11            [ 2]    3     ldw x,(4,x)
      00A31F A1 80 26         [ 2] 3358 	cpw x,#PA_BASE 
      00A322 08 CD            [ 1] 3359 	jrmi bad_port
      00A324 98 3A A3         [ 2] 3360 	cpw x,#PI_BASE+1 
      00A327 A3 39            [ 1] 3361 	jrpl bad_port
      00A329 27               [ 2] 3362 	pushw x 
      00296D                       3363 	_xpop
      00A32A 0E F6            [ 1]    1     ld a,(y)
      00A32B 93               [ 1]    2     ldw x,y 
      00A32B 55 00            [ 2]    3     ldw x,(1,x)
      00A32D 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      00A330 72 FB 01         [ 2] 3364 	addw x,(1,sp)
      002979                       3365 	_drop 2 
      00A330 0F 03            [ 2]    1     addw sp,#2 
      00A332 AE               [ 1] 3366 	clr a 
      00A333 00               [ 4] 3367 	ret
      00297D                       3368 bad_port:
      00A334 01 1F            [ 1] 3369 	ld a,#ERR_BAD_VALUE
      00A336 04 20 2F         [ 2] 3370 	jp tb_error
                                   3371 
                                   3372 
                                   3373 ;-------------------------
                                   3374 ; BASIC: UFLASH 
                                   3375 ; return free flash address
                                   3376 ; input:
                                   3377 ;  none 
                                   3378 ; output:
                                   3379 ;	A		TK_INTGR
                                   3380 ;   xstack	free address 
                                   3381 ;---------------------------
      00A339                       3382 uflash:
      00A339 72 04 00         [ 2] 3383 	ldw x,app_sign
      00A33C 23 03 CC         [ 2] 3384 	cpw x,#4243 ; signature "BC" 
      00A33F 97 20            [ 1] 3385 	jreq 1$
      00A341 CD 9B 03         [ 2] 3386 	ldw x,app_size 
      00A344 A1 84 27         [ 2] 3387 	addw x,#app
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A347 03 CC            [ 2] 3388 	jra 2$
      00A349 97 20 00         [ 2] 3389 1$:	ldw x,#app_space 
      00A34B 4F               [ 1] 3390 2$:	clr a 
      00A34B 90               [ 4] 3391 	ret 
                                   3392 
                                   3393 
                                   3394 ;---------------------
                                   3395 ; BASIC: USR(addr[,arg])
                                   3396 ; execute a function written 
                                   3397 ; in binary code.
                                   3398 ; binary fonction should 
                                   3399 ; return token attribute in A 
                                   3400 ; and value in YL:X. 
                                   3401 ; input:
                                   3402 ;   addr	routine address 
                                   3403 ;   arg 	is an optional argument 
                                   3404 ; output:
                                   3405 ;   A 		token attribute 
                                   3406 ;   xstack  returned value 
                                   3407 ;---------------------
      002997                       3408 usr:
      00A34C F6               [ 2] 3409 	pushw x 
      00A34D 93 EE            [ 2] 3410 	pushw y 	
      00A34F 01 72 A9         [ 4] 3411 	call func_args 
      00A352 00 03            [ 1] 3412 	cp a,#1 
      00A354 6B 03            [ 1] 3413 	jreq 1$
      00A356 1F 04            [ 1] 3414 	cp a,#2
      00A358 4D 2A            [ 1] 3415 	jreq 1$  
      00A35A 0D 7B 06         [ 2] 3416 	jp syntax_error 
      00A35D 1E               [ 1] 3417 1$: push a 
      0029A9                       3418 	_xpop 
      00A35E 07 1D            [ 1]    1     ld a,(y)
      00A360 00               [ 1]    2     ldw x,y 
      00A361 01 A2            [ 2]    3     ldw x,(1,x)
      00A363 00 6B 06 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A367 07 93            [ 1] 3419 	ldw y,x  ; arg|addr 
      00A368 84               [ 1] 3420     pop a 
      00A368 CE 00            [ 1] 3421 	cp a,#1 
      00A36A 05 1F            [ 1] 3422 	jreq 3$
      0029B9                       3423 	_xpop  ; x=code addr  
      00A36C 0D CE            [ 1]    1     ld a,(y)
      00A36E 00               [ 1]    2     ldw x,y 
      00A36F 01 1F            [ 2]    3     ldw x,(1,x)
      00A371 0B 72 15 00      [ 2]    4     addw y,#CELL_SIZE 
      00A375 23               [ 1] 3424 	exgw x,y ; y=code addr, x=arg 
      00A376 72 5C            [ 4] 3425 3$: call (y)
      00A378 00               [ 1] 3426 	push a 
      00A379 20 81            [ 1] 3427 	ld a,yl  
      00A37B                       3428 	_xpush 
      00A37B 72 5D 00 20      [ 2]    1     subw y,#CELL_SIZE
      00A37F 26 03            [ 1]    2     ld (y),a 
      00A381 CC 97 20         [ 2]    3     ldw (1,y),x 
      00A384 84               [ 1] 3429 	pop a 
      00A384 A6 85            [ 2] 3430 	popw y 
      00A386 CD               [ 2] 3431 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A387 99               [ 4] 3432 	ret 
                                   3433 
                                   3434 
                                   3435 ;------------------------------
                                   3436 ; BASIC: BYE 
                                   3437 ; halt mcu in its lowest power mode 
                                   3438 ; wait for reset or external interrupt
                                   3439 ; do a cold start on wakeup.
                                   3440 ;------------------------------
      0029D6                       3441 bye:
      00A388 CF CD 98 56 13   [ 2] 3442 	btjf UART1_SR,#UART_SR_TC,.
      00A38D 09               [10] 3443 	halt
      00A38E 27 03 CC         [ 2] 3444 	jp cold_start  
                                   3445 
                                   3446 ;----------------------------------
                                   3447 ; BASIC: SLEEP 
                                   3448 ; halt mcu until reset or external
                                   3449 ; interrupt.
                                   3450 ; Resume progam after SLEEP command
                                   3451 ;----------------------------------
      0029DF                       3452 sleep:
      00A391 97 20 52 30 FB   [ 2] 3453 	btjf UART1_SR,#UART_SR_TC,.
      00A393 72 16 00 22      [ 1] 3454 	bset flags,#FSLEEP
      00A393 CF               [10] 3455 	halt 
      00A394 00               [ 4] 3456 	ret 
                                   3457 
                                   3458 ;-------------------------------
                                   3459 ; BASIC: PAUSE expr 
                                   3460 ; suspend execution for n msec.
                                   3461 ; input:
                                   3462 ;	none
                                   3463 ; output:
                                   3464 ;	none 
                                   3465 ;------------------------------
      0029EA                       3466 pause:
      00A395 1A F6 EE         [ 4] 3467 	call expression
      00A398 01 72            [ 1] 3468 	cp a,#TK_INTGR
      00A39A FB 04            [ 1] 3469 	jreq 1$ 
      00A39C 19 03 72         [ 2] 3470 	jp syntax_error
      0029F4                       3471 1$: _xpop 
      00A39F C7 00            [ 1]    1     ld a,(y)
      00A3A1 1A               [ 1]    2     ldw x,y 
      00A3A2 72 5C            [ 2]    3     ldw x,(1,x)
      00A3A4 00 1B 72 CF      [ 2]    4     addw y,#CELL_SIZE 
      0029FD                       3472 pause02:
      00A3A8 00 1A C7         [ 2] 3473 	ldw timer,x 
      00A3AB 00 0D CF         [ 2] 3474 1$: ldw x,timer 
      00A3AE 00               [ 2] 3475 	tnzw x 
      00A3AF 0E 7B            [ 1] 3476 	jreq 2$
      00A3B1 06               [10] 3477 	wfi 
      00A3B2 1E 07            [ 1] 3478 	jrne 1$
      00A3B4 72               [ 1] 3479 2$:	clr a 
      00A3B5 B0               [ 4] 3480 	ret 
                                   3481 
                                   3482 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3483 ; BASIC: AWU expr
                                   3484 ; halt mcu for 'expr' milliseconds
                                   3485 ; use Auto wakeup peripheral
                                   3486 ; all oscillators stopped except LSI
                                   3487 ; range: 1ms - 511ms
                                   3488 ; input:
                                   3489 ;  none
                                   3490 ; output:
                                   3491 ;  none:
                                   3492 ;------------------------------
      002A0B                       3493 awu:
      00A3B6 00 0E C2         [ 4] 3494   call expression
      00A3B9 00 0D            [ 1] 3495   cp a,#TK_INTGR
      00A3BB 18 03            [ 1] 3496   jreq 1$
      00A3BD A8 80 2B         [ 2] 3497   jp syntax_error
      002A15                       3498 1$: _xpop 
      00A3C0 12 20            [ 1]    1     ld a,(y)
      00A3C2 25               [ 1]    2     ldw x,y 
      00A3C3 7B 03            [ 2]    3     ldw x,(1,x)
      00A3C5 2A 07 C6 00      [ 2]    4     addw y,#CELL_SIZE 
      002A1E                       3499 awu02:
      00A3C9 0F 2F 07         [ 2] 3500   cpw x,#5120
      00A3CC 20 1A            [ 1] 3501   jrmi 1$ 
      00A3CE 35 0F 50 F2      [ 1] 3502   mov AWU_TBR,#15 
      00A3CE 72 0E            [ 1] 3503   ld a,#30
      00A3D0 00               [ 2] 3504   div x,a
      00A3D1 0F 15            [ 1] 3505   ld a,#16
      00A3D3 62               [ 2] 3506   div x,a 
      00A3D3 1E 0D            [ 2] 3507   jra 4$
      002A2F                       3508 1$: 
      00A3D5 CF 00 05         [ 2] 3509   cpw x,#2048
      00A3D8 72 01            [ 1] 3510   jrmi 2$ 
      00A3DA 00 23 05 E6      [ 1] 3511   mov AWU_TBR,#14
      00A3DE 02 C7            [ 1] 3512   ld a,#80
      00A3E0 00               [ 2] 3513   div x,a 
      00A3E1 04 1E            [ 2] 3514   jra 4$   
      002A3D                       3515 2$:
      00A3E3 0B CF 00 01      [ 1] 3516   mov AWU_TBR,#7
      002A41                       3517 3$:  
                                   3518 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3E7 81 00 40         [ 2] 3519   cpw x,#64 
      00A3E8 23 07            [ 2] 3520   jrule 4$ 
      00A3E8 85 5B 0D 72      [ 1] 3521   inc AWU_TBR 
      00A3EC 5A               [ 2] 3522   srlw x 
      00A3ED 00 20            [ 2] 3523   jra 3$ 
      002A4D                       3524 4$:
      00A3EF FC               [ 1] 3525   ld a, xl
      00A3F0 4A               [ 1] 3526   dec a 
      00A3F0 CD 98            [ 1] 3527   jreq 5$
      00A3F2 21               [ 1] 3528   dec a 	
      002A52                       3529 5$: 
      00A3F3 A1 84            [ 1] 3530   and a,#0x3e 
      00A3F5 27 07 A1         [ 1] 3531   ld AWU_APR,a 
      00A3F8 03 27 26 CC      [ 1] 3532   bset AWU_CSR,#AWU_CSR_AWUEN
      00A3FC 97               [10] 3533   halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3534 
      00A3FD 20               [ 4] 3535   ret 
                                   3536 
                                   3537 ;------------------------------
                                   3538 ; BASIC: TICKS
                                   3539 ; return msec ticks counter value 
                                   3540 ; input:
                                   3541 ; 	none 
                                   3542 ; output:
                                   3543 ;	X 		TK_INTGR
                                   3544 ;-------------------------------
      00A3FE                       3545 get_ticks:
      00A3FE 90 89 CD         [ 1] 3546 	ld a,ticks 
      00A401 98 60 4F         [ 2] 3547 	ldw x,ticks+1 
      00A404 90               [ 4] 3548 	ret 
                                   3549 
                                   3550 ;------------------------------
                                   3551 ; BASIC: ABS(expr)
                                   3552 ; return absolute value of expr.
                                   3553 ; input:
                                   3554 ;   none
                                   3555 ; output:
                                   3556 ;   xstack    positive int24 
                                   3557 ;-------------------------------
      002A64                       3558 abs:
      00A405 CE 00 05         [ 4] 3559 	call func_args 
      00A408 90 FE            [ 1] 3560 	cp a,#1 
      00A40A 90 89            [ 1] 3561 	jreq 0$ 
      00A40C 13 01 5B         [ 2] 3562 	jp syntax_error
      002A6E                       3563 0$:  
      00A40F 02 25 01         [ 4] 3564 	call abs24 
      002A71                       3565 	_xpop 
      00A412 4C F6            [ 1]    1     ld a,(y)
      00A413 93               [ 1]    2     ldw x,y 
      00A413 CD 8D            [ 2]    3     ldw x,(1,x)
      00A415 09 5D 26 05      [ 2]    4     addw y,#CELL_SIZE 
      00A419 A6               [ 4] 3566 	ret 
                                   3567 
                                   3568 ;------------------------------
                                   3569 ; BASIC: LSHIFT(expr1,expr2)
                                   3570 ; logical shift left expr1 by 
                                   3571 ; expr2 bits 
                                   3572 ; output:
                                   3573 ; 	A 		TK_INTGR
                                   3574 ;   X 		result 
                                   3575 ;------------------------------
      002A7B                       3576 lshift:
      00A41A 05 CC 97         [ 4] 3577 	call func_args
      00A41D 22 90            [ 1] 3578 	cp a,#2 
      00A41F 85 81            [ 1] 3579 	jreq 1$
      00A421 CC 16 A0         [ 2] 3580 	jp syntax_error
      002A85                       3581 1$: _xpop 
      00A421 90 89            [ 1]    1     ld a,(y)
      00A423 89               [ 1]    2     ldw x,y 
      00A424 72 5F            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A426 00 0E 90 CE      [ 2]    4     addw y,#CELL_SIZE 
      00A42A 00 1C            [ 1] 3582     ldw y,x    
      002A90                       3583 	_at_top  ; T@ 
      00A42C 90 E6            [ 1]    1     ld a,(y)
      00A42E 03               [ 1]    2     ldw x,y 
      00A42F A1 03            [ 2]    3     ldw x,(1,x)
      00A431 27 15            [ 2] 3584 	tnzw y 
      00A433 90 E6            [ 1] 3585 	jreq 4$
      00A435 02               [ 1] 3586 2$:	rcf 
      00A436 C7               [ 2] 3587 	rlcw x 
      00A437 00               [ 1] 3588 	rlc a 
      00A438 0F 72            [ 2] 3589 	decw y 
      00A43A B9 00            [ 1] 3590 	jrne 2$
      002AA0                       3591 4$: _store_top  ; T! 
      00A43C 0E 90            [ 1]    1     ld (y),a 
      00A43E C3 00 1E         [ 2]    2     ldw (1,y),x     
      00A441 25 E9            [ 1] 3592 	ld a,#TK_INTGR
      00A443 A6               [ 4] 3593 	ret
                                   3594 
                                   3595 ;------------------------------
                                   3596 ; BASIC: RSHIFT(expr1,expr2)
                                   3597 ; logical shift right expr1 by 
                                   3598 ; expr2 bits.
                                   3599 ; output:
                                   3600 ; 	A 		TK_INTGR
                                   3601 ;   X 		result 
                                   3602 ;------------------------------
      002AA8                       3603 rshift:
      00A444 0A CC 97         [ 4] 3604 	call func_args
      00A447 22 02            [ 1] 3605 	cp a,#2 
      00A448 27 03            [ 1] 3606 	jreq 1$
      00A448 90 89 72         [ 2] 3607 	jp syntax_error
      002AB2                       3608 1$: _xpop 
      00A44B A9 00            [ 1]    1     ld a,(y)
      00A44D 04               [ 1]    2     ldw x,y 
      00A44E 1E 03            [ 2]    3     ldw x,(1,x)
      00A450 CD 94 6F 26      [ 2]    4     addw y,#CELL_SIZE 
      00A454 04 90            [ 1] 3609     ldw y,x   
      002ABD                       3610 	_at_top  ; T@  
      00A456 85 20            [ 1]    1     ld a,(y)
      00A458 DA               [ 1]    2     ldw x,y 
      00A459 EE 01            [ 2]    3     ldw x,(1,x)
      00A459 85 5B            [ 2] 3611 	tnzw y 
      00A45B 02 90            [ 1] 3612 	jreq 4$
      00A45D 85               [ 1] 3613 2$:	rcf 
      00A45E 81               [ 2] 3614 	rrcw x
      00A45F 46               [ 1] 3615 	rrc a  
      00A45F 72 00            [ 2] 3616 	decw y 
      00A461 00 23            [ 1] 3617 	jrne 2$
      002ACD                       3618 4$: _store_top  ; T! 
      00A463 05 A6            [ 1]    1     ld (y),a 
      00A465 06 CC 97         [ 2]    2     ldw (1,y),x     
      00A468 22 CD            [ 1] 3619 	ld a,#TK_INTGR
      00A46A 9B               [ 4] 3620 	ret
                                   3621 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3622 ;--------------------------
                                   3623 ; BASIC: FCPU integer
                                   3624 ; set CPU frequency 
                                   3625 ;-------------------------- 
                                   3626 
      002AD5                       3627 fcpu:
      00A46B 03 A1            [ 1] 3628 	ld a,#TK_INTGR
      00A46D 84 27 03         [ 4] 3629 	call expect 
      00A470 CC 97 20         [ 4] 3630 	call get_int24 
      00A473 90               [ 1] 3631 	ld a,xl 
      00A474 F6 93            [ 1] 3632 	and a,#7 
      00A476 EE 01 72         [ 1] 3633 	ld CLK_CKDIVR,a 
      00A479 A9               [ 4] 3634 	ret 
                                   3635 
                                   3636 ;------------------------------
                                   3637 ; BASIC: PMODE pin#, mode 
                                   3638 ; Arduino pin. 
                                   3639 ; define pin as input or output
                                   3640 ; pin#: {0..15}
                                   3641 ; mode: INPUT|OUTPUT  
                                   3642 ;------------------------------
                           000001  3643 	PINNO=1
                           000001  3644 	VSIZE=1
      002AE4                       3645 pin_mode:
      002AE4                       3646 	_vars VSIZE 
      00A47A 00 03            [ 2]    1     sub sp,#VSIZE 
      00A47C 9F 27 62         [ 4] 3647 	call arg_list 
      00A47F 88 CD            [ 1] 3648 	cp a,#2 
      00A481 98 21            [ 1] 3649 	jreq 1$
      00A483 A1 80 27         [ 2] 3650 	jp syntax_error 
      002AF0                       3651 1$: _xpop 
      00A486 03 CC            [ 1]    1     ld a,(y)
      00A488 97               [ 1]    2     ldw x,y 
      00A489 20 CD            [ 2]    3     ldw x,(1,x)
      00A48B 98 3A A3 A4      [ 2]    4     addw y,#CELL_SIZE 
      00A48F EB 27            [ 1] 3652 	ldw y,x ; mode 
      002AFB                       3653 	_xpop ; Dx pin 
      00A491 08 A3            [ 1]    1     ld a,(y)
      00A493 A5               [ 1]    2     ldw x,y 
      00A494 05 27            [ 2]    3     ldw x,(1,x)
      00A496 03 CC 97 20      [ 2]    4     addw y,#CELL_SIZE 
      00A49A CD 2B 41         [ 4] 3654 	call select_pin 
      00A49A 84 89            [ 1] 3655 	ld (PINNO,sp),a  
      00A49C 88 01            [ 1] 3656 	ld a,#1 
      00A49D 0D 01            [ 1] 3657 	tnz (PINNO,sp)
      00A49D 0A 01            [ 1] 3658 	jreq 4$
      00A49F 27               [ 1] 3659 2$:	sll a 
      00A4A0 26 CD            [ 1] 3660 	dec (PINNO,sp)
      00A4A2 98 21            [ 1] 3661 	jrne 2$ 
      00A4A4 A1 84            [ 1] 3662 	ld (PINNO,sp),a
      00A4A6 27 07            [ 1] 3663 	ld a,(PINNO,sp)
      00A4A8 A1 03            [ 1] 3664 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4AA 27 0D            [ 1] 3665 	ld (GPIO_CR1,x),a 
      00A4AC CC 97 20 01      [ 2] 3666 4$:	cpw y,#OUTP 
      00A4AF 27 10            [ 1] 3667 	jreq 6$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3668 ; input mode
                                   3669 ; disable external interrupt 
      00A4AF C6 00            [ 1] 3670 	ld a,(PINNO,sp)
      00A4B1 02               [ 1] 3671 	cpl a 
      00A4B2 AB 03            [ 1] 3672 	and a,(GPIO_CR2,x)
      00A4B4 C7 00            [ 1] 3673 	ld (GPIO_CR2,x),a 
                                   3674 ;clear bit in DDR for input mode 
      00A4B6 02 20            [ 1] 3675 	ld a,(PINNO,sp)
      00A4B8 03               [ 1] 3676 	cpl a 
      00A4B9 CD 98            [ 1] 3677 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4BB 47 02            [ 1] 3678 	ld (GPIO_DDR,x),a 
      00A4BC 20 0C            [ 2] 3679 	jra 9$
      002B32                       3680 6$: ;output mode  
      00A4BC CD 98            [ 1] 3681 	ld a,(PINNO,sp)
      00A4BE 21 A1            [ 1] 3682 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4C0 08 27            [ 1] 3683 	ld (GPIO_DDR,x),a 
      00A4C2 DA 5B            [ 1] 3684 	ld a,(PINNO,sp)
      00A4C4 03 20            [ 1] 3685 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4C6 1A 04            [ 1] 3686 	ld (GPIO_CR2,x),a 
      00A4C7                       3687 9$:	
      002B3E                       3688 	_drop VSIZE 
      00A4C7 5B 01            [ 2]    1     addw sp,#VSIZE 
      00A4C9 CD               [ 4] 3689 	ret
                                   3690 
                                   3691 ;------------------------
                                   3692 ; select Arduino pin 
                                   3693 ; input:
                                   3694 ;   X 	 {0..15} Arduino Dx 
                                   3695 ; output:
                                   3696 ;   A     stm8s208 pin 
                                   3697 ;   X     base address s208 GPIO port 
                                   3698 ;---------------------------
      002B41                       3699 select_pin:
      00A4CA A3               [ 2] 3700 	sllw x 
      00A4CB F0 CF 00         [ 2] 3701 	addw x,#arduino_to_8s208 
      00A4CE 1A               [ 2] 3702 	ldw x,(x)
      00A4CF 55               [ 1] 3703 	ld a,xl 
      00A4D0 00               [ 1] 3704 	push a 
      00A4D1 04               [ 1] 3705 	swapw x 
      00A4D2 00 02            [ 1] 3706 	ld a,#5 
      00A4D4 85               [ 4] 3707 	mul x,a 
      00A4D5 A3 A4 EB         [ 2] 3708 	addw x,#GPIO_BASE 
      00A4D8 26               [ 1] 3709 	pop a 
      00A4D9 05               [ 4] 3710 	ret 
                                   3711 ; translation from Arduino D0..D15 to stm8s208rb 
      002B51                       3712 arduino_to_8s208:
      00A4DA CE 00                 3713 .byte 3,6 ; D0 
      00A4DC 1A 20                 3714 .byte 3,5 ; D1 
      00A4DE 19 00                 3715 .byte 4,0 ; D2 
      00A4DF 02 01                 3716 .byte 2,1 ; D3
      00A4DF 20 35                 3717 .byte 6,0 ; D4
      00A4E1 02 02                 3718 .byte 2,2 ; D5
      00A4E1 55 00                 3719 .byte 2,3 ; D6
      00A4E3 04 00                 3720 .byte 3,1 ; D7
      00A4E5 02 5B                 3721 .byte 3,3 ; D8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A4E7 02 CC                 3722 .byte 2,4 ; D9
      00A4E9 97 D3                 3723 .byte 4,5 ; D10
      00A4EB 02 06                 3724 .byte 2,6 ; D11
      00A4EB 72 00                 3725 .byte 2,7 ; D12
      00A4ED 00 23                 3726 .byte 2,5 ; D13
      00A4EF 05 A6                 3727 .byte 4,2 ; D14
      00A4F1 06 CC                 3728 .byte 4,1 ; D15
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
      002B71                       3741 random:
      00A4F3 97 22 5C         [ 4] 3742 	call func_args 
      00A4F5 A1 01            [ 1] 3743 	cp a,#1
      00A4F5 CD A3            [ 1] 3744 	jreq 1$
      00A4F7 F0 16 A0         [ 2] 3745 	jp syntax_error
      00A4F8                       3746 1$:  
      002B7B                       3747 	_xpop   
      00A4F8 CF 00            [ 1]    1     ld a,(y)
      00A4FA 05               [ 1]    2     ldw x,y 
      00A4FB E6 02            [ 2]    3     ldw x,(1,x)
      00A4FD C7 00 04 35      [ 2]    4     addw y,#CELL_SIZE 
      00A501 03               [ 2] 3748 	pushw x 
      00A502 00               [ 1] 3749 	push a  
      00A503 02 81            [ 1] 3750 	ld a,#0x80 
      00A505 15 01            [ 1] 3751 	bcp a,(1,sp)
      00A505 72 00            [ 1] 3752 	jreq 2$
      00A507 00 23            [ 1] 3753 	ld a,#ERR_BAD_VALUE
      00A509 06 A6 06         [ 2] 3754 	jp tb_error
      002B91                       3755 2$: 
                                   3756 ; acc16=(x<<5)^x 
      00A50C CC 97 22         [ 2] 3757 	ldw x,seedx 
      00A50F 81               [ 2] 3758 	sllw x 
      00A510 58               [ 2] 3759 	sllw x 
      00A510 CD               [ 2] 3760 	sllw x 
      00A511 A3               [ 2] 3761 	sllw x 
      00A512 F0               [ 2] 3762 	sllw x 
      00A513 CF               [ 1] 3763 	ld a,xh 
      00A514 00 1A 14         [ 1] 3764 	xor a,seedx 
      00A516 C7 00 0D         [ 1] 3765 	ld acc16,a 
      00A516 85               [ 1] 3766 	ld a,xl 
      00A517 52 04 89         [ 1] 3767 	xor a,seedx+1 
      00A51A CE 00 1A         [ 1] 3768 	ld acc8,a 
                                   3769 ; seedx=seedy 
      00A51D 89 CE 00         [ 2] 3770 	ldw x,seedy 
      00A520 05 1F 05         [ 2] 3771 	ldw seedx,x  
                                   3772 ; seedy=seedy^(seedy>>1)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      00A523 CE 00 01         [ 2] 3773 	ldw x,seedy 
      00A526 1F               [ 2] 3774 	srlw x 
      00A527 07               [ 1] 3775 	ld a,xh 
      00A528 85 20 CD         [ 1] 3776 	xor a,seedy 
      00A52B C7 00 16         [ 1] 3777 	ld seedy,a  
      00A52B 72               [ 1] 3778 	ld a,xl 
      00A52C 00 00 23         [ 1] 3779 	xor a,seedy+1 
      00A52F 05 A6 06         [ 1] 3780 	ld seedy+1,a 
                                   3781 ; acc16>>3 
      00A532 CC 97 22         [ 2] 3782 	ldw x,acc16 
      00A535 54               [ 2] 3783 	srlw x 
      00A535 1E               [ 2] 3784 	srlw x 
      00A536 03               [ 2] 3785 	srlw x 
                                   3786 ; x=acc16^x 
      00A537 CF               [ 1] 3787 	ld a,xh 
      00A538 00 05 E6         [ 1] 3788 	xor a,acc16 
      00A53B 02 C7 00         [ 1] 3789 	ld acc16,a 
      00A53E 04               [ 1] 3790 	ld a,xl 
      00A53F 1E 05 CF         [ 1] 3791 	xor a,acc8 
      00A542 00 01 85         [ 1] 3792 	ld acc8,a 
                                   3793 ; seedy=acc16^seedy 
      00A545 5B 04 89         [ 1] 3794 	xor a,seedy+1
      00A548 81               [ 1] 3795 	ld xl,a 
      00A549 C6 00 0D         [ 1] 3796 	ld a,acc16 
      00A549 72 01 00         [ 1] 3797 	xor a,seedy
      00A54C 23               [ 1] 3798 	ld xh,a 
      00A54D 02 4F 81         [ 2] 3799 	ldw seedy,x 
                                   3800 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A550 C6 00 15         [ 1] 3801 	ld a,seedx+1
      00A550 72 09            [ 1] 3802 	and a,#127
      002BE6                       3803 	_xpush 
      00A552 00 23 12 5B      [ 2]    1     subw y,#CELL_SIZE
      00A556 02 CD            [ 1]    2     ld (y),a 
      00A558 A0 E5 5B         [ 2]    3     ldw (1,y),x 
      00A55B 04               [ 1] 3804 	pop a 
      00A55C 72               [ 2] 3805 	popw x 
      002BF1                       3806 	_xpush 
      00A55D 19 00 23 72      [ 2]    1     subw y,#CELL_SIZE
      00A561 10 00            [ 1]    2     ld (y),a 
      00A563 23 CC 97         [ 2]    3     ldw (1,y),x 
      00A566 CB CE 00         [ 4] 3807 	call mod24 
      002BFD                       3808 	_xpop
      00A569 1C C3            [ 1]    1     ld a,(y)
      00A56B 00               [ 1]    2     ldw x,y 
      00A56C 1E 2B            [ 2]    3     ldw x,(1,x)
      00A56E 0C AE 96 AF      [ 2]    4     addw y,#CELL_SIZE 
      00A572 CD 8A 21         [ 2] 3809 	addw x,#1 
      00A575 55 00            [ 1] 3810 	adc a,#0  
      00A577 04               [ 4] 3811 	ret 
                                   3812 
                                   3813 ;---------------------------------
                                   3814 ; BASIC: WORDS 
                                   3815 ; affiche la listes des mots du
                                   3816 ; dictionnaire ainsi que le nombre
                                   3817 ; de mots.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



                                   3818 ;---------------------------------
                           000001  3819 	WLEN=1 ; word length
                           000002  3820 	LLEN=2 ; character sent to console
                           000003  3821 	WCNT=3 ; count words printed 
                           000003  3822 	VSIZE=3 
      002C0C                       3823 words:
      002C0C                       3824 	_vars VSIZE
      00A578 00 02            [ 2]    1     sub sp,#VSIZE 
      00A57A 81 02            [ 1] 3825 	clr (LLEN,sp)
      00A57B 0F 03            [ 1] 3826 	clr (WCNT,sp)
      00A57B 5B 02 33 5C      [ 2] 3827 	ldw y,#kword_dict+2
      00A57D 93               [ 1] 3828 0$:	ldw x,y
      00A57D CD               [ 1] 3829 	ld a,(x)
      00A57E 9C CF            [ 1] 3830 	and a,#15 
      00A580 CD 94            [ 1] 3831 	ld (WLEN,sp),a 
      00A582 D4 5F            [ 1] 3832 	inc (WCNT,sp)
      00A584 CF               [ 1] 3833 1$:	incw x 
      00A585 00               [ 1] 3834 	ld a,(x)
      00A586 07 72 5F         [ 4] 3835 	call putc 
      00A589 00 09            [ 1] 3836 	inc (LLEN,sp)
      00A58B 72 5F            [ 1] 3837 	dec (WLEN,sp)
      00A58D 00 0A            [ 1] 3838 	jrne 1$
      00A58F CE 00            [ 1] 3839 	ld a,#70
      00A591 1C CF            [ 1] 3840 	cp a,(LLEN,sp)
      00A593 00 05            [ 1] 3841 	jrmi 2$   
      00A595 E6 02            [ 1] 3842 	ld a,#SPACE 
      00A597 C7 00 04         [ 4] 3843 	call putc 
      00A59A 35 03            [ 1] 3844 	inc (LLEN,sp) 
      00A59C 00 02            [ 2] 3845 	jra 3$
      00A59E 72 10            [ 1] 3846 2$: ld a,#CR 
      00A5A0 00 23 CC         [ 4] 3847 	call putc 
      00A5A3 97 CB            [ 1] 3848 	clr (LLEN,sp)
      00A5A5 72 A2 00 02      [ 2] 3849 3$:	subw y,#2 
      00A5A5 AE 17            [ 2] 3850 	ldw y,(y)
      00A5A7 FF 94            [ 1] 3851 	jrne 0$ 
      00A5A9 CC 97            [ 1] 3852 	ld a,#CR 
      00A5AB AC 09 44         [ 4] 3853 	call putc  
      00A5AC 5F               [ 1] 3854 	clrw x 
      00A5AC CD 98            [ 1] 3855 	ld a,(WCNT,sp)
      00A5AE 21               [ 1] 3856 	ld xl,a 
      00A5AF A1 85 27         [ 4] 3857 	call prt_i16 
      00A5B2 03 CC 97         [ 2] 3858 	ldw x,#words_count_msg
      00A5B5 20 CD 98         [ 4] 3859 	call puts 
      002C59                       3860 	_drop VSIZE 
      00A5B8 56 CF            [ 2]    1     addw sp,#VSIZE 
      00A5BA 00               [ 4] 3861 	ret 
      00A5BB 1A CD 89 CD 27 03 CD  3862 words_count_msg: .asciz " words in dictionary\n"
             89 D4 72 3F 00 1A 72
             5C 00 1B 72 3F 00 1A
             72
                                   3863 
                                   3864 
                                   3865 ;-----------------------------
                                   3866 ; BASIC: TIMER expr 
                                   3867 ; initialize count down timer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



                                   3868 ;-----------------------------
      002C72                       3869 set_timer:
      00A5D1 5C 00 1B         [ 4] 3870 	call arg_list
      00A5D4 72 C7            [ 1] 3871 	cp a,#1 
      00A5D6 00 1A            [ 1] 3872 	jreq 1$
      00A5D8 81 16 A0         [ 2] 3873 	jp syntax_error
      00A5D9                       3874 1$: 
      002C7C                       3875 	_xpop  
      00A5D9 AE 00            [ 1]    1     ld a,(y)
      00A5DB 64               [ 1]    2     ldw x,y 
      00A5DC 90 AE            [ 2]    3     ldw x,(1,x)
      00A5DE 03 E8 20 20      [ 2]    4     addw y,#CELL_SIZE 
      00A5E2 CF 00 12         [ 2] 3876 	ldw timer,x 
      00A5E2 CD               [ 4] 3877 	ret 
                                   3878 
                                   3879 ;------------------------------
                                   3880 ; BASIC: TIMEOUT 
                                   3881 ; return state of timer 
                                   3882 ; output:
                                   3883 ;   A:X     0 not timeout 
                                   3884 ;   A:X     -1 timeout 
                                   3885 ;------------------------------
      002C89                       3886 timeout:
      00A5E3 99 E1 A1         [ 2] 3887 	ldw x,timer 
      00A5E6 02               [ 1] 3888 	clr a 
      00A5E7 27 03            [ 2] 3889 	jra logical_not 
                                   3890 
                                   3891 ;--------------------------------
                                   3892 ; BASIC NOT(expr) 
                                   3893 ; return logical complement of expr
                                   3894 ;--------------------------------
      002C8F                       3895 func_not:
      00A5E9 CC 97 20         [ 4] 3896 	call func_args  
      00A5EC A1 01            [ 1] 3897 	cp a,#1
      00A5EC 90 F6            [ 1] 3898 	jreq 1$
      00A5EE 93 EE 01         [ 2] 3899 	jp syntax_error
      002C99                       3900 1$: _xpop 
      00A5F1 72 A9            [ 1]    1     ld a,(y)
      00A5F3 00               [ 1]    2     ldw x,y 
      00A5F4 03 89            [ 2]    3     ldw x,(1,x)
      00A5F6 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      002CA2                       3901 logical_not: 
      00A5FA 01               [ 1] 3902 	tnz a 
      00A5FB 72 A9            [ 1] 3903 	jrne 2$
      00A5FD 00               [ 2] 3904 	tnzw x 
      00A5FE 03 90            [ 1] 3905 	jrne 2$  
      00A600 93               [ 1] 3906 	cpl a 
      00A601 85               [ 2] 3907 	cplw x  
      00A602 81               [ 4] 3908 	ret 
      00A602 89               [ 1] 3909 2$: clr a 
      00A603 AE               [ 1] 3910 	clrw x 
      00A604 F4               [ 4] 3911 	ret 
                                   3912 
                                   3913 
                                   3914 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3915 ; BASIC: IWDGEN expr1 
                                   3916 ; enable independant watchdog timer
                                   3917 ; expr1 is delay in multiple of 62.5µsec
                                   3918 ; expr1 -> {1..16383}
                                   3919 ;-----------------------------------
      002CAE                       3920 enable_iwdg:
      00A605 24 65 90         [ 4] 3921 	call arg_list
      00A608 A3 7A            [ 1] 3922 	cp a,#1 
      00A60A 12 2B            [ 1] 3923 	jreq 1$
      00A60C 01 5C A0         [ 2] 3924 	jp syntax_error 
      00A60E                       3925 1$: _xpop  
      00A60E 9E C7            [ 1]    1     ld a,(y)
      00A610 53               [ 1]    2     ldw x,y 
      00A611 0D 9F            [ 2]    3     ldw x,(1,x)
      00A613 C7 53 0E 8C      [ 2]    4     addw y,#CELL_SIZE 
      00A617 56 9E            [ 1] 3926 	push #0
      00A619 C7 53 0F 9F      [ 1] 3927 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A61D C7               [ 1] 3928 	ld a,xh 
      00A61E 53 10            [ 1] 3929 	and a,#0x3f
      00A620 72               [ 1] 3930 	ld xh,a  
      00A621 10 53 08         [ 2] 3931 2$:	cpw x,#255
      00A624 72 10            [ 2] 3932 	jrule 3$
      00A626 53 00            [ 1] 3933 	inc (1,sp)
      00A628 72               [ 1] 3934 	rcf 
      00A629 10               [ 2] 3935 	rrcw x 
      00A62A 53 04            [ 2] 3936 	jra 2$
      00A62C 85 CD AA 7D      [ 1] 3937 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A630 72               [ 1] 3938 	pop a  
      00A631 11 53 08         [ 1] 3939 	ld IWDG_PR,a 
      00A634 72               [ 1] 3940 	ld a,xl
      00A635 11               [ 1] 3941 	dec a 
      00A636 53 00 81 E0      [ 1] 3942 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A639 C7 50 E2         [ 1] 3943 	ld IWDG_RLR,a 
      00A639 CD 99 E1 A1      [ 1] 3944 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A63D 02               [ 4] 3945 	ret 
                                   3946 
                                   3947 
                                   3948 ;-----------------------------------
                                   3949 ; BASIC: IWDGREF  
                                   3950 ; refresh independant watchdog count down 
                                   3951 ; timer before it reset MCU. 
                                   3952 ;-----------------------------------
      002CEC                       3953 refresh_iwdg:
      00A63E 27 12 A1 01      [ 1] 3954 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A642 27               [ 4] 3955 	ret 
                                   3956 
                                   3957 
                                   3958 ;-------------------------------------
                                   3959 ; BASIC: LOG(expr)
                                   3960 ; return logarithm base 2 of expr 
                                   3961 ; this is the position of most significant
                                   3962 ; bit set. 
                                   3963 ; input: 
                                   3964 ; output:
                                   3965 ;   A     TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   3966 ;   xstack log2 
                                   3967 ;*********************************
      002CF1                       3968 log2:
      00A643 03 CC 97         [ 4] 3969 	call func_args 
      00A646 20 4F            [ 1] 3970 	cp a,#1 
      00A648 5F 72            [ 1] 3971 	jreq 1$
      00A64A A2 00 03         [ 2] 3972 	jp syntax_error 
      002CFB                       3973 1$: 
      002CFB                       3974 	_xpop    
      00A64D 90 F7            [ 1]    1     ld a,(y)
      00A64F 90               [ 1]    2     ldw x,y 
      00A650 EF 01            [ 2]    3     ldw x,(1,x)
      00A652 90 E6 03 93      [ 2]    4     addw y,#CELL_SIZE 
      00A656 EE               [ 1] 3975 	tnz a
      00A657 04 5D            [ 1] 3976 	jrne 2$ 
      00A659 27               [ 2] 3977 	tnzw x 
      00A65A 25 90            [ 1] 3978 	jrne 2$
      00A65C F6 93            [ 1] 3979 	ld a,#ERR_BAD_VALUE
      00A65E EE 01 72         [ 2] 3980 	jp tb_error 
      00A661 A9 00            [ 1] 3981 2$: push #24 
      00A663 03               [ 2] 3982 3$: rlcw x 
      00A664 72               [ 1] 3983     rlc a 
      00A665 A9 00            [ 1] 3984 	jrc 4$
      00A667 03 9F            [ 1] 3985 	dec (1,sp) 
      00A669 A4 07            [ 1] 3986 	jrne 3$
      00A66B 4E               [ 1] 3987 4$: clrw x 
      00A66C C7               [ 1] 3988     pop a 
      00A66D 54               [ 1] 3989 	dec a
      00A66E 01               [ 1] 3990 	rlwa x  
      002D1D                       3991 9$:	
      00A66F 72               [ 4] 3992 	ret 
                                   3993 
                                   3994 ;-----------------------------------
                                   3995 ; BASIC: BIT(expr) 
                                   3996 ; expr ->{0..23}
                                   3997 ; return 2^expr 
                                   3998 ; output:
                                   3999 ;    A:X    2^expr 
                                   4000 ;-----------------------------------
      002D1E                       4001 bitmask:
      00A670 16 50 CA         [ 4] 4002     call func_args 
      00A673 72 10            [ 1] 4003 	cp a,#1
      00A675 54 01            [ 1] 4004 	jreq 1$
      00A677 AE 00 1B         [ 2] 4005 	jp syntax_error 
      002D28                       4006 1$: _xpop 
      00A67A 5A 9D            [ 1]    1     ld a,(y)
      00A67C 26               [ 1]    2     ldw x,y 
      00A67D FA 20            [ 2]    3     ldw x,(1,x)
      00A67F 08 72 11 54      [ 2]    4     addw y,#CELL_SIZE 
      00A683 01               [ 1] 4007 	ld a,xl 
      00A684 72 17 50         [ 2] 4008 	ldw x,#1 
      00A687 CA 17            [ 1] 4009 	and a,#23
      00A688 27 0A            [ 1] 4010 	jreq 9$
      00A688 81               [ 1] 4011 	push a 
      00A689 4F               [ 1] 4012 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      002D3B                       4013 2$: 
      00A689 CD               [ 2] 4014 	slaw x 
      00A68A 99               [ 1] 4015 	rlc a 	
      00A68B DC A1            [ 1] 4016 	dec (1,sp)
      00A68D 01 27            [ 1] 4017 	jrne 2$ 
      002D41                       4018 4$:
      002D41                       4019     _drop 1 
      00A68F 03 CC            [ 2]    1     addw sp,#1 
      00A691 97               [ 4] 4020 9$:	ret 
                                   4021 
                                   4022 ;------------------------------
                                   4023 ; BASIC: INVERT(expr)
                                   4024 ; 1's complement 
                                   4025 ;--------------------------------
      002D44                       4026 invert:
      00A692 20 90 F6         [ 4] 4027 	call func_args
      00A695 93 EE            [ 1] 4028 	cp a,#1 
      00A697 01 72            [ 1] 4029 	jreq 1$
      00A699 A9 00 03         [ 2] 4030 	jp syntax_error
      002D4E                       4031 1$: _xpop 
      00A69C A3 00            [ 1]    1     ld a,(y)
      00A69E 05               [ 1]    2     ldw x,y 
      00A69F 23 05            [ 2]    3     ldw x,(1,x)
      00A6A1 A6 0A CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A6A5 22               [ 1] 4032 	cpl a 
      00A6A6 9F               [ 2] 4033 	cplw x 
      00A6A7 C7               [ 4] 4034 	ret 
                                   4035 
                                   4036 ;------------------------------
                                   4037 ; BASIC: DO 
                                   4038 ; initiate a DO ... UNTIL loop 
                                   4039 ;------------------------------
                           000003  4040 	DOLP_ADR=3 
                           000005  4041 	DOLP_INW=5
                           000004  4042 	VSIZE=4 
      002D5A                       4043 do_loop:
      00A6A8 00               [ 2] 4044 	popw x 
      002D5B                       4045 	_vars VSIZE 
      00A6A9 0F A6            [ 2]    1     sub sp,#VSIZE 
      00A6AB 05               [ 2] 4046 	pushw x 
      00A6AC C0 00 0F         [ 2] 4047 	ldw x,basicptr 
      00A6AF C7 54            [ 2] 4048 	ldw (DOLP_ADR,sp),x
      00A6B1 00 72 16         [ 2] 4049 	ldw x,in.w 
      00A6B4 54 02            [ 2] 4050 	ldw (DOLP_INW,sp),x
      00A6B6 72 10 54 01      [ 1] 4051 	inc loop_depth 
      00A6BA 72               [ 4] 4052 	ret 
                                   4053 
                                   4054 ;--------------------------------
                                   4055 ; BASIC: UNTIL expr 
                                   4056 ; loop if exprssion is false 
                                   4057 ; else terminate loop
                                   4058 ;--------------------------------
      002D6D                       4059 until: 
      00A6BB 0F 54 00 FB      [ 1] 4060 	tnz loop_depth 
      00A6BF CE 54            [ 1] 4061 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A6C1 04 A6 84         [ 2] 4062 	jp syntax_error 
      002D76                       4063 1$: 
      00A6C4 81 1B 88         [ 4] 4064 	call condition  
      00A6C5                       4065 	_xpop 
      00A6C5 52 01            [ 1]    1     ld a,(y)
      00A6C7 CD               [ 1]    2     ldw x,y 
      00A6C8 99 DC            [ 2]    3     ldw x,(1,x)
      00A6CA A1 01 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A6CE CC               [ 1] 4066 	tnz a 
      00A6CF 97 20            [ 1] 4067 	jrne 9$ 
      00A6D1 90               [ 2] 4068 	tnzw x   
      00A6D2 F6 93            [ 1] 4069 	jrne 9$
      00A6D4 EE 01            [ 2] 4070 	ldw x,(DOLP_ADR,sp)
      00A6D6 72 A9 00         [ 2] 4071 	ldw basicptr,x 
      00A6D9 03 A3            [ 1] 4072 	ld a,(2,x)
      00A6DB 00 0F 23         [ 1] 4073 	ld count,a 
      00A6DE 05 A6            [ 2] 4074 	ldw x,(DOLP_INW,sp)
      00A6E0 0A CC 97         [ 2] 4075 	ldw in.w,x 
      00A6E3 22               [ 4] 4076 	ret 
      002D98                       4077 9$:	; remove loop data from stack  
      00A6E4 CD               [ 2] 4078 	popw x
      002D99                       4079 	_drop VSIZE
      00A6E5 AB C1            [ 2]    1     addw sp,#VSIZE 
      00A6E7 6B 01 E6 01      [ 1] 4080 	dec loop_depth 
      00A6EB 0D               [ 2] 4081 	jp (x)
                                   4082 
                                   4083 ;--------------------------
                                   4084 ; BASIC: PORTA...PORTI  
                                   4085 ;  return constant value 
                                   4086 ;  PORT  base address 
                                   4087 ;---------------------------
      002DA0                       4088 const_porta:
      00A6EC 01 27 05         [ 2] 4089 	ldw x,#PA_BASE 
      00A6EF 44               [ 1] 4090 	clr a 
      00A6F0 0A               [ 4] 4091 	ret 
      002DA5                       4092 const_portb:
      00A6F1 01 26 FB         [ 2] 4093 	ldw x,#PB_BASE 
      00A6F4 A4               [ 1] 4094 	clr a 
      00A6F5 01               [ 4] 4095 	ret 
      002DAA                       4096 const_portc:
      00A6F6 5F 97 4F         [ 2] 4097 	ldw x,#PC_BASE 
      00A6F9 5B               [ 1] 4098 	clr a 
      00A6FA 01               [ 4] 4099 	ret 
      002DAF                       4100 const_portd:
      00A6FB 81 50 0F         [ 2] 4101 	ldw x,#PD_BASE 
      00A6FC 4F               [ 1] 4102 	clr a 
      00A6FC 52               [ 4] 4103 	ret 
      002DB4                       4104 const_porte:
      00A6FD 02 CD 99         [ 2] 4105 	ldw x,#PE_BASE 
      00A700 E1               [ 1] 4106 	clr a 
      00A701 A1               [ 4] 4107 	ret 
      002DB9                       4108 const_portf:
      00A702 02 27 03         [ 2] 4109 	ldw x,#PF_BASE 
      00A705 CC               [ 1] 4110 	clr a 
      00A706 97               [ 4] 4111 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      002DBE                       4112 const_portg:
      00A707 20 90 F6         [ 2] 4113 	ldw x,#PG_BASE 
      00A70A 93               [ 1] 4114 	clr a 
      00A70B EE               [ 4] 4115 	ret 
      002DC3                       4116 const_porth:
      00A70C 01 72 A9         [ 2] 4117 	ldw x,#PH_BASE 
      00A70F 00               [ 1] 4118 	clr a 
      00A710 03               [ 4] 4119 	ret 
      002DC8                       4120 const_porti:
      00A711 9F 6B 02         [ 2] 4121 	ldw x,#PI_BASE 
      00A714 90               [ 1] 4122 	clr a 
      00A715 F6               [ 4] 4123 	ret 
                                   4124 
                                   4125 ;-------------------------------
                                   4126 ; following return constant 
                                   4127 ; related to GPIO register offset 
                                   4128 ;---------------------------------
      002DCD                       4129 const_odr:
      00A716 93               [ 1] 4130 	clr a 
      00A717 EE 01 72         [ 2] 4131 	ldw x,#GPIO_ODR
      00A71A A9               [ 4] 4132 	ret 
      002DD2                       4133 const_idr:
      00A71B 00               [ 1] 4134 	clr a 
      00A71C 03 A3 00         [ 2] 4135 	ldw x,#GPIO_IDR
      00A71F 0F               [ 4] 4136 	ret 
      002DD7                       4137 const_ddr:
      00A720 23               [ 1] 4138 	clr a
      00A721 05 A6 0A         [ 2] 4139 	ldw x,#GPIO_DDR
      00A724 CC               [ 4] 4140 	ret 
      002DDC                       4141 const_cr1:
      00A725 97               [ 1] 4142 	clr a 
      00A726 22 CD AB         [ 2] 4143 	ldw x,#GPIO_CR1
      00A729 C1               [ 4] 4144 	ret 
      002DE1                       4145 const_cr2:
      00A72A 6B               [ 1] 4146 	clr a
      00A72B 01 A6 01         [ 2] 4147 	ldw x,#GPIO_CR2
      00A72E 0D               [ 4] 4148 	ret 
                                   4149 ;-------------------------
                                   4150 ; BASIC: POUT 
                                   4151 ;  constant for port mode
                                   4152 ;  used by PMODE 
                                   4153 ;  to set pin as output
                                   4154 ;------------------------
      002DE6                       4155 const_output:
      00A72F 01               [ 1] 4156 	clr a 
      00A730 27 05 48         [ 2] 4157 	ldw x,#OUTP
      00A733 0A               [ 4] 4158 	ret 
                                   4159 
                                   4160 ;-------------------------
                                   4161 ; BASIC: PINP 
                                   4162 ;  constant for port mode
                                   4163 ;  used by PMODE 
                                   4164 ;  to set pin as input
                                   4165 ;------------------------
      002DEB                       4166 const_input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A734 01               [ 1] 4167 	clr a  
      00A735 26 FB 0D         [ 2] 4168 	ldw x,#INP 
      00A738 02               [ 4] 4169 	ret 
                                   4170 	
                                   4171 ;-----------------------
                                   4172 ; memory area constants
                                   4173 ;-----------------------
      002DF0                       4174 const_eeprom_base:
      00A739 26               [ 1] 4175 	clr a  
      00A73A 05 43 E4         [ 2] 4176 	ldw x,#EEPROM_BASE 
      00A73D 00               [ 4] 4177 	ret 
                                   4178 
                                   4179 ;---------------------------
                                   4180 ; BASIC: DATA 
                                   4181 ; when the interpreter find 
                                   4182 ; a DATA line it skip it.
                                   4183 ;---------------------------
      002DF5                       4184 data:
      00A73E 20 02 EA 00 E7   [ 1] 4185 	mov in,count 
      00A743 00               [ 4] 4186 	ret 
                                   4187 
                                   4188 ;------------------------------
                                   4189 ; check if it is a DATA line 
                                   4190 ; input: 
                                   4191 ;    X    line address 
                                   4192 ; output:
                                   4193 ;    Z    set if DATA line 
                                   4194 ;----------------------------
      002DFB                       4195 is_data_line:
      00A744 5B 02            [ 2] 4196 	ldw x,(4,x)
      00A746 81 33 62         [ 2] 4197 	ldw x,(code_addr,x)
      00A747 A3 2D F5         [ 2] 4198 	cpw x,#data 
      00A747 72               [ 4] 4199 	ret 
                                   4200 
                                   4201 ;---------------------------
                                   4202 ; set DATA pointer at line# 
                                   4203 ; specified by X 
                                   4204 ;---------------------------
      002E04                       4205 data_line:
      00A748 00 00            [ 2] 4206 	pushw y 
      00A74A 23               [ 1] 4207 	clr a 
      00A74B 02 4F 81         [ 4] 4208 	call search_lineno
      00A74E 5D               [ 2] 4209 	tnzw x 
      00A74E AE A7            [ 1] 4210 	jrne 3$
      00A750 75 CD            [ 1] 4211 2$:	ld a,#ERR_NO_LINE 
      00A752 8A 21 5B         [ 2] 4212 	jp tb_error
      002E12                       4213 3$: ; check if valid data line 
      00A755 02 52            [ 1] 4214     ldw y,x 
      00A757 04 CD A0         [ 4] 4215 	call is_data_line 
      00A75A D5 AE            [ 1] 4216 	jrne 2$ 
      002E19                       4217 set_data_ptr: 	
      00A75C 16 68 CF 00      [ 2] 4218 	ldw data_ptr,y
      00A760 05 7F 72         [ 1] 4219 	ld a,(2,y)
      00A763 5F 00 04         [ 1] 4220 	ld data_len,a 
      00A766 5F CF 00 01      [ 1] 4221 	mov data_ofs,#FIRST_DATA_ITEM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A76A 72 11            [ 2] 4222 	popw y 
      00A76C 00               [ 4] 4223 	ret
                                   4224 
                                   4225 ;---------------------------------
                                   4226 ; BASIC: RESTORE [line#]
                                   4227 ; set data_ptr to first data line
                                   4228 ; if no DATA found pointer set to
                                   4229 ; zero.
                                   4230 ; if a line# is given as argument 
                                   4231 ; a data line with that number 
                                   4232 ; is searched and the data pointer 
                                   4233 ; is set to it. If there is no 
                                   4234 ; data line with that number 
                                   4235 ; the program is interrupted. 
                                   4236 ;---------------------------------
      002E2A                       4237 restore:
      00A76D 23 72 18 00      [ 1] 4238 	clr data_ptr 
      00A771 23 CC 97 CB      [ 1] 4239 	clr data_ptr+1
      00A775 0A 62 72 65      [ 1] 4240 	clr data_ofs 
      00A779 61 6B 20 70      [ 1] 4241 	clr data_len
      00A77D 6F 69 6E         [ 4] 4242 	call next_token 
      00A780 74 2C            [ 1] 4243 	cp a,#TK_INTGR
      00A782 20 52            [ 1] 4244 	jrne 0$
      00A784 55 4E 20         [ 4] 4245 	call get_int24 
      00A787 74 6F            [ 2] 4246 	jra data_line 
      002E46                       4247 0$:	
      002E46                       4248 	_unget_token  
      00A789 20 72 65 73 75   [ 1]    1      mov in,in.saved  
      00A78E 6D 65 2E         [ 2] 4249 	ldw x,txtbgn
      00A791 0A 00            [ 2] 4250 	pushw y 
                                   4251 ; search first DATA line 
      00A793                       4252 data_search_loop: 	
      00A793 72 01 00         [ 2] 4253 	cpw x,txtend
      00A796 23 01            [ 1] 4254 	jruge restore_error 
      00A798 81 93            [ 1] 4255 	ldw y,x 
      00A799 CD 2D FB         [ 4] 4256 	call is_data_line 
      00A799 CD 95            [ 1] 4257 	jreq set_data_ptr
      002E5C                       4258 try_next_line: 
      00A79B 7C               [ 1] 4259 	ldw x,y 
      00A79C 81 02            [ 1] 4260 	ld a,(2,x)
      00A79D C7 00 0E         [ 1] 4261 	ld acc8,a 
      00A79D 72 5F 00 19      [ 1] 4262 	clr acc16 
      00A7A1 52 03 CD 98      [ 2] 4263 	addw x,acc16 
      00A7A5 21 A1            [ 2] 4264 	jra data_search_loop
      002E6C                       4265 restore_error:	
      00A7A7 04 27            [ 1] 4266     ld a,#ERR_NO_DATA 
      00A7A9 03 CC 97         [ 2] 4267 	jp tb_error 
                                   4268 
                                   4269 
                                   4270 ;---------------------------------
                                   4271 ; BASIC: READ 
                                   4272 ; return next data item | 0 
                                   4273 ;---------------------------------
                           000001  4274 	CTX_BPTR=1 
                           000003  4275 	CTX_IN=3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                           000004  4276 	CTX_COUNT=4 
                           000005  4277 	INT24=5
                           000007  4278 	VSIZE=7 
      002E71                       4279 read:
      002E71                       4280 	_vars  VSIZE 
      00A7AC 20 CD            [ 2]    1     sub sp,#VSIZE 
      002E73                       4281 read01:	
      00A7AE 98 70 A4         [ 1] 4282 	ld a,data_ofs
      00A7B1 DF A1 45         [ 1] 4283 	cp a,data_len 
      00A7B4 26 0C            [ 1] 4284 	jreq 2$ ; end of line  
      00A7B6 AE 40 00         [ 4] 4285 	call save_context
      00A7B9 CF 00 1A         [ 2] 4286 	ldw x,data_ptr 
      00A7BC AE 47 FF         [ 2] 4287 	ldw basicptr,x 
      00A7BF 4F 20 15 A1 46   [ 1] 4288 	mov in,data_ofs 
      00A7C4 27 06 AE 96 60   [ 1] 4289 	mov count,data_len  
      00A7C9 CC 97 22         [ 4] 4290 	call expression 
      00A7CC A1 84            [ 1] 4291 	cp a,#TK_INTGR 
      00A7CC AE B6            [ 1] 4292 	jreq 1$ 
      00A7CE 80 CF 00         [ 2] 4293 	jp syntax_error 
      002E98                       4294 1$:
      00A7D1 1A A6 02         [ 4] 4295 	call next_token ; skip comma
      00A7D4 AE 7F FF         [ 2] 4296 	ldw x,basicptr 
      00A7D7 CF 00 06         [ 2] 4297 	ldw data_ptr,x 
      00A7D7 6B 01 1F 02 CD   [ 1] 4298 	mov data_ofs,in 
      00A7DC 87 C2 65         [ 4] 4299 	call rest_context
      00A7DE                       4300 	_xpop 
      00A7DE CD 89            [ 1]    1     ld a,(y)
      00A7E0 44               [ 1]    2     ldw x,y 
      00A7E1 27 08            [ 2]    3     ldw x,(1,x)
      00A7E3 A6 45 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      002EB2                       4301 	_drop VSIZE 
      00A7E7 C4 CD            [ 2]    1     addw sp,#VSIZE 
      00A7E9 88               [ 4] 4302 	ret 
      002EB5                       4303 2$: ; end of line reached 
      00A7EA 40 AE 00 80      [ 2] 4304 	ldw y, data_ptr 
      00A7EE CD 89 36 7B      [ 1] 4305 	clr data_ptr
      00A7F2 01 1E 02 72      [ 1] 4306 	clr data_ptr+1   
      00A7F6 B0 00 1A C2      [ 1] 4307 	clr data_ofs 
      00A7FA 00 19 22 E0      [ 1] 4308 	clr data_len 
      00A7FE CD 95 7C         [ 4] 4309 	call try_next_line 
      00A801 1E 02            [ 2] 4310 	jra read01
                                   4311 
                                   4312 
                                   4313 ;---------------------------------
                                   4314 ; BASIC: SPIEN clkdiv, 0|1  
                                   4315 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4316 ; if clkdiv==-1 disable SPI
                                   4317 ; 0|1 -> disable|enable  
                                   4318 ;--------------------------------- 
                           000005  4319 SPI_CS_BIT=5
      002ECE                       4320 spi_enable:
      00A803 A3 47 FF         [ 4] 4321 	call arg_list 
      00A806 26 03            [ 1] 4322 	cp a,#2
      00A808 CD 9D            [ 1] 4323 	jreq 1$
      00A80A 98 16 A0         [ 2] 4324 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A80B                       4325 1$: 
      00A80B 5B 03 81 C7      [ 1] 4326 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A80E 85               [ 2] 4327 	popw x  
      00A80E CE               [ 2] 4328 	tnzw x 
      00A80F B6 80            [ 1] 4329 	jreq spi_disable 
      00A811 C3               [ 2] 4330 	popw x 
      00A812 A8 CE            [ 1] 4331 	ld a,#(1<<SPI_CR1_BR)
      00A814 81               [ 4] 4332 	mul x,a 
      00A815 9F               [ 1] 4333 	ld a,xl 
      00A815 88 4D 27         [ 1] 4334 	ld SPI_CR1,a 
                                   4335 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A818 0A F6 5C 90      [ 1] 4336 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A81C F7 90 5C 0A      [ 1] 4337 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4338 ; configure SPI as master mode 0.	
      00A820 01 26 F6 84      [ 1] 4339 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4340 ; ~CS line controlled by sofware 	
      00A824 81 12 52 01      [ 1] 4341 	bset SPI_CR2,#SPI_CR2_SSM 
      00A825 72 10 52 01      [ 1] 4342     bset SPI_CR2,#SPI_CR2_SSI 
                                   4343 ; enable SPI
      00A825 88 90 AE 16      [ 1] 4344 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A829 B8               [ 4] 4345 	ret 
      002F01                       4346 spi_disable:
      002F01                       4347 	_drop #2; throw first argument.
      00A82A 90 89            [ 2]    1     addw sp,##2 
                                   4348 ; wait spi idle 
      00A82C A6 80            [ 1] 4349 1$:	ld a,#0x82 
      00A82E 90 7F 90         [ 1] 4350 	and a,SPI_SR
      00A831 5C 4A            [ 1] 4351 	cp a,#2 
      00A833 26 F9            [ 1] 4352 	jrne 1$
      00A835 90 85 84 81      [ 1] 4353 	bres SPI_CR1,#SPI_CR1_SPE
      00A839 72 13 50 C7      [ 1] 4354 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A839 89 90 89 52      [ 1] 4355 	bres PE_DDR,#SPI_CS_BIT 
      00A83D 06               [ 4] 4356 	ret 
                                   4357 
      002F19                       4358 spi_clear_error:
      00A83E CD A8            [ 1] 4359 	ld a,#0x78 
      00A840 0E 26 09         [ 1] 4360 	bcp a,SPI_SR 
      00A843 AE A8            [ 1] 4361 	jreq 1$
      00A845 D0 CD 8A 21      [ 1] 4362 	clr SPI_SR 
      00A849 CC               [ 4] 4363 1$: ret 
                                   4364 
      002F25                       4365 spi_send_byte:
      00A84A A8               [ 1] 4366 	push a 
      00A84B C8 2F 19         [ 4] 4367 	call spi_clear_error
      00A84C 84               [ 1] 4368 	pop a 
      00A84C CE 00 1C C3 00   [ 2] 4369 	btjf SPI_SR,#SPI_SR_TXE,.
      00A851 1E 25 09         [ 1] 4370 	ld SPI_DR,a
      00A854 AE A9 12 CD 8A   [ 2] 4371 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A859 21 CC A8         [ 1] 4372 	ld a,SPI_DR 
      00A85C C8               [ 4] 4373 	ret 
                                   4374 
      00A85D                       4375 spi_rcv_byte:
      00A85D CD 88            [ 1] 4376 	ld a,#255
      00A85F 02 72 5F 00 19   [ 2] 4377 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A864 AE B6 80         [ 1] 4378 	ld a,SPI_DR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A867 CF               [ 4] 4379 	ret
                                   4380 
                                   4381 ;------------------------------
                                   4382 ; BASIC: SPIWR byte [,byte]
                                   4383 ; write 1 or more byte
                                   4384 ;------------------------------
      002F46                       4385 spi_write:
      00A868 00 1A CD         [ 4] 4386 	call expression
      00A86B 9E B4            [ 1] 4387 	cp a,#TK_INTGR 
      00A86D 1F 05            [ 1] 4388 	jreq 1$
      00A86F 0F 03 CD         [ 2] 4389 	jp syntax_error 
      002F50                       4390 1$:	
      00A872 A8               [ 1] 4391 	ld a,xl 
      00A873 25 CE A8         [ 4] 4392 	call spi_send_byte 
      00A876 CE 90 FF         [ 4] 4393 	call next_token 
      00A879 72 A9            [ 1] 4394 	cp a,#TK_COMMA 
      00A87B 00 02            [ 1] 4395 	jrne 2$ 
      00A87D 1E 05            [ 2] 4396 	jra spi_write 
      00A87F 90               [ 1] 4397 2$:	tnz a 
      00A880 FF 72            [ 1] 4398 	jreq 3$
      002F60                       4399 	_unget_token  
      00A882 A9 00 02 A6 7C   [ 1]    1      mov in,in.saved  
      00A887 6B               [ 4] 4400 3$:	ret 
                                   4401 
                                   4402 
                                   4403 ;-------------------------------
                                   4404 ; BASIC: SPIRD 	
                                   4405 ; read one byte from SPI 
                                   4406 ;-------------------------------
      002F66                       4407 spi_read:
      00A888 04 A3 00         [ 4] 4408 	call spi_rcv_byte 
      00A88B 7C               [ 1] 4409 	clrw x 
      00A88C 22               [ 1] 4410 	ld xl,a 
      00A88D 01               [ 1] 4411 	clr a  
      00A88E 9F               [ 4] 4412 	ret 
                                   4413 
                                   4414 ;------------------------------
                                   4415 ; BASIC: SPISEL 0|1 
                                   4416 ; set state of ~CS line
                                   4417 ; 0|1 deselect|select  
                                   4418 ;------------------------------
      002F6D                       4419 spi_select:
      00A88F 6B 04 CE         [ 4] 4420 	call next_token 
      00A892 00 1C            [ 1] 4421 	cp a,#TK_INTGR 
      00A894 1F 01            [ 1] 4422 	jreq 1$
      00A896 CC 16 A0         [ 2] 4423 	jp syntax_error 
      00A896 1E               [ 2] 4424 1$: tnzw x  
      00A897 01 7B            [ 1] 4425 	jreq cs_high 
      00A899 04 CD A8 15      [ 1] 4426 	bres PE_ODR,#SPI_CS_BIT
      00A89D 1F               [ 4] 4427 	ret 
      002F7F                       4428 cs_high: 
      00A89E 01 AE 16 B8      [ 1] 4429 	bset PE_ODR,#SPI_CS_BIT
      00A8A2 CD               [ 4] 4430 	ret 
                                   4431 
                                   4432 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4433 ; BASIC: PAD 
                                   4434 ; Return pad buffer address.
                                   4435 ;------------------------------
      002F84                       4436 pad_ref:
      00A8A3 88 1C AE         [ 2] 4437 	ldw x,#pad 
      00A8A6 00               [ 1] 4438 	clr a
      00A8A7 80               [ 4] 4439 	ret 
                                   4440 
                                   4441 
                                   4442 ;------------------------------
                                   4443 ; logical operators dictonary 
                                   4444 ; format:
                                   4445 ;    link: 2 bytes 
                                   4446 ;    name_length: 1 byte 
                                   4447 ;    op_name: 4 char max 
                                   4448 ;    op_id: # byte
                                   4449 ;-------------------------------
                                   4450 	.macro _op_entry len,name,id 
                                   4451 	.word OP_LINK 
                                   4452 	OP_LINK=.
                                   4453 name:
                                   4454 	.byte len 
                                   4455 	.asciz "name" 
                                   4456 	.byte  id 
                                   4457 	.endm 
                                   4458 
                           000000  4459 	OP_LINK=0 
      002F89                       4460 op_end:
      002F89                       4461 	_op_entry 3,XOR,TK_XOR 
      00A8A8 CD 89                    1 	.word OP_LINK 
                           002F8B     2 	OP_LINK=.
      002F8B                          3 XOR:
      00A8AA 36                       4 	.byte 3 
      00A8AB 1E 01 C3 00              5 	.asciz "XOR" 
      00A8AF 1E                       6 	.byte  TK_XOR 
      002F91                       4462 	_op_entry 2,OR,TK_OR 
      00A8B0 24 16                    1 	.word OP_LINK 
                           002F93     2 	OP_LINK=.
      002F93                          3 OR:
      00A8B2 1E                       4 	.byte 2 
      00A8B3 05 72 F0                 5 	.asciz "OR" 
      00A8B6 03                       6 	.byte  TK_OR 
      002F98                       4463 op_dict:	
      002F98                       4464 	_op_entry 3,AND,TK_AND 
      00A8B7 1F 05                    1 	.word OP_LINK 
                           002F9A     2 	OP_LINK=.
      002F9A                          3 AND:
      00A8B9 A6                       4 	.byte 3 
      00A8BA 80 A3 00 80              5 	.asciz "AND" 
      00A8BE 24                       6 	.byte  TK_AND 
                                   4465 
                                   4466 ;------------------------------
                                   4467 ;  search operator dictonary 
                                   4468 ;  input:
                                   4469 ;     x    *name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



                                   4470 ;  output:
                                   4471 ;     A     op_id | 0 
                                   4472 ;-----------------------------
                           000001  4473 	NLEN=1 
                           000002  4474 	NAME=2
                           000004  4475 	XSAVE=4
                           000005  4476 	VSIZE=5 
      002FA0                       4477 search_op_dict:
      002FA0                       4478 	_vars VSIZE 
      00A8BF 01 9F            [ 2]    1     sub sp,#VSIZE 
      00A8C1 6B 04            [ 2] 4479 	ldw (NAME,sp),x 
      00A8C3 CD A8 25         [ 4] 4480 	call strlen 
      00A8C6 20 CE            [ 1] 4481 	ld (NLEN,sp),a 
      00A8C8 5B 06 90         [ 2] 4482 	ldw x,#op_dict+2
      00A8CB 85 85            [ 2] 4483 1$:	ldw (XSAVE,sp),x 
      00A8CD 81               [ 1] 4484 	ld a,(x)
      00A8CE 42 43            [ 1] 4485 	cp a,(NLEN,sp)
      00A8D0 43 61            [ 1] 4486 	jreq 3$
                                   4487 ; skip over this one 	
      00A8D2 6E 27            [ 2] 4488 2$:	ldw x,(XSAVE,sp)
      00A8D4 74 20 66         [ 2] 4489 	subw x,#2 
      00A8D7 6C               [ 2] 4490 	ldw x,(x) ; link 
      00A8D8 61 73            [ 1] 4491 	jreq 8$ 
      00A8DA 68 20            [ 2] 4492 	jra 1$
      002FBD                       4493 3$: ; len good compare string 
      00A8DC 61               [ 1] 4494 	incw x  
      00A8DD 70 70            [ 2] 4495 	ldw y,(NAME,sp)
      00A8DF 6C 69 63         [ 4] 4496 	call strcmp 
      00A8E2 61 74            [ 1] 4497 	jreq 2$ 
                                   4498 ; found 
      00A8E4 69 6F            [ 2] 4499 	ldw x,(XSAVE,sp)
                                   4500 ; skip to id field 
      00A8E6 6E               [ 1] 4501 	ld a,(x) ; len field 
      00A8E7 2C 20            [ 1] 4502 	add a,#2 ; len and 0 at end of string 
      00A8E9 61               [ 1] 4503 	push a 
      00A8EA 6C 72            [ 1] 4504 	push #0 
      00A8EC 65 61 64         [ 2] 4505 	addw x,(1,sp)
      002FD0                       4506 	_drop 2 
      00A8EF 79 20            [ 2]    1     addw sp,#2 
      00A8F1 6F               [ 1] 4507 	ld a,(x)
      00A8F2 6E 65            [ 2] 4508 	jra 9$ 
      002FD5                       4509 8$: ; not found 	
      00A8F4 20               [ 1] 4510 	clr a 	
      002FD6                       4511 9$:	_drop VSIZE 
      00A8F5 69 6E            [ 2]    1     addw sp,#VSIZE 
      00A8F7 20               [ 4] 4512 	ret 
                                   4513 
                                   4514 
                                   4515 ;------------------------------
                                   4516 ;      dictionary 
                                   4517 ; format:
                                   4518 ;   link:   2 bytes 
                                   4519 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4520 ;   cmd_name: 16 byte max 
                                   4521 ;   cmd_index: 2 bytes 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



                                   4522 ;------------------------------
                                   4523 	.macro _dict_entry len,name,cmd_idx 
                                   4524 	.word LINK 
                                   4525 	LINK=.
                                   4526 name:
                                   4527 	.byte len 	
                                   4528 	.ascii "name"
                                   4529 	.word cmd_idx 
                                   4530 	.endm 
                                   4531 
                           000000  4532 	LINK=0
                                   4533 ; respect alphabetic order for BASIC names from Z-A
                                   4534 ; this sort order is for a cleaner WORDS cmd output. 	
      002FD9                       4535 kword_end:
      002FD9                       4536 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A8F8 46 4C                    1 	.word LINK 
                           002FDB     2 	LINK=.
      002FDB                          3 WRITE:
      00A8FA 41                       4 	.byte 5 	
      00A8FB 53 48 0A 75 73           5 	.ascii "WRITE"
      00A900 65 20                    6 	.word WRITE_IDX 
      002FE3                       4537 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A902 45 52                    1 	.word LINK 
                           002FE5     2 	LINK=.
      002FE5                          3 WORDS:
      00A904 41                       4 	.byte 5 	
      00A905 53 45 20 5C 46           5 	.ascii "WORDS"
      00A90A 20 62                    6 	.word WORDS_IDX 
      002FED                       4538 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A90C 65 66                    1 	.word LINK 
                           002FEF     2 	LINK=.
      002FEF                          3 WAIT:
      00A90E 6F                       4 	.byte 4 	
      00A90F 72 65 00 4E              5 	.ascii "WAIT"
      00A913 6F 20                    6 	.word WAIT_IDX 
      002FF6                       4539 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A915 61 70                    1 	.word LINK 
                           002FF8     2 	LINK=.
      002FF8                          3 USR:
      00A917 70                       4 	.byte 3+F_IFUNC 	
      00A918 6C 69 63                 5 	.ascii "USR"
      00A91B 61 74                    6 	.word USR_IDX 
      002FFE                       4540 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A91D 69 6F                    1 	.word LINK 
                           003000     2 	LINK=.
      003000                          3 UNTIL:
      00A91F 6E                       4 	.byte 5 	
      00A920 20 69 6E 20 52           5 	.ascii "UNTIL"
      00A925 41 4D                    6 	.word UNTIL_IDX 
      003008                       4541 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A927 00 00                    1 	.word LINK 
                           00300A     2 	LINK=.
      00A928                          3 UFLASH:
      00A928 CD                       4 	.byte 6+F_IFUNC 	
      00A929 9B 03 A1 84 27 03        5 	.ascii "UFLASH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A92F CC 97                    6 	.word UFLASH_IDX 
      003013                       4542 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A931 20 90                    1 	.word LINK 
                           003015     2 	LINK=.
      003015                          3 UBOUND:
      00A933 F6                       4 	.byte 6+F_IFUNC 	
      00A934 93 EE 01 72 A9 00        5 	.ascii "UBOUND"
      00A93A 03 C7                    6 	.word UBOUND_IDX 
      00301E                       4543 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A93C 00 19                    1 	.word LINK 
                           003020     2 	LINK=.
      003020                          3 TONE:
      00A93E CF                       4 	.byte 4 	
      00A93F 00 1A 4E 45              5 	.ascii "TONE"
      00A941 00 A8                    6 	.word TONE_IDX 
      003027                       4544 	_dict_entry,2,TO,TO_IDX;to
      00A941 CD 98                    1 	.word LINK 
                           003029     2 	LINK=.
      003029                          3 TO:
      00A943 21                       4 	.byte 2 	
      00A944 A1 08                    5 	.ascii "TO"
      00A946 27 02                    6 	.word TO_IDX 
      00302E                       4545 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A948 20 20                    1 	.word LINK 
                           003030     2 	LINK=.
      003030                          3 TIMER:
      00A94A CD                       4 	.byte 5 	
      00A94B 9B 03 A1 84 27           5 	.ascii "TIMER"
      00A950 03 CC                    6 	.word TIMER_IDX 
      003038                       4546 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A952 97 20                    1 	.word LINK 
                           00303A     2 	LINK=.
      00303A                          3 TIMEOUT:
      00A954 90                       4 	.byte 7+F_IFUNC 	
      00A955 F6 93 EE 01 72 A9 00     5 	.ascii "TIMEOUT"
      00A95C 03 9F                    6 	.word TMROUT_IDX 
      003044                       4547 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A95E 5F CD                    1 	.word LINK 
                           003046     2 	LINK=.
      003046                          3 TICKS:
      00A960 88                       4 	.byte 5+F_IFUNC 	
      00A961 66 AE 00 01 CD           5 	.ascii "TICKS"
      00A966 89 36                    6 	.word TICKS_IDX 
      00304E                       4548 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A968 20 D7                    1 	.word LINK 
                           003050     2 	LINK=.
      00A96A                          3 STOP:
      00A96A 81                       4 	.byte 4 	
      00A96B 53 54 4F 50              5 	.ascii "STOP"
      00A96B CD 99                    6 	.word STOP_IDX 
      003057                       4549 	_dict_entry,4,STEP,STEP_IDX;step 
      00A96D DC A1                    1 	.word LINK 
                           003059     2 	LINK=.
      003059                          3 STEP:
      00A96F 01                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00A970 27 03 CC 97              5 	.ascii "STEP"
      00A974 20 90                    6 	.word STEP_IDX 
      003060                       4550 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A976 F6 93                    1 	.word LINK 
                           003062     2 	LINK=.
      003062                          3 SPIWR:
      00A978 EE                       4 	.byte 5 	
      00A979 01 72 A9 00 03           5 	.ascii "SPIWR"
      00A97E 9F A4                    6 	.word SPIWR_IDX 
      00306A                       4551 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A980 7F 81                    1 	.word LINK 
                           00306C     2 	LINK=.
      00A982                          3 SPISEL:
      00A982 A6                       4 	.byte 6 	
      00A983 06 CD 99 CF CD 98        5 	.ascii "SPISEL"
      00A989 21 A1                    6 	.word SPISEL_IDX 
      003075                       4552 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A98B 02 27                    1 	.word LINK 
                           003077     2 	LINK=.
      003077                          3 SPIRD:
      00A98D 0E                       4 	.byte 5+F_IFUNC 	
      00A98E A1 04 27 12 A1           5 	.ascii "SPIRD"
      00A993 82 27                    6 	.word SPIRD_IDX 
      00307F                       4553 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A995 03 CC                    1 	.word LINK 
                           003081     2 	LINK=.
      003081                          3 SPIEN:
      00A997 97                       4 	.byte 5 	
      00A998 20 50 49 45 4E           5 	.ascii "SPIEN"
      00A999 00 96                    6 	.word SPIEN_IDX 
      003089                       4554 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A999 FD 20                    1 	.word LINK 
                           00308B     2 	LINK=.
      00308B                          3 SLEEP:
      00A99B 0B                       4 	.byte 5 	
      00A99C 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A99C F6 88                    6 	.word SLEEP_IDX 
      003093                       4555     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A99E CD 98                    1 	.word LINK 
                           003095     2 	LINK=.
      003095                          3 SIZE:
      00A9A0 47                       4 	.byte 4 	
      00A9A1 84 20 03 45              5 	.ascii "SIZE"
      00A9A4 00 B8                    6 	.word SIZE_IDX 
      00309C                       4556 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A9A4 CD 98                    1 	.word LINK 
                           00309E     2 	LINK=.
      00309E                          3 SAVE:
      00A9A6 70                       4 	.byte 4 	
      00A9A7 5F 02 72 A2              5 	.ascii "SAVE"
      00A9AB 00 03                    6 	.word SAVE_IDX 
      0030A5                       4557 	_dict_entry 3,RUN,RUN_IDX;run
      00A9AD 90 F7                    1 	.word LINK 
                           0030A7     2 	LINK=.
      0030A7                          3 RUN:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9AF 90                       4 	.byte 3 	
      00A9B0 EF 01 A6                 5 	.ascii "RUN"
      00A9B3 07 CD                    6 	.word RUN_IDX 
      0030AD                       4558 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A9B5 99 CF                    1 	.word LINK 
                           0030AF     2 	LINK=.
      00A9B7                          3 RSHIFT:
      00A9B7 90                       4 	.byte 6+F_IFUNC 	
      00A9B8 F6 93 EE 01 72 A9        5 	.ascii "RSHIFT"
      00A9BE 00 03                    6 	.word RSHIFT_IDX 
      0030B8                       4559 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A9C0 81 AF                    1 	.word LINK 
                           0030BA     2 	LINK=.
      00A9C1                          3 RND:
      00A9C1 CD                       4 	.byte 3+F_IFUNC 	
      00A9C2 89 D4 81                 5 	.ascii "RND"
      00A9C5 00 8A                    6 	.word RND_IDX 
      0030C0                       4560 	_dict_entry,6,RETURN,RET_IDX;return 
      00A9C5 5F C6                    1 	.word LINK 
                           0030C2     2 	LINK=.
      0030C2                          3 RETURN:
      00A9C7 00                       4 	.byte 6 	
      00A9C8 2F C0 00 30 27 03        5 	.ascii "RETURN"
      00A9CE 53 A6                    6 	.word RET_IDX 
      0030CB                       4561 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A9D0 FF C2                    1 	.word LINK 
                           0030CD     2 	LINK=.
      00A9D1                          3 RESTORE:
      00A9D1 81                       4 	.byte 7 	
      00A9D2 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
      00A9D2 CD 99                    6 	.word REST_IDX 
      0030D7                       4562 	_dict_entry 3,REM,REM_IDX;remark 
      00A9D4 DC A1                    1 	.word LINK 
                           0030D9     2 	LINK=.
      0030D9                          3 REM:
      00A9D6 02                       4 	.byte 3 	
      00A9D7 27 03 CC                 5 	.ascii "REM"
      00A9DA 97 20                    6 	.word REM_IDX 
      0030DF                       4563 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A9DC 90 E6                    1 	.word LINK 
                           0030E1     2 	LINK=.
      0030E1                          3 REBOOT:
      00A9DE 03                       4 	.byte 6 	
      00A9DF 93 EE 04 A3 50 00        5 	.ascii "REBOOT"
      00A9E5 2B 16                    6 	.word RBT_IDX 
      0030EA                       4564 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A9E7 A3 50                    1 	.word LINK 
                           0030EC     2 	LINK=.
      0030EC                          3 READ:
      00A9E9 29                       4 	.byte 4+F_IFUNC 	
      00A9EA 2A 11 89 90              5 	.ascii "READ"
      00A9EE F6 93                    6 	.word READ_IDX 
      0030F3                       4565 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A9F0 EE 01                    1 	.word LINK 
                           0030F5     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      0030F5                          3 QKEY:
      00A9F2 72                       4 	.byte 4+F_IFUNC 	
      00A9F3 A9 00 03 72              5 	.ascii "QKEY"
      00A9F7 FB 01                    6 	.word QKEY_IDX 
      0030FC                       4566 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A9F9 5B 02                    1 	.word LINK 
                           0030FE     2 	LINK=.
      0030FE                          3 PORTI:
      00A9FB 4F                       4 	.byte 5+F_IFUNC 	
      00A9FC 81 4F 52 54 49           5 	.ascii "PORTI"
      00A9FD 00 7C                    6 	.word PRTI_IDX 
      003106                       4567 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A9FD A6 0A                    1 	.word LINK 
                           003108     2 	LINK=.
      003108                          3 PORTH:
      00A9FF CC                       4 	.byte 5+F_IFUNC 	
      00AA00 97 22 52 54 48           5 	.ascii "PORTH"
      00AA02 00 7A                    6 	.word PRTH_IDX 
      003110                       4568 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00AA02 CE B6                    1 	.word LINK 
                           003112     2 	LINK=.
      003112                          3 PORTG:
      00AA04 80                       4 	.byte 5+F_IFUNC 	
      00AA05 A3 10 93 27 08           5 	.ascii "PORTG"
      00AA0A CE B6                    6 	.word PRTG_IDX 
      00311A                       4569 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00AA0C 82 1C                    1 	.word LINK 
                           00311C     2 	LINK=.
      00311C                          3 PORTF:
      00AA0E B6                       4 	.byte 5+F_IFUNC 	
      00AA0F 84 20 03 AE B6           5 	.ascii "PORTF"
      00AA14 80 4F                    6 	.word PRTF_IDX 
      003124                       4570 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00AA16 81 1C                    1 	.word LINK 
                           003126     2 	LINK=.
      00AA17                          3 PORTE:
      00AA17 89                       4 	.byte 5+F_IFUNC 	
      00AA18 90 89 CD 99 DC           5 	.ascii "PORTE"
      00AA1D A1 01                    6 	.word PRTE_IDX 
      00312E                       4571 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00AA1F 27 07                    1 	.word LINK 
                           003130     2 	LINK=.
      003130                          3 PORTD:
      00AA21 A1                       4 	.byte 5+F_IFUNC 	
      00AA22 02 27 03 CC 97           5 	.ascii "PORTD"
      00AA27 20 88                    6 	.word PRTD_IDX 
      003138                       4572 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00AA29 90 F6                    1 	.word LINK 
                           00313A     2 	LINK=.
      00313A                          3 PORTC:
      00AA2B 93                       4 	.byte 5+F_IFUNC 	
      00AA2C EE 01 72 A9 00           5 	.ascii "PORTC"
      00AA31 03 90                    6 	.word PRTC_IDX 
      003142                       4573 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00AA33 93 84                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           003144     2 	LINK=.
      003144                          3 PORTB:
      00AA35 A1                       4 	.byte 5+F_IFUNC 	
      00AA36 01 27 0A 90 F6           5 	.ascii "PORTB"
      00AA3B 93 EE                    6 	.word PRTB_IDX 
      00314C                       4574 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00AA3D 01 72                    1 	.word LINK 
                           00314E     2 	LINK=.
      00314E                          3 PORTA:
      00AA3F A9                       4 	.byte 5+F_IFUNC 	
      00AA40 00 03 51 90 FD           5 	.ascii "PORTA"
      00AA45 88 90                    6 	.word PRTA_IDX 
      003156                       4575 	_dict_entry 5,PRINT,PRT_IDX;print 
      00AA47 9F 72                    1 	.word LINK 
                           003158     2 	LINK=.
      003158                          3 PRINT:
      00AA49 A2                       4 	.byte 5 	
      00AA4A 00 03 90 F7 90           5 	.ascii "PRINT"
      00AA4F EF 01                    6 	.word PRT_IDX 
      003160                       4576 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00AA51 84 90                    1 	.word LINK 
                           003162     2 	LINK=.
      003162                          3 POUT:
      00AA53 85                       4 	.byte 4+F_IFUNC 	
      00AA54 85 81 55 54              5 	.ascii "POUT"
      00AA56 00 68                    6 	.word POUT_IDX 
      003169                       4577 	_dict_entry,4,POKE,POKE_IDX;poke 
      00AA56 72 0D                    1 	.word LINK 
                           00316B     2 	LINK=.
      00316B                          3 POKE:
      00AA58 52                       4 	.byte 4 	
      00AA59 30 FB 8E CC              5 	.ascii "POKE"
      00AA5D 81 43                    6 	.word POKE_IDX 
      00AA5F                       4578 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00AA5F 72 0D                    1 	.word LINK 
                           003174     2 	LINK=.
      003174                          3 PMODE:
      00AA61 52                       4 	.byte 5 	
      00AA62 30 FB 72 16 00           5 	.ascii "PMODE"
      00AA67 23 8E                    6 	.word PMODE_IDX 
      00317C                       4579 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00AA69 81 74                    1 	.word LINK 
                           00317E     2 	LINK=.
      00AA6A                          3 PINP:
      00AA6A CD                       4 	.byte 4+F_IFUNC 	
      00AA6B 9B 03 A1 84              5 	.ascii "PINP"
      00AA6F 27 03                    6 	.word PINP_IDX 
      003185                       4580 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00AA71 CC 97                    1 	.word LINK 
                           003187     2 	LINK=.
      003187                          3 PEEK:
      00AA73 20                       4 	.byte 4+F_IFUNC 	
      00AA74 90 F6 93 EE              5 	.ascii "PEEK"
      00AA78 01 72                    6 	.word PEEK_IDX 
      00318E                       4581 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AA7A A9 00                    1 	.word LINK 
                           003190     2 	LINK=.
      003190                          3 PAUSE:
      00AA7C 03                       4 	.byte 5 	
      00AA7D 50 41 55 53 45           5 	.ascii "PAUSE"
      00AA7D CF 00                    6 	.word PAUSE_IDX 
      003198                       4582 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AA7F 13 CE                    1 	.word LINK 
                           00319A     2 	LINK=.
      00319A                          3 PAD:
      00AA81 00                       4 	.byte 3+F_IFUNC 	
      00AA82 13 5D 27                 5 	.ascii "PAD"
      00AA85 03 8F                    6 	.word PAD_IDX 
      0031A0                       4583 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA87 26 F7                    1 	.word LINK 
                           0031A2     2 	LINK=.
      0031A2                          3 ON:
      00AA89 4F                       4 	.byte 2 	
      00AA8A 81 4E                    5 	.ascii "ON"
      00AA8B 00 BA                    6 	.word ON_IDX 
      0031A7                       4584 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA8B CD 9B                    1 	.word LINK 
                           0031A9     2 	LINK=.
      0031A9                          3 ODR:
      00AA8D 03                       4 	.byte 3+F_IFUNC 	
      00AA8E A1 84 27                 5 	.ascii "ODR"
      00AA91 03 CC                    6 	.word ODR_IDX 
      0031AF                       4585 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00AA93 97 20                    1 	.word LINK 
                           0031B1     2 	LINK=.
      0031B1                          3 NOT:
      00AA95 90                       4 	.byte 3+F_IFUNC 	
      00AA96 F6 93 EE                 5 	.ascii "NOT"
      00AA99 01 72                    6 	.word NOT_IDX 
      0031B7                       4586 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA9B A9 00                    1 	.word LINK 
                           0031B9     2 	LINK=.
      0031B9                          3 NEXT:
      00AA9D 03                       4 	.byte 4 	
      00AA9E 4E 45 58 54              5 	.ascii "NEXT"
      00AA9E A3 14                    6 	.word NEXT_IDX 
      0031C0                       4587 	_dict_entry,3,NEW,NEW_IDX;new
      00AAA0 00 2B                    1 	.word LINK 
                           0031C2     2 	LINK=.
      0031C2                          3 NEW:
      00AAA2 0C                       4 	.byte 3 	
      00AAA3 35 0F 50                 5 	.ascii "NEW"
      00AAA6 F2 A6                    6 	.word NEW_IDX 
      0031C8                       4588 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AAA8 1E 62                    1 	.word LINK 
                           0031CA     2 	LINK=.
      0031CA                          3 LSHIFT:
      00AAAA A6                       4 	.byte 6+F_IFUNC 	
      00AAAB 10 62 20 1E 46 54        5 	.ascii "LSHIFT"
      00AAAF 00 52                    6 	.word LSHIFT_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      0031D3                       4589 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AAAF A3 08                    1 	.word LINK 
                           0031D5     2 	LINK=.
      0031D5                          3 LOG:
      00AAB1 00                       4 	.byte 3+F_IFUNC 	
      00AAB2 2B 09 35                 5 	.ascii "LOG"
      00AAB5 0E 50                    6 	.word LOG_IDX 
      0031DB                       4590 	_dict_entry 4,LIST,LIST_IDX;list
      00AAB7 F2 A6                    1 	.word LINK 
                           0031DD     2 	LINK=.
      0031DD                          3 LIST:
      00AAB9 50                       4 	.byte 4 	
      00AABA 62 20 10 54              5 	.ascii "LIST"
      00AABD 00 4E                    6 	.word LIST_IDX 
      0031E4                       4591 	_dict_entry 3,LET,LET_IDX;let 
      00AABD 35 07                    1 	.word LINK 
                           0031E6     2 	LINK=.
      0031E6                          3 LET:
      00AABF 50                       4 	.byte 3 	
      00AAC0 F2 45 54                 5 	.ascii "LET"
      00AAC1 00 4C                    6 	.word LET_IDX 
      0031EC                       4592 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AAC1 A3 00                    1 	.word LINK 
                           0031EE     2 	LINK=.
      0031EE                          3 KEY:
      00AAC3 40                       4 	.byte 3+F_CFUNC 	
      00AAC4 23 07 72                 5 	.ascii "KEY"
      00AAC7 5C 50                    6 	.word KEY_IDX 
      0031F4                       4593 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AAC9 F2 54                    1 	.word LINK 
                           0031F6     2 	LINK=.
      0031F6                          3 IWDGREF:
      00AACB 20                       4 	.byte 7 	
      00AACC F4 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AACD 00 48                    6 	.word IWDGREF_IDX 
      003200                       4594 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AACD 9F 4A                    1 	.word LINK 
                           003202     2 	LINK=.
      003202                          3 IWDGEN:
      00AACF 27                       4 	.byte 6 	
      00AAD0 01 4A 44 47 45 4E        5 	.ascii "IWDGEN"
      00AAD2 00 46                    6 	.word IWDGEN_IDX 
      00320B                       4595 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AAD2 A4 3E                    1 	.word LINK 
                           00320D     2 	LINK=.
      00320D                          3 INVERT:
      00AAD4 C7                       4 	.byte 6+F_IFUNC 	
      00AAD5 50 F1 72 18 50 F0        5 	.ascii "INVERT"
      00AADB 8E 81                    6 	.word INVERT_IDX 
      00AADD                       4596 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AADD C6 00                    1 	.word LINK 
                           003218     2 	LINK=.
      003218                          3 INPUT:
      00AADF 10                       4 	.byte 5 	
      00AAE0 CE 00 11 81 54           5 	.ascii "INPUT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AAE4 00 42                    6 	.word INPUT_IDX 
      003220                       4597 	_dict_entry,2,IF,IF_IDX;if 
      00AAE4 CD 99                    1 	.word LINK 
                           003222     2 	LINK=.
      003222                          3 IF:
      00AAE6 DC                       4 	.byte 2 	
      00AAE7 A1 01                    5 	.ascii "IF"
      00AAE9 27 03                    6 	.word IF_IDX 
      003227                       4598 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AAEB CC 97                    1 	.word LINK 
                           003229     2 	LINK=.
      003229                          3 IDR:
      00AAED 20                       4 	.byte 3+F_IFUNC 	
      00AAEE 49 44 52                 5 	.ascii "IDR"
      00AAEE CD 82                    6 	.word IDR_IDX 
      00322F                       4599 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AAF0 5F 90                    1 	.word LINK 
                           003231     2 	LINK=.
      003231                          3 HEX:
      00AAF2 F6                       4 	.byte 3 	
      00AAF3 93 EE 01                 5 	.ascii "HEX"
      00AAF6 72 A9                    6 	.word HEX_IDX 
      003237                       4600 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AAF8 00 03                    1 	.word LINK 
                           003239     2 	LINK=.
      003239                          3 GPIO:
      00AAFA 81                       4 	.byte 4+F_IFUNC 	
      00AAFB 47 50 49 4F              5 	.ascii "GPIO"
      00AAFB CD 99                    6 	.word GPIO_IDX 
      003240                       4601 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AAFD DC A1                    1 	.word LINK 
                           003242     2 	LINK=.
      003242                          3 GOTO:
      00AAFF 02                       4 	.byte 4 	
      00AB00 27 03 CC 97              5 	.ascii "GOTO"
      00AB04 20 90                    6 	.word GOTO_IDX 
      003249                       4602 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AB06 F6 93                    1 	.word LINK 
                           00324B     2 	LINK=.
      00324B                          3 GOSUB:
      00AB08 EE                       4 	.byte 5 	
      00AB09 01 72 A9 00 03           5 	.ascii "GOSUB"
      00AB0E 90 93                    6 	.word GOSUB_IDX 
      003253                       4603 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AB10 90 F6                    1 	.word LINK 
                           003255     2 	LINK=.
      003255                          3 GET:
      00AB12 93                       4 	.byte 3 	
      00AB13 EE 01 90                 5 	.ascii "GET"
      00AB16 5D 27                    6 	.word GET_IDX 
      00325B                       4604 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AB18 07 98                    1 	.word LINK 
                           00325D     2 	LINK=.
      00325D                          3 FREE:
      00AB1A 59                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AB1B 49 90 5A 26              5 	.ascii "FREE"
      00AB1F F9 90                    6 	.word FREE_IDX 
      003264                       4605 	_dict_entry,3,FOR,FOR_IDX;for 
      00AB21 F7 90                    1 	.word LINK 
                           003266     2 	LINK=.
      003266                          3 FOR:
      00AB23 EF                       4 	.byte 3 	
      00AB24 01 A6 84                 5 	.ascii "FOR"
      00AB27 81 34                    6 	.word FOR_IDX 
      00AB28                       4606 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AB28 CD 99                    1 	.word LINK 
                           00326E     2 	LINK=.
      00326E                          3 FCPU:
      00AB2A DC                       4 	.byte 4 	
      00AB2B A1 02 27 03              5 	.ascii "FCPU"
      00AB2F CC 97                    6 	.word FCPU_IDX 
      003275                       4607 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AB31 20 90                    1 	.word LINK 
                           003277     2 	LINK=.
      003277                          3 ERASE:
      00AB33 F6                       4 	.byte 5 	
      00AB34 93 EE 01 72 A9           5 	.ascii "ERASE"
      00AB39 00 03                    6 	.word ERASE_IDX 
      00327F                       4608 	_dict_entry,3,END,END_IDX;cmd_end  
      00AB3B 90 93                    1 	.word LINK 
                           003281     2 	LINK=.
      003281                          3 END:
      00AB3D 90                       4 	.byte 3 	
      00AB3E F6 93 EE                 5 	.ascii "END"
      00AB41 01 90                    6 	.word END_IDX 
      003287                       4609 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AB43 5D 27                    1 	.word LINK 
                           003289     2 	LINK=.
      003289                          3 EEPROM:
      00AB45 07                       4 	.byte 6+F_IFUNC 	
      00AB46 98 56 46 90 5A 26        5 	.ascii "EEPROM"
      00AB4C F9 90                    6 	.word EEPROM_IDX 
      003292                       4610 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AB4E F7 90                    1 	.word LINK 
                           003294     2 	LINK=.
      003294                          3 EEFREE:
      00AB50 EF                       4 	.byte 6+F_IFUNC 	
      00AB51 01 A6 84 81 45 45        5 	.ascii "EEFREE"
      00AB55 00 C0                    6 	.word EEFREE_IDX 
      00329D                       4611 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AB55 A6 84                    1 	.word LINK 
                           00329F     2 	LINK=.
      00329F                          3 EDIT:
      00AB57 CD                       4 	.byte 4 	
      00AB58 99 CF CD 98              5 	.ascii "EDIT"
      00AB5C 60 9F                    6 	.word EDIT_IDX 
      0032A6                       4612 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AB5E A4 07                    1 	.word LINK 
                           0032A8     2 	LINK=.
      0032A8                          3 DWRITE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AB60 C7                       4 	.byte 6+F_CMD 	
      00AB61 50 C6 81 49 54 45        5 	.ascii "DWRITE"
      00AB64 00 26                    6 	.word DWRITE_IDX 
      0032B1                       4613 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AB64 52 01                    1 	.word LINK 
                           0032B3     2 	LINK=.
      0032B3                          3 DREAD:
      00AB66 CD                       4 	.byte 5+F_IFUNC 	
      00AB67 99 E1 A1 02 27           5 	.ascii "DREAD"
      00AB6C 03 CC                    6 	.word DREAD_IDX 
      0032BB                       4614 	_dict_entry,2,DO,DO_IDX;do_loop
      00AB6E 97 20                    1 	.word LINK 
                           0032BD     2 	LINK=.
      0032BD                          3 DO:
      00AB70 90                       4 	.byte 2 	
      00AB71 F6 93                    5 	.ascii "DO"
      00AB73 EE 01                    6 	.word DO_IDX 
      0032C2                       4615 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AB75 72 A9                    1 	.word LINK 
                           0032C4     2 	LINK=.
      0032C4                          3 DEC:
      00AB77 00                       4 	.byte 3 	
      00AB78 03 90 93                 5 	.ascii "DEC"
      00AB7B 90 F6                    6 	.word DEC_IDX 
      0032CA                       4616 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AB7D 93 EE                    1 	.word LINK 
                           0032CC     2 	LINK=.
      0032CC                          3 DDR:
      00AB7F 01                       4 	.byte 3+F_IFUNC 	
      00AB80 72 A9 00                 5 	.ascii "DDR"
      00AB83 03 CD                    6 	.word DDR_IDX 
      0032D2                       4617 	_dict_entry,4,DATA,DATA_IDX;data  
      00AB85 AB C1                    1 	.word LINK 
                           0032D4     2 	LINK=.
      0032D4                          3 DATA:
      00AB87 6B                       4 	.byte 4 	
      00AB88 01 A6 01 0D              5 	.ascii "DATA"
      00AB8C 01 27                    6 	.word DATA_IDX 
      0032DB                       4618 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AB8E 0D 48                    1 	.word LINK 
                           0032DD     2 	LINK=.
      0032DD                          3 CRL:
      00AB90 0A                       4 	.byte 3+F_IFUNC 	
      00AB91 01 26 FB                 5 	.ascii "CRL"
      00AB94 6B 01                    6 	.word CRL_IDX 
      0032E3                       4619 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AB96 7B 01                    1 	.word LINK 
                           0032E5     2 	LINK=.
      0032E5                          3 CRH:
      00AB98 EA                       4 	.byte 3+F_IFUNC 	
      00AB99 03 E7 03                 5 	.ascii "CRH"
      00AB9C 90 A3                    6 	.word CRH_IDX 
      0032EB                       4620 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB9E 00 01                    1 	.word LINK 
                           0032ED     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      0032ED                          3 CONST:
      00ABA0 27                       4 	.byte 5 	
      00ABA1 10 7B 01 43 E4           5 	.ascii "CONST"
      00ABA6 04 E7                    6 	.word CONST_IDX 
      0032F5                       4621 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00ABA8 04 7B                    1 	.word LINK 
                           0032F7     2 	LINK=.
      0032F7                          3 CHAR:
      00ABAA 01                       4 	.byte 4+F_CFUNC 	
      00ABAB 43 E4 02 E7              5 	.ascii "CHAR"
      00ABAF 02 20                    6 	.word CHAR_IDX 
      0032FE                       4622 	_dict_entry,3,BYE,BYE_IDX;bye 
      00ABB1 0C F7                    1 	.word LINK 
                           003300     2 	LINK=.
      00ABB2                          3 BYE:
      00ABB2 7B                       4 	.byte 3 	
      00ABB3 01 EA 02                 5 	.ascii "BYE"
      00ABB6 E7 02                    6 	.word BYE_IDX 
      003306                       4623 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00ABB8 7B 01                    1 	.word LINK 
                           003308     2 	LINK=.
      003308                          3 BTOGL:
      00ABBA EA                       4 	.byte 5 	
      00ABBB 04 E7 04 47 4C           5 	.ascii "BTOGL"
      00ABBE 00 12                    6 	.word BTOGL_IDX 
      003310                       4624 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00ABBE 5B 01                    1 	.word LINK 
                           003312     2 	LINK=.
      003312                          3 BTEST:
      00ABC0 81                       4 	.byte 5+F_IFUNC 	
      00ABC1 42 54 45 53 54           5 	.ascii "BTEST"
      00ABC1 58 1C                    6 	.word BTEST_IDX 
      00331A                       4625 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00ABC3 AB D1                    1 	.word LINK 
                           00331C     2 	LINK=.
      00331C                          3 BSET:
      00ABC5 FE                       4 	.byte 4 	
      00ABC6 9F 88 5E A6              5 	.ascii "BSET"
      00ABCA 05 42                    6 	.word BSET_IDX 
      003323                       4626 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00ABCC 1C 50                    1 	.word LINK 
                           003325     2 	LINK=.
      003325                          3 BRES:
      00ABCE 00                       4 	.byte 4 	
      00ABCF 84 81 45 53              5 	.ascii "BRES"
      00ABD1 00 0C                    6 	.word BRES_IDX 
      00332C                       4627 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00ABD1 03 06                    1 	.word LINK 
                           00332E     2 	LINK=.
      00332E                          3 BIT:
      00ABD3 03                       4 	.byte 3+F_IFUNC 	
      00ABD4 05 04 00                 5 	.ascii "BIT"
      00ABD7 02 01                    6 	.word BIT_IDX 
      003334                       4628 	_dict_entry,3,AWU,AWU_IDX;awu 
      00ABD9 06 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



                           003336     2 	LINK=.
      003336                          3 AWU:
      00ABDB 02                       4 	.byte 3 	
      00ABDC 02 02 03                 5 	.ascii "AWU"
      00ABDF 03 01                    6 	.word AWU_IDX 
      00333C                       4629 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00ABE1 03 03                    1 	.word LINK 
                           00333E     2 	LINK=.
      00333E                          3 ASC:
      00ABE3 02                       4 	.byte 3+F_IFUNC 	
      00ABE4 04 04 05                 5 	.ascii "ASC"
      00ABE7 02 06                    6 	.word ASC_IDX 
      003344                       4630 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00ABE9 02 07                    1 	.word LINK 
                           003346     2 	LINK=.
      003346                          3 ADCREAD:
      00ABEB 02                       4 	.byte 7+F_IFUNC 	
      00ABEC 05 04 02 04 01 41 44     5 	.ascii "ADCREAD"
      00ABF1 00 04                    6 	.word ADCREAD_IDX 
      003350                       4631 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00ABF1 CD 99                    1 	.word LINK 
                           003352     2 	LINK=.
      003352                          3 ADCON:
      00ABF3 DC                       4 	.byte 5 	
      00ABF4 A1 01 27 03 CC           5 	.ascii "ADCON"
      00ABF9 97 20                    6 	.word ADCON_IDX 
      00ABFB                       4632 kword_dict::
      00335A                       4633 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00ABFB 90 F6                    1 	.word LINK 
                           00335C     2 	LINK=.
      00335C                          3 ABS:
      00ABFD 93                       4 	.byte 3+F_IFUNC 	
      00ABFE EE 01 72                 5 	.ascii "ABS"
      00AC01 A9 00                    6 	.word ABS_IDX 
                                   4634 
                                   4635 ;comands and fonctions address table 	
      003362                       4636 code_addr::
      00AC03 03 89 88 A6 80 15 01  4637 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             27 05 A6 0A CC
      00AC0F 97 22 21 55 21 BC 21  4638 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             9A 29 D6 28 EB 2D E1
      00AC11 2D DC 2D F5 2D D7 1C  4639 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             01 2D 5A 26 45 26 7C
      00AC11 CE 00 15 58 58 58 58  4640 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             58 9E C8 00 15 C7 00
             0E 9F C8 00 16 C7
      00AC25 00 0F CE 00 17 CF 00  4641 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             15 CE 00 17 54 9E C8
             00 17
      00AC35 C7 00 17 9F C8 00 18  4642 	.word let,list,log2,lshift,next,new ; 40..47
             C7 00 18 CE 00
      00AC41 0E 54 54 54 9E C8 00  4643 	.word func_not,const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             0E C7 00 0E 9F C8 00
      00AC4F 0F C7 00 0F C8 00 18  4644 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             97 C6 00 0E C8 00 17
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal  95-Bits]



             2D B4
      00AC5E CF 00 17 C6 00 16 A4  4645 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             7F 72 A2 00 03 90 F7
             90 EF
      00AC6E 01 84 85 72 A2 00 03  4646 	.word restore,return, random,rshift,run,free ; 72..79
             90 F7 90 EF 01
      00AC7A CD 84 55 90 F6 93 EE  4647 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             01 72 A9 00 03 1C 00
             01 A9
      00AC8A 00 81 2C 89 22 79 25  4648 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             62 1C 4F 29 82 2D 6D
             29 97
      00AC8C 21 18 2C 0C 28 A8 1C  4649 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             22 23 DF 25 2C 1D 85
      00AC8C 52 03 0F 02           4650 	.word func_eefree,0 
                                   4651 
                                   4652 
                                   4653 
                                   4654 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
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
      003426                         30 test:
      003426                         31     _vars VSIZE 
      00AC90 0F 03            [ 2]    1     sub sp,#VSIZE 
      00AC92 90 AE B3         [ 2]   32     ldw x,#LOOP_CNT
      00AC95 DC 93            [ 2]   33     ldw (CNTR,sp),x  
      00AC97 F6 A4 0F         [ 2]   34     ldw x,ticks 
      00AC9A 6B 01            [ 2]   35     ldw (T,sp),x
      003432                         36 1$: ; test add24 
      00AC9C 0C 03            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC9E 5C F6 CD         [ 2]   38     ldw x,#VAL1&0XFFFF
      00ACA1 89 C4 0C         [ 1]   39     ld acc24,a 
      00ACA4 02 0A 01         [ 2]   40     ldw acc24+1,x  
      00ACA7 26 F5            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00ACA9 A6 46 11         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00ACAC 02 2B 09         [ 4]   43     call add24 
      00ACAF A6 20            [ 2]   44     ldw x,(CNTR,sp)
      00ACB1 CD 89 C4         [ 2]   45     subw x,#1
      00ACB4 0C 02            [ 2]   46     ldw (CNTR,sp),x 
      00ACB6 20 07            [ 1]   47     jrne 1$
      00ACB8 A6 0D CD         [ 4]   48     call prt_acc24
      00ACBB 89 C4            [ 1]   49     ld a,#SPACE 
      00ACBD 0F 02 72         [ 4]   50     call putc 
      00ACC0 A2 00 02         [ 2]   51     ldw x,ticks 
      00ACC3 90 FE 26         [ 2]   52     subw x,(T,sp)
      00ACC6 CF A6 0D         [ 4]   53     call prt_i16  
      00ACC9 CD 89            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ACCB C4 5F 7B         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ACCE 03 97 CD         [ 2]   58     ldw x,LOOP_CNT
      00ACD1 98 76            [ 2]   59     ldw (CNTR,sp),x 
      00ACD3 AE AC DC         [ 2]   60     ldw x,ticks 
      00ACD6 CD 8A            [ 2]   61     ldw (T,sp),x 
      00346E                         62 2$: 
      00ACD8 21 5B            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ACDA 03 81 20         [ 2]   64     ldw x,#VAL1&0XFFFF
      00ACDD 77 6F 72         [ 1]   65     ld acc24,a 
      00ACE0 64 73 20         [ 2]   66     ldw acc24+1,x  
      00ACE3 69 6E            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00ACE5 20 64 69         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00ACE8 63 74 69         [ 4]   69     call mul24 
      00ACEB 6F 6E            [ 2]   70     ldw x,(CNTR,sp)
      00ACED 61 72 79         [ 2]   71     subw x,#1
      00ACF0 0A 00            [ 2]   72     ldw (CNTR,sp),x 
      00ACF2 26 E4            [ 1]   73     jrne 2$ 
      00ACF2 CD 99 E1         [ 4]   74    call prt_acc24 
      00ACF5 A1 01            [ 1]   75    ld a,#SPACE 
      00ACF7 27 03 CC         [ 4]   76    call putc 
      00ACFA 97 20 0F         [ 2]   77     ldw x,ticks 
      00ACFC 72 F0 01         [ 2]   78     subw x,(T,sp)
      00ACFC 90 F6 93         [ 4]   79     call prt_i16 
      00ACFF EE 01            [ 1]   80     ld a,#CR 
      00AD01 72 A9 00         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AD04 03 CF 00         [ 2]   83     ldw x,LOOP_CNT
      00AD07 13 81            [ 2]   84     ldw (CNTR,sp),x 
      00AD09 CE 00 0F         [ 2]   85     ldw x,ticks 
      00AD09 CE 00            [ 2]   86     ldw (T,sp),x 
      0034AA                         87 3$: 
      00AD0B 13 4F            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AD0D 20 13 FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AD0F C7 00 0C         [ 1]   90     ld acc24,a 
      00AD0F CD 99 DC         [ 2]   91     ldw acc24+1,x  
      00AD12 A1 01            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AD14 27 03 CC         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AD17 97 20 90         [ 4]   94     call mul24 
      00AD1A F6 93            [ 2]   95     ldw x,(CNTR,sp)
      00AD1C EE 01 72         [ 2]   96     subw x,#1
      00AD1F A9 00            [ 2]   97     ldw (CNTR,sp),x 
      00AD21 03 E4            [ 1]   98     jrne 3$ 
      00AD22 CD 18 0D         [ 4]   99     call prt_acc24    
      00AD22 4D 26            [ 1]  100     ld a,#SPACE 
      00AD24 06 5D 26         [ 4]  101     call putc 
      00AD27 03 43 53         [ 2]  102     ldw x,ticks 
      00AD2A 81 4F 5F         [ 2]  103     subw x,(T,sp)
      00AD2D 81 17 F6         [ 4]  104     call prt_i16 
      00AD2E A6 0D            [ 1]  105     ld a,#CR 
      00AD2E CD 99 E1         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AD31 A1 01 27         [ 2]  108     ldw x,LOOP_CNT
      00AD34 03 CC            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00AD36 97 20 90         [ 2]  110     ldw x,ticks 
      00AD39 F6 93            [ 2]  111     ldw (T,sp),x 
      0034E6                        112 4$:
      00AD3B EE 01            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AD3D 72 A9 00         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AD40 03 4B 00         [ 1]  115     ld acc24,a 
      00AD43 35 CC 50         [ 2]  116     ldw acc24+1,x  
      00AD46 E0 9E            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AD48 A4 3F 95         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AD4B A3 00 FF         [ 4]  119     call mul24 
      00AD4E 23 06            [ 2]  120     ldw x,(CNTR,sp)
      00AD50 0C 01 98         [ 2]  121     subw x,#1
      00AD53 56 20            [ 2]  122     ldw (CNTR,sp),x 
      00AD55 F5 35            [ 1]  123     jrne 4$ 
      00AD57 55 50 E0         [ 4]  124     call prt_acc24 
      00AD5A 84 C7            [ 1]  125     ld a,#SPACE 
      00AD5C 50 E1 9F         [ 4]  126     call putc 
      00AD5F 4A 35 55         [ 2]  127     ldw x,ticks 
      00AD62 50 E0 C7         [ 2]  128     subw x,(T,sp)
      00AD65 50 E2 35         [ 4]  129     call prt_i16 
      00AD68 AA 50            [ 1]  130     ld a,#CR 
      00AD6A E0 81 44         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AD6C CE 27 10         [ 2]  133     ldw x,LOOP_CNT
      00AD6C 35 AA            [ 2]  134     ldw (CNTR,sp),x 
      00AD6E 50 E0 81         [ 2]  135     ldw x,ticks 
      00AD71 1F 01            [ 2]  136     ldw (T,sp),x 
      003522                        137 5$: 
      00AD71 CD 99            [ 1]  138     ld a,#0xff
      00AD73 DC A1 01         [ 2]  139     ldw x,#0xffff
      00AD76 27 03 CC         [ 4]  140     call abs24 
      00AD79 97 20 0C         [ 1]  141     ld acc24,a 
      00AD7B CF 00 0D         [ 2]  142     ldw acc24+1,x
      00AD7B 90 F6            [ 2]  143     ldw x,(CNTR,sp)
      00AD7D 93 EE 01         [ 2]  144     subw x,#1
      00AD80 72 A9            [ 2]  145     ldw (CNTR,sp),x 
      00AD82 00 03            [ 1]  146     jrne 5$ 
      00AD84 4D 26 08         [ 4]  147     call prt_acc24 
      00AD87 5D 26            [ 1]  148     ld a,#SPACE 
      00AD89 05 A6 0A         [ 4]  149     call putc 
      00AD8C CC 97 22         [ 2]  150     ldw x,ticks 
      00AD8F 4B 18 59         [ 2]  151     subw x,(T,sp)
      00AD92 49 25 04         [ 4]  152     call prt_i16 
      00354A                        153 6$:
      00AD95 0A 01            [ 1]  154     ld a,#CR 
      00AD97 26 F8 5F         [ 4]  155     call putc 
      00AD9A 84 4A 02         [ 4]  156     call read_integer 
      00AD9D 55 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AD9D 81 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00AD9E 55 00 0E 00 1A   [ 1]  159     mov farptr+2,acc8 
      00AD9E CD 99 DC         [ 4]  160     call read_integer 
      00ADA1 A1 01 27         [ 1]  161     ld a,acc24 
      00ADA4 03 CC 97         [ 2]  162     ldw x,acc16 
      00ADA7 20 90 F6 93 EE   [ 1]  163     mov acc24,farptr 
      00ADAC 01 72 A9 00 03   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00ADB1 9F AE 00 01 A4   [ 1]  165     mov acc8,farptr+2 
      00ADB6 17 27 0A         [ 4]  166     call div24 
      00ADB9 88               [ 1]  167     push a 
      00ADBA 4F               [ 2]  168     pushw x 
      00ADBB CD 18 0D         [ 4]  169     call prt_acc24 
      00ADBB 58 49            [ 1]  170     ld a,#SPACE 
      00ADBD 0A 01 26         [ 4]  171     call putc 
      00ADC0 FA               [ 2]  172     popw x
      00ADC1 CF 00 0D         [ 2]  173     ldw acc16,x  
      00ADC1 5B 01 81         [ 1]  174     pop acc24 
      00ADC4 CD 18 0D         [ 4]  175     call prt_acc24
      00ADC4 CD 99            [ 2]  176     jra 6$
      003592                        177     _drop VSIZE 
      00ADC6 DC A1            [ 2]    1     addw sp,#VSIZE 
      00ADC8 01               [ 4]  178     ret 
                                    179 
                                    180 
      003595                        181 read_integer:
      00ADC9 27 03            [ 1]  182     ld a,#'? 
      00ADCB CC 97 20         [ 4]  183     call putc  
      00ADCE 90 F6 93 EE      [ 1]  184 	clr count  
      00ADD2 01 72 A9         [ 4]  185 	call readln 
      00ADD5 00 03 43         [ 2]  186 	ldw x,#tib 
      00ADD8 53 81 03         [ 1]  187 	push count
      00ADDA 4B 00            [ 1]  188 	push #0 
      00ADDA 85 52 04         [ 2]  189 	addw x,(1,sp)
      00ADDD 89               [ 1]  190 	incw x 
      0035AD                        191 	_drop 2 
      00ADDE CE 00            [ 2]    1     addw sp,#2 
      00ADE0 05 1F 03 CE      [ 1]  192 	clr in 
      00ADE4 00 01 1F         [ 4]  193 	call get_token
      00ADE7 05 72            [ 1]  194 	cp a,#TK_INTGR
      00ADE9 5C 00            [ 1]  195 	jreq 3$ 
      00ADEB 20 81            [ 1]  196 	cp a,#TK_MINUS
      00ADED CD 0F 1F         [ 4]  197 	call get_token 
      00ADED 72 5D            [ 1]  198 	cp a,#TK_INTGR 
      00ADEF 00 20            [ 1]  199 	jreq 2$
      00ADF1 26 03 CC         [ 2]  200 	jp syntax_error
      0035C6                        201 2$:
      00ADF4 97 20 0D         [ 4]  202 	call neg_acc24  	
      00ADF6                        203 3$: 
      00ADF6 CD               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
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
      00ADF7 9C 08                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00ADF9 90 F6                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00335C R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003352 R
    ADCON_ID=  000002     |   4 ADCREAD    003346 R   |     ADCREAD_=  000004 
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
  4 AND        002F9A R   |     ARG_OFS =  000002     |     ARROW_LE=  000080 
    ARROW_RI=  000081     |   4 ASC        00333E R   |     ASC_IDX =  000006 
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTO_RUN   000157 R
  4 AWU        003336 R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_CSR_=  000004     |     AWU_IDX =  000008 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
    BCNT    =  000001     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |   4 BIT        00332E R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000A     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000D 
  4 BRES       003325 R   |     BRES_IDX=  00000C     |     BS      =  000008 
  4 BSET       00331C R   |     BSET_IDX=  00000E     |     BSIZE   =  000006 
  4 BTEST      003312 R   |     BTEST_ID=  000010     |   4 BTOGL      003308 R
    BTOGL_ID=  000012     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        003300 R   |     BYE_IDX =  000014     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    002850 R   |     CAN_DGR =  005426 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       0032F7 R
    CHAR_IDX=  000016     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
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
    CNT_LO  =  000004     |     COMMA   =  00002C     |   4 CONST      0032ED R
  4 CONST_CO   001D02 R   |     CONST_ID=  0000BE     |     CONST_RE=  000005 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CRH        0032E5 R
    CRH_IDX =  000018     |   4 CRL        0032DD R   |     CRL_IDX =  00001A 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0032D4 R
    DATA_IDX=  00001C     |     DBG_A   =  000008     |     DBG_CC  =  000009 
    DBG_X   =  000006     |     DBG_Y   =  000004     |     DC1     =  000011 
    DC2     =  000012     |     DC3     =  000013     |     DC4     =  000014 
  4 DDR        0032CC R   |     DDR_IDX =  00001E     |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   4 DEC        0032C4 R
    DEC_IDX =  000020     |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |     DIVISOR =  000001     |     DIVSOR  =  000001 
    DLE     =  000010     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  4 DO         0032BD R   |     DOLP_ADR=  000003     |     DOLP_INW=  000005 
    DO_IDX  =  000022     |   4 DREAD      0032B3 R   |     DREAD_ID=  000024 
  4 DWRITE     0032A8 R   |     DWRITE_I=  000026     |   4 EDIT       00329F R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    EDIT_IDX=  000028     |   4 EEFREE     003294 R   |     EEFREE_I=  0000C0 
  4 EEPROM     003289 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_I=  00002A     |     EEPROM_S=  000800     |     EEPTR   =  000003 
    EM      =  000019     |   4 END        003281 R   |     END_IDX =  00002C 
    ENQ     =  000005     |     EOF     =  0000FF     |     EOT     =  000004 
  4 ERASE      003277 R   |     ERASE_ID=  00002E     |     ERR_BAD_=  00000A 
    ERR_BUF_=  00000F     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_F=  00000E     |     ERR_NO_L=  000005 
    ERR_NO_P=  00000D     |     ERR_OVER=  000010     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     ETB     =  000017 
    ETX     =  000003     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   4 FCPU       00326E R
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
    FLASH_IA=  000001     |     FLASH_IA=  000000     |   4 FLASH_ME   001EA5 R
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLOOP   =  000002     |     FLSI    =  01F400 
  4 FOR        003266 R   |     FOR_IDX =  000034     |   4 FREE       00325D R
    FREE_IDX=  000090     |     FRUN    =  000000     |     FS      =  00001C 
    FSLEEP  =  000003     |     FSTEP   =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   4 GET        003255 R   |     GET_IDX =  0000BC 
  4 GOSUB      00324B R   |     GOSUB_ID=  000036     |   4 GOTO       003242 R
    GOTO_IDX=  000038     |   4 GPIO       003239 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_IDX=  00003A     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        003231 R
    HEX_IDX =  00003C     |     HOME    =  000082     |     HSECNT  =  004809 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
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
  4 IDR        003229 R   |     IDR_IDX =  00003E     |   4 IF         003222 R
    IF_IDX  =  000040     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003218 R   |     INPUT_DI=  000000 
    INPUT_EI=  000001     |     INPUT_FL=  000000     |     INPUT_ID=  000042 
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
  4 INVERT     00320D R   |     INVERT_I=  000044     |     INW     =  00000B 
    IPOS    =  000001     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  4 IWDGEN     003202 R   |     IWDGEN_I=  000046     |   4 IWDGREF    0031F6 R
    IWDGREF_=  000048     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |     KCHAR   =  000002     |   4 KEY        0031EE R
    KEY_END =  000083     |     KEY_IDX =  00004A     |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000002     |   4 LET        0031E6 R
    LET_IDX =  00004C     |     LF      =  00000A     |     LIMIT   =  000001 
    LINENO  =  000005     |   4 LINK    =  00335C R   |   4 LIST       0031DD R
    LIST_IDX=  00004E     |     LL      =  000001     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   4 LOG        0031D5 R
    LOG_IDX =  000050     |     LOOP_CNT=  002710     |   4 LSHIFT     0031CA R
    LSHIFT_I=  000052     |     MAJOR   =  000002     |     MASK    =  000002 
    MAX_LINE=  007FFF     |     MINOR   =  000000     |     MULOP   =  000001 
    N1      =  000004     |     N2      =  000007     |     NAFR    =  004804 
    NAK     =  000015     |     NAME    =  000002     |     NAMEPTR =  000001 
    NCLKOPT =  004808     |     NEG     =  000001     |   4 NEW        0031C2 R
    NEW_IDX =  000056     |   4 NEXT       0031B9 R   |     NEXT_IDX=  000054 
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NLEN    =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |   4 NOT        0031B1 R
    NOT_IDX =  000058     |   4 NOT_SAVE   001F97 R   |   4 NO_APP     002892 R
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  4 NonHandl   000000 R   |   4 ODR        0031A9 R   |     ODR_IDX =  00005A 
  4 ON         0031A2 R   |     ONOFF   =  000003     |     ON_IDX  =  0000BA 
    OP      =  000002     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   4 OP_LINK =  002F9A R
  4 OR         002F93 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVRWR   =  000004     |     PA      =  000000     |   4 PAD        00319A R
    PAD_IDX =  00005C     |     PAD_SIZE=  000080     |   4 PAUSE      003190 R
    PAUSE_ID=  00005E     |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   4 PEEK       003187 R
    PEEK_IDX=  000062     |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  4 PINP       00317E R   |     PINP_IDX=  000064     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      003174 R   |     PMODE_ID=  000060     |   4 POKE       00316B R
    POKE_IDX=  000066     |   4 PORTA      00314E R   |   4 PORTB      003144 R
  4 PORTC      00313A R   |   4 PORTD      003130 R   |   4 PORTE      003126 R
  4 PORTF      00311C R   |   4 PORTG      003112 R   |   4 PORTH      003108 R
  4 PORTI      0030FE R   |   4 POUT       003162 R   |     POUT_IDX=  000068 
    PREV    =  000001     |   4 PRINT      003158 R   |     PROD    =  000001 
    PROD_SIG=  00000A     |   4 PROG_ADD   001E7B R   |   4 PROG_SIZ   001E8D R
    PRTA_IDX=  00006C     |     PRTB_IDX=  00006E     |     PRTC_IDX=  000070 
    PRTD_IDX=  000072     |     PRTE_IDX=  000074     |     PRTF_IDX=  000076 
    PRTG_IDX=  000078     |     PRTH_IDX=  00007A     |     PRTI_IDX=  00007C 
    PRT_IDX =  00006A     |     PSIZE   =  000001     |     PSTR    =  000003 
  4 QKEY       0030F5 R   |     QKEY_IDX=  00007E     |     QSIGN   =  000005 
    RAM_BASE=  000000     |     RAM_END =  0017FF     |   4 RAM_MEM    001EB6 R
    RAM_SIZE=  001800     |     RBT_IDX =  000082     |   4 READ       0030EC R
    READ_IDX=  000080     |   4 REBOOT     0030E1 R   |     RECLEN  =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

  4 REG_A      000562 R   |   4 REG_CC     000566 R   |   4 REG_EPC    000555 R
  4 REG_SP     00056B R   |   4 REG_X      00055E R   |   4 REG_Y      00055A R
    RELOP   =  000001     |   4 REM        0030D9 R   |     REM_IDX =  000084 
  4 RESTORE    0030CD R   |     REST_IDX=  000086     |     RETL1   =  000001 
  4 RETURN     0030C2 R   |     RET_ADDR=  000003     |     RET_BPTR=  000003 
    RET_IDX =  000088     |     RET_INW =  000005     |   4 RND        0030BA R
    RND_IDX =  00008A     |     ROP     =  004800     |     RS      =  00001E 
  4 RSHIFT     0030AF R   |     RSHIFT_I=  00008C     |     RSIGN   =  000006 
    RST_SR  =  0050B3     |   4 RUN        0030A7 R   |     RUN_IDX =  00008E 
    RXCHAR  =  000001     |     RX_QUEUE=  000008     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  4 SAVE       00309E R   |     SAVE_IDX=  000032     |     SEPARATE=  000000 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
    SI      =  00000F     |     SIGN    =  000001     |   4 SIGNATUR   00284E R
  4 SIZE       003095 R   |     SIZE_IDX=  0000B8     |     SKIP    =  000005 
  4 SLEEP      00308B R   |     SLEEP_ID=  000092     |     SO      =  00000E 
    SOH     =  000001     |     SPACE   =  000020     |   4 SPIEN      003081 R
    SPIEN_ID=  000096     |   4 SPIRD      003077 R   |     SPIRD_ID=  000094 
  4 SPISEL     00306C R   |     SPISEL_I=  000098     |   4 SPIWR      003062 R
    SPIWR_ID=  00009A     |     SPI_CR1 =  005200     |     SPI_CR1_=  000003 
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
  4 STATES     000518 R   |   4 STEP       003059 R   |     STEP_IDX=  00009C 
  4 STOP       003050 R   |     STOP_IDX=  00009E     |     STR     =  000003 
  4 STR_BYTE   001E9E R   |     STX     =  000002     |     SUB     =  00001A 
    SUP     =  000084     |     SWIM_CSR=  007F80     |     SYN     =  000016 
    T       =  000001     |     TAB     =  000009     |     TABW    =  000004 
    TAB_WIDT=  000004     |     TARGET  =  000001     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  4 TICKS      003046 R   |     TICKS_ID=  0000A0     |     TIM1_ARR=  005262 
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
    TIM1_CCM=  000003     |     TIM1_CCM=  00525B     |     TIM1_CCM=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
  4 TIMEOUT    00303A R   |   4 TIMER      003030 R   |     TIMER_ID=  0000A2 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_AND  =  000087 
    TK_ARRAY=  000005     |     TK_CFUNC=  000082     |     TK_CHAR =  000004 
    TK_CMD  =  000080     |     TK_COLON=  00000A     |     TK_COMMA=  000008 
    TK_CONST=  000083     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FLOAT=  000086     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000081 
    TK_INTGR=  000084     |     TK_LABEL=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000006     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_OR   =  000088     |     TK_PLUS =  000010 
    TK_QSTR =  000002     |     TK_RPARE=  000007     |     TK_SHARP=  000009 
    TK_VAR  =  000085     |     TK_XOR  =  000089     |     TMROUT_I=  0000A4 
  4 TO         003029 R   |   4 TONE       003020 R   |     TONE_IDX=  0000A8 
    TOWRITE =  000005     |     TO_IDX  =  0000A6     |   4 Timer4Up   000021 R
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
    UART_SR_=  000004     |     UART_SR_=  000002     |     UART_SR_=  000003 
    UART_SR_=  000000     |     UART_SR_=  000005     |     UART_SR_=  000006 
    UART_SR_=  000007     |     UBC     =  004801     |   4 UBOUND     003015 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    UBOUND_I=  0000AA     |   4 UBTN_Han   000068 R   |   4 UFLASH     00300A R
    UFLASH_I=  0000AC     |   4 UNTIL      003000 R   |     UNTIL_ID=  0000AE 
    UPDATE  =  000006     |     US      =  00001F     |   4 USER_ABO   000070 R
  4 USR        002FF8 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000B0     |   4 Uart1RxH   0008D2 R
  4 UserButt   000044 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VSISE   =  000003     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       002FEF R   |     WAIT_IDX=  0000B2     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   4 WORDS      002FE5 R   |     WORDS_ID=  0000B4 
  4 WRITE      002FDB R   |     WRITE_ID=  0000B6     |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XFIRST  =  000001     |     XMASK   =  000001 
    XOFF    =  000013     |     XON     =  000011     |   4 XOR        002F8B R
    XSAVE   =  000004     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        002A64 R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000C0D R   |   4 add24      00016A R   |   4 add_char   001392 R
  4 add_spac   00116F R   |   4 analog_r   002609 R   |   4 and_cond   001B36 R
  4 and_fact   001B1A R   |   4 app        003604 R   |   4 app_sign   003600 R
  4 app_size   003602 R   |   4 app_spac   003600 GR  |   4 arduino_   002B51 R
  4 arg_list   001961 R   |   5 array_si   000020 R   |   4 ascii      002902 R
  4 at_tst     000FD9 R   |   4 atoi24     001898 GR  |   4 atoi_exi   0018FE R
  4 awu        002A0B R   |   4 awu02      002A1E R   |   4 bad_port   00297D R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       002582 R
  4 beep_1kh   002559 GR  |   4 bin_exit   000E49 R   |   4 bit_rese   002177 R
  4 bit_set    002155 R   |   4 bit_test   0021BC R   |   4 bit_togg   00219A R
  4 bitmask    002D1E R   |   4 bkslsh_t   000F86 R   |   4 bksp       0009AB R
  2 block_bu   0016B8 GR  |   4 block_er   0007C0 R   |   4 break_po   0026F5 R
  4 bye        0029D6 R   |   4 char       0028EB R   |   4 clear_ba   0014FC R
  4 clear_bl   0027A5 R   |   4 clear_va   001454 R   |   4 clock_in   00008B R
  4 cloop_1    001DAB R   |   4 cmd_cons   001D85 R   |   4 cmd_end    002525 R
  4 cmd_get    00252C R   |   4 cmd_itf    000570 R   |   4 cmd_line   00172F R
  4 cmd_name   0013B2 R   |   4 cmd_on     0023DF R   |   4 cmd_size   001C22 R
  4 code_add   003362 GR  |   4 cold_sta   0000C3 R   |   4 colon_ts   000FAD R
  4 comma_ts   000FB8 R   |   4 comp_msg   00167F R   |   4 compile    0010DE GR
  4 conditio   001B88 R   |   4 const_cr   002DDC R   |   4 const_cr   002DE1 R
  4 const_dd   002DD7 R   |   4 const_ee   002DF0 R   |   4 const_id   002DD2 R
  4 const_in   002DEB R   |   4 const_lo   001DA6 R   |   4 const_od   002DCD R
  4 const_ou   002DE6 R   |   4 const_po   002DA0 R   |   4 const_po   002DA5 R
  4 const_po   002DAA R   |   4 const_po   002DAF R   |   4 const_po   002DB4 R
  4 const_po   002DB9 R   |   4 const_po   002DBE R   |   4 const_po   002DC3 R
  4 const_po   002DC8 R   |   4 convert_   000DB7 R   |   4 convert_   00096F R
  4 copy_com   00100E R   |   5 count      000003 GR  |   4 cp24       0001A4 R
  4 cp24_ax    0001D6 R   |   4 cp_loop    001910 R   |   4 cpl24      0001E6 R
  4 cpy_cmd_   00115A R   |   4 cpy_quot   001197 R   |   4 create_g   000CE1 R
  4 cs_high    002F7F R   |   4 dash_tst   000FCE R   |   4 data       002DF5 R
  5 data_len   000009 R   |   4 data_lin   002E04 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 data_sea   002E50 R   |   4 dec_base   001C01 R
  4 decomp_l   001250 R   |   4 decompil   001208 GR  |   4 del_line   000CB4 R
  4 delete_l   000A98 R   |   4 delete_n   0009BB R   |   4 delete_u   000A5D R
  4 digital_   002645 R   |   4 digital_   00267C R   |   4 div24      000327 R
  4 divu24_8   000309 R   |   4 do_loop    002D5A R   |   4 do_progr   0007B3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

  4 edit       001F6A R   |   4 enable_i   002CAE R   |   4 eql_tst    001063 R
  4 equal      0013A5 R   |   4 erase      00271D R   |   4 erase_ex   0007E4 R
  4 erase_fl   0007DA R   |   4 err_bad_   0015E0 R   |   4 err_buf_   001656 R
  4 err_cmd_   0015A4 R   |   4 err_div0   001569 R   |   4 err_dupl   0015BE R
  4 err_math   001550 R   |   4 err_mem_   001535 R   |   4 err_msg    001513 R
  4 err_no_a   0015EC R   |   4 err_no_d   00161F R   |   4 err_no_f   001643 R
  4 err_no_l   001578 R   |   4 err_no_p   00162F R   |   4 err_not_   0015CF R
  4 err_over   001663 R   |   4 err_run_   00158E R   |   4 err_synt   001542 R
  4 escaped    000DCC GR  |   4 expect     00194F R   |   4 expressi   001A83 R
  4 factor     0019A4 R   |   5 farptr     000018 R   |   4 fcpu       002AD5 R
  4 fetchc     000660 R   |   4 fill_wri   002795 R   |   4 final_te   000C06 R
  4 first_li   001F14 R   |   5 flags      000022 GR  |   4 for        00224F R
  4 free       001C06 R   |   5 free_eep   000024 R   |   7 free_ram   000080 R
  4 func_arg   00195C R   |   4 func_eef   001D18 R   |   4 func_not   002C8F R
  4 ge         0013A7 R   |   4 get_addr   0017D6 R   |   4 get_arra   001974 R
  4 get_char   0017F0 R   |   4 get_cmd_   0011E7 R   |   4 get_code   0017BA R
  4 get_cons   001C9D R   |   4 get_esca   00097B R   |   4 get_int2   0017E0 R
  4 get_targ   002370 R   |   4 get_targ   00237E R   |   4 get_tick   002A5D R
  4 get_toke   000F1F GR  |   4 getc       000954 GR  |   4 gosub      002485 R
  4 gosub_1    002490 R   |   4 gosub_2    002496 R   |   4 goto       00246B R
  4 goto_1     002475 R   |   4 gpio       002952 R   |   4 gt         0013A3 R
  4 gt_tst     00106E R   |   4 hex_base   001BFC R   |   4 hex_dump   0006A0 R
  4 if         002235 R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   0008B6 R   |   4 input_ex   00210D R
  4 input_lo   002079 R   |   4 input_va   002075 R   |   4 insert_c   000A1A R
  4 insert_l   000D0D R   |   4 insert_l   000D7C R   |   4 interp_l   001770 R
  4 interpre   00174B R   |   4 invalid    0005B5 R   |   4 invalid_   000636 R
  4 invert     002D44 R   |   4 is_alnum   000E7E GR  |   4 is_alpha   000E64 GR
  4 is_data_   002DFB R   |   4 is_digit   000E75 GR  |   4 is_symbo   000E87 R
  4 itoa       001833 GR  |   4 itoa_loo   001855 R   |   4 jp_to_ta   002478 R
  4 key        002941 R   |   4 kword_di   00335A GR  |   4 kword_en   002FD9 R
  4 le         0013AC R   |   4 ledoff     00046B R   |   4 ledon      000466 R
  4 ledtoggl   000470 R   |   4 left_par   000479 R   |   4 let        001C5A GR
  4 let_arra   001C68 R   |   4 let_eval   001C70 R   |   4 let_var    001C6D R
  4 lines_sk   001F17 R   |   4 list       001EC5 R   |   4 list_con   001CAC R
  4 list_exi   001F59 R   |   4 list_loo   001F37 R   |   4 log2       002CF1 R
  4 logical_   002CA2 R   |   4 look_tar   0023A1 R   |   4 loop_bac   002353 R
  5 loop_dep   00001F R   |   4 loop_don   002368 R   |   4 lshift     002A7B R
  4 lt         0013AA R   |   4 lt_tst     001097 R   |   4 mem_peek   0005D2 R
  4 mod24      0003D5 R   |   4 move       001410 GR  |   4 move_dow   00142F R
  4 move_era   000742 R   |   4 move_exi   001450 R   |   4 move_lef   0009F2 R
  4 move_loo   001434 R   |   4 move_prg   000782 R   |   4 move_rig   000A00 R
  4 move_up    001421 R   |   4 mul24      00025D R   |   4 mul_char   001394 R
  4 mulu24_8   00022A R   |   4 nbr_tst    000F52 R   |   4 ne         0013AF R
  4 neg24      0001F3 R   |   4 neg_acc2   00020D R   |   4 neg_ax     000205 R
  4 new        002713 R   |   4 next       0022FB R   |   4 next_lin   001753 R
  4 next_tok   0017A1 GR  |   4 no_match   001922 R   |   4 number     000666 R
  4 op_dict    002F98 R   |   4 op_end     002F89 R   |   4 other      0010C0 R
  4 overwrit   000C32 R   |   2 pad        0016B8 GR  |   4 pad_ref    002F84 R
  4 parse_bi   000E27 R   |   4 parse_in   000DD4 R   |   4 parse_ke   000EAA R
  4 parse_qu   000D7F R   |   4 parse_sy   000E92 R   |   4 pause      0029EA R
  4 pause02    0029FD R   |   4 peek       002214 R   |   4 peek_byt   000600 R
  4 pin_mode   002AE4 R   |   4 plus_tst   001037 R   |   4 poke       0021F3 R
  4 power_ad   0025B9 R   |   4 prcnt_ts   001058 R   |   4 print      001FD2 R
  4 print_fa   000645 R   |   4 print_he   000C67 GR  |   4 print_re   0004C5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

  4 print_st   0005C5 R   |   4 print_to   00181B R   |   4 prog_siz   001E34 R
  4 program_   001E3C R   |   4 program_   00075C R   |   4 program_   000782 R
  4 prt_acc2   00180D R   |   4 prt_basi   001FAE R   |   4 prt_i16    0017F6 R
  4 prt_loop   001FD6 R   |   4 prt_peek   000448 GR  |   4 prt_reg1   0004A6 R
  4 prt_reg8   000484 R   |   4 prt_regs   0003DE GR  |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       000944 GR  |   4 puts       0009A1 GR
  4 qgetc      00094D GR  |   4 qkey       002945 GR  |   4 qmark_ts   000FE4 R
  4 qsign      00278E R   |   4 random     002B71 R   |   4 read       002E71 R
  4 read01     002E73 R   |   4 read_int   003595 R   |   4 readln     000AA6 GR
  4 readln_l   000AB3 R   |   4 readln_q   000C4F R   |   4 refresh_   002CEC R
  4 regs_sta   000421 R   |   4 relation   001ABB R   |   4 relop_st   001397 R
  4 remark     002112 GR  |   4 repl       00057E R   |   4 repl_exi   0005A6 R
  4 reset_co   001FD4 R   |   4 rest_con   002065 R   |   4 restore    002E2A R
  4 restore_   002E6C R   |   4 return     0024AB R   |   4 right_al   001185 GR
  4 row_alig   00089B R   |   4 row_eras   000715 R   |   4 row_eras   000742 R
  4 row_loop   000683 R   |   4 rparnt_t   000FA2 R   |   4 rshift     002AA8 R
  7 rsign      00007C R   |   7 rsize      00007E R   |   4 rt_msg     00166D R
  4 run        0024C9 R   |   4 run_app    000135 R   |   4 run_it     0024FB R
  4 run_it_0   0024FD R   |   5 rx1_head   00002E R   |   5 rx1_queu   000026 R
  5 rx1_tail   00002F R   |   4 save_app   0027B9 R   |   4 save_con   002055 R
  4 scan_blo   0008C4 R   |   4 search_c   001D41 R   |   4 search_d   001902 GR
  4 search_e   00194C R   |   4 search_l   000C89 GR  |   4 search_l   000C98 R
  4 search_n   001906 R   |   4 search_o   002FA0 R   |   5 seedx      000014 R
  5 seedy      000016 R   |   4 select_p   002B41 R   |   4 send_esc   0009C9 R
  4 send_par   0009D4 R   |   4 set_data   002E19 R   |   4 set_time   002C72 R
  4 sharp_ts   000FC3 R   |   4 show_row   000671 R   |   4 single_c   00138D R
  4 skip       000F0C R   |   4 skip_2_b   0017BE R   |   4 skip_str   0017C7 R
  4 slash_ts   00104D R   |   4 sleep      0029DF R   |   4 software   001463 R
  4 spaces     000A0E GR  |   4 spi_clea   002F19 R   |   4 spi_disa   002F01 R
  4 spi_enab   002ECE R   |   4 spi_rcv_   002F3B R   |   4 spi_read   002F66 R
  4 spi_sele   002F6D R   |   4 spi_send   002F25 R   |   4 spi_writ   002F46 R
  2 stack_fu   001774 GR  |   2 stack_un   001800 R   |   4 star_tst   001042 R
  4 step       0022B9 R   |   4 stop       0026C7 R   |   4 store_lo   0022E8 R
  4 str_matc   00192F R   |   4 str_tst    000F42 R   |   4 strcmp     0013EF R
  4 strcpy     001400 GR  |   4 strlen     0013E4 GR  |   4 sub24      000187 R
  4 symb_loo   000E93 R   |   4 syntax_e   0016A0 GR  |   4 system_i   0014A9 R
  5 tab_widt   000023 GR  |   4 tb_error   0016A2 GR  |   4 term       001A40 R
  4 term01     001A48 R   |   4 term_exi   001A80 R   |   4 test       003426 R
  4 test_p     0005BD R   |   2 tib        001668 GR  |   4 tick_tst   000FFC R
  5 ticks      00000F R   |   4 timeout    002C89 R   |   5 timer      000012 GR
  4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R   |   4 tk_id      001690 R
  4 to         002279 R   |   4 to_eepro   0007AB R   |   4 to_flash   0007B0 R
  4 to_hex_c   000C7E GR  |   4 to_upper   00188C GR  |   4 token_ch   0010D7 R
  4 token_ex   0010DB R   |   4 tone       002562 R   |   4 try_next   002E5C R
  5 txtbgn     00001B GR  |   5 txtend     00001D GR  |   4 uart1_ge   000954 GR
  4 uart1_in   0008FF R   |   4 uart1_pu   000944 GR  |   4 uart1_qg   00094D GR
  4 uart1_se   00090F R   |   4 ubound     001C4F R   |   4 uflash     002982 R
  4 unlock_e   0006DF R   |   4 unlock_f   0006FA R   |   4 until      002D6D R
  4 user_int   000057 R   |   4 usr        002997 R   |   4 var_name   0011DD GR
  5 vars       000030 GR  |   4 wait       002118 R   |   4 warm_ini   0014DA R
  4 warm_sta   00172C R   |   4 words      002C0C R   |   4 words_co   002C5C R
  4 write      0028A8 R   |   4 write_bl   000860 GR  |   4 write_bu   00079C R
  4 write_by   0007E6 R   |   4 write_ee   000822 R   |   4 write_ex   00085B R
  4 write_fl   00080C R   |   4 write_nb   000885 R   |   2 xstack_f   001738 GR
  2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
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

