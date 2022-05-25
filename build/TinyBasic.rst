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
      00819E CD 9D 2B         [ 4]  280 	call func_eefree 
      0081A1 CD 9C 62         [ 4]  281 	call ubound 
      0081A4 CD 95 7C         [ 4]  282 	call clear_basic
      0081A7 CD A5 60         [ 4]  283 	call beep_1khz  
      0081AA CD 95 29         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A7 95         [ 4]  287 	call qsign 
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
      0081CF CD 9E 4F         [ 4]  300 	call program_info 
      0081D2 CC A5 04         [ 2]  301 	jp run_it_02  
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
      008C6B 60               [ 4]  267 	ret 
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



      008F43 AE B3 EB         [ 1]  832 	ld pad+2,a ; count 
      008F46 16 01 90         [ 2]  833 	ldw x,#pad+3
      008F49 5C CD 99 82      [ 1]  834 	clr in 
      008F4D 4D 26 28         [ 4]  835 	call get_token
      008F50 1E 01            [ 1]  836 	cp a,#TK_INTGR
      008F52 5C CD            [ 1]  837 	jrne 2$
      008F54 B0 2F 4D         [ 2]  838 	cpw x,#1 
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
      008F7B 00 4E            [ 1]  860 	jreq 10$
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
      009070 AE 00 6E         [ 4]  246 	call next_token 
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
      009089 88 FF            [ 1]  260 	ld (y),a 
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
      0090B1 88 A6 80         [ 2]  281 	addw y,(1,sp)
      00129B                        282 	_drop 2 
      0090B4 CC 91            [ 2]    1     addw sp,#2 
      0090B6 5B B1            [ 2]  283 	jra decomp_loop
      0090B7                        284 4$: ; dictionary keyword 
      0090B7 A6               [ 2]  285 	ldw x,(x)
      0090B8 2B 11 01 26      [ 1]  286 	inc in 
      0090BC 05 A6 10 CC      [ 1]  287 	inc in 
      0090C0 91 57 88         [ 2]  288 	cpw x,#REM_IDX
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
      00914E A1 22            [ 1]  376 	jrugt 11$
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



      00926A AE B3 F1 90      [ 1]  260 	clr tab_width  
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
             00 02 A3 00 88
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
      00934D CC 93 F7 A3 00 4E 26   324 err_no_fspace: .asciz "File system full.\n" 
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
      009432 CD 1C 00         [ 4]  457 	call let_var  
      009432 52 04            [ 2]  458 	jra interp_loop 
      00178A                        459 2$:	
      009434 72 5F            [ 1]  460 	cp a,#TK_ARRAY 
      009436 00 0E            [ 1]  461 	jrne 3$
      009438 1F 01 AE         [ 4]  462 	call let_array 
      00943B B3 E9            [ 2]  463 	jra interp_loop
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
      000003 DE 33 71         [ 2]  506 	ldw x,(code_addr,x)
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
      0095AA 6C 96 9F         [ 4]  891 	call next_token 
      0095AD 96 AF            [ 1]  892 	cp a,#TK_CMD 
      0095AF 96 C3            [ 1]  893 	jreq 5$
      0095B1 96 D6            [ 1]  894 	cp a,#TK_NONE  
      0095B3 96 E3            [ 1]  895 	jreq 6$
      0095B5 4D 65            [ 1]  896 	cp a,#TK_COLON 
      0095B7 6D 6F            [ 1]  897 	jreq 5$
      001972                        898 	_unget_token
      0095B9 72 79 20 66 75   [ 1]    1      mov in,in.saved  
      0095BE 6C 6C 0A         [ 4]  899 1$: call expression
      0095C1 00 73            [ 1]  900 	inc (1,sp)
      0095C3 79 6E 74         [ 4]  901 	call next_token 
      0095C6 61 78            [ 1]  902 	cp a,#TK_COMMA 
      0095C8 20 65            [ 1]  903 	jreq 1$ 
      0095CA 72 72            [ 1]  904 4$:	cp a,#TK_RPAREN 
      0095CC 6F 72            [ 1]  905 	jreq 6$
      001987                        906 5$:
      001987                        907 	_unget_token 
      0095CE 0A 00 6D 61 74   [ 1]    1      mov in,in.saved  
      0095D3 68               [ 1]  908 6$:	pop a  
      0095D4 20               [ 4]  909 	ret 
                                    910 
                                    911 ;--------------------------------
                                    912 ;   BASIC commnands 
                                    913 ;--------------------------------
                                    914 
                                    915 ;--------------------------------
                                    916 ;  arithmetic and relational 
                                    917 ;  routines
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    918 ;  operators precedence
                                    919 ;  highest to lowest
                                    920 ;  operators on same row have 
                                    921 ;  same precedence and are executed
                                    922 ;  from left to right.
                                    923 ;	'*','/','%'
                                    924 ;   '-','+'
                                    925 ;   '=','>','<','>=','<=','<>','><'
                                    926 ;   '<>' and '><' are equivalent for not equal.
                                    927 ;--------------------------------
                                    928 
                                    929 ;---------------------
                                    930 ; return array element
                                    931 ; address from @(expr)
                                    932 ; input:
                                    933 ;   A 		TK_ARRAY
                                    934 ; output:
                                    935 ;	X 		element address 
                                    936 ;----------------------
      00198E                        937 get_array_element:
      0095D5 6F 70 65         [ 4]  938 	call func_args 
      0095D8 72 61            [ 1]  939 	cp a,#1
      0095DA 74 69            [ 1]  940 	jreq 1$
      0095DC 6F 6E 20         [ 2]  941 	jp syntax_error
      001998                        942 1$: _xpop 
      0095DF 6F 76            [ 1]    1     ld a,(y)
      0095E1 65               [ 1]    2     ldw x,y 
      0095E2 72 66            [ 2]    3     ldw x,(1,x)
      0095E4 6C 6F 77 0A      [ 2]    4     addw y,#CELL_SIZE 
                                    943     ; ignore A, index < 65536 in any case 
                                    944 	; check for bounds 
      0095E8 00 64 69         [ 2]  945 	cpw x,array_size 
      0095EB 76 69            [ 2]  946 	jrule 3$
                                    947 ; bounds {1..array_size}	
      0095ED 73 69            [ 1]  948 2$: ld a,#ERR_BAD_VALUE 
      0095EF 6F 6E 20         [ 2]  949 	jp tb_error 
      0095F2 62               [ 2]  950 3$: tnzw  x
      0095F3 79 20            [ 1]  951 	jreq 2$ 
      0095F5 30               [ 2]  952 	pushw x 
      0095F6 0A               [ 2]  953 	sllw x 
      0095F7 00 69 6E         [ 2]  954 	addw x,(1,sp) ; index*size_of(int24)
      0095FA 76 61            [ 2]  955 	ldw (1,sp),x  
      0095FC 6C 69 64         [ 2]  956 	ldw x,#tib ; array is below tib 
      0095FF 20 6C 69         [ 2]  957 	subw x,(1,sp)
      0019BB                        958 	_drop 2   
      009602 6E 65            [ 2]    1     addw sp,#2 
      009604 20               [ 4]  959 	ret 
                                    960 
                                    961 
                                    962 ;***********************************
                                    963 ;   expression parse,execute 
                                    964 ;***********************************
                                    965 ;-----------------------------------
                                    966 ; factor ::= ['+'|'-'|e]  var | @ |
                                    967 ;			 integer | function |
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



                                    968 ;			 '('relation')' 
                                    969 ; output:
                                    970 ;   A       token attribute 
                                    971 ;   xstack  value  
                                    972 ; ---------------------------------
                           000001   973 	NEG=1
                           000001   974 	VSIZE=1
      0019BE                        975 factor:
      0019BE                        976 	_vars VSIZE 
      009605 6E 75            [ 2]    1     sub sp,#VSIZE 
      009607 6D 62            [ 1]  977 	clr (NEG,sp)
      009609 65 72 2E         [ 4]  978 	call next_token
      00960C 0A 00            [ 1]  979 1$:	cp a,#TK_PLUS 
      00960E 72 75            [ 1]  980 	jreq 2$
      009610 6E 20            [ 1]  981 	cp a,#TK_MINUS 
      009612 74 69            [ 1]  982 	jrne 4$ 
      009614 6D 65            [ 1]  983 	cpl (NEG,sp)
      0019CF                        984 2$:	
      009616 20 6F 6E         [ 4]  985 	call next_token 
      0019D2                        986 4$:	
      009619 6C 79            [ 1]  987 	cp a,#TK_IFUNC 
      00961B 20 75            [ 1]  988 	jrne 5$ 
      00961D 73 61 67         [ 4]  989 	call get_code_addr 
      009620 65               [ 4]  990 	call (x); result in A:X  
      009621 2E 0A            [ 2]  991 	jra 18$ 
      0019DC                        992 5$:
      009623 00 63            [ 1]  993 	cp a,#TK_INTGR
      009625 6F 6D            [ 1]  994 	jrne 6$
      009627 6D 61 6E         [ 4]  995 	call get_int24 ; A:X
      00962A 64 20            [ 2]  996 	jra 18$
      0019E5                        997 6$:
      00962C 6C 69            [ 1]  998 	cp a,#TK_ARRAY
      00962E 6E 65            [ 1]  999 	jrne 7$
      009630 20 6F 6E         [ 4] 1000 	call get_array_element
      009633 6C 79            [ 2] 1001     jra 71$
      0019EE                       1002 7$:
      009635 20 75            [ 1] 1003 	cp a,#TK_VAR 
      009637 73 61            [ 1] 1004 	jrne 8$
      009639 67 65 2E         [ 4] 1005 	call get_addr 
      0019F5                       1006 71$: ; put value in A:X
      00963C 0A               [ 1] 1007 	ld a,(x)
      00963D 00 64            [ 2] 1008 	ldw x,(1,x)
      00963F 75 70            [ 2] 1009 	jra 18$
      0019FA                       1010 8$:
      009641 6C 69            [ 1] 1011 	cp a,#TK_LABEL 
      009643 63 61            [ 1] 1012 	jrne 9$ 
      009645 74               [ 2] 1013 	pushw x 
      009646 65 20 6E         [ 4] 1014 	call skip_string
      009649 61               [ 2] 1015 	popw x 
      00964A 6D 65 2E         [ 4] 1016 	call search_const 
      00964D 0A               [ 2] 1017 	tnzw x 
      00964E 00 46            [ 1] 1018 	jreq 16$
      009650 69 6C 65         [ 4] 1019 	call get_const_value ; in A:X 
      009653 20 6E            [ 2] 1020 	jra 18$
      001A0E                       1021 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      009655 6F 74            [ 1] 1022 	cp a,#TK_CFUNC 
      009657 20 66            [ 1] 1023 	jrne 12$
      009659 6F 75 6E         [ 4] 1024 	call get_code_addr 
      00965C 64               [ 4] 1025 	call(x)
      00965D 2E               [ 1] 1026 	clrw x 
      00965E 0A               [ 1] 1027 	rlwa x  ; char>int24 in A:X 
      00965F 00 62            [ 2] 1028 	jra 18$ 	 
      001A1A                       1029 12$:			
      009661 61 64            [ 1] 1030 	cp a,#TK_LPAREN
      009663 20 76            [ 1] 1031 	jrne 16$
      009665 61 6C 75         [ 4] 1032 	call expression
      009668 65 2E            [ 1] 1033 	ld a,#TK_RPAREN 
      00966A 0A 00 46         [ 4] 1034 	call expect
      001A26                       1035 	_xpop 
      00966D 69 6C            [ 1]    1     ld a,(y)
      00966F 65               [ 1]    2     ldw x,y 
      009670 20 69            [ 2]    3     ldw x,(1,x)
      009672 6E 20 65 78      [ 2]    4     addw y,#CELL_SIZE 
      009676 74 65            [ 2] 1036 	jra 18$	
      001A31                       1037 16$:
      009678 6E 64 65         [ 2] 1038 	jp syntax_error
      001A34                       1039 18$: 
      00967B 64 20            [ 1] 1040 	tnz (NEG,sp)
      00967D 6D 65            [ 1] 1041 	jreq 20$
      00967F 6D 6F 72         [ 4] 1042 	call neg_ax   
      001A3B                       1043 20$:
      001A3B                       1044 	_xpush 
      009682 79 2C 20 63      [ 2]    1     subw y,#CELL_SIZE
      009686 61 6E            [ 1]    2     ld (y),a 
      009688 27 74 20         [ 2]    3     ldw (1,y),x 
      001A44                       1045 	_drop VSIZE
      00968B 62 65            [ 2]    1     addw sp,#VSIZE 
      00968D 20               [ 4] 1046 	ret
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
      001A47                       1057 term:
      001A47                       1058 	_vars VSIZE
      00968E 72 75            [ 2]    1     sub sp,#VSIZE 
                                   1059 ; first factor 	
      009690 6E 20 66         [ 4] 1060 	call factor
      001A4C                       1061 term01:	 ; check for  operator '*'|'/'|'%' 
      009693 72 6F 6D         [ 4] 1062 	call next_token
      009696 20 74            [ 1] 1063 	ld (MULOP,sp),a
      009698 68 65            [ 1] 1064 	cp a,#CMD_END
      00969A 72 65            [ 1] 1065 	jrult 8$
      00969C 2E 0A            [ 1] 1066 	and a,#TK_GRP_MASK
      00969E 00 4E            [ 1] 1067 	cp a,#TK_GRP_MULT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      0096A0 6F 20            [ 1] 1068 	jreq 1$
      0096A2 64 61            [ 2] 1069 	jra 8$
      001A5D                       1070 1$:	; got *|/|%
                                   1071 ;second factor
      0096A4 74 61 20         [ 4] 1072 	call factor
      001A60                       1073 2$: ; select operation 	
      0096A7 66 6F            [ 1] 1074 	ld a,(MULOP,sp) 
      0096A9 75 6E            [ 1] 1075 	cp a,#TK_MULT 
      0096AB 64 2E            [ 1] 1076 	jrne 3$
                                   1077 ; '*' operator
      0096AD 0A 00 4E         [ 4] 1078 	call mul24 
      0096B0 6F 20            [ 2] 1079 	jra term01
      0096B2 70 72            [ 1] 1080 3$: cp a,#TK_DIV 
      0096B4 6F 67            [ 1] 1081 	jrne 4$ 
                                   1082 ; '/' operator	
      0096B6 72 61 6D         [ 4] 1083 	call div24 
      0096B9 20 69            [ 2] 1084 	jra term01 
      001A74                       1085 4$: ; '%' operator
      0096BB 6E 20 52         [ 4] 1086 	call mod24
      0096BE 41 4D            [ 2] 1087 	jra term01 
      001A79                       1088 8$: ; term end 
      001A79                       1089 	_unget_token
      0096C0 21 0A 00 46 69   [ 1]    1      mov in,in.saved  
      001A7E                       1090 9$: 
      001A7E                       1091 term_exit:
      001A7E                       1092 	_drop VSIZE 
      0096C5 6C 65            [ 2]    1     addw sp,#VSIZE 
      0096C7 20               [ 4] 1093 	ret 
                                   1094 
                                   1095 ;-------------------------------
                                   1096 ;  expr ::= term [['+'|'-'] term]*
                                   1097 ;  result range {-32768..32767}
                                   1098 ;  output:
                                   1099 ;   A    token attribute 
                                   1100 ;   xstack	 result    
                                   1101 ;-------------------------------
                           000001  1102 	OP=1 
                           000001  1103 	VSIZE=1 
      001A81                       1104 expression:
      001A81                       1105 	_vars VSIZE 
      0096C8 73 79            [ 2]    1     sub sp,#VSIZE 
                                   1106 ; first term 	
      0096CA 73 74 65         [ 4] 1107 	call term
      001A86                       1108 1$:	; operator '+'|'-'
      0096CD 6D 20 66         [ 4] 1109 	call next_token
      0096D0 75 6C            [ 1] 1110 	ld (OP,sp),a 
      0096D2 6C 2E            [ 1] 1111 	cp a,#CMD_END 
      0096D4 0A 00            [ 1] 1112 	jrult 8$ 
      0096D6 42 75            [ 1] 1113 	and a,#TK_GRP_MASK
      0096D8 66 66            [ 1] 1114 	cp a,#TK_GRP_ADD 
      0096DA 65 72            [ 1] 1115 	jreq 2$ 
      0096DC 20 66            [ 2] 1116 	jra 8$
      001A97                       1117 2$: ; second term 
      0096DE 75 6C 6C         [ 4] 1118 	call term
      0096E1 0A 00            [ 1] 1119 	ld a,(OP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      0096E3 6F 76            [ 1] 1120 	cp a,#TK_PLUS 
      0096E5 65 72            [ 1] 1121 	jrne 4$
                                   1122 ; '+' operator	
      0096E7 66 6C 6F         [ 4] 1123 	call add24
      0096EA 77 0A            [ 2] 1124 	jra 1$ 
      001AA5                       1125 4$:	; '-' operator 
      0096EC 00 0A 72         [ 4] 1126 	call sub24
      0096EF 75 6E            [ 2] 1127 	jra 1$
      001AAA                       1128 8$: ; end of expression 
      001AAA                       1129 	_unget_token	
      0096F1 20 74 69 6D 65   [ 1]    1      mov in,in.saved  
      001AAF                       1130 9$: ; expression value on xstack 
      0096F6 20 65            [ 1] 1131 	ld a,#TK_INTGR 	
      001AB1                       1132 expr_exit:
      001AB1                       1133 	_drop VSIZE 
      0096F8 72 72            [ 2]    1     addw sp,#VSIZE 
      0096FA 6F               [ 4] 1134 	ret 
                                   1135 
                                   1136 ;---------------------------------------------
                                   1137 ; rel ::= expr rel_op expr
                                   1138 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1139 ;  relation return  integer , zero is false 
                                   1140 ;  output:
                                   1141 ;    A 		token attribute  
                                   1142 ;	 xstack		value  
                                   1143 ;---------------------------------------------
                           000001  1144 	RELOP=1
                           000001  1145 	VSIZE=1 
      001AB4                       1146 relation: 
      001AB4                       1147 	_vars VSIZE
      0096FB 72 2C            [ 2]    1     sub sp,#VSIZE 
      0096FD 20 00 0A         [ 4] 1148 	call expression
                                   1149 ; expect rel_op or leave 
      009700 63 6F 6D         [ 4] 1150 	call next_token 
      009703 70 69            [ 1] 1151 	ld (RELOP,sp),a 
      009705 6C 65            [ 1] 1152 	and a,#TK_GRP_MASK
      009707 20 65            [ 1] 1153 	cp a,#TK_GRP_RELOP 
      009709 72 72            [ 1] 1154 	jrne 8$
      001AC4                       1155 2$:	; expect another expression
      00970B 6F 72 2C         [ 4] 1156 	call expression
      00970E 20 00 6C         [ 4] 1157 	call cp24 
      001ACA                       1158 	_xpop  
      009711 61 73            [ 1]    1     ld a,(y)
      009713 74               [ 1]    2     ldw x,y 
      009714 20 74            [ 2]    3     ldw x,(1,x)
      009716 6F 6B 65 6E      [ 2]    4     addw y,#CELL_SIZE 
      00971A 20               [ 1] 1159 	tnz a 
      00971B 69 64            [ 1] 1160 	jrmi 4$
      00971D 3A 20            [ 1] 1161 	jrne 5$
      00971F 00 02 00 0E      [ 1] 1162 	mov acc8,#2 ; i1==i2
      009720 20 0A            [ 2] 1163 	jra 6$ 
      001ADE                       1164 4$: ; i1<i2
      009720 A6 02 00 0E      [ 1] 1165 	mov acc8,#4 
      009722 20 04            [ 2] 1166 	jra 6$
      001AE4                       1167 5$: ; i1>i2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      009722 72 0A 00 23      [ 1] 1168 	mov acc8,#1  
      001AE8                       1169 6$:
      009726 4C               [ 1] 1170 	clrw x 
      009727 88 AE 96         [ 1] 1171 	ld a, acc8  
      00972A ED CD            [ 1] 1172 	and a,(RELOP,sp)
      00972C 8A 21            [ 1] 1173 	jreq rel_exit
      00972E 84               [ 2] 1174 	cplw x 
      00972F AE 95            [ 1] 1175 	ld a,#255 
      009731 93 72            [ 2] 1176 	jra rel_exit   	
      009733 5F 00            [ 1] 1177 8$: ld a,(RELOP,sp)
      009735 0E 48            [ 1] 1178 	jreq 10$ 
      001AF9                       1179 	_unget_token
      009737 72 59 00 0E C7   [ 1]    1      mov in,in.saved  
      001AFE                       1180 10$:
      001AFE                       1181 	_xpop
      00973C 00 0F            [ 1]    1     ld a,(y)
      00973E 72               [ 1]    2     ldw x,y 
      00973F BB 00            [ 2]    3     ldw x,(1,x)
      009741 0E FE CD 8A      [ 2]    4     addw y,#CELL_SIZE 
      001B07                       1182 rel_exit: 
      001B07                       1183 	_drop VSIZE
      009745 21 CE            [ 2]    1     addw sp,#VSIZE 
      009747 00               [ 4] 1184 	ret 
                                   1185 
                                   1186 ;--------------------------------------------
                                   1187 ; condition for IF and UNTIL 
                                   1188 ; operators: AND,OR,XOR 
                                   1189 ;--------------------------------------------
                           000001  1190 	COND=1 
                           000001  1191 	VSIZE=1 
      001B0A                       1192 condition:
      009748 05 C6            [ 1] 1193 	push #0 
      00974A 00 04 90         [ 4] 1194 	call relation 
      001B0F                       1195 	_xpush 
      00974D 5F 90 02 CD      [ 2]    1     subw y,#CELL_SIZE
      009751 87 20            [ 1]    2     ld (y),a 
      009753 CE 00 05         [ 2]    3     ldw (1,y),x 
      009756 C6 00 02         [ 4] 1196 	call next_token 
      009759 CD 9F            [ 1] 1197 	cp a,#TK_AND 
      00975B C1 AE            [ 1] 1198 	jrmi 8$ 
      00975D 97 10            [ 1] 1199 	cp a,#TK_XOR+1 
      00975F CD 8A            [ 1] 1200 	jrpl 8$ 
      009761 21 C6            [ 1] 1201 	ld (COND,sp),a ; TK_AND|TK_OR|TK_XOR 
      009763 00 03 5F         [ 4] 1202 	call relation 
      009766 97 72 BB         [ 1] 1203 	ld acc24,a 
      009769 00 05 F6         [ 2] 1204 	ldw acc16,x 
      001B2E                       1205 	_xpop
      00976C 5F 97            [ 1]    1     ld a,(y)
      00976E CD               [ 1]    2     ldw x,y 
      00976F 98 76            [ 2]    3     ldw x,(1,x)
      009771 20 35 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009773 88               [ 1] 1206 	push a
      009773 88 AE            [ 1] 1207 	ld a,(COND+1,sp)
      009775 96 FF            [ 1] 1208 	cp a,#TK_XOR 
      009777 CD 8A            [ 1] 1209 	jreq 7$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009779 21 84            [ 1] 1210 	cp a,#TK_OR 
      00977B AE 95            [ 1] 1211 	jreq 6$
                                   1212 ; AND
      00977D 93 72            [ 1] 1213 	ld a,(1,sp) 
      00977F 5F 00 0E         [ 1] 1214 	and a,acc24
      009782 48 72            [ 1] 1215 	ld (1,sp),a 
      009784 59               [ 1] 1216 	ld a,xh  
      009785 00 0E C7         [ 1] 1217 	and a,acc16 
      009788 00               [ 1] 1218 	ld xh,a 
      009789 0F               [ 1] 1219 	ld a,xl 
      00978A 72 BB 00         [ 1] 1220 	and a,acc8 
      00978D 0E               [ 1] 1221 	ld xl,a 
      00978E FE               [ 1] 1222 	pop a 
      00978F CD 8A            [ 2] 1223 	jra 9$
      001B56                       1224 6$: ; OR 
      009791 21 AE            [ 1] 1225 	ld a,(1,sp) 
      009793 16 68 CD         [ 1] 1226 	or a,acc24
      009796 8A 21            [ 1] 1227 	ld (1,sp),a 
      009798 A6               [ 1] 1228 	ld a,xh  
      009799 0D CD 89         [ 1] 1229 	or a,acc16 
      00979C C4               [ 1] 1230 	ld xh,a 
      00979D CE               [ 1] 1231 	ld a,xl 
      00979E 00 01 CD         [ 1] 1232 	or a,acc8 
      0097A1 8A               [ 1] 1233 	ld xl,a 
      0097A2 8E               [ 1] 1234 	pop a 
      0097A3 A6 5E            [ 2] 1235 	jra 9$  
      001B6A                       1236 7$: ; XOR 
      0097A5 CD 89            [ 1] 1237 	ld a,(1,sp) 
      0097A7 C4 AE 17         [ 1] 1238 	xor a,acc24
      0097AA FF 94            [ 1] 1239 	ld (1,sp),a 
      0097AC 9E               [ 1] 1240 	ld a,xh  
      0097AC CD 95 5A         [ 1] 1241 	xor a,acc16 
      0097AF 95               [ 1] 1242 	ld xh,a 
      0097AF A6               [ 1] 1243 	ld a,xl 
      0097B0 0D CD 89         [ 1] 1244 	xor a,acc8 
      0097B3 C4               [ 1] 1245 	ld xl,a 
      0097B4 A6               [ 1] 1246 	pop a 
      0097B5 3E CD            [ 2] 1247 	jra 9$ 
      001B7E                       1248 8$: _unget_token 
      0097B7 89 C4 CD 8B 26   [ 1]    1      mov in,in.saved  
      001B83                       1249 	_xpop 
      0097BC 72 5D            [ 1]    1     ld a,(y)
      0097BE 00               [ 1]    2     ldw x,y 
      0097BF 04 27            [ 2]    3     ldw x,(1,x)
      0097C1 ED CD 91 5E      [ 2]    4     addw y,#CELL_SIZE 
      001B8C                       1250 9$:	_drop VSIZE 
      0097C5 72 5D            [ 2]    1     addw sp,#VSIZE 
      0097C7 00               [ 4] 1251 	ret 
                                   1252 
                                   1253 
                                   1254 ;--------------------------------------------
                                   1255 ; BASIC: HEX 
                                   1256 ; select hexadecimal base for integer print
                                   1257 ;---------------------------------------------
      001B8F                       1258 hex_base:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      0097C8 04 27 E4 0A      [ 1] 1259 	mov base,#16 
      0097CB 81               [ 4] 1260 	ret 
                                   1261 
                                   1262 ;--------------------------------------------
                                   1263 ; BASIC: DEC 
                                   1264 ; select decimal base for integer print
                                   1265 ;---------------------------------------------
      001B94                       1266 dec_base:
      0097CB C6 00 02 C1      [ 1] 1267 	mov base,#10
      0097CF 00               [ 4] 1268 	ret 
                                   1269 
                                   1270 ;------------------------
                                   1271 ; BASIC: FREE 
                                   1272 ; return free size in RAM 
                                   1273 ; output:
                                   1274 ;   A:x		size 
                                   1275 ;--------------------------
      001B99                       1276 free:
      0097D0 04 2B            [ 2] 1277 	pushw y 
      0097D2 1D               [ 1] 1278 	clr a 
      0097D3 AE 16 68         [ 2] 1279 	ldw x,#tib 
      0097D3 72 01 00 23      [ 2] 1280 	ldw y,txtbgn 
      0097D7 D7 CE 00 05      [ 2] 1281 	cpw y,#app_space
      0097DB 72 BB            [ 1] 1282 	jrult 1$
      0097DD 00 01 C3         [ 2] 1283 	subw x,#free_ram 
      0097E0 00 1E            [ 2] 1284 	jra 2$ 
      001BAE                       1285 1$:	
      0097E2 2A C8 CF 00      [ 2] 1286 	subw x,txtend
      0097E6 05 E6            [ 2] 1287 2$:	popw y 
      0097E8 02               [ 4] 1288 	ret 
                                   1289 
                                   1290 ;------------------------------
                                   1291 ; BASIC: SIZE 
                                   1292 ; command that print 
                                   1293 ; program start addres and size 
                                   1294 ;------------------------------
      001BB5                       1295 cmd_size:
      0097E9 C7 00 04         [ 1] 1296 	push base 
      0097EC 35 03 00         [ 2] 1297 	ldw x,#PROG_ADDR 
      0097EF 02 09 A1         [ 4] 1298 	call puts 
      0097F0 CE 00 1B         [ 2] 1299 	ldw x,txtbgn     
      0097F0 CD 98 21 A1      [ 1] 1300 	mov base,#16 
      0097F4 00 27 DC         [ 4] 1301 	call prt_i16
      0097F7 A1 80 26         [ 1] 1302 	pop base 
      0097FA 06 CD 98         [ 2] 1303 	ldw x,#PROG_SIZE 
      0097FD 3A FD 20         [ 4] 1304 	call puts 
      009800 EF 00 1D         [ 2] 1305 	ldw x,txtend 
      009801 72 B0 00 1B      [ 2] 1306 	subw x,txtbgn 
      009801 A1 85 26         [ 4] 1307 	call prt_i16
      009804 05 CD 9C         [ 2] 1308 	ldw x,#STR_BYTES 
      009807 80 20 E6         [ 4] 1309 	call puts  
      00980A 81               [ 4] 1310 	ret 
                                   1311 
                                   1312 
                                   1313 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



                                   1314 ; BASIC: UBOUND  
                                   1315 ; return array variable size 
                                   1316 ; and set 'array_size' variable 
                                   1317 ; output:
                                   1318 ;   A:X 	array_size
                                   1319 ;--------------------------
      001BE2                       1320 ubound:
      00980A A1 05 26         [ 4] 1321 	call free 
      00980D 05 CD            [ 1] 1322 	ld a,#CELL_SIZE 
      00980F 9C               [ 4] 1323 	mul x,a 
      009810 7B 20 DD         [ 2] 1324 	ldw array_size,x
      009813 4F               [ 1] 1325 	clr a 
      009813 A1               [ 4] 1326 	ret 
                                   1327 
                                   1328 ;-----------------------------
                                   1329 ; BASIC: LET var=expr 
                                   1330 ; variable assignement 
                                   1331 ; output:
                                   1332 ;   A 		TK_NONE 
                                   1333 ;-----------------------------
      001BED                       1334 let::
      009814 0A 27 D9         [ 4] 1335 	call next_token 
      009817 A1 03            [ 1] 1336 	cp a,#TK_VAR 
      009819 CD 98            [ 1] 1337 	jreq let_var
      00981B 47 20            [ 1] 1338 	cp a,#TK_ARRAY 
      00981D D2 CC            [ 1] 1339 	jreq  let_array
      00981F 97 20 A0         [ 2] 1340 	jp syntax_error
      009821                       1341 let_array:
      009821 C6 00 02         [ 4] 1342 	call get_array_element
      009824 C7 00            [ 2] 1343 	jra let_eval 
      001C00                       1344 let_var:
      009826 03 C0 00         [ 4] 1345 	call get_addr
      001C03                       1346 let_eval:
      009829 04 27 0D         [ 2] 1347 	ldw ptr16,x  ; variable address 
      00982C CD 17 A1         [ 4] 1348 	call next_token 
      00982C CE 00            [ 1] 1349 	cp a,#TK_EQUAL
      00982E 05 72            [ 1] 1350 	jreq 1$
      009830 BB 00 01         [ 2] 1351 	jp syntax_error
      001C10                       1352 1$:	
      009833 F6 5C 72         [ 4] 1353 	call expression    
      009836 5C 00            [ 1] 1354 	cp a,#TK_INTGR 
      009838 02 81            [ 1] 1355 	jreq 2$
      00983A CC 16 A0         [ 2] 1356 	jp syntax_error
      001C1A                       1357 2$:	
      001C1A                       1358 	_xpop ; value 
      00983A FE DE            [ 1]    1     ld a,(y)
      00983C B3               [ 1]    2     ldw x,y 
      00983D F1 01            [ 2]    3     ldw x,(1,x)
      00983E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      001C23                       1359 3$:
      00983E 72 5C 00 02      [ 4] 1360 	ld [ptr16],a
      009842 72 5C 00 02      [ 1] 1361 	inc ptr8  
      009846 81 CF 00 19      [ 5] 1362 	ldw [ptr16],x 
      009847 81               [ 4] 1363 	ret 
                                   1364 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1365 
                                   1366 ;--------------------------
                                   1367 ; return constant value 
                                   1368 ; from it's record address
                                   1369 ; input:
                                   1370 ;	X	*const record 
                                   1371 ; output:
                                   1372 ;   A:X   const  value
                                   1373 ;--------------------------
      001C30                       1374 get_const_value: ; -- i 
      009847 F6               [ 1] 1375 	ld a,(x) ; record size 
      009848 27 03            [ 1] 1376 	sub a,#3 ; * value 
      00984A 5C               [ 1] 1377 	push a 
      00984B 20 FA            [ 1] 1378 	push #0 
      00984D 5C 72 B0         [ 2] 1379 	addw x,(1,sp)
      009850 00               [ 1] 1380 	ld a,(x)
      009851 05 CF            [ 2] 1381 	ldw x,(1,x)
      001C3C                       1382 	_drop 2
      009853 00 01            [ 2]    1     addw sp,#2 
      009855 81               [ 4] 1383 	ret 
                                   1384 
                                   1385 
                                   1386 ;--------------------------
                                   1387 ; list constants in EEPROM 
                                   1388 ; call when using LIST \C 
                                   1389 ;-------------------------
                           000001  1390 	COUNT=1
                           000003  1391 	YTEMP=3
                           000004  1392 	VSIZE=4 
      009856                       1393 list_const:
      009856 FE 72            [ 2] 1394 	pushw y 
      001C41                       1395 	_vars 4 
      009858 5C 00            [ 2]    1     sub sp,#4 
      00985A 02               [ 1] 1396 	clrw x 
      00985B 72 5C            [ 2] 1397 	ldw (COUNT,sp),x  
      00985D 00 02 81 00      [ 2] 1398 	ldw Y,#EEPROM_BASE 
      009860 90 C3 00 24      [ 2] 1399 1$:	cpw y,free_eeprom 
      009860 F6 EE            [ 1] 1400 	jruge 9$
      009862 01 72            [ 2] 1401     ldw (YTEMP,sp),y 
      009864 5C               [ 1] 1402 	ldw x,y
      009865 00               [ 1] 1403 	incw x 
      009866 02 72 5C         [ 4] 1404 	call puts  
      009869 00 02            [ 1] 1405 	ld a,#'= 
      00986B 72 5C 00         [ 4] 1406 	call putc 
      00986E 02 81            [ 2] 1407 	ldw x,(YTEMP,sp)
      009870 CD 1C 30         [ 4] 1408 	call get_const_value 
      009870 F6 72 5C         [ 1] 1409 	ld acc24,a 
      009873 00 02 81         [ 2] 1410 	ldw acc16,x 
      009876 CD 18 0D         [ 4] 1411 	call prt_acc24
      009876 72 5F            [ 1] 1412 	ld a,#CR 
      009878 00 0D CF         [ 4] 1413 	call putc 
      00987B 00 0E            [ 2] 1414 	ldw x,(COUNT,sp)
      00987D A6               [ 1] 1415 	incw x 
      00987E 10 C1            [ 2] 1416 	ldw (COUNT,sp),x 
      009880 00 0B 27 09      [ 1] 1417 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009884 72 0F            [ 2] 1418 	ldw y,(YTEMP,sp)
      009886 00 0E            [ 1] 1419 	ld a,(y)
      009888 04 72 53         [ 1] 1420 	ld acc8,a
      00988B 00 0D 00 0D      [ 2] 1421 	addw y,acc16 
      00988D 20 C5            [ 2] 1422 	jra 1$ 
      001C85                       1423 9$:	
      00988D A6 FF            [ 2] 1424 	ldw x,(COUNT,sp)
      00988F CD 98 B3         [ 4] 1425 	call prt_i16 
      009892 CD 92 05         [ 2] 1426 	ldw x,#CONST_COUNT 
      009895 88 CD 8A         [ 4] 1427 	call puts 
      001C90                       1428 	_drop VSIZE 
      009898 21 84            [ 2]    1     addw sp,#VSIZE 
      00989A 81 85            [ 2] 1429 	popw y 
      00989B 81               [ 4] 1430 	ret 
                                   1431 
      00989B 90 F6 93 EE 01 72 A9  1432 CONST_COUNT: .asciz " constants in EEPROM\n"
             00 03 C7 00 0D CF 00
             0E CD 98 8D A6 20 CD
             89
                                   1433 
                                   1434 
                                   1435 ;--------------------------
                                   1436 ; BASIC: EEFREE 
                                   1437 ; eeprom_free 
                                   1438 ; search end of data  
                                   1439 ; in EEPROM 
                                   1440 ; input:
                                   1441 ;    none 
                                   1442 ; output:
                                   1443 ;    A:X     address free
                                   1444 ;-------------------------
      001CAB                       1445 func_eefree:
      0098B1 C4 81 00         [ 2] 1446 	ldw x,#EEPROM_BASE 
      0098B3 35 08 00 0E      [ 1] 1447 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0098B3 52 04 0F         [ 2] 1448     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      0098B6 02 0F            [ 1] 1449 	jruge 8$ ; no free space 
      0098B8 01               [ 1] 1450 2$: ld a,(x)
      0098B9 4D 27            [ 1] 1451 	jrne 3$
      0098BB 11               [ 1] 1452 	incw x 
      0098BC C6 00 0B A1      [ 1] 1453 	dec acc8 
      0098C0 0A 26            [ 1] 1454 	jrne 2$
      0098C2 0A 72 0F         [ 2] 1455 	subw x,#8 
      0098C5 00 0D            [ 2] 1456 	jra 9$  
      0098C7 05               [ 1] 1457 3$: ld a,(x)
      0098C8 03               [ 1] 1458 	incw x
      0098C9 01               [ 1] 1459 	tnz a  
      0098CA CD 82            [ 1] 1460 	jrne 3$
      0098CC 8D               [ 2] 1461 	decw x   
      0098CD 20 E0            [ 2] 1462 	jra 1$ 
      0098CD AE               [ 1] 1463 8$: clrw x ; no free space 
      0098CE 16               [ 1] 1464 9$: clr a 
      0098CF 68 1C 00         [ 2] 1465 	ldw free_eeprom,x ; save in system variable 
      0098D2 50               [ 4] 1466 	ret 
                                   1467 
                           000005  1468 CONST_REC_XTRA_BYTES=5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



                                   1469 ;--------------------------
                                   1470 ; search constant name 
                                   1471 ; format of constant record  
                                   1472 ;   .byte record length 
                                   1473 ;         = strlen(name)+5 
                                   1474 ;   .asciz name (variable length)
                                   1475 ;   .int24 value (3 bytes )
                                   1476 ; a constant record use 7+ bytes
                                   1477 ; constants are saved in EEPROM  
                                   1478 ; input:
                                   1479 ;    X     *name
                                   1480 ; output:
                                   1481 ;    X     address|0
                                   1482 ; use:
                                   1483 ;   A,Y, acc16 
                                   1484 ;-------------------------
                           000001  1485 	NAMEPTR=1 ; target name pointer 
                           000003  1486 	EEPTR=3   ; walking pointer in EEPROM
                           000005  1487 	RECLEN=5  ; record length of target
                           000005  1488 	VSIZE=5
      001CD4                       1489 search_const:
      0098D3 5A 7F            [ 2] 1490 	pushw y 
      0098D5                       1491 	_vars VSIZE
      0098D5 C6 00            [ 2]    1     sub sp,#VSIZE 
      0098D7 0B CD 83 89      [ 1] 1492 	clr acc16 
      0098DB AB 30 A1         [ 4] 1493 	call strlen 
      0098DE 3A 2B            [ 1] 1494 	add a,#CONST_REC_XTRA_BYTES
      0098E0 02 AB            [ 1] 1495 	ld (RECLEN,sp),a    
      0098E2 07 01            [ 2] 1496 	ldw (NAMEPTR,sp),x
      0098E3 90 AE 40 00      [ 2] 1497 	ldw y,#EEPROM_BASE 
      0098E3 5A F7            [ 2] 1498 1$:	ldw x,(NAMEPTR,sp)
      0098E5 0C 02            [ 2] 1499 	ldw (EEPTR,sp),y
      0098E7 C6 00 0D CA      [ 2] 1500 	cpw y, free_eeprom 
      0098EB 00 0E            [ 1] 1501 	jruge 7$ ; no match found 
      0098ED CA 00            [ 1] 1502 	ld a,(y)
      0098EF 0F 26            [ 1] 1503 	cp a,(RECLEN,sp)
      0098F1 E3 C6            [ 1] 1504 	jrne 2$ 
      0098F3 00 0B            [ 1] 1505 	incw y 
      0098F5 A1 10 27         [ 4] 1506 	call strcmp
      0098F8 08 7B            [ 1] 1507 	jrne 8$ ; match found 
      001D00                       1508 2$: ; skip this one 	
      0098FA 01 27            [ 2] 1509 	ldW Y,(EEPTR,sp)
      0098FC 0A A6            [ 1] 1510 	ld a,(y)
      0098FE 2D 20 02         [ 1] 1511 	ld acc8,a 
      009901 72 B9 00 0D      [ 2] 1512 	addw y,acc16 
      009901 A6 24            [ 2] 1513 	jra 1$  
      001D0D                       1514 7$: ; no match found 
      009903 5A F7            [ 1] 1515 	clr (EEPTR,sp)
      009905 0C 02            [ 1] 1516 	clr (EEPTR+1,sp)
      009907                       1517 8$: ; match found 
      009907 7B 02            [ 2] 1518 	ldw x,(EEPTR,sp) ; record address 
      001D13                       1519 9$:	_DROP VSIZE
      009909 5B 04            [ 2]    1     addw sp,#VSIZE 
      00990B 81 85            [ 2] 1520 	 popw y 
      00990C 81               [ 4] 1521 	 ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



                                   1522 
                                   1523 
                                   1524 ;--------------------------------------------
                                   1525 ; BASIC: CONST name=value [, name=value]*
                                   1526 ; define constant(s) saved in EEPROM
                                   1527 ;--------------------------------------------
                           000001  1528 	CNAME=1 
                           000003  1529 	BUFPTR=3
                           000005  1530 	RECLEN=5
                           000006  1531 	UPDATE=6
                           000007  1532 	YSAVE=7
                           000008  1533 	VSIZE=8 
      001D18                       1534 cmd_const:
      00990C A1 61            [ 2] 1535 	pushw y 
      001D1A                       1536 	_vars VSIZE 
      00990E 2A 01            [ 2]    1     sub sp,#VSIZE 
      009910 81 A1            [ 1] 1537 	clr (UPDATE,sp)
      009912 7A 22 FB         [ 4] 1538 	call next_token 
      009915 A0 20            [ 1] 1539 	cp a,#TK_CHAR 
      009917 81 0D            [ 1] 1540 	jrne 0$
      009918 CD 17 F0         [ 4] 1541 	call get_char 
      009918 89 52            [ 1] 1542 	and a,#0xDF 
      00991A 03 72            [ 1] 1543 	cp a,#'U 
      00991C 5F 00            [ 1] 1544 	jrne 1$
      00991E 0D 72            [ 1] 1545 	cpl (UPDATE,sp)
      009920 5F 00            [ 2] 1546 	jra const_loop 
      009922 0E 72            [ 1] 1547 0$: cp a,#TK_LABEL 
      009924 5F 00            [ 1] 1548 	jreq cloop_1
      009926 0F 0F 01         [ 2] 1549 1$: jp syntax_error
      001D39                       1550 const_loop: 
      009929 A6 0A            [ 1] 1551 	ld a,#TK_LABEL 
      00992B 6B 02 F6         [ 4] 1552 	call expect  
      001D3E                       1553 cloop_1: 
      00992E 27 47            [ 2] 1554 	ldw (CNAME,sp),x ; *const_name
      009930 A1 2D 26         [ 4] 1555 	call skip_string
      009933 04 03            [ 2] 1556 	ldw x,(CNAME,sp)
      009935 01 20 08         [ 4] 1557 	call strlen  
      009938 A1 24            [ 1] 1558 	add a,#CONST_REC_XTRA_BYTES 
      00993A 26 06            [ 1] 1559 	ld (RECLEN,sp),a 
                                   1560 ; copy name in buffer  
      00993C A6 10            [ 2] 1561 	ldw y,(CNAME,sp) 
      00993E 6B 02 5C         [ 2] 1562 	ldw x,#tib  
      009941 F6 05            [ 1] 1563 	ld a,(RECLEN,sp)
      009942 F7               [ 1] 1564 	ld (x),a 
      009942 A1               [ 1] 1565 	incw x  
      009943 61 2B 02         [ 4] 1566 	call strcpy 
      009946 A0 20            [ 2] 1567 	ldw (BUFPTR,sp),x 
                                   1568 ; x not updated by strcpy 
                                   1569 ; BUFPTR must be incremented 
                                   1570 ; to point after name 
      009948 A1               [ 1] 1571 	clrw x 
      009949 30 2B            [ 1] 1572 	ld a,(RECLEN,sp)
      00994B 2B A0            [ 1] 1573 	sub a,#CONST_REC_XTRA_BYTES-1
      00994D 30               [ 1] 1574 	ld xl,a  
      00994E A1 0A 2B         [ 2] 1575 	addw x,(BUFPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      009951 06 A0            [ 2] 1576 	ldw (BUFPTR,sp),x 
      009953 07 11            [ 1] 1577 	ld a,#TK_EQUAL 
      009955 02 2A 1F         [ 4] 1578 	call expect 
      009958 6B 03            [ 2] 1579 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      00995A 7B 02 CD         [ 4] 1580 	call expression 
      00995D 82 AA            [ 1] 1581 	cp a,#TK_INTGR 
      00995F 7B 03            [ 1] 1582 	jreq 5$ 
      009961 CB 00 0F         [ 2] 1583 	jp syntax_error 
      001D76                       1584 5$:	_xpop 
      009964 C7 00            [ 1]    1     ld a,(y)
      009966 0F               [ 1]    2     ldw x,y 
      009967 4F C9            [ 2]    3     ldw x,(1,x)
      009969 00 0E C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00996D 0E 4F            [ 2] 1585 	ldw (YSAVE,sp),y ; save xtack pointer 
      00996F C9 00            [ 2] 1586 	ldw y,(BUFPTR,sp)
      009971 0D C7            [ 1] 1587 	ld (y),a 
      009973 00 0D 20         [ 2] 1588 	ldw (1,y),x 
                                   1589 ; record completed in buffer 
                                   1590 ; check if constant already exist 
                                   1591 ; if exist and \U option then update  
      009976 C9 0D 01 27      [ 1] 1592 	clr farptr 
      00997A 03 CD            [ 2] 1593 	ldw x,(CNAME,sp)
      00997C 82 8D D4         [ 4] 1594 	call search_const 
      00997E 5D               [ 2] 1595 	tnzw x 
      00997E 5B 03            [ 1] 1596 	jreq 6$ ; new constant  
      009980 85 81            [ 1] 1597 	tnz (UPDATE,sp)
      009982 27 1B            [ 1] 1598 	jreq 8$ 
      009982 52 05            [ 2] 1599 	jra 7$	
      001D9A                       1600 6$:	
      009984 17 04 24         [ 2] 1601 	ldw x,free_eeprom  
      009986                       1602 7$:	
      009986 1F 02 F6         [ 2] 1603 	ldw farptr+1,x 
      009989 A4 0F 6B         [ 2] 1604 	ldw x,#tib 
      00998C 01 16            [ 1] 1605 	ld a,(RECLEN,sp)
      00998E 04 5C 85         [ 4] 1606 	call write_nbytes
                                   1607 ; update free_eeprom 
      009990 5F               [ 1] 1608 	clrw x 
      009990 90 F6            [ 1] 1609 	ld a,(RECLEN,sp)
      009992 27               [ 1] 1610 	ld xl,a 
      009993 1B 0D 01 27      [ 2] 1611 	addw x,free_eeprom 
      009997 0A F1 26         [ 2] 1612 	ldw free_eeprom,x
      001DB3                       1613 8$: ; check for next constant 
      00999A 07 90 5C         [ 4] 1614 	call next_token 
      00999D 5C 0A            [ 1] 1615 	cp a,#TK_COMMA 
      00999F 01 20            [ 1] 1616 	jrne 9$ ; no other constant 
      0099A1 EE 1D 39         [ 2] 1617 	jp const_loop 
      0099A2                       1618 9$: 
      001DBD                       1619 	_unget_token    
      0099A2 1E 02 1D 00 02   [ 1]    1      mov in,in.saved  
      001DC2                       1620 10$: 
      001DC2                       1621 	_drop VSIZE 
      0099A7 4B 00            [ 2]    1     addw sp,#VSIZE 
      0099A9 FE 84            [ 2] 1622 	popw y ; restore xstack pointer 
      0099AB 27               [ 4] 1623 	ret 
                                   1624 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



                                   1625 
                                   1626 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1627 ; return program size 
                                   1628 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001DC7                       1629 prog_size:
      0099AC 1F 20 D7         [ 2] 1630 	ldw x,txtend 
      0099AF 72 B0 00 1B      [ 2] 1631 	subw x,txtbgn 
      0099AF 1E               [ 4] 1632 	ret 
                                   1633 
                                   1634 ;----------------------------
                                   1635 ; print program information 
                                   1636 ;---------------------------
      001DCF                       1637 program_info: 
      0099B0 02 F6 6B         [ 2] 1638 	ldw x,#PROG_ADDR 
      0099B3 01 A4 0F         [ 4] 1639 	call puts 
      0099B6 4C C7 00         [ 2] 1640 	ldw x,txtbgn 
      0099B9 0F 72 5F 00      [ 1] 1641 	mov base,#16 
      0099BD 0E 72 BB         [ 4] 1642 	call prt_i16
      0099C0 00 0E FE 7B      [ 1] 1643 	mov base,#10  
      0099C4 01 4E A4         [ 2] 1644 	ldw x,#PROG_SIZE
      0099C7 0C 44 44         [ 4] 1645 	call puts 
      0099CA AB 80 C7         [ 4] 1646 	call prog_size 
      0099CC CD 17 F6         [ 4] 1647 	call prt_i16 
      0099CC 5B 05 81         [ 2] 1648 	ldw x,#STR_BYTES 
      0099CF CD 09 A1         [ 4] 1649 	call puts
      0099CF 88 CD 98         [ 2] 1650 	ldw x,txtbgn
      0099D2 21 11 01         [ 2] 1651 	cpw x,#app 
      0099D5 27 03            [ 1] 1652 	jrult 2$
      0099D7 CC 97 20         [ 2] 1653 	ldw x,#FLASH_MEM 
      0099DA 84 81            [ 2] 1654 	jra 3$
      0099DC AE 1E 49         [ 2] 1655 2$: ldw x,#RAM_MEM 	 
      0099DC A6 06 CD         [ 4] 1656 3$:	call puts 
      0099DF 99 CF            [ 1] 1657 	ld a,#CR 
      0099E1 CD 09 44         [ 4] 1658 	call putc
      0099E1 4B               [ 4] 1659 	ret 
                                   1660 
      0099E2 00 CD 98 21 A1 80 27  1661 PROG_ADDR: .asciz "program address: "
             1D A1 00 27 1E A1 0A
             27 15 55 00
      0099F4 03 00 02 CD 9B 01 0C  1662 PROG_SIZE: .asciz ", program size: "
             01 CD 98 21 A1 08 27
             F4 A1 07
      009A05 27 05 79 74 65 73 00  1663 STR_BYTES: .asciz " bytes" 
      009A07 20 69 6E 20 46 4C 41  1664 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A07 55 00 03 00 02 84 81  1665 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
             00
                                   1666 
                                   1667 
                                   1668 ;----------------------------
                                   1669 ; BASIC: LIST [[start][,end]]
                                   1670 ; list program lines 
                                   1671 ; form start to end 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



                                   1672 ; if empty argument list then 
                                   1673 ; list all.
                                   1674 ;----------------------------
                           000001  1675 	FIRST=1
                           000003  1676 	LAST=3 
                           000005  1677 	LN_PTR=5
                           000006  1678 	VSIZE=6 
      009A0E                       1679 list:
      009A0E CD 99 DC A1 01   [ 2] 1680 	btjf flags,#FRUN,0$
      009A13 27 03            [ 1] 1681 	ld a,#ERR_CMD_ONLY
      009A15 CC 97 20         [ 2] 1682 	jp tb_error
      001E62                       1683 0$:	 
      009A18 90 F6 93         [ 4] 1684 	call next_token 
      009A1B EE 01            [ 1] 1685 	cp a,#TK_CHAR 
      009A1D 72 A9            [ 1] 1686 	jrne 2$
      009A1F 00 03 C3         [ 4] 1687 	call get_char 
      009A22 00 21            [ 1] 1688 	and a,#0xDF 
      009A24 23 05            [ 1] 1689 	cp a,#'C 
      009A26 A6 0A            [ 1] 1690 	jrne 1$
      009A28 CC 97 22         [ 4] 1691 	call list_const
      009A2B 5D               [ 4] 1692 	ret 
      009A2C 27 F8 89         [ 2] 1693 1$: jp syntax_error 
      001E79                       1694 2$:	_unget_token 
      009A2F 58 72 FB 01 1F   [ 1]    1      mov in,in.saved  
      009A34 01 AE 16         [ 4] 1695 	call prog_size 
      009A37 68 72            [ 1] 1696 	jrugt 3$
      009A39 F0               [ 4] 1697 	ret 
      001E84                       1698 3$: _vars VSIZE
      009A3A 01 5B            [ 2]    1     sub sp,#VSIZE 
      009A3C 02 81 1B         [ 2] 1699 	ldw x,txtbgn 
      009A3E 1F 05            [ 2] 1700 	ldw (LN_PTR,sp),x 
      009A3E 52               [ 2] 1701 	ldw x,(x) 
      009A3F 01 0F            [ 2] 1702 	ldw (FIRST,sp),x ; list from first line 
      009A41 01 CD 98         [ 2] 1703 	ldw x,#MAX_LINENO ; biggest line number 
      009A44 21 A1            [ 2] 1704 	ldw (LAST,sp),x 
      009A46 10 27 06         [ 4] 1705 	call arg_list
      009A49 A1               [ 1] 1706 	tnz a
      009A4A 11 26            [ 1] 1707 	jreq list_loop 
      009A4C 05 03            [ 1] 1708 	cp a,#2 
      009A4E 01 07            [ 1] 1709 	jreq 4$
      009A4F A1 01            [ 1] 1710 	cp a,#1 
      009A4F CD 98            [ 1] 1711 	jreq first_line 
      009A51 21 16 A0         [ 2] 1712 	jp syntax_error 
      009A52 85               [ 2] 1713 4$:	popw x 
      009A52 A1 81            [ 2] 1714 	ldw (LAST+2,sp),x 
      001EA7                       1715 first_line:
      009A54 26               [ 2] 1716 	popw x
      009A55 06 CD            [ 2] 1717 	ldw (FIRST,sp),x 
      001EAA                       1718 lines_skip:
      009A57 98 3A FD         [ 2] 1719 	ldw x,txtbgn
      009A5A 20 58            [ 2] 1720 2$:	ldw (LN_PTR,sp),x 
      009A5C C3 00 1D         [ 2] 1721 	cpw x,txtend 
      009A5C A1 84            [ 1] 1722 	jrpl list_exit 
      009A5E 26               [ 2] 1723 	ldw x,(x) ;line# 
      009A5F 05 CD            [ 2] 1724 	cpw x,(FIRST,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A61 98 60            [ 1] 1725 	jrpl list_loop 
      009A63 20 4F            [ 2] 1726 	ldw x,(LN_PTR,sp) 
      009A65 E6 02            [ 1] 1727 	ld a,(2,x)
      009A65 A1 05 26         [ 1] 1728 	ld acc8,a 
      009A68 05 CD 9A 0E      [ 1] 1729 	clr acc16 
      009A6C 20 07 00 0D      [ 2] 1730 	addw x,acc16
      009A6E 20 E3            [ 2] 1731 	jra 2$ 
                                   1732 ; print loop
      001ECA                       1733 list_loop:
      009A6E A1 85            [ 2] 1734 	ldw x,(LN_PTR,sp)
      009A70 26 08            [ 1] 1735 	ld a,(2,x) 
      009A72 CD 98 56         [ 4] 1736 	call prt_basic_line
      009A75 1E 05            [ 2] 1737 	ldw x,(LN_PTR,sp)
      009A75 F6 EE            [ 1] 1738 	ld a,(2,x)
      009A77 01 20 3A         [ 1] 1739 	ld acc8,a 
      009A7A 72 5F 00 0D      [ 1] 1740 	clr acc16 
      009A7A A1 03 26 10      [ 2] 1741 	addw x,acc16
      009A7E 89 CD 98         [ 2] 1742 	cpw x,txtend 
      009A81 47 85            [ 1] 1743 	jrpl list_exit
      009A83 CD 9D            [ 2] 1744 	ldw (LN_PTR,sp),x
      009A85 54               [ 2] 1745 	ldw x,(x)
      009A86 5D 27            [ 2] 1746 	cpw x,(LAST,sp)  
      009A88 28 CD            [ 1] 1747 	jrslt list_loop
      001EEC                       1748 list_exit:
      009A8A 9C B0 20 26 01   [ 1] 1749 	mov in,count 
      009A8E AE 16 B8         [ 2] 1750 	ldw x,#pad 
      009A8E A1 82 26         [ 2] 1751 	ldw basicptr,x 
      001EF7                       1752 	_drop VSIZE 
      009A91 08 CD            [ 2]    1     addw sp,#VSIZE 
      009A93 98 3A FD         [ 4] 1753 	call program_info 
      009A96 5F               [ 4] 1754 	ret
                                   1755 
                                   1756 
                                   1757 ;--------------------------
                                   1758 ; BASIC: EDIT 
                                   1759 ;  copy program in FLASH 
                                   1760 ;  to RAM for edition 
                                   1761 ;-------------------------
      001EFD                       1762 edit:
      009A97 02 20 1A         [ 4] 1763 	call qsign 
      009A9A 27 07            [ 1] 1764 	jreq 1$ 
      009A9A A1 06 26         [ 2] 1765 	ldw x,#NOT_SAVED 
      009A9D 13 CD 9B         [ 4] 1766 	call puts 
      009AA0 01               [ 4] 1767 	ret 
      001F09                       1768 1$: 
      009AA1 A6 07 CD 99      [ 2] 1769 	ldw y,#app_sign ; source address 
      009AA5 CF 90 F6         [ 2] 1770     ldw x,app_size  
      009AA8 93 EE 01         [ 2] 1771 	addw x,#4 
      009AAB 72 A9 00         [ 2] 1772 	ldw acc16,x  ; bytes to copy 
      009AAE 03 20 03         [ 2] 1773 	ldw x,#rsign ; destination address 
      009AB1 CD 14 10         [ 4] 1774 	call move  
      009AB1 CC 97 20         [ 2] 1775 	ldw x,#free_ram 
      009AB4 CF 00 1B         [ 2] 1776 	ldw txtbgn,x 
      009AB4 0D 01 27 03      [ 2] 1777 	addw x,rsize  
      009AB8 CD 82 85         [ 2] 1778 	ldw txtend,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009ABB 81               [ 4] 1779 	ret 
                                   1780 
      009ABB 72 A2 00 03 90 F7 90  1781 NOT_SAVED: .asciz "No application saved.\n"
             EF 01 5B 01 81 6F 6E
             20 73 61 76 65 64 2E
             0A 00
                                   1782 
                                   1783 
                                   1784 ;--------------------------
                                   1785 ; decompile line from token list
                                   1786 ; and print it. 
                                   1787 ; input:
                                   1788 ;   A       stop at this position 
                                   1789 ;   X 		pointer at line
                                   1790 ; output:
                                   1791 ;   none 
                                   1792 ;--------------------------	
      009AC7                       1793 prt_basic_line:
      009AC7 52 01            [ 2] 1794 	pushw y 
      009AC9 CD 9A 3E         [ 1] 1795 	ld count,a 
      009ACC E6 02            [ 1] 1796 	ld a,(2,x)
      009ACC CD 98 21         [ 1] 1797 	cp a,count 
      009ACF 6B 01            [ 1] 1798 	jrpl 1$ 
      009AD1 A1 02 25         [ 1] 1799 	ld count,a 
      009AD4 24 A4 30         [ 2] 1800 1$:	ldw basicptr,x 
      009AD7 A1 20 27 02      [ 2] 1801 	ldw y,#tib  
      009ADB 20 1C 08         [ 4] 1802 	call decompile 
      009ADD CD 09 A1         [ 4] 1803 	call puts 
      009ADD CD 9A            [ 1] 1804 	ld a,#CR 
      009ADF 3E 09 44         [ 4] 1805 	call putc 
      009AE0 90 85            [ 2] 1806 	popw y 
      009AE0 7B               [ 4] 1807 	ret 
                                   1808 
                                   1809 
                                   1810 ;---------------------------------
                                   1811 ; BASIC: PRINT|? arg_list 
                                   1812 ; print values from argument list
                                   1813 ;----------------------------------
                           000001  1814 	CCOMMA=1
                           000001  1815 	VSIZE=1
      001F65                       1816 print:
      001F65                       1817 	_vars VSIZE 
      009AE1 01 A1            [ 2]    1     sub sp,#VSIZE 
      001F67                       1818 reset_comma:
      009AE3 20 26            [ 1] 1819 	clr (CCOMMA,sp)
      001F69                       1820 prt_loop:
      009AE5 05 CD 82         [ 4] 1821 	call next_token
      009AE8 DD 20            [ 1] 1822 	cp a,#CMD_END 
      009AEA E1 A1            [ 1] 1823 	jrult 0$
      009AEC 21 26            [ 1] 1824 	cp a,#TK_COLON 
      009AEE 05 CD            [ 1] 1825 	jreq 0$
      009AF0 83 A7            [ 1] 1826 	cp a,#TK_CMD
      009AF2 20 D8            [ 1] 1827 	jrne 10$
      009AF4                       1828 0$:
      001F78                       1829 	_unget_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



      009AF4 CD 84 55 20 D3   [ 1]    1      mov in,in.saved  
      009AF9 20 5A            [ 2] 1830 	jra print_exit 
      001F7F                       1831 10$:	
      009AF9 55 00            [ 1] 1832 	cp a,#TK_QSTR
      009AFB 03 00            [ 1] 1833 	jreq 1$
      009AFD 02 04            [ 1] 1834 	cp a,#TK_CHAR 
      009AFE 27 1B            [ 1] 1835 	jreq 2$ 
      009AFE A1 82            [ 1] 1836 	cp a,#TK_CFUNC 
      009AFE 5B 01            [ 1] 1837 	jreq 3$
      009B00 81 08            [ 1] 1838 	cp a,#TK_COMMA 
      009B01 27 24            [ 1] 1839 	jreq 4$
      009B01 52 01            [ 1] 1840 	cp a,#TK_SHARP 
      009B03 CD 9A            [ 1] 1841 	jreq 5$
      009B05 C7 37            [ 2] 1842 	jra 7$ 
      009B06                       1843 1$:	; print string 
      009B06 CD 98 21         [ 4] 1844 	call puts
      009B09 6B               [ 1] 1845 	incw x
      009B0A 01 A1 02 25      [ 2] 1846 	subw x,basicptr 
      009B0E 1B A4 30         [ 2] 1847 	ldw in.w,x  
      009B11 A1 10            [ 2] 1848 	jra reset_comma
      001FA2                       1849 2$:	; print character 
      009B13 27 02 20         [ 4] 1850 	call get_char 
      009B16 13 09 44         [ 4] 1851 	call putc 
      009B17 20 BD            [ 2] 1852 	jra reset_comma 
      001FAA                       1853 3$: ; print character function value  	
      009B17 CD 9A C7         [ 4] 1854 	call get_code_addr 
      009B1A 7B               [ 4] 1855 	call (x)
      009B1B 01 A1 10         [ 4] 1856 	call putc
      009B1E 26 05            [ 2] 1857 	jra reset_comma 
      001FB3                       1858 4$: ; set comma state 
      009B20 CD 81            [ 1] 1859 	cpl (CCOMMA,sp)
      009B22 EA 20            [ 2] 1860 	jra prt_loop   
      001FB7                       1861 5$: ; # character must be followed by an integer   
      009B24 E1 17 A1         [ 4] 1862 	call next_token
      009B25 A1 84            [ 1] 1863 	cp a,#TK_INTGR 
      009B25 CD 82            [ 1] 1864 	jreq 6$
      009B27 07 20 DC         [ 2] 1865 	jp syntax_error 
      009B2A                       1866 6$: ; set tab width
      009B2A 55 00 03         [ 4] 1867 	call get_int24 
      009B2D 00               [ 1] 1868 	ld a,xl 
      009B2E 02 0F            [ 1] 1869 	and a,#15 
      009B2F C7 00 23         [ 1] 1870 	ld tab_width,a 
      009B2F A6 84            [ 2] 1871 	jra reset_comma 
      009B31                       1872 7$:	
      001FCC                       1873 	_unget_token 
      009B31 5B 01 81 00 01   [ 1]    1      mov in,in.saved  
      009B34 CD 1A 81         [ 4] 1874 	call expression  
      009B34 52 01 CD         [ 4] 1875     call print_top
      009B37 9B 01            [ 2] 1876 	jra reset_comma 
      001FD9                       1877 print_exit:
      009B39 CD 98            [ 1] 1878 	tnz (CCOMMA,sp)
      009B3B 21 6B            [ 1] 1879 	jrne 9$
      009B3D 01 A4            [ 1] 1880 	ld a,#CR 
      009B3F 30 A1 30         [ 4] 1881     call putc 
      001FE2                       1882 9$:	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009B42 26 31            [ 2]    1     addw sp,#VSIZE 
      009B44 81               [ 4] 1883 	ret 
                                   1884 
                                   1885 ;----------------------
                                   1886 ; 'save_context' and
                                   1887 ; 'rest_context' must be 
                                   1888 ; called at the same 
                                   1889 ; call stack depth 
                                   1890 ; i.e. SP must have the 
                                   1891 ; save value at  
                                   1892 ; entry point of both 
                                   1893 ; routine. 
                                   1894 ;---------------------
                           000004  1895 	CTXT_SIZE=4 ; size of saved data 
                                   1896 ;--------------------
                                   1897 ; save current BASIC
                                   1898 ; interpreter context 
                                   1899 ; on stack 
                                   1900 ;--------------------
      001FE5                       1901 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001FE5                       1902 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001FE5                       1903 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001FE5                       1904 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001FE5                       1905 save_context:
      009B44 CD 9B 01         [ 2] 1906 	ldw x,basicptr 
      009B47 CD 82            [ 2] 1907 	ldw (BPTR,sp),x
      009B49 24 90 F6         [ 1] 1908 	ld a,in 
      009B4C 93 EE            [ 1] 1909 	ld (IN,sp),a
      009B4E 01 72 A9         [ 1] 1910 	ld a,count 
      009B51 00 03            [ 1] 1911 	ld (CNT,sp),a  
      009B53 4D               [ 4] 1912 	ret
                                   1913 
                                   1914 ;-----------------------
                                   1915 ; restore previously saved 
                                   1916 ; BASIC interpreter context 
                                   1917 ; from stack 
                                   1918 ;-------------------------
      001FF5                       1919 rest_context:
      009B54 2B 08            [ 2] 1920 	ldw x,(BPTR,sp)
      009B56 26 0C 35         [ 2] 1921 	ldw basicptr,x 
      009B59 02 00            [ 1] 1922 	ld a,(IN,sp)
      009B5B 0F 20 0A         [ 1] 1923 	ld in,a
      009B5E 7B 06            [ 1] 1924 	ld a,(CNT,sp)
      009B5E 35 04 00         [ 1] 1925 	ld count,a  
      009B61 0F               [ 4] 1926 	ret
                                   1927 
                                   1928 
                                   1929 
                                   1930 ;------------------------------------------
                                   1931 ; BASIC: INPUT [string]var[,[string]var]
                                   1932 ; input value in variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



                                   1933 ; [string] optionally can be used as prompt 
                                   1934 ;-----------------------------------------
                           000001  1935 	CX_BPTR=1
                           000003  1936 	CX_IN=3
                           000004  1937 	CX_CNT=4
                           000005  1938 	SKIP=5
                           000005  1939 	VSIZE=5
      002005                       1940 input_var:
      009B62 20 04            [ 2] 1941 	pushw y 
      009B64                       1942 	_vars VSIZE 
      009B64 35 01            [ 2]    1     sub sp,#VSIZE 
      002009                       1943 input_loop:
      009B66 00 0F            [ 1] 1944 	clr (SKIP,sp)
      009B68 CD 17 A1         [ 4] 1945 	call next_token 
      009B68 5F C6            [ 1] 1946 	cp a,#TK_QSTR 
      009B6A 00 0F            [ 1] 1947 	jrne 1$ 
      009B6C 14 01 27         [ 4] 1948 	call puts 
      009B6F 17               [ 1] 1949 	incw x 
      009B70 53 A6 FF 20      [ 2] 1950 	subw x,basicptr 
      009B74 12 7B 01         [ 2] 1951 	ldw in.w,x 
      009B77 27 05            [ 1] 1952 	cpl (SKIP,sp)
      009B79 55 00 03         [ 4] 1953 	call next_token 
      009B7C 00 02            [ 1] 1954 1$: cp a,#TK_VAR  
      009B7E 27 03            [ 1] 1955 	jreq 2$ 
      009B7E 90 F6 93         [ 2] 1956 	jp syntax_error
      009B81 EE 01 72         [ 4] 1957 2$:	call get_addr
      009B84 A9 00 03         [ 2] 1958 	ldw ptr16,x 
      009B87 0D 05            [ 1] 1959 	tnz (SKIP,sp)
      009B87 5B 01            [ 1] 1960 	jrne 21$ 
      009B89 81 11 DD         [ 4] 1961 	call var_name 
      009B8A CD 09 44         [ 4] 1962 	call putc   
      002039                       1963 21$:
      009B8A 4B 00            [ 1] 1964 	ld a,#':
      009B8C CD 9B 34         [ 4] 1965 	call putc 
      009B8F 72 A2 00         [ 4] 1966 	call save_context 
      009B92 03 90 F7 90      [ 1] 1967 	clr count  
      009B96 EF 01 CD         [ 4] 1968 	call readln 
      009B99 98 21 A1         [ 2] 1969 	ldw x,#tib 
      009B9C 87 2B 5F         [ 1] 1970 	push count
      009B9F A1 8A            [ 1] 1971 	push #0 
      009BA1 2A 5B 6B         [ 2] 1972 	addw x,(1,sp)
      009BA4 01               [ 1] 1973 	incw x 
      002054                       1974 	_drop 2 
      009BA5 CD 9B            [ 2]    1     addw sp,#2 
      009BA7 34 C7 00 0D      [ 1] 1975 	clr in 
      009BAB CF 00 0E         [ 4] 1976 	call get_token
      009BAE 90 F6            [ 1] 1977 	cp a,#TK_INTGR
      009BB0 93 EE            [ 1] 1978 	jreq 3$ 
      009BB2 01 72            [ 1] 1979 	cp a,#TK_MINUS
      009BB4 A9 00 03         [ 4] 1980 	call get_token 
      009BB7 88 7B            [ 1] 1981 	cp a,#TK_INTGR 
      009BB9 02 A1            [ 1] 1982 	jreq 22$
      009BBB 89 27 2C         [ 4] 1983 	call rest_context 
      009BBE A1 88 27         [ 2] 1984 	jp syntax_error
      002070                       1985 22$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009BC1 14 7B 01         [ 4] 1986 	call neg_acc24	
      002073                       1987 3$: 
      009BC4 C4 00 0D         [ 1] 1988 	ld a,acc24 
      009BC7 6B 01 9E         [ 2] 1989 	ldw x,acc16 
      009BCA C4 00 0E 95      [ 4] 1990 	ld [ptr16],a
      009BCE 9F C4 00 0F      [ 1] 1991 	inc ptr8  
      009BD2 97 84 20 36      [ 5] 1992 	ldw [ptr16],x 
      009BD6 CD 1F F5         [ 4] 1993 	call rest_context
      009BD6 7B 01 CA         [ 4] 1994 	call next_token 
      009BD9 00 0D            [ 1] 1995 	cp a,#TK_COMMA
      009BDB 6B 01            [ 1] 1996 	jrne 4$ 
      009BDD 9E CA 00         [ 2] 1997 	jp input_loop
      002092                       1998 4$:
      009BE0 0E 95            [ 1] 1999 	cp a,#TK_NONE 
      009BE2 9F CA            [ 1] 2000 	jreq input_exit  
      009BE4 00 0F            [ 1] 2001 	cp a,#TK_COLON 
      009BE6 97 84            [ 1] 2002     jreq input_exit 
      009BE8 20 22 A0         [ 2] 2003 	jp syntax_error 
      009BEA                       2004 input_exit:
      00209D                       2005 	_drop VSIZE 
      009BEA 7B 01            [ 2]    1     addw sp,#VSIZE 
      009BEC C8 00            [ 2] 2006 	popw y 
      009BEE 0D               [ 4] 2007 	ret 
                                   2008 
                                   2009 
                                   2010 ;---------------------
                                   2011 ; BASIC: REM | ' 
                                   2012 ; skip comment to end of line 
                                   2013 ;---------------------- 
      0020A2                       2014 remark::
      009BEF 6B 01 9E C8 00   [ 1] 2015 	mov in,count 
      009BF4 0E               [ 4] 2016  	ret 
                                   2017 
                                   2018 
                                   2019 ;---------------------
                                   2020 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2021 ; read in loop 'addr'  
                                   2022 ; apply & 'mask' to value 
                                   2023 ; loop while result==0.  
                                   2024 ; 'xor_mask' is used to 
                                   2025 ; invert the wait logic.
                                   2026 ; i.e. loop while not 0.
                                   2027 ;---------------------
                           000001  2028 	XMASK=1 
                           000002  2029 	MASK=2
                           000003  2030 	ADDR=3
                           000004  2031 	VSIZE=4
      0020A8                       2032 wait: 
      0020A8                       2033 	_vars VSIZE
      009BF5 95 9F            [ 2]    1     sub sp,#VSIZE 
      009BF7 C8 00            [ 1] 2034 	clr (XMASK,sp) 
      009BF9 0F 97 84         [ 4] 2035 	call arg_list 
      009BFC 20 0E            [ 1] 2036 	cp a,#2
      009BFE 55 00            [ 1] 2037 	jruge 0$
      009C00 03 00 02         [ 2] 2038 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009C03 90 F6            [ 1] 2039 0$:	cp a,#3
      009C05 93 EE            [ 1] 2040 	jrult 1$
      0020BA                       2041 	_xpop  ; xor mask 
      009C07 01 72            [ 1]    1     ld a,(y)
      009C09 A9               [ 1]    2     ldw x,y 
      009C0A 00 03            [ 2]    3     ldw x,(1,x)
      009C0C 5B 01 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009C0F 9F               [ 1] 2042 	ld a,xl 
      009C0F 35 10            [ 1] 2043 	ld (XMASK,sp),a 
      0020C6                       2044 1$: _xpop ; mask
      009C11 00 0B            [ 1]    1     ld a,(y)
      009C13 81               [ 1]    2     ldw x,y 
      009C14 EE 01            [ 2]    3     ldw x,(1,x)
      009C14 35 0A 00 0B      [ 2]    4     addw y,#CELL_SIZE 
      009C18 81               [ 1] 2045     ld a,xl  
      009C19 6B 02            [ 1] 2046 	ld (MASK,sp),a 
      0020D2                       2047 	_xpop ; address 
      009C19 90 89            [ 1]    1     ld a,(y)
      009C1B 4F               [ 1]    2     ldw x,y 
      009C1C AE 16            [ 2]    3     ldw x,(1,x)
      009C1E 68 90 CE 00      [ 2]    4     addw y,#CELL_SIZE 
      009C22 1C               [ 1] 2048 2$:	ld a,(x)
      009C23 90 A3            [ 1] 2049 	and a,(MASK,sp)
      009C25 B6 80            [ 1] 2050 	xor a,(XMASK,sp)
      009C27 25 05            [ 1] 2051 	jreq 2$ 
      0020E2                       2052 	_drop VSIZE 
      009C29 1D 00            [ 2]    1     addw sp,#VSIZE 
      009C2B 80               [ 4] 2053 	ret 
                                   2054 
                                   2055 ;---------------------
                                   2056 ; BASIC: BSET addr,mask
                                   2057 ; set bits at 'addr' corresponding 
                                   2058 ; to those of 'mask' that are at 1.
                                   2059 ; arguments:
                                   2060 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2061 ;   mask        mask|addr
                                   2062 ; output:
                                   2063 ;	none 
                                   2064 ;--------------------------
      0020E5                       2065 bit_set:
      009C2C 20 04 61         [ 4] 2066 	call arg_list 
      009C2E A1 02            [ 1] 2067 	cp a,#2	 
      009C2E 72 B0            [ 1] 2068 	jreq 1$ 
      009C30 00 1E 90         [ 2] 2069 	jp syntax_error
      0020EF                       2070 1$: 
      0020EF                       2071 	_xpop ; mask 
      009C33 85 81            [ 1]    1     ld a,(y)
      009C35 93               [ 1]    2     ldw x,y 
      009C35 3B 00            [ 2]    3     ldw x,(1,x)
      009C37 0B AE 9E 8E      [ 2]    4     addw y,#CELL_SIZE 
      009C3B CD               [ 1] 2072 	ld a,xl
      009C3C 8A               [ 1] 2073 	push a  
      0020FA                       2074 	_xpop ; addr  
      009C3D 21 CE            [ 1]    1     ld a,(y)
      009C3F 00               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009C40 1C 35            [ 2]    3     ldw x,(1,x)
      009C42 10 00 0B CD      [ 2]    4     addw y,#CELL_SIZE 
      009C46 98               [ 1] 2075 	pop a 
      009C47 76               [ 1] 2076 	or a,(x)
      009C48 32               [ 1] 2077 	ld (x),a
      009C49 00               [ 4] 2078 	ret 
                                   2079 
                                   2080 ;---------------------
                                   2081 ; BASIC: BRES addr,mask
                                   2082 ; reset bits at 'addr' corresponding 
                                   2083 ; to those of 'mask' that are at 1.
                                   2084 ; arguments:
                                   2085 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2086 ;   mask	    ~mask&*addr  
                                   2087 ; output:
                                   2088 ;	none 
                                   2089 ;--------------------------
      002107                       2090 bit_reset:
      009C4A 0B AE 9E         [ 4] 2091 	call arg_list 
      009C4D A0 CD            [ 1] 2092 	cp a,#2  
      009C4F 8A 21            [ 1] 2093 	jreq 1$ 
      009C51 CE 00 1E         [ 2] 2094 	jp syntax_error
      002111                       2095 1$: 
      002111                       2096 	_xpop ; mask 
      009C54 72 B0            [ 1]    1     ld a,(y)
      009C56 00               [ 1]    2     ldw x,y 
      009C57 1C CD            [ 2]    3     ldw x,(1,x)
      009C59 98 76 AE 9E      [ 2]    4     addw y,#CELL_SIZE 
      009C5D B1               [ 1] 2097 	ld a,xl 
      009C5E CD               [ 1] 2098 	cpl a
      009C5F 8A               [ 1] 2099 	push a  
      00211D                       2100 	_xpop ; addr  
      009C60 21 81            [ 1]    1     ld a,(y)
      009C62 93               [ 1]    2     ldw x,y 
      009C62 CD 9C            [ 2]    3     ldw x,(1,x)
      009C64 19 A6 03 42      [ 2]    4     addw y,#CELL_SIZE 
      009C68 CF               [ 1] 2101 	pop a 
      009C69 00               [ 1] 2102 	and a,(x)
      009C6A 21               [ 1] 2103 	ld (x),a 
      009C6B 4F               [ 4] 2104 	ret 
                                   2105 
                                   2106 ;---------------------
                                   2107 ; BASIC: BTOGL addr,mask
                                   2108 ; toggle bits at 'addr' corresponding 
                                   2109 ; to those of 'mask' that are at 1.
                                   2110 ; arguments:
                                   2111 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2112 ;   mask	    mask^*addr  
                                   2113 ; output:
                                   2114 ;	none 
                                   2115 ;--------------------------
      00212A                       2116 bit_toggle:
      009C6C 81 19 61         [ 4] 2117 	call arg_list 
      009C6D A1 02            [ 1] 2118 	cp a,#2 
      009C6D CD 98            [ 1] 2119 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009C6F 21 A1 85         [ 2] 2120 	jp syntax_error
      002134                       2121 1$: _xpop ; mask 
      009C72 27 0C            [ 1]    1     ld a,(y)
      009C74 A1               [ 1]    2     ldw x,y 
      009C75 05 27            [ 2]    3     ldw x,(1,x)
      009C77 03 CC 97 20      [ 2]    4     addw y,#CELL_SIZE 
      009C7B 9F               [ 1] 2122 	ld a,xl
      009C7B CD               [ 1] 2123 	push a 
      00213F                       2124 	_xpop  ; addr  
      009C7C 9A 0E            [ 1]    1     ld a,(y)
      009C7E 20               [ 1]    2     ldw x,y 
      009C7F 03 01            [ 2]    3     ldw x,(1,x)
      009C80 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C80 CD               [ 1] 2125 	pop a 
      009C81 98               [ 1] 2126 	xor a,(x)
      009C82 56               [ 1] 2127 	ld (x),a 
      009C83 81               [ 4] 2128 	ret 
                                   2129 
                                   2130 
                                   2131 ;---------------------
                                   2132 ; BASIC: BTEST(addr,bit)
                                   2133 ; return bit value at 'addr' 
                                   2134 ; bit is in range {0..7}.
                                   2135 ; arguments:
                                   2136 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2137 ;   bit 	    bit position {0..7}  
                                   2138 ; output:
                                   2139 ;	A:X       bit value  
                                   2140 ;--------------------------
      00214C                       2141 bit_test:
      009C83 CF 00 1A         [ 4] 2142 	call func_args 
      009C86 CD 98            [ 1] 2143 	cp a,#2
      009C88 21 A1            [ 1] 2144 	jreq 0$
      009C8A 32 27 03         [ 2] 2145 	jp syntax_error
      002156                       2146 0$:	
      002156                       2147 	_xpop 
      009C8D CC 97            [ 1]    1     ld a,(y)
      009C8F 20               [ 1]    2     ldw x,y 
      009C90 EE 01            [ 2]    3     ldw x,(1,x)
      009C90 CD 9B 01 A1      [ 2]    4     addw y,#CELL_SIZE 
      009C94 84               [ 1] 2148 	ld a,xl 
      009C95 27 03            [ 1] 2149 	and a,#7
      009C97 CC               [ 1] 2150 	push a   
      009C98 97 20            [ 1] 2151 	ld a,#1 
      009C9A 0D 01            [ 1] 2152 1$: tnz (1,sp)
      009C9A 90 F6            [ 1] 2153 	jreq 2$
      009C9C 93               [ 1] 2154 	sll a 
      009C9D EE 01            [ 1] 2155 	dec (1,sp)
      009C9F 72 A9            [ 2] 2156 	jra 1$
      009CA1 00 03            [ 1] 2157 2$: ld (1,sp),a  
      009CA3                       2158 	_xpop ; address  
      009CA3 72 C7            [ 1]    1     ld a,(y)
      009CA5 00               [ 1]    2     ldw x,y 
      009CA6 1A 72            [ 2]    3     ldw x,(1,x)
      009CA8 5C 00 1B 72      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009CAC CF               [ 1] 2159 	pop a 
      009CAD 00               [ 1] 2160 	and a,(x)
      009CAE 1A 81            [ 1] 2161 	jreq 3$
      009CB0 A6 01            [ 1] 2162 	ld a,#1 
      009CB0 F6               [ 1] 2163 3$:	clrw x 
      009CB1 A0               [ 1] 2164 	ld xl,a
      009CB2 03               [ 1] 2165 	clr a  
      009CB3 88               [ 4] 2166 	ret
                                   2167 
                                   2168 ;--------------------
                                   2169 ; BASIC: POKE addr,byte
                                   2170 ; put a byte at addr 
                                   2171 ;--------------------
      002183                       2172 poke:
      009CB4 4B 00 72         [ 4] 2173 	call arg_list 
      009CB7 FB 01            [ 1] 2174 	cp a,#2
      009CB9 F6 EE            [ 1] 2175 	jreq 1$
      009CBB 01 5B 02         [ 2] 2176 	jp syntax_error
      00218D                       2177 1$:	
      00218D                       2178 	_xpop ; byte   
      009CBE 81 F6            [ 1]    1     ld a,(y)
      009CBF 93               [ 1]    2     ldw x,y 
      009CBF 90 89            [ 2]    3     ldw x,(1,x)
      009CC1 52 04 5F 1F      [ 2]    4     addw y,#CELL_SIZE 
      009CC5 01               [ 1] 2179     ld a,xl 
      009CC6 90               [ 1] 2180 	push a 
      002198                       2181 	_xpop ; address 
      009CC7 AE 40            [ 1]    1     ld a,(y)
      009CC9 00               [ 1]    2     ldw x,y 
      009CCA 90 C3            [ 2]    3     ldw x,(1,x)
      009CCC 00 25 24 35      [ 2]    4     addw y,#CELL_SIZE 
      009CD0 17               [ 1] 2182 	pop a 
      009CD1 03               [ 1] 2183 	ld (x),a 
      009CD2 93               [ 4] 2184 	ret 
                                   2185 
                                   2186 ;-----------------------
                                   2187 ; BASIC: PEEK(addr)
                                   2188 ; get the byte at addr 
                                   2189 ; input:
                                   2190 ;	none 
                                   2191 ; output:
                                   2192 ;	X 		value 
                                   2193 ;-----------------------
      0021A4                       2194 peek:
      009CD3 5C CD 8A         [ 4] 2195 	call func_args
      009CD6 21 A6            [ 1] 2196 	cp a,#1 
      009CD8 3D CD            [ 1] 2197 	jreq 1$
      009CDA 89 C4 1E         [ 2] 2198 	jp syntax_error
      0021AE                       2199 1$: _xpop ; address  
      009CDD 03 CD            [ 1]    1     ld a,(y)
      009CDF 9C               [ 1]    2     ldw x,y 
      009CE0 B0 C7            [ 2]    3     ldw x,(1,x)
      009CE2 00 0D CF 00      [ 2]    4     addw y,#CELL_SIZE 
      009CE6 0E CD 98         [ 1] 2200 	ld farptr,a 
      009CE9 8D A6 0D         [ 2] 2201 	ldw ptr16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CEC CD 89 C4 1E      [ 5] 2202 	ldf a,[farptr]
      009CF0 01               [ 1] 2203 	clrw x 
      009CF1 5C               [ 1] 2204 	ld xl,a 
      009CF2 1F               [ 1] 2205 	clr a 
      009CF3 01               [ 4] 2206 	ret 
                                   2207 
                                   2208 ;---------------------------
                                   2209 ; BASIC IF expr : instructions
                                   2210 ; evaluate expr and if true 
                                   2211 ; execute instructions on same line. 
                                   2212 ;----------------------------
      0021C5                       2213 if: 
      009CF4 72 5F 00         [ 4] 2214 	call condition  
      009CF7 0E               [ 1] 2215 	tnz  a  
      009CF8 16 03            [ 1] 2216 	jrne 9$ 
                                   2217 ;skip to next line
      009CFA 90 F6 C7 00 0F   [ 1] 2218 	mov in,count
      0021D0                       2219 	_drop 2 
      009CFF 72 B9            [ 2]    1     addw sp,#2 
      009D01 00 0E 20         [ 2] 2220 	jp next_line
      009D04 C5               [ 4] 2221 9$:	ret 
                                   2222 
                                   2223 ;------------------------
                                   2224 ; BASIC: FOR var=expr 
                                   2225 ; set variable to expression 
                                   2226 ; leave variable address 
                                   2227 ; on stack and set
                                   2228 ; FLOOP bit in 'flags'
                                   2229 ;-----------------
                           000001  2230 	RETL1=1 ; return address  
                           000003  2231 	FSTEP=3  ; variable increment int24
                           000006  2232 	LIMIT=6 ; loop limit, int24  
                           000009  2233 	CVAR=9   ; control variable 
                           00000B  2234 	INW=11   ;  in.w saved
                           00000D  2235 	BPTR=13 ; baseptr saved
                           00000D  2236 	VSIZE=13  
      009D05                       2237 for: ; { -- var_addr }
      009D05 1E               [ 2] 2238 	popw x ; call return address 
      0021D7                       2239 	_vars VSIZE 
      009D06 01 CD            [ 2]    1     sub sp,#VSIZE 
      009D08 98               [ 2] 2240 	pushw x  ; RETL1 
      009D09 76 AE            [ 1] 2241 	ld a,#TK_VAR 
      009D0B 9D 15 CD         [ 4] 2242 	call expect
      009D0E 8A 21 5B         [ 4] 2243 	call get_addr
      009D11 04 90            [ 2] 2244 	ldw (CVAR,sp),x  ; control variable 
      009D13 85 81 20         [ 4] 2245 	call let_eval 
      009D16 63 6F 6E 73      [ 1] 2246 	bset flags,#FLOOP 
      009D1A 74 61 6E         [ 4] 2247 	call next_token 
      009D1D 74 73            [ 1] 2248 	cp a,#TK_CMD 
      009D1F 20 69            [ 1] 2249 	jreq 1$
      009D21 6E 20 45         [ 2] 2250 	jp syntax_error
      0021F5                       2251 1$:  
      009D24 45 50 52         [ 4] 2252 	call get_code_addr
      009D27 4F 4D 0A         [ 2] 2253 	cpw x,#to   
      009D2A 00 03            [ 1] 2254 	jreq to
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009D2B CC 16 A0         [ 2] 2255 	jp syntax_error 
                                   2256 
                                   2257 ;-----------------------------------
                                   2258 ; BASIC: TO expr 
                                   2259 ; second part of FOR loop initilization
                                   2260 ; leave limit on stack and set 
                                   2261 ; FTO bit in 'flags'
                                   2262 ;-----------------------------------
      002200                       2263 to: ; { var_addr -- var_addr limit step }
      009D2B AE 40 00 35 08   [ 2] 2264 	btjt flags,#FLOOP,1$
      009D30 00 0F A3         [ 2] 2265 	jp syntax_error
      009D33 47 F8 24         [ 4] 2266 1$: call expression   
      009D36 17 F6            [ 1] 2267 	cp a,#TK_INTGR 
      009D38 26 0C            [ 1] 2268 	jreq 2$ 
      009D3A 5C 72 5A         [ 2] 2269 	jp syntax_error
      002212                       2270 2$: _xpop
      009D3D 00 0F            [ 1]    1     ld a,(y)
      009D3F 26               [ 1]    2     ldw x,y 
      009D40 F6 1D            [ 2]    3     ldw x,(1,x)
      009D42 00 08 20 09      [ 2]    4     addw y,#CELL_SIZE 
      009D46 F6 5C            [ 1] 2271 	ld (LIMIT,sp),a 
      009D48 4D 26            [ 2] 2272 	ldw (LIMIT+1,sp),x
      009D4A FB 5A 20         [ 4] 2273 	call next_token
      009D4D E0 5F            [ 1] 2274 	cp a,#TK_NONE  
      009D4F 4F CF            [ 1] 2275 	jreq 4$ 
      009D51 00 25            [ 1] 2276 	cp a,#TK_CMD
      009D53 81 08            [ 1] 2277 	jrne 3$
      009D54 CD 17 BA         [ 4] 2278 	call get_code_addr
      009D54 90 89 52         [ 2] 2279 	cpw x,#step 
      009D57 05 72            [ 1] 2280 	jreq step
      002232                       2281 3$:	
      002232                       2282 	_unget_token   	 
      009D59 5F 00 0E CD 94   [ 1]    1      mov in,in.saved  
      002237                       2283 4$:	
      009D5E 64 AB            [ 1] 2284 	clr (FSTEP,sp) 
      009D60 05 6B 05         [ 2] 2285 	ldw x,#1   ; default step  
      009D63 1F 01            [ 2] 2286 	ldw (FSTEP+1,sp),x 
      009D65 90 AE            [ 2] 2287 	jra store_loop_addr 
                                   2288 
                                   2289 
                                   2290 ;----------------------------------
                                   2291 ; BASIC: STEP expr 
                                   2292 ; optional third par of FOR loop
                                   2293 ; initialization. 	
                                   2294 ;------------------------------------
      002240                       2295 step: ; {var limit -- var limit step}
      009D67 40 00 1E 01 17   [ 2] 2296 	btjt flags,#FLOOP,1$
      009D6C 03 90 C3         [ 2] 2297 	jp syntax_error
      009D6F 00 25 24         [ 4] 2298 1$: call expression 
      009D72 1A 90            [ 1] 2299 	cp a,#TK_INTGR
      009D74 F6 11            [ 1] 2300 	jreq 2$
      009D76 05 26 07         [ 2] 2301 	jp syntax_error
      002252                       2302 2$:	
      002252                       2303 	_xpop 
      009D79 90 5C            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



      009D7B CD               [ 1]    2     ldw x,y 
      009D7C 94 6F            [ 2]    3     ldw x,(1,x)
      009D7E 26 11 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D80 6B 03            [ 1] 2304 	ld (FSTEP,sp),a 
      009D80 16 03            [ 2] 2305 	ldw (FSTEP+1,sp),x ; step
                                   2306 ; if step < 0 decrement LIMIT 
      009D82 90               [ 1] 2307 	tnz a
      009D83 F6 C7            [ 1] 2308 	jrpl store_loop_addr 
      009D85 00 0F            [ 1] 2309 	ld a,(LIMIT,sp)
      009D87 72 B9            [ 2] 2310 	ldw x,(LIMIT+1,sp)
      009D89 00 0E 20         [ 2] 2311 	subw x,#1 
      009D8C DC 00            [ 1] 2312 	sbc a,#0 
      009D8D 6B 06            [ 1] 2313 	ld (LIMIT,sp),a 
      009D8D 0F 03            [ 2] 2314 	ldw (LIMIT+1,sp),x 
                                   2315 ; leave loop back entry point on cstack 
                                   2316 ; cstack is 1 call deep from interpreter
      00226F                       2317 store_loop_addr:
      009D8F 0F 04 04         [ 2] 2318 	ldw x,basicptr
      009D91 1F 0D            [ 2] 2319 	ldw (BPTR,sp),x 
      009D91 1E 03 5B         [ 2] 2320 	ldw x,in.w 
      009D94 05 90            [ 2] 2321 	ldw (INW,sp),x   
      009D96 85 81 00 22      [ 1] 2322 	bres flags,#FLOOP 
      009D98 72 5C 00 1F      [ 1] 2323 	inc loop_depth  
      009D98 90               [ 4] 2324 	ret 
                                   2325 
                                   2326 ;--------------------------------
                                   2327 ; BASIC: NEXT var 
                                   2328 ; FOR loop control 
                                   2329 ; increment variable with step 
                                   2330 ; and compare with limit 
                                   2331 ; loop if threshold not crossed.
                                   2332 ; else stack. 
                                   2333 ; and decrement 'loop_depth' 
                                   2334 ;--------------------------------
      002282                       2335 next: ; {var limit step retl1 -- [var limit step ] }
      009D99 89 52 08 0F      [ 1] 2336 	tnz loop_depth 
      009D9D 06 CD            [ 1] 2337 	jrne 1$ 
      009D9F 98 21 A1         [ 2] 2338 	jp syntax_error 
      00228B                       2339 1$: 
      009DA2 04 26            [ 1] 2340 	ld a,#TK_VAR 
      009DA4 0D CD 98         [ 4] 2341 	call expect
      009DA7 70 A4 DF         [ 4] 2342 	call get_addr 
                                   2343 ; check for good variable after NEXT 	 
      009DAA A1 55            [ 2] 2344 	cpw x,(CVAR,sp)
      009DAC 26 08            [ 1] 2345 	jreq 2$  
      009DAE 03 06 20         [ 2] 2346 	jp syntax_error ; not the good one 
      00229A                       2347 2$: 
      009DB1 07 A1 03         [ 2] 2348 	ldw ptr16,x 
                                   2349 	; increment variable 
      009DB4 27               [ 1] 2350 	ld a,(x)
      009DB5 08 CC            [ 2] 2351 	ldw x,(1,x)  ; get var value 
      009DB7 97 20 04         [ 2] 2352 	addw x,(FSTEP+1,sp) ; var+step 
      009DB9 19 03            [ 1] 2353 	adc a,(FSTEP,sp)
      009DB9 A6 03 CD 99      [ 4] 2354 	ld [ptr16],a
      009DBD CF 5C 00 1A      [ 1] 2355 	inc ptr8  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009DBE 72 CF 00 19      [ 5] 2356 	ldw [ptr16],x 
      009DBE 1F 01 CD         [ 1] 2357 	ld acc24,a 
      009DC1 98 47 1E         [ 2] 2358 	ldw acc16,x 
      009DC4 01 CD            [ 1] 2359 	ld a,(LIMIT,sp)
      009DC6 94 64            [ 2] 2360 	ldw x,(LIMIT+1,sp)
      009DC8 AB 05 6B 05      [ 2] 2361 	subw x,acc16 
      009DCC 16 01 AE         [ 1] 2362 	sbc a,acc24
      009DCF 16 68            [ 1] 2363 	xor a,(FSTEP,sp)
      009DD1 7B 05            [ 1] 2364 	xor a,#0x80
      009DD3 F7 5C            [ 1] 2365 	jrmi loop_back  
      009DD5 CD 94            [ 2] 2366 	jra loop_done   
                                   2367 ; check sign of STEP  
      009DD7 80 1F            [ 1] 2368 	ld a,(FSTEP,sp)
      009DD9 03 5F            [ 1] 2369 	jrpl 4$
                                   2370 ;negative step
      009DDB 7B 05 A0         [ 1] 2371     ld a,acc8 
      009DDE 04 97            [ 1] 2372 	jrslt loop_back   
      009DE0 72 FB            [ 2] 2373 	jra loop_done  
      0022D5                       2374 4$: ; positive step
      009DE2 03 1F 03 A6 32   [ 2] 2375 	btjt acc8,#7,loop_done 
      0022DA                       2376 loop_back:
      009DE7 CD 99            [ 2] 2377 	ldw x,(BPTR,sp)
      009DE9 CF 16 07         [ 2] 2378 	ldw basicptr,x 
      009DEC CD 9B 01 A1 84   [ 2] 2379 	btjf flags,#FRUN,1$ 
      009DF1 27 03            [ 1] 2380 	ld a,(2,x)
      009DF3 CC 97 20         [ 1] 2381 	ld count,a
      009DF6 90 F6            [ 2] 2382 1$:	ldw x,(INW,sp)
      009DF8 93 EE 01         [ 2] 2383 	ldw in.w,x 
      009DFB 72               [ 4] 2384 	ret 
      0022EF                       2385 loop_done:
                                   2386 	; remove loop data from stack  
      009DFC A9               [ 2] 2387 	popw x
      0022F0                       2388 	_drop VSIZE 
      009DFD 00 03            [ 2]    1     addw sp,#VSIZE 
      009DFF 17 07 16 03      [ 1] 2389 	dec loop_depth 
      009E03 90               [ 2] 2390 	jp (x)
                                   2391 
                                   2392 ;----------------------------
                                   2393 ; called by goto/gosub
                                   2394 ; to get target line number 
                                   2395 ; output:
                                   2396 ;    x    line address 
                                   2397 ;---------------------------
      0022F7                       2398 get_target_line:
      009E04 F7 90 EF         [ 4] 2399 	call next_token  
      009E07 01 72            [ 1] 2400 	cp a,#TK_INTGR
      009E09 5F 00            [ 1] 2401 	jreq get_target_line_addr 
      009E0B 19 1E            [ 1] 2402 	cp a,#TK_LABEL 
      009E0D 01 CD            [ 1] 2403 	jreq look_target_symbol 
      009E0F 9D 54 5D         [ 2] 2404 	jp syntax_error
                                   2405 ; the target is a line number 
                                   2406 ; search it. 
      002305                       2407 get_target_line_addr:
      009E12 27 06            [ 2] 2408 	pushw y 
      009E14 0D 06 27         [ 4] 2409 	call get_int24 ; line # 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009E17 1B               [ 1] 2410 	clr a
      009E18 20 03 00 04      [ 2] 2411 	ldw y,basicptr 
      009E1A 90 FE            [ 2] 2412 	ldw y,(y)
      009E1A CE 00            [ 2] 2413 	pushw y 
      009E1C 25 01            [ 2] 2414 	cpw x,(1,sp)
      009E1D                       2415 	_drop 2  
      009E1D CF 00            [ 2]    1     addw sp,#2 
      009E1F 1A AE            [ 1] 2416 	jrult 11$
      009E21 16               [ 1] 2417 	inc a 
      00231A                       2418 11$: ; scan program for this line# 	
      009E22 68 7B 05         [ 4] 2419 	call search_lineno  
      009E25 CD               [ 2] 2420 	tnzw x ; 0| line# address 
      009E26 89 05            [ 1] 2421 	jrne 2$ 
      009E28 5F 7B            [ 1] 2422 	ld a,#ERR_NO_LINE 
      009E2A 05 97 72         [ 2] 2423 	jp tb_error 
      009E2D BB 00            [ 2] 2424 2$:	popw y  
      009E2F 25               [ 4] 2425 	ret 
                                   2426 
                                   2427 ; the GOTO|GOSUB target is a symbol.
      002328                       2428 look_target_symbol:
      009E30 CF 00            [ 2] 2429 	pushw y 
      009E32 25               [ 2] 2430 	pushw x 
      009E33 72 5F 00 0D      [ 1] 2431 	clr acc16 
      009E33 CD 98 21 A1      [ 2] 2432 	ldw y,txtbgn 
      009E37 08 26 03         [ 1] 2433 1$:	ld a,(3,y) ; first TK_ID on line 
      009E3A CC 9D            [ 1] 2434 	cp a,#TK_LABEL 
      009E3C B9 15            [ 1] 2435 	jreq 3$ 
      009E3D 90 E6 02         [ 1] 2436 2$:	ld a,(2,y); line length 
      009E3D 55 00 03         [ 1] 2437 	ld acc8,a 
      009E40 00 02 00 0D      [ 2] 2438 	addw y,acc16 ;point to next line 
      009E42 90 C3 00 1D      [ 2] 2439 	cpw y,txtend 
      009E42 5B 08            [ 1] 2440 	jrult 1$
      009E44 90 85            [ 1] 2441 	ld a,#ERR_BAD_VALUE
      009E46 81 16 A2         [ 2] 2442 	jp tb_error 
      009E47                       2443 3$: ; found a TK_LABEL 
                                   2444 	; compare with GOTO|GOSUB target 
      009E47 CE 00            [ 2] 2445 	pushw y ; line address 
      009E49 1E 72 B0 00      [ 2] 2446 	addw y,#4 ; label string 
      009E4D 1C 81            [ 2] 2447 	ldw x,(3,sp) ; target string 
      009E4F CD 13 EF         [ 4] 2448 	call strcmp
      009E4F AE 9E            [ 1] 2449 	jrne 4$
      009E51 8E CD            [ 2] 2450 	popw y 
      009E53 8A 21            [ 2] 2451 	jra 2$ 
      002360                       2452 4$: ; target found 
      009E55 CE               [ 2] 2453 	popw x ;  address line target  
      002361                       2454 	_drop 2 ; target string 
      009E56 00 1C            [ 2]    1     addw sp,#2 
      009E58 35 10            [ 2] 2455 	popw y 
      009E5A 00               [ 4] 2456 	ret
                                   2457 
                                   2458 
                                   2459 ;--------------------------------
                                   2460 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2461 ; selective goto or gosub 
                                   2462 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      002366                       2463 cmd_on:
      009E5B 0B CD 98 76 35   [ 2] 2464 	btjt flags,#FRUN,0$ 
      009E60 0A 00            [ 1] 2465 	ld a,#ERR_RUN_ONLY
      009E62 0B AE 9E         [ 2] 2466 	jp tb_error 
      009E65 A0 CD 8A         [ 4] 2467 0$:	call expression 
      009E68 21 CD            [ 1] 2468 	cp a,#TK_INTGR
      009E6A 9E 47            [ 1] 2469 	jreq 1$
      009E6C CD 98 76         [ 2] 2470 	jp syntax_error
      00237A                       2471 1$: _xpop
      009E6F AE 9E            [ 1]    1     ld a,(y)
      009E71 B1               [ 1]    2     ldw x,y 
      009E72 CD 8A            [ 2]    3     ldw x,(1,x)
      009E74 21 CE 00 1C      [ 2]    4     addw y,#CELL_SIZE 
                                   2472 ; the selector is the element indice 
                                   2473 ; in the list of arguments. {1..#elements} 
      009E78 A3               [ 1] 2474 	ld a,xl ; keep only bits 7..0
      009E79 B6 84            [ 1] 2475 	jreq 9$ ; element # begin at 1. 
      009E7B 25               [ 1] 2476 	push a  ; selector  
      009E7C 05 AE 9E         [ 4] 2477 	call next_token
      009E7F B8 20            [ 1] 2478 	cp a,#TK_CMD 
      009E81 03 AE            [ 1] 2479 	jreq 2$ 
      009E83 9E C9 CD         [ 2] 2480 	jp syntax_error 
      009E86 8A 21 A6         [ 4] 2481 2$: call get_code_addr
                                   2482 ;; must be a GOTO or GOSUB 
      009E89 0D CD 89         [ 2] 2483 	cpw x,#goto 
      009E8C C4 81            [ 1] 2484 	jreq 4$
      009E8E 70 72 6F         [ 2] 2485 	cpw x,#gosub 
      009E91 67 72            [ 1] 2486 	jreq 4$ 
      009E93 61 6D 20         [ 2] 2487 	jp syntax_error 
      0023A1                       2488 4$: 
      009E96 61               [ 1] 2489 	pop a 
      009E97 64               [ 2] 2490 	pushw x ; save routine address 	
      009E98 64               [ 1] 2491 	push a  ; selector  
      0023A4                       2492 5$: ; skip elements in list until selector==0 
      009E99 72 65            [ 1] 2493 	dec (1,sp)
      009E9B 73 73            [ 1] 2494 	jreq 6$ 
                                   2495 ; can be a line# or a label 
      009E9D 3A 20 00         [ 4] 2496 	call next_token 
      009EA0 2C 20            [ 1] 2497 	cp a,#TK_INTGR 
      009EA2 70 72            [ 1] 2498 	jreq 52$
      009EA4 6F 67            [ 1] 2499 	cp a,#TK_LABEL 
      009EA6 72 61            [ 1] 2500 	jreq 54$
      009EA8 6D 20 73         [ 2] 2501 	jp syntax_error 
      0023B6                       2502 52$: ; got a line number 
      009EAB 69 7A 65         [ 1] 2503 	ld a,in ; skip over int24 value 
      009EAE 3A 20            [ 1] 2504 	add a,#CELL_SIZE ; integer size  
      009EB0 00 20 62         [ 1] 2505 	ld in,a 
      009EB3 79 74            [ 2] 2506 	jra 56$
      009EB5 65 73 00         [ 4] 2507 54$: call skip_string ; skip over label 	
      0023C3                       2508 56$: ; if another element comma present 
      009EB8 20 69 6E         [ 4] 2509 	call next_token
      009EBB 20 46            [ 1] 2510 	cp a,#TK_COMMA 
      009EBD 4C 41            [ 1] 2511 	jreq 5$ 
                                   2512 ; arg list exhausted, selector to big 
                                   2513 ; continue execution on next line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      0023CA                       2514 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009EBF 53 48            [ 2]    1     addw sp,#3 
      009EC1 20 6D            [ 2] 2515 	jra 9$
      0023CE                       2516 6$: ;at selected position  
      0023CE                       2517 	_drop 1 ; discard selector
      009EC3 65 6D            [ 2]    1     addw sp,#1 
                                   2518 ; here only the routine address 
                                   2519 ; of GOTO|GOSUB is on stack 
      009EC5 6F 72 79         [ 4] 2520     call get_target_line
      009EC8 00 20 69         [ 2] 2521 	ldw ptr16,x 	
      009ECB 6E 20 52 41 4D   [ 1] 2522 	mov in,count ; move to end of line  
      009ED0 20               [ 2] 2523 	popw x ; cmd address, GOTO||GOSUB 
      009ED1 6D 65 6D         [ 2] 2524 	cpw x,#goto 
      009ED4 6F 72            [ 1] 2525 	jrne 7$ 
      009ED6 79 00 19         [ 2] 2526 	ldw x,ptr16 
      009ED8 20 19            [ 2] 2527 	jra jp_to_target
      0023E6                       2528 7$: 
      009ED8 72 01            [ 2] 2529 	jra gosub_2 ; target in ptr16 
      0023E8                       2530 9$: ; expr out of range skip to end of line
                                   2531     ; this will force a fall to next line  
      009EDA 00 23 05 A6 07   [ 1] 2532 	mov in,count
      0023ED                       2533 	_drop 2
      009EDF CC 97            [ 2]    1     addw sp,#2 
      009EE1 22 17 53         [ 2] 2534 	jp next_line  
                                   2535 
                                   2536 
                                   2537 ;------------------------
                                   2538 ; BASIC: GOTO line# 
                                   2539 ; jump to line# 
                                   2540 ; here cstack is 2 call deep from interpreter 
                                   2541 ;------------------------
      009EE2                       2542 goto:
      009EE2 CD 98 21 A1 04   [ 2] 2543 	btjt flags,#FRUN,goto_1  
      009EE7 26 10            [ 1] 2544 	ld a,#ERR_RUN_ONLY
      009EE9 CD 98 70         [ 2] 2545 	jp tb_error 
      0023FC                       2546 goto_1:
      009EEC A4 DF A1         [ 4] 2547 	call get_target_line
      0023FF                       2548 jp_to_target:
      009EEF 43 26 04         [ 2] 2549 	ldw basicptr,x 
      009EF2 CD 9C            [ 1] 2550 	ld a,(2,x)
      009EF4 BF 81 CC         [ 1] 2551 	ld count,a 
      009EF7 97 20 55 00      [ 1] 2552 	mov in,#3 
      009EFB 03               [ 4] 2553 	ret 
                                   2554 
                                   2555 
                                   2556 ;--------------------
                                   2557 ; BASIC: GOSUB line#
                                   2558 ; basic subroutine call
                                   2559 ; actual line# and basicptr 
                                   2560 ; are saved on cstack
                                   2561 ; here cstack is 2 call deep from interpreter 
                                   2562 ;--------------------
                           000001  2563 	TARGET=1   ; target address 
                           000003  2564 	RET_ADDR=3 ; subroutine return address 
                           000005  2565 	RET_BPTR=5 ; basicptr return point 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



                           000007  2566 	RET_INW=7  ; in.w return point 
                           000004  2567 	VSIZE=4  
      00240C                       2568 gosub:
      009EFC 00 02 CD 9E 47   [ 2] 2569 	btjt flags,#FRUN,gosub_1 
      009F01 22 01            [ 1] 2570 	ld a,#ERR_RUN_ONLY
      009F03 81 52 06         [ 2] 2571 	jp tb_error 
      009F06 CE               [ 4] 2572 	ret 
      002417                       2573 gosub_1:
      009F07 00 1C 1F         [ 4] 2574 	call get_target_line 
      009F0A 05 FE 1F         [ 2] 2575 	ldw ptr16,x 
      00241D                       2576 gosub_2: 
      009F0D 01               [ 2] 2577 	popw x 
      00241E                       2578 	_vars VSIZE  
      009F0E AE 7F            [ 2]    1     sub sp,#VSIZE 
      009F10 FF               [ 2] 2579 	pushw x ; RET_ADDR 
      009F11 1F 03 CD         [ 2] 2580 	ldw x,ptr16 
      009F14 99               [ 2] 2581 	pushw x ; TARGET
                                   2582 ; save BASIC subroutine return point.   
      009F15 E1 4D 27         [ 2] 2583 	ldw x,basicptr
      009F18 31 A1            [ 2] 2584 	ldw (RET_BPTR,sp),x 
      009F1A 02 27 07         [ 2] 2585 	ldw x,in.w 
      009F1D A1 01            [ 2] 2586 	ldw (RET_INW,sp),x
      009F1F 27               [ 2] 2587 	popw x 
      009F20 06 CC            [ 2] 2588 	jra jp_to_target
                                   2589 
                                   2590 ;------------------------
                                   2591 ; BASIC: RETURN 
                                   2592 ; exit from BASIC subroutine 
                                   2593 ;------------------------
                           000003  2594 	RET_BPTR=3 ; basicptr return point 
                           000005  2595 	RET_INW=5  ; in.w return point 
                           000004  2596 	VSIZE=4  
      002432                       2597 return:
      009F22 97 20 85 1F 05   [ 2] 2598 	btjt flags,#FRUN,0$ 
      009F27 A6 06            [ 1] 2599 	ld a,#ERR_RUN_ONLY
      009F27 85 1F 01         [ 2] 2600 	jp tb_error 
      009F2A                       2601 0$:	
      009F2A CE 00            [ 2] 2602 	ldw x,(RET_ADDR,sp) 
      009F2C 1C 1F 05         [ 2] 2603 	ldw basicptr,x
      009F2F C3 00            [ 1] 2604 	ld a,(2,x)
      009F31 1E 2A 38         [ 1] 2605 	ld count,a  
      009F34 FE 13            [ 2] 2606 	ldw x,(RET_INW,sp)
      009F36 01 2A 11         [ 2] 2607 	ldw in.w,x 
      009F39 1E               [ 2] 2608 	popw x 
      00244C                       2609 	_drop VSIZE 
      009F3A 05 E6            [ 2]    1     addw sp,#VSIZE 
      009F3C 02               [ 2] 2610 	pushw x
      009F3D C7               [ 4] 2611 	ret  
                                   2612 
                                   2613 ;----------------------------------
                                   2614 ; BASIC: RUN
                                   2615 ; run BASIC program in RAM
                                   2616 ;----------------------------------- 
      002450                       2617 run: 
      009F3E 00 0F 72 5F 00   [ 2] 2618 	btjf flags,#FRUN,0$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      009F43 0E               [ 1] 2619 	clr a 
      009F44 72               [ 4] 2620 	ret
      002457                       2621 0$: 
      009F45 BB 00 0E 20 E3   [ 2] 2622 	btjf flags,#FBREAK,1$
      009F4A                       2623 	_drop 2 
      009F4A 1E 05            [ 2]    1     addw sp,#2 
      009F4C E6 02 CD         [ 4] 2624 	call rest_context
      002461                       2625 	_drop CTXT_SIZE 
      009F4F 9F C1            [ 2]    1     addw sp,#CTXT_SIZE 
      009F51 1E 05 E6 02      [ 1] 2626 	bres flags,#FBREAK 
      009F55 C7 00 0F 72      [ 1] 2627 	bset flags,#FRUN 
      009F59 5F 00 0E         [ 2] 2628 	jp interpreter 
      009F5C 72 BB 00         [ 2] 2629 1$:	ldw x,txtbgn
      009F5F 0E C3 00         [ 2] 2630 	cpw x,txtend 
      009F62 1E 2A            [ 1] 2631 	jrmi run_it 
      009F64 07 1F 05         [ 2] 2632 	ldw x,#err_no_prog
      009F67 FE 13 03         [ 4] 2633 	call puts 
      009F6A 2F DE 03 00 01   [ 1] 2634 	mov in,count
      009F6C 81               [ 4] 2635 	ret 
      002482                       2636 run_it:	 
      002482                       2637 	_drop 2 ; drop return address 
      009F6C 55 00            [ 2]    1     addw sp,#2 
      002484                       2638 run_it_02: 
      009F6E 04 00 02         [ 4] 2639     call ubound 
      009F71 AE 16 B8         [ 4] 2640 	call clear_vars 
                                   2641 ; clear data pointer 
      009F74 CF               [ 1] 2642 	clrw x 
      009F75 00 05 5B         [ 2] 2643 	ldw data_ptr,x 
      009F78 06 CD 9E 4F      [ 1] 2644 	clr data_ofs 
      009F7C 81 5F 00 09      [ 1] 2645 	clr data_len 
                                   2646 ; initialize BASIC pointer 
      009F7D CE 00 1B         [ 2] 2647 	ldw x,txtbgn 
      009F7D CD A7 95         [ 2] 2648 	ldw basicptr,x 
      009F80 27 07            [ 1] 2649 	ld a,(2,x)
      009F82 AE 9F AA         [ 1] 2650 	ld count,a
      009F85 CD 8A 21 81      [ 1] 2651 	mov in,#3	
      009F89 72 10 00 22      [ 1] 2652 	bset flags,#FRUN 
      009F89 90 AE B6         [ 2] 2653 	jp interpreter 
                                   2654 
                                   2655 
                                   2656 ;----------------------
                                   2657 ; BASIC: END
                                   2658 ; end running program
                                   2659 ;---------------------- 
      0024AC                       2660 cmd_end: 
                                   2661 ; clean stack 
      009F8C 80 CE B6         [ 2] 2662 	ldw x,#STACK_EMPTY
      009F8F 82               [ 1] 2663 	ldw sp,x 
      009F90 1C 00 04         [ 2] 2664 	jp warm_start
                                   2665 
                                   2666 ;---------------------------
                                   2667 ; BASIC: GET var 
                                   2668 ; receive a key in variable 
                                   2669 ; don't wait 
                                   2670 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      0024B3                       2671 cmd_get:
      009F93 CF 00 0E         [ 4] 2672 	call next_token 
      009F96 AE 00            [ 1] 2673 	cp a,#TK_VAR 
      009F98 7C CD            [ 1] 2674 	jreq 0$
      009F9A 94 90 AE         [ 2] 2675 	jp syntax_error 
      009F9D 00 80 CF         [ 4] 2676 0$: call get_addr 
      009FA0 00 1C 72         [ 2] 2677 	ldw ptr16,x 
      009FA3 BB 00 7E         [ 4] 2678 	call qgetc 
      009FA6 CF 00            [ 1] 2679 	jreq 2$
      009FA8 1E 81 4E         [ 4] 2680 	call getc  
      009FAB 6F 20 61 70      [ 4] 2681 2$: clr [ptr16]
      009FAF 70 6C 69 63      [ 1] 2682 	inc ptr8 
      009FB3 61 74 69 6F      [ 4] 2683 	clr [ptr16]
      009FB7 6E 20 73 61      [ 1] 2684 	inc ptr8 
      009FBB 76 65 64 2E      [ 4] 2685 	ld [ptr16],a 
      009FBF 0A               [ 4] 2686 	ret 
                                   2687 
                                   2688 
                                   2689 ;-----------------
                                   2690 ; 1 Khz beep 
                                   2691 ;-----------------
      0024E0                       2692 beep_1khz:: 
      009FC0 00 00 64         [ 2] 2693 	ldw x,#100
      009FC1 90 AE 03 E8      [ 2] 2694 	ldw y,#1000
      009FC1 90 89            [ 2] 2695 	jra beep
                                   2696 
                                   2697 ;-----------------------
                                   2698 ; BASIC: TONE expr1,expr2
                                   2699 ; used TIMER2 channel 1
                                   2700 ; to produce a tone 
                                   2701 ; arguments:
                                   2702 ;    expr1   frequency 
                                   2703 ;    expr2   duration msec.
                                   2704 ;---------------------------
      0024E9                       2705 tone:
      009FC3 C7 00 04         [ 4] 2706 	call arg_list 
      009FC6 E6 02            [ 1] 2707 	cp a,#2 
      009FC8 C1 00            [ 1] 2708 	jreq 1$
      009FCA 04 2A 03         [ 2] 2709 	jp syntax_error 
      0024F3                       2710 1$: 
      0024F3                       2711 	_xpop 
      009FCD C7 00            [ 1]    1     ld a,(y)
      009FCF 04               [ 1]    2     ldw x,y 
      009FD0 CF 00            [ 2]    3     ldw x,(1,x)
      009FD2 05 90 AE 16      [ 2]    4     addw y,#CELL_SIZE 
      009FD6 68               [ 2] 2712 	pushw x ; duration 
      0024FD                       2713 	_xpop ; frequency
      009FD7 CD 92            [ 1]    1     ld a,(y)
      009FD9 88               [ 1]    2     ldw x,y 
      009FDA CD 8A            [ 2]    3     ldw x,(1,x)
      009FDC 21 A6 0D CD      [ 2]    4     addw y,#CELL_SIZE 
      009FE0 89 C4            [ 1] 2714 	ldw y,x ; frequency 
      009FE2 90               [ 2] 2715 	popw x  ; duration 
      002509                       2716 beep:  
      009FE3 85               [ 2] 2717 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009FE4 81 F4 24         [ 2] 2718 	ldw x,#TIM2_CLK_FREQ
      009FE5 65               [ 2] 2719 	divw x,y ; cntr=Fclk/freq 
                                   2720 ; round to nearest integer 
      009FE5 52 01 7A 12      [ 2] 2721 	cpw y,#TIM2_CLK_FREQ/2
      009FE7 2B 01            [ 1] 2722 	jrmi 2$
      009FE7 0F               [ 1] 2723 	incw x 
      002515                       2724 2$:	 
      009FE8 01               [ 1] 2725 	ld a,xh 
      009FE9 C7 53 0D         [ 1] 2726 	ld TIM2_ARRH,a 
      009FE9 CD               [ 1] 2727 	ld a,xl 
      009FEA 98 21 A1         [ 1] 2728 	ld TIM2_ARRL,a 
                                   2729 ; 50% duty cycle 
      009FED 02               [ 1] 2730 	ccf 
      009FEE 25               [ 2] 2731 	rrcw x 
      009FEF 08               [ 1] 2732 	ld a,xh 
      009FF0 A1 0A 27         [ 1] 2733 	ld TIM2_CCR1H,a 
      009FF3 04               [ 1] 2734 	ld a,xl
      009FF4 A1 80 26         [ 1] 2735 	ld TIM2_CCR1L,a
      009FF7 07 10 53 08      [ 1] 2736 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009FF8 72 10 53 00      [ 1] 2737 	bset TIM2_CR1,#TIM2_CR1_CEN
      009FF8 55 00 03 00      [ 1] 2738 	bset TIM2_EGR,#TIM2_EGR_UG
      009FFC 02               [ 2] 2739 	popw x 
      009FFD 20 5A 84         [ 4] 2740 	call pause02
      009FFF 72 11 53 08      [ 1] 2741 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009FFF A1 02 27 12      [ 1] 2742 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A003 A1               [ 4] 2743 	ret 
                                   2744 
                                   2745 ;-------------------------------
                                   2746 ; BASIC: ADCON 0|1 [,divisor]  
                                   2747 ; disable/enanble ADC 
                                   2748 ;-------------------------------
                           000003  2749 	ONOFF=3 
                           000001  2750 	DIVSOR=1
                           000004  2751 	VSIZE=4 
      002540                       2752 power_adc:
      00A004 04 27 1B         [ 4] 2753 	call arg_list 
      00A007 A1 82            [ 1] 2754 	cp a,#2	
      00A009 27 1F            [ 1] 2755 	jreq 1$
      00A00B A1 08            [ 1] 2756 	cp a,#1 
      00A00D 27 24            [ 1] 2757 	jreq 0$ 
      00A00F A1 09 27         [ 2] 2758 	jp syntax_error 
      00A012 24               [ 1] 2759 0$:	clr a 
      00A013 20               [ 1] 2760 	clrw x
      002550                       2761 	_xpush   ; divisor  
      00A014 37 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A015 90 F7            [ 1]    2     ld (y),a 
      00A015 CD 8A 21         [ 2]    3     ldw (1,y),x 
      002559                       2762 1$: _at_next 
      00A018 5C 72 B0         [ 1]    1     ld a,(3,y)
      00A01B 00               [ 1]    2     ldw x,y 
      00A01C 05 CF            [ 2]    3     ldw x,(4,x)
      00A01E 00               [ 2] 2763 	tnzw x 
      00A01F 01 20            [ 1] 2764 	jreq 2$ 
      002562                       2765 	_xpop
      00A021 C5 F6            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A022 93               [ 1]    2     ldw x,y 
      00A022 CD 98            [ 2]    3     ldw x,(1,x)
      00A024 70 CD 89 C4      [ 2]    4     addw y,#CELL_SIZE 
      00256B                       2766 	_xdrop  
      00A028 20 BD 00 03      [ 2]    1     addw y,#CELL_SIZE 
      00A02A 9F               [ 1] 2767 	ld a,xl
      00A02A CD 98            [ 1] 2768 	and a,#7
      00A02C 3A               [ 1] 2769 	swap a 
      00A02D FD CD 89         [ 1] 2770 	ld ADC_CR1,a
      00A030 C4 20 B4 CA      [ 1] 2771 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A033 72 10 54 01      [ 1] 2772 	bset ADC_CR1,#ADC_CR1_ADON 
      00257E                       2773 	_usec_dly 7 
      00A033 03 01 20         [ 2]    1     ldw x,#(16*7-2)/4
      00A036 B2               [ 2]    2     decw x
      00A037 9D               [ 1]    3     nop 
      00A037 CD 98            [ 1]    4     jrne .-4
      00A039 21 A1            [ 2] 2774 	jra 3$
      00A03B 84 27 03 CC      [ 1] 2775 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A03F 97 20 50 CA      [ 1] 2776 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A041                       2777 3$:	
      00A041 CD               [ 4] 2778 	ret
                                   2779 
                                   2780 ;-----------------------------
                                   2781 ; BASIC: ADCREAD (channel)
                                   2782 ; read adc channel {0..5}
                                   2783 ; output:
                                   2784 ;   A 		TK_INTGR 
                                   2785 ;   X 		value 
                                   2786 ;-----------------------------
      002590                       2787 analog_read:
      00A042 98 60 9F         [ 4] 2788 	call func_args 
      00A045 A4 0F            [ 1] 2789 	cp a,#1 
      00A047 C7 00            [ 1] 2790 	jreq 1$
      00A049 24 20 9B         [ 2] 2791 	jp syntax_error
      00A04C                       2792 1$: _xpop 
      00A04C 55 00            [ 1]    1     ld a,(y)
      00A04E 03               [ 1]    2     ldw x,y 
      00A04F 00 02            [ 2]    3     ldw x,(1,x)
      00A051 CD 9B 01 CD      [ 2]    4     addw y,#CELL_SIZE 
      00A055 98 9B 20         [ 2] 2793 	cpw x,#5 
      00A058 8E 05            [ 2] 2794 	jrule 2$
      00A059 A6 0A            [ 1] 2795 	ld a,#ERR_BAD_VALUE
      00A059 0D 01 26         [ 2] 2796 	jp tb_error 
      00A05C 05               [ 1] 2797 2$: ld a,xl
      00A05D A6 0D CD         [ 1] 2798 	ld acc8,a 
      00A060 89 C4            [ 1] 2799 	ld a,#5
      00A062 5B 01 81         [ 1] 2800 	sub a,acc8 
      00A065 C7 54 00         [ 1] 2801 	ld ADC_CSR,a
      00A065 CE 00 05 1F      [ 1] 2802 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A069 03 C6 00 02      [ 1] 2803 	bset ADC_CR1,#ADC_CR1_ADON
      00A06D 6B 05 C6 00 04   [ 2] 2804 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A072 6B 06 81         [ 2] 2805 	ldw x,ADC_DRH
      00A075 A6 84            [ 1] 2806 	ld a,#TK_INTGR
      00A075 1E               [ 4] 2807 	ret 
                                   2808 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   2809 ;-----------------------
                                   2810 ; BASIC: DREAD(pin)
                                   2811 ; Arduino pins 
                                   2812 ; read state of a digital pin 
                                   2813 ; pin# {0..15}
                                   2814 ; output:
                                   2815 ;    A 		TK_INTGR
                                   2816 ;    X      0|1 
                                   2817 ;-------------------------
                           000001  2818 	PINNO=1
                           000001  2819 	VSIZE=1
      0025CC                       2820 digital_read:
      0025CC                       2821 	_vars VSIZE 
      00A076 03 CF            [ 2]    1     sub sp,#VSIZE 
      00A078 00 05 7B         [ 4] 2822 	call func_args
      00A07B 05 C7            [ 1] 2823 	cp a,#1
      00A07D 00 02            [ 1] 2824 	jreq 1$
      00A07F 7B 06 C7         [ 2] 2825 	jp syntax_error
      0025D8                       2826 1$: _xpop 
      00A082 00 04            [ 1]    1     ld a,(y)
      00A084 81               [ 1]    2     ldw x,y 
      00A085 EE 01            [ 2]    3     ldw x,(1,x)
      00A085 90 89 52 05      [ 2]    4     addw y,#CELL_SIZE 
      00A089 A3 00 0F         [ 2] 2827 	cpw x,#15 
      00A089 0F 05            [ 2] 2828 	jrule 2$
      00A08B CD 98            [ 1] 2829 	ld a,#ERR_BAD_VALUE
      00A08D 21 A1 02         [ 2] 2830 	jp tb_error 
      00A090 26 10 CD         [ 4] 2831 2$:	call select_pin 
      00A093 8A 21            [ 1] 2832 	ld (PINNO,sp),a
      00A095 5C 72            [ 1] 2833 	ld a,(GPIO_IDR,x)
      00A097 B0 00            [ 1] 2834 	tnz (PINNO,sp)
      00A099 05 CF            [ 1] 2835 	jreq 8$
      00A09B 00               [ 1] 2836 3$: srl a 
      00A09C 01 03            [ 1] 2837 	dec (PINNO,sp)
      00A09E 05 CD            [ 1] 2838 	jrne 3$ 
      00A0A0 98 21            [ 1] 2839 8$: and a,#1 
      00A0A2 A1               [ 1] 2840 	clrw x 
      00A0A3 85               [ 1] 2841 	ld xl,a 
      00A0A4 27               [ 1] 2842 	clr a 
      002600                       2843 	_drop VSIZE
      00A0A5 03 CC            [ 2]    1     addw sp,#VSIZE 
      00A0A7 97               [ 4] 2844 	ret
                                   2845 
                                   2846 
                                   2847 ;-----------------------
                                   2848 ; BASIC: DWRITE pin,0|1
                                   2849 ; Arduino pins 
                                   2850 ; write to a digital pin 
                                   2851 ; pin# {0..15}
                                   2852 ; output:
                                   2853 ;    A 		TK_INTGR
                                   2854 ;    X      0|1 
                                   2855 ;-------------------------
                           000001  2856 	PINNO=1
                           000002  2857 	PINVAL=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                           000002  2858 	VSIZE=2
      002603                       2859 digital_write:
      002603                       2860 	_vars VSIZE 
      00A0A8 20 CD            [ 2]    1     sub sp,#VSIZE 
      00A0AA 98 56 CF         [ 4] 2861 	call arg_list  
      00A0AD 00 1A            [ 1] 2862 	cp a,#2 
      00A0AF 0D 05            [ 1] 2863 	jreq 1$
      00A0B1 26 06 CD         [ 2] 2864 	jp syntax_error
      00260F                       2865 1$: _xpop 
      00A0B4 92 5D            [ 1]    1     ld a,(y)
      00A0B6 CD               [ 1]    2     ldw x,y 
      00A0B7 89 C4            [ 2]    3     ldw x,(1,x)
      00A0B9 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0B9 A6               [ 1] 2866 	ld a,xl 
      00A0BA 3A CD            [ 1] 2867 	ld (PINVAL,sp),a
      00261B                       2868 	_xpop 
      00A0BC 89 C4            [ 1]    1     ld a,(y)
      00A0BE CD               [ 1]    2     ldw x,y 
      00A0BF A0 65            [ 2]    3     ldw x,(1,x)
      00A0C1 72 5F 00 04      [ 2]    4     addw y,#CELL_SIZE 
      00A0C5 CD 8B 26         [ 2] 2869 	cpw x,#15 
      00A0C8 AE 16            [ 2] 2870 	jrule 2$
      00A0CA 68 3B            [ 1] 2871 	ld a,#ERR_BAD_VALUE
      00A0CC 00 04 4B         [ 2] 2872 	jp tb_error 
      00A0CF 00 72 FB         [ 4] 2873 2$:	call select_pin 
      00A0D2 01 5C            [ 1] 2874 	ld (PINNO,sp),a 
      00A0D4 5B 02            [ 1] 2875 	ld a,#1
      00A0D6 72 5F            [ 1] 2876 	tnz (PINNO,sp)
      00A0D8 00 02            [ 1] 2877 	jreq 4$
      00A0DA CD               [ 1] 2878 3$: sll a
      00A0DB 8F 9F            [ 1] 2879 	dec (PINNO,sp)
      00A0DD A1 84            [ 1] 2880 	jrne 3$
      00A0DF 27 12            [ 1] 2881 4$: tnz (PINVAL,sp)
      00A0E1 A1 11            [ 1] 2882 	jrne 5$
      00A0E3 CD               [ 1] 2883 	cpl a 
      00A0E4 8F 9F            [ 1] 2884 	and a,(GPIO_ODR,x)
      00A0E6 A1 84            [ 2] 2885 	jra 8$
      00A0E8 27 06            [ 1] 2886 5$: or a,(GPIO_ODR,x)
      00A0EA CD A0            [ 1] 2887 8$: ld (GPIO_ODR,x),a 
      00264B                       2888 	_drop VSIZE 
      00A0EC 75 CC            [ 2]    1     addw sp,#VSIZE 
      00A0EE 97               [ 4] 2889 	ret
                                   2890 
                                   2891 
                                   2892 ;-----------------------
                                   2893 ; BASIC: STOP
                                   2894 ; stop progam execution  
                                   2895 ; without resetting pointers 
                                   2896 ; the program is resumed
                                   2897 ; with RUN 
                                   2898 ;-------------------------
      00264E                       2899 stop:
      00A0EF 20 00 00 22 02   [ 2] 2900 	btjt flags,#FRUN,2$
      00A0F0 4F               [ 1] 2901 	clr a
      00A0F0 CD               [ 4] 2902 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      002655                       2903 2$:	 
                                   2904 ; create space on cstack to save context 
      00A0F1 82 8D 7C         [ 2] 2905 	ldw x,#break_point 
      00A0F3 CD 09 A1         [ 4] 2906 	call puts 
      00265B                       2907 	_drop 2 ;drop return address 
      00A0F3 C6 00            [ 2]    1     addw sp,#2 
      00265D                       2908 	_vars CTXT_SIZE ; context size 
      00A0F5 0D CE            [ 2]    1     sub sp,#CTXT_SIZE 
      00A0F7 00 0E 72         [ 4] 2909 	call save_context 
      00A0FA C7 00 1A         [ 2] 2910 	ldw x,#tib 
      00A0FD 72 5C 00         [ 2] 2911 	ldw basicptr,x
      00A100 1B               [ 1] 2912 	clr (x)
      00A101 72 CF 00 1A      [ 1] 2913 	clr count  
      00A105 CD               [ 1] 2914 	clrw x 
      00A106 A0 75 CD         [ 2] 2915 	ldw in.w,x
      00A109 98 21 A1 08      [ 1] 2916 	bres flags,#FRUN 
      00A10D 26 03 CC A0      [ 1] 2917 	bset flags,#FBREAK
      00A111 89 17 4B         [ 2] 2918 	jp interpreter 
      00A112 0A 62 72 65 61 6B 20  2919 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   2920 
                                   2921 ;-----------------------
                                   2922 ; BASIC: NEW
                                   2923 ; from command line only 
                                   2924 ; free program memory
                                   2925 ; and clear variables 
                                   2926 ;------------------------
      00269A                       2927 new: 
      00A112 A1 00 27 07 A1   [ 2] 2928 	btjf flags,#FRUN,0$ 
      00A117 0A               [ 4] 2929 	ret 
      0026A0                       2930 0$:	
      00A118 27 03 CC         [ 4] 2931 	call clear_basic 
      00A11B 97               [ 4] 2932 	ret 
                                   2933 
                                   2934 ;-----------------------------------
                                   2935 ; BASIC: ERASE \E | \F 
                                   2936 ; erase all block in range from 
                                   2937 ;  'app_space' to FLASH end (0x20000)
                                   2938 ;  or all EEPROM 
                                   2939 ; that contains a non zero byte.  
                                   2940 ;-----------------------------------
                           000001  2941 	LIMIT=1 
                           000003  2942 	VSIZE = 3 
      0026A4                       2943 erase:
      00A11C 20 5F 00 18      [ 1] 2944 	clr farptr 
      00A11D                       2945 	_vars VSIZE 
      00A11D 5B 05            [ 2]    1     sub sp,#VSIZE 
      00A11F 90 85 81         [ 4] 2946 	call next_token 
      00A122 A1 04            [ 1] 2947 	cp a,#TK_CHAR 
      00A122 55 00            [ 1] 2948 	jreq 0$ 
      00A124 04 00 02         [ 2] 2949 	jp syntax_error
      00A127 81 17 F0         [ 4] 2950 0$: call get_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A128 A4 DF            [ 1] 2951 	and a,#0XDF 
      00A128 52 04            [ 1] 2952 	cp a,#'E
      00A12A 0F 01            [ 1] 2953 	jrne 1$
      00A12C CD 99 E1         [ 2] 2954 	ldw x,#EEPROM_BASE 
      00A12F A1 02 24         [ 2] 2955 	ldw farptr+1,x 
      00A132 03 CC 97         [ 2] 2956 	ldw x,#EEPROM_END
      00A135 20               [ 1] 2957 	clr a 
      00A136 A1 03            [ 2] 2958 	jra 3$ 
      00A138 25 0C            [ 1] 2959 1$: cp a,#'F 
      00A13A 90 F6            [ 1] 2960 	jreq 2$
      00A13C 93 EE 01         [ 2] 2961 	ldw x,#err_bad_value
      00A13F 72 A9 00         [ 2] 2962 	jp tb_error
      0026D3                       2963 2$:
      00A142 03 9F 6B         [ 2] 2964 	ldw x,#app_space  
      00A145 01 90 F6         [ 2] 2965 	ldw farptr+1,x 
      00A148 93 EE            [ 1] 2966 	ld a,#(FLASH_END>>16)&0XFF 
      00A14A 01 72 A9         [ 2] 2967 	ldw x,#FLASH_END&0xffff
      0026DE                       2968 3$:
      00A14D 00 03            [ 1] 2969 	ld (LIMIT,sp),a 
      00A14F 9F 6B            [ 2] 2970 	ldw (LIMIT+1,sp),x 
                                   2971  ; operation done from RAM
                                   2972  ; copy code to RAM in tib   
      00A151 02 90 F6         [ 4] 2973 	call move_erase_to_ram
      0026E5                       2974 4$:	 
      00A154 93 EE 01         [ 4] 2975     call scan_block 
      00A157 72 A9            [ 1] 2976 	jreq 5$  ; block already erased 
      00A159 00 03            [ 1] 2977     ld a,#'E 
      00A15B F6 14 02         [ 4] 2978     call putc 
      00A15E 18 01 27         [ 4] 2979 	call block_erase   
                                   2980 ; this block is clean, next  
      00A161 F9 5B 04         [ 2] 2981 5$:	ldw x,#BLOCK_SIZE
      00A164 81 08 B6         [ 4] 2982 	call incr_farptr
                                   2983 ; check limit, 24 bit substraction  	
      00A165 7B 01            [ 1] 2984 	ld a,(LIMIT,sp)
      00A165 CD 99            [ 2] 2985 	ldw x,(LIMIT+1,sp)
      00A167 E1 A1 02 27      [ 2] 2986 	subw x,farptr+1
      00A16B 03 CC 97         [ 1] 2987 	sbc a,farptr 
      00A16E 20 E0            [ 1] 2988 	jrugt 4$ 
      00A16F CD 14 FC         [ 4] 2989 9$: call clear_basic
      00A16F 90 F6            [ 2] 2990 	ldw x,(LIMIT+1,sp)
      00A171 93 EE 01         [ 2] 2991 	cpw x,#EEPROM_END
      00A174 72 A9            [ 1] 2992 	jrne 10$
      00A176 00 03 9F         [ 4] 2993 	call func_eefree 
      002712                       2994 10$:
      002712                       2995 	_drop VSIZE 
      00A179 88 90            [ 2]    1     addw sp,#VSIZE 
      00A17B F6               [ 4] 2996 	ret 
                                   2997 	
                                   2998 
                                   2999 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3000 ;  check for application signature 
                                   3001 ; output:
                                   3002 ;   Carry    0 app present 
                                   3003 ;            1 no app installed  
                                   3004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      002715                       3005 qsign: 
      00A17C 93 EE 01         [ 2] 3006 	ldw x,app_sign 
      00A17F 72 A9 00         [ 2] 3007 	cpw x,SIGNATURE ; "BC" 
      00A182 03               [ 4] 3008 	ret 
                                   3009 
                                   3010 ;--------------------------------------
                                   3011 ;  fill write buffer 
                                   3012 ;  input:
                                   3013 ;    y  point to output buffer 
                                   3014 ;    x  point to source 
                                   3015 ;    a  bytes to write in buffer 
                                   3016 ;  output:
                                   3017 ;    y   += A 
                                   3018 ;    X   += A 
                                   3019 ;    A   0 
                                   3020 ;---------------------------------------
      00271C                       3021 fill_write_buffer:
      00A183 84               [ 1] 3022 	push a 
      00A184 FA               [ 1] 3023 	tnz a 
      00A185 F7 81            [ 1] 3024 	jreq 9$ 
      00A187 F6               [ 1] 3025 1$: ld a,(x)
      00A187 CD               [ 1] 3026 	incw x 
      00A188 99 E1            [ 1] 3027 	ld (y),a 
      00A18A A1 02            [ 1] 3028 	incw y 
      00A18C 27 03            [ 1] 3029 	dec (1,sp) 
      00A18E CC 97            [ 1] 3030 	jrne 1$ 
      00A190 20               [ 1] 3031 9$:	pop a 
      00A191 81               [ 4] 3032     ret 	
                                   3033 
                                   3034 ;--------------------------------------
                                   3035 ;  fill pad buffer with zero 
                                   3036 ;  input:
                                   3037 ;	none 
                                   3038 ;  output:
                                   3039 ;    y     buffer address  
                                   3040 ;--------------------------------------
      00272C                       3041 clear_block_buffer:
      00A191 90               [ 1] 3042 	push a 
      00A192 F6 93 EE 01      [ 2] 3043 	ldw y,#block_buffer 
      00A196 72 A9            [ 2] 3044 	pushw y
      00A198 00 03            [ 1] 3045 	ld a,#BLOCK_SIZE   
      00A19A 9F 43            [ 1] 3046 1$:	clr (y)
      00A19C 88 90            [ 1] 3047 	incw y
      00A19E F6               [ 1] 3048 	dec a  
      00A19F 93 EE            [ 1] 3049 	jrne 1$ 	
      00A1A1 01 72            [ 2] 3050 9$: popw y 
      00A1A3 A9               [ 1] 3051 	pop a 			
      00A1A4 00               [ 4] 3052 	ret 
                                   3053 
                                   3054 
                                   3055 ;---------------------------------------
                                   3056 ; BASIC: SAVE
                                   3057 ; write application from RAM to FLASH
                                   3058 ;--------------------------------------
                           000001  3059 	XTEMP=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                           000003  3060 	COUNT=3  ; last count bytes written 
                           000004  3061 	CNT_LO=4 ; count low byte 
                           000005  3062 	TOWRITE=5 ; how bytes left to write  
                           000006  3063 	VSIZE=6 
      002740                       3064 save_app:
      00A1A5 03               [ 2] 3065 	pushw x 
      00A1A6 84 F4            [ 2] 3066 	pushw y 
      002743                       3067 	_vars VSIZE
      00A1A8 F7 81            [ 2]    1     sub sp,#VSIZE 
      00A1AA CD 27 15         [ 4] 3068 	call qsign 
      00A1AA CD 99            [ 1] 3069 	jrne 1$
      00A1AC E1 A1 02         [ 2] 3070 	ldw x,#CANT_DO 
      00A1AF 27 03 CC         [ 4] 3071 	call puts 
      00A1B2 97 20 90         [ 2] 3072 	jp 9$
      002753                       3073 1$: 
      00A1B5 F6 93 EE         [ 2] 3074 	ldw x,txtbgn
      00A1B8 01 72 A9         [ 2] 3075 	cpw x,txtend 
      00A1BB 00 03            [ 1] 3076 	jrult 2$ 
      00A1BD 9F 88 90         [ 2] 3077 	ldw x,#NO_APP
      00A1C0 F6 93 EE         [ 4] 3078 	call puts 
      00A1C3 01 72 A9         [ 2] 3079 	jp 9$
      002764                       3080 2$: 
                                   3081 ; block programming flash
                                   3082 ; must be done from RAM
                                   3083 ; moved in tib  
      00A1C6 00 03 84         [ 4] 3084 	call move_prg_to_ram
                                   3085 ; initialize farptr 
                                   3086 ; to app_sign address 
      00A1C9 F8 F7 81 18      [ 1] 3087 	clr farptr 
      00A1CC AE 36 00         [ 2] 3088 	ldw x,#app_sign 
      00A1CC CD 99 DC         [ 2] 3089 	ldw farptr+1,x
                                   3090 ; initialize local variables 
      00A1CF A1 02 27         [ 4] 3091 	call prog_size
      00A1D2 03 CC            [ 2] 3092 	ldw (TOWRITE,sp),x
      00A1D4 97 20            [ 1] 3093 	clr (COUNT,sp)
                                   3094 ; first bock 
                                   3095 ; containt signature 2 bytes 
                                   3096 ; and size 	2 bytes 
                                   3097 ; use Y as pointer to block_buffer
      00A1D6 CD 27 2C         [ 4] 3098 	call clear_block_buffer ; -- y=*block_buffer	
                                   3099 ; write signature
      00A1D6 90 F6 93         [ 2] 3100 	ldw x,SIGNATURE ; "BC" 
      00A1D9 EE 01            [ 2] 3101 	ldw (y),x 
      00A1DB 72 A9 00 03      [ 2] 3102 	addw y,#2
      00A1DF 9F A4            [ 2] 3103 	ldw x,(TOWRITE,sp)
      00A1E1 07 88            [ 2] 3104 	ldw (y),x
      00A1E3 A6 01 0D 01      [ 2] 3105 	addw y,#2   
      00A1E7 27 05            [ 1] 3106 	ld a,#(BLOCK_SIZE-4)
      00A1E9 48 0A            [ 1] 3107 	ld (CNT_LO,sp),a 
      00A1EB 01 20 F7         [ 2] 3108 	cpw x,#(BLOCK_SIZE-4) 
      00A1EE 6B 01            [ 1] 3109 	jrugt 3$
      00A1F0 90               [ 1] 3110 	ld a,xl 
      00A1F1 F6 93            [ 1] 3111 3$:	ld (CNT_LO,sp),a   
      00A1F3 EE 01 72         [ 2] 3112 	ldw x,txtbgn 
      00A1F6 A9 00            [ 2] 3113 	ldw (XTEMP,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00279D                       3114 32$: 
      00A1F8 03 84            [ 2] 3115 	ldw x,(XTEMP,sp)
      00A1FA F4 27            [ 1] 3116 	ld a,(CNT_LO,sp)
      00A1FC 02 A6 01         [ 4] 3117 	call fill_write_buffer 
      00A1FF 5F 97            [ 2] 3118 	ldw (XTEMP,sp),x 
      00A201 4F 81 B8         [ 2] 3119 	ldw x,#block_buffer
      00A203 CD 07 9C         [ 4] 3120 	call write_buffer
      00A203 CD 99 E1         [ 2] 3121 	ldw x,#BLOCK_SIZE 
      00A206 A1 02 27         [ 4] 3122 	call incr_farptr  
                                   3123 ; following blocks 
      00A209 03 CC            [ 2] 3124 	ldw x,(XTEMP,sp)
      00A20B 97 20 1D         [ 2] 3125 	cpw x,txtend 
      00A20D 24 16            [ 1] 3126 	jruge 9$ 
      00A20D 90 F6            [ 2] 3127 	ldw x,(TOWRITE,sp)
      00A20F 93 EE 01         [ 2] 3128 	subw x,(COUNT,sp)
      00A212 72 A9            [ 2] 3129 	ldw (TOWRITE,sp),x 
      00A214 00 03            [ 1] 3130 	ld a,#BLOCK_SIZE 
      00A216 9F 88 90         [ 2] 3131 	cpw x,#BLOCK_SIZE 
      00A219 F6 93            [ 1] 3132 	jruge 4$ 
      00A21B EE               [ 1] 3133 	ld a,xl 
      00A21C 01 72            [ 1] 3134 4$:	ld (CNT_LO,sp),a 
      00A21E A9 00 03         [ 4] 3135 	call clear_block_buffer 
      00A221 84 F7            [ 2] 3136 	jra 32$ 
      0027CF                       3137 9$:	_drop VSIZE 
      00A223 81 06            [ 2]    1     addw sp,#VSIZE 
      00A224 90 85            [ 2] 3138     popw y 
      00A224 CD               [ 2] 3139 	popw x 
      00A225 99               [ 4] 3140 	ret 
                                   3141 
                                   3142 
      00A226 DC A1                 3143 SIGNATURE: .ascii "BC"
      00A228 01 27 03 CC 97 20 90  3144 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             F6 93 EE 01 72 A9 00
             03 C7 00 19 CF 00 1A
             92 BC 00 19 5F 97 4F
             81 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A245 4E 6F 20 61 70 70 6C  3145 NO_APP: .asciz "No application in RAM"
             69 63 61 74 69 6F 6E
             20 69 6E 20 52 41 4D
             00
                                   3146 
                                   3147 ;---------------------
                                   3148 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   3149 ; write 1 or more byte to FLASH or EEPROM
                                   3150 ; starting at address  
                                   3151 ; input:
                                   3152 ;   expr1  	is address 
                                   3153 ;   expr2,...,exprn   are bytes to write
                                   3154 ; output:
                                   3155 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3156 ;---------------------
      00282F                       3157 write:
      00A245 CD 9B 8A         [ 4] 3158 	call expression
      00A248 4D 26            [ 1] 3159 	cp a,#TK_INTGR 
      00A24A 0A 55            [ 1] 3160 	jreq 0$
      00A24C 00 04 00         [ 2] 3161 	jp syntax_error
      002839                       3162 0$: _xpop 
      00A24F 02 5B            [ 1]    1     ld a,(y)
      00A251 02               [ 1]    2     ldw x,y 
      00A252 CC 97            [ 2]    3     ldw x,(1,x)
      00A254 D3 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A256 C7 00 18         [ 1] 3163 	ld farptr,a 
      00A256 85 52 0D         [ 2] 3164 	ldw ptr16,x 
      002848                       3165 1$:	
      00A259 89 A6 85         [ 4] 3166 	call next_token 
      00A25C CD 99            [ 1] 3167 	cp a,#TK_COMMA 
      00A25E CF CD            [ 1] 3168 	jreq 2$ 
      00A260 98 56            [ 2] 3169 	jra 9$ ; no more data 
      00A262 1F 09 CD         [ 4] 3170 2$:	call expression
      00A265 9C 83            [ 1] 3171 	cp a,#TK_INTGR
      00A267 72 14            [ 1] 3172 	jreq 3$
      00A269 00 23 CD         [ 2] 3173 	jp syntax_error
      00285B                       3174 3$:	_xpop 
      00A26C 98 21            [ 1]    1     ld a,(y)
      00A26E A1               [ 1]    2     ldw x,y 
      00A26F 80 27            [ 2]    3     ldw x,(1,x)
      00A271 03 CC 97 20      [ 2]    4     addw y,#CELL_SIZE 
      00A275 9F               [ 1] 3175 	ld a,xl 
      00A275 CD               [ 1] 3176 	clrw x 
      00A276 98 3A A3         [ 4] 3177 	call write_byte
      00A279 A2 80 27         [ 2] 3178 	ldw x,#1 
      00A27C 03 CC 97         [ 4] 3179 	call incr_farptr 
      00A27F 20 D7            [ 2] 3180 	jra 1$ 
      00A280                       3181 9$:
      00A280 72               [ 4] 3182 	ret 
                                   3183 
                                   3184 
                                   3185 ;---------------------
                                   3186 ;BASIC: CHAR(expr)
                                   3187 ; évaluate expression 
                                   3188 ; and take the 7 least 
                                   3189 ; bits as ASCII character
                                   3190 ; output: 
                                   3191 ; 	A char 
                                   3192 ;---------------------
      002872                       3193 char:
      00A281 04 00 23         [ 4] 3194 	call func_args 
      00A284 03 CC            [ 1] 3195 	cp a,#1
      00A286 97 20            [ 1] 3196 	jreq 1$
      00A288 CD 9B 01         [ 2] 3197 	jp syntax_error
      00287C                       3198 1$:	_xpop
      00A28B A1 84            [ 1]    1     ld a,(y)
      00A28D 27               [ 1]    2     ldw x,y 
      00A28E 03 CC            [ 2]    3     ldw x,(1,x)
      00A290 97 20 90 F6      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A294 93               [ 1] 3199 	ld a,xl
      00A295 EE 01            [ 1] 3200 	and a,#0x7f 
      00A297 72               [ 4] 3201 	ret
                                   3202 
                                   3203 ;---------------------
                                   3204 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3205 ; extract first character 
                                   3206 ; of string argument 
                                   3207 ; output:
                                   3208 ;    A:X    int24 
                                   3209 ;---------------------
      002889                       3210 ascii:
      00A298 A9 00            [ 1] 3211 	ld a,#TK_LPAREN
      00A29A 03 6B 06         [ 4] 3212 	call expect 
      00A29D 1F 07 CD         [ 4] 3213 	call next_token 
      00A2A0 98 21            [ 1] 3214 	cp a,#TK_QSTR 
      00A2A2 A1 00            [ 1] 3215 	jreq 1$
      00A2A4 27 11            [ 1] 3216 	cp a,#TK_CHAR 
      00A2A6 A1 80            [ 1] 3217 	jreq 2$ 
      00A2A8 26 08            [ 1] 3218 	cp a,#TK_CFUNC 
      00A2AA CD 98            [ 1] 3219 	jreq 0$
      00A2AC 3A A3 A2         [ 2] 3220 	jp syntax_error
      0028A0                       3221 0$: ; cfunc 
      00A2AF C0               [ 4] 3222 	call (x)
      00A2B0 27 0E            [ 2] 3223 	jra 3$
      00A2B2                       3224 1$: ; quoted string 
      00A2B2 55               [ 1] 3225 	ld a,(x)
      00A2B3 00               [ 1] 3226 	push a  
      00A2B4 03 00 02         [ 4] 3227 	call skip_string
      00A2B7 84               [ 1] 3228 	pop a  	
      00A2B7 0F 03            [ 2] 3229 	jra 3$ 
      0028AB                       3230 2$: ; character 
      00A2B9 AE 00 01         [ 4] 3231 	call get_char 
      00A2BC 1F               [ 1] 3232 3$:	clrw x 
      00A2BD 04               [ 1] 3233 	rlwa x   
      0028B0                       3234 4$:	_xpush  
      00A2BE 20 2F 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A2C0 90 F7            [ 1]    2     ld (y),a 
      00A2C0 72 04 00         [ 2]    3     ldw (1,y),x 
      00A2C3 23 03            [ 1] 3235 	ld a,#TK_RPAREN 
      00A2C5 CC 97 20         [ 4] 3236 	call expect
      0028BE                       3237 9$:	
      0028BE                       3238 	_xpop  
      00A2C8 CD 9B            [ 1]    1     ld a,(y)
      00A2CA 01               [ 1]    2     ldw x,y 
      00A2CB A1 84            [ 2]    3     ldw x,(1,x)
      00A2CD 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A2D1 20               [ 4] 3239 	ret 
                                   3240 
                                   3241 ;---------------------
                                   3242 ;BASIC: KEY
                                   3243 ; wait for a character 
                                   3244 ; received from STDIN 
                                   3245 ; input:
                                   3246 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3247 ; output:
                                   3248 ;	a	 character 
                                   3249 ;---------------------
      00A2D2                       3250 key:
      00A2D2 90 F6 93         [ 4] 3251 	call getc 
      00A2D5 EE               [ 4] 3252 	ret
                                   3253 
                                   3254 ;----------------------
                                   3255 ; BASIC: QKEY
                                   3256 ; Return true if there 
                                   3257 ; is a character in 
                                   3258 ; waiting in STDIN 
                                   3259 ; input:
                                   3260 ;  none 
                                   3261 ; output:
                                   3262 ;   A     0|-1
                                   3263 ;-----------------------
      0028CC                       3264 qkey:: 
      00A2D6 01               [ 1] 3265 	clrw x 
      00A2D7 72 A9 00         [ 1] 3266 	ld a,rx1_head
      00A2DA 03 6B 03         [ 1] 3267 	sub a,rx1_tail 
      00A2DD 1F 04            [ 1] 3268 	jreq 9$ 
      00A2DF 4D               [ 2] 3269 	cplw x
      00A2E0 2A 0D            [ 1] 3270 	ld a,#255    
      0028D8                       3271 9$: 
      00A2E2 7B               [ 4] 3272 	ret 
                                   3273 
                                   3274 ;---------------------
                                   3275 ; BASIC: GPIO(port,reg)
                                   3276 ; return gpio register address 
                                   3277 ; expr {PORTA..PORTI}
                                   3278 ; input:
                                   3279 ;   none 
                                   3280 ; output:
                                   3281 ;   A:X 	gpio register address
                                   3282 ;----------------------------
                                   3283 ;	N=PORT
                                   3284 ;	T=REG 
      0028D9                       3285 gpio:
      00A2E3 06 1E 07         [ 4] 3286 	call func_args 
      00A2E6 1D 00            [ 1] 3287 	cp a,#2
      00A2E8 01 A2            [ 1] 3288 	jreq 1$
      00A2EA 00 6B 06         [ 2] 3289 	jp syntax_error  
      0028E3                       3290 1$:	_at_next 
      00A2ED 1F 07 03         [ 1]    1     ld a,(3,y)
      00A2EF 93               [ 1]    2     ldw x,y 
      00A2EF CE 00            [ 2]    3     ldw x,(4,x)
      00A2F1 05 1F 0D         [ 2] 3291 	cpw x,#PA_BASE 
      00A2F4 CE 00            [ 1] 3292 	jrmi bad_port
      00A2F6 01 1F 0B         [ 2] 3293 	cpw x,#PI_BASE+1 
      00A2F9 72 15            [ 1] 3294 	jrpl bad_port
      00A2FB 00               [ 2] 3295 	pushw x 
      0028F4                       3296 	_xpop
      00A2FC 23 72            [ 1]    1     ld a,(y)
      00A2FE 5C               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A2FF 00 20            [ 2]    3     ldw x,(1,x)
      00A301 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A302 72 FB 01         [ 2] 3297 	addw x,(1,sp)
      002900                       3298 	_drop 2 
      00A302 72 5D            [ 2]    1     addw sp,#2 
      00A304 00               [ 1] 3299 	clr a 
      00A305 20               [ 4] 3300 	ret
      002904                       3301 bad_port:
      00A306 26 03            [ 1] 3302 	ld a,#ERR_BAD_VALUE
      00A308 CC 97 20         [ 2] 3303 	jp tb_error
                                   3304 
                                   3305 
                                   3306 ;-------------------------
                                   3307 ; BASIC: UFLASH 
                                   3308 ; return free flash address
                                   3309 ; input:
                                   3310 ;  none 
                                   3311 ; output:
                                   3312 ;	A		TK_INTGR
                                   3313 ;   xstack	free address 
                                   3314 ;---------------------------
      00A30B                       3315 uflash:
      00A30B A6 85 CD         [ 2] 3316 	ldw x,app_sign
      00A30E 99 CF CD         [ 2] 3317 	cpw x,#4243 ; signature "BC" 
      00A311 98 56            [ 1] 3318 	jreq 1$
      00A313 13 09 27         [ 2] 3319 	ldw x,app_size 
      00A316 03 CC 97         [ 2] 3320 	addw x,#app
      00A319 20 03            [ 2] 3321 	jra 2$
      00A31A AE 36 00         [ 2] 3322 1$:	ldw x,#app_space 
      00A31A CF               [ 1] 3323 2$:	clr a 
      00A31B 00               [ 4] 3324 	ret 
                                   3325 
                                   3326 
                                   3327 ;---------------------
                                   3328 ; BASIC: USR(addr[,arg])
                                   3329 ; execute a function written 
                                   3330 ; in binary code.
                                   3331 ; binary fonction should 
                                   3332 ; return token attribute in A 
                                   3333 ; and value in YL:X. 
                                   3334 ; input:
                                   3335 ;   addr	routine address 
                                   3336 ;   arg 	is an optional argument 
                                   3337 ; output:
                                   3338 ;   A 		token attribute 
                                   3339 ;   xstack  returned value 
                                   3340 ;---------------------
      00291E                       3341 usr:
      00A31C 1A               [ 2] 3342 	pushw x 
      00A31D F6 EE            [ 2] 3343 	pushw y 	
      00A31F 01 72 FB         [ 4] 3344 	call func_args 
      00A322 04 19            [ 1] 3345 	cp a,#1 
      00A324 03 72            [ 1] 3346 	jreq 1$
      00A326 C7 00            [ 1] 3347 	cp a,#2
      00A328 1A 72            [ 1] 3348 	jreq 1$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



      00A32A 5C 00 1B         [ 2] 3349 	jp syntax_error 
      00A32D 72               [ 1] 3350 1$: push a 
      002930                       3351 	_xpop 
      00A32E CF 00            [ 1]    1     ld a,(y)
      00A330 1A               [ 1]    2     ldw x,y 
      00A331 C7 00            [ 2]    3     ldw x,(1,x)
      00A333 0D CF 00 0E      [ 2]    4     addw y,#CELL_SIZE 
      00A337 7B 06            [ 1] 3352 	ldw y,x  ; arg|addr 
      00A339 1E               [ 1] 3353     pop a 
      00A33A 07 72            [ 1] 3354 	cp a,#1 
      00A33C B0 00            [ 1] 3355 	jreq 3$
      002940                       3356 	_xpop  ; x=code addr  
      00A33E 0E C2            [ 1]    1     ld a,(y)
      00A340 00               [ 1]    2     ldw x,y 
      00A341 0D 18            [ 2]    3     ldw x,(1,x)
      00A343 03 A8 80 2B      [ 2]    4     addw y,#CELL_SIZE 
      00A347 12               [ 1] 3357 	exgw x,y ; y=code addr, x=arg 
      00A348 20 25            [ 4] 3358 3$: call (y)
      00A34A 7B               [ 1] 3359 	push a 
      00A34B 03 2A            [ 1] 3360 	ld a,yl  
      00294F                       3361 	_xpush 
      00A34D 07 C6 00 0F      [ 2]    1     subw y,#CELL_SIZE
      00A351 2F 07            [ 1]    2     ld (y),a 
      00A353 20 1A 01         [ 2]    3     ldw (1,y),x 
      00A355 84               [ 1] 3362 	pop a 
      00A355 72 0E            [ 2] 3363 	popw y 
      00A357 00               [ 2] 3364 	popw x 
      00A358 0F               [ 4] 3365 	ret 
                                   3366 
                                   3367 
                                   3368 ;------------------------------
                                   3369 ; BASIC: BYE 
                                   3370 ; halt mcu in its lowest power mode 
                                   3371 ; wait for reset or external interrupt
                                   3372 ; do a cold start on wakeup.
                                   3373 ;------------------------------
      00295D                       3374 bye:
      00A359 15 0D 52 30 FB   [ 2] 3375 	btjf UART1_SR,#UART_SR_TC,.
      00A35A 8E               [10] 3376 	halt
      00A35A 1E 0D CF         [ 2] 3377 	jp cold_start  
                                   3378 
                                   3379 ;----------------------------------
                                   3380 ; BASIC: SLEEP 
                                   3381 ; halt mcu until reset or external
                                   3382 ; interrupt.
                                   3383 ; Resume progam after SLEEP command
                                   3384 ;----------------------------------
      002966                       3385 sleep:
      00A35D 00 05 72 01 00   [ 2] 3386 	btjf UART1_SR,#UART_SR_TC,.
      00A362 23 05 E6 02      [ 1] 3387 	bset flags,#FSLEEP
      00A366 C7               [10] 3388 	halt 
      00A367 00               [ 4] 3389 	ret 
                                   3390 
                                   3391 ;-------------------------------
                                   3392 ; BASIC: PAUSE expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



                                   3393 ; suspend execution for n msec.
                                   3394 ; input:
                                   3395 ;	none
                                   3396 ; output:
                                   3397 ;	none 
                                   3398 ;------------------------------
      002971                       3399 pause:
      00A368 04 1E 0B         [ 4] 3400 	call expression
      00A36B CF 00            [ 1] 3401 	cp a,#TK_INTGR
      00A36D 01 81            [ 1] 3402 	jreq 1$ 
      00A36F CC 16 A0         [ 2] 3403 	jp syntax_error
      00297B                       3404 1$: _xpop 
      00A36F 85 5B            [ 1]    1     ld a,(y)
      00A371 0D               [ 1]    2     ldw x,y 
      00A372 72 5A            [ 2]    3     ldw x,(1,x)
      00A374 00 20 FC 03      [ 2]    4     addw y,#CELL_SIZE 
      00A377                       3405 pause02:
      00A377 CD 98 21         [ 2] 3406 	ldw timer,x 
      00A37A A1 84 27         [ 2] 3407 1$: ldw x,timer 
      00A37D 07               [ 2] 3408 	tnzw x 
      00A37E A1 03            [ 1] 3409 	jreq 2$
      00A380 27               [10] 3410 	wfi 
      00A381 26 CC            [ 1] 3411 	jrne 1$
      00A383 97               [ 1] 3412 2$:	clr a 
      00A384 20               [ 4] 3413 	ret 
                                   3414 
                                   3415 ;------------------------------
                                   3416 ; BASIC: AWU expr
                                   3417 ; halt mcu for 'expr' milliseconds
                                   3418 ; use Auto wakeup peripheral
                                   3419 ; all oscillators stopped except LSI
                                   3420 ; range: 1ms - 511ms
                                   3421 ; input:
                                   3422 ;  none
                                   3423 ; output:
                                   3424 ;  none:
                                   3425 ;------------------------------
      00A385                       3426 awu:
      00A385 90 89 CD         [ 4] 3427   call expression
      00A388 98 60            [ 1] 3428   cp a,#TK_INTGR
      00A38A 4F 90            [ 1] 3429   jreq 1$
      00A38C CE 00 05         [ 2] 3430   jp syntax_error
      00299C                       3431 1$: _xpop 
      00A38F 90 FE            [ 1]    1     ld a,(y)
      00A391 90               [ 1]    2     ldw x,y 
      00A392 89 13            [ 2]    3     ldw x,(1,x)
      00A394 01 5B 02 25      [ 2]    4     addw y,#CELL_SIZE 
      0029A5                       3432 awu02:
      00A398 01 4C 00         [ 2] 3433   cpw x,#5120
      00A39A 2B 0C            [ 1] 3434   jrmi 1$ 
      00A39A CD 8D 09 5D      [ 1] 3435   mov AWU_TBR,#15 
      00A39E 26 05            [ 1] 3436   ld a,#30
      00A3A0 A6               [ 2] 3437   div x,a
      00A3A1 05 CC            [ 1] 3438   ld a,#16
      00A3A3 97               [ 2] 3439   div x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A3A4 22 90            [ 2] 3440   jra 4$
      0029B6                       3441 1$: 
      00A3A6 85 81 00         [ 2] 3442   cpw x,#2048
      00A3A8 2B 09            [ 1] 3443   jrmi 2$ 
      00A3A8 90 89 89 72      [ 1] 3444   mov AWU_TBR,#14
      00A3AC 5F 00            [ 1] 3445   ld a,#80
      00A3AE 0E               [ 2] 3446   div x,a 
      00A3AF 90 CE            [ 2] 3447   jra 4$   
      0029C4                       3448 2$:
      00A3B1 00 1C 90 E6      [ 1] 3449   mov AWU_TBR,#7
      0029C8                       3450 3$:  
                                   3451 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A3B5 03 A1 03         [ 2] 3452   cpw x,#64 
      00A3B8 27 15            [ 2] 3453   jrule 4$ 
      00A3BA 90 E6 02 C7      [ 1] 3454   inc AWU_TBR 
      00A3BE 00               [ 2] 3455   srlw x 
      00A3BF 0F 72            [ 2] 3456   jra 3$ 
      0029D4                       3457 4$:
      00A3C1 B9               [ 1] 3458   ld a, xl
      00A3C2 00               [ 1] 3459   dec a 
      00A3C3 0E 90            [ 1] 3460   jreq 5$
      00A3C5 C3               [ 1] 3461   dec a 	
      0029D9                       3462 5$: 
      00A3C6 00 1E            [ 1] 3463   and a,#0x3e 
      00A3C8 25 E9 A6         [ 1] 3464   ld AWU_APR,a 
      00A3CB 0A CC 97 22      [ 1] 3465   bset AWU_CSR,#AWU_CSR_AWUEN
      00A3CF 8E               [10] 3466   halt 
                                   3467 
      00A3CF 90               [ 4] 3468   ret 
                                   3469 
                                   3470 ;------------------------------
                                   3471 ; BASIC: TICKS
                                   3472 ; return msec ticks counter value 
                                   3473 ; input:
                                   3474 ; 	none 
                                   3475 ; output:
                                   3476 ;	X 		TK_INTGR
                                   3477 ;-------------------------------
      0029E4                       3478 get_ticks:
      00A3D0 89 72 A9         [ 1] 3479 	ld a,ticks 
      00A3D3 00 04 1E         [ 2] 3480 	ldw x,ticks+1 
      00A3D6 03               [ 4] 3481 	ret 
                                   3482 
                                   3483 ;------------------------------
                                   3484 ; BASIC: ABS(expr)
                                   3485 ; return absolute value of expr.
                                   3486 ; input:
                                   3487 ;   none
                                   3488 ; output:
                                   3489 ;   xstack    positive int24 
                                   3490 ;-------------------------------
      0029EB                       3491 abs:
      00A3D7 CD 94 6F         [ 4] 3492 	call func_args 
      00A3DA 26 04            [ 1] 3493 	cp a,#1 
      00A3DC 90 85            [ 1] 3494 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A3DE 20 DA A0         [ 2] 3495 	jp syntax_error
      00A3E0                       3496 0$:  
      00A3E0 85 5B 02         [ 4] 3497 	call abs24 
      0029F8                       3498 	_xpop 
      00A3E3 90 85            [ 1]    1     ld a,(y)
      00A3E5 81               [ 1]    2     ldw x,y 
      00A3E6 EE 01            [ 2]    3     ldw x,(1,x)
      00A3E6 72 00 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A3EA 05               [ 4] 3499 	ret 
                                   3500 
                                   3501 ;------------------------------
                                   3502 ; BASIC: AND(expr1,expr2)
                                   3503 ; Apply bit AND relation between
                                   3504 ; the 2 arguments, i.e expr1 & expr2 
                                   3505 ; output:
                                   3506 ; 	A 		TK_INTGR
                                   3507 ;   X 		result 
                                   3508 ;------------------------------
      002A02                       3509 bit_and: ; i1 i2 -- i1 & i2 
      00A3EB A6 06 CC         [ 4] 3510 	call func_args 
      00A3EE 97 22            [ 1] 3511 	cp a,#2
      00A3F0 CD 9B            [ 1] 3512 	jreq 1$
      00A3F2 01 A1 84         [ 2] 3513 	jp syntax_error 
      002A0C                       3514 1$:	_xpop 
      00A3F5 27 03            [ 1]    1     ld a,(y)
      00A3F7 CC               [ 1]    2     ldw x,y 
      00A3F8 97 20            [ 2]    3     ldw x,(1,x)
      00A3FA 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      00A3FE 01               [ 2] 3515     pushw x 
      00A3FF 72               [ 1] 3516 	push  a 
      002A17                       3517 	_at_top 
      00A400 A9 00            [ 1]    1     ld a,(y)
      00A402 03               [ 1]    2     ldw x,y 
      00A403 9F 27            [ 2]    3     ldw x,(1,x)
      00A405 62 88            [ 1] 3518 	and a,(1,sp)
      00A407 CD               [ 1] 3519 	rlwa x 
      00A408 98 21            [ 1] 3520 	and a,(2,sp)
      00A40A A1               [ 1] 3521 	rlwa x 
      00A40B 80 27            [ 1] 3522 	and a,(3,sp)
      00A40D 03               [ 1] 3523 	rlwa x 
      002A25                       3524 	_drop 3 
      00A40E CC 97            [ 2]    1     addw sp,#3 
      002A27                       3525 	_store_top 
      00A410 20 CD            [ 1]    1     ld (y),a 
      00A412 98 3A A3         [ 2]    2     ldw (1,y),x     
      00A415 A4 72            [ 1] 3526 	ld a,#TK_INTGR
      00A417 27               [ 4] 3527 	ret
                                   3528 
                                   3529 ;------------------------------
                                   3530 ; BASIC: OR(expr1,expr2)
                                   3531 ; Apply bit OR relation between
                                   3532 ; the 2 arguments, i.e expr1 | expr2 
                                   3533 ; output:
                                   3534 ; 	A 		TK_INTGR
                                   3535 ;   X 		result 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3536 ;------------------------------
      002A2F                       3537 bit_or:
      00A418 08 A3 A4         [ 4] 3538 	call func_args 
      00A41B 8C 27            [ 1] 3539 	cp a,#2
      00A41D 03 CC            [ 1] 3540 	jreq 1$
      00A41F 97 20 A0         [ 2] 3541 	jp syntax_error 
      00A421                       3542 1$:	_xpop 
      00A421 84 89            [ 1]    1     ld a,(y)
      00A423 88               [ 1]    2     ldw x,y 
      00A424 EE 01            [ 2]    3     ldw x,(1,x)
      00A424 0A 01 27 26      [ 2]    4     addw y,#CELL_SIZE 
      00A428 CD               [ 2] 3543     pushw x 
      00A429 98               [ 1] 3544 	push  a 
      002A44                       3545 	_at_top 
      00A42A 21 A1            [ 1]    1     ld a,(y)
      00A42C 84               [ 1]    2     ldw x,y 
      00A42D 27 07            [ 2]    3     ldw x,(1,x)
      00A42F A1 03            [ 1] 3546 	or a,(1,sp)
      00A431 27 0D            [ 1] 3547 	ld yl,a 
      00A433 CC               [ 1] 3548 	ld a,xh 
      00A434 97 20            [ 1] 3549 	or a,(2,sp)
      00A436 95               [ 1] 3550 	ld xh,a 
      00A436 C6               [ 1] 3551 	ld a,xl 
      00A437 00 02            [ 1] 3552 	or a,(3,sp)
      00A439 AB               [ 1] 3553 	ld xl,a 
      00A43A 03 C7            [ 1] 3554 	ld a,yl 
      002A57                       3555 	_drop 3 
      00A43C 00 02            [ 2]    1     addw sp,#3 
      002A59                       3556 	_store_top 
      00A43E 20 03            [ 1]    1     ld (y),a 
      00A440 CD 98 47         [ 2]    2     ldw (1,y),x     
      00A443 A6 84            [ 1] 3557 	ld a,#TK_INTGR
      00A443 CD               [ 4] 3558 	ret
                                   3559 
                                   3560 ;------------------------------
                                   3561 ; BASIC: XOR(expr1,expr2)
                                   3562 ; Apply bit XOR relation between
                                   3563 ; the 2 arguments, i.e expr1 ^ expr2 
                                   3564 ; output:
                                   3565 ; 	A 		TK_INTGR
                                   3566 ;   X 		result 
                                   3567 ;------------------------------
      002A61                       3568 bit_xor:
      00A444 98 21 A1         [ 4] 3569 	call func_args 
      00A447 08 27            [ 1] 3570 	cp a,#2
      00A449 DA 5B            [ 1] 3571 	jreq 1$
      00A44B 03 20 1A         [ 2] 3572 	jp syntax_error 
      00A44E                       3573 1$:	_xpop 
      00A44E 5B 01            [ 1]    1     ld a,(y)
      00A450 CD               [ 1]    2     ldw x,y 
      00A451 A3 77            [ 2]    3     ldw x,(1,x)
      00A453 CF 00 1A 55      [ 2]    4     addw y,#CELL_SIZE 
      00A457 00               [ 2] 3574     pushw x 
      00A458 04               [ 1] 3575 	push  a 
      002A76                       3576 	_at_top 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A459 00 02            [ 1]    1     ld a,(y)
      00A45B 85               [ 1]    2     ldw x,y 
      00A45C A3 A4            [ 2]    3     ldw x,(1,x)
      00A45E 72 26            [ 1] 3577 	xor a,(1,sp)
      00A460 05 CE            [ 1] 3578 	ld yl,a 
      00A462 00               [ 1] 3579 	ld a,xh 
      00A463 1A 20            [ 1] 3580 	xor a,(2,sp)
      00A465 19               [ 1] 3581 	ld xh,a 
      00A466 9F               [ 1] 3582 	ld a,xl 
      00A466 20 35            [ 1] 3583 	xor a,(3,sp)
      00A468 97               [ 1] 3584 	ld xl,a 
      00A468 55 00            [ 1] 3585 	ld a,yl 
      002A89                       3586 	_drop 3 
      00A46A 04 00            [ 2]    1     addw sp,#3 
      002A8B                       3587 	_store_top 
      00A46C 02 5B            [ 1]    1     ld (y),a 
      00A46E 02 CC 97         [ 2]    2     ldw (1,y),x     
      00A471 D3 84            [ 1] 3588 	ld a,#TK_INTGR
      00A472 81               [ 4] 3589 	ret
                                   3590 
                                   3591 ;------------------------------
                                   3592 ; BASIC: LSHIFT(expr1,expr2)
                                   3593 ; logical shift left expr1 by 
                                   3594 ; expr2 bits 
                                   3595 ; output:
                                   3596 ; 	A 		TK_INTGR
                                   3597 ;   X 		result 
                                   3598 ;------------------------------
      002A93                       3599 lshift:
      00A472 72 00 00         [ 4] 3600 	call func_args
      00A475 23 05            [ 1] 3601 	cp a,#2 
      00A477 A6 06            [ 1] 3602 	jreq 1$
      00A479 CC 97 22         [ 2] 3603 	jp syntax_error
      00A47C                       3604 1$: _xpop 
      00A47C CD A3            [ 1]    1     ld a,(y)
      00A47E 77               [ 1]    2     ldw x,y 
      00A47F EE 01            [ 2]    3     ldw x,(1,x)
      00A47F CF 00 05 E6      [ 2]    4     addw y,#CELL_SIZE 
      00A483 02 C7            [ 1] 3605     ldw y,x    
      002AA8                       3606 	_at_top  ; T@ 
      00A485 00 04            [ 1]    1     ld a,(y)
      00A487 35               [ 1]    2     ldw x,y 
      00A488 03 00            [ 2]    3     ldw x,(1,x)
      00A48A 02 81            [ 2] 3607 	tnzw y 
      00A48C 27 07            [ 1] 3608 	jreq 4$
      00A48C 72               [ 1] 3609 2$:	rcf 
      00A48D 00               [ 2] 3610 	rlcw x 
      00A48E 00               [ 1] 3611 	rlc a 
      00A48F 23 06            [ 2] 3612 	decw y 
      00A491 A6 06            [ 1] 3613 	jrne 2$
      002AB8                       3614 4$: _store_top  ; T! 
      00A493 CC 97            [ 1]    1     ld (y),a 
      00A495 22 81 01         [ 2]    2     ldw (1,y),x     
      00A497 A6 84            [ 1] 3615 	ld a,#TK_INTGR
      00A497 CD               [ 4] 3616 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3617 
                                   3618 ;------------------------------
                                   3619 ; BASIC: RSHIFT(expr1,expr2)
                                   3620 ; logical shift right expr1 by 
                                   3621 ; expr2 bits.
                                   3622 ; output:
                                   3623 ; 	A 		TK_INTGR
                                   3624 ;   X 		result 
                                   3625 ;------------------------------
      002AC0                       3626 rshift:
      00A498 A3 77 CF         [ 4] 3627 	call func_args
      00A49B 00 1A            [ 1] 3628 	cp a,#2 
      00A49D 27 03            [ 1] 3629 	jreq 1$
      00A49D 85 52 04         [ 2] 3630 	jp syntax_error
      002ACA                       3631 1$: _xpop 
      00A4A0 89 CE            [ 1]    1     ld a,(y)
      00A4A2 00               [ 1]    2     ldw x,y 
      00A4A3 1A 89            [ 2]    3     ldw x,(1,x)
      00A4A5 CE 00 05 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A4A9 05 CE            [ 1] 3632     ldw y,x   
      002AD5                       3633 	_at_top  ; T@  
      00A4AB 00 01            [ 1]    1     ld a,(y)
      00A4AD 1F               [ 1]    2     ldw x,y 
      00A4AE 07 85            [ 2]    3     ldw x,(1,x)
      00A4B0 20 CD            [ 2] 3634 	tnzw y 
      00A4B2 27 07            [ 1] 3635 	jreq 4$
      00A4B2 72               [ 1] 3636 2$:	rcf 
      00A4B3 00               [ 2] 3637 	rrcw x
      00A4B4 00               [ 1] 3638 	rrc a  
      00A4B5 23 05            [ 2] 3639 	decw y 
      00A4B7 A6 06            [ 1] 3640 	jrne 2$
      002AE5                       3641 4$: _store_top  ; T! 
      00A4B9 CC 97            [ 1]    1     ld (y),a 
      00A4BB 22 EF 01         [ 2]    2     ldw (1,y),x     
      00A4BC A6 84            [ 1] 3642 	ld a,#TK_INTGR
      00A4BC 1E               [ 4] 3643 	ret
                                   3644 
                                   3645 ;--------------------------
                                   3646 ; BASIC: FCPU integer
                                   3647 ; set CPU frequency 
                                   3648 ;-------------------------- 
                                   3649 
      002AED                       3650 fcpu:
      00A4BD 03 CF            [ 1] 3651 	ld a,#TK_INTGR
      00A4BF 00 05 E6         [ 4] 3652 	call expect 
      00A4C2 02 C7 00         [ 4] 3653 	call get_int24 
      00A4C5 04               [ 1] 3654 	ld a,xl 
      00A4C6 1E 05            [ 1] 3655 	and a,#7 
      00A4C8 CF 00 01         [ 1] 3656 	ld CLK_CKDIVR,a 
      00A4CB 85               [ 4] 3657 	ret 
                                   3658 
                                   3659 ;------------------------------
                                   3660 ; BASIC: PMODE pin#, mode 
                                   3661 ; Arduino pin. 
                                   3662 ; define pin as input or output
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3663 ; pin#: {0..15}
                                   3664 ; mode: INPUT|OUTPUT  
                                   3665 ;------------------------------
                           000001  3666 	PINNO=1
                           000001  3667 	VSIZE=1
      002AFC                       3668 pin_mode:
      002AFC                       3669 	_vars VSIZE 
      00A4CC 5B 04            [ 2]    1     sub sp,#VSIZE 
      00A4CE 89 81 61         [ 4] 3670 	call arg_list 
      00A4D0 A1 02            [ 1] 3671 	cp a,#2 
      00A4D0 72 01            [ 1] 3672 	jreq 1$
      00A4D2 00 23 02         [ 2] 3673 	jp syntax_error 
      002B08                       3674 1$: _xpop 
      00A4D5 4F 81            [ 1]    1     ld a,(y)
      00A4D7 93               [ 1]    2     ldw x,y 
      00A4D7 72 09            [ 2]    3     ldw x,(1,x)
      00A4D9 00 23 12 5B      [ 2]    4     addw y,#CELL_SIZE 
      00A4DD 02 CD            [ 1] 3675 	ldw y,x ; mode 
      002B13                       3676 	_xpop ; Dx pin 
      00A4DF A0 75            [ 1]    1     ld a,(y)
      00A4E1 5B               [ 1]    2     ldw x,y 
      00A4E2 04 72            [ 2]    3     ldw x,(1,x)
      00A4E4 19 00 23 72      [ 2]    4     addw y,#CELL_SIZE 
      00A4E8 10 00 23         [ 4] 3677 	call select_pin 
      00A4EB CC 97            [ 1] 3678 	ld (PINNO,sp),a  
      00A4ED CB CE            [ 1] 3679 	ld a,#1 
      00A4EF 00 1C            [ 1] 3680 	tnz (PINNO,sp)
      00A4F1 C3 00            [ 1] 3681 	jreq 4$
      00A4F3 1E               [ 1] 3682 2$:	sll a 
      00A4F4 2B 0C            [ 1] 3683 	dec (PINNO,sp)
      00A4F6 AE 96            [ 1] 3684 	jrne 2$ 
      00A4F8 AF CD            [ 1] 3685 	ld (PINNO,sp),a
      00A4FA 8A 21            [ 1] 3686 	ld a,(PINNO,sp)
      00A4FC 55 00            [ 1] 3687 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4FE 04 00            [ 1] 3688 	ld (GPIO_CR1,x),a 
      00A500 02 81 00 01      [ 2] 3689 4$:	cpw y,#OUTP 
      00A502 27 10            [ 1] 3690 	jreq 6$
                                   3691 ; input mode
                                   3692 ; disable external interrupt 
      00A502 5B 02            [ 1] 3693 	ld a,(PINNO,sp)
      00A504 43               [ 1] 3694 	cpl a 
      00A504 CD 9C            [ 1] 3695 	and a,(GPIO_CR2,x)
      00A506 62 CD            [ 1] 3696 	ld (GPIO_CR2,x),a 
                                   3697 ;clear bit in DDR for input mode 
      00A508 94 D4            [ 1] 3698 	ld a,(PINNO,sp)
      00A50A 5F               [ 1] 3699 	cpl a 
      00A50B CF 00            [ 1] 3700 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A50D 07 72            [ 1] 3701 	ld (GPIO_DDR,x),a 
      00A50F 5F 00            [ 2] 3702 	jra 9$
      002B4A                       3703 6$: ;output mode  
      00A511 09 72            [ 1] 3704 	ld a,(PINNO,sp)
      00A513 5F 00            [ 1] 3705 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A515 0A CE            [ 1] 3706 	ld (GPIO_DDR,x),a 
      00A517 00 1C            [ 1] 3707 	ld a,(PINNO,sp)
      00A519 CF 00            [ 1] 3708 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A51B 05 E6            [ 1] 3709 	ld (GPIO_CR2,x),a 
      002B56                       3710 9$:	
      002B56                       3711 	_drop VSIZE 
      00A51D 02 C7            [ 2]    1     addw sp,#VSIZE 
      00A51F 00               [ 4] 3712 	ret
                                   3713 
                                   3714 ;------------------------
                                   3715 ; select Arduino pin 
                                   3716 ; input:
                                   3717 ;   X 	 {0..15} Arduino Dx 
                                   3718 ; output:
                                   3719 ;   A     stm8s208 pin 
                                   3720 ;   X     base address s208 GPIO port 
                                   3721 ;---------------------------
      002B59                       3722 select_pin:
      00A520 04               [ 2] 3723 	sllw x 
      00A521 35 03 00         [ 2] 3724 	addw x,#arduino_to_8s208 
      00A524 02               [ 2] 3725 	ldw x,(x)
      00A525 72               [ 1] 3726 	ld a,xl 
      00A526 10               [ 1] 3727 	push a 
      00A527 00               [ 1] 3728 	swapw x 
      00A528 23 CC            [ 1] 3729 	ld a,#5 
      00A52A 97               [ 4] 3730 	mul x,a 
      00A52B CB 50 00         [ 2] 3731 	addw x,#GPIO_BASE 
      00A52C 84               [ 1] 3732 	pop a 
      00A52C AE               [ 4] 3733 	ret 
                                   3734 ; translation from Arduino D0..D15 to stm8s208rb 
      002B69                       3735 arduino_to_8s208:
      00A52D 17 FF                 3736 .byte 3,6 ; D0 
      00A52F 94 CC                 3737 .byte 3,5 ; D1 
      00A531 97 AC                 3738 .byte 4,0 ; D2 
      00A533 02 01                 3739 .byte 2,1 ; D3
      00A533 CD 98                 3740 .byte 6,0 ; D4
      00A535 21 A1                 3741 .byte 2,2 ; D5
      00A537 85 27                 3742 .byte 2,3 ; D6
      00A539 03 CC                 3743 .byte 3,1 ; D7
      00A53B 97 20                 3744 .byte 3,3 ; D8
      00A53D CD 98                 3745 .byte 2,4 ; D9
      00A53F 56 CF                 3746 .byte 4,5 ; D10
      00A541 00 1A                 3747 .byte 2,6 ; D11
      00A543 CD 89                 3748 .byte 2,7 ; D12
      00A545 CD 27                 3749 .byte 2,5 ; D13
      00A547 03 CD                 3750 .byte 4,2 ; D14
      00A549 89 D4                 3751 .byte 4,1 ; D15
                                   3752 
                                   3753 
                                   3754 ;------------------------------
                                   3755 ; BASIC: RND(expr)
                                   3756 ; return random number 
                                   3757 ; between 1 and expr inclusive
                                   3758 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   3759 ; input:
                                   3760 ; 	none 
                                   3761 ; output:
                                   3762 ;	xstack 	random positive integer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



                                   3763 ;------------------------------
      002B89                       3764 random:
      00A54B 72 3F 00         [ 4] 3765 	call func_args 
      00A54E 1A 72            [ 1] 3766 	cp a,#1
      00A550 5C 00            [ 1] 3767 	jreq 1$
      00A552 1B 72 3F         [ 2] 3768 	jp syntax_error
      002B93                       3769 1$:  
      002B93                       3770 	_xpop   
      00A555 00 1A            [ 1]    1     ld a,(y)
      00A557 72               [ 1]    2     ldw x,y 
      00A558 5C 00            [ 2]    3     ldw x,(1,x)
      00A55A 1B 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A55E 1A               [ 2] 3771 	pushw x 
      00A55F 81               [ 1] 3772 	push a  
      00A560 A6 80            [ 1] 3773 	ld a,#0x80 
      00A560 AE 00            [ 1] 3774 	bcp a,(1,sp)
      00A562 64 90            [ 1] 3775 	jreq 2$
      00A564 AE 03            [ 1] 3776 	ld a,#ERR_BAD_VALUE
      00A566 E8 20 20         [ 2] 3777 	jp tb_error
      00A569                       3778 2$: 
                                   3779 ; acc16=(x<<5)^x 
      00A569 CD 99 E1         [ 2] 3780 	ldw x,seedx 
      00A56C A1               [ 2] 3781 	sllw x 
      00A56D 02               [ 2] 3782 	sllw x 
      00A56E 27               [ 2] 3783 	sllw x 
      00A56F 03               [ 2] 3784 	sllw x 
      00A570 CC               [ 2] 3785 	sllw x 
      00A571 97               [ 1] 3786 	ld a,xh 
      00A572 20 00 14         [ 1] 3787 	xor a,seedx 
      00A573 C7 00 0D         [ 1] 3788 	ld acc16,a 
      00A573 90               [ 1] 3789 	ld a,xl 
      00A574 F6 93 EE         [ 1] 3790 	xor a,seedx+1 
      00A577 01 72 A9         [ 1] 3791 	ld acc8,a 
                                   3792 ; seedx=seedy 
      00A57A 00 03 89         [ 2] 3793 	ldw x,seedy 
      00A57D 90 F6 93         [ 2] 3794 	ldw seedx,x  
                                   3795 ; seedy=seedy^(seedy>>1)
      00A580 EE 01 72         [ 2] 3796 	ldw x,seedy 
      00A583 A9               [ 2] 3797 	srlw x 
      00A584 00               [ 1] 3798 	ld a,xh 
      00A585 03 90 93         [ 1] 3799 	xor a,seedy 
      00A588 85 00 16         [ 1] 3800 	ld seedy,a  
      00A589 9F               [ 1] 3801 	ld a,xl 
      00A589 89 AE F4         [ 1] 3802 	xor a,seedy+1 
      00A58C 24 65 90         [ 1] 3803 	ld seedy+1,a 
                                   3804 ; acc16>>3 
      00A58F A3 7A 12         [ 2] 3805 	ldw x,acc16 
      00A592 2B               [ 2] 3806 	srlw x 
      00A593 01               [ 2] 3807 	srlw x 
      00A594 5C               [ 2] 3808 	srlw x 
                                   3809 ; x=acc16^x 
      00A595 9E               [ 1] 3810 	ld a,xh 
      00A595 9E C7 53         [ 1] 3811 	xor a,acc16 
      00A598 0D 9F C7         [ 1] 3812 	ld acc16,a 
      00A59B 53               [ 1] 3813 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      00A59C 0E 8C 56         [ 1] 3814 	xor a,acc8 
      00A59F 9E C7 53         [ 1] 3815 	ld acc8,a 
                                   3816 ; seedy=acc16^seedy 
      00A5A2 0F 9F C7         [ 1] 3817 	xor a,seedy+1
      00A5A5 53               [ 1] 3818 	ld xl,a 
      00A5A6 10 72 10         [ 1] 3819 	ld a,acc16 
      00A5A9 53 08 72         [ 1] 3820 	xor a,seedy
      00A5AC 10               [ 1] 3821 	ld xh,a 
      00A5AD 53 00 72         [ 2] 3822 	ldw seedy,x 
                                   3823 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A5B0 10 53 04         [ 1] 3824 	ld a,seedx+1
      00A5B3 85 CD            [ 1] 3825 	and a,#127
      002BFE                       3826 	_xpush 
      00A5B5 AA 04 72 11      [ 2]    1     subw y,#CELL_SIZE
      00A5B9 53 08            [ 1]    2     ld (y),a 
      00A5BB 72 11 53         [ 2]    3     ldw (1,y),x 
      00A5BE 00               [ 1] 3827 	pop a 
      00A5BF 81               [ 2] 3828 	popw x 
      00A5C0                       3829 	_xpush 
      00A5C0 CD 99 E1 A1      [ 2]    1     subw y,#CELL_SIZE
      00A5C4 02 27            [ 1]    2     ld (y),a 
      00A5C6 12 A1 01         [ 2]    3     ldw (1,y),x 
      00A5C9 27 03 CC         [ 4] 3830 	call mod24 
      002C15                       3831 	_xpop
      00A5CC 97 20            [ 1]    1     ld a,(y)
      00A5CE 4F               [ 1]    2     ldw x,y 
      00A5CF 5F 72            [ 2]    3     ldw x,(1,x)
      00A5D1 A2 00 03 90      [ 2]    4     addw y,#CELL_SIZE 
      00A5D5 F7 90 EF         [ 2] 3832 	addw x,#1 
      00A5D8 01 90            [ 1] 3833 	adc a,#0  
      00A5DA E6               [ 4] 3834 	ret 
                                   3835 
                                   3836 ;---------------------------------
                                   3837 ; BASIC: WORDS 
                                   3838 ; affiche la listes des mots du
                                   3839 ; dictionnaire ainsi que le nombre
                                   3840 ; de mots.
                                   3841 ;---------------------------------
                           000001  3842 	WLEN=1 ; word length
                           000002  3843 	LLEN=2 ; character sent to console
                           000003  3844 	WCNT=3 ; count words printed 
                           000003  3845 	VSIZE=3 
      002C24                       3846 words:
      002C24                       3847 	_vars VSIZE
      00A5DB 03 93            [ 2]    1     sub sp,#VSIZE 
      00A5DD EE 04            [ 1] 3848 	clr (LLEN,sp)
      00A5DF 5D 27            [ 1] 3849 	clr (WCNT,sp)
      00A5E1 25 90 F6 93      [ 2] 3850 	ldw y,#kword_dict+2
      00A5E5 EE               [ 1] 3851 0$:	ldw x,y
      00A5E6 01               [ 1] 3852 	ld a,(x)
      00A5E7 72 A9            [ 1] 3853 	and a,#15 
      00A5E9 00 03            [ 1] 3854 	ld (WLEN,sp),a 
      00A5EB 72 A9            [ 1] 3855 	inc (WCNT,sp)
      00A5ED 00               [ 1] 3856 1$:	incw x 
      00A5EE 03               [ 1] 3857 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A5EF 9F A4 07         [ 4] 3858 	call putc 
      00A5F2 4E C7            [ 1] 3859 	inc (LLEN,sp)
      00A5F4 54 01            [ 1] 3860 	dec (WLEN,sp)
      00A5F6 72 16            [ 1] 3861 	jrne 1$
      00A5F8 50 CA            [ 1] 3862 	ld a,#70
      00A5FA 72 10            [ 1] 3863 	cp a,(LLEN,sp)
      00A5FC 54 01            [ 1] 3864 	jrmi 2$   
      00A5FE AE 00            [ 1] 3865 	ld a,#SPACE 
      00A600 1B 5A 9D         [ 4] 3866 	call putc 
      00A603 26 FA            [ 1] 3867 	inc (LLEN,sp) 
      00A605 20 08            [ 2] 3868 	jra 3$
      00A607 72 11            [ 1] 3869 2$: ld a,#CR 
      00A609 54 01 72         [ 4] 3870 	call putc 
      00A60C 17 50            [ 1] 3871 	clr (LLEN,sp)
      00A60E CA A2 00 02      [ 2] 3872 3$:	subw y,#2 
      00A60F 90 FE            [ 2] 3873 	ldw y,(y)
      00A60F 81 CF            [ 1] 3874 	jrne 0$ 
      00A610 A6 0D            [ 1] 3875 	ld a,#CR 
      00A610 CD 99 DC         [ 4] 3876 	call putc  
      00A613 A1               [ 1] 3877 	clrw x 
      00A614 01 27            [ 1] 3878 	ld a,(WCNT,sp)
      00A616 03               [ 1] 3879 	ld xl,a 
      00A617 CC 97 20         [ 4] 3880 	call prt_i16 
      00A61A 90 F6 93         [ 2] 3881 	ldw x,#words_count_msg
      00A61D EE 01 72         [ 4] 3882 	call puts 
      002C71                       3883 	_drop VSIZE 
      00A620 A9 00            [ 2]    1     addw sp,#VSIZE 
      00A622 03               [ 4] 3884 	ret 
      00A623 A3 00 05 23 05 A6 0A  3885 words_count_msg: .asciz " words in dictionary\n"
             CC 97 22 9F C7 00 0F
             A6 05 C0 00 0F C7 54
             00
                                   3886 
                                   3887 
                                   3888 ;-----------------------------
                                   3889 ; BASIC: TIMER expr 
                                   3890 ; initialize count down timer 
                                   3891 ;-----------------------------
      002C8A                       3892 set_timer:
      00A639 72 16 54         [ 4] 3893 	call arg_list
      00A63C 02 72            [ 1] 3894 	cp a,#1 
      00A63E 10 54            [ 1] 3895 	jreq 1$
      00A640 01 72 0F         [ 2] 3896 	jp syntax_error
      002C94                       3897 1$: 
      002C94                       3898 	_xpop  
      00A643 54 00            [ 1]    1     ld a,(y)
      00A645 FB               [ 1]    2     ldw x,y 
      00A646 CE 54            [ 2]    3     ldw x,(1,x)
      00A648 04 A6 84 81      [ 2]    4     addw y,#CELL_SIZE 
      00A64C CF 00 12         [ 2] 3899 	ldw timer,x 
      00A64C 52               [ 4] 3900 	ret 
                                   3901 
                                   3902 ;------------------------------
                                   3903 ; BASIC: TIMEOUT 
                                   3904 ; return state of timer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3905 ; output:
                                   3906 ;   A:X     0 not timeout 
                                   3907 ;   A:X     -1 timeout 
                                   3908 ;------------------------------
      002CA1                       3909 timeout:
      00A64D 01 CD 99         [ 2] 3910 	ldw x,timer 
      00A650 DC               [ 1] 3911 	clr a 
      00A651 A1 01            [ 2] 3912 	jra logical_not 
                                   3913 
                                   3914 ;--------------------------------
                                   3915 ; BASIC NOT(expr) 
                                   3916 ; return logical complement of expr
                                   3917 ;--------------------------------
      002CA7                       3918 func_not:
      00A653 27 03 CC         [ 4] 3919 	call func_args  
      00A656 97 20            [ 1] 3920 	cp a,#1
      00A658 90 F6            [ 1] 3921 	jreq 1$
      00A65A 93 EE 01         [ 2] 3922 	jp syntax_error
      002CB1                       3923 1$: _xpop 
      00A65D 72 A9            [ 1]    1     ld a,(y)
      00A65F 00               [ 1]    2     ldw x,y 
      00A660 03 A3            [ 2]    3     ldw x,(1,x)
      00A662 00 0F 23 05      [ 2]    4     addw y,#CELL_SIZE 
      002CBA                       3924 logical_not: 
      00A666 A6               [ 1] 3925 	tnz a 
      00A667 0A CC            [ 1] 3926 	jrne 2$
      00A669 97               [ 2] 3927 	tnzw x 
      00A66A 22 CD            [ 1] 3928 	jrne 2$  
      00A66C AB               [ 1] 3929 	cpl a 
      00A66D D9               [ 2] 3930 	cplw x  
      00A66E 6B               [ 4] 3931 	ret 
      00A66F 01               [ 1] 3932 2$: clr a 
      00A670 E6               [ 1] 3933 	clrw x 
      00A671 01               [ 4] 3934 	ret 
                                   3935 
                                   3936 
                                   3937 ;-----------------------------------
                                   3938 ; BASIC: IWDGEN expr1 
                                   3939 ; enable independant watchdog timer
                                   3940 ; expr1 is delay in multiple of 62.5µsec
                                   3941 ; expr1 -> {1..16383}
                                   3942 ;-----------------------------------
      002CC6                       3943 enable_iwdg:
      00A672 0D 01 27         [ 4] 3944 	call arg_list
      00A675 05 44            [ 1] 3945 	cp a,#1 
      00A677 0A 01            [ 1] 3946 	jreq 1$
      00A679 26 FB A4         [ 2] 3947 	jp syntax_error 
      002CD0                       3948 1$: _xpop  
      00A67C 01 5F            [ 1]    1     ld a,(y)
      00A67E 97               [ 1]    2     ldw x,y 
      00A67F 4F 5B            [ 2]    3     ldw x,(1,x)
      00A681 01 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A683 4B 00            [ 1] 3949 	push #0
      00A683 52 02 CD 99      [ 1] 3950 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A687 E1               [ 1] 3951 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



      00A688 A1 02            [ 1] 3952 	and a,#0x3f
      00A68A 27               [ 1] 3953 	ld xh,a  
      00A68B 03 CC 97         [ 2] 3954 2$:	cpw x,#255
      00A68E 20 90            [ 2] 3955 	jrule 3$
      00A690 F6 93            [ 1] 3956 	inc (1,sp)
      00A692 EE               [ 1] 3957 	rcf 
      00A693 01               [ 2] 3958 	rrcw x 
      00A694 72 A9            [ 2] 3959 	jra 2$
      00A696 00 03 9F 6B      [ 1] 3960 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A69A 02               [ 1] 3961 	pop a  
      00A69B 90 F6 93         [ 1] 3962 	ld IWDG_PR,a 
      00A69E EE               [ 1] 3963 	ld a,xl
      00A69F 01               [ 1] 3964 	dec a 
      00A6A0 72 A9 00 03      [ 1] 3965 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A6A4 A3 00 0F         [ 1] 3966 	ld IWDG_RLR,a 
      00A6A7 23 05 A6 0A      [ 1] 3967 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A6AB CC               [ 4] 3968 	ret 
                                   3969 
                                   3970 
                                   3971 ;-----------------------------------
                                   3972 ; BASIC: IWDGREF  
                                   3973 ; refresh independant watchdog count down 
                                   3974 ; timer before it reset MCU. 
                                   3975 ;-----------------------------------
      002D04                       3976 refresh_iwdg:
      00A6AC 97 22 CD AB      [ 1] 3977 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A6B0 D9               [ 4] 3978 	ret 
                                   3979 
                                   3980 
                                   3981 ;-------------------------------------
                                   3982 ; BASIC: LOG(expr)
                                   3983 ; return logarithm base 2 of expr 
                                   3984 ; this is the position of most significant
                                   3985 ; bit set. 
                                   3986 ; input: 
                                   3987 ; output:
                                   3988 ;   A     TK_INTGR 
                                   3989 ;   xstack log2 
                                   3990 ;*********************************
      002D09                       3991 log2:
      00A6B1 6B 01 A6         [ 4] 3992 	call func_args 
      00A6B4 01 0D            [ 1] 3993 	cp a,#1 
      00A6B6 01 27            [ 1] 3994 	jreq 1$
      00A6B8 05 48 0A         [ 2] 3995 	jp syntax_error 
      002D13                       3996 1$: 
      002D13                       3997 	_xpop    
      00A6BB 01 26            [ 1]    1     ld a,(y)
      00A6BD FB               [ 1]    2     ldw x,y 
      00A6BE 0D 02            [ 2]    3     ldw x,(1,x)
      00A6C0 26 05 43 E4      [ 2]    4     addw y,#CELL_SIZE 
      00A6C4 00               [ 1] 3998 	tnz a
      00A6C5 20 02            [ 1] 3999 	jrne 2$ 
      00A6C7 EA               [ 2] 4000 	tnzw x 
      00A6C8 00 E7            [ 1] 4001 	jrne 2$
      00A6CA 00 5B            [ 1] 4002 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A6CC 02 81 A2         [ 2] 4003 	jp tb_error 
      00A6CE 4B 18            [ 1] 4004 2$: push #24 
      00A6CE 72               [ 2] 4005 3$: rlcw x 
      00A6CF 00               [ 1] 4006     rlc a 
      00A6D0 00 23            [ 1] 4007 	jrc 4$
      00A6D2 02 4F            [ 1] 4008 	dec (1,sp) 
      00A6D4 81 F8            [ 1] 4009 	jrne 3$
      00A6D5 5F               [ 1] 4010 4$: clrw x 
      00A6D5 AE               [ 1] 4011     pop a 
      00A6D6 A6               [ 1] 4012 	dec a
      00A6D7 FC               [ 1] 4013 	rlwa x  
      002D35                       4014 9$:	
      00A6D8 CD               [ 4] 4015 	ret 
                                   4016 
                                   4017 ;-----------------------------------
                                   4018 ; BASIC: BIT(expr) 
                                   4019 ; expr ->{0..23}
                                   4020 ; return 2^expr 
                                   4021 ; output:
                                   4022 ;    A:X    2^expr 
                                   4023 ;-----------------------------------
      002D36                       4024 bitmask:
      00A6D9 8A 21 5B         [ 4] 4025     call func_args 
      00A6DC 02 52            [ 1] 4026 	cp a,#1
      00A6DE 04 CD            [ 1] 4027 	jreq 1$
      00A6E0 A0 65 AE         [ 2] 4028 	jp syntax_error 
      002D40                       4029 1$: _xpop 
      00A6E3 16 68            [ 1]    1     ld a,(y)
      00A6E5 CF               [ 1]    2     ldw x,y 
      00A6E6 00 05            [ 2]    3     ldw x,(1,x)
      00A6E8 7F 72 5F 00      [ 2]    4     addw y,#CELL_SIZE 
      00A6EC 04               [ 1] 4030 	ld a,xl 
      00A6ED 5F CF 00         [ 2] 4031 	ldw x,#1 
      00A6F0 01 72            [ 1] 4032 	and a,#23
      00A6F2 11 00            [ 1] 4033 	jreq 9$
      00A6F4 23               [ 1] 4034 	push a 
      00A6F5 72               [ 1] 4035 	clr a 
      002D53                       4036 2$: 
      00A6F6 18               [ 2] 4037 	slaw x 
      00A6F7 00               [ 1] 4038 	rlc a 	
      00A6F8 23 CC            [ 1] 4039 	dec (1,sp)
      00A6FA 97 CB            [ 1] 4040 	jrne 2$ 
      002D59                       4041 4$:
      002D59                       4042     _drop 1 
      00A6FC 0A 62            [ 2]    1     addw sp,#1 
      00A6FE 72               [ 4] 4043 9$:	ret 
                                   4044 
                                   4045 ;------------------------------
                                   4046 ; BASIC: INVERT(expr)
                                   4047 ; 1's complement 
                                   4048 ;--------------------------------
      002D5C                       4049 invert:
      00A6FF 65 61 6B         [ 4] 4050 	call func_args
      00A702 20 70            [ 1] 4051 	cp a,#1 
      00A704 6F 69            [ 1] 4052 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A706 6E 74 2C         [ 2] 4053 	jp syntax_error
      002D66                       4054 1$: _xpop 
      00A709 20 52            [ 1]    1     ld a,(y)
      00A70B 55               [ 1]    2     ldw x,y 
      00A70C 4E 20            [ 2]    3     ldw x,(1,x)
      00A70E 74 6F 20 72      [ 2]    4     addw y,#CELL_SIZE 
      00A712 65               [ 1] 4055 	cpl a 
      00A713 73               [ 2] 4056 	cplw x 
      00A714 75               [ 4] 4057 	ret 
                                   4058 
                                   4059 ;------------------------------
                                   4060 ; BASIC: DO 
                                   4061 ; initiate a DO ... UNTIL loop 
                                   4062 ;------------------------------
                           000003  4063 	DOLP_ADR=3 
                           000005  4064 	DOLP_INW=5
                           000004  4065 	VSIZE=4 
      002D72                       4066 do_loop:
      00A715 6D               [ 2] 4067 	popw x 
      002D73                       4068 	_vars VSIZE 
      00A716 65 2E            [ 2]    1     sub sp,#VSIZE 
      00A718 0A               [ 2] 4069 	pushw x 
      00A719 00 00 04         [ 2] 4070 	ldw x,basicptr 
      00A71A 1F 03            [ 2] 4071 	ldw (DOLP_ADR,sp),x
      00A71A 72 01 00         [ 2] 4072 	ldw x,in.w 
      00A71D 23 01            [ 2] 4073 	ldw (DOLP_INW,sp),x
      00A71F 81 5C 00 1F      [ 1] 4074 	inc loop_depth 
      00A720 81               [ 4] 4075 	ret 
                                   4076 
                                   4077 ;--------------------------------
                                   4078 ; BASIC: UNTIL expr 
                                   4079 ; loop if exprssion is false 
                                   4080 ; else terminate loop
                                   4081 ;--------------------------------
      002D85                       4082 until: 
      00A720 CD 95 7C 81      [ 1] 4083 	tnz loop_depth 
      00A724 26 03            [ 1] 4084 	jrne 1$ 
      00A724 72 5F 00         [ 2] 4085 	jp syntax_error 
      002D8E                       4086 1$: 
      00A727 19 52 03         [ 4] 4087 	call condition  
      00A72A CD               [ 1] 4088 	tnz a 
      00A72B 98 21            [ 1] 4089 	jrne 9$ 
      00A72D A1               [ 2] 4090 	tnzw x   
      00A72E 04 27            [ 1] 4091 	jrne 9$
      00A730 03 CC            [ 2] 4092 	ldw x,(DOLP_ADR,sp)
      00A732 97 20 CD         [ 2] 4093 	ldw basicptr,x 
      00A735 98 70            [ 1] 4094 	ld a,(2,x)
      00A737 A4 DF A1         [ 1] 4095 	ld count,a 
      00A73A 45 26            [ 2] 4096 	ldw x,(DOLP_INW,sp)
      00A73C 0C AE 40         [ 2] 4097 	ldw in.w,x 
      00A73F 00               [ 4] 4098 	ret 
      002DA7                       4099 9$:	; remove loop data from stack  
      00A740 CF               [ 2] 4100 	popw x
      002DA8                       4101 	_drop VSIZE
      00A741 00 1A            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A743 AE 47 FF 4F      [ 1] 4102 	dec loop_depth 
      00A747 20               [ 2] 4103 	jp (x)
                                   4104 
                                   4105 ;--------------------------
                                   4106 ; BASIC: PORTA...PORTI  
                                   4107 ;  return constant value 
                                   4108 ;  PORT  base address 
                                   4109 ;---------------------------
      002DAF                       4110 const_porta:
      00A748 15 A1 46         [ 2] 4111 	ldw x,#PA_BASE 
      00A74B 27               [ 1] 4112 	clr a 
      00A74C 06               [ 4] 4113 	ret 
      002DB4                       4114 const_portb:
      00A74D AE 96 60         [ 2] 4115 	ldw x,#PB_BASE 
      00A750 CC               [ 1] 4116 	clr a 
      00A751 97               [ 4] 4117 	ret 
      002DB9                       4118 const_portc:
      00A752 22 50 0A         [ 2] 4119 	ldw x,#PC_BASE 
      00A753 4F               [ 1] 4120 	clr a 
      00A753 AE               [ 4] 4121 	ret 
      002DBE                       4122 const_portd:
      00A754 B6 80 CF         [ 2] 4123 	ldw x,#PD_BASE 
      00A757 00               [ 1] 4124 	clr a 
      00A758 1A               [ 4] 4125 	ret 
      002DC3                       4126 const_porte:
      00A759 A6 02 AE         [ 2] 4127 	ldw x,#PE_BASE 
      00A75C 7F               [ 1] 4128 	clr a 
      00A75D FF               [ 4] 4129 	ret 
      00A75E                       4130 const_portf:
      00A75E 6B 01 1F         [ 2] 4131 	ldw x,#PF_BASE 
      00A761 02               [ 1] 4132 	clr a 
      00A762 CD               [ 4] 4133 	ret 
      002DCD                       4134 const_portg:
      00A763 87 C2 1E         [ 2] 4135 	ldw x,#PG_BASE 
      00A765 4F               [ 1] 4136 	clr a 
      00A765 CD               [ 4] 4137 	ret 
      002DD2                       4138 const_porth:
      00A766 89 44 27         [ 2] 4139 	ldw x,#PH_BASE 
      00A769 08               [ 1] 4140 	clr a 
      00A76A A6               [ 4] 4141 	ret 
      002DD7                       4142 const_porti:
      00A76B 45 CD 89         [ 2] 4143 	ldw x,#PI_BASE 
      00A76E C4               [ 1] 4144 	clr a 
      00A76F CD               [ 4] 4145 	ret 
                                   4146 
                                   4147 ;-------------------------------
                                   4148 ; following return constant 
                                   4149 ; related to GPIO register offset 
                                   4150 ;---------------------------------
      002DDC                       4151 const_odr:
      00A770 88               [ 1] 4152 	clr a 
      00A771 40 AE 00         [ 2] 4153 	ldw x,#GPIO_ODR
      00A774 80               [ 4] 4154 	ret 
      002DE1                       4155 const_idr:
      00A775 CD               [ 1] 4156 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A776 89 36 7B         [ 2] 4157 	ldw x,#GPIO_IDR
      00A779 01               [ 4] 4158 	ret 
      002DE6                       4159 const_ddr:
      00A77A 1E               [ 1] 4160 	clr a
      00A77B 02 72 B0         [ 2] 4161 	ldw x,#GPIO_DDR
      00A77E 00               [ 4] 4162 	ret 
      002DEB                       4163 const_cr1:
      00A77F 1A               [ 1] 4164 	clr a 
      00A780 C2 00 19         [ 2] 4165 	ldw x,#GPIO_CR1
      00A783 22               [ 4] 4166 	ret 
      002DF0                       4167 const_cr2:
      00A784 E0               [ 1] 4168 	clr a
      00A785 CD 95 7C         [ 2] 4169 	ldw x,#GPIO_CR2
      00A788 1E               [ 4] 4170 	ret 
                                   4171 ;-------------------------
                                   4172 ; BASIC: POUT 
                                   4173 ;  constant for port mode
                                   4174 ;  used by PMODE 
                                   4175 ;  to set pin as output
                                   4176 ;------------------------
      002DF5                       4177 const_output:
      00A789 02               [ 1] 4178 	clr a 
      00A78A A3 47 FF         [ 2] 4179 	ldw x,#OUTP
      00A78D 26               [ 4] 4180 	ret 
                                   4181 
                                   4182 ;-------------------------
                                   4183 ; BASIC: PINP 
                                   4184 ;  constant for port mode
                                   4185 ;  used by PMODE 
                                   4186 ;  to set pin as input
                                   4187 ;------------------------
      002DFA                       4188 const_input:
      00A78E 03               [ 1] 4189 	clr a  
      00A78F CD 9D 2B         [ 2] 4190 	ldw x,#INP 
      00A792 81               [ 4] 4191 	ret 
                                   4192 	
                                   4193 ;-----------------------
                                   4194 ; memory area constants
                                   4195 ;-----------------------
      002DFF                       4196 const_eeprom_base:
      00A792 5B               [ 1] 4197 	clr a  
      00A793 03 81 00         [ 2] 4198 	ldw x,#EEPROM_BASE 
      00A795 81               [ 4] 4199 	ret 
                                   4200 
                                   4201 ;---------------------------
                                   4202 ; BASIC: DATA 
                                   4203 ; when the interpreter find 
                                   4204 ; a DATA line it skip it.
                                   4205 ;---------------------------
      002E04                       4206 data:
      00A795 CE B6 80 C3 A8   [ 1] 4207 	mov in,count 
      00A79A 55               [ 4] 4208 	ret 
                                   4209 
                                   4210 ;------------------------------
                                   4211 ; check if it is a DATA line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4212 ; input: 
                                   4213 ;    X    line address 
                                   4214 ; output:
                                   4215 ;    Z    set if DATA line 
                                   4216 ;----------------------------
      002E0A                       4217 is_data_line:
      00A79B 81 04            [ 2] 4218 	ldw x,(4,x)
      00A79C DE 33 71         [ 2] 4219 	ldw x,(code_addr,x)
      00A79C 88 4D 27         [ 2] 4220 	cpw x,#data 
      00A79F 0A               [ 4] 4221 	ret 
                                   4222 
                                   4223 ;---------------------------
                                   4224 ; set DATA pointer at line# 
                                   4225 ; specified by X 
                                   4226 ;---------------------------
      002E13                       4227 data_line:
      00A7A0 F6 5C            [ 2] 4228 	pushw y 
      00A7A2 90               [ 1] 4229 	clr a 
      00A7A3 F7 90 5C         [ 4] 4230 	call search_lineno
      00A7A6 0A               [ 2] 4231 	tnzw x 
      00A7A7 01 26            [ 1] 4232 	jrne 3$
      00A7A9 F6 84            [ 1] 4233 2$:	ld a,#ERR_NO_LINE 
      00A7AB 81 16 A2         [ 2] 4234 	jp tb_error
      00A7AC                       4235 3$: ; check if valid data line 
      00A7AC 88 90            [ 1] 4236     ldw y,x 
      00A7AE AE 16 B8         [ 4] 4237 	call is_data_line 
      00A7B1 90 89            [ 1] 4238 	jrne 2$ 
      002E28                       4239 set_data_ptr: 	
      00A7B3 A6 80 90 7F      [ 2] 4240 	ldw data_ptr,y
      00A7B7 90 5C 4A         [ 1] 4241 	ld a,(2,y)
      00A7BA 26 F9 90         [ 1] 4242 	ld data_len,a 
      00A7BD 85 84 81 08      [ 1] 4243 	mov data_ofs,#FIRST_DATA_ITEM 
      00A7C0 90 85            [ 2] 4244 	popw y 
      00A7C0 89               [ 4] 4245 	ret
                                   4246 
                                   4247 ;---------------------------------
                                   4248 ; BASIC: RESTORE [line#]
                                   4249 ; set data_ptr to first data line
                                   4250 ; if no DATA found pointer set to
                                   4251 ; zero.
                                   4252 ; if a line# is given as argument 
                                   4253 ; a data line with that number 
                                   4254 ; is searched and the data pointer 
                                   4255 ; is set to it. If there is no 
                                   4256 ; data line with that number 
                                   4257 ; the program is interrupted. 
                                   4258 ;---------------------------------
      002E39                       4259 restore:
      00A7C1 90 89 52 06      [ 1] 4260 	clr data_ptr 
      00A7C5 CD A7 95 26      [ 1] 4261 	clr data_ptr+1
      00A7C9 09 AE A8 57      [ 1] 4262 	clr data_ofs 
      00A7CD CD 8A 21 CC      [ 1] 4263 	clr data_len
      00A7D1 A8 4F A1         [ 4] 4264 	call next_token 
      00A7D3 A1 84            [ 1] 4265 	cp a,#TK_INTGR
      00A7D3 CE 00            [ 1] 4266 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A7D5 1C C3 00         [ 4] 4267 	call get_int24 
      00A7D8 1E 25            [ 2] 4268 	jra data_line 
      002E55                       4269 0$:	
      002E55                       4270 	_unget_token  
      00A7DA 09 AE A8 99 CD   [ 1]    1      mov in,in.saved  
      00A7DF 8A 21 CC         [ 2] 4271 	ldw x,txtbgn
      00A7E2 A8 4F            [ 2] 4272 	pushw y 
                                   4273 ; search first DATA line 
      00A7E4                       4274 data_search_loop: 	
      00A7E4 CD 88 02         [ 2] 4275 	cpw x,txtend
      00A7E7 72 5F            [ 1] 4276 	jruge restore_error 
      00A7E9 00 19            [ 1] 4277 	ldw y,x 
      00A7EB AE B6 80         [ 4] 4278 	call is_data_line 
      00A7EE CF 00            [ 1] 4279 	jreq set_data_ptr
      002E6B                       4280 try_next_line: 
      00A7F0 1A               [ 1] 4281 	ldw x,y 
      00A7F1 CD 9E            [ 1] 4282 	ld a,(2,x)
      00A7F3 47 1F 05         [ 1] 4283 	ld acc8,a 
      00A7F6 0F 03 CD A7      [ 1] 4284 	clr acc16 
      00A7FA AC CE A8 55      [ 2] 4285 	addw x,acc16 
      00A7FE 90 FF            [ 2] 4286 	jra data_search_loop
      002E7B                       4287 restore_error:	
      00A800 72 A9            [ 1] 4288     ld a,#ERR_NO_DATA 
      00A802 00 02 1E         [ 2] 4289 	jp tb_error 
                                   4290 
                                   4291 
                                   4292 ;---------------------------------
                                   4293 ; BASIC: READ 
                                   4294 ; return next data item | 0 
                                   4295 ;---------------------------------
                           000001  4296 	CTX_BPTR=1 
                           000003  4297 	CTX_IN=3 
                           000004  4298 	CTX_COUNT=4 
                           000005  4299 	INT24=5
                           000007  4300 	VSIZE=7 
      002E80                       4301 read:
      002E80                       4302 	_vars  VSIZE 
      00A805 05 90            [ 2]    1     sub sp,#VSIZE 
      002E82                       4303 read01:	
      00A807 FF 72 A9         [ 1] 4304 	ld a,data_ofs
      00A80A 00 02 A6         [ 1] 4305 	cp a,data_len 
      00A80D 7C 6B            [ 1] 4306 	jreq 2$ ; end of line  
      00A80F 04 A3 00         [ 4] 4307 	call save_context
      00A812 7C 22 01         [ 2] 4308 	ldw x,data_ptr 
      00A815 9F 6B 04         [ 2] 4309 	ldw basicptr,x 
      00A818 CE 00 1C 1F 01   [ 1] 4310 	mov in,data_ofs 
      00A81D 55 00 09 00 03   [ 1] 4311 	mov count,data_len  
      00A81D 1E 01 7B         [ 4] 4312 	call expression 
      00A820 04 CD            [ 1] 4313 	cp a,#TK_INTGR 
      00A822 A7 9C            [ 1] 4314 	jreq 1$ 
      00A824 1F 01 AE         [ 2] 4315 	jp syntax_error 
      002EA7                       4316 1$:
      00A827 16 B8 CD         [ 4] 4317 	call next_token ; skip comma
      00A82A 88 1C AE         [ 2] 4318 	ldw x,basicptr 
      00A82D 00 80 CD         [ 2] 4319 	ldw data_ptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A830 89 36 1E 01 C3   [ 1] 4320 	mov data_ofs,in 
      00A835 00 1E 24         [ 4] 4321 	call rest_context
      002EB8                       4322 	_xpop 
      00A838 16 1E            [ 1]    1     ld a,(y)
      00A83A 05               [ 1]    2     ldw x,y 
      00A83B 72 F0            [ 2]    3     ldw x,(1,x)
      00A83D 03 1F 05 A6      [ 2]    4     addw y,#CELL_SIZE 
      002EC1                       4323 	_drop VSIZE 
      00A841 80 A3            [ 2]    1     addw sp,#VSIZE 
      00A843 00               [ 4] 4324 	ret 
      002EC4                       4325 2$: ; end of line reached 
      00A844 80 24 01 9F      [ 2] 4326 	ldw y, data_ptr 
      00A848 6B 04 CD A7      [ 1] 4327 	clr data_ptr
      00A84C AC 20 CE 5B      [ 1] 4328 	clr data_ptr+1   
      00A850 06 90 85 85      [ 1] 4329 	clr data_ofs 
      00A854 81 42 43 43      [ 1] 4330 	clr data_len 
      00A858 61 6E 27         [ 4] 4331 	call try_next_line 
      00A85B 74 20            [ 2] 4332 	jra read01
                                   4333 
                                   4334 
                                   4335 ;---------------------------------
                                   4336 ; BASIC: SPIEN clkdiv, 0|1  
                                   4337 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4338 ; if clkdiv==-1 disable SPI
                                   4339 ; 0|1 -> disable|enable  
                                   4340 ;--------------------------------- 
                           000005  4341 SPI_CS_BIT=5
      002EDD                       4342 spi_enable:
      00A85D 66 6C 61         [ 4] 4343 	call arg_list 
      00A860 73 68            [ 1] 4344 	cp a,#2
      00A862 20 61            [ 1] 4345 	jreq 1$
      00A864 70 70 6C         [ 2] 4346 	jp syntax_error 
      002EE7                       4347 1$: 
      00A867 69 63 61 74      [ 1] 4348 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A86B 69               [ 2] 4349 	popw x  
      00A86C 6F               [ 2] 4350 	tnzw x 
      00A86D 6E 2C            [ 1] 4351 	jreq spi_disable 
      00A86F 20               [ 2] 4352 	popw x 
      00A870 61 6C            [ 1] 4353 	ld a,#(1<<SPI_CR1_BR)
      00A872 72               [ 4] 4354 	mul x,a 
      00A873 65               [ 1] 4355 	ld a,xl 
      00A874 61 64 79         [ 1] 4356 	ld SPI_CR1,a 
                                   4357 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A877 20 6F 6E 65      [ 1] 4358 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A87B 20 69 6E 20      [ 1] 4359 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4360 ; configure SPI as master mode 0.	
      00A87F 46 4C 41 53      [ 1] 4361 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4362 ; ~CS line controlled by sofware 	
      00A883 48 0A 75 73      [ 1] 4363 	bset SPI_CR2,#SPI_CR2_SSM 
      00A887 65 20 45 52      [ 1] 4364     bset SPI_CR2,#SPI_CR2_SSI 
                                   4365 ; enable SPI
      00A88B 41 53 45 20      [ 1] 4366 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A88F 5C               [ 4] 4367 	ret 
      002F10                       4368 spi_disable:
      002F10                       4369 	_drop #2; throw first argument.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



      00A890 46 20            [ 2]    1     addw sp,##2 
                                   4370 ; wait spi idle 
      00A892 62 65            [ 1] 4371 1$:	ld a,#0x82 
      00A894 66 6F 72         [ 1] 4372 	and a,SPI_SR
      00A897 65 00            [ 1] 4373 	cp a,#2 
      00A899 4E 6F            [ 1] 4374 	jrne 1$
      00A89B 20 61 70 70      [ 1] 4375 	bres SPI_CR1,#SPI_CR1_SPE
      00A89F 6C 69 63 61      [ 1] 4376 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A8A3 74 69 6F 6E      [ 1] 4377 	bres PE_DDR,#SPI_CS_BIT 
      00A8A7 20               [ 4] 4378 	ret 
                                   4379 
      002F28                       4380 spi_clear_error:
      00A8A8 69 6E            [ 1] 4381 	ld a,#0x78 
      00A8AA 20 52 41         [ 1] 4382 	bcp a,SPI_SR 
      00A8AD 4D 00            [ 1] 4383 	jreq 1$
      00A8AF 72 5F 52 03      [ 1] 4384 	clr SPI_SR 
      00A8AF CD               [ 4] 4385 1$: ret 
                                   4386 
      002F34                       4387 spi_send_byte:
      00A8B0 9B               [ 1] 4388 	push a 
      00A8B1 01 A1 84         [ 4] 4389 	call spi_clear_error
      00A8B4 27               [ 1] 4390 	pop a 
      00A8B5 03 CC 97 20 90   [ 2] 4391 	btjf SPI_SR,#SPI_SR_TXE,.
      00A8BA F6 93 EE         [ 1] 4392 	ld SPI_DR,a
      00A8BD 01 72 A9 00 03   [ 2] 4393 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A8C2 C7 00 19         [ 1] 4394 	ld a,SPI_DR 
      00A8C5 CF               [ 4] 4395 	ret 
                                   4396 
      002F4A                       4397 spi_rcv_byte:
      00A8C6 00 1A            [ 1] 4398 	ld a,#255
      00A8C8 72 01 52 03 E3   [ 2] 4399 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A8C8 CD 98 21         [ 1] 4400 	ld a,SPI_DR 
      00A8CB A1               [ 4] 4401 	ret
                                   4402 
                                   4403 ;------------------------------
                                   4404 ; BASIC: SPIWR byte [,byte]
                                   4405 ; write 1 or more byte
                                   4406 ;------------------------------
      002F55                       4407 spi_write:
      00A8CC 08 27 02         [ 4] 4408 	call expression
      00A8CF 20 20            [ 1] 4409 	cp a,#TK_INTGR 
      00A8D1 CD 9B            [ 1] 4410 	jreq 1$
      00A8D3 01 A1 84         [ 2] 4411 	jp syntax_error 
      002F5F                       4412 1$:	
      00A8D6 27               [ 1] 4413 	ld a,xl 
      00A8D7 03 CC 97         [ 4] 4414 	call spi_send_byte 
      00A8DA 20 90 F6         [ 4] 4415 	call next_token 
      00A8DD 93 EE            [ 1] 4416 	cp a,#TK_COMMA 
      00A8DF 01 72            [ 1] 4417 	jrne 2$ 
      00A8E1 A9 00            [ 2] 4418 	jra spi_write 
      00A8E3 03               [ 1] 4419 2$:	tnz a 
      00A8E4 9F 5F            [ 1] 4420 	jreq 3$
      002F6F                       4421 	_unget_token  
      00A8E6 CD 88 66 AE 00   [ 1]    1      mov in,in.saved  
      00A8EB 01               [ 4] 4422 3$:	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4423 
                                   4424 
                                   4425 ;-------------------------------
                                   4426 ; BASIC: SPIRD 	
                                   4427 ; read one byte from SPI 
                                   4428 ;-------------------------------
      002F75                       4429 spi_read:
      00A8EC CD 89 36         [ 4] 4430 	call spi_rcv_byte 
      00A8EF 20               [ 1] 4431 	clrw x 
      00A8F0 D7               [ 1] 4432 	ld xl,a 
      00A8F1 4F               [ 1] 4433 	clr a  
      00A8F1 81               [ 4] 4434 	ret 
                                   4435 
                                   4436 ;------------------------------
                                   4437 ; BASIC: SPISEL 0|1 
                                   4438 ; set state of ~CS line
                                   4439 ; 0|1 deselect|select  
                                   4440 ;------------------------------
      00A8F2                       4441 spi_select:
      00A8F2 CD 99 DC         [ 4] 4442 	call next_token 
      00A8F5 A1 01            [ 1] 4443 	cp a,#TK_INTGR 
      00A8F7 27 03            [ 1] 4444 	jreq 1$
      00A8F9 CC 97 20         [ 2] 4445 	jp syntax_error 
      00A8FC 90               [ 2] 4446 1$: tnzw x  
      00A8FD F6 93            [ 1] 4447 	jreq cs_high 
      00A8FF EE 01 72 A9      [ 1] 4448 	bres PE_ODR,#SPI_CS_BIT
      00A903 00               [ 4] 4449 	ret 
      002F8E                       4450 cs_high: 
      00A904 03 9F A4 7F      [ 1] 4451 	bset PE_ODR,#SPI_CS_BIT
      00A908 81               [ 4] 4452 	ret 
                                   4453 
                                   4454 ;-------------------------------
                                   4455 ; BASIC: PAD 
                                   4456 ; Return pad buffer address.
                                   4457 ;------------------------------
      00A909                       4458 pad_ref:
      00A909 A6 06 CD         [ 2] 4459 	ldw x,#pad 
      00A90C 99               [ 1] 4460 	clr a
      00A90D CF               [ 4] 4461 	ret 
                                   4462 
                                   4463 
                                   4464 ;------------------------------
                                   4465 ; logical operators dictonary 
                                   4466 ; format:
                                   4467 ;    link: 2 bytes 
                                   4468 ;    name_length: 1 byte 
                                   4469 ;    op_name: 4 char max 
                                   4470 ;    op_id: # byte
                                   4471 ;-------------------------------
                                   4472 	.macro _op_entry len,name,id 
                                   4473 	.word OP_LINK 
                                   4474 	OP_LINK=.
                                   4475 name:
                                   4476 	.byte len 
                                   4477 	.asciz "name" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



                                   4478 	.byte  id 
                                   4479 	.endm 
                                   4480 
                           000000  4481 	OP_LINK=0 
      002F98                       4482 op_end:
      002F98                       4483 	_op_entry 3,XOR,TK_XOR 
      00A90E CD 98                    1 	.word OP_LINK 
                           002F9A     2 	OP_LINK=.
      002F9A                          3 XOR:
      00A910 21                       4 	.byte 3 
      00A911 A1 02 27 0E              5 	.asciz "XOR" 
      00A915 A1                       6 	.byte  TK_XOR 
      002FA0                       4484 	_op_entry 2,OR,TK_OR 
      00A916 04 27                    1 	.word OP_LINK 
                           002FA2     2 	OP_LINK=.
      002FA2                          3 OR:
      00A918 12                       4 	.byte 2 
      00A919 A1 82 27                 5 	.asciz "OR" 
      00A91C 03                       6 	.byte  TK_OR 
      002FA7                       4485 op_dict:	
      002FA7                       4486 	_op_entry 3,AND,TK_AND 
      00A91D CC 97                    1 	.word OP_LINK 
                           002FA9     2 	OP_LINK=.
      002FA9                          3 AND:
      00A91F 20                       4 	.byte 3 
      00A920 41 4E 44 00              5 	.asciz "AND" 
      00A920 FD                       6 	.byte  TK_AND 
                                   4487 
                                   4488 ;------------------------------
                                   4489 ;  search operator dictonary 
                                   4490 ;  input:
                                   4491 ;     x    *name 
                                   4492 ;  output:
                                   4493 ;     A     op_id | 0 
                                   4494 ;-----------------------------
                           000001  4495 	NLEN=1 
                           000002  4496 	NAME=2
                           000004  4497 	XSAVE=4
                           000005  4498 	VSIZE=5 
      002FAF                       4499 search_op_dict:
      002FAF                       4500 	_vars VSIZE 
      00A921 20 0B            [ 2]    1     sub sp,#VSIZE 
      00A923 1F 02            [ 2] 4501 	ldw (NAME,sp),x 
      00A923 F6 88 CD         [ 4] 4502 	call strlen 
      00A926 98 47            [ 1] 4503 	ld (NLEN,sp),a 
      00A928 84 20 03         [ 2] 4504 	ldw x,#op_dict+2
      00A92B 1F 04            [ 2] 4505 1$:	ldw (XSAVE,sp),x 
      00A92B CD               [ 1] 4506 	ld a,(x)
      00A92C 98 70            [ 1] 4507 	cp a,(NLEN,sp)
      00A92E 5F 02            [ 1] 4508 	jreq 3$
                                   4509 ; skip over this one 	
      00A930 72 A2            [ 2] 4510 2$:	ldw x,(XSAVE,sp)
      00A932 00 03 90         [ 2] 4511 	subw x,#2 
      00A935 F7               [ 2] 4512 	ldw x,(x) ; link 
      00A936 90 EF            [ 1] 4513 	jreq 8$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A938 01 A6            [ 2] 4514 	jra 1$
      002FCC                       4515 3$: ; len good compare string 
      00A93A 07               [ 1] 4516 	incw x  
      00A93B CD 99            [ 2] 4517 	ldw y,(NAME,sp)
      00A93D CF 13 EF         [ 4] 4518 	call strcmp 
      00A93E 27 EE            [ 1] 4519 	jreq 2$ 
                                   4520 ; found 
      00A93E 90 F6            [ 2] 4521 	ldw x,(XSAVE,sp)
                                   4522 ; skip to id field 
      00A940 93               [ 1] 4523 	ld a,(x) ; len field 
      00A941 EE 01            [ 1] 4524 	add a,#2 ; len and 0 at end of string 
      00A943 72               [ 1] 4525 	push a 
      00A944 A9 00            [ 1] 4526 	push #0 
      00A946 03 81 01         [ 2] 4527 	addw x,(1,sp)
      00A948                       4528 	_drop 2 
      00A948 CD 89            [ 2]    1     addw sp,#2 
      00A94A D4               [ 1] 4529 	ld a,(x)
      00A94B 81 01            [ 2] 4530 	jra 9$ 
      00A94C                       4531 8$: ; not found 	
      00A94C 5F               [ 1] 4532 	clr a 	
      002FE5                       4533 9$:	_drop VSIZE 
      00A94D C6 00            [ 2]    1     addw sp,#VSIZE 
      00A94F 2F               [ 4] 4534 	ret 
                                   4535 
                                   4536 
                                   4537 ;------------------------------
                                   4538 ;      dictionary 
                                   4539 ; format:
                                   4540 ;   link:   2 bytes 
                                   4541 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4542 ;   cmd_name: 16 byte max 
                                   4543 ;   cmd_index: 2 bytes 
                                   4544 ;------------------------------
                                   4545 	.macro _dict_entry len,name,cmd_idx 
                                   4546 	.word LINK 
                                   4547 	LINK=.
                                   4548 name:
                                   4549 	.byte len 	
                                   4550 	.ascii "name"
                                   4551 	.word cmd_idx 
                                   4552 	.endm 
                                   4553 
                           000000  4554 	LINK=0
                                   4555 ; respect alphabetic order for BASIC names from Z-A
                                   4556 ; this sort order is for a cleaner WORDS cmd output. 	
      002FE8                       4557 kword_end:
                                   4558 ;	_dict_entry,3+F_IFUNC,XOR,XOR_IDX;bit_xor
      002FE8                       4559 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A950 C0 00                    1 	.word LINK 
                           002FEA     2 	LINK=.
      002FEA                          3 WRITE:
      00A952 30                       4 	.byte 5 	
      00A953 27 03 53 A6 FF           5 	.ascii "WRITE"
      00A958 00 BA                    6 	.word WRITE_IDX 
      002FF2                       4560 	_dict_entry,5,WORDS,WORDS_IDX;words 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      00A958 81 EA                    1 	.word LINK 
                           002FF4     2 	LINK=.
      00A959                          3 WORDS:
      00A959 CD                       4 	.byte 5 	
      00A95A 99 DC A1 02 27           5 	.ascii "WORDS"
      00A95F 03 CC                    6 	.word WORDS_IDX 
      002FFC                       4561 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A961 97 20                    1 	.word LINK 
                           002FFE     2 	LINK=.
      002FFE                          3 WAIT:
      00A963 90                       4 	.byte 4 	
      00A964 E6 03 93 EE              5 	.ascii "WAIT"
      00A968 04 A3                    6 	.word WAIT_IDX 
      003005                       4562 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A96A 50 00                    1 	.word LINK 
                           003007     2 	LINK=.
      003007                          3 USR:
      00A96C 2B                       4 	.byte 3+F_IFUNC 	
      00A96D 16 A3 50                 5 	.ascii "USR"
      00A970 29 2A                    6 	.word USR_IDX 
      00300D                       4563 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A972 11 89                    1 	.word LINK 
                           00300F     2 	LINK=.
      00300F                          3 UNTIL:
      00A974 90                       4 	.byte 5 	
      00A975 F6 93 EE 01 72           5 	.ascii "UNTIL"
      00A97A A9 00                    6 	.word UNTIL_IDX 
      003017                       4564 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A97C 03 72                    1 	.word LINK 
                           003019     2 	LINK=.
      003019                          3 UFLASH:
      00A97E FB                       4 	.byte 6+F_IFUNC 	
      00A97F 01 5B 02 4F 81 48        5 	.ascii "UFLASH"
      00A984 00 B0                    6 	.word UFLASH_IDX 
      003022                       4565 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A984 A6 0A                    1 	.word LINK 
                           003024     2 	LINK=.
      003024                          3 UBOUND:
      00A986 CC                       4 	.byte 6+F_IFUNC 	
      00A987 97 22 4F 55 4E 44        5 	.ascii "UBOUND"
      00A989 00 AE                    6 	.word UBOUND_IDX 
      00302D                       4566 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A989 CE B6                    1 	.word LINK 
                           00302F     2 	LINK=.
      00302F                          3 TONE:
      00A98B 80                       4 	.byte 4 	
      00A98C A3 10 93 27              5 	.ascii "TONE"
      00A990 08 CE                    6 	.word TONE_IDX 
      003036                       4567 	_dict_entry,2,TO,TO_IDX;to
      00A992 B6 82                    1 	.word LINK 
                           003038     2 	LINK=.
      003038                          3 TO:
      00A994 1C                       4 	.byte 2 	
      00A995 B6 84                    5 	.ascii "TO"
      00A997 20 03                    6 	.word TO_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



      00303D                       4568 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A999 AE B6                    1 	.word LINK 
                           00303F     2 	LINK=.
      00303F                          3 TIMER:
      00A99B 80                       4 	.byte 5 	
      00A99C 4F 81 4D 45 52           5 	.ascii "TIMER"
      00A99E 00 A6                    6 	.word TIMER_IDX 
      003047                       4569 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A99E 89 90                    1 	.word LINK 
                           003049     2 	LINK=.
      003049                          3 TIMEOUT:
      00A9A0 89                       4 	.byte 7+F_IFUNC 	
      00A9A1 CD 99 DC A1 01 27 07     5 	.ascii "TIMEOUT"
      00A9A8 A1 02                    6 	.word TMROUT_IDX 
      003053                       4570 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A9AA 27 03                    1 	.word LINK 
                           003055     2 	LINK=.
      003055                          3 TICKS:
      00A9AC CC                       4 	.byte 5+F_IFUNC 	
      00A9AD 97 20 88 90 F6           5 	.ascii "TICKS"
      00A9B2 93 EE                    6 	.word TICKS_IDX 
      00305D                       4571 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A9B4 01 72                    1 	.word LINK 
                           00305F     2 	LINK=.
      00305F                          3 STOP:
      00A9B6 A9                       4 	.byte 4 	
      00A9B7 00 03 90 93              5 	.ascii "STOP"
      00A9BB 84 A1                    6 	.word STOP_IDX 
      003066                       4572 	_dict_entry,4,STEP,STEP_IDX;step 
      00A9BD 01 27                    1 	.word LINK 
                           003068     2 	LINK=.
      003068                          3 STEP:
      00A9BF 0A                       4 	.byte 4 	
      00A9C0 90 F6 93 EE              5 	.ascii "STEP"
      00A9C4 01 72                    6 	.word STEP_IDX 
      00306F                       4573 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A9C6 A9 00                    1 	.word LINK 
                           003071     2 	LINK=.
      003071                          3 SPIWR:
      00A9C8 03                       4 	.byte 5 	
      00A9C9 51 90 FD 88 90           5 	.ascii "SPIWR"
      00A9CE 9F 72                    6 	.word SPIWR_IDX 
      003079                       4574 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A9D0 A2 00                    1 	.word LINK 
                           00307B     2 	LINK=.
      00307B                          3 SPISEL:
      00A9D2 03                       4 	.byte 6 	
      00A9D3 90 F7 90 EF 01 84        5 	.ascii "SPISEL"
      00A9D9 90 85                    6 	.word SPISEL_IDX 
      003084                       4575 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A9DB 85 81                    1 	.word LINK 
                           003086     2 	LINK=.
      00A9DD                          3 SPIRD:
      00A9DD 72                       4 	.byte 5+F_IFUNC 	
      00A9DE 0D 52 30 FB 8E           5 	.ascii "SPIRD"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9E3 CC 81                    6 	.word SPIRD_IDX 
      00308E                       4576 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A9E5 43 86                    1 	.word LINK 
                           003090     2 	LINK=.
      00A9E6                          3 SPIEN:
      00A9E6 72                       4 	.byte 5 	
      00A9E7 0D 52 30 FB 72           5 	.ascii "SPIEN"
      00A9EC 16 00                    6 	.word SPIEN_IDX 
      003098                       4577 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A9EE 23 8E                    1 	.word LINK 
                           00309A     2 	LINK=.
      00309A                          3 SLEEP:
      00A9F0 81                       4 	.byte 5 	
      00A9F1 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A9F1 CD 9B                    6 	.word SLEEP_IDX 
      0030A2                       4578     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A9F3 01 A1                    1 	.word LINK 
                           0030A4     2 	LINK=.
      0030A4                          3 SIZE:
      00A9F5 84                       4 	.byte 4 	
      00A9F6 27 03 CC 97              5 	.ascii "SIZE"
      00A9FA 20 90                    6 	.word SIZE_IDX 
      0030AB                       4579 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A9FC F6 93                    1 	.word LINK 
                           0030AD     2 	LINK=.
      0030AD                          3 SAVE:
      00A9FE EE                       4 	.byte 4 	
      00A9FF 01 72 A9 00              5 	.ascii "SAVE"
      00AA03 03 34                    6 	.word SAVE_IDX 
      00AA04                       4580 	_dict_entry 3,RUN,RUN_IDX;run
      00AA04 CF 00                    1 	.word LINK 
                           0030B6     2 	LINK=.
      0030B6                          3 RUN:
      00AA06 13                       4 	.byte 3 	
      00AA07 CE 00 13                 5 	.ascii "RUN"
      00AA0A 5D 27                    6 	.word RUN_IDX 
      0030BC                       4581 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00AA0C 03 8F                    1 	.word LINK 
                           0030BE     2 	LINK=.
      0030BE                          3 RSHIFT:
      00AA0E 26                       4 	.byte 6+F_IFUNC 	
      00AA0F F7 4F 81 49 46 54        5 	.ascii "RSHIFT"
      00AA12 00 90                    6 	.word RSHIFT_IDX 
      0030C7                       4582 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00AA12 CD 9B                    1 	.word LINK 
                           0030C9     2 	LINK=.
      0030C9                          3 RND:
      00AA14 01                       4 	.byte 3+F_IFUNC 	
      00AA15 A1 84 27                 5 	.ascii "RND"
      00AA18 03 CC                    6 	.word RND_IDX 
      0030CF                       4583 	_dict_entry,6,RETURN,RET_IDX;return 
      00AA1A 97 20                    1 	.word LINK 
                           0030D1     2 	LINK=.
      0030D1                          3 RETURN:
      00AA1C 90                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00AA1D F6 93 EE 01 72 A9        5 	.ascii "RETURN"
      00AA23 00 03                    6 	.word RET_IDX 
      00AA25                       4584 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00AA25 A3 14                    1 	.word LINK 
                           0030DC     2 	LINK=.
      0030DC                          3 RESTORE:
      00AA27 00                       4 	.byte 7 	
      00AA28 2B 0C 35 0F 50 F2 A6     5 	.ascii "RESTORE"
      00AA2F 1E 62                    6 	.word REST_IDX 
      0030E6                       4585 	_dict_entry 3,REM,REM_IDX;remark 
      00AA31 A6 10                    1 	.word LINK 
                           0030E8     2 	LINK=.
      0030E8                          3 REM:
      00AA33 62                       4 	.byte 3 	
      00AA34 20 1E 4D                 5 	.ascii "REM"
      00AA36 00 88                    6 	.word REM_IDX 
      0030EE                       4586 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00AA36 A3 08                    1 	.word LINK 
                           0030F0     2 	LINK=.
      0030F0                          3 REBOOT:
      00AA38 00                       4 	.byte 6 	
      00AA39 2B 09 35 0E 50 F2        5 	.ascii "REBOOT"
      00AA3F A6 50                    6 	.word RBT_IDX 
      0030F9                       4587 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00AA41 62 20                    1 	.word LINK 
                           0030FB     2 	LINK=.
      0030FB                          3 READ:
      00AA43 10                       4 	.byte 4+F_IFUNC 	
      00AA44 52 45 41 44              5 	.ascii "READ"
      00AA44 35 07                    6 	.word READ_IDX 
      003102                       4588 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00AA46 50 F2                    1 	.word LINK 
                           003104     2 	LINK=.
      00AA48                          3 QKEY:
      00AA48 A3                       4 	.byte 4+F_IFUNC 	
      00AA49 00 40 23 07              5 	.ascii "QKEY"
      00AA4D 72 5C                    6 	.word QKEY_IDX 
      00310B                       4589 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00AA4F 50 F2                    1 	.word LINK 
                           00310D     2 	LINK=.
      00310D                          3 PORTI:
      00AA51 54                       4 	.byte 5+F_IFUNC 	
      00AA52 20 F4 52 54 49           5 	.ascii "PORTI"
      00AA54 00 80                    6 	.word PRTI_IDX 
      003115                       4590 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00AA54 9F 4A                    1 	.word LINK 
                           003117     2 	LINK=.
      003117                          3 PORTH:
      00AA56 27                       4 	.byte 5+F_IFUNC 	
      00AA57 01 4A 52 54 48           5 	.ascii "PORTH"
      00AA59 00 7E                    6 	.word PRTH_IDX 
      00311F                       4591 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00AA59 A4 3E                    1 	.word LINK 
                           003121     2 	LINK=.
      003121                          3 PORTG:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AA5B C7                       4 	.byte 5+F_IFUNC 	
      00AA5C 50 F1 72 18 50           5 	.ascii "PORTG"
      00AA61 F0 8E                    6 	.word PRTG_IDX 
      003129                       4592 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00AA63 81 21                    1 	.word LINK 
                           00312B     2 	LINK=.
      00AA64                          3 PORTF:
      00AA64 C6                       4 	.byte 5+F_IFUNC 	
      00AA65 00 10 CE 00 11           5 	.ascii "PORTF"
      00AA6A 81 7A                    6 	.word PRTF_IDX 
      00AA6B                       4593 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
      00AA6B CD 99                    1 	.word LINK 
                           003135     2 	LINK=.
      003135                          3 PORTE:
      00AA6D DC                       4 	.byte 5+F_IFUNC 	
      00AA6E A1 01 27 03 CC           5 	.ascii "PORTE"
      00AA73 97 20                    6 	.word PRTE_IDX 
      00AA75                       4594 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00AA75 CD 82                    1 	.word LINK 
                           00313F     2 	LINK=.
      00313F                          3 PORTD:
      00AA77 5F                       4 	.byte 5+F_IFUNC 	
      00AA78 90 F6 93 EE 01           5 	.ascii "PORTD"
      00AA7D 72 A9                    6 	.word PRTD_IDX 
      003147                       4595 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00AA7F 00 03                    1 	.word LINK 
                           003149     2 	LINK=.
      003149                          3 PORTC:
      00AA81 81                       4 	.byte 5+F_IFUNC 	
      00AA82 50 4F 52 54 43           5 	.ascii "PORTC"
      00AA82 CD 99                    6 	.word PRTC_IDX 
      003151                       4596 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00AA84 DC A1                    1 	.word LINK 
                           003153     2 	LINK=.
      003153                          3 PORTB:
      00AA86 02                       4 	.byte 5+F_IFUNC 	
      00AA87 27 03 CC 97 20           5 	.ascii "PORTB"
      00AA8C 90 F6                    6 	.word PRTB_IDX 
      00315B                       4597 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00AA8E 93 EE                    1 	.word LINK 
                           00315D     2 	LINK=.
      00315D                          3 PORTA:
      00AA90 01                       4 	.byte 5+F_IFUNC 	
      00AA91 72 A9 00 03 89           5 	.ascii "PORTA"
      00AA96 88 90                    6 	.word PRTA_IDX 
      003165                       4598 	_dict_entry 5,PRINT,PRT_IDX;print 
      00AA98 F6 93                    1 	.word LINK 
                           003167     2 	LINK=.
      003167                          3 PRINT:
      00AA9A EE                       4 	.byte 5 	
      00AA9B 01 14 01 02 14           5 	.ascii "PRINT"
      00AAA0 02 02                    6 	.word PRT_IDX 
      00316F                       4599 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00AAA2 14 03                    1 	.word LINK 
                           003171     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      003171                          3 POUT:
      00AAA4 02                       4 	.byte 4+F_IFUNC 	
      00AAA5 5B 03 90 F7              5 	.ascii "POUT"
      00AAA9 90 EF                    6 	.word POUT_IDX 
      003178                       4600 	_dict_entry,4,POKE,POKE_IDX;poke 
      00AAAB 01 A6                    1 	.word LINK 
                           00317A     2 	LINK=.
      00317A                          3 POKE:
      00AAAD 84                       4 	.byte 4 	
      00AAAE 81 4F 4B 45              5 	.ascii "POKE"
      00AAAF 00 6A                    6 	.word POKE_IDX 
      003181                       4601 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00AAAF CD 99                    1 	.word LINK 
                           003183     2 	LINK=.
      003183                          3 PMODE:
      00AAB1 DC                       4 	.byte 5 	
      00AAB2 A1 02 27 03 CC           5 	.ascii "PMODE"
      00AAB7 97 20                    6 	.word PMODE_IDX 
      00318B                       4602 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00AAB9 90 F6                    1 	.word LINK 
                           00318D     2 	LINK=.
      00318D                          3 PINP:
      00AABB 93                       4 	.byte 4+F_IFUNC 	
      00AABC EE 01 72 A9              5 	.ascii "PINP"
      00AAC0 00 03                    6 	.word PINP_IDX 
      003194                       4603 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00AAC2 89 88                    1 	.word LINK 
                           003196     2 	LINK=.
      003196                          3 PEEK:
      00AAC4 90                       4 	.byte 4+F_IFUNC 	
      00AAC5 F6 93 EE 01              5 	.ascii "PEEK"
      00AAC9 1A 01                    6 	.word PEEK_IDX 
      00319D                       4604 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AACB 90 97                    1 	.word LINK 
                           00319F     2 	LINK=.
      00319F                          3 PAUSE:
      00AACD 9E                       4 	.byte 5 	
      00AACE 1A 02 95 9F 1A           5 	.ascii "PAUSE"
      00AAD3 03 97                    6 	.word PAUSE_IDX 
      0031A7                       4605 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AAD5 90 9F                    1 	.word LINK 
                           0031A9     2 	LINK=.
      0031A9                          3 PAD:
      00AAD7 5B                       4 	.byte 3+F_IFUNC 	
      00AAD8 03 90 F7                 5 	.ascii "PAD"
      00AADB 90 EF                    6 	.word PAD_IDX 
                                   4606 ;	_dict_entry,2+F_IFUNC,OR,OR_IDX;bit_or
      0031AF                       4607 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AADD 01 A6                    1 	.word LINK 
                           0031B1     2 	LINK=.
      0031B1                          3 ON:
      00AADF 84                       4 	.byte 2 	
      00AAE0 81 4E                    5 	.ascii "ON"
      00AAE1 00 C0                    6 	.word ON_IDX 
      0031B6                       4608 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAE1 CD 99                    1 	.word LINK 
                           0031B8     2 	LINK=.
      0031B8                          3 ODR:
      00AAE3 DC                       4 	.byte 3+F_IFUNC 	
      00AAE4 A1 02 27                 5 	.ascii "ODR"
      00AAE7 03 CC                    6 	.word ODR_IDX 
      0031BE                       4609 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00AAE9 97 20                    1 	.word LINK 
                           0031C0     2 	LINK=.
      0031C0                          3 NOT:
      00AAEB 90                       4 	.byte 3+F_IFUNC 	
      00AAEC F6 93 EE                 5 	.ascii "NOT"
      00AAEF 01 72                    6 	.word NOT_IDX 
      0031C6                       4610 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AAF1 A9 00                    1 	.word LINK 
                           0031C8     2 	LINK=.
      0031C8                          3 NEXT:
      00AAF3 03                       4 	.byte 4 	
      00AAF4 89 88 90 F6              5 	.ascii "NEXT"
      00AAF8 93 EE                    6 	.word NEXT_IDX 
      0031CF                       4611 	_dict_entry,3,NEW,NEW_IDX;new
      00AAFA 01 18                    1 	.word LINK 
                           0031D1     2 	LINK=.
      0031D1                          3 NEW:
      00AAFC 01                       4 	.byte 3 	
      00AAFD 90 97 9E                 5 	.ascii "NEW"
      00AB00 18 02                    6 	.word NEW_IDX 
                                   4612 ;	_dict_entry,6+F_IFUNC,MULDIV,MULDIV_IDX;muldiv 
      0031D7                       4613 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AB02 95 9F                    1 	.word LINK 
                           0031D9     2 	LINK=.
      0031D9                          3 LSHIFT:
      00AB04 18                       4 	.byte 6+F_IFUNC 	
      00AB05 03 97 90 9F 5B 03        5 	.ascii "LSHIFT"
      00AB0B 90 F7                    6 	.word LSHIFT_IDX 
      0031E2                       4614 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AB0D 90 EF                    1 	.word LINK 
                           0031E4     2 	LINK=.
      0031E4                          3 LOG:
      00AB0F 01                       4 	.byte 3+F_IFUNC 	
      00AB10 A6 84 81                 5 	.ascii "LOG"
      00AB13 00 52                    6 	.word LOG_IDX 
      0031EA                       4615 	_dict_entry 4,LIST,LIST_IDX;list
      00AB13 CD 99                    1 	.word LINK 
                           0031EC     2 	LINK=.
      0031EC                          3 LIST:
      00AB15 DC                       4 	.byte 4 	
      00AB16 A1 02 27 03              5 	.ascii "LIST"
      00AB1A CC 97                    6 	.word LIST_IDX 
      0031F3                       4616 	_dict_entry 3,LET,LET_IDX;let 
      00AB1C 20 90                    1 	.word LINK 
                           0031F5     2 	LINK=.
      0031F5                          3 LET:
      00AB1E F6                       4 	.byte 3 	
      00AB1F 93 EE 01                 5 	.ascii "LET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AB22 72 A9                    6 	.word LET_IDX 
      0031FB                       4617 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AB24 00 03                    1 	.word LINK 
                           0031FD     2 	LINK=.
      0031FD                          3 KEY:
      00AB26 90                       4 	.byte 3+F_CFUNC 	
      00AB27 93 90 F6                 5 	.ascii "KEY"
      00AB2A 93 EE                    6 	.word KEY_IDX 
      003203                       4618 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AB2C 01 90                    1 	.word LINK 
                           003205     2 	LINK=.
      003205                          3 IWDGREF:
      00AB2E 5D                       4 	.byte 7 	
      00AB2F 27 07 98 59 49 90 5A     5 	.ascii "IWDGREF"
      00AB36 26 F9                    6 	.word IWDGREF_IDX 
      00320F                       4619 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AB38 90 F7                    1 	.word LINK 
                           003211     2 	LINK=.
      003211                          3 IWDGEN:
      00AB3A 90                       4 	.byte 6 	
      00AB3B EF 01 A6 84 81 4E        5 	.ascii "IWDGEN"
      00AB40 00 48                    6 	.word IWDGEN_IDX 
      00321A                       4620 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AB40 CD 99                    1 	.word LINK 
                           00321C     2 	LINK=.
      00321C                          3 INVERT:
      00AB42 DC                       4 	.byte 6+F_IFUNC 	
      00AB43 A1 02 27 03 CC 97        5 	.ascii "INVERT"
      00AB49 20 90                    6 	.word INVERT_IDX 
      003225                       4621 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AB4B F6 93                    1 	.word LINK 
                           003227     2 	LINK=.
      003227                          3 INPUT:
      00AB4D EE                       4 	.byte 5 	
      00AB4E 01 72 A9 00 03           5 	.ascii "INPUT"
      00AB53 90 93                    6 	.word INPUT_IDX 
      00322F                       4622 	_dict_entry,2,IF,IF_IDX;if 
      00AB55 90 F6                    1 	.word LINK 
                           003231     2 	LINK=.
      003231                          3 IF:
      00AB57 93                       4 	.byte 2 	
      00AB58 EE 01                    5 	.ascii "IF"
      00AB5A 90 5D                    6 	.word IF_IDX 
      003236                       4623 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AB5C 27 07                    1 	.word LINK 
                           003238     2 	LINK=.
      003238                          3 IDR:
      00AB5E 98                       4 	.byte 3+F_IFUNC 	
      00AB5F 56 46 90                 5 	.ascii "IDR"
      00AB62 5A 26                    6 	.word IDR_IDX 
      00323E                       4624 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AB64 F9 90                    1 	.word LINK 
                           003240     2 	LINK=.
      003240                          3 HEX:
      00AB66 F7                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AB67 90 EF 01                 5 	.ascii "HEX"
      00AB6A A6 84                    6 	.word HEX_IDX 
      003246                       4625 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AB6C 81 40                    1 	.word LINK 
                           003248     2 	LINK=.
      00AB6D                          3 GPIO:
      00AB6D A6                       4 	.byte 4+F_IFUNC 	
      00AB6E 84 CD 99 CF              5 	.ascii "GPIO"
      00AB72 CD 98                    6 	.word GPIO_IDX 
      00324F                       4626 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AB74 60 9F                    1 	.word LINK 
                           003251     2 	LINK=.
      003251                          3 GOTO:
      00AB76 A4                       4 	.byte 4 	
      00AB77 07 C7 50 C6              5 	.ascii "GOTO"
      00AB7B 81 3A                    6 	.word GOTO_IDX 
      00AB7C                       4627 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AB7C 52 01                    1 	.word LINK 
                           00325A     2 	LINK=.
      00325A                          3 GOSUB:
      00AB7E CD                       4 	.byte 5 	
      00AB7F 99 E1 A1 02 27           5 	.ascii "GOSUB"
      00AB84 03 CC                    6 	.word GOSUB_IDX 
      003262                       4628 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AB86 97 20                    1 	.word LINK 
                           003264     2 	LINK=.
      003264                          3 GET:
      00AB88 90                       4 	.byte 3 	
      00AB89 F6 93 EE                 5 	.ascii "GET"
      00AB8C 01 72                    6 	.word GET_IDX 
      00326A                       4629 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AB8E A9 00                    1 	.word LINK 
                           00326C     2 	LINK=.
      00326C                          3 FREE:
      00AB90 03                       4 	.byte 4+F_IFUNC 	
      00AB91 90 93 90 F6              5 	.ascii "FREE"
      00AB95 93 EE                    6 	.word FREE_IDX 
      003273                       4630 	_dict_entry,3,FOR,FOR_IDX;for 
      00AB97 01 72                    1 	.word LINK 
                           003275     2 	LINK=.
      003275                          3 FOR:
      00AB99 A9                       4 	.byte 3 	
      00AB9A 00 03 CD                 5 	.ascii "FOR"
      00AB9D AB D9                    6 	.word FOR_IDX 
      00327B                       4631 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AB9F 6B 01                    1 	.word LINK 
                           00327D     2 	LINK=.
      00327D                          3 FCPU:
      00ABA1 A6                       4 	.byte 4 	
      00ABA2 01 0D 01 27              5 	.ascii "FCPU"
      00ABA6 0D 48                    6 	.word FCPU_IDX 
      003284                       4632 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00ABA8 0A 01                    1 	.word LINK 
                           003286     2 	LINK=.
      003286                          3 ERASE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00ABAA 26                       4 	.byte 5 	
      00ABAB FB 6B 01 7B 01           5 	.ascii "ERASE"
      00ABB0 EA 03                    6 	.word ERASE_IDX 
      00328E                       4633 	_dict_entry,3,END,END_IDX;cmd_end  
      00ABB2 E7 03                    1 	.word LINK 
                           003290     2 	LINK=.
      003290                          3 END:
      00ABB4 90                       4 	.byte 3 	
      00ABB5 A3 00 01                 5 	.ascii "END"
      00ABB8 27 10                    6 	.word END_IDX 
      003296                       4634 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00ABBA 7B 01                    1 	.word LINK 
                           003298     2 	LINK=.
      003298                          3 EEPROM:
      00ABBC 43                       4 	.byte 6+F_IFUNC 	
      00ABBD E4 04 E7 04 7B 01        5 	.ascii "EEPROM"
      00ABC3 43 E4                    6 	.word EEPROM_IDX 
      0032A1                       4635 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00ABC5 02 E7                    1 	.word LINK 
                           0032A3     2 	LINK=.
      0032A3                          3 EEFREE:
      00ABC7 02                       4 	.byte 6+F_IFUNC 	
      00ABC8 20 0C 46 52 45 45        5 	.ascii "EEFREE"
      00ABCA 00 C6                    6 	.word EEFREE_IDX 
      0032AC                       4636 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00ABCA 7B 01                    1 	.word LINK 
                           0032AE     2 	LINK=.
      0032AE                          3 EDIT:
      00ABCC EA                       4 	.byte 4 	
      00ABCD 02 E7 02 7B              5 	.ascii "EDIT"
      00ABD1 01 EA                    6 	.word EDIT_IDX 
      0032B5                       4637 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00ABD3 04 E7                    1 	.word LINK 
                           0032B7     2 	LINK=.
      0032B7                          3 DWRITE:
      00ABD5 04                       4 	.byte 6+F_CMD 	
      00ABD6 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00ABD6 5B 01                    6 	.word DWRITE_IDX 
      0032C0                       4638 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00ABD8 81 B7                    1 	.word LINK 
                           0032C2     2 	LINK=.
      00ABD9                          3 DREAD:
      00ABD9 58                       4 	.byte 5+F_IFUNC 	
      00ABDA 1C AB E9 FE 9F           5 	.ascii "DREAD"
      00ABDF 88 5E                    6 	.word DREAD_IDX 
      0032CA                       4639 	_dict_entry,2,DO,DO_IDX;do_loop
      00ABE1 A6 05                    1 	.word LINK 
                           0032CC     2 	LINK=.
      0032CC                          3 DO:
      00ABE3 42                       4 	.byte 2 	
      00ABE4 1C 50                    5 	.ascii "DO"
      00ABE6 00 84                    6 	.word DO_IDX 
      0032D1                       4640 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00ABE8 81 CC                    1 	.word LINK 
                           0032D3     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      00ABE9                          3 DEC:
      00ABE9 03                       4 	.byte 3 	
      00ABEA 06 03 05                 5 	.ascii "DEC"
      00ABED 04 00                    6 	.word DEC_IDX 
      0032D9                       4641 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00ABEF 02 01                    1 	.word LINK 
                           0032DB     2 	LINK=.
      0032DB                          3 DDR:
      00ABF1 06                       4 	.byte 3+F_IFUNC 	
      00ABF2 00 02 02                 5 	.ascii "DDR"
      00ABF5 02 03                    6 	.word DDR_IDX 
      0032E1                       4642 	_dict_entry,4,DATA,DATA_IDX;data  
      00ABF7 03 01                    1 	.word LINK 
                           0032E3     2 	LINK=.
      0032E3                          3 DATA:
      00ABF9 03                       4 	.byte 4 	
      00ABFA 03 02 04 04              5 	.ascii "DATA"
      00ABFE 05 02                    6 	.word DATA_IDX 
      0032EA                       4643 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AC00 06 02                    1 	.word LINK 
                           0032EC     2 	LINK=.
      0032EC                          3 CRL:
      00AC02 07                       4 	.byte 3+F_IFUNC 	
      00AC03 02 05 04                 5 	.ascii "CRL"
      00AC06 02 04                    6 	.word CRL_IDX 
      0032F2                       4644 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AC08 01 EC                    1 	.word LINK 
                           0032F4     2 	LINK=.
      00AC09                          3 CRH:
      00AC09 CD                       4 	.byte 3+F_IFUNC 	
      00AC0A 99 DC A1                 5 	.ascii "CRH"
      00AC0D 01 27                    6 	.word CRH_IDX 
      0032FA                       4645 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AC0F 03 CC                    1 	.word LINK 
                           0032FC     2 	LINK=.
      0032FC                          3 CONST:
      00AC11 97                       4 	.byte 5 	
      00AC12 20 4F 4E 53 54           5 	.ascii "CONST"
      00AC13 00 C4                    6 	.word CONST_IDX 
      003304                       4646 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AC13 90 F6                    1 	.word LINK 
                           003306     2 	LINK=.
      003306                          3 CHAR:
      00AC15 93                       4 	.byte 4+F_CFUNC 	
      00AC16 EE 01 72 A9              5 	.ascii "CHAR"
      00AC1A 00 03                    6 	.word CHAR_IDX 
      00330D                       4647 	_dict_entry,3,BYE,BYE_IDX;bye 
      00AC1C 89 88                    1 	.word LINK 
                           00330F     2 	LINK=.
      00330F                          3 BYE:
      00AC1E A6                       4 	.byte 3 	
      00AC1F 80 15 01                 5 	.ascii "BYE"
      00AC22 27 05                    6 	.word BYE_IDX 
      003315                       4648 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00AC24 A6 0A                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



                           003317     2 	LINK=.
      003317                          3 BTOGL:
      00AC26 CC                       4 	.byte 5 	
      00AC27 97 22 4F 47 4C           5 	.ascii "BTOGL"
      00AC29 00 14                    6 	.word BTOGL_IDX 
      00331F                       4649 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
      00AC29 CE 00                    1 	.word LINK 
                           003321     2 	LINK=.
      003321                          3 BTEST:
      00AC2B 15                       4 	.byte 5+F_IFUNC 	
      00AC2C 58 58 58 58 58           5 	.ascii "BTEST"
      00AC31 9E C8                    6 	.word BTEST_IDX 
      003329                       4650 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00AC33 00 15                    1 	.word LINK 
                           00332B     2 	LINK=.
      00332B                          3 BSET:
      00AC35 C7                       4 	.byte 4 	
      00AC36 00 0E 9F C8              5 	.ascii "BSET"
      00AC3A 00 16                    6 	.word BSET_IDX 
      003332                       4651 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00AC3C C7 00                    1 	.word LINK 
                           003334     2 	LINK=.
      003334                          3 BRES:
      00AC3E 0F                       4 	.byte 4 	
      00AC3F CE 00 17 CF              5 	.ascii "BRES"
      00AC43 00 15                    6 	.word BRES_IDX 
      00333B                       4652 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00AC45 CE 00                    1 	.word LINK 
                           00333D     2 	LINK=.
      00333D                          3 BIT:
      00AC47 17                       4 	.byte 3+F_IFUNC 	
      00AC48 54 9E C8                 5 	.ascii "BIT"
      00AC4B 00 17                    6 	.word BIT_IDX 
      003343                       4653 	_dict_entry,3,AWU,AWU_IDX;awu 
      00AC4D C7 00                    1 	.word LINK 
                           003345     2 	LINK=.
      003345                          3 AWU:
      00AC4F 17                       4 	.byte 3 	
      00AC50 9F C8 00                 5 	.ascii "AWU"
      00AC53 18 C7                    6 	.word AWU_IDX 
      00334B                       4654 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00AC55 00 18                    1 	.word LINK 
                           00334D     2 	LINK=.
      00334D                          3 ASC:
      00AC57 CE                       4 	.byte 3+F_IFUNC 	
      00AC58 00 0E 54                 5 	.ascii "ASC"
      00AC5B 54 54                    6 	.word ASC_IDX 
                                   4655 ;	_dict_entry,3+F_IFUNC,AND,AND_IDX;bit_and
      003353                       4656 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00AC5D 9E C8                    1 	.word LINK 
                           003355     2 	LINK=.
      003355                          3 ADCREAD:
      00AC5F 00                       4 	.byte 7+F_IFUNC 	
      00AC60 0E C7 00 0E 9F C8 00     5 	.ascii "ADCREAD"
      00AC67 0F C7                    6 	.word ADCREAD_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00335F                       4657 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00AC69 00 0F                    1 	.word LINK 
                           003361     2 	LINK=.
      003361                          3 ADCON:
      00AC6B C8                       4 	.byte 5 	
      00AC6C 00 18 97 C6 00           5 	.ascii "ADCON"
      00AC71 0E C8                    6 	.word ADCON_IDX 
      003369                       4658 kword_dict::
      003369                       4659 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00AC73 00 17                    1 	.word LINK 
                           00336B     2 	LINK=.
      00336B                          3 ABS:
      00AC75 95                       4 	.byte 3+F_IFUNC 	
      00AC76 CF 00 17                 5 	.ascii "ABS"
      00AC79 C6 00                    6 	.word ABS_IDX 
                                   4660 
                                   4661 ;comands and fonctions address table 	
      003371                       4662 code_addr::
      00AC7B 16 A4 7F 72 A2 00 03  4663 	.word abs,power_adc,analog_read,bit_and,ascii,awu,bitmask ; 0..7
             90 F7 90 EF 01 84 85
      00AC89 72 A2 00 03 90 F7 90  4664 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             EF 01 CD 84 55 90 F6
      00AC97 93 EE 01 72 A9 00 03  4665 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             1C 00 01 A9 00 81 03
      00ACA4 1E FD 2D FF 24 AC 26  4666 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             A4 2A ED 27 40 21 D6
             24 0C 23 F2 28 D9
      00ACA4 52 03 0F 02 0F 03 90  4667 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             AE B3 EB 93 F6 A4 0F
             6B 01
      00ACB4 0C 03 5C F6 CD 89 C4  4668 	.word let,list,log2,lshift,next,new ; 40..47
             0C 02 0A 01 26
      00ACC0 F5 A6 46 11 02 2B 09  4669 	.word func_not,const_odr,bit_or,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             A6 20 CD 89 C4 0C 02
             20 07
      00ACD0 A6 0D CD 89 C4 0F 02  4670 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             72 A2 00 02 90 FE 26
             CF A6
      00ACE0 0D CD 89 C4 5F 7B 03  4671 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             97 CD 98 76 AE AC F4
             CD 8A
      00ACF0 21 5B 03 81 20 77 6F  4672 	.word restore,return, random,rshift,run,free ; 72..79
             72 64 73 20 69
      00ACFC 6E 20 64 69 63 74 69  4673 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             6F 6E 61 72 79 0A 00
             29 E4
      00AD0A 2C 8A 2C A1 22 00 24  4674 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             E9 1B E2 29 09 2D 85
             29 1E
      00AD0A CD 99 E1 A1 01 27 03  4675 	.word wait,words,write,bit_xor,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             CC 97 20 23 66 24 B3
             1D 18
      00AD14 1C AB 00 00           4676 	.word func_eefree,0 
                                   4677 
                                   4678 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



                                   4679 
                                   4680 
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
      00343B                         30 test:
      00343B                         31     _vars VSIZE 
      00AD14 90 F6            [ 2]    1     sub sp,#VSIZE 
      00AD16 93 EE 01         [ 2]   32     ldw x,#LOOP_CNT
      00AD19 72 A9            [ 2]   33     ldw (CNTR,sp),x  
      00AD1B 00 03 CF         [ 2]   34     ldw x,ticks 
      00AD1E 00 13            [ 2]   35     ldw (T,sp),x
      003447                         36 1$: ; test add24 
      00AD20 81 02            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AD21 AE FF FF         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AD21 CE 00 13         [ 1]   39     ld acc24,a 
      00AD24 4F 20 13         [ 2]   40     ldw acc24+1,x  
      00AD27 A6 00            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AD27 CD 99 DC         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AD2A A1 01 27         [ 4]   43     call add24 
      00AD2D 03 CC            [ 2]   44     ldw x,(CNTR,sp)
      00AD2F 97 20 90         [ 2]   45     subw x,#1
      00AD32 F6 93            [ 2]   46     ldw (CNTR,sp),x 
      00AD34 EE 01            [ 1]   47     jrne 1$
      00AD36 72 A9 00         [ 4]   48     call prt_acc24
      00AD39 03 20            [ 1]   49     ld a,#SPACE 
      00AD3A CD 09 44         [ 4]   50     call putc 
      00AD3A 4D 26 06         [ 2]   51     ldw x,ticks 
      00AD3D 5D 26 03         [ 2]   52     subw x,(T,sp)
      00AD40 43 53 81         [ 4]   53     call prt_i16  
      00AD43 4F 5F            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00AD45 81 09 44         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AD46 CE 27 10         [ 2]   58     ldw x,LOOP_CNT
      00AD46 CD 99            [ 2]   59     ldw (CNTR,sp),x 
      00AD48 E1 A1 01         [ 2]   60     ldw x,ticks 
      00AD4B 27 03            [ 2]   61     ldw (T,sp),x 
      003483                         62 2$: 
      00AD4D CC 97            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AD4F 20 90 F6         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AD52 93 EE 01         [ 1]   65     ld acc24,a 
      00AD55 72 A9 00         [ 2]   66     ldw acc24+1,x  
      00AD58 03 4B            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AD5A 00 35 CC         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AD5D 50 E0 9E         [ 4]   69     call mul24 
      00AD60 A4 3F            [ 2]   70     ldw x,(CNTR,sp)
      00AD62 95 A3 00         [ 2]   71     subw x,#1
      00AD65 FF 23            [ 2]   72     ldw (CNTR,sp),x 
      00AD67 06 0C            [ 1]   73     jrne 2$ 
      00AD69 01 98 56         [ 4]   74    call prt_acc24 
      00AD6C 20 F5            [ 1]   75    ld a,#SPACE 
      00AD6E 35 55 50         [ 4]   76    call putc 
      00AD71 E0 84 C7         [ 2]   77     ldw x,ticks 
      00AD74 50 E1 9F         [ 2]   78     subw x,(T,sp)
      00AD77 4A 35 55         [ 4]   79     call prt_i16 
      00AD7A 50 E0            [ 1]   80     ld a,#CR 
      00AD7C C7 50 E2         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AD7F 35 AA 50         [ 2]   83     ldw x,LOOP_CNT
      00AD82 E0 81            [ 2]   84     ldw (CNTR,sp),x 
      00AD84 CE 00 0F         [ 2]   85     ldw x,ticks 
      00AD84 35 AA            [ 2]   86     ldw (T,sp),x 
      0034BF                         87 3$: 
      00AD86 50 E0            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AD88 81 FF FF         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AD89 C7 00 0C         [ 1]   90     ld acc24,a 
      00AD89 CD 99 DC         [ 2]   91     ldw acc24+1,x  
      00AD8C A1 01            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AD8E 27 03 CC         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AD91 97 20 5D         [ 4]   94     call mul24 
      00AD93 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00AD93 90 F6 93         [ 2]   96     subw x,#1
      00AD96 EE 01            [ 2]   97     ldw (CNTR,sp),x 
      00AD98 72 A9            [ 1]   98     jrne 3$ 
      00AD9A 00 03 4D         [ 4]   99     call prt_acc24    
      00AD9D 26 08            [ 1]  100     ld a,#SPACE 
      00AD9F 5D 26 05         [ 4]  101     call putc 
      00ADA2 A6 0A CC         [ 2]  102     ldw x,ticks 
      00ADA5 97 22 4B         [ 2]  103     subw x,(T,sp)
      00ADA8 18 59 49         [ 4]  104     call prt_i16 
      00ADAB 25 04            [ 1]  105     ld a,#CR 
      00ADAD 0A 01 26         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00ADB0 F8 5F 84         [ 2]  108     ldw x,LOOP_CNT
      00ADB3 4A 02            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      00ADB5 CE 00 0F         [ 2]  110     ldw x,ticks 
      00ADB5 81 01            [ 2]  111     ldw (T,sp),x 
      00ADB6                        112 4$:
      00ADB6 CD 99            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00ADB8 DC A1 01         [ 2]  114     ldw x,#VAL1&0XFFFF
      00ADBB 27 03 CC         [ 1]  115     ld acc24,a 
      00ADBE 97 20 90         [ 2]  116     ldw acc24+1,x  
      00ADC1 F6 93            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00ADC3 EE 01 72         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00ADC6 A9 00 03         [ 4]  119     call mul24 
      00ADC9 9F AE            [ 2]  120     ldw x,(CNTR,sp)
      00ADCB 00 01 A4         [ 2]  121     subw x,#1
      00ADCE 17 27            [ 2]  122     ldw (CNTR,sp),x 
      00ADD0 0A 88            [ 1]  123     jrne 4$ 
      00ADD2 4F 18 0D         [ 4]  124     call prt_acc24 
      00ADD3 A6 20            [ 1]  125     ld a,#SPACE 
      00ADD3 58 49 0A         [ 4]  126     call putc 
      00ADD6 01 26 FA         [ 2]  127     ldw x,ticks 
      00ADD9 72 F0 01         [ 2]  128     subw x,(T,sp)
      00ADD9 5B 01 81         [ 4]  129     call prt_i16 
      00ADDC A6 0D            [ 1]  130     ld a,#CR 
      00ADDC CD 99 DC         [ 4]  131     call putc 
                                    132 ; test abs24 
      00ADDF A1 01 27         [ 2]  133     ldw x,LOOP_CNT
      00ADE2 03 CC            [ 2]  134     ldw (CNTR,sp),x 
      00ADE4 97 20 90         [ 2]  135     ldw x,ticks 
      00ADE7 F6 93            [ 2]  136     ldw (T,sp),x 
      003537                        137 5$: 
      00ADE9 EE 01            [ 1]  138     ld a,#0xff
      00ADEB 72 A9 00         [ 2]  139     ldw x,#0xffff
      00ADEE 03 43 53         [ 4]  140     call abs24 
      00ADF1 81 00 0C         [ 1]  141     ld acc24,a 
      00ADF2 CF 00 0D         [ 2]  142     ldw acc24+1,x
      00ADF2 85 52            [ 2]  143     ldw x,(CNTR,sp)
      00ADF4 04 89 CE         [ 2]  144     subw x,#1
      00ADF7 00 05            [ 2]  145     ldw (CNTR,sp),x 
      00ADF9 1F 03            [ 1]  146     jrne 5$ 
      00ADFB CE 00 01         [ 4]  147     call prt_acc24 
      00ADFE 1F 05            [ 1]  148     ld a,#SPACE 
      00AE00 72 5C 00         [ 4]  149     call putc 
      00AE03 20 81 0F         [ 2]  150     ldw x,ticks 
      00AE05 72 F0 01         [ 2]  151     subw x,(T,sp)
      00AE05 72 5D 00         [ 4]  152     call prt_i16 
      00355F                        153 6$:
      00AE08 20 26            [ 1]  154     ld a,#CR 
      00AE0A 03 CC 97         [ 4]  155     call putc 
      00AE0D 20 35 AA         [ 4]  156     call read_integer 
      00AE0E 55 00 0C 00 18   [ 1]  157     mov farptr,acc24 
      00AE0E CD 9B 8A 4D 26   [ 1]  158     mov farptr+1,acc16 
      00AE13 13 5D 26 10 1E   [ 1]  159     mov farptr+2,acc8 
      00AE18 03 CF 00         [ 4]  160     call read_integer 
      00AE1B 05 E6 02         [ 1]  161     ld a,acc24 
      00AE1E C7 00 04         [ 2]  162     ldw x,acc16 
      00AE21 1E 05 CF 00 01   [ 1]  163     mov acc24,farptr 
      00AE26 81 00 19 00 0D   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
Hexadecimal [24-Bits]



      00AE27 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00AE27 85 5B 04         [ 4]  166     call div24 
      00AE2A 72               [ 1]  167     push a 
      00AE2B 5A               [ 2]  168     pushw x 
      00AE2C 00 20 FC         [ 4]  169     call prt_acc24 
      00AE2F A6 20            [ 1]  170     ld a,#SPACE 
      00AE2F AE 50 00         [ 4]  171     call putc 
      00AE32 4F               [ 2]  172     popw x
      00AE33 81 00 0D         [ 2]  173     ldw acc16,x  
      00AE34 32 00 0C         [ 1]  174     pop acc24 
      00AE34 AE 50 05         [ 4]  175     call prt_acc24
      00AE37 4F 81            [ 2]  176     jra 6$
      00AE39                        177     _drop VSIZE 
      00AE39 AE 50            [ 2]    1     addw sp,#VSIZE 
      00AE3B 0A               [ 4]  178     ret 
                                    179 
                                    180 
      0035AA                        181 read_integer:
      00AE3C 4F 81            [ 1]  182     ld a,#'? 
      00AE3E CD 09 44         [ 4]  183     call putc  
      00AE3E AE 50 0F 4F      [ 1]  184 	clr count  
      00AE42 81 0A A6         [ 4]  185 	call readln 
      00AE43 AE 16 68         [ 2]  186 	ldw x,#tib 
      00AE43 AE 50 14         [ 1]  187 	push count
      00AE46 4F 81            [ 1]  188 	push #0 
      00AE48 72 FB 01         [ 2]  189 	addw x,(1,sp)
      00AE48 AE               [ 1]  190 	incw x 
      0035C2                        191 	_drop 2 
      00AE49 50 19            [ 2]    1     addw sp,#2 
      00AE4B 4F 81 00 01      [ 1]  192 	clr in 
      00AE4D CD 0F 1F         [ 4]  193 	call get_token
      00AE4D AE 50            [ 1]  194 	cp a,#TK_INTGR
      00AE4F 1E 4F            [ 1]  195 	jreq 3$ 
      00AE51 81 11            [ 1]  196 	cp a,#TK_MINUS
      00AE52 CD 0F 1F         [ 4]  197 	call get_token 
      00AE52 AE 50            [ 1]  198 	cp a,#TK_INTGR 
      00AE54 23 4F            [ 1]  199 	jreq 2$
      00AE56 81 16 A0         [ 2]  200 	jp syntax_error
      00AE57                        201 2$:
      00AE57 AE 50 28         [ 4]  202 	call neg_acc24  	
      0035DE                        203 3$: 
      00AE5A 4F               [ 4]  204     ret 
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
      003600                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003600                         30 app_space::
      00AE5B 81 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AE5C 00 00                   32 app_size: .word 0 
      003604                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        00336B R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003361 R
    ADCON_ID=  000002     |   4 ADCREAD    003355 R   |     ADCREAD_=  000004 
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
  4 AND        002FA9 R   |     AND_IDX =  000006     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        00334D R
    ASC_IDX =  000008     |     ATTRIB  =  000002     |   4 AUTO_RUN   000157 R
  4 AWU        003345 R   |   4 AWUHandl   000004 R   |     AWU_APR =  0050F1 
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
    BINARY  =  000001     |   4 BIT        00333D R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BIT_IDX =  00000C     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  00000D 
  4 BRES       003334 R   |     BRES_IDX=  00000E     |     BS      =  000008 
  4 BSET       00332B R   |     BSET_IDX=  000010     |     BSIZE   =  000006 
  4 BTEST      003321 R   |     BTEST_ID=  000012     |   4 BTOGL      003317 R
    BTOGL_ID=  000014     |     BTW     =  000001     |     BUFPTR  =  000003 
  4 BYE        00330F R   |     BYE_IDX =  000016     |     C       =  000001 
    CAN     =  000018     |   4 CANT_DO    0027D7 R   |     CAN_DGR =  005426 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       003306 R
    CHAR_IDX=  000018     |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
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
    CNT_LO  =  000004     |     COMMA   =  00002C     |     COND    =  000001 
  4 CONST      0032FC R   |   4 CONST_CO   001C95 R   |     CONST_ID=  0000C4 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CRH        0032F4 R   |     CRH_IDX =  00001A     |   4 CRL        0032EC R
    CRL_IDX =  00001C     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  4 DATA       0032E3 R   |     DATA_IDX=  00001E     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        0032DB R   |     DDR_IDX =  000020 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        0032D3 R   |     DEC_IDX =  000022     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         0032CC R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000024     |   4 DREAD      0032C2 R
    DREAD_ID=  000026     |   4 DWRITE     0032B7 R   |     DWRITE_I=  000028 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       0032AE R   |     EDIT_IDX=  00002A     |   4 EEFREE     0032A3 R
    EEFREE_I=  0000C6     |   4 EEPROM     003298 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002C     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        003290 R
    END_IDX =  00002E     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003286 R   |     ERASE_ID=  000030 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       00327D R   |     FCPU_IDX=  000032     |     FF      =  00000C 
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
  4 FLASH_ME   001E38 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        003275 R   |     FOR_IDX =  000036 
  4 FREE       00326C R   |     FREE_IDX=  000094     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_CFUNC =  000080     |     F_CMD   =  000000 
    F_CONST =  0000C0     |     F_IFUNC =  000040     |   4 GET        003264 R
    GET_IDX =  0000C2     |   4 GOSUB      00325A R   |     GOSUB_ID=  000038 
  4 GOTO       003251 R   |     GOTO_IDX=  00003A     |   4 GPIO       003248 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003C 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        003240 R   |     HEX_IDX =  00003E     |     HOME    =  000082 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   4 IDR        003238 R   |     IDR_IDX =  000040 
  4 IF         003231 R   |     IF_IDX  =  000042     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   4 INPUT      003227 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000044     |     INPUT_PU=  000001     |     INT24   =  000005 
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
    INT_VECT=  008058     |   4 INVERT     00321C R   |     INVERT_I=  000046 
    INW     =  00000B     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   4 IWDGEN     003211 R   |     IWDGEN_I=  000048 
  4 IWDGREF    003205 R   |     IWDGREF_=  00004A     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0031FD R   |     KEY_END =  000083     |     KEY_IDX =  00004C 
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000002 
  4 LET        0031F5 R   |     LET_IDX =  00004E     |     LF      =  00000A 
    LIMIT   =  000001     |     LINENO  =  000005     |   4 LINK    =  00336B R
  4 LIST       0031EC R   |     LIST_IDX=  000050     |     LL      =  000001 
    LLEN    =  000002     |     LL_HB   =  000001     |     LN_PTR  =  000005 
  4 LOG        0031E4 R   |     LOG_IDX =  000052     |     LOOP_CNT=  002710 
  4 LSHIFT     0031D9 R   |     LSHIFT_I=  000054     |     MAJOR   =  000002 
    MASK    =  000002     |     MAX_LINE=  007FFF     |     MINOR   =  000000 
    MULOP   =  000001     |     N1      =  000004     |     N2      =  000007 
    NAFR    =  004804     |     NAK     =  000015     |     NAME    =  000002 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        0031D1 R   |     NEW_IDX =  000058     |   4 NEXT       0031C8 R
    NEXT_IDX=  000056     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
  4 NOT        0031C0 R   |     NOT_IDX =  00005A     |   4 NOT_SAVE   001F2A R
  4 NO_APP     002819 R   |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        0031B8 R
    ODR_IDX =  00005C     |   4 ON         0031B1 R   |     ONOFF   =  000003 
    ON_IDX  =  0000C0     |     OP      =  000001     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OP_LINK =  002FA9 R   |   4 OR         002FA2 R   |     OR_IDX  =  00005E 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        0031A9 R   |     PAD_IDX =  000060 
    PAD_SIZE=  000080     |   4 PAUSE      00319F R   |     PAUSE_ID=  000062 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       003196 R   |     PEEK_IDX=  000066 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       00318D R
    PINP_IDX=  000068     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      003183 R
    PMODE_ID=  000064     |   4 POKE       00317A R   |     POKE_IDX=  00006A 
  4 PORTA      00315D R   |   4 PORTB      003153 R   |   4 PORTC      003149 R
  4 PORTD      00313F R   |   4 PORTE      003135 R   |   4 PORTF      00312B R
  4 PORTG      003121 R   |   4 PORTH      003117 R   |   4 PORTI      00310D R
  4 POUT       003171 R   |     POUT_IDX=  00006C     |     PREV    =  000001 
  4 PRINT      003167 R   |     PROD    =  000001     |     PROD_SIG=  00000A 
  4 PROG_ADD   001E0E R   |   4 PROG_SIZ   001E20 R   |     PRTA_IDX=  000070 
    PRTB_IDX=  000072     |     PRTC_IDX=  000074     |     PRTD_IDX=  000076 
    PRTE_IDX=  000078     |     PRTF_IDX=  00007A     |     PRTG_IDX=  00007C 
    PRTH_IDX=  00007E     |     PRTI_IDX=  000080     |     PRT_IDX =  00006E 
    PSIZE   =  000001     |     PSTR    =  000003     |   4 QKEY       003104 R
    QKEY_IDX=  000082     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001E49 R   |     RAM_SIZE=  001800 
    RBT_IDX =  000086     |   4 READ       0030FB R   |     READ_IDX=  000084 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 REBOOT     0030F0 R   |     RECLEN  =  000005     |   4 REG_A      000562 R
  4 REG_CC     000566 R   |   4 REG_EPC    000555 R   |   4 REG_SP     00056B R
  4 REG_X      00055E R   |   4 REG_Y      00055A R   |     RELOP   =  000001 
  4 REM        0030E8 R   |     REM_IDX =  000088     |   4 RESTORE    0030DC R
    REST_IDX=  00008A     |     RETL1   =  000001     |   4 RETURN     0030D1 R
    RET_ADDR=  000003     |     RET_BPTR=  000003     |     RET_IDX =  00008C 
    RET_INW =  000005     |   4 RND        0030C9 R   |     RND_IDX =  00008E 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     0030BE R
    RSHIFT_I=  000090     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        0030B6 R   |     RUN_IDX =  000092     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       0030AD R
    SAVE_IDX=  000034     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   0027D5 R   |   4 SIZE       0030A4 R
    SIZE_IDX=  0000BE     |     SKIP    =  000005     |   4 SLEEP      00309A R
    SLEEP_ID=  000096     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      003090 R   |     SPIEN_ID=  00009A 
  4 SPIRD      003086 R   |     SPIRD_ID=  000098     |   4 SPISEL     00307B R
    SPISEL_I=  00009C     |   4 SPIWR      003071 R   |     SPIWR_ID=  00009E 
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
  4 STEP       003068 R   |     STEP_IDX=  0000A0     |   4 STOP       00305F R
    STOP_IDX=  0000A2     |     STR     =  000003     |   4 STR_BYTE   001E31 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TARGET  =  000001     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      003055 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    003049 R
  4 TIMER      00303F R   |     TIMER_ID=  0000A6     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_AND  =  000087     |     TK_ARRAY=  000005 
    TK_CFUNC=  000082     |     TK_CHAR =  000004     |     TK_CMD  =  000080 
    TK_COLON=  00000A     |     TK_COMMA=  000008     |     TK_CONST=  000083 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FLOAT=  000086 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000081     |     TK_INTGR=  000084 
    TK_LABEL=  000003     |     TK_LE   =  000036     |     TK_LPARE=  000006 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_OR   =  000088     |     TK_PLUS =  000010     |     TK_QSTR =  000002 
    TK_RPARE=  000007     |     TK_SHARP=  000009     |     TK_VAR  =  000085 
    TK_XOR  =  000089     |     TMROUT_I=  0000A8     |   4 TO         003038 R
  4 TONE       00302F R   |     TONE_IDX=  0000AC     |     TOWRITE =  000005 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    UBC     =  004801     |   4 UBOUND     003024 R   |     UBOUND_I=  0000AE 
  4 UBTN_Han   000068 R   |   4 UFLASH     003019 R   |     UFLASH_I=  0000B0 
  4 UNTIL      00300F R   |     UNTIL_ID=  0000B2     |     UPDATE  =  000006 
    US      =  00001F     |   4 USER_ABO   000070 R   |   4 USR        003007 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000B4     |   4 Uart1RxH   0008D2 R   |   4 UserButt   000044 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VSISE   =  000003 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002FFE R
    WAIT_IDX=  0000B6     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002FF4 R   |     WORDS_ID=  0000B8     |   4 WRITE      002FEA R
    WRITE_ID=  0000BA     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002F9A R   |     XOR_IDX =  0000BC 
    XSAVE   =  000004     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        0029EB R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000C0D R   |   4 add24      00016A R   |   4 add_char   001392 R
  4 add_spac   00116F R   |   4 analog_r   002590 R   |   4 app        003604 R
  4 app_sign   003600 R   |   4 app_size   003602 R   |   4 app_spac   003600 GR
  4 arduino_   002B69 R   |   4 arg_list   001961 R   |   5 array_si   000020 R
  4 ascii      002889 R   |   4 at_tst     000FD9 R   |   4 atoi24     001898 GR
  4 atoi_exi   0018FE R   |   4 awu        002992 R   |   4 awu02      0029A5 R
  4 bad_port   002904 R   |   5 base       00000A GR  |   5 basicptr   000004 GR
  4 beep       002509 R   |   4 beep_1kh   0024E0 GR  |   4 bin_exit   000E49 R
  4 bit_and    002A02 R   |   4 bit_or     002A2F R   |   4 bit_rese   002107 R
  4 bit_set    0020E5 R   |   4 bit_test   00214C R   |   4 bit_togg   00212A R
  4 bit_xor    002A61 R   |   4 bitmask    002D36 R   |   4 bkslsh_t   000F86 R
  4 bksp       0009AB R   |   2 block_bu   0016B8 GR  |   4 block_er   0007C0 R
  4 break_po   00267C R   |   4 bye        00295D R   |   4 char       002872 R
  4 clear_ba   0014FC R   |   4 clear_bl   00272C R   |   4 clear_va   001454 R
  4 clock_in   00008B R   |   4 cloop_1    001D3E R   |   4 cmd_cons   001D18 R
  4 cmd_end    0024AC R   |   4 cmd_get    0024B3 R   |   4 cmd_itf    000570 R
  4 cmd_line   00172F R   |   4 cmd_name   0013B2 R   |   4 cmd_on     002366 R
  4 cmd_size   001BB5 R   |   4 code_add   003371 GR  |   4 cold_sta   0000C3 R
  4 colon_ts   000FAD R   |   4 comma_ts   000FB8 R   |   4 comp_msg   00167F R
  4 compile    0010DE GR  |   4 conditio   001B0A R   |   4 const_cr   002DEB R
  4 const_cr   002DF0 R   |   4 const_dd   002DE6 R   |   4 const_ee   002DFF R
  4 const_id   002DE1 R   |   4 const_in   002DFA R   |   4 const_lo   001D39 R
  4 const_od   002DDC R   |   4 const_ou   002DF5 R   |   4 const_po   002DAF R
  4 const_po   002DB4 R   |   4 const_po   002DB9 R   |   4 const_po   002DBE R
  4 const_po   002DC3 R   |   4 const_po   002DC8 R   |   4 const_po   002DCD R
  4 const_po   002DD2 R   |   4 const_po   002DD7 R   |   4 convert_   000DB7 R
  4 convert_   00096F R   |   4 copy_com   00100E R   |   5 count      000003 GR
  4 cp24       0001A4 R   |   4 cp24_ax    0001D6 R   |   4 cp_loop    001910 R
  4 cpl24      0001E6 R   |   4 cpy_cmd_   00115A R   |   4 cpy_quot   001197 R
  4 create_g   000CE1 R   |   4 cs_high    002F8E R   |   4 dash_tst   000FCE R
  4 data       002E04 R   |   5 data_len   000009 R   |   4 data_lin   002E13 R
  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 data_sea   002E5F R
  4 dec_base   001B94 R   |   4 decomp_l   001250 R   |   4 decompil   001208 GR
  4 del_line   000CB4 R   |   4 delete_l   000A98 R   |   4 delete_n   0009BB R
  4 delete_u   000A5D R   |   4 digital_   0025CC R   |   4 digital_   002603 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
Hexadecimal [24-Bits]

Symbol Table

  4 div24      000327 R   |   4 divu24_8   000309 R   |   4 do_loop    002D72 R
  4 do_progr   0007B3 R   |   4 edit       001EFD R   |   4 enable_i   002CC6 R
  4 eql_tst    001063 R   |   4 equal      0013A5 R   |   4 erase      0026A4 R
  4 erase_ex   0007E4 R   |   4 erase_fl   0007DA R   |   4 err_bad_   0015E0 R
  4 err_buf_   001656 R   |   4 err_cmd_   0015A4 R   |   4 err_div0   001569 R
  4 err_dupl   0015BE R   |   4 err_math   001550 R   |   4 err_mem_   001535 R
  4 err_msg    001513 R   |   4 err_no_a   0015EC R   |   4 err_no_d   00161F R
  4 err_no_f   001643 R   |   4 err_no_l   001578 R   |   4 err_no_p   00162F R
  4 err_not_   0015CF R   |   4 err_over   001663 R   |   4 err_run_   00158E R
  4 err_synt   001542 R   |   4 escaped    000DCC GR  |   4 expect     00194F R
  4 expr_exi   001AB1 R   |   4 expressi   001A81 R   |   4 factor     0019BE R
  5 farptr     000018 R   |   4 fcpu       002AED R   |   4 fetchc     000660 R
  4 fill_wri   00271C R   |   4 final_te   000C06 R   |   4 first_li   001EA7 R
  5 flags      000022 GR  |   4 for        0021D6 R   |   4 free       001B99 R
  5 free_eep   000024 R   |   7 free_ram   000080 R   |   4 func_arg   00195C R
  4 func_eef   001CAB R   |   4 func_not   002CA7 R   |   4 ge         0013A7 R
  4 get_addr   0017D6 R   |   4 get_arra   00198E R   |   4 get_char   0017F0 R
  4 get_cmd_   0011E7 R   |   4 get_code   0017BA R   |   4 get_cons   001C30 R
  4 get_esca   00097B R   |   4 get_int2   0017E0 R   |   4 get_targ   0022F7 R
  4 get_targ   002305 R   |   4 get_tick   0029E4 R   |   4 get_toke   000F1F GR
  4 getc       000954 GR  |   4 gosub      00240C R   |   4 gosub_1    002417 R
  4 gosub_2    00241D R   |   4 goto       0023F2 R   |   4 goto_1     0023FC R
  4 gpio       0028D9 R   |   4 gt         0013A3 R   |   4 gt_tst     00106E R
  4 hex_base   001B8F R   |   4 hex_dump   0006A0 R   |   4 if         0021C5 R
  5 in         000001 GR  |   5 in.saved   000002 GR  |   5 in.w       000000 GR
  4 incr_far   0008B6 R   |   4 input_ex   00209D R   |   4 input_lo   002009 R
  4 input_va   002005 R   |   4 insert_c   000A1A R   |   4 insert_l   000D0D R
  4 insert_l   000D7C R   |   4 interp_l   001770 R   |   4 interpre   00174B R
  4 invalid    0005B5 R   |   4 invalid_   000636 R   |   4 invert     002D5C R
  4 is_alnum   000E7E GR  |   4 is_alpha   000E64 GR  |   4 is_data_   002E0A R
  4 is_digit   000E75 GR  |   4 is_symbo   000E87 R   |   4 itoa       001833 GR
  4 itoa_loo   001855 R   |   4 jp_to_ta   0023FF R   |   4 key        0028C8 R
  4 kword_di   003369 GR  |   4 kword_en   002FE8 R   |   4 le         0013AC R
  4 ledoff     00046B R   |   4 ledon      000466 R   |   4 ledtoggl   000470 R
  4 left_par   000479 R   |   4 let        001BED GR  |   4 let_arra   001BFB R
  4 let_eval   001C03 R   |   4 let_var    001C00 R   |   4 lines_sk   001EAA R
  4 list       001E58 R   |   4 list_con   001C3F R   |   4 list_exi   001EEC R
  4 list_loo   001ECA R   |   4 log2       002D09 R   |   4 logical_   002CBA R
  4 look_tar   002328 R   |   4 loop_bac   0022DA R   |   5 loop_dep   00001F R
  4 loop_don   0022EF R   |   4 lshift     002A93 R   |   4 lt         0013AA R
  4 lt_tst     001097 R   |   4 mem_peek   0005D2 R   |   4 mod24      0003D5 R
  4 move       001410 GR  |   4 move_dow   00142F R   |   4 move_era   000742 R
  4 move_exi   001450 R   |   4 move_lef   0009F2 R   |   4 move_loo   001434 R
  4 move_prg   000782 R   |   4 move_rig   000A00 R   |   4 move_up    001421 R
  4 mul24      00025D R   |   4 mul_char   001394 R   |   4 mulu24_8   00022A R
  4 nbr_tst    000F52 R   |   4 ne         0013AF R   |   4 neg24      0001F3 R
  4 neg_acc2   00020D R   |   4 neg_ax     000205 R   |   4 new        00269A R
  4 next       002282 R   |   4 next_lin   001753 R   |   4 next_tok   0017A1 GR
  4 no_match   001922 R   |   4 number     000666 R   |   4 op_dict    002FA7 R
  4 op_end     002F98 R   |   4 other      0010C0 R   |   4 overwrit   000C32 R
  2 pad        0016B8 GR  |   4 pad_ref    002F93 R   |   4 parse_bi   000E27 R
  4 parse_in   000DD4 R   |   4 parse_ke   000EAA R   |   4 parse_qu   000D7F R
  4 parse_sy   000E92 R   |   4 pause      002971 R   |   4 pause02    002984 R
  4 peek       0021A4 R   |   4 peek_byt   000600 R   |   4 pin_mode   002AFC R
  4 plus_tst   001037 R   |   4 poke       002183 R   |   4 power_ad   002540 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
Hexadecimal [24-Bits]

Symbol Table

  4 prcnt_ts   001058 R   |   4 print      001F65 R   |   4 print_ex   001FD9 R
  4 print_fa   000645 R   |   4 print_he   000C67 GR  |   4 print_re   0004C5 R
  4 print_st   0005C5 R   |   4 print_to   00181B R   |   4 prog_siz   001DC7 R
  4 program_   001DCF R   |   4 program_   00075C R   |   4 program_   000782 R
  4 prt_acc2   00180D R   |   4 prt_basi   001F41 R   |   4 prt_i16    0017F6 R
  4 prt_loop   001F69 R   |   4 prt_peek   000448 GR  |   4 prt_reg1   0004A6 R
  4 prt_reg8   000484 R   |   4 prt_regs   0003DE GR  |   5 ptr16      000019 GR
  5 ptr8       00001A R   |   4 putc       000944 GR  |   4 puts       0009A1 GR
  4 qgetc      00094D GR  |   4 qkey       0028CC GR  |   4 qmark_ts   000FE4 R
  4 qsign      002715 R   |   4 random     002B89 R   |   4 read       002E80 R
  4 read01     002E82 R   |   4 read_int   0035AA R   |   4 readln     000AA6 GR
  4 readln_l   000AB3 R   |   4 readln_q   000C4F R   |   4 refresh_   002D04 R
  4 regs_sta   000421 R   |   4 rel_exit   001B07 R   |   4 relation   001AB4 R
  4 relop_st   001397 R   |   4 remark     0020A2 GR  |   4 repl       00057E R
  4 repl_exi   0005A6 R   |   4 reset_co   001F67 R   |   4 rest_con   001FF5 R
  4 restore    002E39 R   |   4 restore_   002E7B R   |   4 return     002432 R
  4 right_al   001185 GR  |   4 row_alig   00089B R   |   4 row_eras   000715 R
  4 row_eras   000742 R   |   4 row_loop   000683 R   |   4 rparnt_t   000FA2 R
  4 rshift     002AC0 R   |   7 rsign      00007C R   |   7 rsize      00007E R
  4 rt_msg     00166D R   |   4 run        002450 R   |   4 run_app    000135 R
  4 run_it     002482 R   |   4 run_it_0   002484 R   |   5 rx1_head   00002E R
  5 rx1_queu   000026 R   |   5 rx1_tail   00002F R   |   4 save_app   002740 R
  4 save_con   001FE5 R   |   4 scan_blo   0008C4 R   |   4 search_c   001CD4 R
  4 search_d   001902 GR  |   4 search_e   00194C R   |   4 search_l   000C89 GR
  4 search_l   000C98 R   |   4 search_n   001906 R   |   4 search_o   002FAF R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002B59 R
  4 send_esc   0009C9 R   |   4 send_par   0009D4 R   |   4 set_data   002E28 R
  4 set_time   002C8A R   |   4 sharp_ts   000FC3 R   |   4 show_row   000671 R
  4 single_c   00138D R   |   4 skip       000F0C R   |   4 skip_2_b   0017BE R
  4 skip_str   0017C7 R   |   4 slash_ts   00104D R   |   4 sleep      002966 R
  4 software   001463 R   |   4 spaces     000A0E GR  |   4 spi_clea   002F28 R
  4 spi_disa   002F10 R   |   4 spi_enab   002EDD R   |   4 spi_rcv_   002F4A R
  4 spi_read   002F75 R   |   4 spi_sele   002F7C R   |   4 spi_send   002F34 R
  4 spi_writ   002F55 R   |   2 stack_fu   001774 GR  |   2 stack_un   001800 R
  4 star_tst   001042 R   |   4 step       002240 R   |   4 stop       00264E R
  4 store_lo   00226F R   |   4 str_matc   00192F R   |   4 str_tst    000F42 R
  4 strcmp     0013EF R   |   4 strcpy     001400 GR  |   4 strlen     0013E4 GR
  4 sub24      000187 R   |   4 symb_loo   000E93 R   |   4 syntax_e   0016A0 GR
  4 system_i   0014A9 R   |   5 tab_widt   000023 GR  |   4 tb_error   0016A2 GR
  4 term       001A47 R   |   4 term01     001A4C R   |   4 term_exi   001A7E R
  4 test       00343B R   |   4 test_p     0005BD R   |   2 tib        001668 GR
  4 tick_tst   000FFC R   |   5 ticks      00000F R   |   4 timeout    002CA1 R
  5 timer      000012 GR  |   4 timer2_i   0000A1 R   |   4 timer4_i   0000AE R
  4 tk_id      001690 R   |   4 to         002200 R   |   4 to_eepro   0007AB R
  4 to_flash   0007B0 R   |   4 to_hex_c   000C7E GR  |   4 to_upper   00188C GR
  4 token_ch   0010D7 R   |   4 token_ex   0010DB R   |   4 tone       0024E9 R
  4 try_next   002E6B R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   000954 GR  |   4 uart1_in   0008FF R   |   4 uart1_pu   000944 GR
  4 uart1_qg   00094D GR  |   4 uart1_se   00090F R   |   4 ubound     001BE2 R
  4 uflash     002909 R   |   4 unlock_e   0006DF R   |   4 unlock_f   0006FA R
  4 until      002D85 R   |   4 user_int   000057 R   |   4 usr        00291E R
  4 var_name   0011DD GR  |   5 vars       000030 GR  |   4 wait       0020A8 R
  4 warm_ini   0014DA R   |   4 warm_sta   00172C R   |   4 words      002C24 R
  4 words_co   002C74 R   |   4 write      00282F R   |   4 write_bl   000860 GR
  4 write_bu   00079C R   |   4 write_by   0007E6 R   |   4 write_ee   000822 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

  4 write_ex   00085B R   |   4 write_fl   00080C R   |   4 write_nb   000885 R
  2 xstack_f   001738 GR  |   2 xstack_u   001774 GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
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

