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
      0080DF CC 97 90         [ 2]  169 5$:	jp warm_start
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
      008190 CD 9D A0         [ 4]  270 	call func_eefree 
      008193 CD 9D 41         [ 4]  271 	call ubound 
      008196 CD 95 1E         [ 4]  272 	call clear_basic
      008199 CD A6 20         [ 4]  273 	call beep_1khz  
      00819C CD 94 CB         [ 4]  274 	call system_information
      00819F                        275 2$:	
                                    276 ; check for autorun application
      00819F CE 40 00         [ 2]  277 	ldw x,EEPROM_BASE 
      0081A2 C3 B2 27         [ 2]  278 	cpw x,AR_SIGN 
      0081A5 27 03            [ 1]  279 	jreq run_app
      0081A7 CC 97 90         [ 2]  280 	jp warm_start 
      0081AA                        281 run_app:
      0081AA 4F               [ 1]  282 	clr a 
      0081AB CE 40 02         [ 2]  283 	ldw x,EEPROM_BASE+2
      0081AE CD A5 4D         [ 4]  284 	call is_program_addr 
      0081B1 27 03            [ 1]  285 	jreq 1$
      0081B3 CC 97 90         [ 2]  286 	jp warm_start
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
      0081D4 CD 9E C2         [ 4]  299 	call program_info 
      0081D7 CC A5 BB         [ 2]  300 	jp run_it_02  
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
      0082F0 97 06 03         [ 4]  240     call neg24
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
      008368 06 05            [ 1]  346     jrne 1$ 
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
      0083AC 06 01            [ 1]  385     sbc a,(DIVISOR,sp)
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
      0083E2 CD 18 30         [ 4]   51 	call prt_i16  
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
      008417 CD 18 30         [ 4]  107 	call prt_i16  
      008417 0D 06 27         [ 4]  108 	call left_paren 
      00841A 03               [ 1]  109 	pop a 
      00841B CD               [ 1]  110 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00841C 82               [ 1]  111 	ld xl,a 
      00841D 95 5B 06 81      [ 1]  112 	mov base,#10 
      008421 CD 18 30         [ 4]  113 	call prt_i16  
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
      008431 B0 A6 3A         [ 4]  132 	call left_paren 
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
      008445 98 B0            [ 1]  155 	ld (R_A,sp),a 
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
      008474 B0 CD            [ 1]  183 	ld a, (R_CC,sp) 
      008476 84 5B 84         [ 4]  184 	call prt_reg8 
                                    185 ; print SP 
      008479 5F 97 35         [ 2]  186 	ldw x,#REG_SP
      00847C 0A 00            [ 1]  187 	ldw y,sp 
      00847E 0B CD 98 B0      [ 2]  188 	addw y,#(VSIZE+3)
      008482 A6 29 CD         [ 4]  189 	call prt_reg16  
      008485 89 7F            [ 1]  190 	ld a,#'\n' 
      008487 81 08 FF         [ 4]  191 	call putc
      008488 7B 08            [ 1]  192 	ld a,(SAV_ACC24,sp)
      008488 90 89            [ 2]  193 	ldw x,(SAV_ACC16,sp)
      00848A CD 89 DC         [ 1]  194 	ld acc24,a 
      00848D 1E 01 35         [ 2]  195 	ldw acc16,x 
      008490 10 00            [ 1]  196 	ld a,(R_A,sp)
      008492 0B CD            [ 2]  197 	ldw x,(R_X,sp)
      008494 98 B0            [ 2]  198 	ldw y,(R_Y,sp)
      00048D                        199 	_drop VSIZE
      008496 CD 84            [ 2]    1     addw sp,#VSIZE 
      008498 5B               [ 1]  200 	pop cc   	
      008499 85               [ 4]  201 	ret
                                    202 
      00849A 35 0A 00 0B CD 98 B0   203 STATES:  .asciz "\nRegisters state at break point.\n--------------------------\n"
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
      00857B 99 52            [ 1]  320 	ld (PSIZE,sp),a 
      00857D 81               [ 1]  321 	clrw x 
      00857E CD 06 05         [ 4]  322 1$:	call fetchc  
      00857E 8A               [ 2]  323 	pushw x 
      00857F 52 0B 6B         [ 1]  324 	ld acc8,a 
      008582 01               [ 1]  325 	clrw x 
      008583 C6 00 04         [ 2]  326 	ldw acc24,x 
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
      0085C8 CD 99 46         [ 4]  385 	call get_token
      0085CB A1 51            [ 1]  386 	cp a,#TK_INTGR
      0085CD 26 26            [ 1]  387 	jreq 1$
      0085CF CC 16 84         [ 2]  388 	jp syntax_error
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
      0085DD 04 7B            [ 1]  413 	ld a,#SPACE  
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
      008639 90 CD 98 C7      [ 1]   49 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
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
      008678 10 CD 98 C7      [ 1]   87 	ldf ([farptr],y),a
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
      008691 03 CC 97 04      [ 2]  104 	ldw y,#row_erase 
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
      0086A2 B0 A6            [ 1]  130 	clrw y 
      0086A4 20               [ 1]  131 1$:	ld a,(x)
      0086A5 CD 89 7F 18      [ 1]  132 	ldf ([farptr],y),a
      0086A8 5C               [ 1]  133 	incw x 
      0086A8 1E 02            [ 1]  134 	incw y 
      0086AA F6 5F            [ 1]  135 	dec (BCNT,sp)
      0086AC 97 CD            [ 1]  136 	jrne 1$
                                    137 ; wait EOP bit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0086AE 98 B0 1E 02 5C   [ 2]  138 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,. ; wait end of operation 
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
      0087CB A3 B8 00         [ 2]  384 	ldw farptr+1,x  	
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
      0087EF B8 00            [ 1]   75 	jrne 3$
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
      00881F B8 00 24 0E      [ 1]  112 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
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
      008936 CD A9 15         [ 4]  440     call puts 
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
      008B6C 07 CD 99 52      [ 2]   98 	ldw txtend,y  
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
      008B8A 00 04            [ 2]  127 	ldw x,(DEST,sp) 
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
      008C26 A6 20            [ 1]  254 	jreq 1$
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
      008C83 F0 18 D2         [ 4]  337 	call atoi24
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
      008C97 00 04            [ 1]  365 	push #0
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
      008D8E 55 00 01 00 02   [ 1]  620 	mov in.saved,in 
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
      008E28 46 6B            [ 1]    2 	cp a,(TCHAR,sp) 
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
      008E49 52 16            [ 1]    1 	ld a,#TICK 
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
      008ECD 46 F7 5C         [ 4]  775 	ld a,([in.w],y)
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
      008EF4 1C 00 35         [ 4]  794 	call parse_keyword
      008EF7 A6 85 20         [ 2]  795 	cpw x,#remark 
      008EFA 36 08            [ 1]  796 	jrne token_exit 
      008EFB 93               [ 1]  797 	ldw x,y 
      008EFB AE B5 F7         [ 2]  798 	jp copy_comment 
      00108F                        799 token_char:
      008EFE 16               [ 1]  800 	ld (x),a 
      008EFF 01               [ 1]  801 	incw x
      008F00 90 5C            [ 1]  802 	ldw y,x 
      001093                        803 token_exit:
      001093                        804 	_drop VSIZE 
      008F02 CD 99            [ 2]    1     addw sp,#VSIZE 
      008F04 D3               [ 4]  805 	ret
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
      008F3D A3 9D 4C 27      [ 2]  855 	subw y,#pad
      008F41 0A 90            [ 1]  856     ld a,yl
      008F43 F7 90 5C         [ 2]  857 	ldw x,#pad 
      008F46 90 FF 72         [ 2]  858 	ldw ptr16,x 
      008F49 A9 00            [ 1]  859 	ld (2,x),a 
      008F4B 02               [ 2]  860 	ldw x,(x)
      008F4C 5B 02            [ 1]  861 	jreq 10$
      008F4E 81 0C C9         [ 4]  862 	call insert_line
      008F4F 72 5F 00 03      [ 1]  863 	clr  count 
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
      008F71 03 91            [ 1]   58 	ld (y),a  
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
      008F82 46 6B            [ 1]   79 	cp a,#') 
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
      009034 A0 39 90         [ 4]  239 	call var_name
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
      00904B A1 81            [ 2]  251 	pushw y 
      00904D FF 1C            [ 1]  252 	ld a,#255 ; signed conversion 
      00904F 00 02 6D         [ 4]  253 	call itoa  
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
      00906F 13 21 01         [ 2]  270 	cpw x,#remark 
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
      009101 97 04 32         [ 2]  369 	addw x,#add_char 
      009103 F6               [ 1]  370 	ld a,(x)
      009103 CD 8E            [ 2]  371 	jra 81$
      0012F4                        372 11$:
      009105 E2 A3            [ 1]  373     cp a,#TK_MOD 
      009107 A1 81            [ 1]  374 	jrugt 12$
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



      009142 0A CC 97 06 CF 16 E0   410 relop_str: .word gt,equal,ge,lt,ne,le 
             90 AE 16 E3 90
      00914E A3 17                  411 gt: .asciz ">"
      009150 60 25                  412 equal: .asciz "="
      009152 05 A6 0F               413 ge: .asciz ">="
      009155 CC 97                  414 lt: .asciz "<"
      009157 06 3D 00               415 le: .asciz "<="
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
      009176 00 04            [ 1]  442 	jreq 2$
      009178 20 0F            [ 2]  443 	ldw x,(LINK,sp)
      00917A FE               [ 2]  444 	ldw x,(x) 
      00917A CE 00 1A         [ 2]  445 	subw x,#2  
      00917D CF 00            [ 1]  446 	jrne 1$
      00917F 05               [ 1]  447 	clr a 
      009180 E6               [ 1]  448 	clrw x 
      009181 02 C7            [ 2]  449 	jra 9$
      009183 00 04            [ 2]  450 2$: ldw x,(LINK,sp)
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
      000030                         94 dvar_bgn:: .blkw 1 ; DIM variables start address 
      000032                         95 dvar_end:: .blkw 1 ; DIM variables end address 
                                     96 ; 24 bits integer variables 
      000034                         97 vars:: .blkb 3*26 ; BASIC variables A-Z,
                                     98 
                                     99 	.area BTXT (ABS)
      00008C                        100 	.org 0x8C  
                                    101 ; keep 'free_ram' as last variable 
                                    102 ; basic code compiled here. 
      00008C                        103 rsign: .blkw 1 ; "TB" 
      00008E                        104 rsize: .blkw 1 ; code size 	 
      000090                        105 free_ram: ; from here RAM free for BASIC text 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
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
      001386                        118 strlen::
      009189 5B               [ 2]  119 	pushw x 
      00918A 02               [ 1]  120 	clr a
      00918B 72               [ 1]  121 1$:	tnz (x) 
      00918C 1B 00            [ 1]  122 	jreq 9$ 
      00918E 23               [ 1]  123 	inc a 
      00918F 90               [ 1]  124 	incw x 
      009190 85 81            [ 2]  125 	jra 1$ 
      009192 85               [ 2]  126 9$:	popw x 
      009192 5D               [ 4]  127 	ret 
                                    128 
                                    129 ;------------------------------------
                                    130 ; compare 2 strings
                                    131 ; input:
                                    132 ;   X 		char* first string 
                                    133 ;   Y       char* second string 
                                    134 ; output:
                                    135 ;   A 		0 not == |1 ==  
                                    136 ;-------------------------------------
      001391                        137 strcmp:
      009193 27               [ 1]  138 	ld a,(x)
      009194 14 F6            [ 1]  139 	jreq 5$ 
      009196 5C A4            [ 1]  140 	cp a,(y) 
      009198 0F 88            [ 1]  141 	jrne 4$ 
      00919A 0D               [ 1]  142 	incw x 
      00919B 01 27            [ 1]  143 	incw y 
      00919D 0A F6            [ 2]  144 	jra strcmp 
      00139D                        145 4$: ; not same  
      00919F 90               [ 1]  146 	clr a 
      0091A0 F7               [ 4]  147 	ret 
      00139F                        148 5$: ; same 
      0091A1 5C 90            [ 1]  149 	ld a,#1 
      0091A3 5C               [ 4]  150 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      0013A2                        161 strcpy::
      0091A4 0A               [ 1]  162 	push a 
      0091A5 01               [ 2]  163 	pushw x 
      0091A6 26 F6            [ 1]  164 1$: ld a,(y)
      0091A8 84 06            [ 1]  165 	jreq 9$ 
      0091A9 F7               [ 1]  166 	ld (x),a 
      0091A9 81               [ 1]  167 	incw x 
      0091AA 90 5C            [ 1]  168 	incw y 
      0091AA 90 5A            [ 2]  169 	jra 1$ 
      0091AC 90               [ 1]  170 9$:	clr (x)
      0091AD F6               [ 2]  171 	popw x 
      0091AE 90               [ 1]  172 	pop a 
      0091AF 5C               [ 4]  173 	ret 
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
      0013B2                        187 move::
      0091B0 A1               [ 1]  188 	push a 
      0013B3                        189 	_vars VSIZE 
      0091B1 29 27            [ 2]    1     sub sp,#VSIZE 
      0091B3 05 CD            [ 1]  190 	clr (INCR,sp)
      0091B5 8E B6            [ 1]  191 	clr (LB,sp)
      0091B7 24 06            [ 2]  192 	pushw y 
      0091B9 13 01            [ 2]  193 	cpw x,(1,sp) ; compare DEST to SRC 
      0091B9 A6 20            [ 2]  194 	popw y 
      0091BB 90 F7            [ 1]  195 	jreq move_exit ; x==y 
      0091BD 90 5C            [ 1]  196 	jrmi move_down
      0013C3                        197 move_up: ; start from top address with incr=-1
      0091BF 81 BB 00 0D      [ 2]  198 	addw x,acc16
      0091C0 72 B9 00 0D      [ 2]  199 	addw y,acc16
      0091C0 88 7B            [ 1]  200 	cpl (INCR,sp)
      0091C2 01 C1            [ 1]  201 	cpl (LB,sp)   ; increment = -1 
      0091C4 00 24            [ 2]  202 	jra move_loop  
      0013D1                        203 move_down: ; start from bottom address with incr=1 
      0091C6 2A               [ 2]  204     decw x 
      0091C7 08 A6            [ 2]  205 	decw y
      0091C9 20 5A            [ 1]  206 	inc (LB,sp) ; incr=1 
      0013D6                        207 move_loop:	
      0091CB F7 0C 01         [ 1]  208     ld a, acc16 
      0091CE 20 F1 84         [ 1]  209 	or a, acc8
      0091D1 81 14            [ 1]  210 	jreq move_exit 
      0091D2 72 FB 01         [ 2]  211 	addw x,(INCR,sp)
      0091D2 A6 22 90         [ 2]  212 	addw y,(INCR,sp) 
      0091D5 F7 90            [ 1]  213 	ld a,(y)
      0091D7 5C               [ 1]  214 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      0091D8 89               [ 2]  215 	pushw x 
      0091D9 CD 98 81         [ 2]  216 	ldw x,acc16 
      0091DC 85               [ 2]  217 	decw x 
      0091DD F6 27 30         [ 2]  218 	ldw acc16,x 
      0091E0 5C               [ 2]  219 	popw x 
      0091E1 A1 20            [ 2]  220 	jra move_loop
      0013F2                        221 move_exit:
      0013F2                        222 	_drop VSIZE
      0091E3 25 0E            [ 2]    1     addw sp,#VSIZE 
      0091E5 90               [ 1]  223 	pop a 
      0091E6 F7               [ 4]  224 	ret 	
                                    225 
                                    226 ;------------------------------------
                                    227 ;  set all variables to zero 
                                    228 ; input:
                                    229 ;   none 
                                    230 ; output:
                                    231 ;	none
                                    232 ;------------------------------------
      0013F6                        233 clear_vars:
      0091E7 90               [ 2]  234 	pushw x 
      0091E8 5C               [ 1]  235 	push a  
      0091E9 A1 5C 26         [ 2]  236 	ldw x,#vars 
      0091EC F0 4E            [ 1]  237 	ld a,#CELL_SIZE*26 
      0091ED 7F               [ 1]  238 1$:	clr (x)
      0091ED 90               [ 1]  239 	incw x 
      0091EE F7               [ 1]  240 	dec a 
      0091EF 90 5C            [ 1]  241 	jrne 1$
      0091F1 20               [ 1]  242 	pop a 
      0091F2 EA               [ 2]  243 	popw x 
      0091F3 88               [ 4]  244 	ret 
                                    245 
                                    246 
                                    247 ;-----------------------
                                    248 ;  display system 
                                    249 ;  information 
                                    250 ;-----------------------
                           000002   251 	MAJOR=2
                           000000   252 	MINOR=0 
      0091F4 A6 5C 90 F7 90 5C 84   253 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             A0 07 C7 00 0F 72 5F
             00 0E 89 AE 8E 08 72
             BB 00 0E F6 85 20 DD
             A6 22 90 F7 90 5C 5C
             81 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    254 
      009218                        255 system_information:
      009218 1D 00 35         [ 2]  256 	ldw x,#software 
      00921B A6 03 62         [ 4]  257 	call puts 
      00921E 9F AB            [ 1]  258 	ld a,#MAJOR 
      009220 41 81 0E         [ 1]  259 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



      009222 5F               [ 1]  260 	clrw x 
      009222 52 04 C6         [ 2]  261 	ldw acc24,x
      009225 00 0B 6B 01      [ 1]  262 	clr tab_width  
      009229 C6 00 24 6B      [ 1]  263 	mov base, #10 
      00922D 02 17 03         [ 4]  264 	call prt_acc24 
      009230 72 CE            [ 1]  265 	ld a,#'.
      009232 00 05 35         [ 4]  266 	call putc 
      009235 0A 00            [ 1]  267 	ld a,#MINOR 
      009237 0B 35 05         [ 1]  268 	ld acc8,a 
      00923A 00               [ 1]  269 	clrw x 
      00923B 24 72 5F         [ 2]  270 	ldw acc24,x 
      00923E 00 0D CF         [ 4]  271 	call prt_acc24
      009241 00 0E            [ 1]  272 	ld a,#CR 
      009243 4F CD 98         [ 4]  273 	call putc
                                    274 ;call test 
      009246 ED               [ 4]  275 	ret
                                    276 
      00147C                        277 warm_init:
      009247 CD 91 C0 88      [ 2]  278 	ldw y,#XSTACK_EMPTY  
      00924B 90 93 1E 04      [ 1]  279 	clr flags 
      00924F CD 94 22 90      [ 1]  280 	clr loop_depth 
      009253 5F 84 90 97      [ 1]  281 	mov tab_width,#TAB_WIDTH 
      009257 72 F9 03 A6      [ 1]  282 	mov base,#10 
      00925B 20 90 F7         [ 2]  283 	ldw x,#0 
      00925E 90 5C 72         [ 2]  284 	ldw basicptr,x 
      009261 5F 00 24         [ 2]  285 	ldw in.w,x 
      009264 AE 00 03 CF      [ 1]  286 	clr count
      009268 00               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------
                                    290 ; reset BASIC text variables 
                                    291 ; and clear variables 
                                    292 ;---------------------------
      00149E                        293 clear_basic:
      009269 01               [ 2]  294 	pushw x 
      00926A 72 5F 00 03      [ 1]  295 	clr count
      00926A 90 89 CD 98      [ 1]  296 	clr in  
      00926E 68 90 85         [ 2]  297 	ldw x,#free_ram 
      009271 4D 26 03         [ 2]  298 	ldw txtbgn,x 
      009274 CC 93 97         [ 2]  299 	ldw txtend,x 
      009277 2B 03 CC         [ 2]  300 	ldw dvar_bgn,x 
      00927A 93 08 32         [ 2]  301 	ldw dvar_end,x 
      00927C CD 13 F6         [ 4]  302 	call clear_vars 
      00927C A1               [ 2]  303 	popw x
      00927D 85               [ 4]  304 	ret 
                                    305 
                                    306 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    307 ;;   Tiny BASIC error messages     ;;
                                    308 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0014BB                        309 err_msg:
      00927E 26 0F CD 91 AA CD 98   310 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             90 CD 92 18 90
      00928A F7 90 5C 20 DB 6A 15   311 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             7B 15 8C
      00928F 15 98 15 CB 15 DB 15   312 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



             EF 16 02
      00928F A1 84 26 26 CD 98      313 	.word err_overflow,err_read_only,err_not_program  
                                    314 
      009295 9A C7 00 0D CF 00 0E   315 err_mem_full: .asciz "Memory full\n" 
             CD 91 AA 90 89 A6
      0092A2 FF CD 98 ED 16 01 88   316 err_syntax: .asciz "syntax error\n" 
             51 CD 94 22 90 5F 84
      0092B0 90 97 72 F9 01 5B 02   317 err_math_ovf: .asciz "math operation overflow\n"
             20 B1 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092B9 64 69 76 69 73 69 6F   318 err_div0: .asciz "division by 0\n" 
             6E 20 62 79 20 30 0A
             00
      0092B9 A1 87 24 39 FE 72 5C   319 err_no_line: .asciz "invalid line number.\n"
             00 02 72 5C 00 02 A3
             A1 81 26 23 CE 00 05
             CD
      0092CF 91 AA A6 27 90 F7 90   320 err_run_only: .asciz "run time only usage.\n" 
             5C 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      0092D7 63 6F 6D 6D 61 6E 64   321 err_cmd_only: .asciz "command line only usage.\n"
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73 61
             67 65 2E 0A 00
      0092D7 72 D6 00 01 72 5C 00   322 err_duplicate: .asciz "duplicate name.\n"
             02 90 F7 90 5C C6 00
             02 C1 00
      0092E8 04 2B EC CC 93 97 A3   323 err_not_file: .asciz "File not found.\n"
             9D 4C 26 05 CC 92 6A
             2E 0A 00
      0092F6 62 61 64 20 76 61 6C   324 err_bad_value: .asciz "bad value.\n"
             75 65 2E 0A 00
      0092F6 5F 97 6C 65 20 69 6E   325 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      0092F8 4E 6F 20 64 61 74 61   326 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      0092F8 CD 91 AA 90 89 CD 93   327 err_no_prog: .asciz "No program in RAM!\n"
             D2 90 85 CD 91 92 CC
             92 6A 4D 21 0A 00
      009308 46 69 6C 65 20 73 79   328 err_no_fspace: .asciz "File system full.\n" 
             73 74 65 6D 20 66 75
             6C 6C 2E 0A 00
      009308 A1 03 26 1E A6 20 90   329 err_buf_full: .asciz "Buffer full\n"
             F7 90 5C 6C 0A 00
      009312 6F 76 65 72 66 6C 6F   330 err_overflow: .asciz "overflow\n" 
             77 0A 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      009312 89 CD 98 81 85 61 6E   331 err_read_only: .asciz "constant can't be modified\n"
             74 20 63 61 6E 27 74
             20 62 65 20 6D 6F 64
             69 66 69 65 64 0A 00
      009317 6E 6F 20 70 72 6F 67   332 err_not_program: .asciz "no program at this address\n"
             72 61 6D 20 61 74 20
             74 68 69 73 20 61 64
             64 72 65 73 73 0A 00
                                    333 
                                    334 ;-------------------------------------
      009317 F6 27 07 5C 90 F7 90   335 rt_msg: .asciz "\nrun time error, "
             5C 20 F6 65 72 72 6F
             72 2C 20 00
      009321 0A 63 6F 6D 70 69 6C   336 comp_msg: .asciz "\ncompile error, "
             65 20 65 72 72 6F 72
             2C 20 00
      009321 A6 20 90 F7 90 5C CC   337 tk_id: .asciz "last token id: "
             92 6A 6E 20 69 64 3A
             20 00
                                    338 
      00932A                        339 syntax_error::
      00932A A1 02            [ 1]  340 	ld a,#ERR_SYNTAX 
                                    341 
      001686                        342 tb_error::
      00932C 26 09 CD 91 AA   [ 2]  343 	btjt flags,#FCOMP,1$
      009331 CD               [ 1]  344 	push a 
      009332 91 D2 CC         [ 2]  345 	ldw x, #rt_msg 
      009335 92 6A 5C         [ 4]  346 	call puts 
      009337 84               [ 1]  347 	pop a 
      009337 A1 04 26         [ 2]  348 	ldw x, #err_msg 
      00933A 10 CD 91 AA      [ 1]  349 	clr acc16 
      00933E A6               [ 1]  350 	sll a
      00933F 5C 90 F7 90      [ 1]  351 	rlc acc16  
      009343 5C F6 72         [ 1]  352 	ld acc8, a 
      009346 5C 00 02 20      [ 2]  353 	addw x,acc16 
      00934A 06               [ 2]  354 	ldw x,(x)
      00934B A1 0A 26         [ 4]  355 	call puts
      00934E 09 A6 3A         [ 2]  356 	ldw x,basicptr 
                           000001   357 .if DEBUG 
      009351 C6 00 03         [ 1]  358 ld a,count 
      009351 90 F7            [ 1]  359 clrw y 
      009353 90 5C            [ 1]  360 rlwa y  
      009355 CD 06 45         [ 4]  361 call hex_dump
      009355 CC 92 6A         [ 2]  362 ldw x,basicptr
                                    363 .endif 
      009358 C6 00 01         [ 1]  364 	ld a,in 
      009358 A1 09 22         [ 4]  365 	call prt_basic_line
      00935B 0A A0 05         [ 2]  366 	ldw x,#tk_id 
      00935E 5F 97 1C         [ 4]  367 	call puts 
      009361 93 AD F6         [ 1]  368 	ld a,in.saved 
      009364 20               [ 1]  369 	clrw x 
      009365 EB               [ 1]  370 	ld xl,a 
      009366 72 BB 00 04      [ 2]  371 	addw x,basicptr 
      009366 A1               [ 1]  372 	ld a,(x)
      009367 11               [ 1]  373 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      009368 22               [ 1]  374 	ld xl,a 
      009369 0A A0 10         [ 4]  375 	call prt_i16
      00936C 5F 97            [ 2]  376 	jra 6$
      0016D7                        377 1$:	
      00936E 1C               [ 1]  378 	push a 
      00936F 93 B2 F6         [ 2]  379 	ldw x,#comp_msg
      009372 20 DD 5C         [ 4]  380 	call puts 
      009374 84               [ 1]  381 	pop a 
      009374 A1 22 22         [ 2]  382 	ldw x, #err_msg 
      009377 0A A0 20 5F      [ 1]  383 	clr acc16 
      00937B 97               [ 1]  384 	sll a
      00937C 1C 93 B4 F6      [ 1]  385 	rlc acc16  
      009380 20 CF 0E         [ 1]  386 	ld acc8, a 
      009382 72 BB 00 0D      [ 2]  387 	addw x,acc16 
      009382 A0               [ 2]  388 	ldw x,(x)
      009383 31 48 5F         [ 4]  389 	call puts
      009386 97 1C 93         [ 2]  390 	ldw x,#tib
      009389 B7 FE F6         [ 4]  391 	call puts 
      00938C 5C 90            [ 1]  392 	ld a,#CR 
      00938E F7 90 5C         [ 4]  393 	call putc
      009391 F6 26 BD         [ 2]  394 	ldw x,in.w
      009394 CC 92 6A         [ 4]  395 	call spaces
      009397 A6 5E            [ 1]  396 	ld a,#'^
      009397 90 7F 1E         [ 4]  397 	call putc 
      00939A 03 7B 01         [ 2]  398 6$: ldw x,#STACK_EMPTY 
      00939D C7               [ 1]  399     ldw sp,x
                                    400 
      001710                        401 warm_start:
      00939E 00 0B 7B         [ 4]  402 	call warm_init
                                    403 ;----------------------------
                                    404 ;   BASIC interpreter
                                    405 ;----------------------------
      001713                        406 cmd_line: ; user interface 
      0093A1 02 C7            [ 1]  407 	ld a,#CR 
      0093A3 00 24 72         [ 4]  408 	call putc 
      0093A6 F2 03            [ 1]  409 	ld a,#'> 
      0093A8 90 9F 5B         [ 4]  410 	call putc
      0093AB 04 81 40         [ 4]  411 	call readln
      0093AE 28 29 2C 23      [ 1]  412 	tnz count 
      0093B2 2B 2D            [ 1]  413 	jreq cmd_line
      0093B4 2A 2F 25         [ 4]  414 	call compile
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
      0093B7 93 C3 93 C5      [ 1]  428 	tnz count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      0093BB 93 C7            [ 1]  429 	jreq cmd_line
                                    430 	
                                    431 ; if direct command 
                                    432 ; it's ready to interpret 
                                    433 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    434 ;; This is the interpreter loop
                                    435 ;; for each BASIC code line. 
                                    436 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      00172F                        437 interpreter: 
      0093BD 93 CA 93         [ 1]  438 	ld a,in 
      0093C0 CF 93 CC         [ 1]  439 	cp a,count 
      0093C3 3E 00            [ 1]  440 	jrmi interp_loop
      001737                        441 next_line:
      0093C5 3D 00 3E 3D 00   [ 2]  442 	btjf flags, #FRUN, cmd_line
      0093CA 3C 00 3C         [ 2]  443 	ldw x,basicptr
      0093CD 3D 00 3C 3E      [ 2]  444 	addw x,in.w 
      0093D1 00 00 1D         [ 2]  445 	cpw x,txtend 
      0093D2 2A C8            [ 1]  446 	jrpl warm_start
      0093D2 52 04 72         [ 2]  447 	ldw basicptr,x ; start of next line  
      0093D5 5F 00            [ 1]  448 	ld a,(2,x)
      0093D7 0E 1F 01         [ 1]  449 	ld count,a 
      0093DA AE B5 F5 1F      [ 1]  450 	mov in,#3 ; skip first 3 bytes of line 
      001754                        451 interp_loop:
      0093DE 03 E6 02         [ 4]  452 	call next_token
      0093E1 A4 0F            [ 1]  453 	cp a,#TK_NONE 
      0093E3 C7 00            [ 1]  454 	jreq next_line 
      0093E5 0F 1C            [ 1]  455 	cp a,#TK_CMD
      0093E7 00 03            [ 1]  456 	jrne 1$
      00175F                        457 	_get_code_addr
      0093E9 72               [ 2]    1         ldw x,(x)
      0093EA BB 00 0E FE      [ 1]    2         inc in 
      0093EE 13 01 27 0C      [ 1]    3         inc in 
      0093F2 1E               [ 4]  458 	call(x)
      0093F3 03 FE            [ 2]  459 	jra interp_loop 
      00176B                        460 1$:	 
      0093F5 1D 00            [ 1]  461 	cp a,#TK_VAR
      0093F7 02 26            [ 1]  462 	jrne 2$
      0093F9 E3 4F 5F         [ 4]  463 	call let_var  
      0093FC 20 05            [ 2]  464 	jra interp_loop 
      001774                        465 2$:	
      0093FE 1E 03            [ 1]  466 	cp a,#TK_ARRAY 
      009400 1C 00            [ 1]  467 	jrne 3$
      009402 02 5B 04         [ 4]  468 	call let_array 
      009405 81 D7            [ 2]  469 	jra interp_loop
      000001                        470 3$:	
      000002 A1 03            [ 1]  471 	cp a,#TK_LABEL
      000003 26 05            [ 1]  472 	jrne 4$
      000004 CD 17 8D         [ 4]  473 	call let_dvar  
      000005 20 CE            [ 2]  474 	jra interp_loop 
      000007                        475 4$: 
      000009 A1 0A            [ 1]  476 	cp a,#TK_COLON 
      00000A 27 CA            [ 1]  477 	jreq interp_loop
      00000B CC 16 84         [ 2]  478 5$:	jp syntax_error 
                                    479 
                                    480 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
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
      00000C                        491 let_dvar:
      00000D                        492 	_vars VSIZE 
      00000E 52 04            [ 2]    1     sub sp,#VSIZE 
      00000F 1F 01            [ 2]  493 	ldw (VAR_NAME,sp),x
      000010 0F 03            [ 1]  494 	clr (REC_LEN,sp) 
      000013 CD 18 01         [ 4]  495 	call skip_string 
      000015 CE 00 04         [ 2]  496 	ldw x,basicptr 
      000017 72 BB 00 00      [ 2]  497 	addw x,in.w 
      000019 F6               [ 1]  498 	ld a,(x)
      00001A A1 32            [ 1]  499 	cp a,#TK_EQUAL 
      00001B 26 43            [ 1]  500 	jrne 9$ 
                                    501 ; dvar assignment 
      00001C 72 5C 00 01      [ 1]  502 	inc in  
      00001E CD 1C 0D         [ 4]  503 	call condition  
      000020 A1 84            [ 1]  504 	cp a,#TK_INTGR 
      000021 27 03            [ 1]  505 	jreq 1$ 
      000023 CC 16 84         [ 2]  506 0$:	jp syntax_error 
      000024                        507 1$: 
      000025 1E 01            [ 2]  508 	ldw x,(VAR_NAME,sp) ; pointer to var name 
      000027 CD 13 86         [ 4]  509 	call strlen 
      00002F AB 05            [ 1]  510 	add a,#REC_XTRA_BYTES
      000030 6B 04            [ 1]  511 	ld (REC_LEN+1,sp),a 
      000031 CD 1D 49         [ 4]  512 	call search_name 
      000033 5D               [ 2]  513 	tnzw x 
      000035 27 EE            [ 1]  514 	jreq 0$ 
      00008C F6               [ 1]  515 	ld a,(x)
      00008C 2A 05            [ 1]  516 	jrpl 2$
      00008E A6 11            [ 1]  517 	ld a,#ERR_RD_ONLY 
      000090 CC 16 86         [ 2]  518 	jp tb_error 
      009406                        519 2$:
      009406 89 4F 7D         [ 2]  520 	addw x,(REC_LEN,sp)
      009409 27 04 4C         [ 2]  521 	subw x,#CELL_SIZE 
      00940C 5C 20 F9         [ 2]  522 	ldw ptr16,x
      0017D0                        523 	_xpop 
      00940F 85 81            [ 1]    1     ld a,(y)
      009411 93               [ 1]    2     ldw x,y 
      009411 F6 27            [ 2]    3     ldw x,(1,x)
      009413 0B 90 F1 26      [ 2]    4     addw y,#CELL_SIZE 
      009417 05 5C 90 5C      [ 4]  524 	ld [ptr16],a 
      00941B 20 F4 00 1A      [ 1]  525 	inc ptr8 
      00941D 72 CF 00 19      [ 5]  526 	ldw [ptr16],x 
      0017E5                        527 9$: _drop VSIZE 	
      00941D 4F 81            [ 2]    1     addw sp,#VSIZE 
      00941F 81               [ 4]  528 	ret 
                                    529 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
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
      0017E8                        540 next_token::
                                    541 ;	clrw x 
      00941F A6 01 81         [ 1]  542 	ld a,in 
      009422 C7 00 02         [ 1]  543 	ld in.saved,a ; in case "_unget_token" needed 
                                    544 ; don't replace sub by "cp a,count" 
                                    545 ; if end of line must return with A=0   	
      009422 88 89 90         [ 1]  546 	sub a,count 
      009425 F6 27            [ 1]  547 	jreq 9$ ; end of line 
      0017F3                        548 0$: 
      009427 06 F7 5C         [ 2]  549 	ldw x,basicptr 
      00942A 90 5C 20 F6      [ 2]  550 	addw x,in.w 
      00942E 7F               [ 1]  551 	ld a,(x)
      00942F 85               [ 1]  552 	incw x
      009430 84 81 00 01      [ 1]  553 	inc in   
      009432 81               [ 4]  554 9$: ret 
                                    555 
                                    556 ;-------------------------
                                    557 ;  skip .asciz in BASIC line 
                                    558 ;  name 
                                    559 ;  input:
                                    560 ;     x		* string 
                                    561 ;  output:
                                    562 ;     none 
                                    563 ;-------------------------
      001801                        564 skip_string:
      009432 88               [ 1]  565 	ld a,(x)
      009433 52 02            [ 1]  566 	jreq 1$
      009435 0F               [ 1]  567 	incw x 
      009436 01 0F            [ 2]  568 	jra skip_string 
      009438 02               [ 1]  569 1$: incw x 	
      009439 90 89 13 01      [ 2]  570 	subw x,basicptr 
      00943D 90 85 27         [ 2]  571 	ldw in.w,x 
      009440 31               [ 4]  572 	ret 
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
      001810                        583 get_addr:
      009441 2B               [ 2]  584 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      009442 0E 5C 00 01      [ 1]  585 	inc in 
      009443 72 5C 00 01      [ 1]  586 	inc in 
      009443 72               [ 4]  587 	ret 
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
      00181A                        598 get_int24:
      009444 BB               [ 1]  599 	ld a,(x)
      009445 00 0E            [ 2]  600 	ldw x,(1,x)
                                    601 ; skip 3 bytes 
      009447 72 B9 00 0E      [ 1]  602 	inc in 
      00944B 03 01 03 02      [ 1]  603 	inc in 
      00944F 20 05 00 01      [ 1]  604 	inc in 
      009451 81               [ 4]  605 	ret 
                                    606 
                                    607 ;-------------------------
                                    608 ; get character from 
                                    609 ; BASIC code 
                                    610 ; input:
                                    611 ;    X   *char 
                                    612 ; output:
                                    613 ;    A    char 
                                    614 ;-------------------------
      00182A                        615 get_char:
      009451 5A               [ 1]  616 	ld a,(x)
      009452 90 5A 0C 02      [ 1]  617 	inc in  
      009456 81               [ 4]  618     ret 
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
      001830                        630 prt_i16:
      009456 C6 00 0E CA      [ 1]  631 	clr acc24 
      00945A 00 0F 27         [ 2]  632 	ldw acc16,x 
      00945D 14 72            [ 1]  633 	ld a,#16
      00945F FB 01 72         [ 1]  634 	cp a,base
      009462 F9 01            [ 1]  635 	jreq prt_acc24  
      009464 90 F6 F7 89 CE   [ 2]  636 	btjf acc16,#7,prt_acc24
      009469 00 0E 5A CF      [ 1]  637 	cpl acc24 ; sign extend 
                                    638 	
                                    639 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
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
      001847                        649 prt_acc24:
      00946D 00 0E            [ 1]  650 	ld a,#255  ; signed conversion  
      00946F 85 20 E4         [ 4]  651     call itoa  ; conversion entier en  .asciz
      009472 CD 11 40         [ 4]  652 	call right_align  
      009472 5B               [ 1]  653 	push a 
      009473 02 84 81         [ 4]  654 	call puts
      009476 84               [ 1]  655 	pop a 
      009476 89               [ 4]  656     ret	
                                    657 
                                    658 ;---------------------------------------
                                    659 ;  print value at xstack top 
                                    660 ;---------------------------------------
      001855                        661 print_top: 
      001855                        662 	_xpop 
      009477 88 AE            [ 1]    1     ld a,(y)
      009479 00               [ 1]    2     ldw x,y 
      00947A 35 A6            [ 2]    3     ldw x,(1,x)
      00947C 4E 7F 5C 4A      [ 2]    4     addw y,#CELL_SIZE 
      009480 26 FB 84         [ 1]  663 	ld acc24,a 
      009483 85 81 0A         [ 2]  664 	ldw acc16,x 
      009486 0A 54 69         [ 4]  665 	call prt_acc24 
      009489 6E 79            [ 1]  666 	ld a,#SPACE
      00948B 20 42 41         [ 4]  667 	call putc 
      00948E 53               [ 4]  668 	ret 
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
      00186D                        684 itoa::
      00186D                        685 	_vars VSIZE
      00948F 49 43            [ 2]    1     sub sp,#VSIZE 
      009491 20 66            [ 1]  686 	clr (LEN,sp) ; string length  
      009493 6F 72            [ 1]  687 	clr (SIGN,sp)    ; sign
      009495 20               [ 1]  688 	tnz A
      009496 53 54            [ 1]  689 	jreq 1$ ; unsigned conversion  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009498 4D 38 0A         [ 1]  690 	ld a,base 
      00949B 43 6F            [ 1]  691 	cp a,#10
      00949D 70 79            [ 1]  692 	jrne 1$
                                    693 	; base 10 string display with negative sign if bit 23==1
      00949F 72 69 67 68 74   [ 2]  694 	btjf acc24,#7,1$
      0094A4 2C 20            [ 1]  695 	cpl (SIGN,sp)
      0094A6 4A 61 63         [ 4]  696 	call neg_acc24
      001887                        697 1$:
                                    698 ; initialize string pointer 
      0094A9 71 75 65         [ 2]  699 	ldw x,#tib 
      0094AC 73 20 44         [ 2]  700 	addw x,#TIB_SIZE
      0094AF 65               [ 2]  701 	decw x 
      0094B0 73               [ 1]  702 	clr (x)
      00188F                        703 itoa_loop:
      0094B1 63 68 65         [ 1]  704     ld a,base
      0094B4 6E 65 73         [ 4]  705     call divu24_8 ; acc24/A 
      0094B7 20 32            [ 1]  706     add a,#'0  ; remainder of division
      0094B9 30 31            [ 1]  707     cp a,#'9+1
      0094BB 39 2C            [ 1]  708     jrmi 2$
      0094BD 32 30            [ 1]  709     add a,#7 
      00189D                        710 2$:	
      0094BF 32               [ 2]  711 	decw x
      0094C0 32               [ 1]  712     ld (x),a
      0094C1 0A 76            [ 1]  713 	inc (LEN,sp)
                                    714 	; if acc24==0 conversion done
      0094C3 65 72 73         [ 1]  715 	ld a,acc24
      0094C6 69 6F 6E         [ 1]  716 	or a,acc16
      0094C9 20 00 0E         [ 1]  717 	or a,acc8
      0094CB 26 E3            [ 1]  718     jrne itoa_loop
                                    719 	;conversion done, next add '$' or '-' as required
      0094CB AE 94 85         [ 1]  720 	ld a,base 
      0094CE CD 89            [ 1]  721 	cp a,#16
      0094D0 DC A6            [ 1]  722 	jreq 8$
      0094D2 02 C7            [ 1]  723 	ld a,(SIGN,sp)
      0094D4 00 0F            [ 1]  724     jreq 10$
      0094D6 5F CF            [ 1]  725     ld a,#'-
      0094D8 00 0D            [ 2]  726 	jra 9$ 
      0018BB                        727 8$:	
      0094DA 72 5F            [ 1]  728 	ld a,#'$ 
      0094DC 00               [ 2]  729 9$: decw x
      0094DD 24               [ 1]  730     ld (x),a
      0094DE 35 0A            [ 1]  731 	inc (LEN,sp)
      0018C1                        732 10$:
      0094E0 00 0B            [ 1]  733 	ld a,(LEN,sp)
      0018C3                        734 	_drop VSIZE
      0094E2 CD 98            [ 2]    1     addw sp,#VSIZE 
      0094E4 C7               [ 4]  735 	ret
                                    736 
                                    737 ;------------------------------------
                                    738 ; convert alpha to uppercase
                                    739 ; input:
                                    740 ;    a  character to convert
                                    741 ; output:
                                    742 ;    a  uppercase character
                                    743 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      0018C6                        744 to_upper::
      0094E5 A6 2E            [ 1]  745 	cp a,#'a
      0094E7 CD 89            [ 1]  746 	jrpl 1$
      0094E9 7F               [ 4]  747 0$:	ret
      0094EA A6 00            [ 1]  748 1$: cp a,#'z	
      0094EC C7 00            [ 1]  749 	jrugt 0$
      0094EE 0F 5F            [ 1]  750 	sub a,#32
      0094F0 CF               [ 4]  751 	ret
                                    752 	
                                    753 ;------------------------------------
                                    754 ; convert pad content in integer
                                    755 ; input:
                                    756 ;    x		* .asciz to convert
                                    757 ; output:
                                    758 ;    A:X        int24_t 
                                    759 ;    acc24      int24_t
                                    760 ;------------------------------------
                                    761 	; local variables
                           000001   762 	SIGN=1 ; 1 byte, 
                           000002   763 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   764 	TEMP=3 ; 1 byte, temporary storage
                           000004   765 	XTEMP=4 ; 2 bytes, preserve X 
                           000005   766 	VSIZE=5 ; 5 bytes reserved for local storage
      0018D2                        767 atoi24::
      0018D2                        768 	_vars VSIZE
      0094F1 00 0D            [ 2]    1     sub sp,#VSIZE 
      0094F3 CD 98            [ 2]  769 	ldw (XTEMP,sp),x 
                                    770 ; conversion made on xstack 
      0094F5 C7               [ 1]  771 	clr a 
      0094F6 A6               [ 1]  772 	clrw x 
      0018D8                        773 	_xpush 
      0094F7 0D CD 89 7F      [ 2]    1     subw y,#CELL_SIZE
      0094FB 81 F7            [ 1]    2     ld (y),a 
      0094FC 90 EF 01         [ 2]    3     ldw (1,y),x 
      0094FC 90 AE            [ 1]  774 	clr (SIGN,sp)
      0094FE 17 73            [ 1]  775 	ld a,#10
      009500 72 5F            [ 1]  776 	ld (BASE,sp),a ; default base decimal
      009502 00 23            [ 2]  777 	ldw x,(XTEMP,sp)
      009504 72               [ 1]  778 	ld a,(x)
      009505 5F 00            [ 1]  779 	jreq 9$  ; completed if 0
      009507 20 35            [ 1]  780 	cp a,#'-
      009509 04 00            [ 1]  781 	jrne 1$
      00950B 24 35            [ 1]  782 	cpl (SIGN,sp)
      00950D 0A 00            [ 2]  783 	jra 2$
      00950F 0B AE            [ 1]  784 1$: cp a,#'$
      009511 00 00            [ 1]  785 	jrne 3$
      009513 CF 00            [ 1]  786 	ld a,#16
      009515 05 CF            [ 1]  787 	ld (BASE,sp),a
      009517 00               [ 1]  788 2$:	incw x
      009518 01 72            [ 2]  789 	ldw (XTEMP,sp),x 
      00951A 5F               [ 1]  790 	ld a,(x)
      001900                        791 3$:	; char to digit 
      00951B 00 04            [ 1]  792 	cp a,#'a
      00951D 81 02            [ 1]  793 	jrmi 4$
      00951E A0 20            [ 1]  794 	sub a,#32
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00951E 89 72            [ 1]  795 4$:	cp a,#'0
      009520 5F 00            [ 1]  796 	jrmi 9$
      009522 04 72            [ 1]  797 	sub a,#'0
      009524 5F 00            [ 1]  798 	cp a,#10
      009526 02 AE            [ 1]  799 	jrmi 5$
      009528 00 90            [ 1]  800 	sub a,#7
      00952A CF 00            [ 1]  801 	cp a,(BASE,sp)
      00952C 1C CF            [ 1]  802 	jrpl 9$
      00952E 00 1E            [ 1]  803 5$:	ld (TEMP,sp),a
      009530 CF 00            [ 1]  804 	ld a,(BASE,sp)
      009532 31 CF 00         [ 4]  805 	call mulu24_8
      00191D                        806 	_xpush 
      009535 33 CD 94 76      [ 2]    1     subw y,#CELL_SIZE
      009539 85 81            [ 1]    2     ld (y),a 
      00953B 90 EF 01         [ 2]    3     ldw (1,y),x 
      00953B 00               [ 1]  807 	clrw x 
      00953C 00 95            [ 1]  808 	ld a,(TEMP,sp)
      00953E 61               [ 1]  809 	rlwa x 
      00192A                        810 	_xpush 
      00953F 95 6E 95 7C      [ 2]    1     subw y,#CELL_SIZE
      009543 95 95            [ 1]    2     ld (y),a 
      009545 95 A4 95         [ 2]    3     ldw (1,y),x 
      009548 BA 95 D0         [ 4]  811 	call add24 
      00954B 95 EA            [ 2]  812 	ldw x,(XTEMP,sp)
      00954D 95 FB            [ 2]  813 	jra 2$
      00954F 96 0C            [ 1]  814 9$:	tnz (SIGN,sp)
      009551 96 18            [ 1]  815     jreq atoi_exit
      009553 96 4B 96         [ 4]  816     call neg24
      001941                        817 atoi_exit:
      001941                        818 	_xpop 
      009556 5B 96            [ 1]    1     ld a,(y)
      009558 6F               [ 1]    2     ldw x,y 
      009559 96 82            [ 2]    3     ldw x,(1,x)
      00955B 96 8F 96 99      [ 2]    4     addw y,#CELL_SIZE 
      00955F 96 B5 4D         [ 1]  819 	ld acc24,a 
      009562 65 6D 6F         [ 2]  820 	ldw acc16,x  
      001950                        821 	_drop VSIZE
      009565 72 79            [ 2]    1     addw sp,#VSIZE 
      009567 20               [ 4]  822 	ret
                                    823 
                                    824 
                                    825 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    826 ;;   TINY BASIC  operators,
                                    827 ;;   commands and functions 
                                    828 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    829 
                                    830 ;---------------------------------
                                    831 ; dictionary search 
                                    832 ; input:
                                    833 ;	X 		dictionary entry point, name field  
                                    834 ;   y		.asciz name to search 
                                    835 ; output:
                                    836 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    837 ;  X		routine address|TK_OP 
                                    838 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                           000001   839 	NLEN=1 ; cmd length 
                           000002   840 	XSAVE=2
                           000004   841 	YSAVE=4
                           000005   842 	VSIZE=5 
      001953                        843 search_dict::
      001953                        844 	_vars VSIZE 
      009568 66 75            [ 2]    1     sub sp,#VSIZE 
      00956A 6C 6C            [ 2]  845 	ldw (YSAVE,sp),y 
      001957                        846 search_next:
      00956C 0A 00            [ 2]  847 	ldw (XSAVE,sp),x 
                                    848 ; get name length in dictionary	
      00956E 73               [ 1]  849 	ld a,(x)
      00956F 79 6E            [ 1]  850 	and a,#0xf 
      009571 74 61            [ 1]  851 	ld (NLEN,sp),a  
      009573 78 20            [ 2]  852 	ldw y,(YSAVE,sp) ; name pointer 
      009575 65               [ 1]  853 	incw x 
      001961                        854 cp_loop:
      009576 72 72            [ 1]  855 	ld a,(y)
      009578 6F 72            [ 1]  856 	jreq str_match 
      00957A 0A 00            [ 1]  857 	tnz (NLEN,sp)
      00957C 6D 61            [ 1]  858 	jreq no_match  
      00957E 74               [ 1]  859 	cp a,(x)
      00957F 68 20            [ 1]  860 	jrne no_match 
      009581 6F 70            [ 1]  861 	incw y 
      009583 65               [ 1]  862 	incw x
      009584 72 61            [ 1]  863 	dec (NLEN,sp)
      009586 74 69            [ 2]  864 	jra cp_loop 
      001973                        865 no_match:
      009588 6F 6E            [ 2]  866 	ldw x,(XSAVE,sp) 
      00958A 20 6F 76         [ 2]  867 	subw x,#2 ; move X to link field
      00958D 65 72            [ 1]  868 	push #TK_NONE 
      00958F 66               [ 2]  869 	ldw x,(x) ; next word link 
      009590 6C               [ 1]  870 	pop a ; TK_NONE 
      009591 6F 77            [ 1]  871 	jreq search_exit  ; not found  
                                    872 ;try next 
      009593 0A 00            [ 2]  873 	jra search_next
      001980                        874 str_match:
      009595 64 69            [ 2]  875 	ldw x,(XSAVE,sp)
      009597 76               [ 1]  876 	ld a,(X)
      009598 69 73            [ 1]  877 	ld (NLEN,sp),a ; needed to test keyword type  
      00959A 69 6F            [ 1]  878 	and a,#NLEN_MASK 
                                    879 ; move x to procedure address field 	
      00959C 6E               [ 1]  880 	inc a 
      00959D 20 62 79         [ 1]  881 	ld acc8,a 
      0095A0 20 30 0A 00      [ 1]  882 	clr acc16 
      0095A4 69 6E 76 61      [ 2]  883 	addw x,acc16 
      0095A8 6C               [ 2]  884 	ldw x,(x) ; routine address  
                                    885 ;determine keyword type bits 7:4 
      0095A9 69 64            [ 1]  886 	ld a,(NLEN,sp)
      0095AB 20 6C            [ 1]  887 	and a,#KW_TYPE_MASK 
      0095AD 69               [ 1]  888 	swap a 
      0095AE 6E 65            [ 1]  889 	add a,#128
      00199B                        890 search_exit: 
      00199B                        891 	_drop VSIZE 
      0095B0 20 6E            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0095B2 75               [ 4]  892 	ret 
                                    893 
                                    894 ;---------------------
                                    895 ; check if next token
                                    896 ;  is of expected type 
                                    897 ; input:
                                    898 ;   A 		 expected token attribute
                                    899 ;  ouput:
                                    900 ;   none     if fail call syntax_error 
                                    901 ;--------------------
      00199E                        902 expect:
      0095B3 6D               [ 1]  903 	push a 
      0095B4 62 65 72         [ 4]  904 	call next_token 
      0095B7 2E 0A            [ 1]  905 	cp a,(1,sp)
      0095B9 00 72            [ 1]  906 	jreq 1$
      0095BB 75 6E 20         [ 2]  907 	jp syntax_error
      0095BE 74               [ 1]  908 1$: pop a 
      0095BF 69               [ 4]  909 	ret 
                                    910 
                                    911 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    912 ; parse arguments list 
                                    913 ; between ()
                                    914 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      0019AB                        915 func_args:
      0095C0 6D 65            [ 1]  916 	ld a,#TK_LPAREN 
      0095C2 20 6F 6E         [ 4]  917 	call expect 
                                    918 ; expected to continue in arg_list 
                                    919 ; caller must check for TK_RPAREN 
                                    920 
                                    921 ;-------------------------------
                                    922 ; parse embedded BASIC routines 
                                    923 ; arguments list.
                                    924 ; arg_list::=  expr[','expr]*
                                    925 ; all arguments are of int24_t type
                                    926 ; and pushed on stack 
                                    927 ; input:
                                    928 ;   none
                                    929 ; output:
                                    930 ;   xstack{n}   arguments pushed on xstack
                                    931 ;   A 	number of arguments pushed on xstack  
                                    932 ;--------------------------------
      0019B0                        933 arg_list:
      0095C5 6C 79            [ 1]  934 	push #0
      0095C7 20 75 73         [ 4]  935 1$:	call condition 
      0095CA 61               [ 1]  936 	tnz a 
      0095CB 67 65            [ 1]  937 	jreq 7$  
      0095CD 2E 0A            [ 1]  938 	inc (1,sp)
      0095CF 00 63 6F         [ 4]  939 	call next_token 
      0095D2 6D 6D            [ 1]  940 	cp a,#TK_COMMA 
      0095D4 61 6E            [ 1]  941 	jreq 1$ 
      0095D6 64 20            [ 1]  942 	cp a,#TK_RPAREN
      0095D8 6C 69            [ 1]  943 	jreq 7$
      0019C5                        944 	_unget_token 
      0095DA 6E 65 20 6F 6E   [ 1]    1      mov in,in.saved  
      0095DF 6C               [ 1]  945 7$:	pop a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      0095E0 79               [ 4]  946 	ret 
                                    947 
                                    948 ;--------------------------------
                                    949 ;   BASIC commnands 
                                    950 ;--------------------------------
                                    951 
                                    952 ;--------------------------------
                                    953 ;  arithmetic and relational 
                                    954 ;  routines
                                    955 ;  operators precedence
                                    956 ;  highest to lowest
                                    957 ;  operators on same row have 
                                    958 ;  same precedence and are executed
                                    959 ;  from left to right.
                                    960 ;	'*','/','%'
                                    961 ;   '-','+'
                                    962 ;   '=','>','<','>=','<=','<>','><'
                                    963 ;   '<>' and '><' are equivalent for not equal.
                                    964 ;--------------------------------
                                    965 
                                    966 ;---------------------
                                    967 ; return array element
                                    968 ; address from @(expr)
                                    969 ; input:
                                    970 ;   A 		TK_ARRAY
                                    971 ; output:
                                    972 ;	X 		element address 
                                    973 ;----------------------
      0019CC                        974 get_array_element:
      0095E1 20 75 73         [ 4]  975 	call func_args 
      0095E4 61 67            [ 1]  976 	cp a,#1
      0095E6 65 2E            [ 1]  977 	jreq 1$
      0095E8 0A 00 64         [ 2]  978 	jp syntax_error
      0019D6                        979 1$: _xpop 
      0095EB 75 70            [ 1]    1     ld a,(y)
      0095ED 6C               [ 1]    2     ldw x,y 
      0095EE 69 63            [ 2]    3     ldw x,(1,x)
      0095F0 61 74 65 20      [ 2]    4     addw y,#CELL_SIZE 
                                    980     ; ignore A, index < 65536 in any case 
                                    981 	; check for bounds 
      0095F4 6E 61 6D         [ 2]  982 	cpw x,array_size 
      0095F7 65 2E            [ 2]  983 	jrule 3$
                                    984 ; bounds {1..array_size}	
      0095F9 0A 00            [ 1]  985 2$: ld a,#ERR_BAD_VALUE 
      0095FB 46 69 6C         [ 2]  986 	jp tb_error 
      0095FE 65               [ 2]  987 3$: tnzw  x
      0095FF 20 6E            [ 1]  988 	jreq 2$ 
      009601 6F               [ 2]  989 	pushw x 
      009602 74               [ 2]  990 	sllw x 
      009603 20 66 6F         [ 2]  991 	addw x,(1,sp) ; index*size_of(int24)
      009606 75 6E            [ 2]  992 	ldw (1,sp),x  
      009608 64 2E 0A         [ 2]  993 	ldw x,#tib ; array is below tib 
      00960B 00 62 61         [ 2]  994 	subw x,(1,sp)
      0019F9                        995 	_drop 2   
      00960E 64 20            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      009610 76               [ 4]  996 	ret 
                                    997 
                                    998 
                                    999 ;***********************************
                                   1000 ;   expression parse,execute 
                                   1001 ;***********************************
                                   1002 ;-----------------------------------
                                   1003 ; factor ::= ['+'|'-'|e]  var | @ |
                                   1004 ;			 integer | function |
                                   1005 ;			 '('relation')' 
                                   1006 ; output:
                                   1007 ;   A       token attribute 
                                   1008 ;   xstack  value  
                                   1009 ; ---------------------------------
                           000001  1010 	NEG=1
                           000001  1011 	VSIZE=1
      0019FC                       1012 factor:
      0019FC                       1013 	_vars VSIZE 
      009611 61 6C            [ 2]    1     sub sp,#VSIZE 
      009613 75 65            [ 1] 1014 	clr (NEG,sp)
      009615 2E 0A 00         [ 4] 1015 	call next_token
      009618 46               [ 1] 1016 	tnz a 
      009619 69 6C            [ 1] 1017 	jrne 1$ 
      00961B 65 20 69         [ 2] 1018 	jp 22$ 
      00961E 6E 20            [ 1] 1019 1$:	cp a,#TK_PLUS 
      009620 65 78            [ 1] 1020 	jreq 2$
      009622 74 65            [ 1] 1021 	cp a,#TK_MINUS 
      009624 6E 64            [ 1] 1022 	jrne 4$ 
      009626 65 64            [ 1] 1023 	cpl (NEG,sp)
      001A13                       1024 2$:	
      009628 20 6D 65         [ 4] 1025 	call next_token
      001A16                       1026 4$:
      00962B 6D               [ 1] 1027 	tnz a 
      00962C 6F 72            [ 1] 1028 	jrne 41$ 
      00962E 79 2C 20         [ 2] 1029 	jp syntax_error  
      001A1C                       1030 41$:	
      009631 63 61            [ 1] 1031 	cp a,#TK_IFUNC 
      009633 6E 27            [ 1] 1032 	jrne 5$ 
      001A20                       1033 	_get_code_addr 
      009635 74               [ 2]    1         ldw x,(x)
      009636 20 62 65 20      [ 1]    2         inc in 
      00963A 72 75 6E 20      [ 1]    3         inc in 
      00963E 66               [ 4] 1034 	call (x); result in A:X  
      00963F 72 6F            [ 2] 1035 	jra 18$ 
      001A2C                       1036 5$:
      009641 6D 20            [ 1] 1037 	cp a,#TK_INTGR
      009643 74 68            [ 1] 1038 	jrne 6$
      009645 65 72 65         [ 4] 1039 	call get_int24 ; A:X
      009648 2E 0A            [ 2] 1040 	jra 18$
      001A35                       1041 6$:
      00964A 00 4E            [ 1] 1042 	cp a,#TK_ARRAY
      00964C 6F 20            [ 1] 1043 	jrne 7$
      00964E 64 61 74         [ 4] 1044 	call get_array_element
      009651 61 20            [ 2] 1045     jra 71$
      001A3E                       1046 7$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



      009653 66 6F            [ 1] 1047 	cp a,#TK_VAR 
      009655 75 6E            [ 1] 1048 	jrne 8$
      009657 64 2E 0A         [ 4] 1049 	call get_addr 
      001A45                       1050 71$: ; put value in A:X
      00965A 00               [ 1] 1051 	ld a,(x)
      00965B 4E 6F            [ 2] 1052 	ldw x,(1,x)
      00965D 20 70            [ 2] 1053 	jra 18$
      001A4A                       1054 8$:
      00965F 72 6F            [ 1] 1055 	cp a,#TK_LABEL 
      009661 67 72            [ 1] 1056 	jrne 9$
      009663 61 6D            [ 2] 1057 	pushw y  
      009665 20               [ 2] 1058 	pushw x 
      009666 69 6E 20         [ 4] 1059 	call skip_string
      009669 52               [ 2] 1060 	popw x  
      00966A 41 4D 21         [ 4] 1061 	call strlen 
      00966D 0A 00            [ 1] 1062 	add a,#REC_XTRA_BYTES
      00966F 46 69 6C         [ 4] 1063 	call search_name
      009672 65               [ 2] 1064 	tnzw x 
      009673 20 73            [ 1] 1065 	jrne 82$ 
      009675 79 73            [ 2] 1066 	popw y 
      009677 74 65            [ 2] 1067 	jra 16$
      001A64                       1068 82$:
      009679 6D 20            [ 2] 1069 	popw y   
      00967B 66 75 6C         [ 4] 1070 	call get_value ; in A:X 
      00967E 6C 2E            [ 2] 1071 	jra 18$
      001A6B                       1072 9$: 
      009680 0A 00            [ 1] 1073 	cp a,#TK_CFUNC 
      009682 42 75            [ 1] 1074 	jrne 12$
      001A6F                       1075 	_get_code_addr 
      009684 66               [ 2]    1         ldw x,(x)
      009685 66 65 72 20      [ 1]    2         inc in 
      009689 66 75 6C 6C      [ 1]    3         inc in 
      00968D 0A               [ 4] 1076 	call(x)
      00968E 00               [ 1] 1077 	clrw x 
      00968F 6F               [ 1] 1078 	rlwa x  ; char>int24 in A:X 
      009690 76 65            [ 2] 1079 	jra 18$ 	 
      001A7D                       1080 12$:			
      009692 72 66            [ 1] 1081 	cp a,#TK_LPAREN
      009694 6C 6F            [ 1] 1082 	jrne 16$
      009696 77 0A 00         [ 4] 1083 	call expression
      009699 63 6F            [ 1] 1084 	ld a,#TK_RPAREN 
      00969B 6E 73 74         [ 4] 1085 	call expect
      001A89                       1086 	_xpop 
      00969E 61 6E            [ 1]    1     ld a,(y)
      0096A0 74               [ 1]    2     ldw x,y 
      0096A1 20 63            [ 2]    3     ldw x,(1,x)
      0096A3 61 6E 27 74      [ 2]    4     addw y,#CELL_SIZE 
      0096A7 20 62            [ 2] 1087 	jra 18$	
      001A94                       1088 16$:
      001A94                       1089 	_unget_token 
      0096A9 65 20 6D 6F 64   [ 1]    1      mov in,in.saved  
      0096AE 69               [ 1] 1090 	clr a 
      0096AF 66 69            [ 2] 1091 	jra 22$ 
      001A9C                       1092 18$: 
      0096B1 65 64            [ 1] 1093 	tnz (NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



      0096B3 0A 00            [ 1] 1094 	jreq 20$
      0096B5 6E 6F 20         [ 4] 1095 	call neg_ax   
      001AA3                       1096 20$:
      001AA3                       1097 	_xpush 
      0096B8 70 72 6F 67      [ 2]    1     subw y,#CELL_SIZE
      0096BC 72 61            [ 1]    2     ld (y),a 
      0096BE 6D 20 61         [ 2]    3     ldw (1,y),x 
      0096C1 74 20            [ 1] 1098 	ld a,#TK_INTGR
      001AAE                       1099 22$:
      001AAE                       1100 	_drop VSIZE
      0096C3 74 68            [ 2]    1     addw sp,#VSIZE 
      0096C5 69               [ 4] 1101 	ret
                                   1102 
                                   1103 
                                   1104 ;-----------------------------------
                                   1105 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   1106 ; output:
                                   1107 ;   A    	token attribute 
                                   1108 ;	xstack		value 
                                   1109 ;-----------------------------------
                           000001  1110 	MULOP=1
                           000001  1111 	VSIZE=1
      001AB1                       1112 term:
      001AB1                       1113 	_vars VSIZE
      0096C6 73 20            [ 2]    1     sub sp,#VSIZE 
                                   1114 ; first factor 	
      0096C8 61 64 64         [ 4] 1115 	call factor
      0096CB 72               [ 1] 1116 	tnz a 
      0096CC 65 73            [ 1] 1117 	jreq term_exit  
      001AB9                       1118 term01:	 ; check for  operator '*'|'/'|'%' 
      0096CE 73 0A 00         [ 4] 1119 	call next_token
      0096D1 0A 72            [ 1] 1120 	ld (MULOP,sp),a
      0096D3 75 6E            [ 1] 1121 	and a,#TK_GRP_MASK
      0096D5 20 74            [ 1] 1122 	cp a,#TK_GRP_MULT
      0096D7 69 6D            [ 1] 1123 	jreq 1$
      0096D9 65 20            [ 1] 1124 	ld a,#TK_INTGR
      001AC6                       1125 	_unget_token 
      0096DB 65 72 72 6F 72   [ 1]    1      mov in,in.saved  
      0096E0 2C 20            [ 2] 1126 	jra term_exit 
      001ACD                       1127 1$:	; got *|/|%
                                   1128 ;second factor
      0096E2 00 0A 63         [ 4] 1129 	call factor
      0096E5 6F               [ 1] 1130 	tnz a 
      0096E6 6D 70            [ 1] 1131 	jrne 2$ 
      0096E8 69 6C 65         [ 2] 1132 	jp syntax_error 
      001AD6                       1133 2$: ; select operation 	
      0096EB 20 65            [ 1] 1134 	ld a,(MULOP,sp) 
      0096ED 72 72            [ 1] 1135 	cp a,#TK_MULT 
      0096EF 6F 72            [ 1] 1136 	jrne 3$
                                   1137 ; '*' operator
      0096F1 2C 20 00         [ 4] 1138 	call mul24 
      0096F4 6C 61            [ 2] 1139 	jra term01
      0096F6 73 74            [ 1] 1140 3$: cp a,#TK_DIV 
      0096F8 20 74            [ 1] 1141 	jrne 4$ 
                                   1142 ; '/' operator	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0096FA 6F 6B 65         [ 4] 1143 	call div24 
      0096FD 6E 20            [ 2] 1144 	jra term01 
      001AEA                       1145 4$: ; '%' operator
      0096FF 69 64 3A         [ 4] 1146 	call mod24
      009702 20 00            [ 2] 1147 	jra term01 
      009704                       1148 9$: 
      009704 A6 02            [ 1] 1149 	ld a,#TK_INTGR
      009706                       1150 term_exit:
      001AF1                       1151 	_drop VSIZE 
      009706 72 0A            [ 2]    1     addw sp,#VSIZE 
      009708 00               [ 4] 1152 	ret 
                                   1153 
                                   1154 ;-------------------------------
                                   1155 ;  expr ::= term [['+'|'-'] term]*
                                   1156 ;  result range {-32768..32767}
                                   1157 ;  output:
                                   1158 ;   A    token attribute 
                                   1159 ;   xstack	 result    
                                   1160 ;-------------------------------
                           000001  1161 	OP=1 
                           000001  1162 	VSIZE=1 
      001AF4                       1163 expression:
      001AF4                       1164 	_vars VSIZE 
      009709 23 4C            [ 2]    1     sub sp,#VSIZE 
                                   1165 ; first term 	
      00970B 88 AE 96         [ 4] 1166 	call term
      00970E D1               [ 1] 1167 	tnz a 
      00970F CD 89            [ 1] 1168 	jreq 9$
      001AFC                       1169 1$:	; operator '+'|'-'
      009711 DC 84 AE         [ 4] 1170 	call next_token
      009714 95 3B            [ 1] 1171 	ld (OP,sp),a 
      009716 72 5F            [ 1] 1172 	and a,#TK_GRP_MASK
      009718 00 0E            [ 1] 1173 	cp a,#TK_GRP_ADD 
      00971A 48 72            [ 1] 1174 	jreq 2$ 
      001B07                       1175 	_unget_token 
      00971C 59 00 0E C7 00   [ 1]    1      mov in,in.saved  
      009721 0F 72            [ 1] 1176 	ld a,#TK_INTGR
      009723 BB 00            [ 2] 1177 	jra 9$ 
      001B10                       1178 2$: ; second term 
      009725 0E FE CD         [ 4] 1179 	call term
      009728 89               [ 1] 1180 	tnz a 
      009729 DC CE            [ 1] 1181 	jrne 3$
      00972B 00 05 C6         [ 2] 1182 	jp syntax_error
      001B19                       1183 3$:
      00972E 00 04            [ 1] 1184 	ld a,(OP,sp)
      009730 90 5F            [ 1] 1185 	cp a,#TK_PLUS 
      009732 90 02            [ 1] 1186 	jrne 4$
                                   1187 ; '+' operator	
      009734 CD 86 C5         [ 4] 1188 	call add24
      009737 CE 00            [ 2] 1189 	jra 1$ 
      001B24                       1190 4$:	; '-' operator 
      009739 05 C6 00         [ 4] 1191 	call sub24
      00973C 02 CD            [ 2] 1192 	jra 1$
      001B29                       1193 9$:
      001B29                       1194 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00973E A0 15            [ 2]    1     addw sp,#VSIZE 
      009740 AE               [ 4] 1195 	ret 
                                   1196 
                                   1197 ;---------------------------------------------
                                   1198 ; rel ::= expr rel_op expr
                                   1199 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   1200 ;  relation return  integer , zero is false 
                                   1201 ;  output:
                                   1202 ;	 xstack		value  
                                   1203 ;---------------------------------------------
                           000001  1204 	RELOP=1
                           000001  1205 	VSIZE=1 
      001B2C                       1206 relation: 
      001B2C                       1207 	_vars VSIZE
      009741 96 F4            [ 2]    1     sub sp,#VSIZE 
      009743 CD 89 DC         [ 4] 1208 	call expression
      009746 C6               [ 1] 1209 	tnz a 
      009747 00 03            [ 1] 1210 	jreq 9$ 
                                   1211 ; expect rel_op or leave 
      009749 5F 97 72         [ 4] 1212 	call next_token 
      00974C BB 00            [ 1] 1213 	ld (RELOP,sp),a 
      00974E 05 F6            [ 1] 1214 	and a,#TK_GRP_MASK
      009750 5F 97            [ 1] 1215 	cp a,#TK_GRP_RELOP 
      009752 CD 98            [ 1] 1216 	jreq 2$
      009754 B0 20            [ 1] 1217 	ld a,#TK_INTGR 
      001B41                       1218 	_unget_token 
      009756 35 00 02 00 01   [ 1]    1      mov in,in.saved  
      009757 20 40            [ 2] 1219 	jra 9$ 
      001B48                       1220 2$:	; expect another expression
      009757 88 AE 96         [ 4] 1221 	call expression
      00975A E3               [ 1] 1222 	tnz a 
      00975B CD 89            [ 1] 1223 	jrne 3$
      00975D DC 84 AE         [ 2] 1224 	jp syntax_error 
      001B51                       1225 3$: 
      009760 95 3B 72         [ 4] 1226 	call cp24 
      001B54                       1227 	_xpop  
      009763 5F 00            [ 1]    1     ld a,(y)
      009765 0E               [ 1]    2     ldw x,y 
      009766 48 72            [ 2]    3     ldw x,(1,x)
      009768 59 00 0E C7      [ 2]    4     addw y,#CELL_SIZE 
      00976C 00               [ 1] 1228 	tnz a 
      00976D 0F 72            [ 1] 1229 	jrmi 4$
      00976F BB 00            [ 1] 1230 	jrne 5$
      009771 0E FE CD 89      [ 1] 1231 	mov acc8,#2 ; i1==i2
      009775 DC AE            [ 2] 1232 	jra 6$ 
      001B68                       1233 4$: ; i1<i2
      009777 16 90 CD 89      [ 1] 1234 	mov acc8,#4 
      00977B DC A6            [ 2] 1235 	jra 6$
      001B6E                       1236 5$: ; i1>i2
      00977D 0D CD 89 7F      [ 1] 1237 	mov acc8,#1  
      001B72                       1238 6$: ; 0=false, -1=true 
      009781 CE               [ 1] 1239 	clrw x 
      009782 00 01 CD         [ 1] 1240 	ld a, acc8  
      009785 8A 49            [ 1] 1241 	and a,(RELOP,sp)
      009787 A6 5E            [ 1] 1242 	jreq 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      009789 CD               [ 2] 1243 	cplw x 
      00978A 89 7F            [ 1] 1244 	ld a,#255 
      001B7D                       1245 7$:	_xpush 
      00978C AE 17 FF 94      [ 2]    1     subw y,#CELL_SIZE
      009790 90 F7            [ 1]    2     ld (y),a 
      009790 CD 94 FC         [ 2]    3     ldw (1,y),x 
      009793 A6 84            [ 1] 1246 	ld a,#TK_INTGR
      001B88                       1247 9$: 
      001B88                       1248 	_drop VSIZE
      009793 A6 0D            [ 2]    1     addw sp,#VSIZE 
      009795 CD               [ 4] 1249 	ret 
                                   1250 
                                   1251 ;-------------------------------------------
                                   1252 ;  AND factor:  [NOT] relation | (condition)
                                   1253 ;  output:
                                   1254 ;     A      TK_INTGR|0
                                   1255 ;-------------------------------------------
                           000001  1256 	NOT_OP=1
      001B8B                       1257 and_factor:
      009796 89 7F            [ 1] 1258 	push #0 
      009798 A6 3E CD         [ 4] 1259 0$:	call next_token  
      00979B 89               [ 1] 1260 	tnz a 
      00979C 7F CD            [ 1] 1261 	jreq 8$ 
      00979E 8A E1            [ 1] 1262 	cp a,#TK_NOT 
      0097A0 72 5D            [ 1] 1263 	jrne 1$ 
      0097A2 00 04            [ 1] 1264 	cpl (NOT_OP,sp)
      0097A4 27 ED            [ 2] 1265 	jra 0$ 
      001B9B                       1266 1$:	
      0097A6 CD 91            [ 1] 1267 	cp a,#TK_LPAREN 
      0097A8 16 72            [ 1] 1268 	jrne 2$
      0097AA 5D 00 04         [ 4] 1269 	call condition
      0097AD 27 E4            [ 1] 1270 	ld a,#TK_RPAREN 
      0097AF CD 19 9E         [ 4] 1271 	call expect
      0097AF C6 00            [ 2] 1272 	jra 3$
      001BA9                       1273 2$: _unget_token 
      0097B1 02 C1 00 04 2B   [ 1]    1      mov in,in.saved  
      0097B6 1D 1B 2C         [ 4] 1274 	call relation
      0097B7                       1275 3$:
      0097B7 72 01            [ 1] 1276 	tnz (NOT_OP,sp)
      0097B9 00 23            [ 1] 1277 	jreq 8$ 
      0097BB D7 CE 00         [ 4] 1278 	call cpl24
      001BB8                       1279 8$:
      001BB8                       1280 	_drop 1  
      0097BE 05 72            [ 2]    1     addw sp,#1 
      0097C0 BB               [ 4] 1281     ret 
                                   1282 
                                   1283 
                                   1284 ;--------------------------------------------
                                   1285 ;  AND operator as priority over OR||XOR 
                                   1286 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1287 ;          
                                   1288 ;  output:
                                   1289 ;     A     TK_INTGR|0
                                   1290 ;    xtack   value 
                                   1291 ;--------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      001BBB                       1292 and_cond:
      0097C1 00 01 C3         [ 4] 1293 	call and_factor
      0097C4 00               [ 1] 1294 	tnz a 
      0097C5 1E 2A            [ 1] 1295 	jreq 9$  
      0097C7 C8 CF 00         [ 4] 1296 1$: call next_token 
      0097CA 05               [ 1] 1297 	tnz a 
      0097CB E6 02            [ 1] 1298 	jreq 6$ 
      0097CD C7 00            [ 1] 1299 	cp a,#TK_AND 
      0097CF 04 35            [ 1] 1300 	jreq 3$
      001BCB                       1301 	_unget_token 
      0097D1 03 00 02 00 01   [ 1]    1      mov in,in.saved  
      0097D4 20 38            [ 2] 1302 	jra 6$ 
      0097D4 CD 98 68         [ 4] 1303 3$:	call and_factor  
      0097D7 A1               [ 1] 1304 	tnz a 
      0097D8 00 27            [ 1] 1305 	jrne 4$
      0097DA DC A1 80         [ 2] 1306 	jp syntax_error 
      001BDB                       1307 4$:	
      001BDB                       1308 	_xpop 
      0097DD 26 0C            [ 1]    1     ld a,(y)
      0097DF FE               [ 1]    2     ldw x,y 
      0097E0 72 5C            [ 2]    3     ldw x,(1,x)
      0097E2 00 02 72 5C      [ 2]    4     addw y,#CELL_SIZE 
      0097E6 00 02 FD         [ 1] 1309 	ld acc24,a 
      0097E9 20 E9 0D         [ 2] 1310 	ldw acc16,x
      0097EB                       1311 	_xpop 
      0097EB A1 85            [ 1]    1     ld a,(y)
      0097ED 26               [ 1]    2     ldw x,y 
      0097EE 05 CD            [ 2]    3     ldw x,(1,x)
      0097F0 9D 5F 20 E0      [ 2]    4     addw y,#CELL_SIZE 
      0097F4 C4 00 0C         [ 1] 1312 	and a,acc24 
      0097F4 A1               [ 1] 1313 	rlwa x 
      0097F5 05 26 05         [ 1] 1314 	and a,acc16 
      0097F8 CD               [ 1] 1315 	rlwa x 
      0097F9 9D 5A 20         [ 1] 1316 	and a,acc8 
      0097FC D7               [ 1] 1317 	rlwa x
      0097FD                       1318 	_xpush
      0097FD A1 03 26 05      [ 2]    1     subw y,#CELL_SIZE
      009801 CD 98            [ 1]    2     ld (y),a 
      009803 0D 20 CE         [ 2]    3     ldw (1,y),x 
      009806 20 B7            [ 2] 1319 	jra 1$  
      009806 A1 0A            [ 1] 1320 6$: ld a,#TK_INTGR 
      009808 27               [ 4] 1321 9$:	ret 	 
                                   1322 
                                   1323 
                                   1324 ;--------------------------------------------
                                   1325 ; condition for IF and UNTIL 
                                   1326 ; operators: OR,XOR 
                                   1327 ; format:  and_cond [ OP and_cond ]* 
                                   1328 ; output:
                                   1329 ;    A        INTGR|0 
                                   1330 ;    xstack   value 
                                   1331 ;--------------------------------------------
                           000001  1332 	ATMP=1
                           000002  1333 	OP=2
                           000002  1334 	VSIZE=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      001C0D                       1335 condition:
      001C0D                       1336 	_vars VSIZE 
      009809 CA CC            [ 2]    1     sub sp,#VSIZE 
      00980B 97 04 BB         [ 4] 1337 	call and_cond
      00980D 4D               [ 1] 1338 	tnz a 
      00980D 52 04            [ 1] 1339 	jreq 9$ 
      00980F 1F 01 0F         [ 4] 1340 1$:	call next_token 
      009812 03 CD            [ 1] 1341 	cp a,#TK_OR 
      009814 98 81            [ 1] 1342 	jreq 2$
      009816 CE 00            [ 1] 1343 	cp a,#TK_XOR
      009818 05 72            [ 1] 1344 	jreq 2$ 
      001C20                       1345 	_unget_token 
      00981A BB 00 01 F6 A1   [ 1]    1      mov in,in.saved  
      00981F 32 26            [ 2] 1346 	jra 8$ 
      009821 43 72            [ 1] 1347 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      009823 5C 00 02         [ 4] 1348 	call and_cond
      009826 CD 9C            [ 1] 1349 	cp a,#TK_INTGR 
      009828 8D A1            [ 1] 1350 	jreq 3$
      00982A 84 27 03         [ 2] 1351 	jp syntax_error 
      001C33                       1352 3$:	 
      001C33                       1353 	_xpop  ; rigth arg 
      00982D CC 97            [ 1]    1     ld a,(y)
      00982F 04               [ 1]    2     ldw x,y 
      009830 EE 01            [ 2]    3     ldw x,(1,x)
      009830 1E 01 CD 94      [ 2]    4     addw y,#CELL_SIZE 
      009834 06 AB 05         [ 1] 1354 	ld acc24,a 
      009837 6B 04 CD         [ 2] 1355 	ldw acc16,x 
      001C42                       1356 	_xpop  ; left arg  
      00983A 9D C9            [ 1]    1     ld a,(y)
      00983C 5D               [ 1]    2     ldw x,y 
      00983D 27 EE            [ 2]    3     ldw x,(1,x)
      00983F F6 2A 05 A6      [ 2]    4     addw y,#CELL_SIZE 
      009843 11 CC            [ 1] 1357 	ld (ATMP,sp),a 
      009845 97 06            [ 1] 1358 	ld a,(OP,sp)
      009847 A1 8A            [ 1] 1359 	cp a,#TK_XOR 
      009847 72 FB            [ 1] 1360 	jreq 5$ 
      001C53                       1361 4$: ; A:X OR acc24   
      009849 03 1D            [ 1] 1362 	ld a,(ATMP,sp)
      00984B 00 03 CF         [ 1] 1363 	or a,acc24 
      00984E 00               [ 1] 1364 	rlwa x 
      00984F 1A 90 F6         [ 1] 1365 	or a,acc16 
      009852 93               [ 1] 1366 	rlwa x 
      009853 EE 01 72         [ 1] 1367 	or a,acc8 
      009856 A9               [ 1] 1368 	rlwa x 
      009857 00 03            [ 2] 1369 	jra 6$  
      001C63                       1370 5$: ; A:X XOR acc24 
      009859 72 C7            [ 1] 1371 	ld a,(ATMP,sp)
      00985B 00 1A 72         [ 1] 1372 	xor a,acc24 
      00985E 5C               [ 1] 1373 	rlwa x 
      00985F 00 1B 72         [ 1] 1374 	xor a,acc16 
      009862 CF               [ 1] 1375 	rlwa x 
      009863 00 1A 5B         [ 1] 1376 	xor a,acc8 
      009866 04               [ 1] 1377 	rlwa x 
      001C71                       1378 6$: _xpush
      009867 81 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



      009868 90 F7            [ 1]    2     ld (y),a 
      009868 C6 00 02         [ 2]    3     ldw (1,y),x 
      00986B C7 00            [ 2] 1379 	jra 1$ 
      00986D 03 C0            [ 1] 1380 8$:	ld a,#TK_INTGR 
      001C7E                       1381 9$:	_drop VSIZE 
      00986F 00 04            [ 2]    1     addw sp,#VSIZE 
      009871 27               [ 4] 1382 	ret 
                                   1383 
                                   1384 
                                   1385 ;--------------------------------------------
                                   1386 ; BASIC: HEX 
                                   1387 ; select hexadecimal base for integer print
                                   1388 ;---------------------------------------------
      001C81                       1389 hex_base:
      009872 0D 10 00 0A      [ 1] 1390 	mov base,#16 
      009873 81               [ 4] 1391 	ret 
                                   1392 
                                   1393 ;--------------------------------------------
                                   1394 ; BASIC: DEC 
                                   1395 ; select decimal base for integer print
                                   1396 ;---------------------------------------------
      001C86                       1397 dec_base:
      009873 CE 00 05 72      [ 1] 1398 	mov base,#10
      009877 BB               [ 4] 1399 	ret 
                                   1400 
                                   1401 ;------------------------
                                   1402 ; BASIC: FREE 
                                   1403 ; return free size in RAM 
                                   1404 ; output:
                                   1405 ;   A:x		size 
                                   1406 ;--------------------------
      001C8B                       1407 free:
      009878 00               [ 1] 1408 	clr a 
      009879 01 F6 5C         [ 2] 1409 	ldw x,#tib 
      00987C 72 5C 00 02      [ 2] 1410 	subw x,dvar_end 
      009880 81               [ 4] 1411 	ret 
                                   1412 
                                   1413 ;------------------------------
                                   1414 ; BASIC: SIZE 
                                   1415 ; command that print 
                                   1416 ; program start addres and size 
                                   1417 ;------------------------------
      009881                       1418 cmd_size:
      009881 F6 27 03         [ 1] 1419 	push base 
      009884 5C 20 FA         [ 2] 1420 	ldw x,#PROG_ADDR 
      009887 5C 72 B0         [ 4] 1421 	call puts 
      00988A 00 05 CF         [ 2] 1422 	ldw x,txtbgn     
      00988D 00 01 81 0A      [ 1] 1423 	mov base,#16 
      009890 CD 18 30         [ 4] 1424 	call prt_i16
      009890 FE 72 5C         [ 1] 1425 	pop base 
      009893 00 02 72         [ 2] 1426 	ldw x,#PROG_SIZE 
      009896 5C 00 02         [ 4] 1427 	call puts 
      009899 81 00 1D         [ 2] 1428 	ldw x,txtend 
      00989A 72 B0 00 1B      [ 2] 1429 	subw x,txtbgn 
      00989A F6 EE 01         [ 4] 1430 	call prt_i16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



      00989D 72 5C 00         [ 2] 1431 	ldw x,#STR_BYTES 
      0098A0 02 72 5C         [ 4] 1432 	call puts  
      0098A3 00               [ 4] 1433 	ret 
                                   1434 
                                   1435 
                                   1436 ;------------------------
                                   1437 ; BASIC: UBOUND  
                                   1438 ; return array variable size 
                                   1439 ; and set 'array_size' variable 
                                   1440 ; output:
                                   1441 ;   A:X 	array_size
                                   1442 ;--------------------------
      001CC1                       1443 ubound:
      0098A4 02 72 5C         [ 4] 1444 	call free 
      0098A7 00 02            [ 1] 1445 	ld a,#CELL_SIZE 
      0098A9 81               [ 2] 1446 	div x,a 
      0098AA CF 00 20         [ 2] 1447 	ldw array_size,x
      0098AA F6               [ 1] 1448 	clr a 
      0098AB 72               [ 4] 1449 	ret 
                                   1450 
                                   1451 ;-----------------------------
                                   1452 ; BASIC: LET var=expr 
                                   1453 ; variable assignement 
                                   1454 ; output:
                                   1455 ;   A 		TK_NONE 
                                   1456 ;-----------------------------
      001CCC                       1457 let::
      0098AC 5C 00 02         [ 4] 1458 	call next_token 
      0098AF 81 85            [ 1] 1459 	cp a,#TK_VAR 
      0098B0 27 0C            [ 1] 1460 	jreq let_var
      0098B0 72 5F            [ 1] 1461 	cp a,#TK_ARRAY 
      0098B2 00 0D            [ 1] 1462 	jreq  let_array
      0098B4 CF 00 0E         [ 2] 1463 	jp syntax_error
      001CDA                       1464 let_array:
      0098B7 A6 10 C1         [ 4] 1465 	call get_array_element
      0098BA 00 0B            [ 2] 1466 	jra let_eval 
      001CDF                       1467 let_var:
      0098BC 27 09 72         [ 4] 1468 	call get_addr
      001CE2                       1469 let_eval:
      0098BF 0F 00 0E         [ 2] 1470 	ldw ptr16,x  ; variable address 
      0098C2 04 72 53         [ 4] 1471 	call next_token 
      0098C5 00 0D            [ 1] 1472 	cp a,#TK_EQUAL
      0098C7 27 03            [ 1] 1473 	jreq 1$
      0098C7 A6 FF CD         [ 2] 1474 	jp syntax_error
      001CEF                       1475 1$:	
      0098CA 98 ED CD         [ 4] 1476 	call condition   
      0098CD 91 C0            [ 1] 1477 	cp a,#TK_INTGR 
      0098CF 88 CD            [ 1] 1478 	jreq 2$
      0098D1 89 DC 84         [ 2] 1479 	jp syntax_error
      001CF9                       1480 2$:	
      001CF9                       1481 	_xpop ; value 
      0098D4 81 F6            [ 1]    1     ld a,(y)
      0098D5 93               [ 1]    2     ldw x,y 
      0098D5 90 F6            [ 2]    3     ldw x,(1,x)
      0098D7 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      001D02                       1482 3$:
      0098DB A9 00 03 C7      [ 4] 1483 	ld [ptr16],a
      0098DF 00 0D CF 00      [ 1] 1484 	inc ptr8  
      0098E3 0E CD 98 C7      [ 5] 1485 	ldw [ptr16],x 
      0098E7 A6               [ 4] 1486 	ret 
                                   1487 
                                   1488 
                                   1489 ;--------------------------
                                   1490 ; return constant/dvar value 
                                   1491 ; from it's record address
                                   1492 ; input:
                                   1493 ;	X	*const record 
                                   1494 ; output:
                                   1495 ;   A:X   const  value
                                   1496 ;--------------------------
      001D0F                       1497 get_value: ; -- i 
      0098E8 20               [ 1] 1498 	ld a,(x) ; record size 
      0098E9 CD 89            [ 1] 1499 	and a,#NAME_MAX_LEN
      0098EB 7F 81            [ 1] 1500 	sub a,#CELL_SIZE ; * value 
      0098ED 88               [ 1] 1501 	push a 
      0098ED 52 04            [ 1] 1502 	push #0 
      0098EF 0F 02 0F         [ 2] 1503 	addw x,(1,sp)
      0098F2 01               [ 1] 1504 	ld a,(x)
      0098F3 4D 27            [ 2] 1505 	ldw x,(1,x)
      001D1D                       1506 	_drop 2
      0098F5 11 C6            [ 2]    1     addw sp,#2 
      0098F7 00               [ 4] 1507 	ret 
                                   1508 
                                   1509 
                                   1510 ;--------------------------
                                   1511 ; BASIC: EEFREE 
                                   1512 ; eeprom_free 
                                   1513 ; search end of data  
                                   1514 ; in EEPROM 
                                   1515 ; input:
                                   1516 ;    none 
                                   1517 ; output:
                                   1518 ;    A:X     address free
                                   1519 ;-------------------------
      001D20                       1520 func_eefree:
      0098F8 0B A1 0A         [ 2] 1521 	ldw x,#EEPROM_BASE 
      0098FB 26 0A 72 0F      [ 1] 1522 1$:	mov acc8,#8 ; count 8 consecutive zeros
      0098FF 00 0D 05         [ 2] 1523     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009902 03 01            [ 1] 1524 	jruge 8$ ; no free space 
      009904 CD               [ 1] 1525 2$: ld a,(x)
      009905 82 9D            [ 1] 1526 	jrne 3$
      009907 5C               [ 1] 1527 	incw x 
      009907 AE 16 90 1C      [ 1] 1528 	dec acc8 
      00990B 00 50            [ 1] 1529 	jrne 2$
      00990D 5A 7F 08         [ 2] 1530 	subw x,#8 
      00990F 20 09            [ 2] 1531 	jra 9$  
      00990F C6               [ 1] 1532 3$: ld a,(x)
      009910 00               [ 1] 1533 	incw x
      009911 0B               [ 1] 1534 	tnz a  
      009912 CD 83            [ 1] 1535 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



      009914 69               [ 2] 1536 	decw x   
      009915 AB 30            [ 2] 1537 	jra 1$ 
      009917 A1               [ 1] 1538 8$: clrw x ; no free space 
      009918 3A               [ 1] 1539 9$: clr a 
      009919 2B 02 AB         [ 2] 1540 	ldw free_eeprom,x ; save in system variable 
      00991C 07               [ 4] 1541 	ret 
                                   1542 
                           000005  1543 REC_XTRA_BYTES=5 
                                   1544 ;--------------------------
                                   1545 ; search constant/dim_var name 
                                   1546 ; format of record  
                                   1547 ;   .byte record length 
                                   1548 ;         = strlen(name)+5 
                                   1549 ;   .asciz name (variable length)
                                   1550 ;   .int24 value (3 bytes )
                                   1551 ; a constant record use 7+ bytes
                                   1552 ; constants are saved in EEPROM  
                                   1553 ; input:
                                   1554 ;    A     record_len 
                                   1555 ;    X     *name
                                   1556 ; output:
                                   1557 ;    X     address|0
                                   1558 ; use:
                                   1559 ;   A,Y, acc16 
                                   1560 ;-------------------------
                           000001  1561 	NAMEPTR=1 ; target name pointer 
                           000003  1562 	WLKPTR=3   ; walking pointer in EEPROM||RAM 
                           000005  1563 	RECLEN=5  ; record length of target
                           000007  1564 	LIMIT=7   ; search area limit 
                           000008  1565 	VSIZE=8  
      00991D                       1566 search_name:
      00991D 5A F7            [ 2] 1567 	pushw y 
      001D4B                       1568 	_vars VSIZE
      00991F 0C 02            [ 2]    1     sub sp,#VSIZE 
      009921 C6 00 0D CA      [ 1] 1569 	clr acc16 
      009925 00 0E            [ 1] 1570 	ld (RECLEN,sp),a    
      009927 CA 00            [ 2] 1571 	ldw (NAMEPTR,sp),x
      009929 0F 26 E3         [ 2] 1572 	ldw x,dvar_end 
      00992C C6 00            [ 2] 1573 	ldw (LIMIT,sp),x 
      00992E 0B A1 10 27      [ 2] 1574 	ldw y,dvar_bgn
      009932 08 7B            [ 2] 1575 1$:	ldw (WLKPTR,sp),y
      009934 01               [ 1] 1576 	ldw x,y 
      009935 27 0A            [ 2] 1577 	cpw x, (LIMIT,sp) 
      009937 A6 2D            [ 1] 1578 	jruge 7$ ; no match found 
      009939 20 02            [ 1] 1579 	ld a,(y)
      00993B A4 0F            [ 1] 1580 	and a,#NAME_MAX_LEN
      00993B A6 24            [ 1] 1581 	cp a,(RECLEN,sp)
      00993D 5A F7            [ 1] 1582 	jrne 2$ 
      00993F 0C 02            [ 1] 1583 	incw y 
      009941 1E 01            [ 2] 1584 	ldw x,(NAMEPTR,sp)
      009941 7B 02 5B         [ 4] 1585 	call strcmp
      009944 04 81            [ 1] 1586 	jrne 8$ ; match found 
      009946                       1587 2$: ; skip this one 	
      009946 A1 61            [ 2] 1588 	ldW Y,(WLKPTR,sp)
      009948 2A 01            [ 1] 1589 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      00994A 81 A1            [ 1] 1590 	and a,#NAME_MAX_LEN 
      00994C 7A 22 FB         [ 1] 1591 	ld acc8,a 
      00994F A0 20 81 0D      [ 2] 1592 	addw y,acc16 
      009952 20 D9            [ 2] 1593 	jra 1$  
      001D85                       1594 7$: ; no match found 
      009952 52 05            [ 1] 1595 	clr (WLKPTR,sp)
      009954 1F 04            [ 1] 1596 	clr (WLKPTR+1,sp)
      001D89                       1597 8$: ; match found 
      009956 4F 5F            [ 2] 1598 	ldw x,(WLKPTR,sp) ; record address 
      001D8B                       1599 9$:	_DROP VSIZE
      009958 72 A2            [ 2]    1     addw sp,#VSIZE 
      00995A 00 03            [ 2] 1600 	popw y 
      00995C 90               [ 4] 1601 	 ret 
                                   1602 
                                   1603 ;--------------------------------------------
                                   1604 ; BASIC: CONST name=value [, name=value]*
                                   1605 ; define constant(s) saved in EEPROM
                                   1606 ; share most of his code with cmd_dim 
                                   1607 ;--------------------------------------------
                           000001  1608 	VAR_NAME=1 
                           000003  1609 	REC_LEN=3
                           000005  1610 	RONLY=5
                           000005  1611 	VSIZE=5
      001D90                       1612 cmd_const:
      00995D F7 90 EF 01 0F   [ 2] 1613 	btjt flags,#FRUN,0$
      009962 01 A6            [ 1] 1614 	ld a,#ERR_RUN_ONLY
      009964 0A 6B 02         [ 2] 1615 	jp tb_error 
      001D9A                       1616 0$: 
      001D9A                       1617 	_vars VSIZE 
      009967 1E 04            [ 2]    1     sub sp,#VSIZE 
      009969 F6 27            [ 1] 1618 	ld a,#128 
      00996B 4E A1            [ 1] 1619 	ld (RONLY,sp),a 
      00996D 2D 26            [ 1] 1620 	clr (REC_LEN,sp)
      00996F 04 03            [ 2] 1621 	jra cmd_dim2 ; shared code with cmd_dim  
                                   1622 
                                   1623 ;---------------------------------
                                   1624 ; BASIC: DIM var_name [var_name]* 
                                   1625 ; create named variables at end 
                                   1626 ; of BASIC program. 
                                   1627 ; These variables are initialized 
                                   1628 ; to 0. 
                                   1629 ; record format same ast CONST 
                                   1630 ; but r/w because stored in RAM 
                                   1631 ;---------------------------------
      001DA4                       1632 cmd_dim:
      009971 01 20 08 A1 24   [ 2] 1633 	btjt flags,#FRUN,cmd_dim1
      009976 26 08            [ 1] 1634 	ld a,#ERR_RUN_ONLY
      009978 A6 10 6B         [ 2] 1635 	jp tb_error 
      001DAE                       1636 cmd_dim1:	
      001DAE                       1637 	_vars VSIZE
      00997B 02 5C            [ 2]    1     sub sp,#VSIZE 
      00997D 1F 04            [ 1] 1638 	clr (REC_LEN,sp )
      00997F F6 05            [ 1] 1639 	clr (RONLY,sp)
      009980                       1640 cmd_dim2: 
      009980 A1 61 2B         [ 4] 1641 0$:	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      009983 02 A0            [ 1] 1642 	cp a,#TK_LABEL  
      009985 20 A1            [ 1] 1643 	jreq 1$ 
      009987 30 2B 30         [ 2] 1644 	jp syntax_error 
      00998A A0 30            [ 2] 1645 1$: ldw (VAR_NAME,sp),x ; name pointer 
      00998C A1 0A 2B         [ 4] 1646 	call strlen
      00998F 06 A0            [ 1] 1647 	add a,#REC_XTRA_BYTES
      009991 07 11            [ 1] 1648 	ld (REC_LEN+1,sp),a
      009993 02 2A 24         [ 4] 1649 	call skip_string 
      009996 6B 03            [ 1] 1650 	ld a,(REC_LEN+1,sp)
      009998 7B 02            [ 2] 1651 	ldw x,(VAR_NAME,sp) 
      00999A CD 82 BA         [ 4] 1652 	call search_name  
      00999D 72               [ 2] 1653 	tnzw x 
      00999E A2 00            [ 1] 1654 	jreq 2$
      0099A0 03 90            [ 1] 1655 	ld a,#ERR_DUPLICATE
      0099A2 F7 90 EF         [ 2] 1656 	jp tb_error  
      0099A5 01 5F 7B         [ 2] 1657 2$:	ldw x,dvar_end 
      0099A8 03 02            [ 1] 1658 	ld a,(REC_LEN+1,sp)
      0099AA 72 A2            [ 1] 1659 	or a,(RONLY,sp)
      0099AC 00               [ 1] 1660 	ld (x),a 
      0099AD 03               [ 1] 1661 	incw x 
      0099AE 90 F7            [ 2] 1662 	pushw y 
      0099B0 90 EF            [ 2] 1663 	ldw y,(VAR_NAME+2,sp)
      0099B2 01 CD 81         [ 4] 1664 	call strcpy
      0099B5 FE 1E            [ 2] 1665 	popw y 
      0099B7 04               [ 2] 1666 	decw x
      0099B8 20 C2 0D         [ 2] 1667 	addw x,(REC_LEN,sp)
      0099BB 01 27 03         [ 2] 1668 	ldw dvar_end,x 
      0099BE CD 82 83         [ 2] 1669 	subw x,#CELL_SIZE  
      0099C1 7F               [ 1] 1670 	clr (x)
      0099C1 90 F6            [ 1] 1671 	clr (1,x)  
      0099C3 93 EE            [ 1] 1672 	clr (2,x)
      0099C5 01 72 A9         [ 4] 1673 4$: call next_token 
      0099C8 00 03            [ 1] 1674 	cp a,#TK_COMMA 
      0099CA C7 00            [ 1] 1675 	jreq 0$ 
      0099CC 0D CF            [ 1] 1676 	cp a,#TK_EQUAL 
      0099CE 00 0E            [ 1] 1677 	jrne 8$
                                   1678 ; initialize variable 
      0099D0 5B 05 81         [ 4] 1679 	call condition 
      0099D3 A1 84            [ 1] 1680 	cp a,#TK_INTGR
      0099D3 52 05            [ 1] 1681 	jreq 5$
      0099D5 17 04 84         [ 2] 1682 	jp syntax_error
      0099D7 CE 00 32         [ 2] 1683 5$: ldw x,dvar_end 
      0099D7 1F 02 F6         [ 2] 1684 	subw x,#CELL_SIZE 
      0099DA A4 0F 6B         [ 2] 1685 	ldw ptr16,x 
      001E18                       1686 	_xpop 
      0099DD 01 16            [ 1]    1     ld a,(y)
      0099DF 04               [ 1]    2     ldw x,y 
      0099E0 5C 01            [ 2]    3     ldw x,(1,x)
      0099E1 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      0099E1 90 F6 27 1B      [ 4] 1687 	ld [ptr16],a 
      0099E5 0D 01 27 0A      [ 1] 1688 	inc ptr8 
      0099E9 F1 26 07 90      [ 5] 1689 	ldw [ptr16],x 
      0099ED 5C 5C            [ 2] 1690 	jra 4$ 
      001E2F                       1691 8$:	
      001E2F                       1692 	_unget_token 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      0099EF 0A 01 20 EE 01   [ 1]    1      mov in,in.saved  
      0099F3                       1693 	_drop VSIZE 
      0099F3 1E 02            [ 2]    1     addw sp,#VSIZE 
      0099F5 1D 00 02         [ 4] 1694 	call ubound 
      0099F8 4B               [ 4] 1695 	ret 
                                   1696 
                                   1697 
                                   1698 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1699 ; return program size 
                                   1700 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E3A                       1701 prog_size:
      0099F9 00 FE 84         [ 2] 1702 	ldw x,txtend 
      0099FC 27 1D 20 D7      [ 2] 1703 	subw x,txtbgn 
      009A00 81               [ 4] 1704 	ret 
                                   1705 
                                   1706 ;----------------------------
                                   1707 ; print program information 
                                   1708 ;---------------------------
      001E42                       1709 program_info: 
      009A00 1E 02 F6         [ 2] 1710 	ldw x,#PROG_ADDR 
      009A03 6B 01 A4         [ 4] 1711 	call puts 
      009A06 0F 4C C7         [ 2] 1712 	ldw x,txtbgn 
      009A09 00 0F 72 5F      [ 1] 1713 	mov base,#16 
      009A0D 00 0E 72         [ 4] 1714 	call prt_i16
      009A10 BB 00 0E FE      [ 1] 1715 	mov base,#10  
      009A14 7B 01 A4         [ 2] 1716 	ldw x,#PROG_SIZE
      009A17 F0 4E AB         [ 4] 1717 	call puts 
      009A1A 80 1E 3A         [ 4] 1718 	call prog_size 
      009A1B CD 18 30         [ 4] 1719 	call prt_i16 
      009A1B 5B 05 81         [ 2] 1720 	ldw x,#STR_BYTES 
      009A1E CD 09 5C         [ 4] 1721 	call puts
      009A1E 88 CD 98         [ 2] 1722 	ldw x,txtbgn
      009A21 68 11 01         [ 2] 1723 	cpw x,#app 
      009A24 27 03            [ 1] 1724 	jrult 2$
      009A26 CC 97 04         [ 2] 1725 	ldw x,#FLASH_MEM 
      009A29 84 81            [ 2] 1726 	jra 3$
      009A2B AE 1E BC         [ 2] 1727 2$: ldw x,#RAM_MEM 	 
      009A2B A6 06 CD         [ 4] 1728 3$:	call puts 
      009A2E 9A 1E            [ 1] 1729 	ld a,#CR 
      009A30 CD 08 FF         [ 4] 1730 	call putc
      009A30 4B               [ 4] 1731 	ret 
                                   1732 
      009A31 00 CD 9C 8D 4D 27 12  1733 PROG_ADDR: .asciz "program address: "
             0C 01 CD 98 68 A1 08
             27 F1 A1 07
      009A43 27 05 55 00 03 00 02  1734 PROG_SIZE: .asciz ", program size: "
             84 81 20 73 69 7A 65
             3A 20 00
      009A4C 20 62 79 74 65 73 00  1735 STR_BYTES: .asciz " bytes" 
      009A4C CD 9A 2B A1 01 27 03  1736 FLASH_MEM: .asciz " in FLASH memory" 
             CC 97 04 90 F6 93 EE
             01 72 A9
      009A5D 00 03 C3 00 21 23 05  1737 RAM_MEM:   .asciz " in RAM memory" 
             A6 0A CC 97 06 5D 27
             F8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



                                   1738 
                                   1739 
                                   1740 ;----------------------------
                                   1741 ; BASIC: LIST [[start][,end]]
                                   1742 ; list program lines 
                                   1743 ; form start to end 
                                   1744 ; if empty argument list then 
                                   1745 ; list all.
                                   1746 ;----------------------------
                           000001  1747 	FIRST=1
                           000003  1748 	LAST=3 
                           000005  1749 	LN_PTR=5
                           000006  1750 	VSIZE=6 
      001ECB                       1751 list:
      009A6C 89 58 72 FB 01   [ 2] 1752 	btjf flags,#FRUN,0$
      009A71 1F 01            [ 1] 1753 	ld a,#ERR_CMD_ONLY
      009A73 AE 16 90         [ 2] 1754 	jp tb_error
      001ED5                       1755 0$:	 
      009A76 72 F0 01         [ 4] 1756 	call prog_size 
      009A79 5B 02            [ 1] 1757 	jrugt 3$
      009A7B 81               [ 4] 1758 	ret 
      009A7C                       1759 3$: _vars VSIZE
      009A7C 52 01            [ 2]    1     sub sp,#VSIZE 
      009A7E 0F 01 CD         [ 2] 1760 	ldw x,txtbgn 
      009A81 98 68            [ 2] 1761 	ldw (LN_PTR,sp),x 
      009A83 4D               [ 2] 1762 	ldw x,(x) 
      009A84 26 03            [ 2] 1763 	ldw (FIRST,sp),x ; list from first line 
      009A86 CC 9B 2E         [ 2] 1764 	ldw x,#MAX_LINENO ; biggest line number 
      009A89 A1 10            [ 2] 1765 	ldw (LAST,sp),x 
      009A8B 27 06 A1         [ 4] 1766 	call arg_list
      009A8E 11               [ 1] 1767 	tnz a
      009A8F 26 05            [ 1] 1768 	jreq list_loop 
      009A91 03 01            [ 1] 1769 	cp a,#2 
      009A93 27 07            [ 1] 1770 	jreq 4$
      009A93 CD 98            [ 1] 1771 	cp a,#1 
      009A95 68 06            [ 1] 1772 	jreq first_line 
      009A96 CC 16 84         [ 2] 1773 	jp syntax_error 
      009A96 4D               [ 2] 1774 4$:	popw x 
      009A97 26 03            [ 2] 1775 	ldw (LAST+2,sp),x 
      001EFE                       1776 first_line:
      009A99 CC               [ 2] 1777 	popw x
      009A9A 97 04            [ 2] 1778 	ldw (FIRST,sp),x 
      009A9C                       1779 lines_skip:
      009A9C A1 81 26         [ 2] 1780 	ldw x,txtbgn
      009A9F 0C FE            [ 2] 1781 2$:	ldw (LN_PTR,sp),x 
      009AA1 72 5C 00         [ 2] 1782 	cpw x,txtend 
      009AA4 02 72            [ 1] 1783 	jrpl list_exit 
      009AA6 5C               [ 2] 1784 	ldw x,(x) ;line# 
      009AA7 00 02            [ 2] 1785 	cpw x,(FIRST,sp)
      009AA9 FD 20            [ 1] 1786 	jrpl list_loop 
      009AAB 70 05            [ 2] 1787 	ldw x,(LN_PTR,sp) 
      009AAC E6 02            [ 1] 1788 	ld a,(2,x)
      009AAC A1 84 26         [ 1] 1789 	ld acc8,a 
      009AAF 05 CD 98 9A      [ 1] 1790 	clr acc16 
      009AB3 20 67 00 0D      [ 2] 1791 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      009AB5 20 E3            [ 2] 1792 	jra 2$ 
                                   1793 ; print loop
      001F21                       1794 list_loop:
      009AB5 A1 05            [ 2] 1795 	ldw x,(LN_PTR,sp)
      009AB7 26 05            [ 1] 1796 	ld a,(2,x) 
      009AB9 CD 9A 4C         [ 4] 1797 	call prt_basic_line
      009ABC 20 07            [ 2] 1798 	ldw x,(LN_PTR,sp)
      009ABE E6 02            [ 1] 1799 	ld a,(2,x)
      009ABE A1 85 26         [ 1] 1800 	ld acc8,a 
      009AC1 08 CD 98 90      [ 1] 1801 	clr acc16 
      009AC5 72 BB 00 0D      [ 2] 1802 	addw x,acc16
      009AC5 F6 EE 01         [ 2] 1803 	cpw x,txtend 
      009AC8 20 52            [ 1] 1804 	jrpl list_exit
      009ACA 1F 05            [ 2] 1805 	ldw (LN_PTR,sp),x
      009ACA A1               [ 2] 1806 	ldw x,(x)
      009ACB 03 26            [ 2] 1807 	cpw x,(LAST,sp)  
      009ACD 1D 90            [ 1] 1808 	jrslt list_loop
      001F43                       1809 list_exit:
      009ACF 89 89 CD 98 81   [ 1] 1810 	mov in,count 
      009AD4 85 CD 94         [ 2] 1811 	ldw x,#pad 
      009AD7 06 AB 05         [ 2] 1812 	ldw basicptr,x 
      001F4E                       1813 	_drop VSIZE 
      009ADA CD 9D            [ 2]    1     addw sp,#VSIZE 
      009ADC C9 5D 26         [ 4] 1814 	call program_info 
      009ADF 04               [ 4] 1815 	ret
                                   1816 
                                   1817 
                                   1818 ;--------------------------
                                   1819 ; BASIC: EDIT addr 
                                   1820 ;  copy program in FLASH 
                                   1821 ;  to RAM for edition 
                                   1822 ;-------------------------
      001F54                       1823 edit:
      009AE0 90 85 20         [ 4] 1824 	call next_token 
      009AE3 30 84            [ 1] 1825 	cp a,#TK_INTGR
      009AE4 27 03            [ 1] 1826 	jreq 0$ 
      009AE4 90 85 CD         [ 2] 1827 	jp syntax_error 
      009AE7 9D 8F 20         [ 4] 1828 0$: call get_int24
      009AEA 31 24 CD         [ 4] 1829 	call is_program_addr
      009AEB 27 06            [ 1] 1830 	jreq 1$ 
      009AEB A1 82 26         [ 2] 1831 	ldw x,#ERR_NO_PROGRAM
      009AEE 0E FE 72         [ 2] 1832 	jp tb_error 
      009AF1 5C 00            [ 2] 1833 1$: pushw y 
      009AF3 02 72            [ 1] 1834 	ldw y,x ; source address 
      009AF5 5C 00 02         [ 2] 1835     subw x,#4 
      009AF8 FD 5F            [ 2] 1836 	ldw x,(2,x) ; program size 
      009AFA 02 20 1F         [ 2] 1837 	addw x,#4 
      009AFD CF 00 0D         [ 2] 1838 	ldw acc16,x  ; bytes to copy 
      009AFD A1 06 26         [ 2] 1839 	ldw x,#rsign ; destination address 
      009B00 13 CD 9B 74      [ 2] 1840 	subw y,#4 
      009B04 A6 07 CD         [ 4] 1841 	call move  
      009B07 9A 1E 90         [ 2] 1842 	ldw x,#free_ram 
      009B0A F6 93 EE         [ 2] 1843 	ldw txtbgn,x 
      009B0D 01 72 A9 00      [ 2] 1844 	addw x,rsize  
      009B11 03 20 08         [ 2] 1845 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      009B14 90 85            [ 2] 1846 	popw y  
      009B14 55               [ 4] 1847 	ret 
                                   1848 
                                   1849 ;--------------------------
                                   1850 ; decompile line from token list
                                   1851 ; and print it. 
                                   1852 ; input:
                                   1853 ;   A       stop at this position 
                                   1854 ;   X 		pointer at line
                                   1855 ; output:
                                   1856 ;   none 
                                   1857 ;--------------------------	
      001F95                       1858 prt_basic_line:
      009B15 00 03            [ 2] 1859 	pushw y 
      009B17 00 02 4F         [ 1] 1860 	ld count,a 
      009B1A 20 12            [ 1] 1861 	ld a,(2,x)
      009B1C C1 00 03         [ 1] 1862 	cp a,count 
      009B1C 0D 01            [ 1] 1863 	jrpl 1$ 
      009B1E 27 03 CD         [ 1] 1864 	ld count,a 
      009B21 82 95 04         [ 2] 1865 1$:	ldw basicptr,x 
      009B23 90 AE 16 90      [ 2] 1866 	ldw y,#tib  
      009B23 72 A2 00         [ 4] 1867 	call decompile 
      009B26 03 90 F7         [ 4] 1868 	call puts 
      009B29 90 EF            [ 1] 1869 	ld a,#CR 
      009B2B 01 A6 84         [ 4] 1870 	call putc 
      009B2E 90 85            [ 2] 1871 	popw y 
      009B2E 5B               [ 4] 1872 	ret 
                                   1873 
                                   1874 
                                   1875 ;---------------------------------
                                   1876 ; BASIC: PRINT|? arg_list 
                                   1877 ; print values from argument list
                                   1878 ;----------------------------------
                           000001  1879 	CCOMMA=1
                           000001  1880 	VSIZE=1
      001FB9                       1881 print:
      001FB9                       1882 	_vars VSIZE 
      009B2F 01 81            [ 2]    1     sub sp,#VSIZE 
      009B31                       1883 reset_comma:
      009B31 52 01            [ 1] 1884 	clr (CCOMMA,sp)
      001FBD                       1885 prt_loop:
      009B33 CD 9A 7C         [ 4] 1886 	call next_token
      009B36 4D 27            [ 1] 1887 	cp a,#CMD_END 
      009B38 38 08            [ 1] 1888 	jrult 0$
      009B39 A1 0A            [ 1] 1889 	cp a,#TK_COLON 
      009B39 CD 98            [ 1] 1890 	jreq 0$
      009B3B 68 6B            [ 1] 1891 	cp a,#TK_CMD
      009B3D 01 A4            [ 1] 1892 	jrne 10$
      001FCC                       1893 0$:
      001FCC                       1894 	_unget_token 
      009B3F 30 A1 20 27 09   [ 1]    1      mov in,in.saved  
      009B44 A6 84            [ 2] 1895 	jra 8$ 
      001FD3                       1896 10$:	
      009B46 55 00            [ 1] 1897 	cp a,#TK_QSTR
      009B48 03 00            [ 1] 1898 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009B4A 02 20            [ 1] 1899 	cp a,#TK_CHAR 
      009B4C 24 1B            [ 1] 1900 	jreq 2$ 
      009B4D A1 82            [ 1] 1901 	cp a,#TK_CFUNC 
      009B4D CD 9A            [ 1] 1902 	jreq 3$
      009B4F 7C 4D            [ 1] 1903 	cp a,#TK_COMMA 
      009B51 26 03            [ 1] 1904 	jreq 4$
      009B53 CC 97            [ 1] 1905 	cp a,#TK_SHARP 
      009B55 04 2A            [ 1] 1906 	jreq 5$
      009B56 20 3D            [ 2] 1907 	jra 7$ 
      001FE9                       1908 1$:	; print string 
      009B56 7B 01 A1         [ 4] 1909 	call puts
      009B59 20               [ 1] 1910 	incw x
      009B5A 26 05 CD 82      [ 2] 1911 	subw x,basicptr 
      009B5E F9 20 D8         [ 2] 1912 	ldw in.w,x  
      009B61 A1 21            [ 2] 1913 	jra reset_comma
      001FF6                       1914 2$:	; print character 
      009B63 26 05 CD         [ 4] 1915 	call get_char 
      009B66 83 87 20         [ 4] 1916 	call putc 
      009B69 CF BD            [ 2] 1917 	jra reset_comma 
      009B6A                       1918 3$: ; print character function value  	
      001FFE                       1919 	_get_code_addr 
      009B6A CD               [ 2]    1         ldw x,(x)
      009B6B 84 21 20 CA      [ 1]    2         inc in 
      009B6F 72 5C 00 01      [ 1]    3         inc in 
      009B6F A6               [ 4] 1920 	call (x)
      009B70 84 08 FF         [ 4] 1921 	call putc
      009B71 20 AE            [ 2] 1922 	jra reset_comma 
      00200D                       1923 4$: ; set comma state 
      009B71 5B 01            [ 1] 1924 	cpl (CCOMMA,sp)
      009B73 81 AC            [ 2] 1925 	jra prt_loop   
      009B74                       1926 5$: ; # character must be followed by an integer   
      009B74 52 01 CD         [ 4] 1927 	call next_token
      009B77 9B 31            [ 1] 1928 	cp a,#TK_INTGR 
      009B79 4D 27            [ 1] 1929 	jreq 6$
      009B7B 2D 16 84         [ 2] 1930 	jp syntax_error 
      009B7C                       1931 6$: ; set tab width
      009B7C CD 98 68         [ 4] 1932 	call get_int24 
      009B7F 6B               [ 1] 1933 	ld a,xl 
      009B80 01 A4            [ 1] 1934 	and a,#15 
      009B82 30 A1 10         [ 1] 1935 	ld tab_width,a 
      009B85 27 09            [ 2] 1936 	jra reset_comma 
      002026                       1937 7$:	
      002026                       1938 	_unget_token 
      009B87 55 00 03 00 02   [ 1]    1      mov in,in.saved  
      009B8C A6 84 20         [ 4] 1939 	call condition
      009B8F 19               [ 1] 1940 	tnz a 
      009B90 27 05            [ 1] 1941 	jreq 8$    
      009B90 CD 9B 31         [ 4] 1942     call print_top
      009B93 4D 26            [ 2] 1943 	jra reset_comma 
      002036                       1944 8$:
      009B95 03 CC            [ 1] 1945 	tnz (CCOMMA,sp)
      009B97 97 04            [ 1] 1946 	jrne 9$
      009B99 A6 0D            [ 1] 1947 	ld a,#CR 
      009B99 7B 01 A1         [ 4] 1948     call putc 
      00203F                       1949 9$:	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009B9C 10 26            [ 2]    1     addw sp,#VSIZE 
      009B9E 05               [ 4] 1950 	ret 
                                   1951 
                                   1952 ;----------------------
                                   1953 ; 'save_context' and
                                   1954 ; 'rest_context' must be 
                                   1955 ; called at the same 
                                   1956 ; call stack depth 
                                   1957 ; i.e. SP must have the 
                                   1958 ; save value at  
                                   1959 ; entry point of both 
                                   1960 ; routine. 
                                   1961 ;---------------------
                           000004  1962 	CTXT_SIZE=4 ; size of saved data 
                                   1963 ;--------------------
                                   1964 ; save current BASIC
                                   1965 ; interpreter context 
                                   1966 ; on stack 
                                   1967 ;--------------------
      002042                       1968 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002042                       1969 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002042                       1970 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002042                       1971 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002042                       1972 save_context:
      009B9F CD 81 FE         [ 2] 1973 	ldw x,basicptr 
      009BA2 20 D8            [ 2] 1974 	ldw (BPTR,sp),x
      009BA4 C6 00 01         [ 1] 1975 	ld a,in 
      009BA4 CD 82            [ 1] 1976 	ld (IN,sp),a
      009BA6 1B 20 D3         [ 1] 1977 	ld a,count 
      009BA9 6B 06            [ 1] 1978 	ld (CNT,sp),a  
      009BA9 5B               [ 4] 1979 	ret
                                   1980 
                                   1981 ;-----------------------
                                   1982 ; restore previously saved 
                                   1983 ; BASIC interpreter context 
                                   1984 ; from stack 
                                   1985 ;-------------------------
      002052                       1986 rest_context:
      009BAA 01 81            [ 2] 1987 	ldw x,(BPTR,sp)
      009BAC CF 00 04         [ 2] 1988 	ldw basicptr,x 
      009BAC 52 01            [ 1] 1989 	ld a,(IN,sp)
      009BAE CD 9B 74         [ 1] 1990 	ld in,a
      009BB1 4D 27            [ 1] 1991 	ld a,(CNT,sp)
      009BB3 54 CD 98         [ 1] 1992 	ld count,a  
      009BB6 68               [ 4] 1993 	ret
                                   1994 
                                   1995 
                                   1996 
                                   1997 ;------------------------------------------
                                   1998 ; BASIC: INPUT [string]var[,[string]var]
                                   1999 ; input value in variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   2000 ; [string] optionally can be used as prompt 
                                   2001 ;-----------------------------------------
                           000001  2002 	CX_BPTR=1
                           000003  2003 	CX_IN=3
                           000004  2004 	CX_CNT=4
                           000005  2005 	SKIP=5
                           000005  2006 	VSIZE=5
      002062                       2007 input_var:
      009BB7 6B 01            [ 2] 2008 	pushw y 
      002064                       2009 	_vars VSIZE 
      009BB9 A4 30            [ 2]    1     sub sp,#VSIZE 
      002066                       2010 input_loop:
      009BBB A1 30            [ 1] 2011 	clr (SKIP,sp)
      009BBD 27 09 A6         [ 4] 2012 	call next_token 
      009BC0 84 55            [ 1] 2013 	cp a,#TK_QSTR 
      009BC2 00 03            [ 1] 2014 	jrne 1$ 
      009BC4 00 02 20         [ 4] 2015 	call puts 
      009BC7 40               [ 1] 2016 	incw x 
      009BC8 72 B0 00 04      [ 2] 2017 	subw x,basicptr 
      009BC8 CD 9B 74         [ 2] 2018 	ldw in.w,x 
      009BCB 4D 26            [ 1] 2019 	cpl (SKIP,sp)
      009BCD 03 CC 97         [ 4] 2020 	call next_token 
      009BD0 04 85            [ 1] 2021 1$: cp a,#TK_VAR  
      009BD1 27 03            [ 1] 2022 	jreq 2$ 
      009BD1 CD 82 38         [ 2] 2023 	jp syntax_error
      009BD4 90 F6 93         [ 4] 2024 2$:	call get_addr
      009BD7 EE 01 72         [ 2] 2025 	ldw ptr16,x 
      009BDA A9 00            [ 1] 2026 	tnz (SKIP,sp)
      009BDC 03 4D            [ 1] 2027 	jrne 21$ 
      009BDE 2B 08 26         [ 4] 2028 	call var_name 
      009BE1 0C 35 02         [ 4] 2029 	call putc   
      002096                       2030 21$:
      009BE4 00 0F            [ 1] 2031 	ld a,#':
      009BE6 20 0A FF         [ 4] 2032 	call putc 
      009BE8 CD 20 42         [ 4] 2033 	call save_context 
      009BE8 35 04 00 0F      [ 1] 2034 	clr count  
      009BEC 20 04 61         [ 4] 2035 	call readln 
      009BEE AE 16 90         [ 2] 2036 	ldw x,#tib 
      009BEE 35 01 00         [ 1] 2037 	push count
      009BF1 0F 00            [ 1] 2038 	push #0 
      009BF2 72 FB 01         [ 2] 2039 	addw x,(1,sp)
      009BF2 5F               [ 1] 2040 	incw x 
      0020B1                       2041 	_drop 2 
      009BF3 C6 00            [ 2]    1     addw sp,#2 
      009BF5 0F 14 01 27      [ 1] 2042 	clr in 
      009BF9 03 53 A6         [ 4] 2043 	call get_token
      009BFC FF 72            [ 1] 2044 	cp a,#TK_INTGR
      009BFE A2 00            [ 1] 2045 	jreq 3$ 
      009C00 03 90            [ 1] 2046 	cp a,#TK_MINUS
      009C02 F7 90            [ 1] 2047 	jrne 22$
      009C04 EF 01 A6         [ 4] 2048 	call get_token 
      009C07 84 84            [ 1] 2049 	cp a,#TK_INTGR 
      009C08 27 06            [ 1] 2050 	jreq 23$
      0020C9                       2051 22$:
      009C08 5B 01 81         [ 4] 2052 	call rest_context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



      009C0B CC 16 84         [ 2] 2053 	jp syntax_error
      0020CF                       2054 23$:
      009C0B 4B 00 CD         [ 4] 2055 	call neg_acc24	
      0020D2                       2056 3$: 
      009C0E 98 68 4D         [ 1] 2057 	ld a,acc24 
      009C11 27 25 A1         [ 2] 2058 	ldw x,acc16 
      009C14 87 26 04 03      [ 4] 2059 	ld [ptr16],a
      009C18 01 20 F2 1A      [ 1] 2060 	inc ptr8  
      009C1B 72 CF 00 19      [ 5] 2061 	ldw [ptr16],x 
      009C1B A1 06 26         [ 4] 2062 	call rest_context
      009C1E 0A CD 9C         [ 4] 2063 	call next_token 
      009C21 8D A6            [ 1] 2064 	cp a,#TK_COMMA
      009C23 07 CD            [ 1] 2065 	jrne 4$ 
      009C25 9A 1E 20         [ 2] 2066 	jp input_loop
      0020F1                       2067 4$:
      009C28 08 55            [ 1] 2068 	cp a,#TK_NONE 
      009C2A 00 03            [ 1] 2069 	jreq input_exit  
      009C2C 00 02            [ 1] 2070 	cp a,#TK_COLON 
      009C2E CD 9B            [ 1] 2071     jreq input_exit 
      009C30 AC 16 84         [ 2] 2072 	jp syntax_error 
      009C31                       2073 input_exit:
      0020FC                       2074 	_drop VSIZE 
      009C31 0D 01            [ 2]    1     addw sp,#VSIZE 
      009C33 27 03            [ 2] 2075 	popw y 
      009C35 CD               [ 4] 2076 	ret 
                                   2077 
                                   2078 
                                   2079 ;---------------------
                                   2080 ; BASIC: REM | ' 
                                   2081 ; skip comment to end of line 
                                   2082 ;---------------------- 
      002101                       2083 remark::
      009C36 82 7A 03 00 01   [ 1] 2084 	mov in,count 
      009C38 81               [ 4] 2085  	ret 
                                   2086 
                                   2087 
                                   2088 ;---------------------
                                   2089 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   2090 ; read in loop 'addr'  
                                   2091 ; apply & 'mask' to value 
                                   2092 ; loop while result==0.  
                                   2093 ; 'xor_mask' is used to 
                                   2094 ; invert the wait logic.
                                   2095 ; i.e. loop while not 0.
                                   2096 ;---------------------
                           000001  2097 	XMASK=1 
                           000002  2098 	MASK=2
                           000003  2099 	ADDR=3
                           000004  2100 	VSIZE=4
      002107                       2101 wait: 
      002107                       2102 	_vars VSIZE
      009C38 5B 01            [ 2]    1     sub sp,#VSIZE 
      009C3A 81 01            [ 1] 2103 	clr (XMASK,sp) 
      009C3B CD 19 B0         [ 4] 2104 	call arg_list 
      009C3B CD 9C            [ 1] 2105 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009C3D 0B 4D            [ 1] 2106 	jruge 0$
      009C3F 27 4B CD         [ 2] 2107 	jp syntax_error 
      009C42 98 68            [ 1] 2108 0$:	cp a,#3
      009C44 4D 27            [ 1] 2109 	jrult 1$
      002119                       2110 	_xpop  ; xor mask 
      009C46 43 A1            [ 1]    1     ld a,(y)
      009C48 88               [ 1]    2     ldw x,y 
      009C49 27 07            [ 2]    3     ldw x,(1,x)
      009C4B 55 00 03 00      [ 2]    4     addw y,#CELL_SIZE 
      009C4F 02               [ 1] 2111 	ld a,xl 
      009C50 20 38            [ 1] 2112 	ld (XMASK,sp),a 
      002125                       2113 1$: _xpop ; mask
      009C52 CD 9C            [ 1]    1     ld a,(y)
      009C54 0B               [ 1]    2     ldw x,y 
      009C55 4D 26            [ 2]    3     ldw x,(1,x)
      009C57 03 CC 97 04      [ 2]    4     addw y,#CELL_SIZE 
      009C5B 9F               [ 1] 2114     ld a,xl  
      009C5B 90 F6            [ 1] 2115 	ld (MASK,sp),a 
      002131                       2116 	_xpop ; address 
      009C5D 93 EE            [ 1]    1     ld a,(y)
      009C5F 01               [ 1]    2     ldw x,y 
      009C60 72 A9            [ 2]    3     ldw x,(1,x)
      009C62 00 03 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      009C66 0D               [ 1] 2117 2$:	ld a,(x)
      009C67 CF 00            [ 1] 2118 	and a,(MASK,sp)
      009C69 0E 90            [ 1] 2119 	xor a,(XMASK,sp)
      009C6B F6 93            [ 1] 2120 	jreq 2$ 
      002141                       2121 	_drop VSIZE 
      009C6D EE 01            [ 2]    1     addw sp,#VSIZE 
      009C6F 72               [ 4] 2122 	ret 
                                   2123 
                                   2124 ;---------------------
                                   2125 ; BASIC: BSET addr,mask
                                   2126 ; set bits at 'addr' corresponding 
                                   2127 ; to those of 'mask' that are at 1.
                                   2128 ; arguments:
                                   2129 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2130 ;   mask        mask|addr
                                   2131 ; output:
                                   2132 ;	none 
                                   2133 ;--------------------------
      002144                       2134 bit_set:
      009C70 A9 00 03         [ 4] 2135 	call arg_list 
      009C73 C4 00            [ 1] 2136 	cp a,#2	 
      009C75 0D 02            [ 1] 2137 	jreq 1$ 
      009C77 C4 00 0E         [ 2] 2138 	jp syntax_error
      00214E                       2139 1$: 
      00214E                       2140 	_xpop ; mask 
      009C7A 02 C4            [ 1]    1     ld a,(y)
      009C7C 00               [ 1]    2     ldw x,y 
      009C7D 0F 02            [ 2]    3     ldw x,(1,x)
      009C7F 72 A2 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C83 90               [ 1] 2141 	ld a,xl
      009C84 F7               [ 1] 2142 	push a  
      002159                       2143 	_xpop ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009C85 90 EF            [ 1]    1     ld a,(y)
      009C87 01               [ 1]    2     ldw x,y 
      009C88 20 B7            [ 2]    3     ldw x,(1,x)
      009C8A A6 84 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009C8D 84               [ 1] 2144 	pop a 
      009C8D 52               [ 1] 2145 	or a,(x)
      009C8E 02               [ 1] 2146 	ld (x),a
      009C8F CD               [ 4] 2147 	ret 
                                   2148 
                                   2149 ;---------------------
                                   2150 ; BASIC: BRES addr,mask
                                   2151 ; reset bits at 'addr' corresponding 
                                   2152 ; to those of 'mask' that are at 1.
                                   2153 ; arguments:
                                   2154 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2155 ;   mask	    ~mask&*addr  
                                   2156 ; output:
                                   2157 ;	none 
                                   2158 ;--------------------------
      002166                       2159 bit_reset:
      009C90 9C 3B 4D         [ 4] 2160 	call arg_list 
      009C93 27 69            [ 1] 2161 	cp a,#2  
      009C95 CD 98            [ 1] 2162 	jreq 1$ 
      009C97 68 A1 89         [ 2] 2163 	jp syntax_error
      002170                       2164 1$: 
      002170                       2165 	_xpop ; mask 
      009C9A 27 0B            [ 1]    1     ld a,(y)
      009C9C A1               [ 1]    2     ldw x,y 
      009C9D 8A 27            [ 2]    3     ldw x,(1,x)
      009C9F 07 55 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CA3 00               [ 1] 2166 	ld a,xl 
      009CA4 02               [ 1] 2167 	cpl a
      009CA5 20               [ 1] 2168 	push a  
      00217C                       2169 	_xpop ; addr  
      009CA6 55 6B            [ 1]    1     ld a,(y)
      009CA8 02               [ 1]    2     ldw x,y 
      009CA9 CD 9C            [ 2]    3     ldw x,(1,x)
      009CAB 3B A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
      009CAF 03               [ 1] 2170 	pop a 
      009CB0 CC               [ 1] 2171 	and a,(x)
      009CB1 97               [ 1] 2172 	ld (x),a 
      009CB2 04               [ 4] 2173 	ret 
                                   2174 
                                   2175 ;---------------------
                                   2176 ; BASIC: BTOGL addr,mask
                                   2177 ; toggle bits at 'addr' corresponding 
                                   2178 ; to those of 'mask' that are at 1.
                                   2179 ; arguments:
                                   2180 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2181 ;   mask	    mask^*addr  
                                   2182 ; output:
                                   2183 ;	none 
                                   2184 ;--------------------------
      009CB3                       2185 bit_toggle:
      009CB3 90 F6 93         [ 4] 2186 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      009CB6 EE 01            [ 1] 2187 	cp a,#2 
      009CB8 72 A9            [ 1] 2188 	jreq 1$ 
      009CBA 00 03 C7         [ 2] 2189 	jp syntax_error
      002193                       2190 1$: _xpop ; mask 
      009CBD 00 0D            [ 1]    1     ld a,(y)
      009CBF CF               [ 1]    2     ldw x,y 
      009CC0 00 0E            [ 2]    3     ldw x,(1,x)
      009CC2 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      009CC6 01               [ 1] 2191 	ld a,xl
      009CC7 72               [ 1] 2192 	push a 
      00219E                       2193 	_xpop  ; addr  
      009CC8 A9 00            [ 1]    1     ld a,(y)
      009CCA 03               [ 1]    2     ldw x,y 
      009CCB 6B 01            [ 2]    3     ldw x,(1,x)
      009CCD 7B 02 A1 8A      [ 2]    4     addw y,#CELL_SIZE 
      009CD1 27               [ 1] 2194 	pop a 
      009CD2 10               [ 1] 2195 	xor a,(x)
      009CD3 F7               [ 1] 2196 	ld (x),a 
      009CD3 7B               [ 4] 2197 	ret 
                                   2198 
                                   2199 
                                   2200 ;---------------------
                                   2201 ; BASIC: BTEST(addr,bit)
                                   2202 ; return bit value at 'addr' 
                                   2203 ; bit is in range {0..7}.
                                   2204 ; arguments:
                                   2205 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2206 ;   bit 	    bit position {0..7}  
                                   2207 ; output:
                                   2208 ;	A:X       bit value  
                                   2209 ;--------------------------
      0021AB                       2210 bit_test:
      009CD4 01 CA 00         [ 4] 2211 	call func_args 
      009CD7 0D 02            [ 1] 2212 	cp a,#2
      009CD9 CA 00            [ 1] 2213 	jreq 0$
      009CDB 0E 02 CA         [ 2] 2214 	jp syntax_error
      0021B5                       2215 0$:	
      0021B5                       2216 	_xpop 
      009CDE 00 0F            [ 1]    1     ld a,(y)
      009CE0 02               [ 1]    2     ldw x,y 
      009CE1 20 0E            [ 2]    3     ldw x,(1,x)
      009CE3 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CE3 7B               [ 1] 2217 	ld a,xl 
      009CE4 01 C8            [ 1] 2218 	and a,#7
      009CE6 00               [ 1] 2219 	push a   
      009CE7 0D 02            [ 1] 2220 	ld a,#1 
      009CE9 C8 00            [ 1] 2221 1$: tnz (1,sp)
      009CEB 0E 02            [ 1] 2222 	jreq 2$
      009CED C8               [ 1] 2223 	sll a 
      009CEE 00 0F            [ 1] 2224 	dec (1,sp)
      009CF0 02 72            [ 2] 2225 	jra 1$
      009CF2 A2 00            [ 1] 2226 2$: ld (1,sp),a  
      0021CF                       2227 	_xpop ; address  
      009CF4 03 90            [ 1]    1     ld a,(y)
      009CF6 F7               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009CF7 90 EF            [ 2]    3     ldw x,(1,x)
      009CF9 01 20 99 A6      [ 2]    4     addw y,#CELL_SIZE 
      009CFD 84               [ 1] 2228 	pop a 
      009CFE 5B               [ 1] 2229 	and a,(x)
      009CFF 02 81            [ 1] 2230 	jreq 3$
      009D01 A6 01            [ 1] 2231 	ld a,#1 
      009D01 35               [ 1] 2232 3$:	clrw x 
      009D02 10               [ 1] 2233 	ld xl,a
      009D03 00               [ 1] 2234 	clr a  
      009D04 0B               [ 4] 2235 	ret
                                   2236 
                                   2237 ;--------------------
                                   2238 ; BASIC: POKE addr,byte
                                   2239 ; put a byte at addr 
                                   2240 ;--------------------
      0021E2                       2241 poke:
      009D05 81 19 B0         [ 4] 2242 	call arg_list 
      009D06 A1 02            [ 1] 2243 	cp a,#2
      009D06 35 0A            [ 1] 2244 	jreq 1$
      009D08 00 0B 81         [ 2] 2245 	jp syntax_error
      009D0B                       2246 1$:	
      0021EC                       2247 	_xpop ; byte   
      009D0B 4F AE            [ 1]    1     ld a,(y)
      009D0D 16               [ 1]    2     ldw x,y 
      009D0E 90 72            [ 2]    3     ldw x,(1,x)
      009D10 B0 00 33 81      [ 2]    4     addw y,#CELL_SIZE 
      009D14 9F               [ 1] 2248     ld a,xl 
      009D14 3B               [ 1] 2249 	push a 
      0021F7                       2250 	_xpop ; address 
      009D15 00 0B            [ 1]    1     ld a,(y)
      009D17 AE               [ 1]    2     ldw x,y 
      009D18 9F 01            [ 2]    3     ldw x,(1,x)
      009D1A CD 89 DC CE      [ 2]    4     addw y,#CELL_SIZE 
      009D1E 00               [ 1] 2251 	pop a 
      009D1F 1C               [ 1] 2252 	ld (x),a 
      009D20 35               [ 4] 2253 	ret 
                                   2254 
                                   2255 ;-----------------------
                                   2256 ; BASIC: PEEK(addr)
                                   2257 ; get the byte at addr 
                                   2258 ; input:
                                   2259 ;	none 
                                   2260 ; output:
                                   2261 ;	X 		value 
                                   2262 ;-----------------------
      002203                       2263 peek:
      009D21 10 00 0B         [ 4] 2264 	call func_args
      009D24 CD 98            [ 1] 2265 	cp a,#1 
      009D26 B0 32            [ 1] 2266 	jreq 1$
      009D28 00 0B AE         [ 2] 2267 	jp syntax_error
      00220D                       2268 1$: _xpop ; address  
      009D2B 9F 13            [ 1]    1     ld a,(y)
      009D2D CD               [ 1]    2     ldw x,y 
      009D2E 89 DC            [ 2]    3     ldw x,(1,x)
      009D30 CE 00 1E 72      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



      009D34 B0 00 1C         [ 1] 2269 	ld farptr,a 
      009D37 CD 98 B0         [ 2] 2270 	ldw ptr16,x 
      009D3A AE 9F 24 CD      [ 5] 2271 	ldf a,[farptr]
      009D3E 89               [ 1] 2272 	clrw x 
      009D3F DC               [ 1] 2273 	ld xl,a 
      009D40 81               [ 1] 2274 	clr a 
      009D41 81               [ 4] 2275 	ret 
                                   2276 
                                   2277 ;---------------------------
                                   2278 ; BASIC IF expr : instructions
                                   2279 ; evaluate expr and if true 
                                   2280 ; execute instructions on same line. 
                                   2281 ;----------------------------
      002224                       2282 if: 
      009D41 CD 9D 0B         [ 4] 2283 	call condition  
      002227                       2284 	_xpop 
      009D44 A6 03            [ 1]    1     ld a,(y)
      009D46 62               [ 1]    2     ldw x,y 
      009D47 CF 00            [ 2]    3     ldw x,(1,x)
      009D49 21 4F 81 03      [ 2]    4     addw y,#CELL_SIZE 
      009D4C 4D               [ 1] 2285 	tnz  a  
      009D4C CD 98            [ 1] 2286 	jrne 9$
      009D4E 68               [ 2] 2287 	tnzw x 
      009D4F A1 85            [ 1] 2288 	jrne 9$  
                                   2289 ;skip to next line
      009D51 27 0C A1 05 27   [ 1] 2290 	mov in,count
      00223B                       2291 	_drop 2 
      009D56 03 CC            [ 2]    1     addw sp,#2 
      009D58 97 04 37         [ 2] 2292 	jp next_line
      009D5A 81               [ 4] 2293 9$:	ret 
                                   2294 
                                   2295 ;------------------------
                                   2296 ; BASIC: FOR var=expr 
                                   2297 ; set variable to expression 
                                   2298 ; leave variable address 
                                   2299 ; on stack and set
                                   2300 ; FLOOP bit in 'flags'
                                   2301 ;-----------------
                           000001  2302 	RETL1=1 ; return address  
                           000003  2303 	FSTEP=3  ; variable increment int24
                           000006  2304 	LIMIT=6 ; loop limit, int24  
                           000009  2305 	CVAR=9   ; control variable 
                           00000B  2306 	INW=11   ;  in.w saved
                           00000D  2307 	BPTR=13 ; baseptr saved
                           00000D  2308 	VSIZE=13  
      002241                       2309 for: ; { -- var_addr }
      009D5A CD               [ 2] 2310 	popw x ; call return address 
      002242                       2311 	_vars VSIZE 
      009D5B 9A 4C            [ 2]    1     sub sp,#VSIZE 
      009D5D 20               [ 2] 2312 	pushw x  ; RETL1 
      009D5E 03 85            [ 1] 2313 	ld a,#TK_VAR 
      009D5F CD 19 9E         [ 4] 2314 	call expect
      009D5F CD 98 90         [ 4] 2315 	call get_addr
      009D62 1F 09            [ 2] 2316 	ldw (CVAR,sp),x  ; control variable 
      009D62 CF 00 1A         [ 4] 2317 	call let_eval 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      009D65 CD 98 68 A1      [ 1] 2318 	bset flags,#FLOOP 
      009D69 32 27 03         [ 4] 2319 	call next_token 
      009D6C CC 97            [ 1] 2320 	cp a,#TK_CMD 
      009D6E 04 03            [ 1] 2321 	jreq 1$
      009D6F CC 16 84         [ 2] 2322 	jp syntax_error
      002260                       2323 1$:  
      002260                       2324 	_get_code_addr
      009D6F CD               [ 2]    1         ldw x,(x)
      009D70 9C 8D A1 84      [ 1]    2         inc in 
      009D74 27 03 CC 97      [ 1]    3         inc in 
      009D78 04 22 71         [ 2] 2325 	cpw x,#to   
      009D79 27 03            [ 1] 2326 	jreq to
      009D79 90 F6 93         [ 2] 2327 	jp syntax_error 
                                   2328 
                                   2329 ;-----------------------------------
                                   2330 ; BASIC: TO expr 
                                   2331 ; second part of FOR loop initilization
                                   2332 ; leave limit on stack and set 
                                   2333 ; FTO bit in 'flags'
                                   2334 ;-----------------------------------
      002271                       2335 to: ; { var_addr -- var_addr limit step }
      009D7C EE 01 72 A9 00   [ 2] 2336 	btjt flags,#FLOOP,1$
      009D81 03 16 84         [ 2] 2337 	jp syntax_error
      009D82 CD 1A F4         [ 4] 2338 1$: call expression   
      009D82 72 C7            [ 1] 2339 	cp a,#TK_INTGR 
      009D84 00 1A            [ 1] 2340 	jreq 2$ 
      009D86 72 5C 00         [ 2] 2341 	jp syntax_error
      002283                       2342 2$: _xpop
      009D89 1B 72            [ 1]    1     ld a,(y)
      009D8B CF               [ 1]    2     ldw x,y 
      009D8C 00 1A            [ 2]    3     ldw x,(1,x)
      009D8E 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D8F 6B 06            [ 1] 2343 	ld (LIMIT,sp),a 
      009D8F F6 A4            [ 2] 2344 	ldw (LIMIT+1,sp),x
      009D91 0F A0 03         [ 4] 2345 	call next_token
      009D94 88 4B            [ 1] 2346 	cp a,#TK_NONE  
      009D96 00 72            [ 1] 2347 	jreq 4$ 
      009D98 FB 01            [ 1] 2348 	cp a,#TK_CMD
      009D9A F6 EE            [ 1] 2349 	jrne 3$
      00229B                       2350 	_get_code_addr
      009D9C 01               [ 2]    1         ldw x,(x)
      009D9D 5B 02 81 01      [ 1]    2         inc in 
      009DA0 72 5C 00 01      [ 1]    3         inc in 
      009DA0 AE 40 00         [ 2] 2351 	cpw x,#step 
      009DA3 35 08            [ 1] 2352 	jreq step
      0022A9                       2353 3$:	
      0022A9                       2354 	_unget_token   	 
      009DA5 00 0F A3 47 F8   [ 1]    1      mov in,in.saved  
      0022AE                       2355 4$:	
      009DAA 24 17            [ 1] 2356 	clr (FSTEP,sp) 
      009DAC F6 26 0C         [ 2] 2357 	ldw x,#1   ; default step  
      009DAF 5C 72            [ 2] 2358 	ldw (FSTEP+1,sp),x 
      009DB1 5A 00            [ 2] 2359 	jra store_loop_addr 
                                   2360 
                                   2361 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



                                   2362 ;----------------------------------
                                   2363 ; BASIC: STEP expr 
                                   2364 ; optional third par of FOR loop
                                   2365 ; initialization. 	
                                   2366 ;------------------------------------
      0022B7                       2367 step: ; {var limit -- var limit step}
      009DB3 0F 26 F6 1D 00   [ 2] 2368 	btjt flags,#FLOOP,1$
      009DB8 08 20 09         [ 2] 2369 	jp syntax_error
      009DBB F6 5C 4D         [ 4] 2370 1$: call expression 
      009DBE 26 FB            [ 1] 2371 	cp a,#TK_INTGR
      009DC0 5A 20            [ 1] 2372 	jreq 2$
      009DC2 E0 5F 4F         [ 2] 2373 	jp syntax_error
      0022C9                       2374 2$:	
      0022C9                       2375 	_xpop 
      009DC5 CF 00            [ 1]    1     ld a,(y)
      009DC7 25               [ 1]    2     ldw x,y 
      009DC8 81 01            [ 2]    3     ldw x,(1,x)
      009DC9 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009DC9 90 89            [ 1] 2376 	ld (FSTEP,sp),a 
      009DCB 52 08            [ 2] 2377 	ldw (FSTEP+1,sp),x ; step
                                   2378 ; if step < 0 decrement LIMIT 
      009DCD 72               [ 1] 2379 	tnz a
      009DCE 5F 00            [ 1] 2380 	jrpl store_loop_addr 
      009DD0 0E 6B            [ 1] 2381 	ld a,(LIMIT,sp)
      009DD2 05 1F            [ 2] 2382 	ldw x,(LIMIT+1,sp)
      009DD4 01 CE 00         [ 2] 2383 	subw x,#1 
      009DD7 33 1F            [ 1] 2384 	sbc a,#0 
      009DD9 07 90            [ 1] 2385 	ld (LIMIT,sp),a 
      009DDB CE 00            [ 2] 2386 	ldw (LIMIT+1,sp),x 
                                   2387 ; leave loop back entry point on cstack 
                                   2388 ; cstack is 1 call deep from interpreter
      0022E6                       2389 store_loop_addr:
      009DDD 31 17 03         [ 2] 2390 	ldw x,basicptr
      009DE0 93 13            [ 2] 2391 	ldw (BPTR,sp),x 
      009DE2 07 24 20         [ 2] 2392 	ldw x,in.w 
      009DE5 90 F6            [ 2] 2393 	ldw (INW,sp),x   
      009DE7 A4 0F 11 05      [ 1] 2394 	bres flags,#FLOOP 
      009DEB 26 09 90 5C      [ 1] 2395 	inc loop_depth  
      009DEF 1E               [ 4] 2396 	ret 
                                   2397 
                                   2398 ;--------------------------------
                                   2399 ; BASIC: NEXT var 
                                   2400 ; FOR loop control 
                                   2401 ; increment variable with step 
                                   2402 ; and compare with limit 
                                   2403 ; loop if threshold not crossed.
                                   2404 ; else stack. 
                                   2405 ; and decrement 'loop_depth' 
                                   2406 ;--------------------------------
      0022F9                       2407 next: ; {var limit step retl1 -- [var limit step ] }
      009DF0 01 CD 94 11      [ 1] 2408 	tnz loop_depth 
      009DF4 26 13            [ 1] 2409 	jrne 1$ 
      009DF6 CC 16 84         [ 2] 2410 	jp syntax_error 
      002302                       2411 1$: 
      009DF6 16 03            [ 1] 2412 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009DF8 90 F6 A4         [ 4] 2413 	call expect
      009DFB 0F C7 00         [ 4] 2414 	call get_addr 
                                   2415 ; check for good variable after NEXT 	 
      009DFE 0F 72            [ 2] 2416 	cpw x,(CVAR,sp)
      009E00 B9 00            [ 1] 2417 	jreq 2$  
      009E02 0E 20 D9         [ 2] 2418 	jp syntax_error ; not the good one 
      009E05                       2419 2$: 
      009E05 0F 03 0F         [ 2] 2420 	ldw ptr16,x 
                                   2421 	; increment variable 
      009E08 04               [ 1] 2422 	ld a,(x)
      009E09 EE 01            [ 2] 2423 	ldw x,(1,x)  ; get var value 
      009E09 1E 03 5B         [ 2] 2424 	addw x,(FSTEP+1,sp) ; var+step 
      009E0C 08 90            [ 1] 2425 	adc a,(FSTEP,sp)
      009E0E 85 81 00 19      [ 4] 2426 	ld [ptr16],a
      009E10 72 5C 00 1A      [ 1] 2427 	inc ptr8  
      009E10 72 00 00 23      [ 5] 2428 	ldw [ptr16],x 
      009E14 05 A6 06         [ 1] 2429 	ld acc24,a 
      009E17 CC 97 06         [ 2] 2430 	ldw acc16,x 
      009E1A 7B 06            [ 1] 2431 	ld a,(LIMIT,sp)
      009E1A 52 05            [ 2] 2432 	ldw x,(LIMIT+1,sp)
      009E1C A6 80 6B 05      [ 2] 2433 	subw x,acc16 
      009E20 0F 03 20         [ 1] 2434 	sbc a,acc24
      009E23 10 03            [ 1] 2435 	xor a,(FSTEP,sp)
      009E24 A8 80            [ 1] 2436 	xor a,#0x80
      009E24 72 00            [ 1] 2437 	jrmi loop_back  
      009E26 00 23            [ 2] 2438 	jra loop_done   
                                   2439 ; check sign of STEP  
      009E28 05 A6            [ 1] 2440 	ld a,(FSTEP,sp)
      009E2A 06 CC            [ 1] 2441 	jrpl 4$
                                   2442 ;negative step
      009E2C 97 06 0E         [ 1] 2443     ld a,acc8 
      009E2E 2F 07            [ 1] 2444 	jrslt loop_back   
      009E2E 52 05            [ 2] 2445 	jra loop_done  
      00234C                       2446 4$: ; positive step
      009E30 0F 03 0F 05 15   [ 2] 2447 	btjt acc8,#7,loop_done 
      009E34                       2448 loop_back:
      009E34 CD 98            [ 2] 2449 	ldw x,(BPTR,sp)
      009E36 68 A1 03         [ 2] 2450 	ldw basicptr,x 
      009E39 27 03 CC 97 04   [ 2] 2451 	btjf flags,#FRUN,1$ 
      009E3E 1F 01            [ 1] 2452 	ld a,(2,x)
      009E40 CD 94 06         [ 1] 2453 	ld count,a
      009E43 AB 05            [ 2] 2454 1$:	ldw x,(INW,sp)
      009E45 6B 04 CD         [ 2] 2455 	ldw in.w,x 
      009E48 98               [ 4] 2456 	ret 
      002366                       2457 loop_done:
                                   2458 	; remove loop data from stack  
      009E49 81               [ 2] 2459 	popw x
      002367                       2460 	_drop VSIZE 
      009E4A 7B 04            [ 2]    1     addw sp,#VSIZE 
      009E4C 1E 01 CD 9D      [ 1] 2461 	dec loop_depth 
      009E50 C9               [ 2] 2462 	jp (x)
                                   2463 
                                   2464 ;----------------------------
                                   2465 ; called by goto/gosub
                                   2466 ; to get target line number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2467 ; output:
                                   2468 ;    x    line address 
                                   2469 ;---------------------------
      00236E                       2470 get_target_line:
      009E51 5D 27 05         [ 4] 2471 	call next_token  
      009E54 A6 08            [ 1] 2472 	cp a,#TK_INTGR
      009E56 CC 97            [ 1] 2473 	jreq get_target_line_addr 
      009E58 06 CE            [ 1] 2474 	cp a,#TK_LABEL 
      009E5A 00 33            [ 1] 2475 	jreq look_target_symbol 
      009E5C 7B 04 1A         [ 2] 2476 	jp syntax_error
                                   2477 ; the target is a line number 
                                   2478 ; search it. 
      00237C                       2479 get_target_line_addr:
      009E5F 05 F7            [ 2] 2480 	pushw y 
      009E61 5C 90 89         [ 4] 2481 	call get_int24 ; line # 
      009E64 16               [ 1] 2482 	clr a
      009E65 03 CD 94 22      [ 2] 2483 	ldw y,basicptr 
      009E69 90 85            [ 2] 2484 	ldw y,(y)
      009E6B 5A 72            [ 2] 2485 	pushw y 
      009E6D FB 03            [ 2] 2486 	cpw x,(1,sp)
      00238C                       2487 	_drop 2  
      009E6F CF 00            [ 2]    1     addw sp,#2 
      009E71 33 1D            [ 1] 2488 	jrult 11$
      009E73 00               [ 1] 2489 	inc a 
      002391                       2490 11$: ; scan program for this line# 	
      009E74 03 7F 6F         [ 4] 2491 	call search_lineno  
      009E77 01               [ 2] 2492 	tnzw x ; 0| line# address 
      009E78 6F 02            [ 1] 2493 	jrne 2$ 
      009E7A CD 98            [ 1] 2494 	ld a,#ERR_NO_LINE 
      009E7C 68 A1 08         [ 2] 2495 	jp tb_error 
      009E7F 27 B3            [ 2] 2496 2$:	popw y  
      009E81 A1               [ 4] 2497 	ret 
                                   2498 
                                   2499 ; the GOTO|GOSUB target is a symbol.
                                   2500 ; output:
                                   2501 ;    X    line address|0 
      00239F                       2502 look_target_symbol:
      009E82 32 26            [ 2] 2503 	pushw y 
      009E84 2A               [ 2] 2504 	pushw x 
      009E85 CD 9C 8D         [ 4] 2505 	call skip_string 
      009E88 A1 84 27 03      [ 1] 2506 	clr acc16 
      009E8C CC 97 04 CE      [ 2] 2507 	ldw y,txtbgn 
      009E90 00 33 1D         [ 1] 2508 1$:	ld a,(3,y) ; first TK_ID on line 
      009E93 00 03            [ 1] 2509 	cp a,#TK_LABEL 
      009E95 CF 00            [ 1] 2510 	jreq 3$ 
      009E97 1A 90 F6         [ 1] 2511 2$:	ld a,(2,y); line length 
      009E9A 93 EE 01         [ 1] 2512 	ld acc8,a 
      009E9D 72 A9 00 03      [ 2] 2513 	addw y,acc16 ;point to next line 
      009EA1 72 C7 00 1A      [ 2] 2514 	cpw y,txtend 
      009EA5 72 5C            [ 1] 2515 	jrult 1$
      009EA7 00 1B            [ 1] 2516 	ld a,#ERR_BAD_VALUE
      009EA9 72 CF 00         [ 2] 2517 	jp tb_error 
      0023C9                       2518 3$: ; found a TK_LABEL 
                                   2519 	; compare with GOTO|GOSUB target 
      009EAC 1A 20            [ 2] 2520 	pushw y ; line address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009EAE CB A9 00 04      [ 2] 2521 	addw y,#4 ; label string 
      009EAF 1E 03            [ 2] 2522 	ldw x,(3,sp) ; target string 
      009EAF 55 00 03         [ 4] 2523 	call strcmp
      009EB2 00 02            [ 1] 2524 	jrne 4$
      009EB4 5B 05            [ 2] 2525 	popw y 
      009EB6 CD 9D            [ 2] 2526 	jra 2$ 
      0023DA                       2527 4$: ; target found 
      009EB8 41               [ 2] 2528 	popw x ;  address line target  
      0023DB                       2529 	_drop 2 ; target string 
      009EB9 81 02            [ 2]    1     addw sp,#2 
      009EBA 90 85            [ 2] 2530 	popw y 
      009EBA CE               [ 4] 2531 	ret
                                   2532 
                                   2533 
                                   2534 ;--------------------------------
                                   2535 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2536 ; selective goto or gosub 
                                   2537 ;--------------------------------
      0023E0                       2538 cmd_on:
      009EBB 00 1E 72 B0 00   [ 2] 2539 	btjt flags,#FRUN,0$ 
      009EC0 1C 81            [ 1] 2540 	ld a,#ERR_RUN_ONLY
      009EC2 CC 16 86         [ 2] 2541 	jp tb_error 
      009EC2 AE 9F 01         [ 4] 2542 0$:	call expression 
      009EC5 CD 89            [ 1] 2543 	cp a,#TK_INTGR
      009EC7 DC CE            [ 1] 2544 	jreq 1$
      009EC9 00 1C 35         [ 2] 2545 	jp syntax_error
      0023F4                       2546 1$: _xpop
      009ECC 10 00            [ 1]    1     ld a,(y)
      009ECE 0B               [ 1]    2     ldw x,y 
      009ECF CD 98            [ 2]    3     ldw x,(1,x)
      009ED1 B0 35 0A 00      [ 2]    4     addw y,#CELL_SIZE 
                                   2547 ; the selector is the element indice 
                                   2548 ; in the list of arguments. {1..#elements} 
      009ED5 0B               [ 1] 2549 	ld a,xl ; keep only bits 7..0
      009ED6 AE 9F            [ 1] 2550 	jreq 9$ ; element # begin at 1. 
      009ED8 13               [ 1] 2551 	push a  ; selector  
      009ED9 CD 89 DC         [ 4] 2552 	call next_token
      009EDC CD 9E            [ 1] 2553 	cp a,#TK_CMD 
      009EDE BA CD            [ 1] 2554 	jreq 2$ 
      009EE0 98 B0 AE         [ 2] 2555 	jp syntax_error 
      00240B                       2556 2$: _get_code_addr
      009EE3 9F               [ 2]    1         ldw x,(x)
      009EE4 24 CD 89 DC      [ 1]    2         inc in 
      009EE8 CE 00 1C A3      [ 1]    3         inc in 
                                   2557 ;; must be a GOTO or GOSUB 
      009EEC B8 04 25         [ 2] 2558 	cpw x,#goto 
      009EEF 05 AE            [ 1] 2559 	jreq 4$
      009EF1 9F 2B 20         [ 2] 2560 	cpw x,#gosub 
      009EF4 03 AE            [ 1] 2561 	jreq 4$ 
      009EF6 9F 3C CD         [ 2] 2562 	jp syntax_error 
      002421                       2563 4$: 
      009EF9 89               [ 1] 2564 	pop a 
      009EFA DC               [ 2] 2565 	pushw x ; save routine address 	
      009EFB A6               [ 1] 2566 	push a  ; selector  
      002424                       2567 5$: ; skip elements in list until selector==0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



      009EFC 0D CD            [ 1] 2568 	dec (1,sp)
      009EFE 89 7F            [ 1] 2569 	jreq 6$ 
                                   2570 ; can be a line# or a label 
      009F00 81 70 72         [ 4] 2571 	call next_token 
      009F03 6F 67            [ 1] 2572 	cp a,#TK_INTGR 
      009F05 72 61            [ 1] 2573 	jreq 52$
      009F07 6D 20            [ 1] 2574 	cp a,#TK_LABEL 
      009F09 61 64            [ 1] 2575 	jreq 54$
      009F0B 64 72 65         [ 2] 2576 	jp syntax_error 
      002436                       2577 52$: ; got a line number 
      009F0E 73 73 3A         [ 1] 2578 	ld a,in ; skip over int24 value 
      009F11 20 00            [ 1] 2579 	add a,#CELL_SIZE ; integer size  
      009F13 2C 20 70         [ 1] 2580 	ld in,a 
      009F16 72 6F            [ 2] 2581 	jra 56$
      009F18 67 72 61         [ 4] 2582 54$: call skip_string ; skip over label 	
      002443                       2583 56$: ; if another element comma present 
      009F1B 6D 20 73         [ 4] 2584 	call next_token
      009F1E 69 7A            [ 1] 2585 	cp a,#TK_COMMA 
      009F20 65 3A            [ 1] 2586 	jreq 5$ 
                                   2587 ; arg list exhausted, selector to big 
                                   2588 ; continue execution on next line 
      00244A                       2589 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F22 20 00            [ 2]    1     addw sp,#3 
      009F24 20 62            [ 2] 2590 	jra 9$
      00244E                       2591 6$: ;at selected position  
      00244E                       2592 	_drop 1 ; discard selector
      009F26 79 74            [ 2]    1     addw sp,#1 
                                   2593 ; here only the routine address 
                                   2594 ; of GOTO|GOSUB is on stack 
      009F28 65 73 00         [ 4] 2595     call get_target_line
      009F2B 20 69 6E         [ 2] 2596 	ldw ptr16,x 	
      009F2E 20 46 4C 41 53   [ 1] 2597 	mov in,count ; move to end of line  
      009F33 48               [ 2] 2598 	popw x ; cmd address, GOTO||GOSUB 
      009F34 20 6D 65         [ 2] 2599 	cpw x,#goto 
      009F37 6D 6F            [ 1] 2600 	jrne 7$ 
      009F39 72 79 00         [ 2] 2601 	ldw x,ptr16 
      009F3C 20 69            [ 2] 2602 	jra jp_to_target
      002466                       2603 7$: 
      009F3E 6E 20            [ 2] 2604 	jra gosub_2 ; target in ptr16 
      002468                       2605 9$: ; expr out of range skip to end of line
                                   2606     ; this will force a fall to next line  
      009F40 52 41 4D 20 6D   [ 1] 2607 	mov in,count
      00246D                       2608 	_drop 2
      009F45 65 6D            [ 2]    1     addw sp,#2 
      009F47 6F 72 79         [ 2] 2609 	jp next_line  
                                   2610 
                                   2611 
                                   2612 ;------------------------
                                   2613 ; BASIC: GOTO line# 
                                   2614 ; jump to line# 
                                   2615 ; here cstack is 2 call deep from interpreter 
                                   2616 ;------------------------
      002472                       2617 goto:
      009F4A 00 00 00 22 05   [ 2] 2618 	btjt flags,#FRUN,goto_1  
      009F4B A6 06            [ 1] 2619 	ld a,#ERR_RUN_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009F4B 72 01 00         [ 2] 2620 	jp tb_error 
      00247C                       2621 goto_1:
      009F4E 23 05 A6         [ 4] 2622 	call get_target_line
      00247F                       2623 jp_to_target:
      009F51 07 CC 97         [ 2] 2624 	ldw basicptr,x 
      009F54 06 02            [ 1] 2625 	ld a,(2,x)
      009F55 C7 00 03         [ 1] 2626 	ld count,a 
      009F55 CD 9E BA 22      [ 1] 2627 	mov in,#3 
      009F59 01               [ 4] 2628 	ret 
                                   2629 
                                   2630 
                                   2631 ;--------------------
                                   2632 ; BASIC: GOSUB line#
                                   2633 ; basic subroutine call
                                   2634 ; actual line# and basicptr 
                                   2635 ; are saved on cstack
                                   2636 ; here cstack is 2 call deep from interpreter 
                                   2637 ;--------------------
                           000001  2638 	RET_ADDR=1 ; subroutine return address 
                           000003  2639 	RET_BPTR=3 ; basicptr return point 
                           000005  2640 	RET_INW=5  ; in.w return point 
                           000004  2641 	VSIZE=4 
      00248C                       2642 gosub:
      009F5A 81 52 06 CE 00   [ 2] 2643 	btjt flags,#FRUN,gosub_1 
      009F5F 1C 1F            [ 1] 2644 	ld a,#ERR_RUN_ONLY
      009F61 05 FE 1F         [ 2] 2645 	jp tb_error 
      009F64 01               [ 4] 2646 	ret 
      002497                       2647 gosub_1:
      009F65 AE 7F FF         [ 4] 2648 	call get_target_line 
      009F68 1F 03 CD         [ 2] 2649 	ldw ptr16,x
      00249D                       2650 gosub_2: 
      009F6B 9A               [ 2] 2651 	popw x 
      00249E                       2652 	_vars VSIZE  
      009F6C 30 4D            [ 2]    1     sub sp,#VSIZE 
      009F6E 27               [ 2] 2653 	pushw x ; RET_ADDR 
                                   2654 ; save BASIC subroutine return point.   
      009F6F 31 A1 02         [ 2] 2655 	ldw x,basicptr
      009F72 27 07            [ 2] 2656 	ldw (RET_BPTR,sp),x 
      009F74 A1 01 27         [ 2] 2657 	ldw x,in.w 
      009F77 06 CC            [ 2] 2658 	ldw (RET_INW,sp),x
      009F79 97 04 85         [ 2] 2659 	ldw x,ptr16  
      009F7C 1F 05            [ 2] 2660 	jra jp_to_target
                                   2661 
                                   2662 ;------------------------
                                   2663 ; BASIC: RETURN 
                                   2664 ; exit from BASIC subroutine 
                                   2665 ;------------------------
      009F7E                       2666 return:
      009F7E 85 1F 01 22 05   [ 2] 2667 	btjt flags,#FRUN,0$ 
      009F81 A6 06            [ 1] 2668 	ld a,#ERR_RUN_ONLY
      009F81 CE 00 1C         [ 2] 2669 	jp tb_error 
      0024BA                       2670 0$:	
      009F84 1F 05            [ 2] 2671 	ldw x,(RET_BPTR,sp) 
      009F86 C3 00 1E         [ 2] 2672 	ldw basicptr,x
      009F89 2A 38            [ 1] 2673 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009F8B FE 13 01         [ 1] 2674 	ld count,a  
      009F8E 2A 11            [ 2] 2675 	ldw x,(RET_INW,sp)
      009F90 1E 05 E6         [ 2] 2676 	ldw in.w,x 
      009F93 02               [ 2] 2677 	popw x 
      0024CA                       2678 	_drop VSIZE 
      009F94 C7 00            [ 2]    1     addw sp,#VSIZE 
      009F96 0F               [ 2] 2679 	jp (x)
                                   2680 
                                   2681 
                                   2682 ;---------------------------------
                                   2683 ; check if A:X contain the address 
                                   2684 ; of a program in FLASH 
                                   2685 ; output:
                                   2686 ;     Z    set is progam 
                                   2687 ;----------------------------------
      0024CD                       2688 is_program_addr:
      009F97 72               [ 1] 2689 	tnz a 
      009F98 5F 00            [ 1] 2690 	jrne 9$
      009F9A 0E 72 BB         [ 2] 2691 	cpw x,#app_space 
      009F9D 00 0E            [ 1] 2692 	jrult 8$
      009F9F 20               [ 2] 2693 	pushw x 
      009FA0 E3 28 3C         [ 4] 2694 	call qsign 
      009FA1 85               [ 2] 2695 	popw x 
      009FA1 1E 05            [ 1] 2696 	jreq 9$ 
      009FA3 E6               [ 1] 2697 8$:	cpl a ; clr Z bit  
      009FA4 02               [ 4] 2698 9$:	ret 
                                   2699 
                                   2700 ;----------------------------------
                                   2701 ; BASIC: RUN [addr]
                                   2702 ; run BASIC program in RAM
                                   2703 ;----------------------------------- 
      0024DE                       2704 run: 
      009FA5 CD A0 15 1E 05   [ 2] 2705 	btjf flags,#FRUN,0$  
      009FAA E6               [ 1] 2706 	clr a 
      009FAB 02               [ 4] 2707 	ret
      0024E5                       2708 0$: ; check for STOP condition 
      009FAC C7 00 0F 72 5F   [ 2] 2709 	btjf flags,#FBREAK,1$
      0024EA                       2710 	_drop 2 
      009FB1 00 0E            [ 2]    1     addw sp,#2 
      009FB3 72 BB 00         [ 4] 2711 	call rest_context
      0024EF                       2712 	_drop CTXT_SIZE 
      009FB6 0E C3            [ 2]    1     addw sp,#CTXT_SIZE 
      009FB8 00 1E 2A 07      [ 1] 2713 	bres flags,#FBREAK 
      009FBC 1F 05 FE 13      [ 1] 2714 	bset flags,#FRUN 
      009FC0 03 2F DE         [ 2] 2715 	jp interpreter 
      009FC3                       2716 1$:	; check for address option 
      009FC3 55 00 04         [ 4] 2717 	call next_token 
      009FC6 00 02            [ 1] 2718 	cp a,#TK_INTGR
      009FC8 AE 16            [ 1] 2719 	jrne 3$
      009FCA E0 CF 00         [ 4] 2720 	call get_int24 
      009FCD 05 5B 06         [ 4] 2721 	call is_program_addr
      009FD0 CD 9E            [ 1] 2722 	jreq 2$
      009FD2 C2 81            [ 1] 2723 	ld a,#ERR_NO_PROGRAM
      009FD4 CC 16 86         [ 2] 2724 	jp tb_error 
      009FD4 CD 98 68         [ 2] 2725 2$: ldw txtbgn,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009FD7 A1 84 27         [ 2] 2726 	subw x,#2 
      009FDA 03               [ 2] 2727 	ldw x,(x)
      009FDB CC 97 04 CD      [ 2] 2728 	addw x,txtbgn 
      009FDF 98 9A CD         [ 2] 2729 	ldw txtend,x 
      009FE2 A5 4D            [ 2] 2730 	jra run_it 	
      002520                       2731 3$:	_unget_token 
      009FE4 27 06 AE 00 12   [ 1]    1      mov in,in.saved  
      009FE9 CC 97 06         [ 2] 2732 	ldw x,txtbgn
      009FEC 90 89 90         [ 2] 2733 	cpw x,txtend 
      009FEF 93 1D            [ 1] 2734 	jrmi run_it 
      009FF1 00 04 EE         [ 2] 2735 	ldw x,#err_no_prog
      009FF4 02 1C 00         [ 4] 2736 	call puts 
      009FF7 04 CF 00 0E AE   [ 1] 2737 	mov in,count
      009FFC 00               [ 4] 2738 	ret 
      002539                       2739 run_it:	 
      002539                       2740 	_drop 2 ; drop return address 
      009FFD 8C 72            [ 2]    1     addw sp,#2 
      00253B                       2741 run_it_02: 
      009FFF A2 00 04         [ 4] 2742     call ubound 
      00A002 CD 94 32         [ 4] 2743 	call clear_vars
                                   2744 ; initialize DIM variables pointers 
      00A005 AE 00 90         [ 2] 2745 	ldw x,txtend 
      00A008 CF 00 1C         [ 2] 2746 	ldw dvar_bgn,x 
      00A00B 72 BB 00         [ 2] 2747 	ldw dvar_end,x 	 
                                   2748 ; clear data pointer 
      00A00E 8E               [ 1] 2749 	clrw x 
      00A00F CF 00 1E         [ 2] 2750 	ldw data_ptr,x 
      00A012 90 85 81 08      [ 1] 2751 	clr data_ofs 
      00A015 72 5F 00 09      [ 1] 2752 	clr data_len 
                                   2753 ; initialize BASIC pointer 
      00A015 90 89 C7         [ 2] 2754 	ldw x,txtbgn 
      00A018 00 04 E6         [ 2] 2755 	ldw basicptr,x 
      00A01B 02 C1            [ 1] 2756 	ld a,(2,x)
      00A01D 00 04 2A         [ 1] 2757 	ld count,a
      00A020 03 C7 00 04      [ 1] 2758 	mov in,#3	
      00A024 CF 00 05 90      [ 1] 2759 	bset flags,#FRUN 
      00A028 AE 16 90         [ 2] 2760 	jp interpreter 
                                   2761 
                                   2762 
                                   2763 ;----------------------
                                   2764 ; BASIC: END
                                   2765 ; end running program
                                   2766 ;---------------------- 
      00256C                       2767 cmd_end: 
                                   2768 ; clean stack 
      00A02B CD 92 22         [ 2] 2769 	ldw x,#STACK_EMPTY
      00A02E CD               [ 1] 2770 	ldw sp,x 
      00A02F 89 DC A6         [ 2] 2771 	jp warm_start
                                   2772 
                                   2773 ;---------------------------
                                   2774 ; BASIC: GET var 
                                   2775 ; receive a key in variable 
                                   2776 ; don't wait 
                                   2777 ;---------------------------
      002573                       2778 cmd_get:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



      00A032 0D CD 89         [ 4] 2779 	call next_token 
      00A035 7F 90            [ 1] 2780 	cp a,#TK_VAR 
      00A037 85 81            [ 1] 2781 	jreq 0$
      00A039 CC 16 84         [ 2] 2782 	jp syntax_error 
      00A039 52 01 10         [ 4] 2783 0$: call get_addr 
      00A03B CF 00 19         [ 2] 2784 	ldw ptr16,x 
      00A03B 0F 01 08         [ 4] 2785 	call qgetc 
      00A03D 27 03            [ 1] 2786 	jreq 2$
      00A03D CD 98 68         [ 4] 2787 	call getc  
      00A040 A1 02 25 08      [ 4] 2788 2$: clr [ptr16]
      00A044 A1 0A 27 04      [ 1] 2789 	inc ptr8 
      00A048 A1 80 26 07      [ 4] 2790 	clr [ptr16]
      00A04C 72 5C 00 1A      [ 1] 2791 	inc ptr8 
      00A04C 55 00 03 00      [ 4] 2792 	ld [ptr16],a 
      00A050 02               [ 4] 2793 	ret 
                                   2794 
                                   2795 
                                   2796 ;-----------------
                                   2797 ; 1 Khz beep 
                                   2798 ;-----------------
      0025A0                       2799 beep_1khz:: 
      00A051 20 63            [ 2] 2800 	pushw y 
      00A053 AE 00 64         [ 2] 2801 	ldw x,#100
      00A053 A1 02 27 12      [ 2] 2802 	ldw y,#1000
      00A057 A1 04            [ 2] 2803 	jra beep
                                   2804 
                                   2805 ;-----------------------
                                   2806 ; BASIC: TONE expr1,expr2
                                   2807 ; used TIMER2 channel 1
                                   2808 ; to produce a tone 
                                   2809 ; arguments:
                                   2810 ;    expr1   frequency 
                                   2811 ;    expr2   duration msec.
                                   2812 ;---------------------------
      0025AB                       2813 tone:
      00A059 27 1B            [ 2] 2814 	pushw y 
      00A05B A1 82 27         [ 4] 2815 	call arg_list 
      00A05E 1F A1            [ 1] 2816 	cp a,#2 
      00A060 08 27            [ 1] 2817 	jreq 1$
      00A062 2A A1 09         [ 2] 2818 	jp syntax_error 
      0025B7                       2819 1$: 
      0025B7                       2820 	_xpop 
      00A065 27 2A            [ 1]    1     ld a,(y)
      00A067 20               [ 1]    2     ldw x,y 
      00A068 3D 01            [ 2]    3     ldw x,(1,x)
      00A069 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A069 CD               [ 2] 2821 	pushw x ; duration 
      0025C1                       2822 	_xpop ; frequency
      00A06A 89 DC            [ 1]    1     ld a,(y)
      00A06C 5C               [ 1]    2     ldw x,y 
      00A06D 72 B0            [ 2]    3     ldw x,(1,x)
      00A06F 00 05 CF 00      [ 2]    4     addw y,#CELL_SIZE 
      00A073 01 20            [ 1] 2823 	ldw y,x ; frequency 
      00A075 C5               [ 2] 2824 	popw x  ; duration 
      00A076                       2825 beep:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



      00A076 CD               [ 2] 2826 	pushw x 
      00A077 98 AA CD         [ 2] 2827 	ldw x,#TIM2_CLK_FREQ
      00A07A 89               [ 2] 2828 	divw x,y ; cntr=Fclk/freq 
                                   2829 ; round to nearest integer 
      00A07B 7F 20 BD 12      [ 2] 2830 	cpw y,#TIM2_CLK_FREQ/2
      00A07E 2B 01            [ 1] 2831 	jrmi 2$
      00A07E FE               [ 1] 2832 	incw x 
      0025D9                       2833 2$:	 
      00A07F 72               [ 1] 2834 	ld a,xh 
      00A080 5C 00 02         [ 1] 2835 	ld TIM2_ARRH,a 
      00A083 72               [ 1] 2836 	ld a,xl 
      00A084 5C 00 02         [ 1] 2837 	ld TIM2_ARRL,a 
                                   2838 ; 50% duty cycle 
      00A087 FD               [ 1] 2839 	ccf 
      00A088 CD               [ 2] 2840 	rrcw x 
      00A089 89               [ 1] 2841 	ld a,xh 
      00A08A 7F 20 AE         [ 1] 2842 	ld TIM2_CCR1H,a 
      00A08D 9F               [ 1] 2843 	ld a,xl
      00A08D 03 01 20         [ 1] 2844 	ld TIM2_CCR1L,a
      00A090 AC 10 53 08      [ 1] 2845 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A091 72 10 53 00      [ 1] 2846 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A091 CD 98 68 A1      [ 1] 2847 	bset TIM2_EGR,#TIM2_EGR_UG
      00A095 84               [ 2] 2848 	popw x 
      00A096 27 03 CC         [ 4] 2849 	call pause02
      00A099 97 04 53 08      [ 1] 2850 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A09B 72 11 53 00      [ 1] 2851 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A09B CD 98            [ 2] 2852 	popw y 
      00A09D 9A               [ 4] 2853 	ret 
                                   2854 
                                   2855 ;-------------------------------
                                   2856 ; BASIC: ADCON 0|1 [,divisor]  
                                   2857 ; disable/enanble ADC 
                                   2858 ;-------------------------------
                           000003  2859 	ONOFF=3 
                           000001  2860 	DIVSOR=1
                           000004  2861 	VSIZE=4 
      002606                       2862 power_adc:
      00A09E 9F A4 0F         [ 4] 2863 	call arg_list 
      00A0A1 C7 00            [ 1] 2864 	cp a,#2	
      00A0A3 24 20            [ 1] 2865 	jreq 1$
      00A0A5 95 01            [ 1] 2866 	cp a,#1 
      00A0A6 27 03            [ 1] 2867 	jreq 0$ 
      00A0A6 55 00 03         [ 2] 2868 	jp syntax_error 
      00A0A9 00               [ 1] 2869 0$:	clr a 
      00A0AA 02               [ 1] 2870 	clrw x
      002616                       2871 	_xpush   ; divisor  
      00A0AB CD 9C 8D 4D      [ 2]    1     subw y,#CELL_SIZE
      00A0AF 27 05            [ 1]    2     ld (y),a 
      00A0B1 CD 98 D5         [ 2]    3     ldw (1,y),x 
      00261F                       2872 1$: _at_next 
      00A0B4 20 85 03         [ 1]    1     ld a,(3,y)
      00A0B6 93               [ 1]    2     ldw x,y 
      00A0B6 0D 01            [ 2]    3     ldw x,(4,x)
      00A0B8 26               [ 2] 2873 	tnzw x 
      00A0B9 05 A6            [ 1] 2874 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      002628                       2875 	_xpop
      00A0BB 0D CD            [ 1]    1     ld a,(y)
      00A0BD 89               [ 1]    2     ldw x,y 
      00A0BE 7F 5B            [ 2]    3     ldw x,(1,x)
      00A0C0 01 81 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0C2                       2876 	_xdrop  
      00A0C2 CE 00 05 1F      [ 2]    1     addw y,#CELL_SIZE 
      00A0C6 03               [ 1] 2877 	ld a,xl
      00A0C7 C6 00            [ 1] 2878 	and a,#7
      00A0C9 02               [ 1] 2879 	swap a 
      00A0CA 6B 05 C6         [ 1] 2880 	ld ADC_CR1,a
      00A0CD 00 04 6B 06      [ 1] 2881 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0D1 81 10 54 01      [ 1] 2882 	bset ADC_CR1,#ADC_CR1_ADON 
      00A0D2                       2883 	_usec_dly 7 
      00A0D2 1E 03 CF         [ 2]    1     ldw x,#(16*7-2)/4
      00A0D5 00               [ 2]    2     decw x
      00A0D6 05               [ 1]    3     nop 
      00A0D7 7B 05            [ 1]    4     jrne .-4
      00A0D9 C7 00            [ 2] 2884 	jra 3$
      00A0DB 02 7B 06 C7      [ 1] 2885 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0DF 00 04 81 CA      [ 1] 2886 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A0E2                       2887 3$:	
      00A0E2 90               [ 4] 2888 	ret
                                   2889 
                                   2890 ;-----------------------------
                                   2891 ; BASIC: ADCREAD (channel)
                                   2892 ; read adc channel {0..5}
                                   2893 ; output:
                                   2894 ;   A 		TK_INTGR 
                                   2895 ;   X 		value 
                                   2896 ;-----------------------------
      002656                       2897 analog_read:
      00A0E3 89 52 05         [ 4] 2898 	call func_args 
      00A0E6 A1 01            [ 1] 2899 	cp a,#1 
      00A0E6 0F 05            [ 1] 2900 	jreq 1$
      00A0E8 CD 98 68         [ 2] 2901 	jp syntax_error
      002660                       2902 1$: _xpop 
      00A0EB A1 02            [ 1]    1     ld a,(y)
      00A0ED 26               [ 1]    2     ldw x,y 
      00A0EE 10 CD            [ 2]    3     ldw x,(1,x)
      00A0F0 89 DC 5C 72      [ 2]    4     addw y,#CELL_SIZE 
      00A0F4 B0 00 05         [ 2] 2903 	cpw x,#5 
      00A0F7 CF 00            [ 2] 2904 	jrule 2$
      00A0F9 01 03            [ 1] 2905 	ld a,#ERR_BAD_VALUE
      00A0FB 05 CD 98         [ 2] 2906 	jp tb_error 
      00A0FE 68               [ 1] 2907 2$: ld a,xl
      00A0FF A1 85 27         [ 1] 2908 	ld acc8,a 
      00A102 03 CC            [ 1] 2909 	ld a,#5
      00A104 97 04 CD         [ 1] 2910 	sub a,acc8 
      00A107 98 90 CF         [ 1] 2911 	ld ADC_CSR,a
      00A10A 00 1A 0D 05      [ 1] 2912 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A10E 26 06 CD 92      [ 1] 2913 	bset ADC_CR1,#ADC_CR1_ADON
      00A112 18 CD 89 7F FB   [ 2] 2914 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A116 CE 54 04         [ 2] 2915 	ldw x,ADC_DRH
      00A116 A6 3A            [ 1] 2916 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



      00A118 CD               [ 4] 2917 	ret 
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
      002692                       2930 digital_read:
      002692                       2931 	_vars VSIZE 
      00A119 89 7F            [ 2]    1     sub sp,#VSIZE 
      00A11B CD A0 C2         [ 4] 2932 	call func_args
      00A11E 72 5F            [ 1] 2933 	cp a,#1
      00A120 00 04            [ 1] 2934 	jreq 1$
      00A122 CD 8A E1         [ 2] 2935 	jp syntax_error
      00269E                       2936 1$: _xpop 
      00A125 AE 16            [ 1]    1     ld a,(y)
      00A127 90               [ 1]    2     ldw x,y 
      00A128 3B 00            [ 2]    3     ldw x,(1,x)
      00A12A 04 4B 00 72      [ 2]    4     addw y,#CELL_SIZE 
      00A12E FB 01 5C         [ 2] 2937 	cpw x,#15 
      00A131 5B 02            [ 2] 2938 	jrule 2$
      00A133 72 5F            [ 1] 2939 	ld a,#ERR_BAD_VALUE
      00A135 00 02 CD         [ 2] 2940 	jp tb_error 
      00A138 8F 62 A1         [ 4] 2941 2$:	call select_pin 
      00A13B 84 27            [ 1] 2942 	ld (PINNO,sp),a
      00A13D 14 A1            [ 1] 2943 	ld a,(GPIO_IDR,x)
      00A13F 11 26            [ 1] 2944 	tnz (PINNO,sp)
      00A141 07 CD            [ 1] 2945 	jreq 8$
      00A143 8F               [ 1] 2946 3$: srl a 
      00A144 62 A1            [ 1] 2947 	dec (PINNO,sp)
      00A146 84 27            [ 1] 2948 	jrne 3$ 
      00A148 06 01            [ 1] 2949 8$: and a,#1 
      00A149 5F               [ 1] 2950 	clrw x 
      00A149 CD               [ 1] 2951 	ld xl,a 
      00A14A A0               [ 1] 2952 	clr a 
      0026C6                       2953 	_drop VSIZE
      00A14B D2 CC            [ 2]    1     addw sp,#VSIZE 
      00A14D 97               [ 4] 2954 	ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                           000001  2966 	PINNO=1
                           000002  2967 	PINVAL=2
                           000002  2968 	VSIZE=2
      0026C9                       2969 digital_write:
      0026C9                       2970 	_vars VSIZE 
      00A14E 04 02            [ 2]    1     sub sp,#VSIZE 
      00A14F CD 19 B0         [ 4] 2971 	call arg_list  
      00A14F CD 82            [ 1] 2972 	cp a,#2 
      00A151 9D 03            [ 1] 2973 	jreq 1$
      00A152 CC 16 84         [ 2] 2974 	jp syntax_error
      0026D5                       2975 1$: _xpop 
      00A152 C6 00            [ 1]    1     ld a,(y)
      00A154 0D               [ 1]    2     ldw x,y 
      00A155 CE 00            [ 2]    3     ldw x,(1,x)
      00A157 0E 72 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      00A15B 1A               [ 1] 2976 	ld a,xl 
      00A15C 72 5C            [ 1] 2977 	ld (PINVAL,sp),a
      0026E1                       2978 	_xpop 
      00A15E 00 1B            [ 1]    1     ld a,(y)
      00A160 72               [ 1]    2     ldw x,y 
      00A161 CF 00            [ 2]    3     ldw x,(1,x)
      00A163 1A CD A0 D2      [ 2]    4     addw y,#CELL_SIZE 
      00A167 CD 98 68         [ 2] 2979 	cpw x,#15 
      00A16A A1 08            [ 2] 2980 	jrule 2$
      00A16C 26 03            [ 1] 2981 	ld a,#ERR_BAD_VALUE
      00A16E CC A0 E6         [ 2] 2982 	jp tb_error 
      00A171 CD 2C 6F         [ 4] 2983 2$:	call select_pin 
      00A171 A1 00            [ 1] 2984 	ld (PINNO,sp),a 
      00A173 27 07            [ 1] 2985 	ld a,#1
      00A175 A1 0A            [ 1] 2986 	tnz (PINNO,sp)
      00A177 27 03            [ 1] 2987 	jreq 4$
      00A179 CC               [ 1] 2988 3$: sll a
      00A17A 97 04            [ 1] 2989 	dec (PINNO,sp)
      00A17C 26 FB            [ 1] 2990 	jrne 3$
      00A17C 5B 05            [ 1] 2991 4$: tnz (PINVAL,sp)
      00A17E 90 85            [ 1] 2992 	jrne 5$
      00A180 81               [ 1] 2993 	cpl a 
      00A181 E4 00            [ 1] 2994 	and a,(GPIO_ODR,x)
      00A181 55 00            [ 2] 2995 	jra 8$
      00A183 04 00            [ 1] 2996 5$: or a,(GPIO_ODR,x)
      00A185 02 81            [ 1] 2997 8$: ld (GPIO_ODR,x),a 
      00A187                       2998 	_drop VSIZE 
      00A187 52 04            [ 2]    1     addw sp,#VSIZE 
      00A189 0F               [ 4] 2999 	ret
                                   3000 
                                   3001 
                                   3002 ;-----------------------
                                   3003 ; BASIC: STOP
                                   3004 ; stop progam execution  
                                   3005 ; without resetting pointers 
                                   3006 ; the program is resumed
                                   3007 ; with RUN 
                                   3008 ;-------------------------
      002714                       3009 stop:
      00A18A 01 CD 9A 30 A1   [ 2] 3010 	btjt flags,#FRUN,2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



      00A18F 02               [ 1] 3011 	clr a
      00A190 24               [ 4] 3012 	ret 
      00271B                       3013 2$:	 
                                   3014 ; create space on cstack to save context 
      00A191 03 CC 97         [ 2] 3015 	ldw x,#break_point 
      00A194 04 A1 03         [ 4] 3016 	call puts 
      002721                       3017 	_drop 2 ;drop return address 
      00A197 25 0C            [ 2]    1     addw sp,#2 
      002723                       3018 	_vars CTXT_SIZE ; context size 
      00A199 90 F6            [ 2]    1     sub sp,#CTXT_SIZE 
      00A19B 93 EE 01         [ 4] 3019 	call save_context 
      00A19E 72 A9 00         [ 2] 3020 	ldw x,#tib 
      00A1A1 03 9F 6B         [ 2] 3021 	ldw basicptr,x
      00A1A4 01               [ 1] 3022 	clr (x)
      00A1A5 90 F6 93 EE      [ 1] 3023 	clr count  
      00A1A9 01               [ 1] 3024 	clrw x 
      00A1AA 72 A9 00         [ 2] 3025 	ldw in.w,x
      00A1AD 03 9F 6B 02      [ 1] 3026 	bres flags,#FRUN 
      00A1B1 90 F6 93 EE      [ 1] 3027 	bset flags,#FBREAK
      00A1B5 01 72 A9         [ 2] 3028 	jp interpreter 
      00A1B8 00 03 F6 14 02 18 01  3029 break_point: .asciz "\nbreak point, RUN to resume.\n"
             27 F9 5B 04 81 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   3030 
                                   3031 ;-----------------------
                                   3032 ; BASIC: NEW
                                   3033 ; from command line only 
                                   3034 ; free program memory
                                   3035 ; and clear variables 
                                   3036 ;------------------------
      00A1C4                       3037 new: 
      00A1C4 CD 9A 30 A1 02   [ 2] 3038 	btjf flags,#FRUN,0$ 
      00A1C9 27               [ 4] 3039 	ret 
      002766                       3040 0$:	
      00A1CA 03 CC 97         [ 4] 3041 	call clear_basic 
      00A1CD 04               [ 4] 3042 	ret 
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
      00A1CE                       3055 erase_program:
      00A1CE 90 F6 93         [ 4] 3056 	call get_int24
      00A1D1 EE 01 72         [ 4] 3057 	call is_program_addr 
      00A1D4 A9 00            [ 1] 3058 	jrne 9$
      00A1D6 03 9F 88         [ 4] 3059 	call move_erase_to_ram
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A1D9 90 F6 93 EE      [ 1] 3060 	clr farptr 
      002779                       3061 	_vars VSIZE 
      00A1DD 01 72            [ 2]    1     sub sp,#VSIZE 
      00A1DF A9 00 03         [ 2] 3062 1$:	subw x,#4 
      00A1E2 84 FA            [ 2] 3063 	ldw (ADDR,sp),x
      00A1E4 F7 81            [ 2] 3064 	ldw x,(2,x)
      00A1E6 1F 03            [ 2] 3065 	ldw (PRG_SIZE,sp),x
      00A1E6 CD 9A            [ 1] 3066 	ld a,#BLOCK_SIZE 
      00A1E8 30               [ 2] 3067 	div x,a 
      00A1E9 A1               [ 1] 3068 	tnz a 
      00A1EA 02 27            [ 1] 3069 	jreq 2$ 
      00A1EC 03               [ 1] 3070 	incw x 
      00A1ED CC 97            [ 2] 3071 2$:	ldw (BLOCKS,sp),x 
      00A1EF 04 01            [ 2] 3072 	ldw x,(ADDR,sp)
      00A1F0 CF 00 19         [ 2] 3073 	ldw ptr16,x 
      00A1F0 90 F6 93         [ 4] 3074 3$:	call block_erase
      00A1F3 EE 01 72         [ 2] 3075 	ldw x,#BLOCK_SIZE 
      00A1F6 A9 00 03         [ 4] 3076 	call incr_farptr
      00A1F9 9F 43            [ 2] 3077 	ldw x,(BLOCKS,sp)
      00A1FB 88               [ 2] 3078 	decw x 
      00A1FC 90 F6            [ 2] 3079 	ldw (BLOCKS,sp),x 
      00A1FE 93 EE            [ 1] 3080 	jrne 3$ 
                                   3081 ; write XX and size at addr 
      00A200 01 72            [ 2] 3082 	ldw x,(ADDR,sp)
      00A202 A9 00 03         [ 2] 3083 	ldw ptr16,x 
      00A205 84 F4            [ 1] 3084 	ld a,#'X 
      00A207 F7               [ 1] 3085 	clrw x 
      00A208 81 07 8B         [ 4] 3086 	call write_byte 
      00A209 CD 07 8B         [ 4] 3087 	call write_byte 
      00A209 CD 9A            [ 1] 3088 	ld a,(PRG_SIZE,sp)
      00A20B 30 A1 02         [ 4] 3089 	call write_byte 
      00A20E 27 03            [ 1] 3090 	ld a,(PRG_SIZE+1,sp)
      00A210 CC 97 04         [ 4] 3091 	call write_byte 
      0027BA                       3092 	_drop VSIZE 
      00A213 90 F6            [ 2]    1     addw sp,#VSIZE 
      0027BC                       3093 9$:	
      00A215 93               [ 4] 3094 	ret 
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
      0027BD                       3110 erase:
      00A216 EE 01 72 A9 00   [ 2] 3111 	btjf flags,#FRUN,eras0
      00A21B 03 9F            [ 1] 3112 	ld a,#ERR_CMD_ONLY
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A21D 88 90 F6         [ 2] 3113 	jp tb_error 
      0027C7                       3114 eras0:	
      00A220 93 EE 01 72      [ 1] 3115 	clr farptr 
      00A224 A9 00 03         [ 4] 3116 	call next_token
      00A227 84 F8            [ 1] 3117 	cp a,#TK_INTGR
      00A229 F7 81            [ 1] 3118 	jreq erase_program  
      00A22B                       3119 	_vars VSIZE 
      00A22B CD 9A            [ 2]    1     sub sp,#VSIZE 
      00A22D 2B A1            [ 1] 3120 	cp a,#TK_CHAR 
      00A22F 02 27            [ 1] 3121 	jreq 0$ 
      00A231 03 CC 97         [ 2] 3122 	jp syntax_error
      00A234 04 18 2A         [ 4] 3123 0$: call get_char 
      00A235 A4 DF            [ 1] 3124 	and a,#0XDF 
      00A235 90 F6            [ 1] 3125 	cp a,#'E
      00A237 93 EE            [ 1] 3126 	jrne 1$
      00A239 01 72 A9         [ 2] 3127 	ldw x,#EEPROM_BASE 
      00A23C 00 03 9F         [ 2] 3128 	ldw farptr+1,x 
      00A23F A4 07 88         [ 2] 3129 	ldw x,#EEPROM_END
      00A242 A6               [ 1] 3130 	clr a 
      00A243 01 0D            [ 2] 3131 	jra 3$ 
      00A245 01 27            [ 1] 3132 1$: cp a,#'F 
      00A247 05 48            [ 1] 3133 	jreq 2$
      00A249 0A 01 20         [ 2] 3134 	ldw x,#err_bad_value
      00A24C F7 6B 01         [ 2] 3135 	jp tb_error
      0027FA                       3136 2$:
      00A24F 90 F6 93         [ 2] 3137 	ldw x,#app_space  
      00A252 EE 01 72         [ 2] 3138 	ldw farptr+1,x 
      00A255 A9 00            [ 1] 3139 	ld a,#(FLASH_END>>16)&0XFF 
      00A257 03 84 F4         [ 2] 3140 	ldw x,#FLASH_END&0xffff
      002805                       3141 3$:
      00A25A 27 02            [ 1] 3142 	ld (LIMIT,sp),a 
      00A25C A6 01            [ 2] 3143 	ldw (LIMIT+1,sp),x 
                                   3144 ; operation done from RAM
                                   3145 ; copy code to RAM in tib   
      00A25E 5F 97 4F         [ 4] 3146 	call move_erase_to_ram
      00280C                       3147 4$:	 
      00A261 81 08 6E         [ 4] 3148     call scan_block 
      00A262 27 08            [ 1] 3149 	jreq 5$  ; block already erased 
      00A262 CD 9A            [ 1] 3150     ld a,#'E 
      00A264 30 A1 02         [ 4] 3151     call putc 
      00A267 27 03 CC         [ 4] 3152 	call block_erase   
                                   3153 ; this block is clean, next  
      00A26A 97 04 80         [ 2] 3154 5$:	ldw x,#BLOCK_SIZE
      00A26C CD 08 60         [ 4] 3155 	call incr_farptr
                                   3156 ; check limit, 24 bit substraction  	
      00A26C 90 F6            [ 1] 3157 	ld a,(LIMIT,sp)
      00A26E 93 EE            [ 2] 3158 	ldw x,(LIMIT+1,sp)
      00A270 01 72 A9 00      [ 2] 3159 	subw x,farptr+1
      00A274 03 9F 88         [ 1] 3160 	sbc a,farptr 
      00A277 90 F6            [ 1] 3161 	jrugt 4$ 
      00A279 93 EE 01         [ 4] 3162 9$: call clear_basic
      00A27C 72 A9            [ 2] 3163 	ldw x,(LIMIT+1,sp)
      00A27E 00 03 84         [ 2] 3164 	cpw x,#EEPROM_END
      00A281 F7 81            [ 1] 3165 	jrne 10$
      00A283 CD 1D 20         [ 4] 3166 	call func_eefree 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



      002839                       3167 10$:
      002839                       3168 	_drop VSIZE 
      00A283 CD 9A            [ 2]    1     addw sp,#VSIZE 
      00A285 2B               [ 4] 3169 	ret 
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
      00283C                       3180 qsign: 
      00A286 A1               [ 2] 3181 	pushw x 
                                   3182 ; align to block 
      00A287 01               [ 1] 3183 	ld a,xl 
      00A288 27 03            [ 1] 3184 	and a,#BLOCK_SIZE 
      00A28A CC               [ 1] 3185 	ld xl,a 
      00A28B 97               [ 2] 3186 	ldw x,(x)
      00A28C 04 90 F6         [ 2] 3187 	cpw x,SIGNATURE ; "TB" 
      00A28F 93               [ 2] 3188 	popw x 
      00A290 EE               [ 4] 3189 	ret 
                                   3190 
                                   3191 ;--------------------------------------
                                   3192 ;  fill write buffer 
                                   3193 ;  input:
                                   3194 ;    y  point to output buffer 
                                   3195 ;    x  point to source 
                                   3196 ;    a  bytes to write in buffer 
                                   3197 ;  output:
                                   3198 ;    y   += A 
                                   3199 ;    X   += A 
                                   3200 ;    A   0 
                                   3201 ;---------------------------------------
      002847                       3202 fill_write_buffer:
      00A291 01               [ 1] 3203 	push a 
      00A292 72               [ 1] 3204 	tnz a 
      00A293 A9 00            [ 1] 3205 	jreq 9$ 
      00A295 03               [ 1] 3206 1$: ld a,(x)
      00A296 C7               [ 1] 3207 	incw x 
      00A297 00 19            [ 1] 3208 	ld (y),a 
      00A299 CF 00            [ 1] 3209 	incw y 
      00A29B 1A 92            [ 1] 3210 	dec (1,sp) 
      00A29D BC 00            [ 1] 3211 	jrne 1$ 
      00A29F 19               [ 1] 3212 9$:	pop a 
      00A2A0 5F               [ 4] 3213     ret 	
                                   3214 
                                   3215 ;--------------------------------------
                                   3216 ;  fill pad buffer with zero 
                                   3217 ;  input:
                                   3218 ;	none 
                                   3219 ;  output:
                                   3220 ;    y     buffer address  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



                                   3221 ;--------------------------------------
      002857                       3222 clear_block_buffer:
      00A2A1 97               [ 1] 3223 	push a 
      00A2A2 4F 81 16 E0      [ 2] 3224 	ldw y,#block_buffer 
      00A2A4 90 89            [ 2] 3225 	pushw y
      00A2A4 CD 9C            [ 1] 3226 	ld a,#BLOCK_SIZE   
      00A2A6 8D 90            [ 1] 3227 1$:	clr (y)
      00A2A8 F6 93            [ 1] 3228 	incw y
      00A2AA EE               [ 1] 3229 	dec a  
      00A2AB 01 72            [ 1] 3230 	jrne 1$ 	
      00A2AD A9 00            [ 2] 3231 9$: popw y 
      00A2AF 03               [ 1] 3232 	pop a 			
      00A2B0 4D               [ 4] 3233 	ret 
                                   3234 
                                   3235 
                                   3236 ;----------------------------------
                                   3237 ;  search  a free space space that 
                                   3238 ;  fit program size 
                                   3239 ; input:
                                   3240 ;    X    program size 
                                   3241 ; output:
                                   3242 ;    X    address | 0 
                                   3243 ;------------------------------------
                           000001  3244 	PG_SIZE=1 
                           000002  3245 	VSIZE=2 
      00286B                       3246 search_fit:
      00A2B1 26               [ 2] 3247 	pushw x; PG_SIZE 
      00A2B2 0D 5D 26         [ 2] 3248 	ldw x,#app_space 
      00A2B5 0A 55 00         [ 4] 3249 1$:	call is_erased 
      00A2B8 04 00            [ 1] 3250 	jreq 4$
      00A2BA 02               [ 1] 3251 	ld a,(x)
      00A2BB 5B 02            [ 1] 3252 	or a,(1,x)
      00A2BD CC 97            [ 1] 3253 	jreq 9$ ; free space 
      00A2BF B7 81 59         [ 4] 3254 2$:	call skip_to_next
      00A2C1 5D               [ 2] 3255 	tnzw x 
      00A2C1 85 52            [ 1] 3256 	jrne 1$
      00A2C3 0D 89            [ 2] 3257 	jra 9$
      002881                       3258 4$: ; erased program 
                                   3259     ; does it fit? 
      00A2C5 A6 85 CD         [ 2] 3260 	ldw acc16,x 
      00A2C8 9A 1E            [ 2] 3261 	ldw x,(2,x) ; size erased program 
      00A2CA CD 98            [ 2] 3262 	cpw x,(1,sp) ; size program to save 
      00A2CC 90 1F            [ 1] 3263 	jruge 8$   ; fit 
      00A2CE 09 CD 9D         [ 2] 3264 	ldw x,acc16 
      00A2D1 62 72            [ 2] 3265 	jra 2$ 
      00A2D3 14 00 23         [ 2] 3266 8$: ldw x,acc16 ; fit in this one 	
      002892                       3267 9$:	_drop VSIZE 
      00A2D6 CD 98            [ 2]    1     addw sp,#VSIZE 
      00A2D8 68               [ 4] 3268 	ret  
                                   3269 
                                   3270 ;-------------------------
                                   3271 ; erase header and 
                                   3272 ; size fields 
                                   3273 ; input: 
                                   3274 ;    X    program address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



                                   3275 ; output:
                                   3276 ;    X    unchanged 
                                   3277 ;-------------------------
                           000001  3278 	COUNT=1 
      002895                       3279 erase_header:
      00A2D9 A1               [ 2] 3280 	pushw x 
      00A2DA 80 27            [ 1] 3281 	push #4 ; COUNT 
      00A2DC 03 CC 97 04      [ 1] 3282 	clr farptr 
      00A2E0 CF 00 19         [ 2] 3283 	ldw ptr16,x 
      00A2E0 FE               [ 1] 3284 	clr a 
      00A2E1 72               [ 1] 3285 	clrw x 
      00A2E2 5C 00 02         [ 4] 3286 1$:	call write_byte 
      00A2E5 72 5C            [ 1] 3287 	dec (COUNT,sp)
      00A2E7 00 02            [ 1] 3288 	jrne 1$
      0028A8                       3289 	_drop 1 
      00A2E9 A3 A2            [ 2]    1     addw sp,#1 
      00A2EB F1               [ 2] 3290 	popw x 
      00A2EC 27 03 CC         [ 2] 3291 	ldw ptr16,x 
      00A2EF 97               [ 4] 3292 	ret 
                                   3293 
                                   3294 ;---------------------------------------
                                   3295 ; BASIC: SAVE
                                   3296 ; write application from RAM to FLASH
                                   3297 ; at UFLASH address
                                   3298 ;--------------------------------------
                           000001  3299 	XTEMP=1
                           000003  3300 	COUNT=3  ; last count bytes written 
                           000004  3301 	CNT_LO=4 ; count low byte 
                           000005  3302 	TOWRITE=5 ; how bytes left to write  
                           000006  3303 	VSIZE=6 
      0028AF                       3304 cmd_save:
      00A2F0 04               [ 2] 3305 	pushw x 
      00A2F1 90 89            [ 2] 3306 	pushw y 
      0028B2                       3307 	_vars VSIZE
      00A2F1 72 04            [ 2]    1     sub sp,#VSIZE 
      00A2F3 00 23 03         [ 4] 3308 	call prog_size 
      00A2F6 CC 97            [ 1] 3309 	jrne 0$ 
      00A2F8 04 CD 9B         [ 2] 3310 	jp 9$ ; no program to save 
      00A2FB 74 A1            [ 2] 3311 0$:	ldw (TOWRITE,sp),x ; program size
      00A2FD 84 27 03 CC      [ 1] 3312 	clr farptr 
      00A301 97 04 90         [ 4] 3313 	call search_fit
      00A304 F6 93 EE         [ 2] 3314 	ldw ptr16,x 
      00A307 01 72 A9         [ 2] 3315 	ldw x,#0xFFFF
      00A30A 00 03 6B 06      [ 2] 3316 	subw x,ptr16 ; free flash 
      00A30E 1F 07 CD         [ 2] 3317 	subw x,#4 ; signature and size field 
      00A311 98 68            [ 2] 3318 	cpw x,(TOWRITE,sp)
      00A313 A1 00            [ 1] 3319 	jruge 1$
      00A315 27 17            [ 1] 3320 	ld a,#ERR_MEM_FULL
      00A317 A1 80 26         [ 2] 3321 	jp tb_error 
      0028DB                       3322 1$: ; check if header bytes are zero's 
      00A31A 0E FE 72         [ 2] 3323 	ldw x,ptr16 
      00A31D 5C               [ 1] 3324 	ld a,(x)
      00A31E 00 02            [ 1] 3325 	or a,(1,x)
      00A320 72 5C            [ 1] 3326 	or a,(2,x)
      00A322 00 02            [ 1] 3327 	or a,(3,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



      00A324 A3 A3            [ 1] 3328 	jreq 2$
      00A326 37 27 0E         [ 4] 3329 	call erase_header ; preserve X and farptr 
      00A329                       3330 2$: 
                                   3331 ; block programming flash
                                   3332 ; must be done from RAM
                                   3333 ; moved in tib  
      00A329 55 00 03         [ 4] 3334 	call move_prg_to_ram
                                   3335 ; initialize written bytes count  
      00A32C 00 02            [ 1] 3336 	clr (COUNT,sp)
                                   3337 ; first bock 
                                   3338 ; containt signature 2 bytes 
                                   3339 ; and size 	2 bytes 
                                   3340 ; use Y as pointer to block_buffer
      00A32E CD 28 57         [ 4] 3341 	call clear_block_buffer ; -- y=*block_buffer	
                                   3342 ; write signature
      00A32E 0F 03 AE         [ 2] 3343 	ldw x,SIGNATURE ; "TB" 
      00A331 00 01            [ 2] 3344 	ldw (y),x 
      00A333 1F 04 20 2F      [ 2] 3345 	addw y,#2
      00A337 1E 05            [ 2] 3346 	ldw x,(TOWRITE,sp)
      00A337 72 04            [ 2] 3347 	ldw (y),x
      00A339 00 23 03 CC      [ 2] 3348 	addw y,#2   
      00A33D 97 04            [ 1] 3349 	ld a,#(BLOCK_SIZE-4)
      00A33F CD 9B 74         [ 2] 3350 	cpw x,#(BLOCK_SIZE-4) 
      00A342 A1 84            [ 1] 3351 	jrugt 3$
      00A344 27               [ 1] 3352 	ld a,xl 
      00A345 03 CC            [ 1] 3353 3$:	ld (CNT_LO,sp),a   
      00A347 97 04 1B         [ 2] 3354 	ldw x,txtbgn 
      00A349 1F 01            [ 2] 3355 	ldw (XTEMP,sp),x 
      002912                       3356 32$: 
      00A349 90 F6            [ 2] 3357 	ldw x,(XTEMP,sp)
      00A34B 93 EE            [ 1] 3358 	ld a,(CNT_LO,sp)
      00A34D 01 72 A9         [ 4] 3359 	call fill_write_buffer 
      00A350 00 03            [ 2] 3360 	ldw (XTEMP,sp),x 
      00A352 6B 03 1F         [ 2] 3361 	ldw x,#block_buffer
      00A355 04 4D 2A         [ 4] 3362 	call write_buffer
      00A358 0D 7B 06         [ 2] 3363 	ldw x,#BLOCK_SIZE 
      00A35B 1E 07 1D         [ 4] 3364 	call incr_farptr  
                                   3365 ; following blocks 
      00A35E 00 01            [ 2] 3366 	ldw x,(XTEMP,sp)
      00A360 A2 00 6B         [ 2] 3367 	cpw x,txtend 
      00A363 06 1F            [ 1] 3368 	jruge 9$ 
      00A365 07 05            [ 2] 3369 	ldw x,(TOWRITE,sp)
      00A366 72 F0 03         [ 2] 3370 	subw x,(COUNT,sp)
      00A366 CE 00            [ 2] 3371 	ldw (TOWRITE,sp),x 
      00A368 05 1F            [ 1] 3372 	ld a,#BLOCK_SIZE 
      00A36A 0D CE 00         [ 2] 3373 	cpw x,#BLOCK_SIZE 
      00A36D 01 1F            [ 1] 3374 	jruge 4$ 
      00A36F 0B               [ 1] 3375 	ld a,xl 
      00A370 72 15            [ 1] 3376 4$:	ld (CNT_LO,sp),a 
      00A372 00 23 72         [ 4] 3377 	call clear_block_buffer 
      00A375 5C 00            [ 2] 3378 	jra 32$ 
      002944                       3379 9$:	_drop VSIZE 
      00A377 20 81            [ 2]    1     addw sp,#VSIZE 
      00A379 90 85            [ 2] 3380     popw y 
      00A379 72               [ 2] 3381 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A37A 5D               [ 4] 3382 	ret 
                                   3383 
      00A37B 00 20                 3384 SIGNATURE: .ascii "TB"
      00A37D 26 03                 3385 ERASED: .ascii "XX" 
                                   3386 
                                   3387 ;---------------------
                                   3388 ; check if there is 
                                   3389 ; an erased program 
                                   3390 ; at this address 
                                   3391 ; input:
                                   3392 ;    X    address 
                                   3393 ; output:
                                   3394 ;    Z    Set=erased program 
                                   3395 ;--------------------
      00294E                       3396 is_erased:
      00A37F CC               [ 2] 3397 	pushw x 
                                   3398 ; align to BLOCK 
      00A380 97               [ 1] 3399 	ld a,xl 
      00A381 04 80            [ 1] 3400 	and a,#BLOCK_SIZE 
      00A382 97               [ 1] 3401 	ld xl,a 
      00A382 A6               [ 2] 3402 	ldw x,(x)
      00A383 85 CD 9A         [ 2] 3403 	cpw x,ERASED 
      00A386 1E               [ 2] 3404 	popw x 
      00A387 CD               [ 4] 3405 	ret 
                                   3406 
                                   3407 ;----------------------------
                                   3408 ;  skip to next program
                                   3409 ;  block 
                                   3410 ; input:
                                   3411 ;    X   actual program addr
                                   3412 ; output:
                                   3413 ;    X   next block 
                                   3414 ;        after program 
                                   3415 ;----------------------------
      002959                       3416 skip_to_next:
                                   3417 ; align to block 
      00A388 98               [ 1] 3418 	ld a,xl 
      00A389 90 13            [ 1] 3419 	and a,#BLOCK_SIZE 
      00A38B 09               [ 1] 3420 	ld xl,a 
      00A38C 27 03 CC         [ 2] 3421 	ldw acc16,x 
      00A38F 97 04            [ 2] 3422 	ldw x,(2,x)
      00A391 72 BB 00 0D      [ 2] 3423 	addw x,acc16 ; blk_addr+prg_size 
      00A391 CF 00 1A         [ 2] 3424 	addw x,#4 ; +header fields 
                                   3425 ; align to next block 
      00A394 F6 EE 01         [ 2] 3426 	addw x,#BLOCK_SIZE-1 
      00A397 72               [ 1] 3427 	ld a,xl 
      00A398 FB 04            [ 1] 3428 	and a,#0x80 
      00A39A 19               [ 1] 3429 	ld xl,a  
      00A39B 03               [ 4] 3430 	ret 
                                   3431 
                                   3432 
                                   3433 ;---------------------
                                   3434 ; BASIC: DIR 
                                   3435 ; list programs saved 
                                   3436 ; in flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



                                   3437 ;--------------------
                           000001  3438 	XTEMP=1 
      002971                       3439 cmd_dir:
      00A39C 72 C7 00         [ 2] 3440 	ldw x,#app_space 
      00A39F 1A               [ 2] 3441 	pushw x 
      002975                       3442 1$: 
      00A3A0 72 5C 00         [ 4] 3443 	call qsign 
      00A3A3 1B 72            [ 1] 3444 	jrne 4$
      00A3A5 CF 00 1A         [ 2] 3445 	addw x,#4
      00A3A8 C7 00 0D CF      [ 1] 3446 	mov base,#16
      00A3AC 00 0E 7B         [ 4] 3447 	call prt_i16
      00A3AF 06 1E            [ 1] 3448 	ld a,#SPACE 
      00A3B1 07 72 B0         [ 4] 3449 	call putc 
      00A3B4 00 0E            [ 2] 3450 	ldw x,(1,sp)
      00A3B6 C2 00            [ 2] 3451 	ldw x,(2,x)
      00A3B8 0D 18 03 A8      [ 1] 3452 	mov base,#10 
      00A3BC 80 2B 12         [ 4] 3453 	call prt_i16 
      00A3BF 20 25 7B         [ 2] 3454 	ldw x,#STR_BYTES
      00A3C2 03 2A 07         [ 4] 3455 	call puts
      00A3C5 C6 00            [ 1] 3456 	ld a,#', 
      00A3C7 0F 2F 07         [ 4] 3457 	call putc
      00A3CA 20 1A            [ 2] 3458 	ldw x,(1,sp)
      00A3CC 1C 00 0A         [ 2] 3459 	addw x,#10
      00A3CC 72 0E 00         [ 4] 3460 	call puts 
      00A3CF 0F 15            [ 1] 3461 	ld a,#CR 
      00A3D1 CD 08 FF         [ 4] 3462 	call putc
      00A3D1 1E 0D            [ 2] 3463 	ldw x,(1,sp)
      00A3D3 CF 00 05         [ 4] 3464 3$:	call skip_to_next
      00A3D6 72 01            [ 2] 3465 	ldw (1,sp),x 
      00A3D8 00 23            [ 2] 3466 	jra 1$
      0029B5                       3467 4$: ; check if it is an erased program 
      00A3DA 05 E6 02         [ 4] 3468 	call is_erased 
      00A3DD C7 00            [ 1] 3469 	jreq 3$ 
      0029BA                       3470 8$: ; done 
      0029BA                       3471 	_drop 2 
      00A3DF 04 1E            [ 2]    1     addw sp,#2 
      00A3E1 0B               [ 4] 3472 	ret 
                                   3473 
                                   3474 ;---------------------
                                   3475 ; BASIC: WRITE expr1,expr2|char|string[,expr|char|string]* 
                                   3476 ; write 1 or more byte to FLASH or EEPROM
                                   3477 ; starting at address  
                                   3478 ; input:
                                   3479 ;   expr1  	is address 
                                   3480 ;   expr2,...,exprn   are bytes to write
                                   3481 ; output:
                                   3482 ;   none 
                                   3483 ;---------------------
      0029BD                       3484 write:
      00A3E2 CF 00 01         [ 4] 3485 	call expression
      00A3E5 81 84            [ 1] 3486 	cp a,#TK_INTGR 
      00A3E6 27 03            [ 1] 3487 	jreq 0$
      00A3E6 85 5B 0D         [ 2] 3488 	jp syntax_error
      0029C7                       3489 0$: _xpop 
      00A3E9 72 5A            [ 1]    1     ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A3EB 00               [ 1]    2     ldw x,y 
      00A3EC 20 FC            [ 2]    3     ldw x,(1,x)
      00A3EE 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A3EE CD 98 68         [ 1] 3490 	ld farptr,a 
      00A3F1 A1 84 27         [ 2] 3491 	ldw ptr16,x 
      0029D6                       3492 1$:	
      00A3F4 07 A1 03         [ 4] 3493 	call next_token 
      00A3F7 27 26            [ 1] 3494 	cp a,#TK_COMMA 
      00A3F9 CC 97            [ 1] 3495 	jreq 2$ 
      00A3FB 04 46            [ 2] 3496 	jra 9$ ; no more data 
      00A3FC CD 17 E8         [ 4] 3497 2$:	call next_token 
      00A3FC 90 89            [ 1] 3498 	cp a,#TK_CHAR 
      00A3FE CD 98            [ 1] 3499 	jreq 4$ 
      00A400 9A 4F            [ 1] 3500 	cp a,#TK_QSTR
      00A402 90 CE            [ 1] 3501 	jreq 6$
      0029EA                       3502 	_unget_token 
      00A404 00 05 90 FE 90   [ 1]    1      mov in,in.saved  
      00A409 89 13 01         [ 4] 3503 	call expression
      00A40C 5B 02            [ 1] 3504 	cp a,#TK_INTGR
      00A40E 25 01            [ 1] 3505 	jreq 3$
      00A410 4C 16 84         [ 2] 3506 	jp syntax_error
      00A411                       3507 3$:	_xpop 
      00A411 CD 8C            [ 1]    1     ld a,(y)
      00A413 C5               [ 1]    2     ldw x,y 
      00A414 5D 26            [ 2]    3     ldw x,(1,x)
      00A416 05 A6 05 CC      [ 2]    4     addw y,#CELL_SIZE 
      00A41A 97               [ 1] 3508 	ld a,xl 
      00A41B 06               [ 1] 3509 	clrw x 
      00A41C 90 85 81         [ 4] 3510 	call write_byte
      00A41F 20 CD            [ 2] 3511 	jra 1$ 
      002A09                       3512 4$: ; write character 
      00A41F 90               [ 1] 3513 	ld a,(x)
      00A420 89 89 CD 98      [ 1] 3514 	inc in 
      00A424 81               [ 1] 3515 	clrw x 
      00A425 72 5F 00         [ 4] 3516 	call write_byte 
      00A428 0E 90            [ 2] 3517 	jra 1$ 
      002A14                       3518 6$: ; write string 
      00A42A CE               [ 2] 3519 	pushw x 
      00A42B 00               [ 1] 3520 	ld a,(x)
      00A42C 1C 90 E6 03      [ 1] 3521 	inc in 
      00A430 A1               [ 1] 3522 	clrw x 
      00A431 03 27 15         [ 4] 3523 	call write_byte 
      00A434 90               [ 2] 3524 	popw x 
      00A435 E6               [ 1] 3525 	ld a,(x)
      00A436 02 C7            [ 1] 3526 	jreq 1$
      00A438 00               [ 1] 3527 	incw x 
      00A439 0F 72            [ 2] 3528 	jra 6$ 	
      002A25                       3529 9$:
      00A43B B9               [ 4] 3530 	ret 
                                   3531 
                                   3532 
                                   3533 ;---------------------
                                   3534 ;BASIC: CHAR(expr)
                                   3535 ; évaluate expression 
                                   3536 ; and take the 7 least 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3537 ; bits as ASCII character
                                   3538 ; output: 
                                   3539 ; 	A char 
                                   3540 ;---------------------
      002A26                       3541 func_char:
      00A43C 00 0E 90         [ 4] 3542 	call func_args 
      00A43F C3 00            [ 1] 3543 	cp a,#1
      00A441 1E 25            [ 1] 3544 	jreq 1$
      00A443 E9 A6 0A         [ 2] 3545 	jp syntax_error
      002A30                       3546 1$:	_xpop
      00A446 CC 97            [ 1]    1     ld a,(y)
      00A448 06               [ 1]    2     ldw x,y 
      00A449 EE 01            [ 2]    3     ldw x,(1,x)
      00A449 90 89 72 A9      [ 2]    4     addw y,#CELL_SIZE 
      00A44D 00               [ 1] 3547 	ld a,xl
      00A44E 04 1E            [ 1] 3548 	and a,#0x7f 
      00A450 03               [ 4] 3549 	ret
                                   3550 
                                   3551 ;---------------------
                                   3552 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3553 ; extract first character 
                                   3554 ; of string argument 
                                   3555 ; output:
                                   3556 ;    A:X    int24 
                                   3557 ;---------------------
      002A3D                       3558 ascii:
      00A451 CD 94            [ 1] 3559 	ld a,#TK_LPAREN
      00A453 11 26 04         [ 4] 3560 	call expect 
      00A456 90 85 20         [ 4] 3561 	call next_token 
      00A459 DA 02            [ 1] 3562 	cp a,#TK_QSTR 
      00A45A 27 0E            [ 1] 3563 	jreq 1$
      00A45A 85 5B            [ 1] 3564 	cp a,#TK_CHAR 
      00A45C 02 90            [ 1] 3565 	jreq 2$ 
      00A45E 85 81            [ 1] 3566 	cp a,#TK_CFUNC 
      00A460 27 03            [ 1] 3567 	jreq 0$
      00A460 72 00 00         [ 2] 3568 	jp syntax_error
      002A54                       3569 0$: ; cfunc 
      00A463 23               [ 4] 3570 	call (x)
      00A464 05 A6            [ 2] 3571 	jra 3$
      002A57                       3572 1$: ; quoted string 
      00A466 06               [ 1] 3573 	ld a,(x)
      00A467 CC               [ 1] 3574 	push a  
      00A468 97 06 CD         [ 4] 3575 	call skip_string
      00A46B 9B               [ 1] 3576 	pop a  	
      00A46C 74 A1            [ 2] 3577 	jra 3$ 
      002A5F                       3578 2$: ; character 
      00A46E 84 27 03         [ 4] 3579 	call get_char 
      00A471 CC               [ 1] 3580 3$:	clrw x 
      00A472 97               [ 1] 3581 	rlwa x   
      002A64                       3582 4$:	_xpush  
      00A473 04 90 F6 93      [ 2]    1     subw y,#CELL_SIZE
      00A477 EE 01            [ 1]    2     ld (y),a 
      00A479 72 A9 00         [ 2]    3     ldw (1,y),x 
      00A47C 03 9F            [ 1] 3583 	ld a,#TK_RPAREN 
      00A47E 27 68 88         [ 4] 3584 	call expect
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      002A72                       3585 9$:	
      002A72                       3586 	_xpop  
      00A481 CD 98            [ 1]    1     ld a,(y)
      00A483 68               [ 1]    2     ldw x,y 
      00A484 A1 80            [ 2]    3     ldw x,(1,x)
      00A486 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A48A 04               [ 4] 3587 	ret 
                                   3588 
                                   3589 ;---------------------
                                   3590 ;BASIC: KEY
                                   3591 ; wait for a character 
                                   3592 ; received from STDIN 
                                   3593 ; input:
                                   3594 ;	none 
                                   3595 ; output:
                                   3596 ;	a	 character 
                                   3597 ;---------------------
      002A7C                       3598 key:
      00A48B FE 72 5C         [ 4] 3599 	call getc 
      00A48E 00               [ 4] 3600 	ret
                                   3601 
                                   3602 ;----------------------
                                   3603 ; BASIC: QKEY
                                   3604 ; Return true if there 
                                   3605 ; is a character in 
                                   3606 ; waiting in STDIN 
                                   3607 ; input:
                                   3608 ;  none 
                                   3609 ; output:
                                   3610 ;   A     0|-1
                                   3611 ;-----------------------
      002A80                       3612 qkey:: 
      00A48F 02               [ 1] 3613 	clrw x 
      00A490 72 5C 00         [ 1] 3614 	ld a,rx1_head
      00A493 02 A3 A4         [ 1] 3615 	sub a,rx1_tail 
      00A496 F2 27            [ 1] 3616 	jreq 9$ 
      00A498 08               [ 2] 3617 	cplw x
      00A499 A3 A5            [ 1] 3618 	ld a,#255    
      002A8C                       3619 9$: 
      00A49B 0C               [ 4] 3620 	ret 
                                   3621 
                                   3622 ;---------------------
                                   3623 ; BASIC: GPIO(port,reg)
                                   3624 ; return gpio register address 
                                   3625 ; expr {PORTA..PORTI}
                                   3626 ; input:
                                   3627 ;   none 
                                   3628 ; output:
                                   3629 ;   A:X 	gpio register address
                                   3630 ;----------------------------
                                   3631 ;	N=PORT
                                   3632 ;	T=REG 
      002A8D                       3633 gpio:
      00A49C 27 03 CC         [ 4] 3634 	call func_args 
      00A49F 97 04            [ 1] 3635 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A4A1 27 03            [ 1] 3636 	jreq 1$
      00A4A1 84 89 88         [ 2] 3637 	jp syntax_error  
      00A4A4                       3638 1$:	_at_next 
      00A4A4 0A 01 27         [ 1]    1     ld a,(3,y)
      00A4A7 26               [ 1]    2     ldw x,y 
      00A4A8 CD 98            [ 2]    3     ldw x,(4,x)
      00A4AA 68 A1 84         [ 2] 3639 	cpw x,#PA_BASE 
      00A4AD 27 07            [ 1] 3640 	jrmi bad_port
      00A4AF A1 03 27         [ 2] 3641 	cpw x,#PI_BASE+1 
      00A4B2 0D CC            [ 1] 3642 	jrpl bad_port
      00A4B4 97               [ 2] 3643 	pushw x 
      002AA8                       3644 	_xpop
      00A4B5 04 F6            [ 1]    1     ld a,(y)
      00A4B6 93               [ 1]    2     ldw x,y 
      00A4B6 C6 00            [ 2]    3     ldw x,(1,x)
      00A4B8 02 AB 03 C7      [ 2]    4     addw y,#CELL_SIZE 
      00A4BC 00 02 20         [ 2] 3645 	addw x,(1,sp)
      002AB4                       3646 	_drop 2 
      00A4BF 03 CD            [ 2]    1     addw sp,#2 
      00A4C1 98               [ 1] 3647 	clr a 
      00A4C2 81               [ 4] 3648 	ret
      00A4C3                       3649 bad_port:
      00A4C3 CD 98            [ 1] 3650 	ld a,#ERR_BAD_VALUE
      00A4C5 68 A1 08         [ 2] 3651 	jp tb_error
                                   3652 
                                   3653 
                                   3654 ;-------------------------
                                   3655 ; BASIC: UFLASH 
                                   3656 ; return free flash address
                                   3657 ; scan all block starting at 
                                   3658 ; app_space and return 
                                   3659 ; address of first free block 
                                   3660 ; below extended memory.  
                                   3661 ; return 0 if no free block 
                                   3662 ; input:
                                   3663 ;  none 
                                   3664 ; output:
                                   3665 ;	A:X		FLASH free address
                                   3666 ;---------------------------
      002ABD                       3667 uflash:
      00A4C8 27 DA 5B 03      [ 1] 3668 	clr farptr 
      00A4CC 20 1A 80         [ 2] 3669 	ldw x,#app_space 
      00A4CE 89               [ 2] 3670 	pushw x 
      00A4CE 5B 01 CD         [ 2] 3671 1$:	ldw ptr16,x 
      00A4D1 A3 EE CF         [ 4] 3672 	call scan_block 
      00A4D4 00 1A            [ 1] 3673 	jreq 8$
      00A4D6 55 00            [ 2] 3674 	ldw x,(1,sp)
      00A4D8 04 00 02         [ 2] 3675 	addw x,#BLOCK_SIZE 
      00A4DB 85 A3            [ 1] 3676 	jreq 7$ 
      00A4DD A4 F2            [ 2] 3677 	ldw (1,sp),x 
      00A4DF 26 05            [ 2] 3678 	jra 1$ 
      002AD8                       3679 7$: ; no free block 
      00A4E1 CE 00            [ 1] 3680 	clr (1,sp) 
      00A4E3 1A 20            [ 1] 3681 	clr (2,sp)
      00A4E5 19               [ 2] 3682 8$: popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



      00A4E6 4F               [ 1] 3683 	clr a 
      00A4E6 20               [ 4] 3684 	ret 
                                   3685 
                                   3686 
                                   3687 ;---------------------
                                   3688 ; BASIC: USR(addr,arg)
                                   3689 ; execute a function written 
                                   3690 ; in binary code.
                                   3691 ; input:
                                   3692 ;   addr	routine address 
                                   3693 ;   arg 	is an argument
                                   3694 ;           it can be ignore 
                                   3695 ;           by cally. 
                                   3696 ; output:
                                   3697 ;   xstack 	value returned by cally  
                                   3698 ;---------------------
      002ADF                       3699 usr:
      00A4E7 35 19 AB         [ 4] 3700 	call func_args 
      00A4E8 A1 02            [ 1] 3701 	cp a,#2
      00A4E8 55 00            [ 1] 3702 	jreq 1$  
      00A4EA 04 00 02         [ 2] 3703 	jp syntax_error 
      002AE9                       3704 1$: 
      002AE9                       3705 	_at_next ; A:X addr 
      00A4ED 5B 02 CC         [ 1]    1     ld a,(3,y)
      00A4F0 97               [ 1]    2     ldw x,y 
      00A4F1 B7 04            [ 2]    3     ldw x,(4,x)
      00A4F2 CF 00 19         [ 2] 3706 	ldw ptr16,X 
      002AF2                       3707 	_xpop  ; arg 
      00A4F2 72 00            [ 1]    1     ld a,(y)
      00A4F4 00               [ 1]    2     ldw x,y 
      00A4F5 23 05            [ 2]    3     ldw x,(1,x)
      00A4F7 A6 06 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      002AFB                       3708 	_store_top ; overwrite addr 
      00A4FB 06 F7            [ 1]    1     ld (y),a 
      00A4FC 90 EF 01         [ 2]    2     ldw (1,y),x     
      00A4FC CD A3 EE 19      [ 6] 3709     call [ptr16]
      00A4FF 81               [ 4] 3710 	ret 
                                   3711 
                                   3712 
                                   3713 ;------------------------------
                                   3714 ; BASIC: BYE 
                                   3715 ; halt mcu in its lowest power mode 
                                   3716 ; wait for reset or external interrupt
                                   3717 ; do a cold start on wakeup.
                                   3718 ;------------------------------
      002B05                       3719 bye:
      00A4FF CF 00 05 E6 02   [ 2] 3720 	btjf UART1_SR,#UART_SR_TC,.
      00A504 C7               [10] 3721 	halt
      00A505 00 04 35         [ 2] 3722 	jp cold_start  
                                   3723 
                                   3724 ;----------------------------------
                                   3725 ; BASIC: SLEEP 
                                   3726 ; halt mcu until reset or external
                                   3727 ; interrupt.
                                   3728 ; Resume progam after SLEEP command
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



                                   3729 ;----------------------------------
      002B0E                       3730 sleep:
      00A508 03 00 02 81 FB   [ 2] 3731 	btjf UART1_SR,#UART_SR_TC,.
      00A50C 72 16 00 22      [ 1] 3732 	bset flags,#FSLEEP
      00A50C 72               [10] 3733 	halt 
      00A50D 00               [ 4] 3734 	ret 
                                   3735 
                                   3736 ;-------------------------------
                                   3737 ; BASIC: PAUSE expr 
                                   3738 ; suspend execution for n msec.
                                   3739 ; input:
                                   3740 ;	none
                                   3741 ; output:
                                   3742 ;	none 
                                   3743 ;------------------------------
      002B19                       3744 pause:
      00A50E 00 23 06         [ 4] 3745 	call expression
      00A511 A6 06            [ 1] 3746 	cp a,#TK_INTGR
      00A513 CC 97            [ 1] 3747 	jreq 1$ 
      00A515 06 81 84         [ 2] 3748 	jp syntax_error
      00A517                       3749 1$: _xpop 
      00A517 CD A3            [ 1]    1     ld a,(y)
      00A519 EE               [ 1]    2     ldw x,y 
      00A51A CF 00            [ 2]    3     ldw x,(1,x)
      00A51C 1A A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A51D                       3750 pause02:
      00A51D 85 52 04         [ 2] 3751 	ldw timer,x 
      00A520 89 CE 00         [ 2] 3752 1$: ldw x,timer 
      00A523 05               [ 2] 3753 	tnzw x 
      00A524 1F 03            [ 1] 3754 	jreq 2$
      00A526 CE               [10] 3755 	wfi 
      00A527 00 01            [ 1] 3756 	jrne 1$
      002B38                       3757 2$:	
      00A529 1F               [ 4] 3758 	ret 
                                   3759 
                                   3760 ;------------------------------
                                   3761 ; BASIC: AWU expr
                                   3762 ; halt mcu for 'expr' milliseconds
                                   3763 ; use Auto wakeup peripheral
                                   3764 ; all oscillators stopped except LSI
                                   3765 ; range: 1ms - 511ms
                                   3766 ; input:
                                   3767 ;  none
                                   3768 ; output:
                                   3769 ;  none:
                                   3770 ;------------------------------
      002B39                       3771 awu:
      00A52A 05 CE 00         [ 4] 3772   call expression
      00A52D 1A 20            [ 1] 3773   cp a,#TK_INTGR
      00A52F CF 03            [ 1] 3774   jreq 1$
      00A530 CC 16 84         [ 2] 3775   jp syntax_error
      002B43                       3776 1$: _xpop 
      00A530 72 00            [ 1]    1     ld a,(y)
      00A532 00               [ 1]    2     ldw x,y 
      00A533 23 05            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A535 A6 06 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      002B4C                       3777 awu02:
      00A539 06 14 00         [ 2] 3778   cpw x,#5120
      00A53A 2B 0C            [ 1] 3779   jrmi 1$ 
      00A53A 1E 03 CF 00      [ 1] 3780   mov AWU_TBR,#15 
      00A53E 05 E6            [ 1] 3781   ld a,#30
      00A540 02               [ 2] 3782   div x,a
      00A541 C7 00            [ 1] 3783   ld a,#16
      00A543 04               [ 2] 3784   div x,a 
      00A544 1E 05            [ 2] 3785   jra 4$
      002B5D                       3786 1$: 
      00A546 CF 00 01         [ 2] 3787   cpw x,#2048
      00A549 85 5B            [ 1] 3788   jrmi 2$ 
      00A54B 04 FC 50 F2      [ 1] 3789   mov AWU_TBR,#14
      00A54D A6 50            [ 1] 3790   ld a,#80
      00A54D 4D               [ 2] 3791   div x,a 
      00A54E 26 0D            [ 2] 3792   jra 4$   
      002B6B                       3793 2$:
      00A550 A3 B8 00 25      [ 1] 3794   mov AWU_TBR,#7
      002B6F                       3795 3$:  
                                   3796 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A554 07 89 CD         [ 2] 3797   cpw x,#64 
      00A557 A8 BC            [ 2] 3798   jrule 4$ 
      00A559 85 27 01 43      [ 1] 3799   inc AWU_TBR 
      00A55D 81               [ 2] 3800   srlw x 
      00A55E 20 F4            [ 2] 3801   jra 3$ 
      002B7B                       3802 4$:
      00A55E 72               [ 1] 3803   ld a, xl
      00A55F 01               [ 1] 3804   dec a 
      00A560 00 23            [ 1] 3805   jreq 5$
      00A562 02               [ 1] 3806   dec a 	
      002B80                       3807 5$: 
      00A563 4F 81            [ 1] 3808   and a,#0x3e 
      00A565 C7 50 F1         [ 1] 3809   ld AWU_APR,a 
      00A565 72 09 00 23      [ 1] 3810   bset AWU_CSR,#AWU_CSR_AWUEN
      00A569 12               [10] 3811   halt 
                                   3812 
      00A56A 5B               [ 4] 3813   ret 
                                   3814 
                                   3815 ;------------------------------
                                   3816 ; BASIC: TICKS
                                   3817 ; return msec ticks counter value 
                                   3818 ; input:
                                   3819 ; 	none 
                                   3820 ; output:
                                   3821 ;	X 		TK_INTGR
                                   3822 ;-------------------------------
      002B8B                       3823 get_ticks:
      00A56B 02 CD A0         [ 1] 3824 	ld a,ticks 
      00A56E D2 5B 04         [ 2] 3825 	ldw x,ticks+1 
      00A571 72               [ 4] 3826 	ret 
                                   3827 
                                   3828 ;------------------------------
                                   3829 ; BASIC: ABS(expr)
                                   3830 ; return absolute value of expr.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3831 ; input:
                                   3832 ;   none
                                   3833 ; output:
                                   3834 ;   xstack    positive int24 
                                   3835 ;-------------------------------
      002B92                       3836 abs:
      00A572 19 00 23         [ 4] 3837 	call func_args 
      00A575 72 10            [ 1] 3838 	cp a,#1 
      00A577 00 23            [ 1] 3839 	jreq 0$ 
      00A579 CC 97 AF         [ 2] 3840 	jp syntax_error
      00A57C                       3841 0$:  
      00A57C CD 98 68         [ 4] 3842 	call abs24 
      002B9F                       3843 	_xpop 
      00A57F A1 84            [ 1]    1     ld a,(y)
      00A581 26               [ 1]    2     ldw x,y 
      00A582 1D CD            [ 2]    3     ldw x,(1,x)
      00A584 98 9A CD A5      [ 2]    4     addw y,#CELL_SIZE 
      00A588 4D               [ 4] 3844 	ret 
                                   3845 
                                   3846 ;------------------------------
                                   3847 ; BASIC: LSHIFT(expr1,expr2)
                                   3848 ; logical shift left expr1 by 
                                   3849 ; expr2 bits 
                                   3850 ; output:
                                   3851 ; 	A:x 	result 
                                   3852 ;------------------------------
      002BA9                       3853 lshift:
      00A589 27 05 A6         [ 4] 3854 	call func_args
      00A58C 12 CC            [ 1] 3855 	cp a,#2 
      00A58E 97 06            [ 1] 3856 	jreq 1$
      00A590 CF 00 1C         [ 2] 3857 	jp syntax_error
      002BB3                       3858 1$: _xpop 
      00A593 1D 00            [ 1]    1     ld a,(y)
      00A595 02               [ 1]    2     ldw x,y 
      00A596 FE 72            [ 2]    3     ldw x,(1,x)
      00A598 BB 00 1C CF      [ 2]    4     addw y,#CELL_SIZE 
      00A59C 00               [ 1] 3859 	ld a,xl 
      00A59D 1E               [ 1] 3860 	push a      
      002BBE                       3861 	_xpop  ; T>A:X 
      00A59E 20 19            [ 1]    1     ld a,(y)
      00A5A0 55               [ 1]    2     ldw x,y 
      00A5A1 00 03            [ 2]    3     ldw x,(1,x)
      00A5A3 00 02 CE 00      [ 2]    4     addw y,#CELL_SIZE 
      00A5A7 1C C3            [ 1] 3862 	tnz (1,sp) 
      00A5A9 00 1E            [ 1] 3863 	jreq 4$
      00A5AB 2B               [ 1] 3864 2$:	rcf 
      00A5AC 0C               [ 2] 3865 	rlcw x 
      00A5AD AE               [ 1] 3866 	rlc a 
      00A5AE 96 5B            [ 1] 3867 	dec (1,sp) 
      00A5B0 CD 89            [ 1] 3868 	jrne 2$
      002BD2                       3869 4$: _drop 1 
      00A5B2 DC 55            [ 2]    1     addw sp,#1 
      00A5B4 00               [ 4] 3870 	ret
                                   3871 
                                   3872 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



                                   3873 ; BASIC: RSHIFT(expr1,expr2)
                                   3874 ; logical shift right expr1 by 
                                   3875 ; expr2 bits.
                                   3876 ; output:
                                   3877 ; 	A 		TK_INTGR
                                   3878 ;   X 		result 
                                   3879 ;------------------------------
      002BD5                       3880 rshift:
      00A5B5 04 00 02         [ 4] 3881 	call func_args
      00A5B8 81 02            [ 1] 3882 	cp a,#2 
      00A5B9 27 03            [ 1] 3883 	jreq 1$
      00A5B9 5B 02 84         [ 2] 3884 	jp syntax_error
      00A5BB                       3885 1$: _xpop ; T>A:X
      00A5BB CD 9D            [ 1]    1     ld a,(y)
      00A5BD 41               [ 1]    2     ldw x,y 
      00A5BE CD 94            [ 2]    3     ldw x,(1,x)
      00A5C0 76 CE 00 1E      [ 2]    4     addw y,#CELL_SIZE 
      00A5C4 CF               [ 1] 3886     ld a,xl 
      00A5C5 00               [ 1] 3887 	push a    
      002BEA                       3888 	_xpop  
      00A5C6 31 CF            [ 1]    1     ld a,(y)
      00A5C8 00               [ 1]    2     ldw x,y 
      00A5C9 33 5F            [ 2]    3     ldw x,(1,x)
      00A5CB CF 00 07 72      [ 2]    4     addw y,#CELL_SIZE 
      00A5CF 5F 00            [ 1] 3889 	tnz (1,sp)
      00A5D1 09 72            [ 1] 3890 	jreq 4$
      00A5D3 5F               [ 1] 3891 2$:	rcf 
      00A5D4 00               [ 1] 3892 	rrc a 
      00A5D5 0A               [ 2] 3893 	rrcw x 
      00A5D6 CE 00            [ 1] 3894 	dec (1,sp) 
      00A5D8 1C CF            [ 1] 3895 	jrne 2$
      002BFE                       3896 4$: _drop 1 
      00A5DA 00 05            [ 2]    1     addw sp,#1 
      00A5DC E6               [ 4] 3897 	ret
                                   3898 
                                   3899 ;--------------------------
                                   3900 ; BASIC: FCPU integer
                                   3901 ; set CPU frequency 
                                   3902 ;-------------------------- 
                                   3903 
      002C01                       3904 fcpu:
      00A5DD 02 C7            [ 1] 3905 	ld a,#TK_INTGR
      00A5DF 00 04 35         [ 4] 3906 	call expect 
      00A5E2 03 00 02         [ 4] 3907 	call get_int24 
      00A5E5 72               [ 1] 3908 	ld a,xl 
      00A5E6 10 00            [ 1] 3909 	and a,#7 
      00A5E8 23 CC 97         [ 1] 3910 	ld CLK_CKDIVR,a 
      00A5EB AF               [ 4] 3911 	ret 
                                   3912 
                                   3913 ;------------------------------
                                   3914 ; BASIC: PMODE pin#, mode 
                                   3915 ; Arduino pin. 
                                   3916 ; define pin as input or output
                                   3917 ; pin#: {0..15}
                                   3918 ; mode: INPUT|OUTPUT  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



                                   3919 ;------------------------------
                           000001  3920 	PINNO=1
                           000001  3921 	VSIZE=1
      00A5EC                       3922 pin_mode:
      002C10                       3923 	_vars VSIZE 
      00A5EC AE 17            [ 2]    1     sub sp,#VSIZE 
      00A5EE FF 94 CC         [ 4] 3924 	call arg_list 
      00A5F1 97 90            [ 1] 3925 	cp a,#2 
      00A5F3 27 03            [ 1] 3926 	jreq 1$
      00A5F3 CD 98 68         [ 2] 3927 	jp syntax_error 
      002C1C                       3928 1$: _xpop 
      00A5F6 A1 85            [ 1]    1     ld a,(y)
      00A5F8 27               [ 1]    2     ldw x,y 
      00A5F9 03 CC            [ 2]    3     ldw x,(1,x)
      00A5FB 97 04 CD 98      [ 2]    4     addw y,#CELL_SIZE 
      00A5FF 90 CF 00         [ 2] 3929 	ldw ptr16,x ; mode 
      002C28                       3930 	_xpop ; Dx pin 
      00A602 1A CD            [ 1]    1     ld a,(y)
      00A604 89               [ 1]    2     ldw x,y 
      00A605 88 27            [ 2]    3     ldw x,(1,x)
      00A607 03 CD 89 8F      [ 2]    4     addw y,#CELL_SIZE 
      00A60B 72 3F 00         [ 4] 3931 	call select_pin 
      00A60E 1A 72            [ 1] 3932 	ld (PINNO,sp),a  
      00A610 5C 00            [ 1] 3933 	ld a,#1 
      00A612 1B 72            [ 1] 3934 	tnz (PINNO,sp)
      00A614 3F 00            [ 1] 3935 	jreq 4$
      00A616 1A               [ 1] 3936 2$:	sll a 
      00A617 72 5C            [ 1] 3937 	dec (PINNO,sp)
      00A619 00 1B            [ 1] 3938 	jrne 2$ 
      00A61B 72 C7            [ 1] 3939 	ld (PINNO,sp),a
      00A61D 00 1A            [ 1] 3940 	ld a,(PINNO,sp)
      00A61F 81 03            [ 1] 3941 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A620 E7 03            [ 1] 3942 	ld (GPIO_CR1,x),a 
      00A620 90 89            [ 1] 3943 4$:	ld a,#OUTP
      00A622 AE 00 64         [ 1] 3944 	cp a,acc8 
      00A625 90 AE            [ 1] 3945 	jreq 6$
                                   3946 ; input mode
                                   3947 ; disable external interrupt 
      00A627 03 E8            [ 1] 3948 	ld a,(PINNO,sp)
      00A629 20               [ 1] 3949 	cpl a 
      00A62A 22 04            [ 1] 3950 	and a,(GPIO_CR2,x)
      00A62B E7 04            [ 1] 3951 	ld (GPIO_CR2,x),a 
                                   3952 ;clear bit in DDR for input mode 
      00A62B 90 89            [ 1] 3953 	ld a,(PINNO,sp)
      00A62D CD               [ 1] 3954 	cpl a 
      00A62E 9A 30            [ 1] 3955 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A630 A1 02            [ 1] 3956 	ld (GPIO_DDR,x),a 
      00A632 27 03            [ 2] 3957 	jra 9$
      002C60                       3958 6$: ;output mode  
      00A634 CC 97            [ 1] 3959 	ld a,(PINNO,sp)
      00A636 04 02            [ 1] 3960 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A637 E7 02            [ 1] 3961 	ld (GPIO_DDR,x),a 
      00A637 90 F6            [ 1] 3962 	ld a,(PINNO,sp)
      00A639 93 EE            [ 1] 3963 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A63B 01 72            [ 1] 3964 	ld (GPIO_CR2,x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



      002C6C                       3965 9$:	
      002C6C                       3966 	_drop VSIZE 
      00A63D A9 00            [ 2]    1     addw sp,#VSIZE 
      00A63F 03               [ 4] 3967 	ret
                                   3968 
                                   3969 ;------------------------
                                   3970 ; select Arduino pin 
                                   3971 ; input:
                                   3972 ;   X 	 {0..15} Arduino Dx 
                                   3973 ; output:
                                   3974 ;   A     stm8s208 pin 
                                   3975 ;   X     base address s208 GPIO port 
                                   3976 ;---------------------------
      002C6F                       3977 select_pin:
      00A640 89               [ 2] 3978 	sllw x 
      00A641 90 F6 93         [ 2] 3979 	addw x,#arduino_to_8s208 
      00A644 EE               [ 2] 3980 	ldw x,(x)
      00A645 01               [ 1] 3981 	ld a,xl 
      00A646 72               [ 1] 3982 	push a 
      00A647 A9               [ 1] 3983 	swapw x 
      00A648 00 03            [ 1] 3984 	ld a,#5 
      00A64A 90               [ 4] 3985 	mul x,a 
      00A64B 93 85 00         [ 2] 3986 	addw x,#GPIO_BASE 
      00A64D 84               [ 1] 3987 	pop a 
      00A64D 89               [ 4] 3988 	ret 
                                   3989 ; translation from Arduino D0..D15 to stm8s208rb 
      002C7F                       3990 arduino_to_8s208:
      00A64E AE F4                 3991 .byte 3,6 ; D0 
      00A650 24 65                 3992 .byte 3,5 ; D1 
      00A652 90 A3                 3993 .byte 4,0 ; D2 
      00A654 7A 12                 3994 .byte 2,1 ; D3
      00A656 2B 01                 3995 .byte 6,0 ; D4
      00A658 5C 02                 3996 .byte 2,2 ; D5
      00A659 02 03                 3997 .byte 2,3 ; D6
      00A659 9E C7                 3998 .byte 3,1 ; D7
      00A65B 53 0D                 3999 .byte 3,3 ; D8
      00A65D 9F C7                 4000 .byte 2,4 ; D9
      00A65F 53 0E                 4001 .byte 4,5 ; D10
      00A661 8C 56                 4002 .byte 2,6 ; D11
      00A663 9E C7                 4003 .byte 2,7 ; D12
      00A665 53 0F                 4004 .byte 2,5 ; D13
      00A667 9F C7                 4005 .byte 4,2 ; D14
      00A669 53 10                 4006 .byte 4,1 ; D15
                                   4007 
                                   4008 
                                   4009 ;------------------------------
                                   4010 ; BASIC: RND(expr)
                                   4011 ; return random number 
                                   4012 ; between 1 and expr inclusive
                                   4013 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4014 ; input:
                                   4015 ; 	none 
                                   4016 ; output:
                                   4017 ;	xstack 	random positive integer 
                                   4018 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



      002C9F                       4019 random:
      00A66B 72 10 53         [ 4] 4020 	call func_args 
      00A66E 08 72            [ 1] 4021 	cp a,#1
      00A670 10 53            [ 1] 4022 	jreq 1$
      00A672 00 72 10         [ 2] 4023 	jp syntax_error
      002CA9                       4024 1$:  
      002CA9                       4025 	_xpop   
      00A675 53 04            [ 1]    1     ld a,(y)
      00A677 85               [ 1]    2     ldw x,y 
      00A678 CD AB            [ 2]    3     ldw x,(1,x)
      00A67A AC 72 11 53      [ 2]    4     addw y,#CELL_SIZE 
      00A67E 08               [ 2] 4026 	pushw x 
      00A67F 72               [ 1] 4027 	push a  
      00A680 11 53            [ 1] 4028 	ld a,#0x80 
      00A682 00 90            [ 1] 4029 	bcp a,(1,sp)
      00A684 85 81            [ 1] 4030 	jreq 2$
      00A686 A6 0A            [ 1] 4031 	ld a,#ERR_BAD_VALUE
      00A686 CD 9A 30         [ 2] 4032 	jp tb_error
      002CBF                       4033 2$: 
                                   4034 ; acc16=(x<<5)^x 
      00A689 A1 02 27         [ 2] 4035 	ldw x,seedx 
      00A68C 12               [ 2] 4036 	sllw x 
      00A68D A1               [ 2] 4037 	sllw x 
      00A68E 01               [ 2] 4038 	sllw x 
      00A68F 27               [ 2] 4039 	sllw x 
      00A690 03               [ 2] 4040 	sllw x 
      00A691 CC               [ 1] 4041 	ld a,xh 
      00A692 97 04 4F         [ 1] 4042 	xor a,seedx 
      00A695 5F 72 A2         [ 1] 4043 	ld acc16,a 
      00A698 00               [ 1] 4044 	ld a,xl 
      00A699 03 90 F7         [ 1] 4045 	xor a,seedx+1 
      00A69C 90 EF 01         [ 1] 4046 	ld acc8,a 
                                   4047 ; seedx=seedy 
      00A69F 90 E6 03         [ 2] 4048 	ldw x,seedy 
      00A6A2 93 EE 04         [ 2] 4049 	ldw seedx,x  
                                   4050 ; seedy=seedy^(seedy>>1)
      00A6A5 5D 27 25         [ 2] 4051 	ldw x,seedy 
      00A6A8 90               [ 2] 4052 	srlw x 
      00A6A9 F6               [ 1] 4053 	ld a,xh 
      00A6AA 93 EE 01         [ 1] 4054 	xor a,seedy 
      00A6AD 72 A9 00         [ 1] 4055 	ld seedy,a  
      00A6B0 03               [ 1] 4056 	ld a,xl 
      00A6B1 72 A9 00         [ 1] 4057 	xor a,seedy+1 
      00A6B4 03 9F A4         [ 1] 4058 	ld seedy+1,a 
                                   4059 ; acc16>>3 
      00A6B7 07 4E C7         [ 2] 4060 	ldw x,acc16 
      00A6BA 54               [ 2] 4061 	srlw x 
      00A6BB 01               [ 2] 4062 	srlw x 
      00A6BC 72               [ 2] 4063 	srlw x 
                                   4064 ; x=acc16^x 
      00A6BD 16               [ 1] 4065 	ld a,xh 
      00A6BE 50 CA 72         [ 1] 4066 	xor a,acc16 
      00A6C1 10 54 01         [ 1] 4067 	ld acc16,a 
      00A6C4 AE               [ 1] 4068 	ld a,xl 
      00A6C5 00 1B 5A         [ 1] 4069 	xor a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



      00A6C8 9D 26 FA         [ 1] 4070 	ld acc8,a 
                                   4071 ; seedy=acc16^seedy 
      00A6CB 20 08 72         [ 1] 4072 	xor a,seedy+1
      00A6CE 11               [ 1] 4073 	ld xl,a 
      00A6CF 54 01 72         [ 1] 4074 	ld a,acc16 
      00A6D2 17 50 CA         [ 1] 4075 	xor a,seedy
      00A6D5 95               [ 1] 4076 	ld xh,a 
      00A6D5 81 00 16         [ 2] 4077 	ldw seedy,x 
                                   4078 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A6D6 C6 00 15         [ 1] 4079 	ld a,seedx+1
      00A6D6 CD 9A            [ 1] 4080 	and a,#127
      002D14                       4081 	_xpush 
      00A6D8 2B A1 01 27      [ 2]    1     subw y,#CELL_SIZE
      00A6DC 03 CC            [ 1]    2     ld (y),a 
      00A6DE 97 04 90         [ 2]    3     ldw (1,y),x 
      00A6E1 F6               [ 1] 4082 	pop a 
      00A6E2 93               [ 2] 4083 	popw x 
      002D1F                       4084 	_xpush 
      00A6E3 EE 01 72 A9      [ 2]    1     subw y,#CELL_SIZE
      00A6E7 00 03            [ 1]    2     ld (y),a 
      00A6E9 A3 00 05         [ 2]    3     ldw (1,y),x 
      00A6EC 23 05 A6         [ 4] 4085 	call mod24 
      002D2B                       4086 	_xpop
      00A6EF 0A CC            [ 1]    1     ld a,(y)
      00A6F1 97               [ 1]    2     ldw x,y 
      00A6F2 06 9F            [ 2]    3     ldw x,(1,x)
      00A6F4 C7 00 0F A6      [ 2]    4     addw y,#CELL_SIZE 
      00A6F8 05 C0 00         [ 2] 4087 	addw x,#1 
      00A6FB 0F C7            [ 1] 4088 	adc a,#0  
      00A6FD 54               [ 4] 4089 	ret 
                                   4090 
                                   4091 ;---------------------------------
                                   4092 ; BASIC: WORDS 
                                   4093 ; affiche la listes des mots du
                                   4094 ; dictionnaire ainsi que le nombre
                                   4095 ; de mots.
                                   4096 ;---------------------------------
                           000001  4097 	WLEN=1 ; word length
                           000002  4098 	LLEN=2 ; character sent to console
                           000003  4099 	WCNT=3 ; count words printed 
                           000003  4100 	VSIZE=3 
      002D3A                       4101 words:
      00A6FE 00 72            [ 2] 4102 	pushw y
      002D3C                       4103 	_vars VSIZE
      00A700 16 54            [ 2]    1     sub sp,#VSIZE 
      00A702 02 72            [ 1] 4104 	clr (LLEN,sp)
      00A704 10 54            [ 1] 4105 	clr (WCNT,sp)
      00A706 01 72 0F 54      [ 2] 4106 	ldw y,#kword_dict+2
      00A70A 00               [ 1] 4107 0$:	ldw x,y
      00A70B FB               [ 1] 4108 	ld a,(x)
      00A70C CE 54            [ 1] 4109 	and a,#15 
      00A70E 04 A6            [ 1] 4110 	ld (WLEN,sp),a 
      00A710 84 81            [ 1] 4111 	inc (WCNT,sp)
      00A712 5C               [ 1] 4112 1$:	incw x 
      00A712 52               [ 1] 4113 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



      00A713 01 CD 9A         [ 4] 4114 	call putc 
      00A716 2B A1            [ 1] 4115 	inc (LLEN,sp)
      00A718 01 27            [ 1] 4116 	dec (WLEN,sp)
      00A71A 03 CC            [ 1] 4117 	jrne 1$
      00A71C 97 04            [ 1] 4118 	ld a,#70
      00A71E 90 F6            [ 1] 4119 	cp a,(LLEN,sp)
      00A720 93 EE            [ 1] 4120 	jrmi 2$   
      00A722 01 72            [ 1] 4121 	ld a,#SPACE 
      00A724 A9 00 03         [ 4] 4122 	call putc 
      00A727 A3 00            [ 1] 4123 	inc (LLEN,sp) 
      00A729 0F 23            [ 2] 4124 	jra 3$
      00A72B 05 A6            [ 1] 4125 2$: ld a,#CR 
      00A72D 0A CC 97         [ 4] 4126 	call putc 
      00A730 06 CD            [ 1] 4127 	clr (LLEN,sp)
      00A732 AC EF 6B 01      [ 2] 4128 3$:	subw y,#2 
      00A736 E6 01            [ 2] 4129 	ldw y,(y)
      00A738 0D 01            [ 1] 4130 	jrne 0$ 
      00A73A 27 05            [ 1] 4131 	ld a,#CR 
      00A73C 44 0A 01         [ 4] 4132 	call putc  
      00A73F 26               [ 1] 4133 	clrw x 
      00A740 FB A4            [ 1] 4134 	ld a,(WCNT,sp)
      00A742 01               [ 1] 4135 	ld xl,a 
      00A743 5F 97 4F         [ 4] 4136 	call prt_i16 
      00A746 5B 01 81         [ 2] 4137 	ldw x,#words_count_msg
      00A749 CD 09 5C         [ 4] 4138 	call puts 
      002D89                       4139 	_drop VSIZE 
      00A749 52 02            [ 2]    1     addw sp,#VSIZE 
      00A74B CD 9A            [ 2] 4140 	popw y 
      00A74D 30               [ 4] 4141 	ret 
      00A74E A1 02 27 03 CC 97 04  4142 words_count_msg: .asciz " words in dictionary\n"
             90 F6 93 EE 01 72 A9
             00 03 9F 6B 02 90 F6
             93
                                   4143 
                                   4144 
                                   4145 ;-----------------------------
                                   4146 ; BASIC: TIMER expr 
                                   4147 ; initialize count down timer 
                                   4148 ;-----------------------------
      002DA4                       4149 set_timer:
      00A764 EE 01 72         [ 4] 4150 	call arg_list
      00A767 A9 00            [ 1] 4151 	cp a,#1 
      00A769 03 A3            [ 1] 4152 	jreq 1$
      00A76B 00 0F 23         [ 2] 4153 	jp syntax_error
      002DAE                       4154 1$: 
      002DAE                       4155 	_xpop  
      00A76E 05 A6            [ 1]    1     ld a,(y)
      00A770 0A               [ 1]    2     ldw x,y 
      00A771 CC 97            [ 2]    3     ldw x,(1,x)
      00A773 06 CD AC EF      [ 2]    4     addw y,#CELL_SIZE 
      00A777 6B 01 A6         [ 2] 4156 	ldw timer,x 
      00A77A 01               [ 4] 4157 	ret 
                                   4158 
                                   4159 ;------------------------------
                                   4160 ; BASIC: TIMEOUT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   4161 ; return state of timer 
                                   4162 ; output:
                                   4163 ;   A:X     0 not timeout 
                                   4164 ;   A:X     -1 timeout 
                                   4165 ;------------------------------
      002DBB                       4166 timeout:
      00A77B 0D               [ 1] 4167 	clr a 
      00A77C 01 27 05         [ 2] 4168 	ldw x,timer 
      00A77F 48 0A            [ 1] 4169 	jreq 1$
      00A781 01               [ 1] 4170 	clrw x
      00A782 26               [ 4] 4171 	ret  
      00A783 FB               [ 1] 4172 1$:	cpl a
      00A784 0D               [ 2] 4173 	cplw x 
      00A785 02               [ 4] 4174 	ret 
                                   4175  	
                                   4176 
                                   4177 
                                   4178 
                                   4179 ;-----------------------------------
                                   4180 ; BASIC: IWDGEN expr1 
                                   4181 ; enable independant watchdog timer
                                   4182 ; expr1 is delay in multiple of 62.5µsec
                                   4183 ; expr1 -> {1..16383}
                                   4184 ;-----------------------------------
      002DC6                       4185 enable_iwdg:
      00A786 26 05 43         [ 4] 4186 	call arg_list
      00A789 E4 00            [ 1] 4187 	cp a,#1 
      00A78B 20 02            [ 1] 4188 	jreq 1$
      00A78D EA 00 E7         [ 2] 4189 	jp syntax_error 
      002DD0                       4190 1$: _xpop  
      00A790 00 5B            [ 1]    1     ld a,(y)
      00A792 02               [ 1]    2     ldw x,y 
      00A793 81 01            [ 2]    3     ldw x,(1,x)
      00A794 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A794 72 00            [ 1] 4191 	push #0
      00A796 00 23 02 4F      [ 1] 4192 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A79A 81               [ 1] 4193 	ld a,xh 
      00A79B A4 3F            [ 1] 4194 	and a,#0x3f
      00A79B AE               [ 1] 4195 	ld xh,a  
      00A79C A7 C2 CD         [ 2] 4196 2$:	cpw x,#255
      00A79F 89 DC            [ 2] 4197 	jrule 3$
      00A7A1 5B 02            [ 1] 4198 	inc (1,sp)
      00A7A3 52               [ 1] 4199 	rcf 
      00A7A4 04               [ 2] 4200 	rrcw x 
      00A7A5 CD A0            [ 2] 4201 	jra 2$
      00A7A7 C2 AE 16 90      [ 1] 4202 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7AB CF               [ 1] 4203 	pop a  
      00A7AC 00 05 7F         [ 1] 4204 	ld IWDG_PR,a 
      00A7AF 72               [ 1] 4205 	ld a,xl
      00A7B0 5F               [ 1] 4206 	dec a 
      00A7B1 00 04 5F CF      [ 1] 4207 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A7B5 00 01 72         [ 1] 4208 	ld IWDG_RLR,a 
      00A7B8 11 00 23 72      [ 1] 4209 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A7BC 18               [ 4] 4210 	ret 
                                   4211 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



                                   4212 
                                   4213 ;-----------------------------------
                                   4214 ; BASIC: IWDGREF  
                                   4215 ; refresh independant watchdog count down 
                                   4216 ; timer before it reset MCU. 
                                   4217 ;-----------------------------------
      002E04                       4218 refresh_iwdg:
      00A7BD 00 23 CC 97      [ 1] 4219 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A7C1 AF               [ 4] 4220 	ret 
                                   4221 
                                   4222 
                                   4223 ;-------------------------------------
                                   4224 ; BASIC: LOG2(expr)
                                   4225 ; return logarithm base 2 of expr 
                                   4226 ; this is the position of most significant
                                   4227 ; bit set. 
                                   4228 ; input: 
                                   4229 ; output:
                                   4230 ;   A     TK_INTGR 
                                   4231 ;   xstack log2 
                                   4232 ;*********************************
      002E09                       4233 log2:
      00A7C2 0A 62 72         [ 4] 4234 	call func_args 
      00A7C5 65 61            [ 1] 4235 	cp a,#1 
      00A7C7 6B 20            [ 1] 4236 	jreq 1$
      00A7C9 70 6F 69         [ 2] 4237 	jp syntax_error 
      002E13                       4238 1$: 
      002E13                       4239 	_xpop    
      00A7CC 6E 74            [ 1]    1     ld a,(y)
      00A7CE 2C               [ 1]    2     ldw x,y 
      00A7CF 20 52            [ 2]    3     ldw x,(1,x)
      00A7D1 55 4E 20 74      [ 2]    4     addw y,#CELL_SIZE 
      00A7D5 6F               [ 1] 4240 	tnz a
      00A7D6 20 72            [ 1] 4241 	jrne 2$ 
      00A7D8 65               [ 2] 4242 	tnzw x 
      00A7D9 73 75            [ 1] 4243 	jrne 2$
      00A7DB 6D 65            [ 1] 4244 	ld a,#ERR_BAD_VALUE
      00A7DD 2E 0A 00         [ 2] 4245 	jp tb_error 
      00A7E0 4B 18            [ 1] 4246 2$: push #24 
      00A7E0 72               [ 2] 4247 3$: rlcw x 
      00A7E1 01               [ 1] 4248     rlc a 
      00A7E2 00 23            [ 1] 4249 	jrc 4$
      00A7E4 01 81            [ 1] 4250 	dec (1,sp) 
      00A7E6 26 F8            [ 1] 4251 	jrne 3$
      00A7E6 CD               [ 1] 4252 4$: clrw x 
      00A7E7 95               [ 1] 4253     pop a 
      00A7E8 1E               [ 1] 4254 	dec a
      00A7E9 81               [ 1] 4255 	rlwa x  
      00A7EA                       4256 9$:	
      00A7EA CD               [ 4] 4257 	ret 
                                   4258 
                                   4259 ;-----------------------------------
                                   4260 ; BASIC: BIT(expr) 
                                   4261 ; expr ->{0..23}
                                   4262 ; return 2^expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



                                   4263 ; output:
                                   4264 ;    A:X    2^expr 
                                   4265 ;-----------------------------------
      002E36                       4266 bitmask:
      00A7EB 98 9A CD         [ 4] 4267     call func_args 
      00A7EE A5 4D            [ 1] 4268 	cp a,#1
      00A7F0 26 4A            [ 1] 4269 	jreq 1$
      00A7F2 CD 87 67         [ 2] 4270 	jp syntax_error 
      002E40                       4271 1$: _xpop 
      00A7F5 72 5F            [ 1]    1     ld a,(y)
      00A7F7 00               [ 1]    2     ldw x,y 
      00A7F8 19 52            [ 2]    3     ldw x,(1,x)
      00A7FA 06 1D 00 04      [ 2]    4     addw y,#CELL_SIZE 
      00A7FE 1F               [ 1] 4272 	ld a,xl 
      00A7FF 01 EE 02         [ 2] 4273 	ldw x,#1 
      00A802 1F 03            [ 1] 4274 	and a,#23
      00A804 A6 80            [ 1] 4275 	jreq 9$
      00A806 62               [ 1] 4276 	push a 
      00A807 4D               [ 1] 4277 	clr a 
      002E53                       4278 2$: 
      00A808 27               [ 2] 4279 	slaw x 
      00A809 01               [ 1] 4280 	rlc a 	
      00A80A 5C 1F            [ 1] 4281 	dec (1,sp)
      00A80C 05 1E            [ 1] 4282 	jrne 2$ 
      002E59                       4283 4$:
      002E59                       4284     _drop 1 
      00A80E 01 CF            [ 2]    1     addw sp,#1 
      00A810 00               [ 4] 4285 9$:	ret 
                                   4286 
                                   4287 ;------------------------------
                                   4288 ; BASIC: DO 
                                   4289 ; initiate a DO ... UNTIL loop 
                                   4290 ;------------------------------
                           000003  4291 	DOLP_ADR=3 
                           000005  4292 	DOLP_INW=5
                           000004  4293 	VSIZE=4 
      002E5C                       4294 do_loop:
      00A811 1A               [ 2] 4295 	popw x 
      002E5D                       4296 	_vars VSIZE 
      00A812 CD 87            [ 2]    1     sub sp,#VSIZE 
      00A814 E5               [ 2] 4297 	pushw x 
      00A815 AE 00 80         [ 2] 4298 	ldw x,basicptr 
      00A818 CD 88            [ 2] 4299 	ldw (DOLP_ADR,sp),x
      00A81A E0 1E 05         [ 2] 4300 	ldw x,in.w 
      00A81D 5A 1F            [ 2] 4301 	ldw (DOLP_INW,sp),x
      00A81F 05 26 F0 1E      [ 1] 4302 	inc loop_depth 
      00A823 01               [ 4] 4303 	ret 
                                   4304 
                                   4305 ;--------------------------------
                                   4306 ; BASIC: UNTIL expr 
                                   4307 ; loop if exprssion is false 
                                   4308 ; else terminate loop
                                   4309 ;--------------------------------
      002E6F                       4310 until: 
      00A824 CF 00 1A A6      [ 1] 4311 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A828 58 5F            [ 1] 4312 	jrne 1$ 
      00A82A CD 88 0B         [ 2] 4313 	jp syntax_error 
      002E78                       4314 1$: 
      00A82D CD 88 0B         [ 4] 4315 	call condition  
      002E7B                       4316 	_xpop 
      00A830 7B 03            [ 1]    1     ld a,(y)
      00A832 CD               [ 1]    2     ldw x,y 
      00A833 88 0B            [ 2]    3     ldw x,(1,x)
      00A835 7B 04 CD 88      [ 2]    4     addw y,#CELL_SIZE 
      00A839 0B               [ 1] 4317 	tnz a 
      00A83A 5B 06            [ 1] 4318 	jrne 9$ 
      00A83C 5D               [ 2] 4319 	tnzw x 
      00A83C 81 10            [ 1] 4320 	jrne 9$ 
      00A83D 1E 03            [ 2] 4321 	ldw x,(DOLP_ADR,sp)
      00A83D 72 01 00         [ 2] 4322 	ldw basicptr,x 
      00A840 23 05            [ 1] 4323 	ld a,(2,x)
      00A842 A6 07 CC         [ 1] 4324 	ld count,a 
      00A845 97 06            [ 2] 4325 	ldw x,(DOLP_INW,sp)
      00A847 CF 00 00         [ 2] 4326 	ldw in.w,x 
      00A847 72               [ 4] 4327 	ret 
      002E9A                       4328 9$:	; remove loop data from stack  
      00A848 5F               [ 2] 4329 	popw x
      002E9B                       4330 	_drop VSIZE
      00A849 00 19            [ 2]    1     addw sp,#VSIZE 
      00A84B CD 98 68 A1      [ 1] 4331 	dec loop_depth 
      00A84F 84               [ 2] 4332 	jp (x)
                                   4333 
                                   4334 ;--------------------------
                                   4335 ; BASIC: PORTA...PORTI  
                                   4336 ;  return constant value 
                                   4337 ;  PORT  base address 
                                   4338 ;---------------------------
      002EA2                       4339 const_porta:
      00A850 27 98 52         [ 2] 4340 	ldw x,#PA_BASE 
      00A853 03               [ 1] 4341 	clr a 
      00A854 A1               [ 4] 4342 	ret 
      002EA7                       4343 const_portb:
      00A855 04 27 03         [ 2] 4344 	ldw x,#PB_BASE 
      00A858 CC               [ 1] 4345 	clr a 
      00A859 97               [ 4] 4346 	ret 
      002EAC                       4347 const_portc:
      00A85A 04 CD 98         [ 2] 4348 	ldw x,#PC_BASE 
      00A85D AA               [ 1] 4349 	clr a 
      00A85E A4               [ 4] 4350 	ret 
      002EB1                       4351 const_portd:
      00A85F DF A1 45         [ 2] 4352 	ldw x,#PD_BASE 
      00A862 26               [ 1] 4353 	clr a 
      00A863 0C               [ 4] 4354 	ret 
      002EB6                       4355 const_porte:
      00A864 AE 40 00         [ 2] 4356 	ldw x,#PE_BASE 
      00A867 CF               [ 1] 4357 	clr a 
      00A868 00               [ 4] 4358 	ret 
      002EBB                       4359 const_portf:
      00A869 1A AE 47         [ 2] 4360 	ldw x,#PF_BASE 
      00A86C FF               [ 1] 4361 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A86D 4F               [ 4] 4362 	ret 
      002EC0                       4363 const_portg:
      00A86E 20 15 A1         [ 2] 4364 	ldw x,#PG_BASE 
      00A871 46               [ 1] 4365 	clr a 
      00A872 27               [ 4] 4366 	ret 
      002EC5                       4367 const_porti:
      00A873 06 AE 96         [ 2] 4368 	ldw x,#PI_BASE 
      00A876 0C               [ 1] 4369 	clr a 
      00A877 CC               [ 4] 4370 	ret 
                                   4371 
                                   4372 ;-------------------------------
                                   4373 ; following return constant 
                                   4374 ; related to GPIO register offset 
                                   4375 ;---------------------------------
      002ECA                       4376 const_odr:
      00A878 97               [ 1] 4377 	clr a 
      00A879 06 00 00         [ 2] 4378 	ldw x,#GPIO_ODR
      00A87A 81               [ 4] 4379 	ret 
      002ECF                       4380 const_idr:
      00A87A AE               [ 1] 4381 	clr a 
      00A87B B8 00 CF         [ 2] 4382 	ldw x,#GPIO_IDR
      00A87E 00               [ 4] 4383 	ret 
      002ED4                       4384 const_ddr:
      00A87F 1A               [ 1] 4385 	clr a
      00A880 A6 02 AE         [ 2] 4386 	ldw x,#GPIO_DDR
      00A883 7F               [ 4] 4387 	ret 
      002ED9                       4388 const_cr1:
      00A884 FF               [ 1] 4389 	clr a 
      00A885 AE 00 03         [ 2] 4390 	ldw x,#GPIO_CR1
      00A885 6B               [ 4] 4391 	ret 
      002EDE                       4392 const_cr2:
      00A886 01               [ 1] 4393 	clr a
      00A887 1F 02 CD         [ 2] 4394 	ldw x,#GPIO_CR2
      00A88A 87               [ 4] 4395 	ret 
                                   4396 ;-------------------------
                                   4397 ; BASIC: POUT 
                                   4398 ;  constant for port mode
                                   4399 ;  used by PMODE 
                                   4400 ;  to set pin as output
                                   4401 ;------------------------
      002EE3                       4402 const_output:
      00A88B 67               [ 1] 4403 	clr a 
      00A88C AE 00 01         [ 2] 4404 	ldw x,#OUTP
      00A88C CD               [ 4] 4405 	ret 
                                   4406 
                                   4407 ;-------------------------
                                   4408 ; BASIC: PINP 
                                   4409 ;  constant for port mode
                                   4410 ;  used by PMODE 
                                   4411 ;  to set pin as input
                                   4412 ;------------------------
      002EE8                       4413 const_input:
      00A88D 88               [ 1] 4414 	clr a  
      00A88E EE 27 08         [ 2] 4415 	ldw x,#INP 
      00A891 A6               [ 4] 4416 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



                                   4417 	
                                   4418 ;-----------------------
                                   4419 ; memory area constants
                                   4420 ;-----------------------
      002EED                       4421 const_eeprom_base:
      00A892 45               [ 1] 4422 	clr a  
      00A893 CD 89 7F         [ 2] 4423 	ldw x,#EEPROM_BASE 
      00A896 CD               [ 4] 4424 	ret 
                                   4425 
                                   4426 ;---------------------------
                                   4427 ; BASIC: DATA 
                                   4428 ; when the interpreter find 
                                   4429 ; a DATA line it skip it.
                                   4430 ;---------------------------
      002EF2                       4431 data:
      00A897 87 E5 AE 00 80   [ 1] 4432 	mov in,count 
      00A89C CD               [ 4] 4433 	ret 
                                   4434 
                                   4435 ;------------------------------
                                   4436 ; check if it is a DATA line 
                                   4437 ; input: 
                                   4438 ;    X    line address 
                                   4439 ; output:
                                   4440 ;    Z    set if DATA line 
                                   4441 ;----------------------------
      002EF8                       4442 is_data_line:
      00A89D 88               [ 2] 4443 	pushw x 
      00A89E E0 7B            [ 1] 4444 	ld a,(3,x)
      00A8A0 01 1E            [ 1] 4445 	cp a,#TK_CMD 
      00A8A2 02 72            [ 1] 4446 	jrne 9$
      00A8A4 B0 00            [ 2] 4447 	ldw x,(4,x)
      00A8A6 1A C2 00         [ 2] 4448 	cpw x,#data  
      00A8A9 19               [ 2] 4449 9$: popw x 
      00A8AA 22               [ 4] 4450 	ret 
                                   4451 
                                   4452 ;---------------------------------
                                   4453 ; BASIC: RESTORE [line#]
                                   4454 ; set data_ptr to first data line
                                   4455 ; if no DATA found pointer set to
                                   4456 ; zero.
                                   4457 ; if a line# is given as argument 
                                   4458 ; a data line with that number 
                                   4459 ; is searched and the data pointer 
                                   4460 ; is set to it. If there is no 
                                   4461 ; data line with that number 
                                   4462 ; the program is interrupted. 
                                   4463 ;---------------------------------
      002F06                       4464 restore:
      00A8AB E0               [ 1] 4465 	clrw x 
      00A8AC CD 95 1E         [ 2] 4466 	ldw data_ptr,x 
      00A8AF 1E 02 A3         [ 2] 4467 	ldw data_ofs,x 
      00A8B2 47 FF 26         [ 2] 4468 	ldw x,txtbgn 
      00A8B5 03 CD 9D         [ 4] 4469 	call next_token 
      00A8B8 A0 84            [ 1] 4470 	cp a,#TK_INTGR
      00A8B9 26 10            [ 1] 4471 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



      00A8B9 5B 03 81         [ 4] 4472 	call get_int24
      00A8BC 90 89            [ 2] 4473 	pushw y 
      00A8BC 89               [ 1] 4474 	clr a 
      00A8BD 9F A4 80         [ 4] 4475 	call search_lineno  
      00A8C0 97 FE            [ 2] 4476 	popw y 
      00A8C2 C3               [ 2] 4477 	tnzw x 
      00A8C3 A9 CA            [ 1] 4478 	jrne set_data_pointer 
      00A8C5 85 81            [ 2] 4479 	jra data_error 
      00A8C7                       4480 0$:
      002F27                       4481 	_unget_token  
      00A8C7 88 4D 27 0A F6   [ 1]    1      mov in,in.saved  
                                   4482 ; search first DATA line 	
      00A8CC 5C 90 F7         [ 2] 4483 1$:	cpw x,txtend
      00A8CF 90 5C            [ 1] 4484 	jruge data_error 
      002F31                       4485 2$:	
      00A8D1 0A 01 26         [ 4] 4486 	call is_data_line 
      00A8D4 F6 84            [ 1] 4487 	jrne 4$
      00A8D6 81 2F 49         [ 4] 4488 4$:	call try_next_line 
      00A8D7 26 FB            [ 1] 4489 	jrne 4$ 
      00A8D7 88               [ 4] 4490 	ret 
                                   4491 
                                   4492 ;---------------------
                                   4493 ; set data pointer 
                                   4494 ; variables at new line 
                                   4495 ; input:
                                   4496 ;    X    line address 
                                   4497 ;----------------------
      002F3C                       4498 set_data_pointer:
      00A8D8 90 AE 16         [ 2] 4499 	ldw data_ptr,x
      00A8DB E0 90            [ 1] 4500 	ld a,(2,x)
      00A8DD 89 A6 80         [ 1] 4501 	ld data_len,a 
      00A8E0 90 7F 90 5C      [ 1] 4502 	mov data_ofs,#FIRST_DATA_ITEM
      00A8E4 4A               [ 4] 4503 	ret 
                                   4504 
                                   4505 
                                   4506 ;--------------------
                                   4507 ; at end of data line 
                                   4508 ; check if next line 
                                   4509 ; is a data line 
                                   4510 ; input:
                                   4511 ;    X   actual line address 
                                   4512 ;  
                                   4513 ;-------------------
      002F49                       4514 try_next_line: 
      00A8E5 26 F9            [ 1] 4515 	ld a,(2,x)
      00A8E7 90 85 84         [ 1] 4516 	ld acc8,a 
      00A8EA 81 5F 00 0D      [ 1] 4517 	clr acc16 
      00A8EB 72 BB 00 0D      [ 2] 4518 	addw x,acc16 
      00A8EB 89 AE B8         [ 2] 4519 	cpw x,txtend 
      00A8EE 00 CD            [ 1] 4520 	jrult 1$
      00A8F0 A9 CE            [ 2] 4521 	jra data_error 
      002F5D                       4522 1$:	
      00A8F2 27 0D F6         [ 4] 4523 	call is_data_line 
      00A8F5 EA 01            [ 1] 4524 	jreq 2$
      00A8F7 27 19            [ 1] 4525 	ld a,#1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A8F9 CD A9            [ 2] 4526 	jra 9$
      00A8FB D9 5D 26         [ 4] 4527 2$:	call set_data_pointer
      00A8FE F0               [ 1] 4528 	clr a  
      00A8FF 20               [ 4] 4529 9$:	ret 
      002F6B                       4530 data_error:	
      00A900 11 0C            [ 1] 4531     ld a,#ERR_NO_DATA 
      00A901 CC 16 86         [ 2] 4532 	jp tb_error 
                                   4533 
                                   4534 
                                   4535 ;---------------------------------
                                   4536 ; BASIC: READ 
                                   4537 ; return next data item | 0 
                                   4538 ;---------------------------------
                           000001  4539 	CTX_BPTR=1 
                           000003  4540 	CTX_IN=3 
                           000004  4541 	CTX_COUNT=4 
                           000005  4542 	INT24=5
                           000007  4543 	VSIZE=7 
      002F70                       4544 read:
      002F70                       4545 	_vars  VSIZE 
      00A901 CF 00            [ 2]    1     sub sp,#VSIZE 
      00A903 0E EE 02         [ 4] 4546 	call save_context
      002F75                       4547 read01:	
      00A906 13 01 24         [ 1] 4548 	ld a,data_ofs
      00A909 05 CE 00         [ 1] 4549 	cp a,data_len 
      00A90C 0E 20            [ 1] 4550 	jreq 2$ ; end of line  
      002F7D                       4551 0$:
      00A90E EA CE 00         [ 2] 4552 	ldw x,data_ptr 
      00A911 0E 5B 02         [ 2] 4553 	ldw basicptr,x 
      00A914 81 00 08 00 01   [ 1] 4554 	mov in,data_ofs 
      00A915 55 00 09 00 03   [ 1] 4555 	mov count,data_len  
      00A915 89 4B 04         [ 4] 4556 	call expression 
      00A918 72 5F            [ 1] 4557 	cp a,#TK_INTGR 
      00A91A 00 19            [ 1] 4558 	jreq 1$ 
      00A91C CF 00 1A         [ 2] 4559 	jp syntax_error 
      002F97                       4560 1$:
      00A91F 4F 5F CD         [ 4] 4561 	call next_token ; skip comma
      00A922 88 0B 0A         [ 2] 4562 	ldw x,basicptr 
      00A925 01 26 F9         [ 2] 4563 	ldw data_ptr,x 
      00A928 5B 01 85 CF 00   [ 1] 4564 	mov data_ofs,in 
      00A92D 1A 81 52         [ 4] 4565 	call rest_context
      00A92F                       4566 	_xpop 
      00A92F 89 90            [ 1]    1     ld a,(y)
      00A931 89               [ 1]    2     ldw x,y 
      00A932 52 06            [ 2]    3     ldw x,(1,x)
      00A934 CD 9E BA 26      [ 2]    4     addw y,#CELL_SIZE 
      002FB1                       4567 	_drop VSIZE 
      00A938 03 CC            [ 2]    1     addw sp,#VSIZE 
      00A93A A9               [ 4] 4568 	ret 
      002FB4                       4569 2$: ; end of line reached 
                                   4570 	; try next line 
      00A93B C4 1F 05         [ 2] 4571 	ldw x,data_ptr  
      00A93E 72 5F 00         [ 4] 4572 	call try_next_line
      00A941 19 CD            [ 1] 4573 	jreq 0$ 
      00A943 A8 EB            [ 2] 4574 	jra data_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4575 
                                   4576 ;---------------------------------
                                   4577 ; BASIC: SPIEN clkdiv, 0|1  
                                   4578 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4579 ; if clkdiv==-1 disable SPI
                                   4580 ; 0|1 -> disable|enable  
                                   4581 ;--------------------------------- 
                           000005  4582 SPI_CS_BIT=5
      002FBE                       4583 spi_enable:
      00A945 CF 00 1A         [ 4] 4584 	call arg_list 
      00A948 AE FF            [ 1] 4585 	cp a,#2
      00A94A FF 72            [ 1] 4586 	jreq 1$
      00A94C B0 00 1A         [ 2] 4587 	jp syntax_error 
      002FC8                       4588 1$: 
      00A94F 1D 00 04 13      [ 1] 4589 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A953 05               [ 2] 4590 	popw x  
      00A954 24               [ 2] 4591 	tnzw x 
      00A955 05 A6            [ 1] 4592 	jreq spi_disable 
      00A957 01               [ 2] 4593 	popw x 
      00A958 CC 97            [ 1] 4594 	ld a,#(1<<SPI_CR1_BR)
      00A95A 06               [ 4] 4595 	mul x,a 
      00A95B 9F               [ 1] 4596 	ld a,xl 
      00A95B CE 00 1A         [ 1] 4597 	ld SPI_CR1,a 
                                   4598 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A95E F6 EA 01 EA      [ 1] 4599 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A962 02 EA 03 27      [ 1] 4600 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4601 ; configure SPI as master mode 0.	
      00A966 03 CD A9 15      [ 1] 4602 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4603 ; ~CS line controlled by sofware 	
      00A96A 72 12 52 01      [ 1] 4604 	bset SPI_CR2,#SPI_CR2_SSM 
      00A96A CD 87 A7 0F      [ 1] 4605     bset SPI_CR2,#SPI_CR2_SSI 
                                   4606 ; enable SPI
      00A96E 03 CD A8 D7      [ 1] 4607 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A972 CE               [ 4] 4608 	ret 
      002FF1                       4609 spi_disable:
      002FF1                       4610 	_drop #2; throw first argument.
      00A973 A9 CA            [ 2]    1     addw sp,##2 
                                   4611 ; wait spi idle 
      00A975 90 FF            [ 1] 4612 1$:	ld a,#0x82 
      00A977 72 A9 00         [ 1] 4613 	and a,SPI_SR
      00A97A 02 1E            [ 1] 4614 	cp a,#2 
      00A97C 05 90            [ 1] 4615 	jrne 1$
      00A97E FF 72 A9 00      [ 1] 4616 	bres SPI_CR1,#SPI_CR1_SPE
      00A982 02 A6 7C A3      [ 1] 4617 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A986 00 7C 22 01      [ 1] 4618 	bres PE_DDR,#SPI_CS_BIT 
      00A98A 9F               [ 4] 4619 	ret 
                                   4620 
      003009                       4621 spi_clear_error:
      00A98B 6B 04            [ 1] 4622 	ld a,#0x78 
      00A98D CE 00 1C         [ 1] 4623 	bcp a,SPI_SR 
      00A990 1F 01            [ 1] 4624 	jreq 1$
      00A992 72 5F 52 03      [ 1] 4625 	clr SPI_SR 
      00A992 1E               [ 4] 4626 1$: ret 
                                   4627 
      003015                       4628 spi_send_byte:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



      00A993 01               [ 1] 4629 	push a 
      00A994 7B 04 CD         [ 4] 4630 	call spi_clear_error
      00A997 A8               [ 1] 4631 	pop a 
      00A998 C7 1F 01 AE 16   [ 2] 4632 	btjf SPI_SR,#SPI_SR_TXE,.
      00A99D E0 CD 87         [ 1] 4633 	ld SPI_DR,a
      00A9A0 C1 AE 00 80 CD   [ 2] 4634 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A9A5 88 E0 1E         [ 1] 4635 	ld a,SPI_DR 
      00A9A8 01               [ 4] 4636 	ret 
                                   4637 
      00302B                       4638 spi_rcv_byte:
      00A9A9 C3 00            [ 1] 4639 	ld a,#255
      00A9AB 1E 24 16 1E 05   [ 2] 4640 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A9B0 72 F0 03         [ 1] 4641 	ld a,SPI_DR 
      00A9B3 1F               [ 4] 4642 	ret
                                   4643 
                                   4644 ;------------------------------
                                   4645 ; BASIC: SPIWR byte [,byte]
                                   4646 ; write 1 or more byte
                                   4647 ;------------------------------
      003036                       4648 spi_write:
      00A9B4 05 A6 80         [ 4] 4649 	call expression
      00A9B7 A3 00            [ 1] 4650 	cp a,#TK_INTGR 
      00A9B9 80 24            [ 1] 4651 	jreq 1$
      00A9BB 01 9F 6B         [ 2] 4652 	jp syntax_error 
      003040                       4653 1$:	
      00A9BE 04               [ 1] 4654 	ld a,xl 
      00A9BF CD A8 D7         [ 4] 4655 	call spi_send_byte 
      00A9C2 20 CE 5B         [ 4] 4656 	call next_token 
      00A9C5 06 90            [ 1] 4657 	cp a,#TK_COMMA 
      00A9C7 85 85            [ 1] 4658 	jrne 2$ 
      00A9C9 81 54            [ 2] 4659 	jra spi_write 
      00A9CB 42               [ 1] 4660 2$:	tnz a 
      00A9CC 58 58            [ 1] 4661 	jreq 3$
      00A9CE                       4662 	_unget_token  
      00A9CE 89 9F A4 80 97   [ 1]    1      mov in,in.saved  
      00A9D3 FE               [ 4] 4663 3$:	ret 
                                   4664 
                                   4665 
                                   4666 ;-------------------------------
                                   4667 ; BASIC: SPIRD 	
                                   4668 ; read one byte from SPI 
                                   4669 ;-------------------------------
      003056                       4670 spi_read:
      00A9D4 C3 A9 CC         [ 4] 4671 	call spi_rcv_byte 
      00A9D7 85               [ 1] 4672 	clrw x 
      00A9D8 81               [ 1] 4673 	ld xl,a 
      00A9D9 4F               [ 1] 4674 	clr a  
      00A9D9 9F               [ 4] 4675 	ret 
                                   4676 
                                   4677 ;------------------------------
                                   4678 ; BASIC: SPISEL 0|1 
                                   4679 ; set state of ~CS line
                                   4680 ; 0|1 deselect|select  
                                   4681 ;------------------------------
      00305D                       4682 spi_select:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A9DA A4 80 97         [ 4] 4683 	call next_token 
      00A9DD CF 00            [ 1] 4684 	cp a,#TK_INTGR 
      00A9DF 0E EE            [ 1] 4685 	jreq 1$
      00A9E1 02 72 BB         [ 2] 4686 	jp syntax_error 
      00A9E4 00               [ 2] 4687 1$: tnzw x  
      00A9E5 0E 1C            [ 1] 4688 	jreq cs_high 
      00A9E7 00 04 1C 00      [ 1] 4689 	bres PE_ODR,#SPI_CS_BIT
      00A9EB 7F               [ 4] 4690 	ret 
      00306F                       4691 cs_high: 
      00A9EC 9F A4 80 97      [ 1] 4692 	bset PE_ODR,#SPI_CS_BIT
      00A9F0 81               [ 4] 4693 	ret 
                                   4694 
                                   4695 ;-------------------------------
                                   4696 ; BASIC: PAD 
                                   4697 ; Return pad buffer address.
                                   4698 ;------------------------------
      00A9F1                       4699 pad_ref:
      00A9F1 AE B8 00         [ 2] 4700 	ldw x,#pad 
      00A9F4 89               [ 1] 4701 	clr a
      00A9F5 81               [ 4] 4702 	ret 
                                   4703 
                                   4704 ;****************************
                                   4705 ; expression stack 
                                   4706 ; manipulation routines
                                   4707 ;****************************
                                   4708 
                                   4709 ;-----------------------------
                                   4710 ; BASIC: PUSH expr|rel|cond 
                                   4711 ; push the result on xtack
                                   4712 ;-----------------------------
      003079                       4713 xpush:
      00A9F5 CD A8 BC         [ 4] 4714 	call condition 
      00A9F8 26               [ 4] 4715 	ret 
                                   4716 
                                   4717 ;------------------------------
                                   4718 ; BASIC: POP 
                                   4719 ; pop top of xstack 
                                   4720 ;------------------------------
      00307D                       4721 xpop:
      00307D                       4722 	_xpop 
      00A9F9 3B 1C            [ 1]    1     ld a,(y)
      00A9FB 00               [ 1]    2     ldw x,y 
      00A9FC 04 35            [ 2]    3     ldw x,(1,x)
      00A9FE 10 00 0B CD      [ 2]    4     addw y,#CELL_SIZE 
      00AA02 98               [ 4] 4723 	ret 
                                   4724 
                                   4725 
                                   4726 ;------------------------------
                                   4727 ; BASIC: ALLOC expr 
                                   4728 ; allocate expr element on xtack 
                                   4729 ;-------------------------------
      003087                       4730 xalloc: 
      00AA03 B0 A6 20         [ 4] 4731 	call expression 
      00AA06 CD 89            [ 1] 4732 	cp a,#TK_INTGR
      00AA08 7F 1E            [ 1] 4733 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00AA0A 01 EE 02         [ 2] 4734 	jp syntax_error
      003091                       4735 1$: _xpop 
      00AA0D 35 0A            [ 1]    1     ld a,(y)
      00AA0F 00               [ 1]    2     ldw x,y 
      00AA10 0B CD            [ 2]    3     ldw x,(1,x)
      00AA12 98 B0 AE 9F      [ 2]    4     addw y,#CELL_SIZE 
      00AA16 24               [ 1] 4736 	tnz a 
      00AA17 CD 89            [ 1] 4737 	jreq 3$ 
      00AA19 DC A6            [ 1] 4738 2$:	ld a,#ERR_BAD_VALUE
      00AA1B 2C CD 89         [ 2] 4739 	jp tb_error 
      00AA1E 7F 1E 01         [ 2] 4740 3$: cpw x,#XSTACK_SIZE 
      00AA21 1C 00            [ 1] 4741 	jrugt 2$
      00AA23 0A CD            [ 1] 4742 	ld a,#CELL_SIZE 
      00AA25 89               [ 4] 4743 	mul x,a 
      00AA26 DC A6 0D         [ 2] 4744 	ldw acc16,x 
      00AA29 CD 89 7F 1E      [ 2] 4745 	subw y,acc16 
      00AA2D 01 CD A9 D9      [ 2] 4746 	cpw y,#xstack_full
      00AA31 1F 01            [ 1] 4747 	jrugt 9$
      00AA33 20 C0            [ 1] 4748 	ld a,#ERR_MEM_FULL
      00AA35 CC 16 86         [ 2] 4749 	jp tb_error 
      0030BC                       4750 9$:	 
      00AA35 CD               [ 4] 4751 	ret 
                                   4752 
                                   4753 
                                   4754 ;------------------------------
                                   4755 ;  BASIC DROP expr 
                                   4756 ;  expr in range {0..XSTACK_SIZE}
                                   4757 ;  discard n elements from xtack
                                   4758 ;------------------------------
      0030BD                       4759 xdrop:
      00AA36 A9 CE 27         [ 4] 4760 	call expression 
      00AA39 F4 84            [ 1] 4761 	cp a,#TK_INTGR
      00AA3A 27 03            [ 1] 4762 	jreq 1$ 
      00AA3A 5B 02 81         [ 2] 4763 	jp syntax_error 
      00AA3D                       4764 1$:	_xpop 
      00AA3D CD 9B            [ 1]    1     ld a,(y)
      00AA3F 74               [ 1]    2     ldw x,y 
      00AA40 A1 84            [ 2]    3     ldw x,(1,x)
      00AA42 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00AA46 04               [ 1] 4765 	ld a,xl 
      00AA47 90 F6            [ 1] 4766 	and a,#0x1f 
      00AA49 93               [ 1] 4767 	clrw x 
      00AA4A EE               [ 1] 4768 	ld xl,a 
      00AA4B 01 72            [ 1] 4769 	ld a,#CELL_SIZE 
      00AA4D A9               [ 4] 4770 	mul x,a 
      00AA4E 00 03 C7         [ 2] 4771 	ldw acc16,x  
      00AA51 00 19 CF 00      [ 2] 4772 	addw y,acc16 
      00AA55 1A A3 17 73      [ 2] 4773 	cpw y,#XSTACK_EMPTY 
      00AA56 23 04            [ 2] 4774 	jrule 9$
      00AA56 CD 98 68 A1      [ 2] 4775 	ldw y,#XSTACK_EMPTY 
      00AA5A 08               [ 4] 4776 9$:	ret 
                                   4777 
                                   4778 ;-----------------------
                                   4779 ; check if value in A:X 
                                   4780 ; is inside xstack bound
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



                                   4781 ; output:
                                   4782 ;    X     slot address  
                                   4783 ;-----------------------
      0030EA                       4784 xstack_bound:
      00AA5B 27               [ 1] 4785 	tnz a 
      00AA5C 02 20            [ 1] 4786 	jrne 8$ 
      00AA5E 46 CD 98         [ 2] 4787 1$: cpw x,#XSTACK_SIZE 
      00AA61 68 A1            [ 1] 4788 	jrugt 8$
      00AA63 04 27            [ 1] 4789 	ld a,#CELL_SIZE 
      00AA65 23               [ 4] 4790 	mul x,a
      00AA66 A1 02 27         [ 2] 4791 	ldw acc16,x 
      00AA69 2A               [ 1] 4792 	ldw x,y 
      00AA6A 55 00 03 00      [ 2] 4793 	addw x,acc16 
      00AA6E 02 CD 9B         [ 2] 4794 	cpw x,#XSTACK_EMPTY 
      00AA71 74 A1            [ 1] 4795 	jruge 8$  
      00AA73 84               [ 4] 4796 	ret 
      00AA74 27 03            [ 1] 4797 8$: ld a,#ERR_BAD_VALUE
      00AA76 CC 97 04         [ 2] 4798 	jp tb_error 
                                   4799 
                                   4800 ;-------------------------
                                   4801 ; BASIC: PUT expr, cond 
                                   4802 ; expr -> slot 
                                   4803 ; cond -> valut to put 
                                   4804 ; on xstack 
                                   4805 ;-------------------------
      003108                       4806 xput:
      00AA79 90 F6 93         [ 4] 4807 	call arg_list 
      00AA7C EE 01            [ 1] 4808 	cp a,#2 
      00AA7E 72 A9            [ 1] 4809 	jreq 1$ 
      00AA80 00 03 9F         [ 2] 4810 0$:	jp syntax_error
      003112                       4811 1$: _xpop   ; value to put 
      00AA83 5F CD            [ 1]    1     ld a,(y)
      00AA85 88               [ 1]    2     ldw x,y 
      00AA86 0B 20            [ 2]    3     ldw x,(1,x)
      00AA88 CD A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00AA89 89               [ 2] 4812 	pushw x 
      00AA89 F6               [ 1] 4813 	push a 
      00311D                       4814 	_xpop    ; slot 
      00AA8A 72 5C            [ 1]    1     ld a,(y)
      00AA8C 00               [ 1]    2     ldw x,y 
      00AA8D 02 5F            [ 2]    3     ldw x,(1,x)
      00AA8F CD 88 0B 20      [ 2]    4     addw y,#CELL_SIZE 
      00AA93 C2 30 EA         [ 4] 4815 	call xstack_bound
      00AA94 CF 00 19         [ 2] 4816     ldw ptr16,x 
      00AA94 89               [ 1] 4817 	pop a 
      00AA95 F6               [ 2] 4818 	popw x 
      00AA96 72 5C 00 02      [ 4] 4819 	ld [ptr16],a 
      00AA9A 5F CD 88 0B      [ 1] 4820 	inc ptr8 
      00AA9E 85 F6 27 B4      [ 5] 4821 	ldw [ptr16],x 
      00AAA2 5C               [ 4] 4822 	ret 
                                   4823 
                                   4824 ;------------------------
                                   4825 ; BASIC: PICK expr 
                                   4826 ; get nième element on 
                                   4827 ; xtack. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



                                   4828 ;-----------------------
      00313B                       4829 xpick:
      00AAA3 20 EF AB         [ 4] 4830 	call func_args 
      00AAA5 A1 01            [ 1] 4831 	cp a,#1 
      00AAA5 81 03            [ 1] 4832 	jreq 1$
      00AAA6 CC 16 84         [ 2] 4833 	jp syntax_error 
      003145                       4834 1$: _xpop 
      00AAA6 CD 9A            [ 1]    1     ld a,(y)
      00AAA8 2B               [ 1]    2     ldw x,y 
      00AAA9 A1 01            [ 2]    3     ldw x,(1,x)
      00AAAB 27 03 CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00AAAF 04 90 F6         [ 4] 4835 	call xstack_bound
      00AAB2 93               [ 1] 4836     ld a,(x)
      00AAB3 EE 01            [ 2] 4837 	ldw x,(1,x)				
      00AAB5 72               [ 4] 4838 	ret 
                                   4839 
                                   4840 
                                   4841 ;----------------------------
                                   4842 ; BASIC: AUTORUN \E | addr 
                                   4843 ;  \E -> cancel autorun 
                                   4844 ;  addr -> register an 
                                   4845 ;    autorun program 
                                   4846 ;    this program execute at 
                                   4847 ;     reset/boot 
                                   4848 ;----------------------------
      003155                       4849 cmd_auto_run:
      00AAB6 A9 00 03         [ 4] 4850 	call next_token 
      00AAB9 9F A4            [ 1] 4851 	cp a,#TK_INTGR
      00AABB 7F 81            [ 1] 4852 	jreq 1$ 
      00AABD A1 04            [ 1] 4853 	cp a,#TK_CHAR 
      00AABD A6 06            [ 1] 4854 	jrne 0$ 
      00AABF CD               [ 1] 4855 	ld a,(x)
      00AAC0 9A 1E CD 98      [ 1] 4856 	inc in 
      00AAC4 68 A1            [ 1] 4857 	and a,#0xDF 
      00AAC6 02 27            [ 1] 4858 	cp a,#C 
      00AAC8 0E A1            [ 1] 4859 	jrne 0$ 
      00AACA 04 27 12         [ 2] 4860 	ldw x,EEPROM_BASE 
      00AACD A1 82 27         [ 4] 4861 	call erase_header
      00AAD0 03               [ 4] 4862 	ret 
      00AAD1 CC 97 04         [ 2] 4863 0$:	jp syntax_error
      00AAD4 CD 18 1A         [ 4] 4864 1$:	call get_int24
      00AAD4 FD 20 0B         [ 4] 4865 	call is_program_addr
      00AAD7 27 05            [ 1] 4866 	jreq 2$ 
      00AAD7 F6 88            [ 1] 4867 	ld a,#ERR_BAD_VALUE
      00AAD9 CD 98 81         [ 2] 4868 	jp tb_error 
      00AADC 84               [ 2] 4869 2$: pushw x 
      00AADD 20 03 00 18      [ 1] 4870 	clr farptr 
      00AADF AE 40 00         [ 2] 4871 	ldw x,#EEPROM_BASE
      00AADF CD 98 AA         [ 2] 4872 	ldw ptr16,x 
      00AAE2 5F 02 72         [ 1] 4873 	ld a,AR_SIGN 
      00AAE5 A2               [ 1] 4874 	clrw x 	 
      00AAE6 00 03 90         [ 4] 4875 	call write_byte
      00AAE9 F7 90 EF         [ 1] 4876 	ld a,AR_SIGN+1
      00AAEC 01 A6 07         [ 4] 4877 	call write_byte 
      00AAEF CD 9A            [ 1] 4878 	ld a,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00AAF1 1E 07 8B         [ 4] 4879 	call write_byte 
      00AAF2 7B 02            [ 1] 4880 	ld a,(2,sp)
      00AAF2 90 F6 93         [ 4] 4881 	call write_byte 
      0031A4                       4882 	_drop 2 
      00AAF5 EE 01            [ 2]    1     addw sp,#2 
      00AAF7 72               [ 4] 4883 	ret 
                                   4884 
      00AAF8 A9 00                 4885 AR_SIGN: .ascii "AR" ; autorun signature 
                                   4886 
                                   4887 
                                   4888 ;------------------------------
                                   4889 ;      dictionary 
                                   4890 ; format:
                                   4891 ;   link:   2 bytes 
                                   4892 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4893 ;   cmd_name: 16 byte max 
                                   4894 ;   code_addr: 2 bytes 
                                   4895 ;------------------------------
                                   4896 	.macro _dict_entry len,name,code_addr 
                                   4897 	.word LINK 
                                   4898 	LINK=.
                                   4899 name:
                                   4900 	.byte len   	
                                   4901 	.ascii "name"
                                   4902 	.word code_addr  
                                   4903 	.endm 
                                   4904 
                           000000  4905 	LINK=0
                                   4906 ; respect alphabetic order for BASIC names from Z-A
                                   4907 ; this sort order is for a cleaner WORDS cmd output. 	
      0031A9                       4908 kword_end:
      0031A9                       4909 	_dict_entry,3+F_XOR,XOR,TK_XOR ; xor operator
      00AAFA 03 81                    1 	.word LINK 
                           0031AB     2 	LINK=.
      00AAFC                          3 XOR:
      00AAFC CD                       4 	.byte 3+F_XOR   	
      00AAFD 89 8F 81                 5 	.ascii "XOR"
      00AB00 00 8A                    6 	.word TK_XOR  
      0031B1                       4910 	_dict_entry,5,WRITE,write  
      00AB00 5F C6                    1 	.word LINK 
                           0031B3     2 	LINK=.
      0031B3                          3 WRITE:
      00AB02 00                       4 	.byte 5   	
      00AB03 2F C0 00 30 27           5 	.ascii "WRITE"
      00AB08 03 53                    6 	.word write  
      0031BB                       4911 	_dict_entry,5,WORDS,words 
      00AB0A A6 FF                    1 	.word LINK 
                           0031BD     2 	LINK=.
      00AB0C                          3 WORDS:
      00AB0C 81                       4 	.byte 5   	
      00AB0D 57 4F 52 44 53           5 	.ascii "WORDS"
      00AB0D CD 9A                    6 	.word words  
      0031C5                       4912 	_dict_entry 4,WAIT,wait 
      00AB0F 2B A1                    1 	.word LINK 
                           0031C7     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      0031C7                          3 WAIT:
      00AB11 02                       4 	.byte 4   	
      00AB12 27 03 CC 97              5 	.ascii "WAIT"
      00AB16 04 90                    6 	.word wait  
      0031CE                       4913 	_dict_entry,3+F_IFUNC,USR,usr
      00AB18 E6 03                    1 	.word LINK 
                           0031D0     2 	LINK=.
      0031D0                          3 USR:
      00AB1A 93                       4 	.byte 3+F_IFUNC   	
      00AB1B EE 04 A3                 5 	.ascii "USR"
      00AB1E 50 00                    6 	.word usr  
      0031D6                       4914 	_dict_entry,5,UNTIL,until 
      00AB20 2B 16                    1 	.word LINK 
                           0031D8     2 	LINK=.
      0031D8                          3 UNTIL:
      00AB22 A3                       4 	.byte 5   	
      00AB23 50 29 2A 11 89           5 	.ascii "UNTIL"
      00AB28 90 F6                    6 	.word until  
      0031E0                       4915 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00AB2A 93 EE                    1 	.word LINK 
                           0031E2     2 	LINK=.
      0031E2                          3 UFLASH:
      00AB2C 01                       4 	.byte 6+F_IFUNC   	
      00AB2D 72 A9 00 03 72 FB        5 	.ascii "UFLASH"
      00AB33 01 5B                    6 	.word uflash  
      0031EB                       4916 	_dict_entry,6+F_IFUNC,UBOUND,ubound
      00AB35 02 4F                    1 	.word LINK 
                           0031ED     2 	LINK=.
      0031ED                          3 UBOUND:
      00AB37 81                       4 	.byte 6+F_IFUNC   	
      00AB38 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00AB38 A6 0A                    6 	.word ubound  
      0031F6                       4917 	_dict_entry,4,TONE,tone  
      00AB3A CC 97                    1 	.word LINK 
                           0031F8     2 	LINK=.
      0031F8                          3 TONE:
      00AB3C 06                       4 	.byte 4   	
      00AB3D 54 4F 4E 45              5 	.ascii "TONE"
      00AB3D 72 5F                    6 	.word tone  
      0031FF                       4918 	_dict_entry,2,TO,to
      00AB3F 00 19                    1 	.word LINK 
                           003201     2 	LINK=.
      003201                          3 TO:
      00AB41 AE                       4 	.byte 2   	
      00AB42 B8 00                    5 	.ascii "TO"
      00AB44 89 CF                    6 	.word to  
      003206                       4919 	_dict_entry,5,TIMER,set_timer
      00AB46 00 1A                    1 	.word LINK 
                           003208     2 	LINK=.
      003208                          3 TIMER:
      00AB48 CD                       4 	.byte 5   	
      00AB49 88 EE 27 0F 1E           5 	.ascii "TIMER"
      00AB4E 01 1C                    6 	.word set_timer  
      003210                       4920 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00AB50 00 80                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



                           003212     2 	LINK=.
      003212                          3 TIMEOUT:
      00AB52 27                       4 	.byte 7+F_IFUNC   	
      00AB53 04 1F 01 20 ED 55 54     5 	.ascii "TIMEOUT"
      00AB58 2D BB                    6 	.word timeout  
      00321C                       4921 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00AB58 0F 01                    1 	.word LINK 
                           00321E     2 	LINK=.
      00321E                          3 TICKS:
      00AB5A 0F                       4 	.byte 5+F_IFUNC   	
      00AB5B 02 85 4F 81 53           5 	.ascii "TICKS"
      00AB5F 2B 8B                    6 	.word get_ticks  
      003226                       4922 	_dict_entry,4,STOP,stop 
      00AB5F CD 9A                    1 	.word LINK 
                           003228     2 	LINK=.
      003228                          3 STOP:
      00AB61 2B                       4 	.byte 4   	
      00AB62 A1 02 27 03              5 	.ascii "STOP"
      00AB66 CC 97                    6 	.word stop  
      00322F                       4923 	_dict_entry,4,STEP,step 
      00AB68 04 28                    1 	.word LINK 
                           003231     2 	LINK=.
      00AB69                          3 STEP:
      00AB69 90                       4 	.byte 4   	
      00AB6A E6 03 93 EE              5 	.ascii "STEP"
      00AB6E 04 CF                    6 	.word step  
      003238                       4924 	_dict_entry,5,SPIWR,spi_write
      00AB70 00 1A                    1 	.word LINK 
                           00323A     2 	LINK=.
      00323A                          3 SPIWR:
      00AB72 90                       4 	.byte 5   	
      00AB73 F6 93 EE 01 72           5 	.ascii "SPIWR"
      00AB78 A9 00                    6 	.word spi_write  
      003242                       4925 	_dict_entry,6,SPISEL,spi_select
      00AB7A 03 90                    1 	.word LINK 
                           003244     2 	LINK=.
      003244                          3 SPISEL:
      00AB7C F7                       4 	.byte 6   	
      00AB7D 90 EF 01 72 CD 00        5 	.ascii "SPISEL"
      00AB83 1A 81                    6 	.word spi_select  
      00AB85                       4926 	_dict_entry,5+F_IFUNC,SPIRD,spi_read 
      00AB85 72 0D                    1 	.word LINK 
                           00324F     2 	LINK=.
      00324F                          3 SPIRD:
      00AB87 52                       4 	.byte 5+F_IFUNC   	
      00AB88 30 FB 8E CC 81           5 	.ascii "SPIRD"
      00AB8D 35 56                    6 	.word spi_read  
      00AB8E                       4927 	_dict_entry,5,SPIEN,spi_enable 
      00AB8E 72 0D                    1 	.word LINK 
                           003259     2 	LINK=.
      003259                          3 SPIEN:
      00AB90 52                       4 	.byte 5   	
      00AB91 30 FB 72 16 00           5 	.ascii "SPIEN"
      00AB96 23 8E                    6 	.word spi_enable  
      003261                       4928 	_dict_entry,5,SLEEP,sleep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AB98 81 59                    1 	.word LINK 
                           003263     2 	LINK=.
      00AB99                          3 SLEEP:
      00AB99 CD                       4 	.byte 5   	
      00AB9A 9B 74 A1 84 27           5 	.ascii "SLEEP"
      00AB9F 03 CC                    6 	.word sleep  
      00326B                       4929     _dict_entry,4,SIZE,cmd_size 
      00ABA1 97 04                    1 	.word LINK 
                           00326D     2 	LINK=.
      00326D                          3 SIZE:
      00ABA3 90                       4 	.byte 4   	
      00ABA4 F6 93 EE 01              5 	.ascii "SIZE"
      00ABA8 72 A9                    6 	.word cmd_size  
      003274                       4930 	_dict_entry,4,SAVE,cmd_save 
      00ABAA 00 03                    1 	.word LINK 
                           003276     2 	LINK=.
      00ABAC                          3 SAVE:
      00ABAC CF                       4 	.byte 4   	
      00ABAD 00 13 CE 00              5 	.ascii "SAVE"
      00ABB1 13 5D                    6 	.word cmd_save  
      00327D                       4931 	_dict_entry 3,RUN,run
      00ABB3 27 03                    1 	.word LINK 
                           00327F     2 	LINK=.
      00327F                          3 RUN:
      00ABB5 8F                       4 	.byte 3   	
      00ABB6 26 F7 4E                 5 	.ascii "RUN"
      00ABB8 24 DE                    6 	.word run  
      003285                       4932 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00ABB8 81 7F                    1 	.word LINK 
                           003287     2 	LINK=.
      00ABB9                          3 RSHIFT:
      00ABB9 CD                       4 	.byte 6+F_IFUNC   	
      00ABBA 9B 74 A1 84 27 03        5 	.ascii "RSHIFT"
      00ABC0 CC 97                    6 	.word rshift  
      003290                       4933 	_dict_entry,3+F_IFUNC,RND,random 
      00ABC2 04 90                    1 	.word LINK 
                           003292     2 	LINK=.
      003292                          3 RND:
      00ABC4 F6                       4 	.byte 3+F_IFUNC   	
      00ABC5 93 EE 01                 5 	.ascii "RND"
      00ABC8 72 A9                    6 	.word random  
      003298                       4934 	_dict_entry,6,RETURN,return 
      00ABCA 00 03                    1 	.word LINK 
                           00329A     2 	LINK=.
      00ABCC                          3 RETURN:
      00ABCC A3                       4 	.byte 6   	
      00ABCD 14 00 2B 0C 35 0F        5 	.ascii "RETURN"
      00ABD3 50 F2                    6 	.word return  
      0032A3                       4935 	_dict_entry,7,RESTORE,restore 
      00ABD5 A6 1E                    1 	.word LINK 
                           0032A5     2 	LINK=.
      0032A5                          3 RESTORE:
      00ABD7 62                       4 	.byte 7   	
      00ABD8 A6 10 62 20 1E 52 45     5 	.ascii "RESTORE"
      00ABDD 2F 06                    6 	.word restore  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      0032AF                       4936 	_dict_entry 3,REM,remark 
      00ABDD A3 08                    1 	.word LINK 
                           0032B1     2 	LINK=.
      0032B1                          3 REM:
      00ABDF 00                       4 	.byte 3   	
      00ABE0 2B 09 35                 5 	.ascii "REM"
      00ABE3 0E 50                    6 	.word remark  
      0032B7                       4937 	_dict_entry,6,REBOOT,cold_start
      00ABE5 F2 A6                    1 	.word LINK 
                           0032B9     2 	LINK=.
      0032B9                          3 REBOOT:
      00ABE7 50                       4 	.byte 6   	
      00ABE8 62 20 10 4F 4F 54        5 	.ascii "REBOOT"
      00ABEB 00 B5                    6 	.word cold_start  
      0032C2                       4938 	_dict_entry,4+F_IFUNC,READ,read  
      00ABEB 35 07                    1 	.word LINK 
                           0032C4     2 	LINK=.
      0032C4                          3 READ:
      00ABED 50                       4 	.byte 4+F_IFUNC   	
      00ABEE F2 45 41 44              5 	.ascii "READ"
      00ABEF 2F 70                    6 	.word read  
      0032CB                       4939 	_dict_entry,4+F_IFUNC,QKEY,qkey
      00ABEF A3 00                    1 	.word LINK 
                           0032CD     2 	LINK=.
      0032CD                          3 QKEY:
      00ABF1 40                       4 	.byte 4+F_IFUNC   	
      00ABF2 23 07 72 5C              5 	.ascii "QKEY"
      00ABF6 50 F2                    6 	.word qkey  
      0032D4                       4940 	_dict_entry,3,PUT,xput 
      00ABF8 54 20                    1 	.word LINK 
                           0032D6     2 	LINK=.
      0032D6                          3 PUT:
      00ABFA F4                       4 	.byte 3   	
      00ABFB 50 55 54                 5 	.ascii "PUT"
      00ABFB 9F 4A                    6 	.word xput  
      0032DC                       4941 	_dict_entry,4,PUSH,xpush   
      00ABFD 27 01                    1 	.word LINK 
                           0032DE     2 	LINK=.
      0032DE                          3 PUSH:
      00ABFF 4A                       4 	.byte 4   	
      00AC00 50 55 53 48              5 	.ascii "PUSH"
      00AC00 A4 3E                    6 	.word xpush  
      0032E5                       4942 	_dict_entry,5+F_IFUNC,PORTI,const_porti 
      00AC02 C7 50                    1 	.word LINK 
                           0032E7     2 	LINK=.
      0032E7                          3 PORTI:
      00AC04 F1                       4 	.byte 5+F_IFUNC   	
      00AC05 72 18 50 F0 8E           5 	.ascii "PORTI"
      00AC0A 81 C5                    6 	.word const_porti  
      00AC0B                       4943 	_dict_entry,5+F_IFUNC,PORTG,const_portg 
      00AC0B C6 00                    1 	.word LINK 
                           0032F1     2 	LINK=.
      0032F1                          3 PORTG:
      00AC0D 10                       4 	.byte 5+F_IFUNC   	
      00AC0E CE 00 11 81 47           5 	.ascii "PORTG"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      00AC12 2E C0                    6 	.word const_portg  
      0032F9                       4944 	_dict_entry,5+F_IFUNC,PORTF,const_portf
      00AC12 CD 9A                    1 	.word LINK 
                           0032FB     2 	LINK=.
      0032FB                          3 PORTF:
      00AC14 2B                       4 	.byte 5+F_IFUNC   	
      00AC15 A1 01 27 03 CC           5 	.ascii "PORTF"
      00AC1A 97 04                    6 	.word const_portf  
      00AC1C                       4945 	_dict_entry,5+F_IFUNC,PORTE,const_porte
      00AC1C CD 82                    1 	.word LINK 
                           003305     2 	LINK=.
      003305                          3 PORTE:
      00AC1E 73                       4 	.byte 5+F_IFUNC   	
      00AC1F 90 F6 93 EE 01           5 	.ascii "PORTE"
      00AC24 72 A9                    6 	.word const_porte  
      00330D                       4946 	_dict_entry,5+F_IFUNC,PORTD,const_portd
      00AC26 00 03                    1 	.word LINK 
                           00330F     2 	LINK=.
      00330F                          3 PORTD:
      00AC28 81                       4 	.byte 5+F_IFUNC   	
      00AC29 50 4F 52 54 44           5 	.ascii "PORTD"
      00AC29 CD 9A                    6 	.word const_portd  
      003317                       4947 	_dict_entry,5+F_IFUNC,PORTC,const_portc
      00AC2B 2B A1                    1 	.word LINK 
                           003319     2 	LINK=.
      003319                          3 PORTC:
      00AC2D 02                       4 	.byte 5+F_IFUNC   	
      00AC2E 27 03 CC 97 04           5 	.ascii "PORTC"
      00AC33 90 F6                    6 	.word const_portc  
      003321                       4948 	_dict_entry,5+F_IFUNC,PORTB,const_portb
      00AC35 93 EE                    1 	.word LINK 
                           003323     2 	LINK=.
      003323                          3 PORTB:
      00AC37 01                       4 	.byte 5+F_IFUNC   	
      00AC38 72 A9 00 03 9F           5 	.ascii "PORTB"
      00AC3D 88 90                    6 	.word const_portb  
      00332B                       4949 	_dict_entry,5+F_IFUNC,PORTA,const_porta 
      00AC3F F6 93                    1 	.word LINK 
                           00332D     2 	LINK=.
      00332D                          3 PORTA:
      00AC41 EE                       4 	.byte 5+F_IFUNC   	
      00AC42 01 72 A9 00 03           5 	.ascii "PORTA"
      00AC47 0D 01                    6 	.word const_porta  
      003335                       4950 	_dict_entry 5,PRINT,print 
      00AC49 27 07                    1 	.word LINK 
                           003337     2 	LINK=.
      003337                          3 PRINT:
      00AC4B 98                       4 	.byte 5   	
      00AC4C 59 49 0A 01 26           5 	.ascii "PRINT"
      00AC51 F9 5B                    6 	.word print  
      00333F                       4951 	_dict_entry,4+F_IFUNC,POUT,const_output
      00AC53 01 81                    1 	.word LINK 
                           003341     2 	LINK=.
      00AC55                          3 POUT:
      00AC55 CD                       4 	.byte 4+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



      00AC56 9A 2B A1 02              5 	.ascii "POUT"
      00AC5A 27 03                    6 	.word const_output  
      003348                       4952 	_dict_entry,3+F_IFUNC,POP,xpop 
      00AC5C CC 97                    1 	.word LINK 
                           00334A     2 	LINK=.
      00334A                          3 POP:
      00AC5E 04                       4 	.byte 3+F_IFUNC   	
      00AC5F 90 F6 93                 5 	.ascii "POP"
      00AC62 EE 01                    6 	.word xpop  
      003350                       4953 	_dict_entry,4,POKE,poke 
      00AC64 72 A9                    1 	.word LINK 
                           003352     2 	LINK=.
      003352                          3 POKE:
      00AC66 00                       4 	.byte 4   	
      00AC67 03 9F 88 90              5 	.ascii "POKE"
      00AC6B F6 93                    6 	.word poke  
      003359                       4954 	_dict_entry,5,PMODE,pin_mode 
      00AC6D EE 01                    1 	.word LINK 
                           00335B     2 	LINK=.
      00335B                          3 PMODE:
      00AC6F 72                       4 	.byte 5   	
      00AC70 A9 00 03 0D 01           5 	.ascii "PMODE"
      00AC75 27 07                    6 	.word pin_mode  
      003363                       4955 	_dict_entry,4+F_IFUNC,PINP,const_input
      00AC77 98 46                    1 	.word LINK 
                           003365     2 	LINK=.
      003365                          3 PINP:
      00AC79 56                       4 	.byte 4+F_IFUNC   	
      00AC7A 0A 01 26 F9              5 	.ascii "PINP"
      00AC7E 5B 01                    6 	.word const_input  
      00336C                       4956 	_dict_entry,4+F_IFUNC,PICK,xpick 
      00AC80 81 65                    1 	.word LINK 
                           00336E     2 	LINK=.
      00AC81                          3 PICK:
      00AC81 A6                       4 	.byte 4+F_IFUNC   	
      00AC82 84 CD 9A 1E              5 	.ascii "PICK"
      00AC86 CD 98                    6 	.word xpick  
      003375                       4957 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00AC88 9A 9F                    1 	.word LINK 
                           003377     2 	LINK=.
      003377                          3 PEEK:
      00AC8A A4                       4 	.byte 4+F_IFUNC   	
      00AC8B 07 C7 50 C6              5 	.ascii "PEEK"
      00AC8F 81 03                    6 	.word peek  
      00AC90                       4958 	_dict_entry,5,PAUSE,pause 
      00AC90 52 01                    1 	.word LINK 
                           003380     2 	LINK=.
      003380                          3 PAUSE:
      00AC92 CD                       4 	.byte 5   	
      00AC93 9A 30 A1 02 27           5 	.ascii "PAUSE"
      00AC98 03 CC                    6 	.word pause  
      003388                       4959 	_dict_entry,3+F_IFUNC,PAD,pad_ref 
      00AC9A 97 04                    1 	.word LINK 
                           00338A     2 	LINK=.
      00338A                          3 PAD:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00AC9C 90                       4 	.byte 3+F_IFUNC   	
      00AC9D F6 93 EE                 5 	.ascii "PAD"
      00ACA0 01 72                    6 	.word pad_ref  
      003390                       4960 	_dict_entry,2+F_OR,OR,TK_OR ; OR operator 
      00ACA2 A9 00                    1 	.word LINK 
                           003392     2 	LINK=.
      003392                          3 OR:
      00ACA4 03                       4 	.byte 2+F_OR   	
      00ACA5 CF 00                    5 	.ascii "OR"
      00ACA7 1A 90                    6 	.word TK_OR  
      003397                       4961 	_dict_entry,2,ON,cmd_on 
      00ACA9 F6 93                    1 	.word LINK 
                           003399     2 	LINK=.
      003399                          3 ON:
      00ACAB EE                       4 	.byte 2   	
      00ACAC 01 72                    5 	.ascii "ON"
      00ACAE A9 00                    6 	.word cmd_on  
      00339E                       4962 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00ACB0 03 CD                    1 	.word LINK 
                           0033A0     2 	LINK=.
      0033A0                          3 ODR:
      00ACB2 AC                       4 	.byte 3+F_IFUNC   	
      00ACB3 EF 6B 01                 5 	.ascii "ODR"
      00ACB6 A6 01                    6 	.word const_odr  
      0033A6                       4963 	_dict_entry,3+F_NOT,NOT,TK_NOT;NOT operator
      00ACB8 0D 01                    1 	.word LINK 
                           0033A8     2 	LINK=.
      0033A8                          3 NOT:
      00ACBA 27                       4 	.byte 3+F_NOT   	
      00ACBB 0D 48 0A                 5 	.ascii "NOT"
      00ACBE 01 26                    6 	.word TK_NOT  
      0033AE                       4964 	_dict_entry,4,NEXT,next 
      00ACC0 FB 6B                    1 	.word LINK 
                           0033B0     2 	LINK=.
      0033B0                          3 NEXT:
      00ACC2 01                       4 	.byte 4   	
      00ACC3 7B 01 EA 03              5 	.ascii "NEXT"
      00ACC7 E7 03                    6 	.word next  
      0033B7                       4965 	_dict_entry,3,NEW,new
      00ACC9 A6 01                    1 	.word LINK 
                           0033B9     2 	LINK=.
      0033B9                          3 NEW:
      00ACCB C1                       4 	.byte 3   	
      00ACCC 00 0F 27                 5 	.ascii "NEW"
      00ACCF 10 7B                    6 	.word new  
      0033BF                       4966 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00ACD1 01 43                    1 	.word LINK 
                           0033C1     2 	LINK=.
      0033C1                          3 LSHIFT:
      00ACD3 E4                       4 	.byte 6+F_IFUNC   	
      00ACD4 04 E7 04 7B 01 43        5 	.ascii "LSHIFT"
      00ACDA E4 02                    6 	.word lshift  
      0033CA                       4967 	_dict_entry,4+F_IFUNC,LOG2,log2 
      00ACDC E7 02                    1 	.word LINK 
                           0033CC     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      0033CC                          3 LOG2:
      00ACDE 20                       4 	.byte 4+F_IFUNC   	
      00ACDF 0C 4F 47 32              5 	.ascii "LOG2"
      00ACE0 2E 09                    6 	.word log2  
      0033D3                       4968 	_dict_entry 4,LIST,list
      00ACE0 7B 01                    1 	.word LINK 
                           0033D5     2 	LINK=.
      0033D5                          3 LIST:
      00ACE2 EA                       4 	.byte 4   	
      00ACE3 02 E7 02 7B              5 	.ascii "LIST"
      00ACE7 01 EA                    6 	.word list  
      0033DC                       4969 	_dict_entry 3,LET,let 
      00ACE9 04 E7                    1 	.word LINK 
                           0033DE     2 	LINK=.
      0033DE                          3 LET:
      00ACEB 04                       4 	.byte 3   	
      00ACEC 4C 45 54                 5 	.ascii "LET"
      00ACEC 5B 01                    6 	.word let  
      0033E4                       4970 	_dict_entry,3+F_CFUNC,KEY,key 
      00ACEE 81 DE                    1 	.word LINK 
                           0033E6     2 	LINK=.
      00ACEF                          3 KEY:
      00ACEF 58                       4 	.byte 3+F_CFUNC   	
      00ACF0 1C AC FF                 5 	.ascii "KEY"
      00ACF3 FE 9F                    6 	.word key  
      0033EC                       4971 	_dict_entry,7,IWDGREF,refresh_iwdg
      00ACF5 88 5E                    1 	.word LINK 
                           0033EE     2 	LINK=.
      0033EE                          3 IWDGREF:
      00ACF7 A6                       4 	.byte 7   	
      00ACF8 05 42 1C 50 00 84 81     5 	.ascii "IWDGREF"
      00ACFF 2E 04                    6 	.word refresh_iwdg  
      0033F8                       4972 	_dict_entry,6,IWDGEN,enable_iwdg
      00ACFF 03 06                    1 	.word LINK 
                           0033FA     2 	LINK=.
      0033FA                          3 IWDGEN:
      00AD01 03                       4 	.byte 6   	
      00AD02 05 04 00 02 01 06        5 	.ascii "IWDGEN"
      00AD08 00 02                    6 	.word enable_iwdg  
      003403                       4973 	_dict_entry,5,INPUT,input_var  
      00AD0A 02 02                    1 	.word LINK 
                           003405     2 	LINK=.
      003405                          3 INPUT:
      00AD0C 03                       4 	.byte 5   	
      00AD0D 03 01 03 03 02           5 	.ascii "INPUT"
      00AD12 04 04                    6 	.word input_var  
      00340D                       4974 	_dict_entry,2,IF,if 
      00AD14 05 02                    1 	.word LINK 
                           00340F     2 	LINK=.
      00340F                          3 IF:
      00AD16 06                       4 	.byte 2   	
      00AD17 02 07                    5 	.ascii "IF"
      00AD19 02 05                    6 	.word if  
      003414                       4975 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00AD1B 04 02                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 227.
Hexadecimal [24-Bits]



                           003416     2 	LINK=.
      003416                          3 IDR:
      00AD1D 04                       4 	.byte 3+F_IFUNC   	
      00AD1E 01 44 52                 5 	.ascii "IDR"
      00AD1F 2E CF                    6 	.word const_idr  
      00341C                       4976 	_dict_entry,3,HEX,hex_base
      00AD1F CD 9A                    1 	.word LINK 
                           00341E     2 	LINK=.
      00341E                          3 HEX:
      00AD21 2B                       4 	.byte 3   	
      00AD22 A1 01 27                 5 	.ascii "HEX"
      00AD25 03 CC                    6 	.word hex_base  
      003424                       4977 	_dict_entry,4,GOTO,goto 
      00AD27 97 04                    1 	.word LINK 
                           003426     2 	LINK=.
      00AD29                          3 GOTO:
      00AD29 90                       4 	.byte 4   	
      00AD2A F6 93 EE 01              5 	.ascii "GOTO"
      00AD2E 72 A9                    6 	.word goto  
      00342D                       4978 	_dict_entry,5,GOSUB,gosub 
      00AD30 00 03                    1 	.word LINK 
                           00342F     2 	LINK=.
      00342F                          3 GOSUB:
      00AD32 89                       4 	.byte 5   	
      00AD33 88 A6 80 15 01           5 	.ascii "GOSUB"
      00AD38 27 05                    6 	.word gosub  
      003437                       4979 	_dict_entry,3,GET,cmd_get 
      00AD3A A6 0A                    1 	.word LINK 
                           003439     2 	LINK=.
      003439                          3 GET:
      00AD3C CC                       4 	.byte 3   	
      00AD3D 97 06 54                 5 	.ascii "GET"
      00AD3F 25 73                    6 	.word cmd_get  
      00343F                       4980 	_dict_entry,4+F_IFUNC,FREE,free
      00AD3F CE 00                    1 	.word LINK 
                           003441     2 	LINK=.
      003441                          3 FREE:
      00AD41 15                       4 	.byte 4+F_IFUNC   	
      00AD42 58 58 58 58              5 	.ascii "FREE"
      00AD46 58 9E                    6 	.word free  
      003448                       4981 	_dict_entry,3,FOR,for 
      00AD48 C8 00                    1 	.word LINK 
                           00344A     2 	LINK=.
      00344A                          3 FOR:
      00AD4A 15                       4 	.byte 3   	
      00AD4B C7 00 0E                 5 	.ascii "FOR"
      00AD4E 9F C8                    6 	.word for  
      003450                       4982 	_dict_entry,4,FCPU,fcpu 
      00AD50 00 16                    1 	.word LINK 
                           003452     2 	LINK=.
      003452                          3 FCPU:
      00AD52 C7                       4 	.byte 4   	
      00AD53 00 0F CE 00              5 	.ascii "FCPU"
      00AD57 17 CF                    6 	.word fcpu  
      003459                       4983 	_dict_entry,5,ERASE,erase 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00AD59 00 15                    1 	.word LINK 
                           00345B     2 	LINK=.
      00345B                          3 ERASE:
      00AD5B CE                       4 	.byte 5   	
      00AD5C 00 17 54 9E C8           5 	.ascii "ERASE"
      00AD61 00 17                    6 	.word erase  
      003463                       4984 	_dict_entry,3,END,cmd_end  
      00AD63 C7 00                    1 	.word LINK 
                           003465     2 	LINK=.
      003465                          3 END:
      00AD65 17                       4 	.byte 3   	
      00AD66 9F C8 00                 5 	.ascii "END"
      00AD69 18 C7                    6 	.word cmd_end  
      00346B                       4985 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00AD6B 00 18                    1 	.word LINK 
                           00346D     2 	LINK=.
      00346D                          3 EEPROM:
      00AD6D CE                       4 	.byte 6+F_IFUNC   	
      00AD6E 00 0E 54 54 54 9E        5 	.ascii "EEPROM"
      00AD74 C8 00                    6 	.word const_eeprom_base  
      003476                       4986 	_dict_entry,6+F_IFUNC,EEFREE,func_eefree 
      00AD76 0E C7                    1 	.word LINK 
                           003478     2 	LINK=.
      003478                          3 EEFREE:
      00AD78 00                       4 	.byte 6+F_IFUNC   	
      00AD79 0E 9F C8 00 0F C7        5 	.ascii "EEFREE"
      00AD7F 00 0F                    6 	.word func_eefree  
      003481                       4987 	_dict_entry,4,EDIT,edit 
      00AD81 C8 00                    1 	.word LINK 
                           003483     2 	LINK=.
      003483                          3 EDIT:
      00AD83 18                       4 	.byte 4   	
      00AD84 97 C6 00 0E              5 	.ascii "EDIT"
      00AD88 C8 00                    6 	.word edit  
      00348A                       4988 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00AD8A 17 95                    1 	.word LINK 
                           00348C     2 	LINK=.
      00348C                          3 DWRITE:
      00AD8C CF                       4 	.byte 6+F_CMD   	
      00AD8D 00 17 C6 00 16 A4        5 	.ascii "DWRITE"
      00AD93 7F 72                    6 	.word digital_write  
      003495                       4989 	_dict_entry,4,DROP,xdrop ; drop n element from xtack 
      00AD95 A2 00                    1 	.word LINK 
                           003497     2 	LINK=.
      003497                          3 DROP:
      00AD97 03                       4 	.byte 4   	
      00AD98 90 F7 90 EF              5 	.ascii "DROP"
      00AD9C 01 84                    6 	.word xdrop  
      00349E                       4990 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00AD9E 85 72                    1 	.word LINK 
                           0034A0     2 	LINK=.
      0034A0                          3 DREAD:
      00ADA0 A2                       4 	.byte 5+F_IFUNC   	
      00ADA1 00 03 90 F7 90           5 	.ascii "DREAD"
      00ADA6 EF 01                    6 	.word digital_read  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      0034A8                       4991 	_dict_entry,2,DO,do_loop
      00ADA8 CD 84                    1 	.word LINK 
                           0034AA     2 	LINK=.
      0034AA                          3 DO:
      00ADAA 21                       4 	.byte 2   	
      00ADAB 90 F6                    5 	.ascii "DO"
      00ADAD 93 EE                    6 	.word do_loop  
      0034AF                       4992 	_dict_entry,3,DIR,cmd_dir
      00ADAF 01 72                    1 	.word LINK 
                           0034B1     2 	LINK=.
      0034B1                          3 DIR:
      00ADB1 A9                       4 	.byte 3   	
      00ADB2 00 03 1C                 5 	.ascii "DIR"
      00ADB5 00 01                    6 	.word cmd_dir  
      0034B7                       4993 	_dict_entry,3,DIM,cmd_dim 
      00ADB7 A9 00                    1 	.word LINK 
                           0034B9     2 	LINK=.
      0034B9                          3 DIM:
      00ADB9 81                       4 	.byte 3   	
      00ADBA 44 49 4D                 5 	.ascii "DIM"
      00ADBA 90 89                    6 	.word cmd_dim  
      0034BF                       4994 	_dict_entry,3,DEC,dec_base
      00ADBC 52 03                    1 	.word LINK 
                           0034C1     2 	LINK=.
      0034C1                          3 DEC:
      00ADBE 0F                       4 	.byte 3   	
      00ADBF 02 0F 03                 5 	.ascii "DEC"
      00ADC2 90 AE                    6 	.word dec_base  
      0034C7                       4995 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00ADC4 B5 F7                    1 	.word LINK 
                           0034C9     2 	LINK=.
      0034C9                          3 DDR:
      00ADC6 93                       4 	.byte 3+F_IFUNC   	
      00ADC7 F6 A4 0F                 5 	.ascii "DDR"
      00ADCA 6B 01                    6 	.word const_ddr  
      0034CF                       4996 	_dict_entry,4,DATA,data  
      00ADCC 0C 03                    1 	.word LINK 
                           0034D1     2 	LINK=.
      0034D1                          3 DATA:
      00ADCE 5C                       4 	.byte 4   	
      00ADCF F6 CD 89 7F              5 	.ascii "DATA"
      00ADD3 0C 02                    6 	.word data  
      0034D8                       4997 	_dict_entry,3+F_IFUNC,CR2,const_cr2 
      00ADD5 0A 01                    1 	.word LINK 
                           0034DA     2 	LINK=.
      0034DA                          3 CR2:
      00ADD7 26                       4 	.byte 3+F_IFUNC   	
      00ADD8 F5 A6 46                 5 	.ascii "CR2"
      00ADDB 11 02                    6 	.word const_cr2  
      0034E0                       4998 	_dict_entry,3+F_IFUNC,CR1,const_cr1 
      00ADDD 2B 09                    1 	.word LINK 
                           0034E2     2 	LINK=.
      0034E2                          3 CR1:
      00ADDF A6                       4 	.byte 3+F_IFUNC   	
      00ADE0 20 CD 89                 5 	.ascii "CR1"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ADE3 7F 0C                    6 	.word const_cr1  
      0034E8                       4999 	_dict_entry,5,CONST,cmd_const 
      00ADE5 02 20                    1 	.word LINK 
                           0034EA     2 	LINK=.
      0034EA                          3 CONST:
      00ADE7 07                       4 	.byte 5   	
      00ADE8 A6 0D CD 89 7F           5 	.ascii "CONST"
      00ADED 0F 02                    6 	.word cmd_const  
      0034F2                       5000 	_dict_entry,4+F_CFUNC,CHAR,func_char
      00ADEF 72 A2                    1 	.word LINK 
                           0034F4     2 	LINK=.
      0034F4                          3 CHAR:
      00ADF1 00                       4 	.byte 4+F_CFUNC   	
      00ADF2 02 90 FE 26              5 	.ascii "CHAR"
      00ADF6 CF A6                    6 	.word func_char  
      0034FB                       5001 	_dict_entry,3,BYE,bye 
      00ADF8 0D CD                    1 	.word LINK 
                           0034FD     2 	LINK=.
      0034FD                          3 BYE:
      00ADFA 89                       4 	.byte 3   	
      00ADFB 7F 5F 7B                 5 	.ascii "BYE"
      00ADFE 03 97                    6 	.word bye  
      003503                       5002 	_dict_entry,5,BTOGL,bit_toggle
      00AE00 CD 98                    1 	.word LINK 
                           003505     2 	LINK=.
      003505                          3 BTOGL:
      00AE02 B0                       4 	.byte 5   	
      00AE03 AE AE 0E CD 89           5 	.ascii "BTOGL"
      00AE08 DC 5B                    6 	.word bit_toggle  
      00350D                       5003 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00AE0A 03 90                    1 	.word LINK 
                           00350F     2 	LINK=.
      00350F                          3 BTEST:
      00AE0C 85                       4 	.byte 5+F_IFUNC   	
      00AE0D 81 20 77 6F 72           5 	.ascii "BTEST"
      00AE12 64 73                    6 	.word bit_test  
      003517                       5004 	_dict_entry,4,BSET,bit_set 
      00AE14 20 69                    1 	.word LINK 
                           003519     2 	LINK=.
      003519                          3 BSET:
      00AE16 6E                       4 	.byte 4   	
      00AE17 20 64 69 63              5 	.ascii "BSET"
      00AE1B 74 69                    6 	.word bit_set  
      003520                       5005 	_dict_entry,4,BRES,bit_reset
      00AE1D 6F 6E                    1 	.word LINK 
                           003522     2 	LINK=.
      003522                          3 BRES:
      00AE1F 61                       4 	.byte 4   	
      00AE20 72 79 0A 00              5 	.ascii "BRES"
      00AE24 21 66                    6 	.word bit_reset  
      003529                       5006 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00AE24 CD 9A                    1 	.word LINK 
                           00352B     2 	LINK=.
      00352B                          3 BIT:
      00AE26 30                       4 	.byte 3+F_IFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 231.
Hexadecimal [24-Bits]



      00AE27 A1 01 27                 5 	.ascii "BIT"
      00AE2A 03 CC                    6 	.word bitmask  
      003531                       5007 	_dict_entry,3,AWU,awu 
      00AE2C 97 04                    1 	.word LINK 
                           003533     2 	LINK=.
      00AE2E                          3 AWU:
      00AE2E 90                       4 	.byte 3   	
      00AE2F F6 93 EE                 5 	.ascii "AWU"
      00AE32 01 72                    6 	.word awu  
      003539                       5008 	_dict_entry,7,AUTORUN,cmd_auto_run
      00AE34 A9 00                    1 	.word LINK 
                           00353B     2 	LINK=.
      00353B                          3 AUTORUN:
      00AE36 03                       4 	.byte 7   	
      00AE37 CF 00 13 81 52 55 4E     5 	.ascii "AUTORUN"
      00AE3B 31 55                    6 	.word cmd_auto_run  
      003545                       5009 	_dict_entry,3+F_IFUNC,ASC,ascii
      00AE3B 4F CE                    1 	.word LINK 
                           003547     2 	LINK=.
      003547                          3 ASC:
      00AE3D 00                       4 	.byte 3+F_IFUNC   	
      00AE3E 13 27 02                 5 	.ascii "ASC"
      00AE41 5F 81                    6 	.word ascii  
      00354D                       5010 	_dict_entry,3+F_AND,AND,TK_AND ; AND operator 
      00AE43 43 53                    1 	.word LINK 
                           00354F     2 	LINK=.
      00354F                          3 AND:
      00AE45 81                       4 	.byte 3+F_AND   	
      00AE46 41 4E 44                 5 	.ascii "AND"
      00AE46 CD 9A                    6 	.word TK_AND  
      003555                       5011 	_dict_entry,5,ALLOC,xalloc ; allocate space on xtack 
      00AE48 30 A1                    1 	.word LINK 
                           003557     2 	LINK=.
      003557                          3 ALLOC:
      00AE4A 01                       4 	.byte 5   	
      00AE4B 27 03 CC 97 04           5 	.ascii "ALLOC"
      00AE50 90 F6                    6 	.word xalloc  
      00355F                       5012 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00AE52 93 EE                    1 	.word LINK 
                           003561     2 	LINK=.
      003561                          3 ADCREAD:
      00AE54 01                       4 	.byte 7+F_IFUNC   	
      00AE55 72 A9 00 03 4B 00 35     5 	.ascii "ADCREAD"
      00AE5C CC 50                    6 	.word analog_read  
      00356B                       5013 	_dict_entry,5,ADCON,power_adc 
      00AE5E E0 9E                    1 	.word LINK 
                           00356D     2 	LINK=.
      00356D                          3 ADCON:
      00AE60 A4                       4 	.byte 5   	
      00AE61 3F 95 A3 00 FF           5 	.ascii "ADCON"
      00AE66 23 06                    6 	.word power_adc  
      003575                       5014 kword_dict::
      003575                       5015 	_dict_entry,3+F_IFUNC,ABS,abs
      00AE68 0C 01                    1 	.word LINK 
                           003577     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]



      003577                          3 ABS:
      00AE6A 98                       4 	.byte 3+F_IFUNC   	
      00AE6B 56 20 F5                 5 	.ascii "ABS"
      00AE6E 35 55                    6 	.word abs  
                                   5016 
                                   5017 
                                   5018 
                                   5019 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 233.
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
      00357D                         30 test:
      00357D                         31     _vars VSIZE 
      00AE70 50 E0            [ 2]    1     sub sp,#VSIZE 
      00AE72 84 C7 50         [ 2]   32     ldw x,#LOOP_CNT
      00AE75 E1 9F            [ 2]   33     ldw (CNTR,sp),x  
      00AE77 4A 35 55         [ 2]   34     ldw x,ticks 
      00AE7A 50 E0            [ 2]   35     ldw (T,sp),x
      003589                         36 1$: ; test add24 
      00AE7C C7 50            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AE7E E2 35 AA         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AE81 50 E0 81         [ 1]   39     ld acc24,a 
      00AE84 CF 00 0D         [ 2]   40     ldw acc24+1,x  
      00AE84 35 AA            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AE86 50 E0 81         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AE89 CD 01 7E         [ 4]   43     call add24 
      00AE89 CD 9A            [ 2]   44     ldw x,(CNTR,sp)
      00AE8B 2B A1 01         [ 2]   45     subw x,#1
      00AE8E 27 03            [ 2]   46     ldw (CNTR,sp),x 
      00AE90 CC 97            [ 1]   47     jrne 1$
      00AE92 04 18 47         [ 4]   48     call prt_acc24
      00AE93 A6 20            [ 1]   49     ld a,#SPACE 
      00AE93 90 F6 93         [ 4]   50     call putc 
      00AE96 EE 01 72         [ 2]   51     ldw x,ticks 
      00AE99 A9 00 03         [ 2]   52     subw x,(T,sp)
      00AE9C 4D 26 08         [ 4]   53     call prt_i16  
      00AE9F 5D 26            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]



      00AEA1 05 A6 0A         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00AEA4 CC 97 06         [ 2]   58     ldw x,LOOP_CNT
      00AEA7 4B 18            [ 2]   59     ldw (CNTR,sp),x 
      00AEA9 59 49 25         [ 2]   60     ldw x,ticks 
      00AEAC 04 0A            [ 2]   61     ldw (T,sp),x 
      0035C5                         62 2$: 
      00AEAE 01 26            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00AEB0 F8 5F 84         [ 2]   64     ldw x,#VAL1&0XFFFF
      00AEB3 4A 02 0C         [ 1]   65     ld acc24,a 
      00AEB5 CF 00 0D         [ 2]   66     ldw acc24+1,x  
      00AEB5 81 00            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00AEB6 AE 00 2A         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00AEB6 CD 9A 2B         [ 4]   69     call mul24 
      00AEB9 A1 01            [ 2]   70     ldw x,(CNTR,sp)
      00AEBB 27 03 CC         [ 2]   71     subw x,#1
      00AEBE 97 04            [ 2]   72     ldw (CNTR,sp),x 
      00AEC0 90 F6            [ 1]   73     jrne 2$ 
      00AEC2 93 EE 01         [ 4]   74    call prt_acc24 
      00AEC5 72 A9            [ 1]   75    ld a,#SPACE 
      00AEC7 00 03 9F         [ 4]   76    call putc 
      00AECA AE 00 01         [ 2]   77     ldw x,ticks 
      00AECD A4 17 27         [ 2]   78     subw x,(T,sp)
      00AED0 0A 88 4F         [ 4]   79     call prt_i16 
      00AED3 A6 0D            [ 1]   80     ld a,#CR 
      00AED3 58 49 0A         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00AED6 01 26 FA         [ 2]   83     ldw x,LOOP_CNT
      00AED9 1F 03            [ 2]   84     ldw (CNTR,sp),x 
      00AED9 5B 01 81         [ 2]   85     ldw x,ticks 
      00AEDC 1F 01            [ 2]   86     ldw (T,sp),x 
      003601                         87 3$: 
      00AEDC 85 52            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AEDE 04 89 CE         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AEE1 00 05 1F         [ 1]   90     ld acc24,a 
      00AEE4 03 CE 00         [ 2]   91     ldw acc24+1,x  
      00AEE7 01 1F            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AEE9 05 72 5C         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AEEC 00 20 81         [ 4]   94     call mul24 
      00AEEF 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00AEEF 72 5D 00         [ 2]   96     subw x,#1
      00AEF2 20 26            [ 2]   97     ldw (CNTR,sp),x 
      00AEF4 03 CC            [ 1]   98     jrne 3$ 
      00AEF6 97 04 47         [ 4]   99     call prt_acc24    
      00AEF8 A6 20            [ 1]  100     ld a,#SPACE 
      00AEF8 CD 9C 8D         [ 4]  101     call putc 
      00AEFB 90 F6 93         [ 2]  102     ldw x,ticks 
      00AEFE EE 01 72         [ 2]  103     subw x,(T,sp)
      00AF01 A9 00 03         [ 4]  104     call prt_i16 
      00AF04 4D 26            [ 1]  105     ld a,#CR 
      00AF06 13 5D 26         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AF09 10 1E 03         [ 2]  108     ldw x,LOOP_CNT
      00AF0C CF 00            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]



      00AF0E 05 E6 02         [ 2]  110     ldw x,ticks 
      00AF11 C7 00            [ 2]  111     ldw (T,sp),x 
      00363D                        112 4$:
      00AF13 04 1E            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AF15 05 CF 00         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AF18 01 81 0C         [ 1]  115     ld acc24,a 
      00AF1A CF 00 0D         [ 2]  116     ldw acc24+1,x  
      00AF1A 85 5B            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AF1C 04 72 5A         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AF1F 00 20 FC         [ 4]  119     call mul24 
      00AF22 1E 03            [ 2]  120     ldw x,(CNTR,sp)
      00AF22 AE 50 00         [ 2]  121     subw x,#1
      00AF25 4F 81            [ 2]  122     ldw (CNTR,sp),x 
      00AF27 26 E4            [ 1]  123     jrne 4$ 
      00AF27 AE 50 05         [ 4]  124     call prt_acc24 
      00AF2A 4F 81            [ 1]  125     ld a,#SPACE 
      00AF2C CD 08 FF         [ 4]  126     call putc 
      00AF2C AE 50 0A         [ 2]  127     ldw x,ticks 
      00AF2F 4F 81 01         [ 2]  128     subw x,(T,sp)
      00AF31 CD 18 30         [ 4]  129     call prt_i16 
      00AF31 AE 50            [ 1]  130     ld a,#CR 
      00AF33 0F 4F 81         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AF36 CE 27 10         [ 2]  133     ldw x,LOOP_CNT
      00AF36 AE 50            [ 2]  134     ldw (CNTR,sp),x 
      00AF38 14 4F 81         [ 2]  135     ldw x,ticks 
      00AF3B 1F 01            [ 2]  136     ldw (T,sp),x 
      003679                        137 5$: 
      00AF3B AE 50            [ 1]  138     ld a,#0xff
      00AF3D 19 4F 81         [ 2]  139     ldw x,#0xffff
      00AF40 CD 01 F3         [ 4]  140     call abs24 
      00AF40 AE 50 1E         [ 1]  141     ld acc24,a 
      00AF43 4F 81 0D         [ 2]  142     ldw acc24+1,x
      00AF45 1E 03            [ 2]  143     ldw x,(CNTR,sp)
      00AF45 AE 50 28         [ 2]  144     subw x,#1
      00AF48 4F 81            [ 2]  145     ldw (CNTR,sp),x 
      00AF4A 26 E9            [ 1]  146     jrne 5$ 
      00AF4A 4F AE 00         [ 4]  147     call prt_acc24 
      00AF4D 00 81            [ 1]  148     ld a,#SPACE 
      00AF4F CD 08 FF         [ 4]  149     call putc 
      00AF4F 4F AE 00         [ 2]  150     ldw x,ticks 
      00AF52 01 81 01         [ 2]  151     subw x,(T,sp)
      00AF54 CD 18 30         [ 4]  152     call prt_i16 
      0036A1                        153 6$:
      00AF54 4F AE            [ 1]  154     ld a,#CR 
      00AF56 00 02 81         [ 4]  155     call putc 
      00AF59 CD 36 EC         [ 4]  156     call read_integer 
      00AF59 4F AE 00 03 81   [ 1]  157     mov farptr,acc24 
      00AF5E 55 00 0D 00 19   [ 1]  158     mov farptr+1,acc16 
      00AF5E 4F AE 00 04 81   [ 1]  159     mov farptr+2,acc8 
      00AF63 CD 36 EC         [ 4]  160     call read_integer 
      00AF63 4F AE 00         [ 1]  161     ld a,acc24 
      00AF66 01 81 0D         [ 2]  162     ldw x,acc16 
      00AF68 55 00 18 00 0C   [ 1]  163     mov acc24,farptr 
      00AF68 4F AE 00 00 81   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]



      00AF6D 55 00 1A 00 0E   [ 1]  165     mov acc8,farptr+2 
      00AF6D 4F AE 40         [ 4]  166     call div24 
      00AF70 00               [ 1]  167     push a 
      00AF71 81               [ 2]  168     pushw x 
      00AF72 CD 18 47         [ 4]  169     call prt_acc24 
      00AF72 55 00            [ 1]  170     ld a,#SPACE 
      00AF74 04 00 02         [ 4]  171     call putc 
      00AF77 81               [ 2]  172     popw x
      00AF78 CF 00 0D         [ 2]  173     ldw acc16,x  
      00AF78 89 E6 03         [ 1]  174     pop acc24 
      00AF7B A1 80 26         [ 4]  175     call prt_acc24
      00AF7E 05 EE            [ 2]  176     jra 6$
      0036E9                        177     _drop VSIZE 
      00AF80 04 A3            [ 2]    1     addw sp,#VSIZE 
      00AF82 AF               [ 4]  178     ret 
                                    179 
                                    180 
      0036EC                        181 read_integer:
      00AF83 72 85            [ 1]  182     ld a,#'? 
      00AF85 81 08 FF         [ 4]  183     call putc  
      00AF86 72 5F 00 03      [ 1]  184 	clr count  
      00AF86 5F CF 00         [ 4]  185 	call readln 
      00AF89 07 CF 00         [ 2]  186 	ldw x,#tib 
      00AF8C 09 CE 00         [ 1]  187 	push count
      00AF8F 1C CD            [ 1]  188 	push #0 
      00AF91 98 68 A1         [ 2]  189 	addw x,(1,sp)
      00AF94 84               [ 1]  190 	incw x 
      003704                        191 	_drop 2 
      00AF95 26 10            [ 2]    1     addw sp,#2 
      00AF97 CD 98 9A 90      [ 1]  192 	clr in 
      00AF9B 89 4F CD         [ 4]  193 	call get_token
      00AF9E 8C C5            [ 1]  194 	cp a,#TK_INTGR
      00AFA0 90 85            [ 1]  195 	jreq 3$ 
      00AFA2 5D 26            [ 1]  196 	cp a,#TK_MINUS
      00AFA4 17 20 44         [ 4]  197 	call get_token 
      00AFA7 A1 84            [ 1]  198 	cp a,#TK_INTGR 
      00AFA7 55 00            [ 1]  199 	jreq 2$
      00AFA9 03 00 02         [ 2]  200 	jp syntax_error
      00371D                        201 2$:
      00AFAC C3 00 1E         [ 4]  202 	call neg_acc24  	
      003720                        203 3$: 
      00AFAF 24               [ 4]  204     ret 
                                    205 
                                    206 .endif ; DEBUG  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
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
      003780                         28 	.bndry 128 ; align on FLASH block.
                                     29 ; space for user application  
      003780                         30 app_space::
      00AFB0 3A 00                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00AFB1 00 00                   32 app_size: .word 0 
      003784                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003577 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      00356D R
    ADCON_ID=  000002     |   4 ADCREAD    003561 R   |     ADCREAD_=  000004 
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
  4 ALLOC      003557 R   |   4 AND        00354F R   |     AND_IDX =  0000FA 
    ARG_OFS =  000002     |     ARROW_LE=  000080     |     ARROW_RI=  000081 
  4 AR_SIGN    0031A7 R   |   4 ASC        003547 R   |     ASC_IDX =  000006 
    ATMP    =  000001     |     ATTRIB  =  000002     |   4 AUTORUN    00353B R
  4 AUTO_RUN   00015C R   |   4 AWU        003533 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        00352B R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCKS  =  000005     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  00000D     |   4 BRES       003522 R
    BRES_IDX=  00000C     |     BS      =  000008     |   4 BSET       003519 R
    BSET_IDX=  00000E     |     BSIZE   =  000006     |   4 BTEST      00350F R
    BTEST_ID=  000010     |   4 BTOGL      003505 R   |     BTOGL_ID=  000012 
    BTW     =  000001     |   4 BYE        0034FD R   |     BYE_IDX =  000014 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   4 CHAR       0034F4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

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
    COMMA   =  00002C     |   4 CONST      0034EA R   |     CONST_ID=  0000B6 
    COUNT   =  000003     |     CPOS    =  000003     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   4 CR1        0034E2 R
    CR1_IDX =  00001A     |   4 CR2        0034DA R   |     CR2_IDX =  000018 
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
    CX_CNT  =  000004     |     CX_IN   =  000003     |   4 DATA       0034D1 R
    DATA_IDX=  00001C     |     DC1     =  000011     |     DC2     =  000012 
    DC3     =  000013     |     DC4     =  000014     |   4 DDR        0034C9 R
    DDR_IDX =  00001E     |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   4 DEC        0034C1 R   |     DEC_IDX =  000020 
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  4 DIM        0034B9 R   |   4 DIR        0034B1 R   |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         0034AA R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      0034A0 R
    DREAD_ID=  000024     |   4 DROP       003497 R   |   4 DWRITE     00348C R
    DWRITE_I=  000026     |   4 EDIT       003483 R   |     EDIT_IDX=  000028 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

  4 EEFREE     003478 R   |     EEFREE_I=  0000B8     |   4 EEPROM     00346D R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_I=  00002A 
    EEPROM_S=  000800     |     EM      =  000019     |   4 END        003465 R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      00345B R   |   4 ERASED     00294C R
    ERASE_ID=  00002E     |     ERR_BAD_=  00000A     |     ERR_BUF_=  00000F 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_D=  00000C 
    ERR_NO_F=  00000E     |     ERR_NO_L=  000005     |     ERR_NO_P=  00000D 
    ERR_NO_P=  000012     |     ERR_OVER=  000010     |     ERR_RD_O=  000011 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       003452 R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001EAB R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        00344A R   |     FOR_IDX =  000034 
  4 FREE       003441 R   |     FREE_IDX=  000088     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000080     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_NOT   =  000070     |     F_OR    =  000090     |     F_XOR   =  0000A0 
  4 GET        003439 R   |     GET_IDX =  0000B4     |   4 GOSUB      00342F R
    GOSUB_ID=  000036     |   4 GOTO       003426 R   |     GOTO_IDX=  000038 
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |     GS      =  00001D     |   4 HEX        00341E R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
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
  4 IDR        003416 R   |     IDR_IDX =  00003C     |   4 IF         00340F R
    IF_IDX  =  00003E     |     IN      =  000005     |     INCR    =  000001 
    INP     =  000000     |   4 INPUT      003405 R   |     INPUT_DI=  000000 
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
    ITC_SPR8=  007F77     |   4 IWDGEN     0033FA R   |     IWDGEN_I=  000042 
  4 IWDGREF    0033EE R   |     IWDGREF_=  000044     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0033E6 R   |     KEY_END =  000083     |     KEY_IDX =  000046 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        0033DE R   |     LET_IDX =  000048 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  003577 R   |   4 LIST       0033D5 R   |     LIST_IDX=  00004A 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG2       0033CC R   |     LOG_IDX =  00004C 
    LOOP_CNT=  002710     |   4 LSHIFT     0033C1 R   |     LSHIFT_I=  00004E 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000005 
    NAFR    =  004804     |     NAK     =  000015     |     NAMEPTR =  000001 
    NAME_MAX=  00000F     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        0033B9 R   |     NEW_IDX =  000052     |   4 NEXT       0033B0 R
    NEXT_IDX=  000050     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        0033A8 R   |     NOT_IDX =  0000F8 
    NOT_OP  =  000001     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R   |   4 ODR        0033A0 R
    ODR_IDX =  000054     |   4 ON         003399 R   |     ONOFF   =  000003 
    ON_IDX  =  0000B2     |     OP      =  000002     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  4 OR         003392 R   |     OR_IDX  =  0000FC     |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVRWR   =  000004     |     PA      =  000000 
  4 PAD        00338A R   |     PAD_IDX =  000056     |     PAD_SIZE=  000080 
  4 PAUSE      003380 R   |     PAUSE_ID=  000058     |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  4 PEEK       003377 R   |     PEEK_IDX=  00005C     |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PG_SIZE =  000001     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |   4 PICK       00336E R   |     PINNO   =  000001 
  4 PINP       003365 R   |     PINP_IDX=  00005E     |     PINVAL  =  000002 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  4 PMODE      00335B R   |     PMODE_ID=  00005A     |   4 POKE       003352 R
    POKE_IDX=  000060     |   4 POP        00334A R   |   4 PORTA      00332D R
  4 PORTB      003323 R   |   4 PORTC      003319 R   |   4 PORTD      00330F R
  4 PORTE      003305 R   |   4 PORTF      0032FB R   |   4 PORTG      0032F1 R
  4 PORTI      0032E7 R   |   4 POUT       003341 R   |     POUT_IDX=  000062 
    PREV    =  000001     |     PRG_SIZE=  000003     |   4 PRINT      003337 R
    PROD    =  000001     |     PROD_SIG=  000004     |   4 PROG_ADD   001E81 R
  4 PROG_SIZ   001E93 R   |     PRTA_IDX=  000066     |     PRTB_IDX=  000068 
    PRTC_IDX=  00006A     |     PRTD_IDX=  00006C     |     PRTE_IDX=  00006E 
    PRTF_IDX=  000070     |     PRTG_IDX=  000072     |     PRTI_IDX=  000074 
    PRT_IDX =  000064     |     PSIZE   =  00000B     |     PSTR    =  000003 
  4 PUSH       0032DE R   |   4 PUT        0032D6 R   |   4 QKEY       0032CD R
    QKEY_IDX=  000076     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001EBC R   |     RAM_SIZE=  001800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table

    RBT_IDX =  00007A     |   4 READ       0032C4 R   |     READ_IDX=  000078 
  4 REBOOT     0032B9 R   |     RECLEN  =  000005     |     REC_LEN =  000003 
    REC_XTRA=  000005     |   4 REG_A      0004DA R   |   4 REG_CC     0004DE R
  4 REG_PC     0004CE R   |   4 REG_SP     0004E3 R   |   4 REG_X      0004D6 R
  4 REG_Y      0004D2 R   |     RELOP   =  000001     |   4 REM        0032B1 R
    REM_IDX =  00007C     |   4 RESTORE    0032A5 R   |     REST_IDX=  00007E 
    RETL1   =  000001     |   4 RETURN     00329A R   |     RET_ADDR=  000001 
    RET_BPTR=  000003     |     RET_IDX =  000080     |     RET_INW =  000005 
  4 RND        003292 R   |     RND_IDX =  000082     |     RONLY   =  000005 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     003287 R
    RSHIFT_I=  000084     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        00327F R   |     RUN_IDX =  000086     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000001     |     R_CC    =  000009 
    R_PC    =  00000A     |     R_X     =  000002     |     R_Y     =  000004 
  4 SAVE       003276 R   |     SAVE_IDX=  000032     |     SAV_ACC1=  000006 
    SAV_ACC2=  000008     |     SAV_COUN=  00000A     |     SAV_IN  =  000009 
    SEPARATE=  000000     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |     SI      =  00000F     |     SIGN    =  000001 
  4 SIGNATUR   00294A R   |   4 SIZE       00326D R   |     SIZE_IDX=  0000B0 
    SKIP    =  000005     |   4 SLEEP      003263 R   |     SLEEP_ID=  00008A 
    SO      =  00000E     |     SOH     =  000001     |     SPACE   =  000020 
  4 SPIEN      003259 R   |     SPIEN_ID=  00008E     |   4 SPIRD      00324F R
    SPIRD_ID=  00008C     |   4 SPISEL     003244 R   |     SPISEL_I=  000090 
  4 SPIWR      00323A R   |     SPIWR_ID=  000092     |     SPI_CR1 =  005200 
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
    STACK_SI=  00008C     |   4 STATES     000491 R   |   4 STEP       003231 R
    STEP_IDX=  000094     |   4 STOP       003228 R   |     STOP_IDX=  000096 
    STR     =  000003     |   4 STR_BYTE   001EA4 R   |     STX     =  000002 
    SUB     =  00001A     |     SUP     =  000084     |     SWIM_CSR=  007F80 
    SYN     =  000016     |   4 SysCall    000012 R   |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   4 TICKS      00321E R   |     TICKS_ID=  000098 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 245.
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
    TIM4_SR_=  000000     |   4 TIMEOUT    003212 R   |   4 TIMER      003208 R
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
    TK_XOR  =  00008A     |     TMROUT_I=  00009C     |   4 TO         003201 R
  4 TONE       0031F8 R   |     TONE_IDX=  0000A0     |     TOWRITE =  000005 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 246.
Hexadecimal [24-Bits]

Symbol Table

    UART_GTR=  000009     |     UART_PSC=  00000A     |     UART_SR =  000000 
    UART_SR_=  000001     |     UART_SR_=  000004     |     UART_SR_=  000002 
    UART_SR_=  000003     |     UART_SR_=  000000     |     UART_SR_=  000005 
    UART_SR_=  000006     |     UART_SR_=  000007     |     UBC     =  004801 
  4 UBOUND     0031ED R   |     UBOUND_I=  0000A2     |   4 UBTN_Han   00005A R
  4 UFLASH     0031E2 R   |     UFLASH_I=  0000A4     |   4 UNTIL      0031D8 R
    UNTIL_ID=  0000A6     |     US      =  00001F     |   4 USER_ABO   000062 R
  4 USR        0031D0 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |     USR_IDX =  0000A8     |   4 Uart1RxH   00087C R
  4 UserButt   000036 R   |     VAL1    =  02FFFF     |     VAL2    =  00002A 
    VAL3    =  000003     |     VAL4    =  0005FF     |     VAL5    =  FFFFFFFD 
    VAR_NAME=  000001     |     VSIZE   =  000008     |     VT      =  00000B 
  4 WAIT       0031C7 R   |     WAIT_IDX=  0000AA     |     WCNT    =  000003 
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |     WLKPTR  =  000003     |   4 WORDS      0031BD R
    WORDS_ID=  0000AC     |   4 WRITE      0031B3 R   |     WRITE_ID=  0000AE 
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XFIRST  =  000001 
    XMASK   =  000001     |     XOFF    =  000013     |     XON     =  000011 
  4 XOR        0031AB R   |     XOR_IDX =  0000FE     |     XSAVE   =  000002 
    XSTACK_E=  001773     |     XSTACK_S=  000014     |     XTEMP   =  000001 
    YSAVE   =  000004     |     YTEMP   =  000005     |   4 abs        002B92 R
  4 abs24      0001F3 R   |   5 acc16      00000D GR  |   5 acc24      00000C GR
  5 acc32      00000B GR  |   5 acc8       00000E GR  |   4 accept_c   000BC7 R
  4 add24      00017E R   |   4 add_char   001332 R   |   4 add_spac   00112A R
  4 analog_r   002656 R   |   4 and_cond   001BBB R   |   4 and_fact   001B8B R
  4 app        003784 R   |   4 app_sign   003780 R   |   4 app_size   003782 R
  4 app_spac   003780 GR  |   4 arduino_   002C7F R   |   4 arg_list   0019B0 R
  5 array_si   000020 R   |   4 ascii      002A3D R   |   4 at_tst     000F9C R
  4 atoi24     0018D2 GR  |   4 atoi_exi   001941 R   |   4 awu        002B39 R
  4 awu02      002B4C R   |   4 bad_port   002AB8 R   |   5 base       00000A GR
  5 basicptr   000004 GR  |   4 beep       0025CD R   |   4 beep_1kh   0025A0 GR
  4 bin_exit   000E03 R   |   4 bit_rese   002166 R   |   4 bit_set    002144 R
  4 bit_test   0021AB R   |   4 bit_togg   002189 R   |   4 bitmask    002E36 R
  4 bkslsh_t   000F49 R   |   4 bksp       000966 R   |   2 block_bu   0016E0 GR
  4 block_er   000765 R   |   4 break_po   002742 R   |   4 bye        002B05 R
  4 clear_au   0008B3 R   |   4 clear_ba   00149E R   |   4 clear_bl   002857 R
  4 clear_va   0013F6 R   |   4 clock_in   00007D R   |   4 cmd_auto   003155 R
  4 cmd_cons   001D90 R   |   4 cmd_dim    001DA4 R   |   4 cmd_dim1   001DAE R
  4 cmd_dim2   001DB4 R   |   4 cmd_dir    002971 R   |   4 cmd_end    00256C R
  4 cmd_get    002573 R   |   4 cmd_itf    0004FE R   |   4 cmd_line   001713 R
  4 cmd_name   001352 R   |   4 cmd_on     0023E0 R   |   4 cmd_save   0028AF R
  4 cmd_size   001C94 R   |   4 cold_sta   0000B5 R   |   4 colon_ts   000F70 R
  4 comma_ts   000F7B R   |   4 comp_msg   001663 R   |   4 compile    001096 GR
  4 conditio   001C0D R   |   4 const_cr   002ED9 R   |   4 const_cr   002EDE R
  4 const_dd   002ED4 R   |   4 const_ee   002EED R   |   4 const_id   002ECF R
  4 const_in   002EE8 R   |   4 const_od   002ECA R   |   4 const_ou   002EE3 R
  4 const_po   002EA2 R   |   4 const_po   002EA7 R   |   4 const_po   002EAC R
  4 const_po   002EB1 R   |   4 const_po   002EB6 R   |   4 const_po   002EBB R
  4 const_po   002EC0 R   |   4 const_po   002EC5 R   |   4 convert_   000D73 R
  4 convert_   00092A R   |   4 copy_com   000FD1 R   |   5 count      000003 GR
  4 cp24       0001B8 R   |   4 cp24_ax    0001EA R   |   4 cp_loop    001961 R
  4 cpl24      0001FA R   |   4 cpy_cmd_   001112 R   |   4 cpy_quot   001152 R
  4 create_g   000C9D R   |   4 cs_high    00306F R   |   4 dash_tst   000F91 R
  4 data       002EF2 R   |   4 data_err   002F6B R   |   5 data_len   000009 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 247.
Hexadecimal [24-Bits]

Symbol Table

  5 data_ofs   000008 R   |   5 data_ptr   000006 R   |   4 dec_base   001C86 R
  4 decomp_l   0011EA R   |   4 decompil   0011A2 GR  |   4 del_line   000C70 R
  4 delete_l   000A53 R   |   4 delete_n   000976 R   |   4 delete_u   000A18 R
  4 digital_   002692 R   |   4 digital_   0026C9 R   |   4 div24      000307 R
  4 divu24_8   0002E9 R   |   4 do_loop    002E5C R   |   4 do_progr   000758 R
  4 dup24      00016F R   |   5 dvar_bgn   000030 GR  |   5 dvar_end   000032 GR
  4 edit       001F54 R   |   4 enable_i   002DC6 R   |   4 eql_tst    00101C R
  4 equal      001345 R   |   4 eras0      0027C7 R   |   4 erase      0027BD R
  4 erase_ex   000789 R   |   4 erase_fl   00077F R   |   4 erase_he   002895 R
  4 erase_pr   00276A R   |   4 err_bad_   00158C R   |   4 err_buf_   001602 R
  4 err_cmd_   001550 R   |   4 err_div0   001515 R   |   4 err_dupl   00156A R
  4 err_math   0014FC R   |   4 err_mem_   0014E1 R   |   4 err_msg    0014BB R
  4 err_no_a   001598 R   |   4 err_no_d   0015CB R   |   4 err_no_f   0015EF R
  4 err_no_l   001524 R   |   4 err_no_p   0015DB R   |   4 err_not_   00157B R
  4 err_not_   001635 R   |   4 err_over   00160F R   |   4 err_read   001619 R
  4 err_run_   00153A R   |   4 err_synt   0014EE R   |   4 escaped    000D88 GR
  4 expect     00199E R   |   4 expressi   001AF4 R   |   4 factor     0019FC R
  5 farptr     000018 R   |   4 fcpu       002C01 R   |   4 fetchc     000605 R
  4 fill_wri   002847 R   |   4 final_te   000BC0 R   |   4 first_li   001EFE R
  5 flags      000022 GR  |   4 for        002241 R   |   4 free       001C8B R
  5 free_eep   000024 R   |   7 free_ram   000090 R   |   4 func_arg   0019AB R
  4 func_cha   002A26 R   |   4 func_eef   001D20 R   |   4 ge         001347 R
  4 get_addr   001810 R   |   4 get_arra   0019CC R   |   4 get_char   00182A R
  4 get_esca   000936 R   |   4 get_int2   00181A R   |   4 get_targ   00236E R
  4 get_targ   00237C R   |   4 get_tick   002B8B R   |   4 get_toke   000EE2 GR
  4 get_valu   001D0F R   |   4 getc       00090F GR  |   4 gosub      00248C R
  4 gosub_1    002497 R   |   4 gosub_2    00249D R   |   4 goto       002472 R
  4 goto_1     00247C R   |   4 gpio       002A8D R   |   4 gt         001343 R
  4 gt_tst     001027 R   |   4 hex_base   001C81 R   |   4 hex_dump   000645 R
  4 if         002224 R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   000860 R   |   4 input_ex   0020FC R
  4 input_lo   002066 R   |   4 input_va   002062 R   |   4 insert_c   0009D5 R
  4 insert_l   000CC9 R   |   4 insert_l   000D38 R   |   4 interp_l   001754 R
  4 interpre   00172F R   |   4 invalid    00056D R   |   4 invalid_   0005DB R
  4 is_alnum   000E36 GR  |   4 is_alpha   000E1C GR  |   4 is_data_   002EF8 R
  4 is_digit   000E2D GR  |   4 is_erase   00294E R   |   4 is_progr   0024CD R
  4 is_symbo   000E3F R   |   4 itoa       00186D GR  |   4 itoa_loo   00188F R
  4 jp_to_ta   00247F R   |   4 key        002A7C R   |   4 kword_di   003575 GR
  4 kword_en   0031A9 R   |   4 le         00134C R   |   4 ledoff     0003CD R
  4 ledon      0003C8 R   |   4 ledtoggl   0003D2 R   |   4 left_par   0003DB R
  4 let        001CCC GR  |   4 let_arra   001CDA R   |   4 let_dvar   00178D R
  4 let_eval   001CE2 R   |   4 let_var    001CDF R   |   4 lines_sk   001F01 R
  4 list       001ECB R   |   4 list_exi   001F43 R   |   4 list_loo   001F21 R
  4 log2       002E09 R   |   4 look_tar   00239F R   |   4 loop_bac   002351 R
  5 loop_dep   00001F R   |   4 loop_don   002366 R   |   4 lshift     002BA9 R
  4 lt         00134A R   |   4 lt_tst     001050 R   |   4 mem_peek   000589 R
  4 mod24      0003A1 R   |   4 move       0013B2 GR  |   4 move_dow   0013D1 R
  4 move_era   0006E7 R   |   4 move_exi   0013F2 R   |   4 move_lef   0009AD R
  4 move_loo   0013D6 R   |   4 move_prg   000727 R   |   4 move_rig   0009BB R
  4 move_up    0013C3 R   |   4 mul24      000279 R   |   4 mul_char   001334 R
  4 mulu24_8   00023A R   |   4 nbr_tst    000F15 R   |   4 ne         00134F R
  4 neg24      000203 R   |   4 neg_acc2   00021D R   |   4 neg_ax     000215 R
  4 new        002760 R   |   4 next       0022F9 R   |   4 next_lin   001737 R
  4 next_tok   0017E8 GR  |   4 no_match   001973 R   |   4 number     00060B R
  4 other      001079 R   |   4 overwrit   000BEC R   |   2 pad        0016E0 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 248.
Hexadecimal [24-Bits]

Symbol Table

  4 pad_ref    003074 R   |   4 parse_ad   0004E8 R   |   4 parse_bi   000DE1 R
  4 parse_in   000D90 R   |   4 parse_ke   000E62 R   |   4 parse_qu   000D3B R
  4 parse_sy   000E4A R   |   4 pause      002B19 R   |   4 pause02    002B2C R
  4 peek       002203 R   |   4 peek_byt   0005A5 R   |   4 pin_mode   002C10 R
  4 plus_tst   000FF0 R   |   4 poke       0021E2 R   |   4 power_ad   002606 R
  4 prcnt_ts   001011 R   |   4 print      001FB9 R   |   4 print_fa   0005EA R
  4 print_he   000C23 GR  |   4 print_re   000427 R   |   4 print_st   00057D R
  4 print_to   001855 R   |   4 prog_siz   001E3A R   |   4 program_   001E42 R
  4 program_   000701 R   |   4 program_   000727 R   |   4 prt_acc2   001847 R
  4 prt_basi   001F95 R   |   4 prt_i16    001830 R   |   4 prt_loop   001FBD R
  4 prt_peek   0003AA GR  |   4 prt_reg1   000408 R   |   4 prt_reg8   0003E6 R
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       0008FF GR
  4 puts       00095C GR  |   4 qgetc      000908 GR  |   4 qkey       002A80 GR
  4 qmark_ts   000FA7 R   |   4 qsign      00283C R   |   4 random     002C9F R
  4 read       002F70 R   |   4 read01     002F75 R   |   4 read_int   0036EC R
  4 readln     000A61 GR  |   4 readln_l   000A70 R   |   4 readln_q   000C09 R
  4 refresh_   002E04 R   |   4 relation   001B2C R   |   4 relop_st   001337 R
  4 remark     002101 GR  |   4 repl       000527 R   |   4 repl_exi   00054F R
  4 reset_co   001FBB R   |   4 rest_con   002052 R   |   4 restore    002F06 R
  4 return     0024B0 R   |   4 right_al   001140 GR  |   4 row_alig   000845 R
  4 row_eras   0006BA R   |   4 row_eras   0006E7 R   |   4 row_loop   000628 R
  4 rparnt_t   000F65 R   |   4 rshift     002BD5 R   |   7 rsign      00008C R
  7 rsize      00008E R   |   4 rt_msg     001651 R   |   4 run        0024DE R
  4 run_app    00012A R   |   4 run_it     002539 R   |   4 run_it_0   00253B R
  5 rx1_head   00002E R   |   5 rx1_queu   000026 R   |   5 rx1_tail   00002F R
  4 save_con   002042 R   |   4 scan_blo   00086E R   |   4 search_d   001953 GR
  4 search_e   00199B R   |   4 search_f   00286B R   |   4 search_l   000C45 GR
  4 search_l   000C54 R   |   4 search_n   001D49 R   |   4 search_n   001957 R
  5 seedx      000014 R   |   5 seedy      000016 R   |   4 select_p   002C6F R
  4 send_esc   000984 R   |   4 send_par   00098F R   |   4 set_data   002F3C R
  4 set_time   002DA4 R   |   4 sharp_ts   000F86 R   |   4 show_row   000616 R
  4 single_c   00132D R   |   4 skip       000ECF R   |   4 skip_str   001801 R
  4 skip_to_   002959 R   |   4 slash_ts   001006 R   |   4 sleep      002B0E R
  4 software   001405 R   |   4 spaces     0009C9 GR  |   4 spi_clea   003009 R
  4 spi_disa   002FF1 R   |   4 spi_enab   002FBE R   |   4 spi_rcv_   00302B R
  4 spi_read   003056 R   |   4 spi_sele   00305D R   |   4 spi_send   003015 R
  4 spi_writ   003036 R   |   2 stack_fu   00179C GR  |   2 stack_un   001828 R
  4 star_tst   000FFB R   |   4 step       0022B7 R   |   4 stop       002714 R
  4 store_lo   0022E6 R   |   4 str_matc   001980 R   |   4 str_tst    000F05 R
  4 strcmp     001391 R   |   4 strcpy     0013A2 GR  |   4 strlen     001386 GR
  4 sub24      00019B R   |   4 symb_loo   000E4B R   |   4 syntax_e   001684 GR
  4 system_i   00144B R   |   5 tab_widt   000023 GR  |   4 tb_error   001686 GR
  4 term       001AB1 R   |   4 term01     001AB9 R   |   4 term_exi   001AF1 R
  4 test       00357D R   |   4 test_p     000575 R   |   2 tib        001690 GR
  4 tick_tst   000FBF R   |   5 ticks      00000F R   |   4 timeout    002DBB R
  5 timer      000012 GR  |   4 timer2_i   000093 R   |   4 timer4_i   0000A0 R
  4 tk_id      001674 R   |   4 to         002271 R   |   4 to_eepro   000750 R
  4 to_flash   000755 R   |   4 to_hex_c   000C3A GR  |   4 to_upper   0018C6 GR
  4 token_ch   00108F R   |   4 token_ex   001093 R   |   4 tone       0025AB R
  4 try_next   002F49 R   |   5 txtbgn     00001B GR  |   5 txtend     00001D GR
  4 uart1_ge   00090F GR  |   4 uart1_in   0008BA R   |   4 uart1_pu   0008FF GR
  4 uart1_qg   000908 GR  |   4 uart1_se   0008CA R   |   4 ubound     001CC1 R
  4 uflash     002ABD R   |   4 unlock_e   000684 R   |   4 unlock_f   00069F R
  4 until      002E6F R   |   4 user_int   000049 R   |   4 usr        002ADF R
  4 var_name   001198 GR  |   5 vars       000034 GR  |   4 wait       002107 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 249.
Hexadecimal [24-Bits]

Symbol Table

  4 warm_ini   00147C R   |   4 warm_sta   001710 R   |   4 words      002D3A R
  4 words_co   002D8E R   |   4 write      0029BD R   |   4 write_bl   00080A GR
  4 write_bu   000741 R   |   4 write_by   00078B R   |   4 write_ee   0007C7 R
  4 write_ex   000800 R   |   4 write_fl   0007B1 R   |   4 write_nb   00082F R
  4 xalloc     003087 R   |   4 xdrop      0030BD R   |   4 xpick      00313B R
  4 xpop       00307D R   |   4 xpush      003079 R   |   4 xput       003108 R
  4 xstack_b   0030EA R   |   2 xstack_f   001760 GR  |   2 xstack_u   00179C GR

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 250.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 SSEG       size      0   flags    8
   2 SSEG0      size    198   flags    8
   3 HOME       size     80   flags    0
   4 CODE       size   3784   flags    0
   5 DATA       size     82   flags    0
   6 BTXT       size      0   flags    8
   7 BTXT1      size      4   flags    8

