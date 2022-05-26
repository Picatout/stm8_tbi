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
                           000070    26         F_AND=(7<<4)   ; TK_AND
                           000080    27         F_OR=(8<<4)    ; TK_OR
                           000090    28         F_XOR=(9<<4)   ; TK_XOR   
                           00000F    29         NLEN_MASK=0xf  ; mask to extract name len 
                           0000F0    30         KW_TYPE_MASK=0xf0 ; mask to extract keyword type 
                                     31 
                                     32 
                           00008C    33 	STACK_SIZE=140
                           0017FF    34 	STACK_EMPTY=RAM_SIZE-1  
                           000003    35         CELL_SIZE=3
                           00003C    36         XSTACK_SIZE=CELL_SIZE*20 ; 20 * int24
                           001773    37         XSTACK_EMPTY=STACK_EMPTY-STACK_SIZE 
                           000000    38 	FRUN=0 ; flags run code in variable flags
                           000001    39 	FTRAP=1 ; inside trap handler 
                           000002    40 	FLOOP=2 ; FOR loop in preparation 
                           000003    41 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    42 	FBREAK=4 ; break point flag 
                           000005    43 	FCOMP=5  ; compiling flags 
                                     44 
                                     45 
                           000006    46         FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     47 
                           007FFF    48 	MAX_LINENO=0x7fff; BASIC maximum line number 
                                     49 
                           000008    50 	RX_QUEUE_SIZE=8 
                                     51 
                           00F424    52         TIM2_CLK_FREQ=62500
                                     53 
                           000050    54 	TIB_SIZE=80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                           000080    55         PAD_SIZE=BLOCK_SIZE 
                                     56 
                                     57 ;--------------------------------------
                                     58 ;   constantes related to Arduino 
                                     59 ;   API mapping 
                                     60 ;-------------------------------------
                           000000    61         INP=0
                           000001    62         OUTP=1 
                                     63 
                                     64 ;--------------------------------------
                                     65 ;       token attribute
                                     66 ;--------------------------------------
                                     67         ; bits 4:5 identify token group 
                                     68         ; 0x0n -> miscelinous 
                                     69         ; 0x1n -> +|- operators 
                                     70         ; 0x2n -> *|/|% operators
                                     71         ; 0x3n -> relational operators 
                           000080    72         TK_CMD=128      ; BASIC command   
                           000081    73         TK_IFUNC=129    ; BASIC integer function
                           000082    74         TK_CFUNC=130    ; BASIC character function
                           000083    75         TK_CONST=131    ; BASIC constant 
                           000084    76         TK_INTGR=132    ; 16 bits integer 
                           000085    77         TK_VAR=133
                           000086    78         TK_FLOAT=134    ; float32 
                           000087    79         TK_AND=135      ;
                           000088    80         TK_OR=136       ;
                           000089    81         TK_XOR=137      ; 
                           000000    82         TK_NONE=0       ; not a token 
                           000002    83         TK_QSTR=2       ; quoted string  
                           000003    84         TK_LABEL=3      ; used for defined, constants, variables
                           000004    85         TK_CHAR=4       ; ASCII character 
                           000005    86         TK_ARRAY=5     ; array variable '@' 
                           000006    87         TK_LPAREN=6     ; left parenthesis '('
                           000007    88         TK_RPAREN=7     ; right parenthesis ')'
                           000008    89         TK_COMMA=8     ; item separator ',' 
                           000009    90         TK_SHARP=9     ; print colon width '#' 
                           00000A    91         TK_COLON=0xa      ; command separator ':' 
                                     92         
                           000010    93         TK_PLUS=0x10    ; addition operator '+'
                           000011    94         TK_MINUS=0x11   ; subtraction operator '-'
                           000020    95         TK_MULT=0x20    ; multiplication operator '*'
                           000021    96         TK_DIV=0x21     ; division operator '/'
                           000022    97         TK_MOD=0x22     ; modulo operator '%'
                                     98 
                                     99         ; don't change these token values 
                                    100         ; values chosen to be used as a mask.
                                    101         ; bit 7   1 for dictionary words else 0 
                                    102         ; bits 6  always 0 
                                    103         ; bits 5:4 identify group 
                                    104         ; bits 3:0 token identifier inside group  
                           000031   105         TK_GT=0x31      ; relation operator '>'
                           000032   106         TK_EQUAL=0x32   ; assignment or relation operator '='
                           000033   107         TK_GE=0x33      ; relation operator '>='
                           000034   108         TK_LT=0x34      ; relation operator '<'
                           000036   109         TK_LE=0x36      ; relation operator '<='
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000035   110         TK_NE=0x35      ; relation operator '<>' not equal 
                                    111         ; token groups 
                           000030   112         TK_GRP_MASK=0x30 ; groups bits selector 
                           000000   113         TK_GRP_MISC=0x00 ; miscelinous group 
                           000010   114         TK_GRP_ADD=0x10  ; additive operators
                           000020   115         TK_GRP_MULT=0x20 ; multiplicative operators
                           000030   116         TK_GRP_RELOP=0x30 ;relational operators. 
                           000002   117         CMD_END=2 
                                    118 
                                    119 ;--------------------------------------
                                    120 ;   error codes 
                                    121 ;--------------------------------------
                           000000   122     ERR_NONE=0
                           000001   123     ERR_MEM_FULL=1 
                           000002   124     ERR_SYNTAX=2
                           000003   125     ERR_MATH_OVF=3
                           000004   126     ERR_DIV0=4 
                           000005   127     ERR_NO_LINE=5
                           000006   128     ERR_RUN_ONLY=6
                           000007   129     ERR_CMD_ONLY=7
                           000008   130     ERR_DUPLICATE=8
                           000009   131     ERR_NOT_FILE=9
                           00000A   132     ERR_BAD_VALUE=10
                           00000B   133     ERR_NO_ACCESS=11
                           00000C   134     ERR_NO_DATA=12 
                           00000D   135     ERR_NO_PROG=13
                           00000E   136     ERR_NO_FSPACE=14
                           00000F   137     ERR_BUF_FULL=15
                           000010   138     ERR_OVERFLOW=16 
                                    139 
                                    140 ;--------------------------------------
                                    141 ;   assembler flags 
                                    142 ;-------------------------------------
                                    143 ;    MATH_OVF=0 ; if 1 the stop on math overflow 
                                    144 
                                    145      .macro _usec_dly n 
                                    146     ldw x,#(16*n-2)/4
                                    147     decw x
                                    148     nop 
                                    149     jrne .-4
                                    150     .endm 
                                    151     
                                    152     ; load X register with 
                                    153     ; entry point of dictionary
                                    154     ; before calling 'search_dict'
                                    155     .macro _ldx_dict dict_name
                                    156     ldw x,#dict_name+2
                                    157     .endm 
                                    158 
                                    159     ; reset BASIC pointer
                                    160     ; to beginning of last token
                                    161     ; extracted except if it was end of line 
                                    162     .macro _unget_token 
                                    163      mov in,in.saved  
                                    164     .endm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                    165 
                                    166 
                                    167 ;---------------------------------------
                                    168 ;    xtack manipulation macros 
                                    169 ;    Y is used as xstack pointer  
                                    170 ;----------------------------------------
                                    171     ; pop in A:X from XSTACK 
                                    172     .macro _xpop 
                                    173     ld a,(y)
                                    174     ldw x,y 
                                    175     ldw x,(1,x)
                                    176     addw y,#CELL_SIZE 
                                    177     .endm 
                                    178 
                                    179     ; push A:X  to XSTACK 
                                    180     .macro _xpush 
                                    181     subw y,#CELL_SIZE
                                    182     ld (y),a 
                                    183     ldw (1,y),x 
                                    184     .endm 
                                    185 
                                    186     ; drop from XSTACK 
                                    187     .macro _xdrop 
                                    188     addw y,#CELL_SIZE 
                                    189     .endm 
                                    190 
                                    191     ; @T fetch top xstack 
                                    192     .macro _at_top
                                    193     ld a,(y)
                                    194     ldw x,y 
                                    195     ldw x,(1,x)
                                    196     .endm 
                                    197 
                                    198     ; @N  fetch next on xstack 
                                    199     .macro _at_next 
                                    200     ld a,(3,y)
                                    201     ldw x,y 
                                    202     ldw x,(4,x)
                                    203     .endm 
                                    204 
                                    205     ; !T put on top of xtack 
                                    206     .macro _store_top 
                                    207     ld (y),a 
                                    208     ldw (1,y),x     
                                    209     .endm 
                                    210 
                                    211     ; !N put next on xstack 
                                    212     .macro _store_next 
                                    213     ld (3,y),a 
                                    214     ldw (4,y),x 
                                    215     .endm 
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
                           0000C0   121     EEFREE_IDX=CONST_IDX+2 ; (121-25)*2=192
                                    122      
                                    123     ; keep these 3 at end 
                           0000FA   124     AND_IDX=250 
                           0000FC   125     OR_IDX=252 
                           0000FE   126     XOR_IDX=254    
                                    127 
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
      0080ED CC 97 C8         [ 2]  179 5$:	jp warm_start
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
      00819E CD 9D BB         [ 4]  280 	call func_eefree 
      0081A1 CD 9C F2         [ 4]  281 	call ubound 
      0081A4 CD 95 98         [ 4]  282 	call clear_basic
      0081A7 CD A5 FC         [ 4]  283 	call beep_1khz  
      0081AA CD 95 45         [ 4]  284 	call system_information
      0081AD                        285 2$:	
                                    286 ; check for application in flash memory 
      0081AD CD A8 31         [ 4]  287 	call qsign 
      0081B0 27 03            [ 1]  288 	jreq run_app
      0081B2 CC 97 C8         [ 2]  289 	jp warm_start 
      0081B5                        290 run_app:
                                    291 ; run application in FLASH|EEPROM 
      0081B5 90 CE 17 73      [ 2]  292 	ldw y,XSTACK_EMPTY
      0081B9 CD 95 76         [ 4]  293 	call warm_init
      0081BC AE B6 84         [ 2]  294 	ldw x,#app 
      0081BF CF 00 1C         [ 2]  295 	ldw txtbgn,x
      0081C2 72 BB B6 82      [ 2]  296 	addw x,app_size 
      0081C6 CF 00 1E         [ 2]  297 	ldw txtend,x 
      0081C9 AE 81 D7         [ 2]  298 	ldw x,#AUTO_RUN 
      0081CC CD 8A 21         [ 4]  299 	call puts 
      0081CF CD 9E DF         [ 4]  300 	call program_info 
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
      00837E CC 97 3E 03      [ 2]    4     addw y,#CELL_SIZE 
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
      0083CB 97 3E 00 0C      [ 1]  381     rlc acc24 
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
      0084CF 92 A6 3A         [ 1]  186 	ld acc16,a 
      0084D2 CD 89            [ 1]  187 	ld a,(9,sp) 
      0084D4 C4 A6 20         [ 1]  188 	ld acc24,a
      0084D7 CD               [ 1]  189 	clrw x  
      0084D8 89 C4            [ 1]  190 	ld a,#16
      0084DA 85 F6 5F         [ 4]  191 	call prt_acc24  
                                    192 ; print X
      0084DD 97 35 0A         [ 2]  193 	ldw x,#REG_X
      0084E0 00 0B            [ 2]  194 	ldw y,(5,sp)
      0084E2 CD 98 92         [ 4]  195 	call prt_reg16  
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
      008510 CD 98 92 CD 84         222 REG_CC:  .asciz "\nCC:"
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
      00851C 0B CD 98 92      [ 1]  237 	clr farptr 
      008520 A6 29 CD 89      [ 1]  238 	clr farptr+1 
      008524 C4 81 00 1A      [ 1]  239 	clr farptr+2  
      008526                        240 repl:
      008526 90 89            [ 1]  241 	ld a,#CR 
      008528 CD 8A 21         [ 4]  242 	call putc 
      00852B 1E 01            [ 1]  243 	ld a,#'? 
      00852D 35 10 00         [ 4]  244 	call putc
      008530 0B CD 98 92      [ 1]  245 	clr in.w 
      008534 CD 84 F9 85      [ 1]  246 	clr in 
      008538 35 0A 00         [ 4]  247 	call readln
      00853B 0B CD 98 92      [ 2]  248 	ldw y,#tib  
      00853F A6 29            [ 1]  249 	ld a,(y)
      008541 CD 89            [ 1]  250 	jreq repl  
      008543 C4 81 00 01      [ 1]  251 	inc in 
      008545 CD 18 A8         [ 4]  252 	call to_upper 
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
      008564 98 A9            [ 1]  268     cp a,#'S 
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
      008621 28 A1            [ 2]  392 	ldw x,(ADR,sp)
      008623 51               [ 1]  393 	ld a,(x)
      008624 26               [ 1]  394 	clrw x 
      008625 17               [ 1]  395 	ld xl,a 
      008626 CD 18 12         [ 4]  396 	call prt_i16 
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
      008645 CD 8F AA         [ 4]  428 	call putc 
      008648 A1 84            [ 2]  429 1$: ldw (BCNT,sp),y
      00864A 26 E9            [ 1]  430 	ld a,#16
      00864C CD 8A 21 CC      [ 2]  431 	cpw y,#16
      008650 85 FE            [ 1]  432 	jrpl 2$
      008652 90 9F            [ 1]  433 	ld a,yl
      0006C2                        434 2$: 	
      008652 A6 20 CD         [ 4]  435 	call show_row 
      008655 8F 97            [ 2]  436 	ldw y,(BCNT,sp) 
      008657 72 B9 00 01      [ 2]  437 	subw y,#16 
      00865B AE 16 B8 CD      [ 2]  438 	cpw y,#1
      00865F 94 9C            [ 1]  439 	jrpl 1$
      008661 AE 16            [ 1]  440 	ld a,(BASE,sp)
      008663 B8 CD 99         [ 1]  441 	ld base,a
      008666 34 C6            [ 1]  442 	ld a,(TABW,sp)
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
      008697 A9 85 0A 01      [ 1]   67 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
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
      0086D5 98 A9 A6         [ 2]  103 	ldw x,#tib 
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
      0086E6 CD 8F AA A1      [ 1]  129 	bres FLASH_NCR2,#FLASH_CR2_PRG
      0086EA 84 27            [ 1]  130 	clrw y 
      0086EC 03               [ 1]  131 1$:	ld a,(x)
      0086ED CC 97 3C 81      [ 1]  132 	ldf ([farptr],y),a
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
      0086FC 98 92            [ 2]  140 	popw y 
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
      008709 98 92 1E         [ 2]  155 	ldw x,#tib ; destination address 
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
      0087D7 AC               [ 1]  318 	incw x 
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
      008816 94 AC 90 85      [ 2]  391 	addw x,farptr+1 
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
      008952 CD 14 2C         [ 4]  418     call move
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
      008A20 CD 18 B4         [ 4]  592 	call atoi24
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
      008AB3 94 AC            [ 1]  672 10$: cp a,#CTRL_O
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
      008AF5 AC               [ 1]  711     ld xh,a
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
      008B8F 94 80 90 AE      [ 2]   93 	ldw acc16,y 
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
      008BB0 99 34 CE 00      [ 2]  121 	addw x,acc16  
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
      008BD4 96 0F            [ 1]  154 	jrne 0$
                                    155 ;first text line 
      008BD6 01 A6 0D         [ 2]  156 	ldw x,#2 
      008BD9 CD 89 C4 A6      [ 4]  157 	ld a,([ptr16],x)
      008BDD 3E CD            [ 1]  158 	cp a,#3
      008BDF 89 C4            [ 1]  159 	jreq insert_ln_exit
      008BE1 AE               [ 1]  160 	clrw x 
      008BE2 16               [ 1]  161 	ld xl,a
      008BE3 68 CD            [ 2]  162 	ldw (LLEN,sp),x 
      008BE5 94 80 6B         [ 2]  163 	ldw x,txtbgn
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
      008C6B FC               [ 4]  267 	ret 
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
      008D2D EA 18 A8         [ 4]  477 	call to_upper  
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
                                    497 ;   A 		TK_CMD|TK_IFUNC|TK_CFUNC|TK_AND|TK_OR|TK_XOR   
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
      008D51 94 AC            [ 1]  514 	ld a,#TK_VAR 
      008D53 90 CE            [ 2]  515 	jra 4$ 
      000EC3                        516 2$: ; check for keyword, otherwise syntax error.
      000EC3                        517 	_ldx_dict kword_dict ; dictionary entry point
      008D55 00 1E 72         [ 2]    1     ldw x,#kword_dict+2
      008D58 F2 01            [ 2]  518 	ldw y,(XFIRST,sp) ; name to search for
      008D5A 90 CF            [ 1]  519 	incw y 
      008D5C 00 1E 5B         [ 4]  520 	call search_dict
      008D5F 04               [ 1]  521 	tnz a
      008D60 81 29            [ 1]  522 	jrne 4$
                                    523 ; not in dictionary
                                    524 ; compile it as TK_LABEL
      008D61 16 01            [ 2]  525 	ldw y,(XFIRST,sp)
      008D61 52 06            [ 1]  526 	ld a,#TK_LABEL 
      008D63 1F 03            [ 1]  527 	ld (y),a 
      008D65 17 05            [ 1]  528 	incw y
      008D67 90               [ 1]  529 	ldw x,y 
      008D68 CF 00 0E         [ 4]  530 	call strlen
      008D6B 90 93            [ 1]  531 	cp a,#15 
      008D6D 72 BB            [ 2]  532 	jrule 22$ 
      008D6F 00 0E            [ 1]  533 	ld a,#15
      000EE2                        534 22$:	
      008D71 1F               [ 1]  535 	push a 
      000EE3                        536 24$:
      008D72 01 CE            [ 1]  537     ld a,(y)
      008D74 00 1E            [ 1]  538 	jreq 3$
      008D76 72 F0            [ 1]  539 	incw y
      008D78 03 CF            [ 1]  540 	dec (1,sp) 
      008D7A 00 0E            [ 1]  541 	jrne 24$
      008D7C 1E               [ 1]  542 	clr a 
      008D7D 01 CD            [ 1]  543 	ld (y),a 
      008D7F 94 AC            [ 1]  544 3$: incw y 
      000EF2                        545 	_drop 1 
      008D81 CE 00            [ 2]    1     addw sp,#1 
      008D83 1E 72            [ 1]  546 	ld a,#TK_LABEL 
      008D85 FB               [ 1]  547 	clrw x 	
      008D86 05 CF            [ 2]  548 	jra 5$ 
      000EF9                        549 4$:	
      008D88 00 1E            [ 2]  550 	ldw y,(XFIRST,sp)
      008D8A 5B 06            [ 1]  551 	cp a,#TK_AND
      008D8C 81 06            [ 1]  552 	jrmi 41$
      008D8D 90 F7            [ 1]  553 	ld (y),a 
      008D8D 52 08            [ 1]  554 	incw y 
      008D8F CE 00            [ 2]  555 	jra 5$ 
      000F05                        556 41$:	
      008D91 1E C3 00         [ 2]  557 	cpw x,#LET_IDX 
      008D94 1C 26            [ 1]  558 	jreq 5$  ; don't compile LET command 
      008D96 19 AE            [ 1]  559 	ld (y),a 
      008D98 00 02            [ 1]  560 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      008D9A 72 D6            [ 2]  561 	ldw (y),x
      008D9C 00 1A A1 03      [ 2]  562 	addw y,#2  
      000F14                        563 5$:	_drop VSIZE 
      008DA0 27 5A            [ 2]    1     addw sp,#VSIZE 
      008DA2 5F               [ 4]  564 	ret  	
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
      000F17                        575 skip:
      008DA3 97               [ 1]  576 	push a
      008DA4 1F 07 CE         [ 4]  577 1$:	ld a,([in.w],y)
      008DA7 00 1C            [ 1]  578 	jreq 2$
      008DA9 1F 01            [ 1]  579 	cp a,(C,sp)
      008DAB CE 00            [ 1]  580 	jrne 2$
      008DAD 1E 20 38 72      [ 1]  581 	inc in
      008DB1 CE 00            [ 2]  582 	jra 1$
      000F27                        583 2$: _drop 1 
      008DB3 1A 1F            [ 2]    1     addw sp,#1 
      008DB5 05               [ 4]  584 	ret
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
      000F2A                        609 get_token:: 
      000F2A                        610 	_vars VSIZE
      008DB6 AE 00            [ 2]    1     sub sp,#VSIZE 
                                    611 ;	ld a,in 
                                    612 ;	sub a,count
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                                    613 ;   jrmi 0$
                                    614 ;	clr a 
                                    615 ;	ret 
      000F2C                        616 0$: 
      008DB8 02 72 D6 00      [ 2]  617 	ldw y,#tib    	
      008DBC 1A 97            [ 1]  618 	ld a,#SPACE
      008DBE 1F 07 1E         [ 4]  619 	call skip
      008DC1 05 4F CD 8D 09   [ 1]  620 	mov in.saved,in 
      008DC6 5D 26 04         [ 4]  621 	ld a,([in.w],y)
      008DC9 17 01            [ 1]  622 	jrne 1$
      008DCB 20 05            [ 1]  623 	ldw y,x 
      008DCD 1F 01 CD         [ 2]  624 	jp token_exit ; end of line 
      008DD0 8D 34 00 01      [ 1]  625 1$:	inc in 
      008DD2 CD 18 A8         [ 4]  626 	call to_upper 
      008DD2 A6 03            [ 1]  627 	ld (TCHAR,sp),a 
                                    628 ; check for quoted string
      000F4D                        629 str_tst:  	
      000F4D                        630 	_case '"' nbr_tst
      008DD4 11 08            [ 1]    1 	ld a,#'"' 
      008DD6 27 24            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD8 1E 01            [ 1]    3 	jrne nbr_tst
      008DDA C3 00            [ 1]  631 	ld a,#TK_QSTR
      008DDC 1E               [ 1]  632 	ld (x),a 
      008DDD 27               [ 1]  633 	incw x 
      008DDE 09 1E 01         [ 4]  634 	call parse_quote
      008DE1 16 07 CD         [ 2]  635 	jp token_exit
      000F5D                        636 nbr_tst:
                                    637 ; check for hexadecimal number 
      008DE4 8D 61            [ 1]  638 	ld a,#'$'
      008DE6 20 06            [ 1]  639 	cp a,(TCHAR,sp) 
      008DE8 27 17            [ 1]  640 	jreq 1$
                                    641 ;check for binary number 
      008DE8 72 FB            [ 1]  642 	ld a,#'&
      008DEA 07 CF            [ 1]  643 	cp a,(TCHAR,sp)
      008DEC 00 1E            [ 1]  644 	jrne 0$
      008DEE 1E 07            [ 1]  645 	ld a,#TK_INTGR
      008DF0 CF               [ 1]  646 	ld (x),a 
      008DF1 00               [ 1]  647 	incw x 
      008DF2 0E 90 AE         [ 4]  648 	call parse_binary ; expect binary integer 
      008DF5 16 B8 1E         [ 2]  649 	jp token_exit 
                                    650 ; check for decimal number 	
      008DF8 01 CD            [ 1]  651 0$:	ld a,(TCHAR,sp)
      008DFA 94 AC 75         [ 4]  652 	call is_digit
      008DFC 24 0C            [ 1]  653 	jrnc 3$
      008DFC 5B 08            [ 1]  654 1$:	ld a,#TK_INTGR 
      008DFE 81               [ 1]  655 	ld (x),a 
      008DFF 5C               [ 1]  656 	incw x 
      008DFF 52 02            [ 1]  657 	ld a,(TCHAR,sp)
      008E01 4F 6B 01         [ 4]  658 	call parse_integer 
      008E04 CC 10 E6         [ 2]  659 	jp token_exit 
      000F86                        660 3$: 
      000F86                        661 	_case '(' bkslsh_tst 
      008E04 91 D6            [ 1]    1 	ld a,#'(' 
      008E06 01 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008E08 24 72            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      008E0A 5C 00            [ 1]  662 	ld a,#TK_LPAREN
      008E0C 02 6B 02         [ 2]  663 	jp token_char   	
      000F91                        664 bkslsh_tst: ; character token 
      000F91                        665 	_case '\',rparnt_tst
      008E0F A6 5C            [ 1]    1 	ld a,#'\' 
      008E11 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E13 26 0A            [ 1]    3 	jrne rparnt_tst
      008E15 0F 01            [ 1]  666 	ld a,#TK_CHAR 
      008E17 7B               [ 1]  667 	ld (x),a 
      008E18 02               [ 1]  668 	incw x 
      008E19 AD 1C F7         [ 4]  669 	ld a,([in.w],y)
      008E1C 5C               [ 1]  670 	ld (x),a 
      008E1D 20               [ 1]  671 	incw x
      008E1E E5 93            [ 1]  672 	ldw y,x 	 
      008E1F 72 5C 00 01      [ 1]  673 	inc in  
      008E1F 7B               [ 1]  674 	clrw x 
      008E20 02               [ 1]  675 	ld xl,a 
      008E21 A1 5C            [ 1]  676 	ld a,#TK_CHAR 
      008E23 27 DD A1         [ 2]  677 	jp token_exit 
      000FAD                        678 rparnt_tst:		
      000FAD                        679 	_case ')' colon_tst 
      008E26 22 27            [ 1]    1 	ld a,#')' 
      008E28 04 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2A 5C 20            [ 1]    3 	jrne colon_tst
      008E2C D7 07            [ 1]  680 	ld a,#TK_RPAREN 
      008E2D CC 10 E2         [ 2]  681 	jp token_char
      000FB8                        682 colon_tst:
      000FB8                        683 	_case ':' comma_tst 
      008E2D 7F 5C            [ 1]    1 	ld a,#':' 
      008E2F 90 93            [ 1]    2 	cp a,(TCHAR,sp) 
      008E31 5F A6            [ 1]    3 	jrne comma_tst
      008E33 02 5B            [ 1]  684 	ld a,#TK_COLON 
      008E35 02 81 E2         [ 2]  685 	jp token_char  
      008E37                        686 comma_tst:
      000FC3                        687 	_case COMMA sharp_tst 
      008E37 89 AE            [ 1]    1 	ld a,#COMMA 
      008E39 8E 4C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3B F1 27            [ 1]    3 	jrne sharp_tst
      008E3D 06 7D            [ 1]  688 	ld a,#TK_COMMA
      008E3F 27 09 5C         [ 2]  689 	jp token_char
      000FCE                        690 sharp_tst:
      000FCE                        691 	_case SHARP dash_tst 
      008E42 20 F7            [ 1]    1 	ld a,#SHARP 
      008E44 1D 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008E46 4C 9F            [ 1]    3 	jrne dash_tst
      008E48 AB 07            [ 1]  692 	ld a,#TK_SHARP
      008E4A 85 81 61         [ 2]  693 	jp token_char  	 	 
      000FD9                        694 dash_tst: 	
      000FD9                        695 	_case '-' at_tst 
      008E4D 62 74            [ 1]    1 	ld a,#'-' 
      008E4F 6E 76            [ 1]    2 	cp a,(TCHAR,sp) 
      008E51 66 72            [ 1]    3 	jrne at_tst
      008E53 00 11            [ 1]  696 	ld a,#TK_MINUS  
      008E54 CC 10 E2         [ 2]  697 	jp token_char 
      000FE4                        698 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      000FE4                        699 	_case '@' qmark_tst 
      008E54 89 4B            [ 1]    1 	ld a,#'@' 
      008E56 00 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E58 0A A1            [ 1]    3 	jrne qmark_tst
      008E5A 24 26            [ 1]  700 	ld a,#TK_ARRAY 
      008E5C 04 5B 01         [ 2]  701 	jp token_char
      000FEF                        702 qmark_tst:
      000FEF                        703 	_case '?' tick_tst 
      008E5F 4B 10            [ 1]    1 	ld a,#'?' 
      008E61 F7 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008E63 91 D6            [ 1]    3 	jrne tick_tst
      008E65 01 72            [ 1]  704 	ld a,#TK_CMD  
      008E67 5C               [ 1]  705 	ld (x),a 
      008E68 00               [ 1]  706 	incw x 
      008E69 02 CD            [ 1]  707 	ldw y,x 
      008E6B 99 28 6B         [ 2]  708 	ldw x,#PRT_IDX 
      008E6E 02 CD            [ 2]  709 	ldw (y),x 
      008E70 8E F5 25 ED      [ 2]  710 	addw y,#2
      008E74 A6 10 11         [ 2]  711 	jp token_exit
      001007                        712 tick_tst: ; comment 
      001007                        713 	_case TICK plus_tst 
      008E77 01 26            [ 1]    1 	ld a,#TICK 
      008E79 0A 7B            [ 1]    2 	cp a,(TCHAR,sp) 
      008E7B 02 A1            [ 1]    3 	jrne plus_tst
      008E7D 41 2B            [ 1]  714 	ld a,#TK_CMD
      008E7F 04               [ 1]  715 	ld (x),a 
      008E80 A1               [ 1]  716 	incw x
      008E81 47 2B DD 72      [ 2]  717 	ldw y,#REM_IDX
      008E85 5A               [ 2]  718 	ldw (x),y 
      008E86 00 02 7F         [ 2]  719 	addw x,#2  
      001019                        720 copy_comment:
      008E89 1E 03 CD 99      [ 2]  721 	ldw y,#tib 
      008E8D 34 90 93 C6      [ 2]  722 	addw y,in.w
      008E91 00 0D            [ 2]  723 	pushw y
      008E93 90 F7 72         [ 4]  724 	call strcpy
      008E96 A9 00 01         [ 2]  725     subw y,(1,sp)
      008E99 CE 00            [ 1]  726 	ld a,yl 
      008E9B 0E 90 FF         [ 1]  727 	add a,in
      008E9E 72 A9 00         [ 1]  728 	ld in,a 
      008EA1 02 A6            [ 2]  729 	ldw (1,sp),x
      008EA3 84 5B 04         [ 2]  730 	addw y,(1,sp)
      008EA6 81 5C            [ 1]  731 	incw y 
      008EA7                        732 	_drop 2 
      008EA7 4B 00            [ 2]    1     addw sp,#2 
      008EA9 4B 00 4B         [ 2]  733 	ldw x,#REM_IDX 
      008EAC 00 80            [ 1]  734 	ld a,#TK_CMD 
      008EAD CC 10 E6         [ 2]  735 	jp token_exit 
      001042                        736 plus_tst:
      001042                        737 	_case '+' star_tst 
      008EAD 91 D6            [ 1]    1 	ld a,#'+' 
      008EAF 01 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008EB1 5C 00            [ 1]    3 	jrne star_tst
      008EB3 02 A1            [ 1]  738 	ld a,#TK_PLUS  
      008EB5 30 27 06         [ 2]  739 	jp token_char 
      00104D                        740 star_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00104D                        741 	_case '*' slash_tst 
      008EB8 A1 31            [ 1]    1 	ld a,#'*' 
      008EBA 27 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008EBC 20 0B            [ 1]    3 	jrne slash_tst
      008EBE A0 30            [ 1]  742 	ld a,#TK_MULT 
      008EC0 46 09 03         [ 2]  743 	jp token_char 
      001058                        744 slash_tst: 
      001058                        745 	_case '/' prcnt_tst 
      008EC3 09 02            [ 1]    1 	ld a,#'/' 
      008EC5 09 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC7 20 E4            [ 1]    3 	jrne prcnt_tst
      008EC9 A6 21            [ 1]  746 	ld a,#TK_DIV 
      008EC9 72 5A 00         [ 2]  747 	jp token_char 
      001063                        748 prcnt_tst:
      001063                        749 	_case '%' eql_tst 
      008ECC 02 90            [ 1]    1 	ld a,#'%' 
      008ECE 93 7B            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED0 01 C7            [ 1]    3 	jrne eql_tst
      008ED2 00 0D            [ 1]  750 	ld a,#TK_MOD
      008ED4 1E 02 CF         [ 2]  751 	jp token_char  
                                    752 ; 1 or 2 character tokens 	
      00106E                        753 eql_tst:
      00106E                        754 	_case '=' gt_tst 		
      008ED7 00 0E            [ 1]    1 	ld a,#'=' 
      008ED9 90 FF            [ 1]    2 	cp a,(TCHAR,sp) 
      008EDB 72 A9            [ 1]    3 	jrne gt_tst
      008EDD 00 02            [ 1]  755 	ld a,#TK_EQUAL
      008EDF A6 84 5B         [ 2]  756 	jp token_char 
      001079                        757 gt_tst:
      001079                        758 	_case '>' lt_tst 
      008EE2 03 81            [ 1]    1 	ld a,#'>' 
      008EE4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EE4 A1 41            [ 1]    3 	jrne lt_tst
      008EE6 8C 24            [ 1]  759 	ld a,#TK_GT 
      008EE8 0B A1            [ 1]  760 	ld (ATTRIB,sp),a 
      008EEA 5B 25 07         [ 4]  761 	ld a,([in.w],y)
      008EED A1 61 8C 24      [ 1]  762 	inc in 
      008EF1 02 A1            [ 1]  763 	cp a,#'=
      008EF3 7B 81            [ 1]  764 	jrne 1$
      008EF5 A6 33            [ 1]  765 	ld a,#TK_GE 
      008EF5 A1 30            [ 2]  766 	jra token_char  
      008EF7 25 03            [ 1]  767 1$: cp a,#'<
      008EF9 A1 3A            [ 1]  768 	jrne 2$
      008EFB 8C 8C            [ 1]  769 	ld a,#TK_NE 
      008EFD 81 48            [ 2]  770 	jra token_char 
      008EFE 72 5A 00 01      [ 1]  771 2$: dec in
      008EFE CD 8E            [ 1]  772 	ld a,(ATTRIB,sp)
      008F00 F5 25            [ 2]  773 	jra token_char 	 
      0010A2                        774 lt_tst:
      0010A2                        775 	_case '<' other
      008F02 03 CD            [ 1]    1 	ld a,#'<' 
      008F04 8E E4            [ 1]    2 	cp a,(TCHAR,sp) 
      008F06 81 23            [ 1]    3 	jrne other
      008F07 A6 34            [ 1]  776 	ld a,#TK_LT 
      008F07 A1 5F            [ 1]  777 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      008F09 26 03 99         [ 4]  778 	ld a,([in.w],y)
      008F0C 20 03 CD 8E      [ 1]  779 	inc in 
      008F10 FE 81            [ 1]  780 	cp a,#'=
      008F12 26 04            [ 1]  781 	jrne 1$
      008F12 5C 36            [ 1]  782 	ld a,#TK_LE 
      008F13 20 27            [ 2]  783 	jra token_char 
      008F13 CD 99            [ 1]  784 1$: cp a,#'>
      008F15 28 F7            [ 1]  785 	jrne 2$
      008F17 5C 91            [ 1]  786 	ld a,#TK_NE 
      008F19 D6 01            [ 2]  787 	jra token_char 
      008F1B 72 5C 00 02      [ 1]  788 2$: dec in 
      008F1F CD 8F            [ 1]  789 	ld a,(ATTRIB,sp)
      008F21 07 25            [ 2]  790 	jra token_char 	
      0010CB                        791 other: ; not a special character 	 
      008F23 EF 7F            [ 1]  792 	ld a,(TCHAR,sp)
      008F25 72 5A 00         [ 4]  793 	call is_alpha 
      008F28 02 81            [ 1]  794 	jrc 30$ 
      008F2A CC 16 BC         [ 2]  795 	jp syntax_error 
      0010D5                        796 30$: 
      008F2A 89 CD 8F         [ 4]  797 	call parse_keyword
      008F2D 12 1E 01         [ 2]  798 	cpw x,#remark 
      008F30 E6 02            [ 1]  799 	jrne token_exit 
      008F32 26 0F            [ 1]  800 	ldw y,x 
      008F34 E6 01 A0         [ 2]  801 	jp copy_comment 
      0010E2                        802 token_char:
      008F37 41               [ 1]  803 	ld (x),a 
      008F38 AE               [ 1]  804 	incw x
      008F39 00 03            [ 1]  805 	ldw y,x 
      0010E6                        806 token_exit:
      0010E6                        807 	_drop VSIZE 
      008F3B 42 1C            [ 2]    1     addw sp,#VSIZE 
      008F3D 00               [ 4]  808 	ret
                                    809 
                                    810 
                                    811 ;-----------------------------------
                                    812 ; create token list fromm text line 
                                    813 ; save this list in pad buffer 
                                    814 ;  compiled line format: 
                                    815 ;    line_no  2 bytes {0...32767}
                                    816 ;    count    1 byte  
                                    817 ;    tokens   variable length 
                                    818 ;   
                                    819 ; input:
                                    820 ;   none
                                    821 ; modified variables:
                                    822 ;   basicptr     token list buffer address 
                                    823 ;   in.w  		 3|count, i.e. index in buffer
                                    824 ;   count        length of line | 0  
                                    825 ;-----------------------------------
                           000001   826 	XSAVE=1
                           000002   827 	VSIZE=2
      0010E9                        828 compile::
      008F3E 31 A6            [ 2]  829 	pushw y 
      0010EB                        830 	_vars VSIZE 
      008F40 85 20            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      008F42 36 00 1B 00 04   [ 1]  831 	mov basicptr,txtbgn
      008F43 72 1A 00 22      [ 1]  832 	bset flags,#FCOMP 
      008F43 AE B3            [ 1]  833 	ld a,#0
      008F45 C3 16 01         [ 2]  834 	ldw x,#0
      008F48 90 5C CD         [ 2]  835 	ldw pad,x ; destination buffer 
      008F4B 99 9E 4D         [ 1]  836 	ld pad+2,a ; count 
      008F4E 26 29 16         [ 2]  837 	ldw x,#pad+3
      008F51 01 A6 03 90      [ 1]  838 	clr in 
      008F55 F7 90 5C         [ 4]  839 	call get_token
      008F58 93 CD            [ 1]  840 	cp a,#TK_INTGR
      008F5A 94 80            [ 1]  841 	jrne 2$
      008F5C A1 0F 23         [ 2]  842 	cpw x,#1 
      008F5F 02 A6            [ 1]  843 	jrpl 1$
      008F61 0F 0A            [ 1]  844 	ld a,#ERR_BAD_VALUE
      008F62 CC 16 BE         [ 2]  845 	jp tb_error
      008F62 88 16 B8         [ 2]  846 1$:	ldw pad,x 
      008F63 90 AE 16 BB      [ 2]  847 	ldw y,#pad+3 
      008F63 90 F6 27 09      [ 2]  848 2$:	cpw y,#stack_full 
      008F67 90 5C            [ 1]  849 	jrult 3$
      008F69 0A 01            [ 1]  850 	ld a,#ERR_BUF_FULL 
      008F6B 26 F6 4F         [ 2]  851 	jp tb_error 
      00112B                        852 3$:	
      008F6E 90               [ 1]  853 	ldw x,y 
      008F6F F7 90 5C         [ 4]  854 	call get_token 
      008F72 5B 01            [ 1]  855 	cp a,#TK_NONE 
      008F74 A6 03            [ 1]  856 	jrne 2$ 
                                    857 ; compilation completed  
      008F76 5F 20 1B B8      [ 2]  858 	subw y,#pad
      008F79 90 9F            [ 1]  859     ld a,yl
      008F79 16 01 A1         [ 2]  860 	ldw x,#pad 
      008F7C 87 2B 06         [ 2]  861 	ldw ptr16,x 
      008F7F 90 F7            [ 1]  862 	ld (2,x),a 
      008F81 90               [ 2]  863 	ldw x,(x)
      008F82 5C 20            [ 1]  864 	jreq 10$
      008F84 0F 0D 0D         [ 4]  865 	call insert_line
      008F85 72 5F 00 03      [ 1]  866 	clr  count 
      008F85 A3 00            [ 2]  867 	jra  11$ 
      00114D                        868 10$: ; line# is zero 
      008F87 4C 27 0A         [ 2]  869 	ldw x,ptr16  
      008F8A 90 F7 90         [ 2]  870 	ldw basicptr,x 
      008F8D 5C 90            [ 1]  871 	ld a,(2,x)
      008F8F FF 72 A9         [ 1]  872 	ld count,a 
      008F92 00 02 5B 02      [ 1]  873 	mov in,#3 
      00115C                        874 11$:
      00115C                        875 	_drop VSIZE 
      008F96 81 02            [ 2]    1     addw sp,#VSIZE 
      008F97 72 1B 00 22      [ 1]  876 	bres flags,#FCOMP 
      008F97 88 91            [ 2]  877 	popw y 
      008F99 D6               [ 4]  878 	ret 
                                    879 
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
      001165                         48 cpy_cmd_name:
      008F9A 01               [ 2]   49 	tnzw x 
      008F9B 27 0A            [ 1]   50 	jreq 10$
      008F9D 11               [ 1]   51 	ld a,(x)
      008F9E 01               [ 1]   52 	incw x
      008F9F 26 06            [ 1]   53 	and a,#15  
      008FA1 72               [ 1]   54 	push a 
      008FA2 5C 00            [ 1]   55     tnz (1,sp) 
      008FA4 02 20            [ 1]   56 	jreq 9$
      008FA6 F1               [ 1]   57 1$:	ld a,(x)
      008FA7 5B 01            [ 1]   58 	ld (y),a  
      008FA9 81               [ 1]   59 	incw x
      008FAA 90 5C            [ 1]   60 	incw y 
      008FAA 52 02            [ 1]   61 	dec (1,sp)	 
      008FAC 26 F6            [ 1]   62 	jrne 1$
      008FAC 90               [ 1]   63 9$: pop a 
      00117C                         64 10$: 
      008FAD AE               [ 4]   65 	ret	
                                     66 
                                     67 ;--------------------------
                                     68 ; add a space after letter or 
                                     69 ; digit.
                                     70 ; input:
                                     71 ;   Y     pointer to buffer 
                                     72 ; output:
                                     73 ;   Y    moved to end 
                                     74 ;--------------------------
      00117D                         75 add_space:
      008FAE 16 68            [ 2]   76 	decw y 
      008FB0 A6 20            [ 1]   77 	ld a,(y)
      008FB2 CD 8F            [ 1]   78 	incw y
      008FB4 97 55            [ 1]   79 	cp a,#') 
      008FB6 00 02            [ 1]   80 	jreq 0$
      008FB8 00 03 91         [ 4]   81 	call is_alnum 
      008FBB D6 01            [ 1]   82 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      00118C                         83 0$: 
      008FBD 26 05            [ 1]   84 	ld a,#SPACE 
      008FBF 90 93            [ 1]   85 	ld (y),a 
      008FC1 CC 91            [ 1]   86 	incw y 
      008FC3 66               [ 4]   87 1$: ret 
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
      001193                         99 right_align::
      008FC4 72               [ 1]  100 	push a 
      008FC5 5C 00            [ 1]  101 0$: ld a,(1,sp)
      008FC7 02 CD 99         [ 1]  102 	cp a,tab_width 
      008FCA 28 6B            [ 1]  103 	jrpl 1$
      008FCC 01 20            [ 1]  104 	ld a,#SPACE 
      008FCD 5A               [ 2]  105 	decw x
      008FCD A6               [ 1]  106 	ld (x),a  
      008FCE 22 11            [ 1]  107 	inc (1,sp)
      008FD0 01 26            [ 2]  108 	jra 0$ 
      008FD2 0A               [ 1]  109 1$: pop a 	
      008FD3 A6               [ 4]  110 	ret 
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
      0011A5                        123 cpy_quote:
      008FD4 02 F7            [ 1]  124 	ld a,#'"
      008FD6 5C CD            [ 1]  125 	ld (y),a 
      008FD8 8D FF            [ 1]  126 	incw y 
      008FDA CC               [ 2]  127 	pushw x 
      008FDB 91 66 E3         [ 4]  128 	call skip_string 
      008FDD 85               [ 2]  129 	popw x 
      008FDD A6               [ 1]  130 1$:	ld a,(x)
      008FDE 24 11            [ 1]  131 	jreq 9$
      008FE0 01               [ 1]  132 	incw x 
      008FE1 27 17            [ 1]  133 	cp a,#SPACE 
      008FE3 A6 26            [ 1]  134 	jrult 3$
      008FE5 11 01            [ 1]  135 	ld (y),a
      008FE7 26 0A            [ 1]  136 	incw y 
      008FE9 A6 84            [ 1]  137 	cp a,#'\ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      008FEB F7 5C            [ 1]  138 	jrne 1$ 
      0011C0                        139 2$:
      008FED CD 8E            [ 1]  140 	ld (y),a
      008FEF A7 CC            [ 1]  141 	incw y  
      008FF1 91 66            [ 2]  142 	jra 1$
      008FF3 7B               [ 1]  143 3$: push a 
      008FF4 01 CD            [ 1]  144 	ld a,#'\
      008FF6 8E F5            [ 1]  145 	ld (y),a 
      008FF8 24 0C            [ 1]  146 	incw y  
      008FFA A6               [ 1]  147 	pop a 
      008FFB 84 F7            [ 1]  148 	sub a,#7
      008FFD 5C 7B 01         [ 1]  149 	ld acc8,a 
      009000 CD 8E 54 CC      [ 1]  150 	clr acc16
      009004 91               [ 2]  151 	pushw x
      009005 66 0D CC         [ 2]  152 	ldw x,#escaped 
      009006 72 BB 00 0D      [ 2]  153 	addw x,acc16 
      009006 A6               [ 1]  154 	ld a,(x)
      009007 28               [ 2]  155 	popw x
      009008 11 01            [ 2]  156 	jra 2$
      00900A 26 05            [ 1]  157 9$: ld a,#'"
      00900C A6 06            [ 1]  158 	ld (y),a 
      00900E CC 91            [ 1]  159 	incw y  
      009010 62               [ 1]  160 	incw x 
      009011 81               [ 4]  161 	ret
                                    162 
                                    163 ;--------------------------
                                    164 ; return variable name 
                                    165 ; from its address.
                                    166 ; input:
                                    167 ;   X    variable address
                                    168 ; output:
                                    169 ;   A     variable letter
                                    170 ;--------------------------
      0011EB                        171 var_name::
      009011 A6 5C 11         [ 2]  172 		subw x,#vars 
      009014 01 26            [ 1]  173 		ld a,#3
      009016 16               [ 2]  174 		div x,a 
      009017 A6               [ 1]  175 		ld a,xl 
      009018 04 F7            [ 1]  176 		add a,#'A 
      00901A 5C               [ 4]  177 		ret 
                                    178 
                                    179 ;-----------------------------
                                    180 ; return cmd  idx from its 
                                    181 ; code address 
                                    182 ; input:
                                    183 ;   X      code address 
                                    184 ; output:
                                    185 ;   X      cmd_idx
                                    186 ;-----------------------------
      0011F5                        187 get_cmd_idx:
      00901B 91 D6            [ 2]  188 	pushw y
      00901D 01 F7 5C 90      [ 2]  189 	ldw y,#code_addr 
      009021 93 72 5C 00      [ 2]  190 	ldw ptr16,y 
      009025 02 5F            [ 1]  191 	clrw y 
      009027 97 A6 04         [ 5]  192 1$:	cpw x,([ptr16],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00902A CC 91            [ 1]  193 	jreq 3$ 
      00902C 66 5C            [ 1]  194 	incw y 
      00902D 91 D6 19         [ 4]  195 	ld a,([ptr16],y)
      00902D A6 29            [ 1]  196 	incw y
      00902F 11 01 26         [ 4]  197 	or a,([ptr16],y)	
      009032 05 A6            [ 1]  198 	jrne 1$
      009034 07               [ 1]  199 3$: ldw x,y 
      009035 CC 91            [ 2]  200 	popw y 
      009037 62               [ 4]  201 	ret
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
      009038                        218 decompile::
      001216                        219 	_vars VSIZE
      009038 A6 3A            [ 2]    1     sub sp,#VSIZE 
      00903A 11 01 26         [ 1]  220 	ld a,base
      00903D 05 A6            [ 1]  221 	ld (BASE_SAV,sp),a  
      00903F 0A CC 91         [ 1]  222 	ld a,tab_width 
      009042 62 02            [ 1]  223 	ld (WIDTH_SAV,sp),a 
      009043 17 03            [ 2]  224 	ldw (STR,sp),y   
      009043 A6 2C 11 01      [ 5]  225 	ldw x,[basicptr] ; line number 
      009047 26 05 A6 08      [ 1]  226 	mov base,#10
      00904B CC 91 62 23      [ 1]  227 	mov tab_width,#5
      00904E 72 5F 00 0C      [ 1]  228 	clr acc24 
      00904E A6 23 11         [ 2]  229 	ldw acc16,x
      009051 01               [ 1]  230 	clr a ; unsigned conversion 
      009052 26 05 A6         [ 4]  231 	call itoa  
      009055 09 CC 91         [ 4]  232 	call right_align 
      009058 62               [ 1]  233 	push a 
      009059 90 93            [ 1]  234 1$:	ldw y,x ; source
      009059 A6 2D            [ 2]  235 	ldw x,(STR+1,sp) ; destination
      00905B 11 01 26         [ 4]  236 	call strcpy 
      00905E 05 A6            [ 1]  237 	clrw y 
      009060 11               [ 1]  238 	pop a 
      009061 CC 91            [ 1]  239 	ld yl,a 
      009063 62 F9 03         [ 2]  240 	addw y,(STR,sp)
      009064 A6 20            [ 1]  241 	ld a,#SPACE 
      009064 A6 40            [ 1]  242 	ld (y),a 
      009066 11 01            [ 1]  243 	incw y 
      009068 26 05 A6 05      [ 1]  244 	clr tab_width
      00906C CC 91 62         [ 2]  245 	ldw x,#3
      00906F CF 00 00         [ 2]  246 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00125E                        247 decomp_loop:
      00906F A6 3F            [ 2]  248 	pushw y
      009071 11 01 26         [ 4]  249 	call next_token 
      009074 12 A6            [ 2]  250 	popw y 
      009076 80               [ 1]  251 	tnz a  
      009077 F7 5C            [ 1]  252 	jrne 1$
      009079 90 93 AE         [ 2]  253 	jp 20$
      00907C 00 6A            [ 1]  254 1$:	jrmi 2$
      00907E 90 FF 72         [ 2]  255 	jp 6$
      001270                        256 2$: ;; TK_CMD|TK_IFUNC|TK_CFUNC|TK_CONST|TK_VAR|TK_INTGR|TK_AND|TK_OR|TK_XOR 
      009081 A9 00            [ 1]  257 	cp a,#TK_VAR 
      009083 02 CC            [ 1]  258 	jrne 3$
                                    259 ;; TK_VAR 
      009085 91 66 7D         [ 4]  260 	call add_space
      009087 CD 17 F2         [ 4]  261 	call get_addr   
      009087 A6 27 11         [ 4]  262 	call var_name
      00908A 01 26            [ 1]  263 	ld (y),a 
      00908C 35 A6            [ 1]  264 	incw y  
      00908E 80 F7            [ 2]  265 	jra decomp_loop
      001283                        266 3$:
      009090 5C 90            [ 1]  267 	cp a,#TK_INTGR
      009092 AE 00            [ 1]  268 	jrne 4$
                                    269 ;; TK_INTGR
      009094 84 FF 1C         [ 4]  270 	call get_int24 
      009097 00 02 0C         [ 1]  271 	ld acc24,a 
      009099 CF 00 0D         [ 2]  272 	ldw acc16,x 
      009099 90 AE 16         [ 4]  273 	call add_space
      00909C 68 72            [ 2]  274 	pushw y 
      00909E B9 00            [ 1]  275 	ld a,#255 ; signed conversion 
      0090A0 01 90 89         [ 4]  276 	call itoa  
      0090A3 CD 94            [ 2]  277 	ldw y,(1,sp) 
      0090A5 9C               [ 1]  278 	push a 
      0090A6 72               [ 1]  279 	exgw x,y 
      0090A7 F2 01 90         [ 4]  280 	call strcpy 
      0090AA 9F CB            [ 1]  281 	clrw y
      0090AC 00               [ 1]  282 	pop a  
      0090AD 02 C7            [ 1]  283 	ld yl,a 
      0090AF 00 02 1F         [ 2]  284 	addw y,(1,sp)
      0012A9                        285 	_drop 2 
      0090B2 01 72            [ 2]    1     addw sp,#2 
      0090B4 F9 01            [ 2]  286 	jra decomp_loop
      0012AD                        287 4$: ; dictionary keyword
      0090B6 90 5C            [ 1]  288 	cp a,#TK_AND 
      0090B8 5B 02            [ 1]  289 	jruge 50$ 
      0090BA AE               [ 2]  290 	ldw x,(x)
      0090BB 00 84 A6 80      [ 1]  291 	inc in 
      0090BF CC 91 66 01      [ 1]  292 	inc in 
      0090C2 A3 00 84         [ 2]  293 	cpw x,#REM_IDX
      0090C2 A6 2B            [ 1]  294 	jrne 5$
      0090C4 11 01 26         [ 2]  295 	ldw x,basicptr 
                                    296 ; copy comment to buffer 
      0090C7 05 A6 10         [ 4]  297 	call add_space
      0090CA CC 91            [ 1]  298 	ld a,#''
      0090CC 62 F7            [ 1]  299 	ld (y),a 
      0090CD 90 5C            [ 1]  300 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      0012CB                        301 46$:
      0090CD A6 2A 11 01      [ 4]  302 	ld a,([in.w],x)
      0090D1 26 05 A6 20      [ 1]  303 	inc in  
      0090D5 CC 91            [ 1]  304 	ld (y),a 
      0090D7 62 5C            [ 1]  305 	incw y 
      0090D8 C6 00 01         [ 1]  306 	ld a,in 
      0090D8 A6 2F 11         [ 1]  307 	cp a,count 
      0090DB 01 26            [ 1]  308 	jrmi 46$
      0090DD 05 A6 21         [ 2]  309 	jp 20$  
      0090E0 CC 91 62         [ 2]  310 5$: cpw x,#LET_IDX 
      0090E3 26 0B            [ 1]  311 	jrne 54$
      0090E3 A6 25 11         [ 2]  312 	jp decomp_loop ; down display LET 	
      0012EA                        313 50$:
      0090E6 01               [ 1]  314 	clrw x 
      0090E7 26 05            [ 1]  315 	sub a,#TK_AND 
      0090E9 A6               [ 1]  316 	sll a 
      0090EA 22               [ 1]  317 	ld xl,a 
      0090EB CC 91 62         [ 2]  318 	addw x,#AND_IDX
      0090EE                        319 54$: ; insert command name 
      0090EE A6 3D 11         [ 4]  320 	call add_space  
      0090F1 01 26            [ 2]  321 	pushw y
      0090F3 05 A6 32         [ 4]  322 	call cmd_name
      0090F6 CC 91            [ 2]  323 	popw y 
      0090F8 62 11 65         [ 4]  324 	call cpy_cmd_name
      0090F9 CC 12 5E         [ 2]  325 	jp decomp_loop 
      001302                        326 6$:
                                    327 ; label?
      0090F9 A6 3E            [ 1]  328 	cp a,#TK_LABEL 
      0090FB 11 01            [ 1]  329 	jrne 64$
                                    330 ; copy label string to output buffer   	
      0090FD 26 23            [ 1]  331 	ld a,#32 
      0090FF A6 31            [ 1]  332 	ld (y),a 
      009101 6B 02            [ 1]  333 	incw y 
      00130C                        334 61$:
      009103 91               [ 2]  335 	pushw x 
      009104 D6 01 72         [ 4]  336 	call skip_string 
      009107 5C               [ 2]  337 	popw x 
      001311                        338 62$:	
      009108 00               [ 1]  339 	ld a,(x)
      009109 02 A1            [ 1]  340 	jreq 63$ 
      00910B 3D               [ 1]  341 	incw x  
      00910C 26 04            [ 1]  342 	ld (y),a 
      00910E A6 33            [ 1]  343 	incw y 
      009110 20 50            [ 2]  344 	jra 62$ 
      00131B                        345 63$: 
      009112 A1 3C            [ 1]  346 	ld a,#32 
      009114 26 04            [ 1]  347 	ld (y),a 
      009116 A6 35            [ 1]  348 	incw y 
      009118 20 48 72         [ 2]  349 	jp decomp_loop
      001324                        350 64$:
      00911B 5A 00            [ 1]  351 	cp a,#TK_QSTR 
      00911D 02 7B            [ 1]  352 	jrne 7$
                                    353 ;; TK_QSTR
      00911F 02 20 40         [ 4]  354 	call add_space
      009122 CD 11 A5         [ 4]  355 	call cpy_quote  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



      009122 A6 3C 11         [ 2]  356 	jp decomp_loop
      001331                        357 7$:
      009125 01 26            [ 1]  358 	cp a,#TK_CHAR 
      009127 23 A6            [ 1]  359 	jrne 8$
                                    360 ;; TK_CHAR
      009129 34 6B 02         [ 4]  361 	call add_space 
      00912C 91 D6            [ 1]  362 	ld a,#'\ 
      00912E 01 72            [ 1]  363 	ld (y),a 
      009130 5C 00            [ 1]  364 	incw y
      009132 02               [ 1]  365 	ld a,(x)
      009133 A1 3D 26 04      [ 1]  366 	inc in  
      009137 A6 36            [ 2]  367 	jra 81$
      009139 20 27            [ 1]  368 8$: cp a,#TK_COLON 
      00913B A1 3E            [ 1]  369 	jrne 9$
      00913D 26 04            [ 1]  370 	ld a,#':
      00134B                        371 81$:
      00913F A6 35            [ 1]  372 	ld (y),a 
      009141 20 1F            [ 1]  373 	incw y 
      00134F                        374 82$:
      009143 72 5A 00         [ 2]  375 	jp decomp_loop
      001352                        376 9$: 
      009146 02 7B            [ 1]  377 	cp a,#TK_SHARP
      009148 02 20            [ 1]  378 	jrugt 10$ 
      00914A 17 05            [ 1]  379 	sub a,#TK_ARRAY 
      00914B 5F               [ 1]  380 	clrw x 
      00914B 7B               [ 1]  381 	ld xl,a
      00914C 01 CD 8E         [ 2]  382 	addw x,#single_char 
      00914F E4               [ 1]  383 	ld a,(x)
      009150 25 03            [ 2]  384 	jra 81$ 
      001360                        385 10$: 
      009152 CC 97            [ 1]  386 	cp a,#TK_MINUS 
      009154 3C 0A            [ 1]  387 	jrugt 11$
      009155 A0 10            [ 1]  388 	sub a,#TK_PLUS 
      009155 CD               [ 1]  389 	clrw x 
      009156 8F               [ 1]  390 	ld xl,a 
      009157 2A A3 A1         [ 2]  391 	addw x,#add_char 
      00915A B5               [ 1]  392 	ld a,(x)
      00915B 26 09            [ 2]  393 	jra 81$
      00136E                        394 11$:
      00915D 90 93            [ 1]  395     cp a,#TK_MOD 
      00915F CC 90            [ 1]  396 	jrugt 12$
      009161 99 20            [ 1]  397 	sub a,#TK_MULT
      009162 5F               [ 1]  398 	clrw x 
      009162 F7               [ 1]  399 	ld xl,a 
      009163 5C 90 93         [ 2]  400 	addw x,#mul_char
      009166 F6               [ 1]  401 	ld a,(x)
      009166 5B 02            [ 2]  402 	jra 81$
      00137C                        403 12$:
      009168 81 31            [ 1]  404 	sub a,#TK_GT  
      009169 48               [ 1]  405 	sll a 
      009169 90               [ 1]  406 	clrw x 
      00916A 89               [ 1]  407 	ld xl,a 
      00916B 52 02 55         [ 2]  408 	addw x,#relop_str 
      00916E 00               [ 2]  409 	ldw x,(x)
      00916F 1C               [ 1]  410 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      009170 00               [ 1]  411 	incw x 
      009171 05 72            [ 1]  412 	ld (y),a
      009173 1A 00            [ 1]  413 	incw y 
      009175 23               [ 1]  414 	ld a,(x)
      009176 A6 00            [ 1]  415 	jrne 81$
      009178 AE 00 00         [ 2]  416 	jp decomp_loop 
      001391                        417 20$: 
      00917B CF 16            [ 1]  418 	clr (y)
      00917D B8 C7            [ 2]  419 	ldw x,(STR,sp)
      00917F 16 BA            [ 1]  420 	ld a,(BASE_SAV,sp)
      009181 AE 16 BB         [ 1]  421 	ld base,a 
      009184 72 5F            [ 1]  422 	ld a,(WIDTH_SAV,sp)
      009186 00 02 CD         [ 1]  423 	ld tab_width,a
      009189 8F AA A1         [ 2]  424 	subw y,(STR,sp) 
      00918C 84 26            [ 1]  425 	ld a,yl 
      0013A4                        426 	_drop VSIZE 
      00918E 11 A3            [ 2]    1     addw sp,#VSIZE 
      009190 00               [ 4]  427 	ret 
                                    428 
      009191 01 2A 05 A6 0A         429 single_char: .byte '@','(',')',',','#'
      009196 CC 97                  430 add_char: .byte '+','-'
      009198 3E CF 16               431 mul_char: .byte '*','/','%'
      00919B B8 90 AE 16 BB 90 A3   432 relop_str: .word gt,equal,ge,lt,le,ne 
             17 74 25 05 A6
      0091A7 0F CC                  433 gt: .asciz ">"
      0091A9 97 3E                  434 equal: .asciz "="
      0091AB 3E 3D 00               435 ge: .asciz ">="
      0091AB 93 CD                  436 lt: .asciz "<"
      0091AD 8F AA A1               437 le: .asciz "<="
      0091B0 00 26 ED               438 ne:  .asciz "<>"
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
      0013CC                        451 cmd_name:
      0013CC                        452 	_vars VSIZE 
      0091B3 72 A2            [ 2]    1     sub sp,#VSIZE 
      0091B5 16 B8 90 9F      [ 1]  453 	clr acc16 
      0091B9 AE 16            [ 2]  454 	ldw (CMDX,sp),x  
      0091BB B8 CF 00         [ 2]  455 	ldw x,#kword_dict	
      0091BE 1A E7            [ 2]  456 1$:	ldw (LINK,sp),x
      0091C0 02 FE            [ 1]  457 	ld a,(2,x)
      0091C2 27 09            [ 1]  458 	and a,#15 
      0091C4 CD 8D 8D         [ 1]  459 	ld acc8,a 
      0091C7 72 5F 00         [ 2]  460 	addw x,#3
      0091CA 04 20 0F 0D      [ 2]  461 	addw x,acc16
      0091CD FE               [ 2]  462 	ldw x,(x) ; command index  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      0091CD CE 00            [ 2]  463 	cpw x,(CMDX,sp)
      0091CF 1A CF            [ 1]  464 	jreq 2$
      0091D1 00 05            [ 2]  465 	ldw x,(LINK,sp)
      0091D3 E6               [ 2]  466 	ldw x,(x) 
      0091D4 02 C7 00         [ 2]  467 	subw x,#2  
      0091D7 04 35            [ 1]  468 	jrne 1$
      0091D9 03               [ 1]  469 	clr a 
      0091DA 00               [ 1]  470 	clrw x 
      0091DB 02 05            [ 2]  471 	jra 9$
      0091DC 1E 03            [ 2]  472 2$: ldw x,(LINK,sp)
      0091DC 5B 02 72         [ 2]  473 	addw x,#2 	
      0013FD                        474 9$:	_drop VSIZE
      0091DF 1B 00            [ 2]    1     addw sp,#VSIZE 
      0091E1 23               [ 4]  475 	ret
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
      001400                        116 strlen::
      0091E2 90               [ 2]  117 	pushw x 
      0091E3 85               [ 1]  118 	clr a
      0091E4 81               [ 1]  119 1$:	tnz (x) 
      0091E5 27 04            [ 1]  120 	jreq 9$ 
      0091E5 5D               [ 1]  121 	inc a 
      0091E6 27               [ 1]  122 	incw x 
      0091E7 14 F6            [ 2]  123 	jra 1$ 
      0091E9 5C               [ 2]  124 9$:	popw x 
      0091EA A4               [ 4]  125 	ret 
                                    126 
                                    127 ;------------------------------------
                                    128 ; compare 2 strings
                                    129 ; input:
                                    130 ;   X 		char* first string 
                                    131 ;   Y       char* second string 
                                    132 ; output:
                                    133 ;   A 		0 not == |1 ==  
                                    134 ;-------------------------------------
      00140B                        135 strcmp:
      0091EB 0F               [ 1]  136 	ld a,(x)
      0091EC 88 0D            [ 1]  137 	jreq 5$ 
      0091EE 01 27            [ 1]  138 	cp a,(y) 
      0091F0 0A F6            [ 1]  139 	jrne 4$ 
      0091F2 90               [ 1]  140 	incw x 
      0091F3 F7 5C            [ 1]  141 	incw y 
      0091F5 90 5C            [ 2]  142 	jra strcmp 
      001417                        143 4$: ; not same  
      0091F7 0A               [ 1]  144 	clr a 
      0091F8 01               [ 4]  145 	ret 
      001419                        146 5$: ; same 
      0091F9 26 F6            [ 1]  147 	ld a,#1 
      0091FB 84               [ 4]  148 	ret 
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
      0091FC                        159 strcpy::
      0091FC 81               [ 1]  160 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      0091FD 89               [ 2]  161 	pushw x 
      0091FD 90 5A            [ 1]  162 1$: ld a,(y)
      0091FF 90 F6            [ 1]  163 	jreq 9$ 
      009201 90               [ 1]  164 	ld (x),a 
      009202 5C               [ 1]  165 	incw x 
      009203 A1 29            [ 1]  166 	incw y 
      009205 27 05            [ 2]  167 	jra 1$ 
      009207 CD               [ 1]  168 9$:	clr (x)
      009208 8E               [ 2]  169 	popw x 
      009209 FE               [ 1]  170 	pop a 
      00920A 24               [ 4]  171 	ret 
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
      00142C                        185 move::
      00920B 06               [ 1]  186 	push a 
      00920C                        187 	_vars VSIZE 
      00920C A6 20            [ 2]    1     sub sp,#VSIZE 
      00920E 90 F7            [ 1]  188 	clr (INCR,sp)
      009210 90 5C            [ 1]  189 	clr (LB,sp)
      009212 81 89            [ 2]  190 	pushw y 
      009213 13 01            [ 2]  191 	cpw x,(1,sp) ; compare DEST to SRC 
      009213 88 7B            [ 2]  192 	popw y 
      009215 01 C1            [ 1]  193 	jreq move_exit ; x==y 
      009217 00 24            [ 1]  194 	jrmi move_down
      00143D                        195 move_up: ; start from top address with incr=-1
      009219 2A 08 A6 20      [ 2]  196 	addw x,acc16
      00921D 5A F7 0C 01      [ 2]  197 	addw y,acc16
      009221 20 F1            [ 1]  198 	cpl (INCR,sp)
      009223 84 81            [ 1]  199 	cpl (LB,sp)   ; increment = -1 
      009225 20 05            [ 2]  200 	jra move_loop  
      00144B                        201 move_down: ; start from bottom address with incr=1 
      009225 A6               [ 2]  202     decw x 
      009226 22 90            [ 2]  203 	decw y
      009228 F7 90            [ 1]  204 	inc (LB,sp) ; incr=1 
      001450                        205 move_loop:	
      00922A 5C 89 CD         [ 1]  206     ld a, acc16 
      00922D 98 63 85         [ 1]  207 	or a, acc8
      009230 F6 27            [ 1]  208 	jreq move_exit 
      009232 30 5C A1         [ 2]  209 	addw x,(INCR,sp)
      009235 20 25 0E         [ 2]  210 	addw y,(INCR,sp) 
      009238 90 F7            [ 1]  211 	ld a,(y)
      00923A 90               [ 1]  212 	ld (x),a 
      00923B 5C               [ 2]  213 	pushw x 
      00923C A1 5C 26         [ 2]  214 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]



      00923F F0               [ 2]  215 	decw x 
      009240 CF 00 0D         [ 2]  216 	ldw acc16,x 
      009240 90               [ 2]  217 	popw x 
      009241 F7 90            [ 2]  218 	jra move_loop
      00146C                        219 move_exit:
      00146C                        220 	_drop VSIZE
      009243 5C 20            [ 2]    1     addw sp,#VSIZE 
      009245 EA               [ 1]  221 	pop a 
      009246 88               [ 4]  222 	ret 	
                                    223 
                                    224 ;------------------------------------
                                    225 ;  set all variables to zero 
                                    226 ; input:
                                    227 ;   none 
                                    228 ; output:
                                    229 ;	none
                                    230 ;------------------------------------
      001470                        231 clear_vars:
      009247 A6               [ 2]  232 	pushw x 
      009248 5C               [ 1]  233 	push a  
      009249 90 F7 90         [ 2]  234 	ldw x,#vars 
      00924C 5C 84            [ 1]  235 	ld a,#CELL_SIZE*26 
      00924E A0               [ 1]  236 1$:	clr (x)
      00924F 07               [ 1]  237 	incw x 
      009250 C7               [ 1]  238 	dec a 
      009251 00 0F            [ 1]  239 	jrne 1$
      009253 72               [ 1]  240 	pop a 
      009254 5F               [ 2]  241 	popw x 
      009255 00               [ 4]  242 	ret 
                                    243 
                                    244 
                                    245 ;-----------------------
                                    246 ;  display system 
                                    247 ;  information 
                                    248 ;-----------------------
                           000002   249 	MAJOR=2
                           000000   250 	MINOR=0 
      009256 0E 89 AE 8E 4C 72 BB   251 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2022\nversion "
             00 0E F6 85 20 DD A6
             22 90 F7 90 5C 5C 81
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 32 0A 76 65
             72 73 69 6F 6E 20 00
                                    252 
      00926B                        253 system_information:
      00926B 1D 00 31         [ 2]  254 	ldw x,#software 
      00926E A6 03 62         [ 4]  255 	call puts 
      009271 9F AB            [ 1]  256 	ld a,#MAJOR 
      009273 41 81 0E         [ 1]  257 	ld acc8,a 
      009275 5F               [ 1]  258 	clrw x 
      009275 90 89 90         [ 2]  259 	ldw acc24,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      009278 AE B3 C9 90      [ 1]  260 	clr tab_width  
      00927C CF 00 1A 90      [ 1]  261 	mov base, #10 
      009280 5F 91 D3         [ 4]  262 	call prt_acc24 
      009283 1A 27            [ 1]  263 	ld a,#'.
      009285 0C 90 5C         [ 4]  264 	call putc 
      009288 91 D6            [ 1]  265 	ld a,#MINOR 
      00928A 1A 90 5C         [ 1]  266 	ld acc8,a 
      00928D 91               [ 1]  267 	clrw x 
      00928E DA 1A 26         [ 2]  268 	ldw acc24,x 
      009291 EF 93 90         [ 4]  269 	call prt_acc24
      009294 85 81            [ 1]  270 	ld a,#CR 
      009296 CD 09 44         [ 4]  271 	call putc
                                    272 ;call test 
      009296 52               [ 4]  273 	ret
                                    274 
      0014F6                        275 warm_init:
      009297 04 C6 00 0B      [ 2]  276 	ldw y,#XSTACK_EMPTY  
      00929B 6B 01 C6 00      [ 1]  277 	clr flags 
      00929F 24 6B 02 17      [ 1]  278 	clr loop_depth 
      0092A3 03 72 CE 00      [ 1]  279 	mov tab_width,#TAB_WIDTH 
      0092A7 05 35 0A 00      [ 1]  280 	mov base,#10 
      0092AB 0B 35 05         [ 2]  281 	ldw x,#0 
      0092AE 00 24 72         [ 2]  282 	ldw basicptr,x 
      0092B1 5F 00 0D         [ 2]  283 	ldw in.w,x 
      0092B4 CF 00 0E 4F      [ 1]  284 	clr count
      0092B8 CD               [ 4]  285 	ret 
                                    286 
                                    287 ;---------------------------
                                    288 ; reset BASIC text variables 
                                    289 ; and clear variables 
                                    290 ;---------------------------
      001518                        291 clear_basic:
      0092B9 98               [ 2]  292 	pushw x 
      0092BA CF CD 92 13      [ 1]  293 	clr count
      0092BE 88 90 93 1E      [ 1]  294 	clr in  
      0092C2 04 CD 94         [ 2]  295 	ldw x,#free_ram 
      0092C5 9C 90 5F         [ 2]  296 	ldw txtbgn,x 
      0092C8 84 90 97         [ 2]  297 	ldw txtend,x 
      0092CB 72 F9 03         [ 4]  298 	call clear_vars 
      0092CE A6               [ 2]  299 	popw x
      0092CF 20               [ 4]  300 	ret 
                                    301 
                                    302 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    303 ;;   Tiny BASIC error messages     ;;
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00152F                        305 err_msg:
      0092D0 90 F7 90 5C 72 5F 00   306 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             24 AE 00 03 CF
      0092DC 00 01 15 C0 15 DA 15   307 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             EB 15 FC
      0092DE 16 08 16 3B 16 4B 16   308 	.word err_no_access,err_no_data,err_no_prog,err_no_fspace,err_buf_full    
             5F 16 72
      0092DE 90 89                  309 	.word err_overflow 
                                    310 
      0092E0 CD 98 3D 90 85 4D 26   311 err_mem_full: .asciz "Memory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal  03-Bits]



             66 75 6C 6C 0A 00
      0092E8 CC 94 11 2B 03 CC 93   312 err_syntax: .asciz "syntax error\n" 
             82 72 72 6F 72 0A 00
      0092F0 6D 61 74 68 20 6F 70   313 err_math_ovf: .asciz "math operation overflow\n"
             65 72 61 74 69 6F 6E
             20 6F 76 65 72 66 6C
             6F 77 0A 00
      0092F0 A1 85 26 0F CD 91 FD   314 err_div0: .asciz "division by 0\n" 
             CD 98 72 CD 92 6B 90
             F7
      0092FF 90 5C 20 DB 6C 69 64   315 err_no_line: .asciz "invalid line number.\n"
             20 6C 69 6E 65 20 6E
             75 6D 62 65 72 2E 0A
             00
      009303 72 75 6E 20 74 69 6D   316 err_run_only: .asciz "run time only usage.\n" 
             65 20 6F 6E 6C 79 20
             75 73 61 67 65 2E 0A
             00
      009303 A1 84 26 26 CD 98 7C   317 err_cmd_only: .asciz "command line only usage.\n"
             C7 00 0D CF 00 0E CD
             91 FD 90 89 A6 FF CD
             98 CF 16 01 88
      00931D 51 CD 94 9C 90 5F 84   318 err_duplicate: .asciz "duplicate name.\n"
             90 97 72 F9 01 5B 02
             20 B1 00
      00932D 46 69 6C 65 20 6E 6F   319 err_not_file: .asciz "File not found.\n"
             74 20 66 6F 75 6E 64
             2E 0A 00
      00932D A1 87 24 39 FE 72 5C   320 err_bad_value: .asciz "bad value.\n"
             00 02 72 5C 00
      009339 02 A3 00 84 26 23 CE   321 err_no_access: .asciz "File in extended memory, can't be run from there.\n" 
             00 05 CD 91 FD A6 27
             90 F7 90 5C 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68 65 72 65 2E
             0A 00
      00934B 4E 6F 20 64 61 74 61   322 err_no_data: .asciz "No data found.\n"
             20 66 6F 75 6E 64 2E
             0A 00
      00934B 72 D6 00 01 72 5C 00   323 err_no_prog: .asciz "No program in RAM!\n"
             02 90 F7 90 5C C6 00
             02 C1 00 04 2B EC
      00935F CC 94 11 A3 00 4C 26   324 err_no_fspace: .asciz "File system full.\n" 
             0B CC 92 DE 20 66 75
             6C 6C 2E 0A 00
      00936A 42 75 66 66 65 72 20   325 err_buf_full: .asciz "Buffer full\n"
             66 75 6C 6C 0A 00
      00936A 5F A0 87 48 97 1C 00   326 err_overflow: .asciz "overflow\n" 
             FA 0A 00
                                    327 
      009372 0A 72 75 6E 20 74 69   328 rt_msg: .asciz "\nrun time error, "
             6D 65 20 65 72 72 6F
             72 2C 20 00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      009372 CD 91 FD 90 89 CD 94   329 comp_msg: .asciz "\ncompile error, "
             4C 90 85 CD 91 E5 CC
             92 DE 00
      009382 6C 61 73 74 20 74 6F   330 tk_id: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                    331 
      0016BC                        332 syntax_error::
      009382 A1 03            [ 1]  333 	ld a,#ERR_SYNTAX 
                                    334 
      0016BE                        335 tb_error::
      009384 26 1E A6 20 90   [ 2]  336 	btjt flags,#FCOMP,1$
      009389 F7               [ 1]  337 	push a 
      00938A 90 5C 89         [ 2]  338 	ldw x, #rt_msg 
      00938C CD 09 A1         [ 4]  339 	call puts 
      00938C 89               [ 1]  340 	pop a 
      00938D CD 98 63         [ 2]  341 	ldw x, #err_msg 
      009390 85 5F 00 0D      [ 1]  342 	clr acc16 
      009391 48               [ 1]  343 	sll a
      009391 F6 27 07 5C      [ 1]  344 	rlc acc16  
      009395 90 F7 90         [ 1]  345 	ld acc8, a 
      009398 5C 20 F6 0D      [ 2]  346 	addw x,acc16 
      00939B FE               [ 2]  347 	ldw x,(x)
      00939B A6 20 90         [ 4]  348 	call puts
      00939E F7 90 5C         [ 2]  349 	ldw x,basicptr 
                           000001   350 .if DEBUG 
      0093A1 CC 92 DE         [ 1]  351 ld a,count 
      0093A4 90 5F            [ 1]  352 clrw y 
      0093A4 A1 02            [ 1]  353 rlwa y  
      0093A6 26 09 CD         [ 4]  354 call hex_dump
      0093A9 91 FD CD         [ 2]  355 ldw x,basicptr
                                    356 .endif 
      0093AC 92 25 CC         [ 1]  357 	ld a,in 
      0093AF 92 DE D1         [ 4]  358 	call prt_basic_line
      0093B1 AE 16 AC         [ 2]  359 	ldw x,#tk_id 
      0093B1 A1 04 26         [ 4]  360 	call puts 
      0093B4 10 CD 91         [ 1]  361 	ld a,in.saved 
      0093B7 FD               [ 1]  362 	clrw x 
      0093B8 A6               [ 1]  363 	ld xl,a 
      0093B9 5C 90 F7 90      [ 2]  364 	addw x,basicptr 
      0093BD 5C               [ 1]  365 	ld a,(x)
      0093BE F6               [ 1]  366 	clrw x 
      0093BF 72               [ 1]  367 	ld xl,a 
      0093C0 5C 00 02         [ 4]  368 	call prt_i16
      0093C3 20 06            [ 2]  369 	jra 6$
      00170F                        370 1$:	
      0093C5 A1               [ 1]  371 	push a 
      0093C6 0A 26 09         [ 2]  372 	ldw x,#comp_msg
      0093C9 A6 3A A1         [ 4]  373 	call puts 
      0093CB 84               [ 1]  374 	pop a 
      0093CB 90 F7 90         [ 2]  375 	ldw x, #err_msg 
      0093CE 5C 5F 00 0D      [ 1]  376 	clr acc16 
      0093CF 48               [ 1]  377 	sll a
      0093CF CC 92 DE 0D      [ 1]  378 	rlc acc16  
      0093D2 C7 00 0E         [ 1]  379 	ld acc8, a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



      0093D2 A1 09 22 0A      [ 2]  380 	addw x,acc16 
      0093D6 A0               [ 2]  381 	ldw x,(x)
      0093D7 05 5F 97         [ 4]  382 	call puts
      0093DA 1C 94 27         [ 2]  383 	ldw x,#tib
      0093DD F6 20 EB         [ 4]  384 	call puts 
      0093E0 A6 0D            [ 1]  385 	ld a,#CR 
      0093E0 A1 11 22         [ 4]  386 	call putc
      0093E3 0A A0 10         [ 2]  387 	ldw x,in.w
      0093E6 5F 97 1C         [ 4]  388 	call spaces
      0093E9 94 2C            [ 1]  389 	ld a,#'^
      0093EB F6 20 DD         [ 4]  390 	call putc 
      0093EE AE 17 FF         [ 2]  391 6$: ldw x,#STACK_EMPTY 
      0093EE A1               [ 1]  392     ldw sp,x
                                    393 
      001748                        394 warm_start:
      0093EF 22 22 0A         [ 4]  395 	call warm_init
                                    396 ;----------------------------
                                    397 ;   BASIC interpreter
                                    398 ;----------------------------
      00174B                        399 cmd_line: ; user interface 
      0093F2 A0 20            [ 1]  400 	ld a,#CR 
      0093F4 5F 97 1C         [ 4]  401 	call putc 
      0093F7 94 2E            [ 1]  402 	ld a,#'> 
      0093F9 F6 20 CF         [ 4]  403 	call putc
      0093FC CD 0A A6         [ 4]  404 	call readln
      0093FC A0 31 48 5F      [ 1]  405 	tnz count 
      009400 97 1C            [ 1]  406 	jreq cmd_line
      009402 94 31 FE         [ 4]  407 	call compile
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
      009405 F6 5C 90 F7      [ 1]  422 	tnz count 
      009409 90 5C            [ 1]  423 	jreq cmd_line
                                    424 	
                                    425 ; if direct command 
                                    426 ; it's ready to interpret 
                                    427 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    428 ;; This is the interpreter loop
                                    429 ;; for each BASIC code line. 
                                    430 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      001767                        431 interpreter: 
      00940B F6 26 BD         [ 1]  432 	ld a,in 
      00940E CC 92 DE         [ 1]  433 	cp a,count 
      009411 2B 1D            [ 1]  434 	jrmi interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00176F                        435 next_line:
      009411 90 7F 1E 03 7B   [ 2]  436 	btjf flags, #FRUN, cmd_line
      009416 01 C7 00         [ 2]  437 	ldw x,basicptr
      009419 0B 7B 02 C7      [ 2]  438 	addw x,in.w 
      00941D 00 24 72         [ 2]  439 	cpw x,txtend 
      009420 F2 03            [ 1]  440 	jrpl warm_start
      009422 90 9F 5B         [ 2]  441 	ldw basicptr,x ; start of next line  
      009425 04 81            [ 1]  442 	ld a,(2,x)
      009427 40 28 29         [ 1]  443 	ld count,a 
      00942A 2C 23 2B 2D      [ 1]  444 	mov in,#3 ; skip first 3 bytes of line 
      00178C                        445 interp_loop:
      00942E 2A 2F 25         [ 4]  446 	call next_token
      009431 94 3D            [ 1]  447 	cp a,#TK_NONE 
      009433 94 3F            [ 1]  448 	jreq next_line 
      009435 94 41            [ 1]  449 	cp a,#TK_CMD
      009437 94 44            [ 1]  450 	jrne 1$
      009439 94 46 94         [ 4]  451 	call get_code_addr
      00943C 49               [ 4]  452 	call (x) 
      00943D 3E 00            [ 2]  453 	jra interp_loop 
      00179D                        454 1$:	 
      00943F 3D 00            [ 1]  455 	cp a,#TK_VAR
      009441 3E 3D            [ 1]  456 	jrne 2$
      009443 00 3C 00         [ 4]  457 	call let_var  
      009446 3C 3D            [ 2]  458 	jra interp_loop 
      0017A6                        459 2$:	
      009448 00 3C            [ 1]  460 	cp a,#TK_ARRAY 
      00944A 3E 00            [ 1]  461 	jrne 3$
      00944C CD 1C 8B         [ 4]  462 	call let_array 
      00944C 52 04            [ 2]  463 	jra interp_loop
      0017AF                        464 3$:	
      00944E 72 5F            [ 1]  465 	cp a,#TK_COLON 
      009450 00 0E            [ 1]  466 	jreq interp_loop
      009452 1F 01            [ 1]  467 4$: cp a,#TK_LABEL
      009454 AE B3 C1         [ 4]  468 	call skip_string 
      009457 1F 03            [ 2]  469 	jra interp_loop 
      009459 E6 02 A4         [ 2]  470 5$:	jp syntax_error 
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
      0017BD                        481 next_token::
                                    482 ;	clrw x 
      00945C 0F C7 00         [ 1]  483 	ld a,in 
      00945F 0F 1C 00         [ 1]  484 	ld in.saved,a ; in case "_unget_token" needed 
                                    485 ; don't replace sub by "cp a,count" 
                                    486 ; if end of line must return with A=0   	
      009462 03 72 BB         [ 1]  487 	sub a,count 
      009465 00 0E            [ 1]  488 	jreq 9$ ; end of line 
      0017C8                        489 0$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      009467 FE 13 01         [ 2]  490 	ldw x,basicptr 
      00946A 27 0C 1E 03      [ 2]  491 	addw x,in.w 
      00946E FE               [ 1]  492 	ld a,(x)
      00946F 1D               [ 1]  493 	incw x
      009470 00 02 26 E3      [ 1]  494 	inc in   
      009474 4F               [ 4]  495 9$: ret 
                                    496 
                                    497 ;------------------------
                                    498 ; get cmd and function 
                                    499 ; code address 
                                    500 ; input:
                                    501 ;    X   * cmd|func index 
                                    502 ;        in code_addr table 
                                    503 ;------------------------
      0017D6                        504 get_code_addr:
      009475 5F               [ 2]  505 	ldw x,(x)
      009476 20 05 1E         [ 2]  506 	ldw x,(code_addr,x)
      009479 03 1C 00 02      [ 1]  507 	inc in 
      00947D 5B 04 81 01      [ 1]  508 	inc in 
      000001 81               [ 4]  509 	ret
                                    510 
                                    511 ;-------------------------
                                    512 ;  skip .asciz in BASIC line 
                                    513 ;  name 
                                    514 ;  input:
                                    515 ;     x		* string 
                                    516 ;  output:
                                    517 ;     none 
                                    518 ;-------------------------
      000002                        519 skip_string:
      000003 F6               [ 1]  520 	ld a,(x)
      000004 27 03            [ 1]  521 	jreq 1$
      000005 5C               [ 1]  522 	incw x 
      000007 20 FA            [ 2]  523 	jra skip_string 
      000009 5C               [ 1]  524 1$: incw x 	
      00000A 72 B0 00 04      [ 2]  525 	subw x,basicptr 
      00000B CF 00 00         [ 2]  526 	ldw in.w,x 
      00000C 81               [ 4]  527 	ret 
                                    528 
                                    529 ;---------------------
                                    530 ; extract 16 bits  
                                    531 ; address from BASIC
                                    532 ; code 
                                    533 ; input:
                                    534 ;    X    *address
                                    535 ; output:
                                    536 ;    X    address 
                                    537 ;-------------------- 
      00000D                        538 get_addr:
      00000E FE               [ 2]  539 	ldw x,(x)
      00000F 72 5C 00 01      [ 1]  540 	inc in 
      000010 72 5C 00 01      [ 1]  541 	inc in 
      000013 81               [ 4]  542 	ret 
                                    543 
                                    544 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



                                    545 ; extract int24_t  
                                    546 ; value from BASIC 
                                    547 ; code 
                                    548 ; input:
                                    549 ;    X   *integer 
                                    550 ; output:
                                    551 ;    A:X   int24  
                                    552 ;--------------------
      000015                        553 get_int24:
      000017 F6               [ 1]  554 	ld a,(x)
      000019 EE 01            [ 2]  555 	ldw x,(1,x)
                                    556 ; skip 3 bytes 
      00001A 72 5C 00 01      [ 1]  557 	inc in 
      00001B 72 5C 00 01      [ 1]  558 	inc in 
      00001C 72 5C 00 01      [ 1]  559 	inc in 
      00001E 81               [ 4]  560 	ret 
                                    561 
                                    562 ;-------------------------
                                    563 ; get character from 
                                    564 ; BASIC code 
                                    565 ; input:
                                    566 ;    X   *char 
                                    567 ; output:
                                    568 ;    A    char 
                                    569 ;-------------------------
      000020                        570 get_char:
      000021 F6               [ 1]  571 	ld a,(x)
      000023 72 5C 00 01      [ 1]  572 	inc in  
      000024 81               [ 4]  573     ret 
                                    574 
                                    575 ;-----------------------------------
                                    576 ; print a 16 bit integer 
                                    577 ; using variable 'base' as conversion
                                    578 ; format.
                                    579 ; input:
                                    580 ;    X       integer to print 
                                    581 ;   'base'    conversion base 
                                    582 ; output:
                                    583 ;   terminal  
                                    584 ;-----------------------------------
      000025                        585 prt_i16:
      000027 72 5F 00 0C      [ 1]  586 	clr acc24 
      00002F CF 00 0D         [ 2]  587 	ldw acc16,x 
      000030 A6 10            [ 1]  588 	ld a,#16
      000031 C1 00 0A         [ 1]  589 	cp a,base
      00007C 27 09            [ 1]  590 	jreq prt_acc24  
      00007C 72 0F 00 0D 04   [ 2]  591 	btjf acc16,#7,prt_acc24
      00007E 72 53 00 0C      [ 1]  592 	cpl acc24 ; sign extend 
                                    593 	
                                    594 ;------------------------------------
                                    595 ; print integer in acc24 
                                    596 ; input:
                                    597 ;	acc24 		integer to print 
                                    598 ;	'base' 		numerical base for conversion 
                                    599 ;   'tab_width' field width 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



                                    600 ;    A 			signed||unsigned conversion
                                    601 ;  output:
                                    602 ;    A          string length
                                    603 ;------------------------------------
      000080                        604 prt_acc24:
      009480 A6 FF            [ 1]  605 	ld a,#255  ; signed conversion  
      009480 89 4F 7D         [ 4]  606     call itoa  ; conversion entier en  .asciz
      009483 27 04 4C         [ 4]  607 	call right_align  
      009486 5C               [ 1]  608 	push a 
      009487 20 F9 85         [ 4]  609 	call puts
      00948A 81               [ 1]  610 	pop a 
      00948B 81               [ 4]  611     ret	
                                    612 
                                    613 ;---------------------------------------
                                    614 ;  print value at xstack top 
                                    615 ;---------------------------------------
      001837                        616 print_top: 
      001837                        617 	_xpop 
      00948B F6 27            [ 1]    1     ld a,(y)
      00948D 0B               [ 1]    2     ldw x,y 
      00948E 90 F1            [ 2]    3     ldw x,(1,x)
      009490 26 05 5C 90      [ 2]    4     addw y,#CELL_SIZE 
      009494 5C 20 F4         [ 1]  618 	ld acc24,a 
      009497 CF 00 0D         [ 2]  619 	ldw acc16,x 
      009497 4F 81 29         [ 4]  620 	call prt_acc24 
      009499 A6 20            [ 1]  621 	ld a,#SPACE
      009499 A6 01 81         [ 4]  622 	call putc 
      00949C 81               [ 4]  623 	ret 
                                    624 
                                    625 ;------------------------------------
                                    626 ; convert integer in acc24 to string
                                    627 ; input:
                                    628 ;   'base'	conversion base 
                                    629 ;	acc24	integer to convert
                                    630 ;   A       0=unsigned, else signed 
                                    631 ; output:
                                    632 ;   X  		pointer to first char of string
                                    633 ;   A       string length
                                    634 ;------------------------------------
                           000001   635 	SIGN=1  ; integer sign 
                           000002   636 	LEN=2 
                           000003   637 	PSTR=3
                           000004   638 	VSIZE=4 ;locals size
      00184F                        639 itoa::
      00184F                        640 	_vars VSIZE
      00949C 88 89            [ 2]    1     sub sp,#VSIZE 
      00949E 90 F6            [ 1]  641 	clr (LEN,sp) ; string length  
      0094A0 27 06            [ 1]  642 	clr (SIGN,sp)    ; sign
      0094A2 F7               [ 1]  643 	tnz A
      0094A3 5C 90            [ 1]  644 	jreq 1$ ; unsigned conversion  
      0094A5 5C 20 F6         [ 1]  645 	ld a,base 
      0094A8 7F 85            [ 1]  646 	cp a,#10
      0094AA 84 81            [ 1]  647 	jrne 1$
                                    648 	; base 10 string display with negative sign if bit 23==1
      0094AC 72 0F 00 0C 05   [ 2]  649 	btjf acc24,#7,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



      0094AC 88 52            [ 1]  650 	cpl (SIGN,sp)
      0094AE 02 0F 01         [ 4]  651 	call neg_acc24
      001869                        652 1$:
                                    653 ; initialize string pointer 
      0094B1 0F 02 90         [ 2]  654 	ldw x,#tib 
      0094B4 89 13 01         [ 2]  655 	addw x,#TIB_SIZE
      0094B7 90               [ 2]  656 	decw x 
      0094B8 85               [ 1]  657 	clr (x)
      001871                        658 itoa_loop:
      0094B9 27 31 2B         [ 1]  659     ld a,base
                                    660 ;	ldw (PSTR,sp),x 
      0094BC 0E 03 09         [ 4]  661     call divu24_8 ; acc24/A 
                                    662 ;	ldw x,(PSTR,sp)
      0094BD AB 30            [ 1]  663     add a,#'0  ; remainder of division
      0094BD 72 BB            [ 1]  664     cp a,#'9+1
      0094BF 00 0E            [ 1]  665     jrmi 2$
      0094C1 72 B9            [ 1]  666     add a,#7 
      00187F                        667 2$:	
      0094C3 00               [ 2]  668 	decw x
      0094C4 0E               [ 1]  669     ld (x),a
      0094C5 03 01            [ 1]  670 	inc (LEN,sp)
                                    671 	; if acc24==0 conversion done
      0094C7 03 02 20         [ 1]  672 	ld a,acc24
      0094CA 05 00 0D         [ 1]  673 	or a,acc16
      0094CB CA 00 0E         [ 1]  674 	or a,acc8
      0094CB 5A 90            [ 1]  675     jrne itoa_loop
                                    676 	;conversion done, next add '$' or '-' as required
      0094CD 5A 0C 02         [ 1]  677 	ld a,base 
      0094D0 A1 10            [ 1]  678 	cp a,#16
      0094D0 C6 00            [ 1]  679 	jreq 8$
      0094D2 0E CA            [ 1]  680 	ld a,(SIGN,sp)
      0094D4 00 0F            [ 1]  681     jreq 10$
      0094D6 27 14            [ 1]  682     ld a,#'-
      0094D8 72 FB            [ 2]  683 	jra 9$ 
      00189D                        684 8$:	
      0094DA 01 72            [ 1]  685 	ld a,#'$ 
      0094DC F9               [ 2]  686 9$: decw x
      0094DD 01               [ 1]  687     ld (x),a
      0094DE 90 F6            [ 1]  688 	inc (LEN,sp)
      0018A3                        689 10$:
      0094E0 F7 89            [ 1]  690 	ld a,(LEN,sp)
      0018A5                        691 	_drop VSIZE
      0094E2 CE 00            [ 2]    1     addw sp,#VSIZE 
      0094E4 0E               [ 4]  692 	ret
                                    693 
                                    694 ;------------------------------------
                                    695 ; convert alpha to uppercase
                                    696 ; input:
                                    697 ;    a  character to convert
                                    698 ; output:
                                    699 ;    a  uppercase character
                                    700 ;------------------------------------
      0018A8                        701 to_upper::
      0094E5 5A CF            [ 1]  702 	cp a,#'a
      0094E7 00 0E            [ 1]  703 	jrpl 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]



      0094E9 85               [ 4]  704 0$:	ret
      0094EA 20 E4            [ 1]  705 1$: cp a,#'z	
      0094EC 22 FB            [ 1]  706 	jrugt 0$
      0094EC 5B 02            [ 1]  707 	sub a,#32
      0094EE 84               [ 4]  708 	ret
                                    709 	
                                    710 ;------------------------------------
                                    711 ; convert pad content in integer
                                    712 ; input:
                                    713 ;    x		* .asciz to convert
                                    714 ; output:
                                    715 ;    acc24      int24_t
                                    716 ;------------------------------------
                                    717 	; local variables
                           000001   718 	SIGN=1 ; 1 byte, 
                           000002   719 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003   720 	TEMP=3 ; 1 byte, temporary storage
                           000003   721 	VSIZE=3 ; 3 bytes reserved for local storage
      0018B4                        722 atoi24::
      0094EF 81               [ 2]  723 	pushw x 
      0094F0                        724 	_vars VSIZE
      0094F0 89 88            [ 2]    1     sub sp,#VSIZE 
                                    725 	; acc24=0 
      0094F2 AE 00 31 A6      [ 1]  726 	clr acc24    
      0094F6 4E 7F 5C 4A      [ 1]  727 	clr acc16
      0094FA 26 FB 84 85      [ 1]  728 	clr acc8 
      0094FE 81 0A            [ 1]  729 	clr (SIGN,sp)
      009500 0A 54            [ 1]  730 	ld a,#10
      009502 69 6E            [ 1]  731 	ld (BASE,sp),a ; default base decimal
      009504 79               [ 1]  732 	ld a,(x)
      009505 20 42            [ 1]  733 	jreq 9$  ; completed if 0
      009507 41 53            [ 1]  734 	cp a,#'-
      009509 49 43            [ 1]  735 	jrne 1$
      00950B 20 66            [ 1]  736 	cpl (SIGN,sp)
      00950D 6F 72            [ 2]  737 	jra 2$
      00950F 20 53            [ 1]  738 1$: cp a,#'$
      009511 54 4D            [ 1]  739 	jrne 3$
      009513 38 0A            [ 1]  740 	ld a,#16
      009515 43 6F            [ 1]  741 	ld (BASE,sp),a
      009517 70               [ 1]  742 2$:	incw x
      009518 79               [ 1]  743 	ld a,(x)
      0018DE                        744 3$:	
      009519 72 69            [ 1]  745 	cp a,#'a
      00951B 67 68            [ 1]  746 	jrmi 4$
      00951D 74 2C            [ 1]  747 	sub a,#32
      00951F 20 4A            [ 1]  748 4$:	cp a,#'0
      009521 61 63            [ 1]  749 	jrmi 9$
      009523 71 75            [ 1]  750 	sub a,#'0
      009525 65 73            [ 1]  751 	cp a,#10
      009527 20 44            [ 1]  752 	jrmi 5$
      009529 65 73            [ 1]  753 	sub a,#7
      00952B 63 68            [ 1]  754 	cp a,(BASE,sp)
      00952D 65 6E            [ 1]  755 	jrpl 9$
      00952F 65 73            [ 1]  756 5$:	ld (TEMP,sp),a
      009531 20 32            [ 1]  757 	ld a,(BASE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
Hexadecimal [24-Bits]



      009533 30 31 39         [ 4]  758 	call mulu24_8
      009536 2C 32            [ 1]  759 	ld a,(TEMP,sp)
      009538 30 32 32         [ 1]  760 	add a,acc24+2
      00953B 0A 76 65         [ 1]  761 	ld acc24+2,a
      00953E 72               [ 1]  762 	clr a
      00953F 73 69 6F         [ 1]  763 	adc a,acc24+1
      009542 6E 20 00         [ 1]  764 	ld acc24+1,a
      009545 4F               [ 1]  765 	clr a
      009545 AE 94 FF         [ 1]  766 	adc a,acc24
      009548 CD 8A 21         [ 1]  767 	ld acc24,a
      00954B A6 02            [ 2]  768 	jra 2$
      00954D C7 00            [ 1]  769 9$:	tnz (SIGN,sp)
      00954F 0F 5F            [ 1]  770     jreq atoi_exit
      009551 CF 00 0D         [ 4]  771     call neg_acc24
      00191A                        772 atoi_exit: 
      00191A                        773 	_drop VSIZE
      009554 72 5F            [ 2]    1     addw sp,#VSIZE 
      009556 00               [ 2]  774 	popw x ; restore x
      009557 24               [ 4]  775 	ret
                                    776 
                                    777 
                                    778 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    779 ;;   TINY BASIC  operators,
                                    780 ;;   commands and functions 
                                    781 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    782 
                                    783 ;---------------------------------
                                    784 ; dictionary search 
                                    785 ; input:
                                    786 ;	X 		dictionary entry point, name field  
                                    787 ;   y		.asciz name to search 
                                    788 ; output:
                                    789 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                    790 ;  X		cmd_index
                                    791 ;---------------------------------
                           000001   792 	NLEN=1 ; cmd length 
                           000002   793 	XSAVE=2
                           000004   794 	YSAVE=4
                           000005   795 	VSIZE=5 
      00191E                        796 search_dict::
      00191E                        797 	_vars VSIZE 
      009558 35 0A            [ 2]    1     sub sp,#VSIZE 
      00955A 00 0B            [ 2]  798 	ldw (YSAVE,sp),y 
      001922                        799 search_next:
      00955C CD 98            [ 2]  800 	ldw (XSAVE,sp),x 
                                    801 ; get name length in dictionary	
      00955E A9               [ 1]  802 	ld a,(x)
      00955F A6 2E            [ 1]  803 	and a,#0xf 
      009561 CD 89            [ 1]  804 	ld (NLEN,sp),a  
      009563 C4 A6            [ 2]  805 	ldw y,(YSAVE,sp) ; name pointer 
      009565 00               [ 1]  806 	incw x 
      00192C                        807 cp_loop:
      009566 C7 00            [ 1]  808 	ld a,(y)
      009568 0F 5F            [ 1]  809 	jreq str_match 
      00956A CF 00            [ 1]  810 	tnz (NLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]



      00956C 0D CD            [ 1]  811 	jreq no_match  
      00956E 98               [ 1]  812 	cp a,(x)
      00956F A9 A6            [ 1]  813 	jrne no_match 
      009571 0D CD            [ 1]  814 	incw y 
      009573 89               [ 1]  815 	incw x
      009574 C4 81            [ 1]  816 	dec (NLEN,sp)
      009576 20 EE            [ 2]  817 	jra cp_loop 
      00193E                        818 no_match:
      009576 90 AE            [ 2]  819 	ldw x,(XSAVE,sp) 
      009578 17 73 72         [ 2]  820 	subw x,#2 ; move X to link field
      00957B 5F 00            [ 1]  821 	push #TK_NONE 
      00957D 23               [ 2]  822 	ldw x,(x) ; next word link 
      00957E 72               [ 1]  823 	pop a ; TK_NONE 
      00957F 5F 00            [ 1]  824 	jreq search_exit  ; not found  
                                    825 ;try next 
      009581 20 35            [ 2]  826 	jra search_next
      00194B                        827 str_match:
      009583 04 00            [ 2]  828 	ldw x,(XSAVE,sp)
      009585 24               [ 1]  829 	ld a,(X)
      009586 35 0A            [ 1]  830 	ld (NLEN,sp),a ; needed to test keyword type  
      009588 00 0B            [ 1]  831 	and a,#NLEN_MASK 
                                    832 ; move x to procedure address field 	
      00958A AE               [ 1]  833 	inc a 
      00958B 00 00 CF         [ 1]  834 	ld acc8,a 
      00958E 00 05 CF 00      [ 1]  835 	clr acc16 
      009592 01 72 5F 00      [ 2]  836 	addw x,acc16 
      009596 04               [ 2]  837 	ldw x,(x) ; routine index  
                                    838 ;determine keyword type bits 7:4 
      009597 81 01            [ 1]  839 	ld a,(NLEN,sp)
      009598 A4 F0            [ 1]  840 	and a,#KW_TYPE_MASK 
      009598 89               [ 1]  841 	swap a 
      009599 72 5F            [ 1]  842 	add a,#128
      001966                        843 search_exit: 
      001966                        844 	_drop VSIZE 
      00959B 00 04            [ 2]    1     addw sp,#VSIZE 
      00959D 72               [ 4]  845 	ret 
                                    846 
                                    847 ;---------------------
                                    848 ; check if next token
                                    849 ;  is of expected type 
                                    850 ; input:
                                    851 ;   A 		 expected token attribute
                                    852 ;  ouput:
                                    853 ;   none     if fail call syntax_error 
                                    854 ;--------------------
      001969                        855 expect:
      00959E 5F               [ 1]  856 	push a 
      00959F 00 02 AE         [ 4]  857 	call next_token 
      0095A2 00 80            [ 1]  858 	cp a,(1,sp)
      0095A4 CF 00            [ 1]  859 	jreq 1$
      0095A6 1C CF 00         [ 2]  860 	jp syntax_error
      0095A9 1E               [ 1]  861 1$: pop a 
      0095AA CD               [ 4]  862 	ret 
                                    863 
                                    864 ;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]



                                    865 ; parse arguments list 
                                    866 ; between ()
                                    867 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001976                        868 func_args:
      0095AB 94 F0            [ 1]  869 	ld a,#TK_LPAREN 
      0095AD 85 81 69         [ 4]  870 	call expect 
                                    871 ; expected to continue in arg_list 
                                    872 ; caller must check for TK_RPAREN 
                                    873 
                                    874 ;-------------------------------
                                    875 ; parse embedded BASIC routines 
                                    876 ; arguments list.
                                    877 ; arg_list::=  expr[','expr]*
                                    878 ; all arguments are of int24_t type
                                    879 ; and pushed on stack 
                                    880 ; input:
                                    881 ;   none
                                    882 ; output:
                                    883 ;   xstack{n}   arguments pushed on xstack
                                    884 ;   A 	number of arguments pushed on xstack  
                                    885 ;--------------------------------
      0095AF                        886 arg_list:
      0095AF 00 00            [ 1]  887 	push #0
      0095B1 95 D1 95         [ 4]  888 1$:	call condition 
      0095B4 DE               [ 1]  889 	tnz a 
      0095B5 95 EC            [ 1]  890 	jreq 7$  
      0095B7 96 05            [ 1]  891 	inc (1,sp)
      0095B9 96 14 96         [ 4]  892 	call next_token 
      0095BC 2A 96            [ 1]  893 	cp a,#TK_COMMA 
      0095BE 40 96            [ 1]  894 	jreq 1$ 
      0095C0 5A 96            [ 1]  895 	cp a,#TK_RPAREN
      0095C2 6B 96            [ 1]  896 	jreq 7$
      001990                        897 	_unget_token 
      0095C4 7C 96 88 96 BB   [ 1]    1      mov in,in.saved  
      0095C9 96               [ 1]  898 7$:	pop a  
      0095CA CB               [ 4]  899 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]



                                    919 ;---------------------
                                    920 ; return array element
                                    921 ; address from @(expr)
                                    922 ; input:
                                    923 ;   A 		TK_ARRAY
                                    924 ; output:
                                    925 ;	X 		element address 
                                    926 ;----------------------
      001997                        927 get_array_element:
      0095CB 96 DF 96         [ 4]  928 	call func_args 
      0095CE F2 96            [ 1]  929 	cp a,#1
      0095D0 FF 4D            [ 1]  930 	jreq 1$
      0095D2 65 6D 6F         [ 2]  931 	jp syntax_error
      0019A1                        932 1$: _xpop 
      0095D5 72 79            [ 1]    1     ld a,(y)
      0095D7 20               [ 1]    2     ldw x,y 
      0095D8 66 75            [ 2]    3     ldw x,(1,x)
      0095DA 6C 6C 0A 00      [ 2]    4     addw y,#CELL_SIZE 
                                    933     ; ignore A, index < 65536 in any case 
                                    934 	; check for bounds 
      0095DE 73 79 6E         [ 2]  935 	cpw x,array_size 
      0095E1 74 61            [ 2]  936 	jrule 3$
                                    937 ; bounds {1..array_size}	
      0095E3 78 20            [ 1]  938 2$: ld a,#ERR_BAD_VALUE 
      0095E5 65 72 72         [ 2]  939 	jp tb_error 
      0095E8 6F               [ 2]  940 3$: tnzw  x
      0095E9 72 0A            [ 1]  941 	jreq 2$ 
      0095EB 00               [ 2]  942 	pushw x 
      0095EC 6D               [ 2]  943 	sllw x 
      0095ED 61 74 68         [ 2]  944 	addw x,(1,sp) ; index*size_of(int24)
      0095F0 20 6F            [ 2]  945 	ldw (1,sp),x  
      0095F2 70 65 72         [ 2]  946 	ldw x,#tib ; array is below tib 
      0095F5 61 74 69         [ 2]  947 	subw x,(1,sp)
      0019C4                        948 	_drop 2   
      0095F8 6F 6E            [ 2]    1     addw sp,#2 
      0095FA 20               [ 4]  949 	ret 
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
      0019C7                        965 factor:
      0019C7                        966 	_vars VSIZE 
      0095FB 6F 76            [ 2]    1     sub sp,#VSIZE 
      0095FD 65 72            [ 1]  967 	clr (NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]



      0095FF 66 6C 6F         [ 4]  968 	call next_token
      009602 77               [ 1]  969 	tnz a 
      009603 0A 00            [ 1]  970 	jrne 1$ 
      009605 64 69 76         [ 2]  971 	jp 22$ 
      009608 69 73            [ 1]  972 1$:	cp a,#TK_PLUS 
      00960A 69 6F            [ 1]  973 	jreq 2$
      00960C 6E 20            [ 1]  974 	cp a,#TK_MINUS 
      00960E 62 79            [ 1]  975 	jrne 4$ 
      009610 20 30            [ 1]  976 	cpl (NEG,sp)
      0019DE                        977 2$:	
      009612 0A 00 69         [ 4]  978 	call next_token
      0019E1                        979 4$:
      009615 6E               [ 1]  980 	tnz a 
      009616 76 61            [ 1]  981 	jrne 41$ 
      009618 6C 69 64         [ 2]  982 	jp syntax_error  
      0019E7                        983 41$:	
      00961B 20 6C            [ 1]  984 	cp a,#TK_IFUNC 
      00961D 69 6E            [ 1]  985 	jrne 5$ 
      00961F 65 20 6E         [ 4]  986 	call get_code_addr 
      009622 75               [ 4]  987 	call (x); result in A:X  
      009623 6D 62            [ 2]  988 	jra 18$ 
      0019F1                        989 5$:
      009625 65 72            [ 1]  990 	cp a,#TK_INTGR
      009627 2E 0A            [ 1]  991 	jrne 6$
      009629 00 72 75         [ 4]  992 	call get_int24 ; A:X
      00962C 6E 20            [ 2]  993 	jra 18$
      0019FA                        994 6$:
      00962E 74 69            [ 1]  995 	cp a,#TK_ARRAY
      009630 6D 65            [ 1]  996 	jrne 7$
      009632 20 6F 6E         [ 4]  997 	call get_array_element
      009635 6C 79            [ 2]  998     jra 71$
      001A03                        999 7$:
      009637 20 75            [ 1] 1000 	cp a,#TK_VAR 
      009639 73 61            [ 1] 1001 	jrne 8$
      00963B 67 65 2E         [ 4] 1002 	call get_addr 
      001A0A                       1003 71$: ; put value in A:X
      00963E 0A               [ 1] 1004 	ld a,(x)
      00963F 00 63            [ 2] 1005 	ldw x,(1,x)
      009641 6F 6D            [ 2] 1006 	jra 18$
      001A0F                       1007 8$:
      009643 6D 61            [ 1] 1008 	cp a,#TK_LABEL 
      009645 6E 64            [ 1] 1009 	jrne 9$ 
      009647 20               [ 2] 1010 	pushw x 
      009648 6C 69 6E         [ 4] 1011 	call skip_string
      00964B 65               [ 2] 1012 	popw x 
      00964C 20 6F 6E         [ 4] 1013 	call search_const 
      00964F 6C               [ 2] 1014 	tnzw x 
      009650 79 20            [ 1] 1015 	jreq 16$
      009652 75 73 61         [ 4] 1016 	call get_const_value ; in A:X 
      009655 67 65            [ 2] 1017 	jra 18$
      001A23                       1018 9$: 
      009657 2E 0A            [ 1] 1019 	cp a,#TK_CFUNC 
      009659 00 64            [ 1] 1020 	jrne 12$
      00965B 75 70 6C         [ 4] 1021 	call get_code_addr 
      00965E 69               [ 4] 1022 	call(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]



      00965F 63               [ 1] 1023 	clrw x 
      009660 61               [ 1] 1024 	rlwa x  ; char>int24 in A:X 
      009661 74 65            [ 2] 1025 	jra 18$ 	 
      001A2F                       1026 12$:			
      009663 20 6E            [ 1] 1027 	cp a,#TK_LPAREN
      009665 61 6D            [ 1] 1028 	jrne 16$
      009667 65 2E 0A         [ 4] 1029 	call expression
      00966A 00 46            [ 1] 1030 	ld a,#TK_RPAREN 
      00966C 69 6C 65         [ 4] 1031 	call expect
      001A3B                       1032 	_xpop 
      00966F 20 6E            [ 1]    1     ld a,(y)
      009671 6F               [ 1]    2     ldw x,y 
      009672 74 20            [ 2]    3     ldw x,(1,x)
      009674 66 6F 75 6E      [ 2]    4     addw y,#CELL_SIZE 
      009678 64 2E            [ 2] 1033 	jra 18$	
      001A46                       1034 16$:
      001A46                       1035 	_unget_token 
      00967A 0A 00 62 61 64   [ 1]    1      mov in,in.saved  
      00967F 20               [ 1] 1036 	clr a 
      009680 76 61            [ 2] 1037 	jra 22$ 
      001A4E                       1038 18$: 
      009682 6C 75            [ 1] 1039 	tnz (NEG,sp)
      009684 65 2E            [ 1] 1040 	jreq 20$
      009686 0A 00 46         [ 4] 1041 	call neg_ax   
      001A55                       1042 20$:
      001A55                       1043 	_xpush 
      009689 69 6C 65 20      [ 2]    1     subw y,#CELL_SIZE
      00968D 69 6E            [ 1]    2     ld (y),a 
      00968F 20 65 78         [ 2]    3     ldw (1,y),x 
      009692 74 65            [ 1] 1044 	ld a,#TK_INTGR
      001A60                       1045 22$:
      001A60                       1046 	_drop VSIZE
      009694 6E 64            [ 2]    1     addw sp,#VSIZE 
      009696 65               [ 4] 1047 	ret
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
      001A63                       1058 term:
      001A63                       1059 	_vars VSIZE
      009697 64 20            [ 2]    1     sub sp,#VSIZE 
                                   1060 ; first factor 	
      009699 6D 65 6D         [ 4] 1061 	call factor
      00969C 6F               [ 1] 1062 	tnz a 
      00969D 72 79            [ 1] 1063 	jreq term_exit  
      001A6B                       1064 term01:	 ; check for  operator '*'|'/'|'%' 
      00969F 2C 20 63         [ 4] 1065 	call next_token
      0096A2 61 6E            [ 1] 1066 	ld (MULOP,sp),a
      0096A4 27 74            [ 1] 1067 	and a,#TK_GRP_MASK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]



      0096A6 20 62            [ 1] 1068 	cp a,#TK_GRP_MULT
      0096A8 65 20            [ 1] 1069 	jreq 1$
      0096AA 72 75            [ 1] 1070 	ld a,#TK_INTGR
      001A78                       1071 	_unget_token 
      0096AC 6E 20 66 72 6F   [ 1]    1      mov in,in.saved  
      0096B1 6D 20            [ 2] 1072 	jra term_exit 
      001A7F                       1073 1$:	; got *|/|%
                                   1074 ;second factor
      0096B3 74 68 65         [ 4] 1075 	call factor
      0096B6 72               [ 1] 1076 	tnz a 
      0096B7 65 2E            [ 1] 1077 	jrne 2$ 
      0096B9 0A 00 4E         [ 2] 1078 	jp syntax_error 
      001A88                       1079 2$: ; select operation 	
      0096BC 6F 20            [ 1] 1080 	ld a,(MULOP,sp) 
      0096BE 64 61            [ 1] 1081 	cp a,#TK_MULT 
      0096C0 74 61            [ 1] 1082 	jrne 3$
                                   1083 ; '*' operator
      0096C2 20 66 6F         [ 4] 1084 	call mul24 
      0096C5 75 6E            [ 2] 1085 	jra term01
      0096C7 64 2E            [ 1] 1086 3$: cp a,#TK_DIV 
      0096C9 0A 00            [ 1] 1087 	jrne 4$ 
                                   1088 ; '/' operator	
      0096CB 4E 6F 20         [ 4] 1089 	call div24 
      0096CE 70 72            [ 2] 1090 	jra term01 
      001A9C                       1091 4$: ; '%' operator
      0096D0 6F 67 72         [ 4] 1092 	call mod24
      0096D3 61 6D            [ 2] 1093 	jra term01 
      001AA1                       1094 9$: 
      0096D5 20 69            [ 1] 1095 	ld a,#TK_INTGR
      001AA3                       1096 term_exit:
      001AA3                       1097 	_drop VSIZE 
      0096D7 6E 20            [ 2]    1     addw sp,#VSIZE 
      0096D9 52               [ 4] 1098 	ret 
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
      001AA6                       1109 expression:
      001AA6                       1110 	_vars VSIZE 
      0096DA 41 4D            [ 2]    1     sub sp,#VSIZE 
                                   1111 ; first term 	
      0096DC 21 0A 00         [ 4] 1112 	call term
      0096DF 46               [ 1] 1113 	tnz a 
      0096E0 69 6C            [ 1] 1114 	jreq 9$
      001AAE                       1115 1$:	; operator '+'|'-'
      0096E2 65 20 73         [ 4] 1116 	call next_token
      0096E5 79 73            [ 1] 1117 	ld (OP,sp),a 
      0096E7 74 65            [ 1] 1118 	and a,#TK_GRP_MASK
      0096E9 6D 20            [ 1] 1119 	cp a,#TK_GRP_ADD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]



      0096EB 66 75            [ 1] 1120 	jreq 2$ 
      001AB9                       1121 	_unget_token 
      0096ED 6C 6C 2E 0A 00   [ 1]    1      mov in,in.saved  
      0096F2 42 75            [ 1] 1122 	ld a,#TK_INTGR
      0096F4 66 66            [ 2] 1123 	jra 9$ 
      001AC2                       1124 2$: ; second term 
      0096F6 65 72 20         [ 4] 1125 	call term
      0096F9 66               [ 1] 1126 	tnz a 
      0096FA 75 6C            [ 1] 1127 	jrne 3$
      0096FC 6C 0A 00         [ 2] 1128 	jp syntax_error
      001ACB                       1129 3$:
      0096FF 6F 76            [ 1] 1130 	ld a,(OP,sp)
      009701 65 72            [ 1] 1131 	cp a,#TK_PLUS 
      009703 66 6C            [ 1] 1132 	jrne 4$
                                   1133 ; '+' operator	
      009705 6F 77 0A         [ 4] 1134 	call add24
      009708 00 0A            [ 2] 1135 	jra 1$ 
      001AD6                       1136 4$:	; '-' operator 
      00970A 72 75 6E         [ 4] 1137 	call sub24
      00970D 20 74            [ 2] 1138 	jra 1$
      001ADB                       1139 9$:
      001ADB                       1140 	_drop VSIZE 
      00970F 69 6D            [ 2]    1     addw sp,#VSIZE 
      009711 65               [ 4] 1141 	ret 
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
      001ADE                       1152 relation: 
      001ADE                       1153 	_vars VSIZE
      009712 20 65            [ 2]    1     sub sp,#VSIZE 
      009714 72 72 6F         [ 4] 1154 	call expression
      009717 72               [ 1] 1155 	tnz a 
      009718 2C 20            [ 1] 1156 	jreq 9$ 
                                   1157 ; expect rel_op or leave 
      00971A 00 0A 63         [ 4] 1158 	call next_token 
      00971D 6F 6D            [ 1] 1159 	ld (RELOP,sp),a 
      00971F 70 69            [ 1] 1160 	and a,#TK_GRP_MASK
      009721 6C 65            [ 1] 1161 	cp a,#TK_GRP_RELOP 
      009723 20 65            [ 1] 1162 	jreq 2$
      009725 72 72            [ 1] 1163 	ld a,#TK_INTGR 
      001AF3                       1164 	_unget_token 
      009727 6F 72 2C 20 00   [ 1]    1      mov in,in.saved  
      00972C 6C 61            [ 2] 1165 	jra 9$ 
      001AFA                       1166 2$:	; expect another expression
      00972E 73 74 20         [ 4] 1167 	call expression
      009731 74               [ 1] 1168 	tnz a 
      009732 6F 6B            [ 1] 1169 	jrne 3$
      009734 65 6E 20         [ 2] 1170 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]



      001B03                       1171 3$: 
      009737 69 64 3A         [ 4] 1172 	call cp24 
      001B06                       1173 	_xpop  
      00973A 20 00            [ 1]    1     ld a,(y)
      00973C 93               [ 1]    2     ldw x,y 
      00973C A6 02            [ 2]    3     ldw x,(1,x)
      00973E 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00973E 72               [ 1] 1174 	tnz a 
      00973F 0A 00            [ 1] 1175 	jrmi 4$
      009741 23 4C            [ 1] 1176 	jrne 5$
      009743 88 AE 97 09      [ 1] 1177 	mov acc8,#2 ; i1==i2
      009747 CD 8A            [ 2] 1178 	jra 6$ 
      001B1A                       1179 4$: ; i1<i2
      009749 21 84 AE 95      [ 1] 1180 	mov acc8,#4 
      00974D AF 72            [ 2] 1181 	jra 6$
      001B20                       1182 5$: ; i1>i2
      00974F 5F 00 0E 48      [ 1] 1183 	mov acc8,#1  
      001B24                       1184 6$: ; 0=false, -1=true 
      009753 72               [ 1] 1185 	clrw x 
      009754 59 00 0E         [ 1] 1186 	ld a, acc8  
      009757 C7 00            [ 1] 1187 	and a,(RELOP,sp)
      009759 0F 72            [ 1] 1188 	jreq 7$
      00975B BB               [ 2] 1189 	cplw x 
      00975C 00 0E            [ 1] 1190 	ld a,#255 
      001B2F                       1191 7$:	_xpush 
      00975E FE CD 8A 21      [ 2]    1     subw y,#CELL_SIZE
      009762 CE 00            [ 1]    2     ld (y),a 
      009764 05 C6 00         [ 2]    3     ldw (1,y),x 
      009767 04 90            [ 1] 1192 	ld a,#TK_INTGR
      001B3A                       1193 9$: 
      001B3A                       1194 	_drop VSIZE
      009769 5F 90            [ 2]    1     addw sp,#VSIZE 
      00976B 02               [ 4] 1195 	ret 
                                   1196 
                                   1197 ;-------------------------------------------
                                   1198 ;  AND factor:   relation | (condition)
                                   1199 ;  output:
                                   1200 ;     A      TK_INTGR|0
                                   1201 ;-------------------------------------------
      001B3D                       1202 and_factor:
      00976C CD 87 20         [ 4] 1203 	call next_token  
      00976F CE               [ 1] 1204 	tnz a 
      009770 00 05            [ 1] 1205 	jreq 8$ 
      009772 C6 00            [ 1] 1206 	cp a,#TK_LPAREN 
      009774 02 CD            [ 1] 1207 	jrne 1$
      009776 A0 51 AE         [ 4] 1208 	call condition
      009779 97 2C            [ 1] 1209 	ld a,#TK_RPAREN 
      00977B CD 8A 21         [ 4] 1210 	call expect
      00977E C6               [ 4] 1211 	ret
      001B50                       1212 1$: _unget_token 
      00977F 00 03 5F 97 72   [ 1]    1      mov in,in.saved  
      009784 BB 00 05         [ 4] 1213 	call relation 
      009787 F6               [ 4] 1214 8$: ret 
                                   1215 
                                   1216 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 148.
Hexadecimal [24-Bits]



                                   1217 ;--------------------------------------------
                                   1218 ;  AND operator as priority over OR||XOR 
                                   1219 ;  format: relation | (condition) [AND relation|(condition)]*
                                   1220 ;          
                                   1221 ;  output:
                                   1222 ;     A     TK_INTGR|0
                                   1223 ;    xtack   value 
                                   1224 ;--------------------------------------------
      001B59                       1225 and_cond:
      009788 5F 97 CD         [ 4] 1226 	call and_factor
      00978B 98               [ 1] 1227 	tnz a 
      00978C 92 20            [ 1] 1228 	jreq 9$  
      00978E 35 17 BD         [ 4] 1229 1$: call next_token 
      00978F 4D               [ 1] 1230 	tnz a 
      00978F 88 AE            [ 1] 1231 	jreq 6$ 
      009791 97 1B            [ 1] 1232 	cp a,#TK_AND 
      009793 CD 8A            [ 1] 1233 	jreq 3$
      001B69                       1234 	_unget_token 
      009795 21 84 AE 95 AF   [ 1]    1      mov in,in.saved  
      00979A 72 5F            [ 2] 1235 	jra 6$ 
      00979C 00 0E 48         [ 4] 1236 3$:	call and_factor  
      00979F 72               [ 1] 1237 	tnz a 
      0097A0 59 00            [ 1] 1238 	jrne 4$
      0097A2 0E C7 00         [ 2] 1239 	jp syntax_error 
      001B79                       1240 4$:	
      001B79                       1241 	_xpop 
      0097A5 0F 72            [ 1]    1     ld a,(y)
      0097A7 BB               [ 1]    2     ldw x,y 
      0097A8 00 0E            [ 2]    3     ldw x,(1,x)
      0097AA FE CD 8A 21      [ 2]    4     addw y,#CELL_SIZE 
      0097AE AE 16 68         [ 1] 1242 	ld acc24,a 
      0097B1 CD 8A 21         [ 2] 1243 	ldw acc16,x
      001B88                       1244 	_xpop 
      0097B4 A6 0D            [ 1]    1     ld a,(y)
      0097B6 CD               [ 1]    2     ldw x,y 
      0097B7 89 C4            [ 2]    3     ldw x,(1,x)
      0097B9 CE 00 01 CD      [ 2]    4     addw y,#CELL_SIZE 
      0097BD 8A 8E A6         [ 1] 1245 	and a,acc24 
      0097C0 5E               [ 1] 1246 	rlwa x 
      0097C1 CD 89 C4         [ 1] 1247 	and a,acc16 
      0097C4 AE               [ 1] 1248 	rlwa x 
      0097C5 17 FF 94         [ 1] 1249 	and a,acc8 
      0097C8 02               [ 1] 1250 	rlwa x
      001B9D                       1251 	_xpush
      0097C8 CD 95 76 03      [ 2]    1     subw y,#CELL_SIZE
      0097CB 90 F7            [ 1]    2     ld (y),a 
      0097CB A6 0D CD         [ 2]    3     ldw (1,y),x 
      0097CE 89 C4            [ 2] 1252 	jra 1$  
      0097D0 A6 3E            [ 1] 1253 6$: ld a,#TK_INTGR 
      0097D2 CD               [ 4] 1254 9$:	ret 	 
                                   1255 
                                   1256 
                                   1257 ;--------------------------------------------
                                   1258 ; condition for IF and UNTIL 
                                   1259 ; operators: OR,XOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 149.
Hexadecimal [24-Bits]



                                   1260 ; format:  and_cond [ OP and_cond ]* 
                                   1261 ; output:
                                   1262 ;    A        INTGR|0 
                                   1263 ;    xstack   value 
                                   1264 ;--------------------------------------------
                           000001  1265 	ATMP=1
                           000002  1266 	OP=2
                           000002  1267 	VSIZE=2 
      001BAB                       1268 condition:
      001BAB                       1269 	_vars VSIZE 
      0097D3 89 C4            [ 2]    1     sub sp,#VSIZE 
      0097D5 CD 8B 26         [ 4] 1270 	call and_cond
      0097D8 72               [ 1] 1271 	tnz a 
      0097D9 5D 00            [ 1] 1272 	jreq 9$ 
      0097DB 04 27 ED         [ 4] 1273 1$:	call next_token 
      0097DE CD 91            [ 1] 1274 	cp a,#TK_OR 
      0097E0 69 72            [ 1] 1275 	jreq 2$
      0097E2 5D 00            [ 1] 1276 	cp a,#TK_XOR
      0097E4 04 27            [ 1] 1277 	jreq 2$ 
      001BBE                       1278 	_unget_token 
      0097E6 E4 00 02 00 01   [ 1]    1      mov in,in.saved  
      0097E7 20 55            [ 2] 1279 	jra 8$ 
      0097E7 C6 00            [ 1] 1280 2$:	ld (OP,sp),a ; TK_OR|TK_XOR 
      0097E9 02 C1 00         [ 4] 1281 	call and_cond
      0097EC 04 2B            [ 1] 1282 	cp a,#TK_INTGR 
      0097EE 1D 03            [ 1] 1283 	jreq 3$
      0097EF CC 16 BC         [ 2] 1284 	jp syntax_error 
      001BD1                       1285 3$:	 
      001BD1                       1286 	_xpop  ; rigth arg 
      0097EF 72 01            [ 1]    1     ld a,(y)
      0097F1 00               [ 1]    2     ldw x,y 
      0097F2 23 D7            [ 2]    3     ldw x,(1,x)
      0097F4 CE 00 05 72      [ 2]    4     addw y,#CELL_SIZE 
      0097F8 BB 00 01         [ 1] 1287 	ld acc24,a 
      0097FB C3 00 1E         [ 2] 1288 	ldw acc16,x 
      001BE0                       1289 	_xpop  ; left arg  
      0097FE 2A C8            [ 1]    1     ld a,(y)
      009800 CF               [ 1]    2     ldw x,y 
      009801 00 05            [ 2]    3     ldw x,(1,x)
      009803 E6 02 C7 00      [ 2]    4     addw y,#CELL_SIZE 
      009807 04 35            [ 1] 1290 	ld (ATMP,sp),a 
      009809 03 00            [ 1] 1291 	ld a,(OP,sp)
      00980B 02 89            [ 1] 1292 	cp a,#TK_XOR 
      00980C 27 10            [ 1] 1293 	jreq 5$ 
      001BF1                       1294 4$: ; A:X OR acc24   
      00980C CD 98            [ 1] 1295 	ld a,(ATMP,sp)
      00980E 3D A1 00         [ 1] 1296 	or a,acc24 
      009811 27               [ 1] 1297 	rlwa x 
      009812 DC A1 80         [ 1] 1298 	or a,acc16 
      009815 26               [ 1] 1299 	rlwa x 
      009816 06 CD 98         [ 1] 1300 	or a,acc8 
      009819 56               [ 1] 1301 	rlwa x 
      00981A FD 20            [ 2] 1302 	jra 6$  
      001C01                       1303 5$: ; A:X XOR acc24 
      00981C EF 01            [ 1] 1304 	ld a,(ATMP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 150.
Hexadecimal [24-Bits]



      00981D C8 00 0C         [ 1] 1305 	xor a,acc24 
      00981D A1               [ 1] 1306 	rlwa x 
      00981E 85 26 05         [ 1] 1307 	xor a,acc16 
      009821 CD               [ 1] 1308 	rlwa x 
      009822 9D 10 20         [ 1] 1309 	xor a,acc8 
      009825 E6               [ 1] 1310 	rlwa x 
      009826                       1311 6$: _xpush
      009826 A1 05 26 05      [ 2]    1     subw y,#CELL_SIZE
      00982A CD 9D            [ 1]    2     ld (y),a 
      00982C 0B 20 DD         [ 2]    3     ldw (1,y),x 
      00982F 20 99            [ 2] 1312 	jra 1$ 
      00982F A1 0A            [ 1] 1313 8$:	ld a,#TK_INTGR 
      001C1C                       1314 9$:	_drop VSIZE 
      009831 27 D9            [ 2]    1     addw sp,#VSIZE 
      009833 A1               [ 4] 1315 	ret 
                                   1316 
                                   1317 
                                   1318 ;--------------------------------------------
                                   1319 ; BASIC: HEX 
                                   1320 ; select hexadecimal base for integer print
                                   1321 ;---------------------------------------------
      001C1F                       1322 hex_base:
      009834 03 CD 98 63      [ 1] 1323 	mov base,#16 
      009838 20               [ 4] 1324 	ret 
                                   1325 
                                   1326 ;--------------------------------------------
                                   1327 ; BASIC: DEC 
                                   1328 ; select decimal base for integer print
                                   1329 ;---------------------------------------------
      001C24                       1330 dec_base:
      009839 D2 CC 97 3C      [ 1] 1331 	mov base,#10
      00983D 81               [ 4] 1332 	ret 
                                   1333 
                                   1334 ;------------------------
                                   1335 ; BASIC: FREE 
                                   1336 ; return free size in RAM 
                                   1337 ; output:
                                   1338 ;   A:x		size 
                                   1339 ;--------------------------
      001C29                       1340 free:
      00983D C6 00            [ 2] 1341 	pushw y 
      00983F 02               [ 1] 1342 	clr a 
      009840 C7 00 03         [ 2] 1343 	ldw x,#tib 
      009843 C0 00 04 27      [ 2] 1344 	ldw y,txtbgn 
      009847 0D A3 36 00      [ 2] 1345 	cpw y,#app_space
      009848 25 05            [ 1] 1346 	jrult 1$
      009848 CE 00 05         [ 2] 1347 	subw x,#free_ram 
      00984B 72 BB            [ 2] 1348 	jra 2$ 
      001C3E                       1349 1$:	
      00984D 00 01 F6 5C      [ 2] 1350 	subw x,txtend
      009851 72 5C            [ 2] 1351 2$:	popw y 
      009853 00               [ 4] 1352 	ret 
                                   1353 
                                   1354 ;------------------------------
                                   1355 ; BASIC: SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 151.
Hexadecimal [24-Bits]



                                   1356 ; command that print 
                                   1357 ; program start addres and size 
                                   1358 ;------------------------------
      001C45                       1359 cmd_size:
      009854 02 81 0A         [ 1] 1360 	push base 
      009856 AE 1E 9E         [ 2] 1361 	ldw x,#PROG_ADDR 
      009856 FE DE B3         [ 4] 1362 	call puts 
      009859 C9 72 5C         [ 2] 1363 	ldw x,txtbgn     
      00985C 00 02 72 5C      [ 1] 1364 	mov base,#16 
      009860 00 02 81         [ 4] 1365 	call prt_i16
      009863 32 00 0A         [ 1] 1366 	pop base 
      009863 F6 27 03         [ 2] 1367 	ldw x,#PROG_SIZE 
      009866 5C 20 FA         [ 4] 1368 	call puts 
      009869 5C 72 B0         [ 2] 1369 	ldw x,txtend 
      00986C 00 05 CF 00      [ 2] 1370 	subw x,txtbgn 
      009870 01 81 12         [ 4] 1371 	call prt_i16
      009872 AE 1E C1         [ 2] 1372 	ldw x,#STR_BYTES 
      009872 FE 72 5C         [ 4] 1373 	call puts  
      009875 00               [ 4] 1374 	ret 
                                   1375 
                                   1376 
                                   1377 ;------------------------
                                   1378 ; BASIC: UBOUND  
                                   1379 ; return array variable size 
                                   1380 ; and set 'array_size' variable 
                                   1381 ; output:
                                   1382 ;   A:X 	array_size
                                   1383 ;--------------------------
      001C72                       1384 ubound:
      009876 02 72 5C         [ 4] 1385 	call free 
      009879 00 02            [ 1] 1386 	ld a,#CELL_SIZE 
      00987B 81               [ 4] 1387 	mul x,a 
      00987C CF 00 20         [ 2] 1388 	ldw array_size,x
      00987C F6               [ 1] 1389 	clr a 
      00987D EE               [ 4] 1390 	ret 
                                   1391 
                                   1392 ;-----------------------------
                                   1393 ; BASIC: LET var=expr 
                                   1394 ; variable assignement 
                                   1395 ; output:
                                   1396 ;   A 		TK_NONE 
                                   1397 ;-----------------------------
      001C7D                       1398 let::
      00987E 01 72 5C         [ 4] 1399 	call next_token 
      009881 00 02            [ 1] 1400 	cp a,#TK_VAR 
      009883 72 5C            [ 1] 1401 	jreq let_var
      009885 00 02            [ 1] 1402 	cp a,#TK_ARRAY 
      009887 72 5C            [ 1] 1403 	jreq  let_array
      009889 00 02 81         [ 2] 1404 	jp syntax_error
      00988C                       1405 let_array:
      00988C F6 72 5C         [ 4] 1406 	call get_array_element
      00988F 00 02            [ 2] 1407 	jra let_eval 
      001C90                       1408 let_var:
      009891 81 17 F2         [ 4] 1409 	call get_addr
      009892                       1410 let_eval:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 152.
Hexadecimal [24-Bits]



      009892 72 5F 00         [ 2] 1411 	ldw ptr16,x  ; variable address 
      009895 0D CF 00         [ 4] 1412 	call next_token 
      009898 0E A6            [ 1] 1413 	cp a,#TK_EQUAL
      00989A 10 C1            [ 1] 1414 	jreq 1$
      00989C 00 0B 27         [ 2] 1415 	jp syntax_error
      001CA0                       1416 1$:	
      00989F 09 72 0F         [ 4] 1417 	call condition   
      0098A2 00 0E            [ 1] 1418 	cp a,#TK_INTGR 
      0098A4 04 72            [ 1] 1419 	jreq 2$
      0098A6 53 00 0D         [ 2] 1420 	jp syntax_error
      0098A9                       1421 2$:	
      001CAA                       1422 	_xpop ; value 
      0098A9 A6 FF            [ 1]    1     ld a,(y)
      0098AB CD               [ 1]    2     ldw x,y 
      0098AC 98 CF            [ 2]    3     ldw x,(1,x)
      0098AE CD 92 13 88      [ 2]    4     addw y,#CELL_SIZE 
      001CB3                       1423 3$:
      0098B2 CD 8A 21 84      [ 4] 1424 	ld [ptr16],a
      0098B6 81 5C 00 1A      [ 1] 1425 	inc ptr8  
      0098B7 72 CF 00 19      [ 5] 1426 	ldw [ptr16],x 
      0098B7 90               [ 4] 1427 	ret 
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
      001CC0                       1438 get_const_value: ; -- i 
      0098B8 F6               [ 1] 1439 	ld a,(x) ; record size 
      0098B9 93 EE            [ 1] 1440 	sub a,#3 ; * value 
      0098BB 01               [ 1] 1441 	push a 
      0098BC 72 A9            [ 1] 1442 	push #0 
      0098BE 00 03 C7         [ 2] 1443 	addw x,(1,sp)
      0098C1 00               [ 1] 1444 	ld a,(x)
      0098C2 0D CF            [ 2] 1445 	ldw x,(1,x)
      001CCC                       1446 	_drop 2
      0098C4 00 0E            [ 2]    1     addw sp,#2 
      0098C6 CD               [ 4] 1447 	ret 
                                   1448 
                                   1449 
                                   1450 ;--------------------------
                                   1451 ; list constants in EEPROM 
                                   1452 ; call when using LIST \C 
                                   1453 ;-------------------------
                           000001  1454 	COUNT=1
                           000003  1455 	YTEMP=3
                           000004  1456 	VSIZE=4 
      001CCF                       1457 list_const:
      0098C7 98 A9            [ 2] 1458 	pushw y 
      001CD1                       1459 	_vars 4 
      0098C9 A6 20            [ 2]    1     sub sp,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 153.
Hexadecimal [24-Bits]



      0098CB CD               [ 1] 1460 	clrw x 
      0098CC 89 C4            [ 2] 1461 	ldw (COUNT,sp),x  
      0098CE 81 AE 40 00      [ 2] 1462 	ldw Y,#EEPROM_BASE 
      0098CF 90 C3 00 24      [ 2] 1463 1$:	cpw y,free_eeprom 
      0098CF 52 04            [ 1] 1464 	jruge 9$
      0098D1 0F 02            [ 2] 1465     ldw (YTEMP,sp),y 
      0098D3 0F               [ 1] 1466 	ldw x,y
      0098D4 01               [ 1] 1467 	incw x 
      0098D5 4D 27 11         [ 4] 1468 	call puts  
      0098D8 C6 00            [ 1] 1469 	ld a,#'= 
      0098DA 0B A1 0A         [ 4] 1470 	call putc 
      0098DD 26 0A            [ 2] 1471 	ldw x,(YTEMP,sp)
      0098DF 72 0F 00         [ 4] 1472 	call get_const_value 
      0098E2 0D 05 03         [ 1] 1473 	ld acc24,a 
      0098E5 01 CD 82         [ 2] 1474 	ldw acc16,x 
      0098E8 8D 18 29         [ 4] 1475 	call prt_acc24
      0098E9 A6 0D            [ 1] 1476 	ld a,#CR 
      0098E9 AE 16 68         [ 4] 1477 	call putc 
      0098EC 1C 00            [ 2] 1478 	ldw x,(COUNT,sp)
      0098EE 50               [ 1] 1479 	incw x 
      0098EF 5A 7F            [ 2] 1480 	ldw (COUNT,sp),x 
      0098F1 72 5F 00 0D      [ 1] 1481 	clr acc16 
      0098F1 C6 00            [ 2] 1482 	ldw y,(YTEMP,sp)
      0098F3 0B CD            [ 1] 1483 	ld a,(y)
      0098F5 83 89 AB         [ 1] 1484 	ld acc8,a
      0098F8 30 A1 3A 2B      [ 2] 1485 	addw y,acc16 
      0098FC 02 AB            [ 2] 1486 	jra 1$ 
      001D15                       1487 9$:	
      0098FE 07 01            [ 2] 1488 	ldw x,(COUNT,sp)
      0098FF CD 18 12         [ 4] 1489 	call prt_i16 
      0098FF 5A F7 0C         [ 2] 1490 	ldw x,#CONST_COUNT 
      009902 02 C6 00         [ 4] 1491 	call puts 
      001D20                       1492 	_drop VSIZE 
      009905 0D CA            [ 2]    1     addw sp,#VSIZE 
      009907 00 0E            [ 2] 1493 	popw y 
      009909 CA               [ 4] 1494 	ret 
                                   1495 
      00990A 00 0F 26 E3 C6 00 0B  1496 CONST_COUNT: .asciz " constants in EEPROM\n"
             A1 10 27 08 7B 01 27
             0A A6 2D 20 02 4D 0A
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
      00991D                       1509 func_eefree:
      00991D A6 24 5A         [ 2] 1510 	ldw x,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 154.
Hexadecimal [24-Bits]



      009920 F7 0C 02 0E      [ 1] 1511 1$:	mov acc8,#8 ; count 8 consecutive zeros
      009923 A3 47 F8         [ 2] 1512     cpw x,#EEPROM_BASE+EEPROM_SIZE-8
      009923 7B 02            [ 1] 1513 	jruge 8$ ; no free space 
      009925 5B               [ 1] 1514 2$: ld a,(x)
      009926 04 81            [ 1] 1515 	jrne 3$
      009928 5C               [ 1] 1516 	incw x 
      009928 A1 61 2A 01      [ 1] 1517 	dec acc8 
      00992C 81 A1            [ 1] 1518 	jrne 2$
      00992E 7A 22 FB         [ 2] 1519 	subw x,#8 
      009931 A0 20            [ 2] 1520 	jra 9$  
      009933 81               [ 1] 1521 3$: ld a,(x)
      009934 5C               [ 1] 1522 	incw x
      009934 89               [ 1] 1523 	tnz a  
      009935 52 03            [ 1] 1524 	jrne 3$
      009937 72               [ 2] 1525 	decw x   
      009938 5F 00            [ 2] 1526 	jra 1$ 
      00993A 0D               [ 1] 1527 8$: clrw x ; no free space 
      00993B 72               [ 1] 1528 9$: clr a 
      00993C 5F 00 0E         [ 2] 1529 	ldw free_eeprom,x ; save in system variable 
      00993F 72               [ 4] 1530 	ret 
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
      001D64                       1553 search_const:
      009940 5F 00            [ 2] 1554 	pushw y 
      001D66                       1555 	_vars VSIZE
      009942 0F 0F            [ 2]    1     sub sp,#VSIZE 
      009944 01 A6 0A 6B      [ 1] 1556 	clr acc16 
      009948 02 F6 27         [ 4] 1557 	call strlen 
      00994B 47 A1            [ 1] 1558 	add a,#CONST_REC_XTRA_BYTES
      00994D 2D 26            [ 1] 1559 	ld (RECLEN,sp),a    
      00994F 04 03            [ 2] 1560 	ldw (NAMEPTR,sp),x
      009951 01 20 08 A1      [ 2] 1561 	ldw y,#EEPROM_BASE 
      009955 24 26            [ 2] 1562 1$:	ldw x,(NAMEPTR,sp)
      009957 06 A6            [ 2] 1563 	ldw (EEPTR,sp),y
      009959 10 6B 02 5C      [ 2] 1564 	cpw y, free_eeprom 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 155.
Hexadecimal [24-Bits]



      00995D F6 1A            [ 1] 1565 	jruge 7$ ; no match found 
      00995E 90 F6            [ 1] 1566 	ld a,(y)
      00995E A1 61            [ 1] 1567 	cp a,(RECLEN,sp)
      009960 2B 02            [ 1] 1568 	jrne 2$ 
      009962 A0 20            [ 1] 1569 	incw y 
      009964 A1 30 2B         [ 4] 1570 	call strcmp
      009967 2B A0            [ 1] 1571 	jrne 8$ ; match found 
      001D90                       1572 2$: ; skip this one 	
      009969 30 A1            [ 2] 1573 	ldW Y,(EEPTR,sp)
      00996B 0A 2B            [ 1] 1574 	ld a,(y)
      00996D 06 A0 07         [ 1] 1575 	ld acc8,a 
      009970 11 02 2A 1F      [ 2] 1576 	addw y,acc16 
      009974 6B 03            [ 2] 1577 	jra 1$  
      001D9D                       1578 7$: ; no match found 
      009976 7B 02            [ 1] 1579 	clr (EEPTR,sp)
      009978 CD 82            [ 1] 1580 	clr (EEPTR+1,sp)
      001DA1                       1581 8$: ; match found 
      00997A AA 7B            [ 2] 1582 	ldw x,(EEPTR,sp) ; record address 
      001DA3                       1583 9$:	_DROP VSIZE
      00997C 03 CB            [ 2]    1     addw sp,#VSIZE 
      00997E 00 0F            [ 2] 1584 	 popw y 
      009980 C7               [ 4] 1585 	 ret 
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
      001DA8                       1598 cmd_const:
      009981 00 0F            [ 2] 1599 	pushw y 
      001DAA                       1600 	_vars VSIZE 
      009983 4F C9            [ 2]    1     sub sp,#VSIZE 
      009985 00 0E            [ 1] 1601 	clr (UPDATE,sp)
      009987 C7 00 0E         [ 4] 1602 	call next_token 
      00998A 4F C9            [ 1] 1603 	cp a,#TK_CHAR 
      00998C 00 0D            [ 1] 1604 	jrne 0$
      00998E C7 00 0D         [ 4] 1605 	call get_char 
      009991 20 C9            [ 1] 1606 	and a,#0xDF 
      009993 0D 01            [ 1] 1607 	cp a,#'U 
      009995 27 03            [ 1] 1608 	jrne 1$
      009997 CD 82            [ 1] 1609 	cpl (UPDATE,sp)
      009999 8D 07            [ 2] 1610 	jra const_loop 
      00999A A1 03            [ 1] 1611 0$: cp a,#TK_LABEL 
      00999A 5B 03            [ 1] 1612 	jreq cloop_1
      00999C 85 81 BC         [ 2] 1613 1$: jp syntax_error
      00999E                       1614 const_loop: 
      00999E 52 05            [ 1] 1615 	ld a,#TK_LABEL 
      0099A0 17 04 69         [ 4] 1616 	call expect  
      0099A2                       1617 cloop_1: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 156.
Hexadecimal [24-Bits]



      0099A2 1F 02            [ 2] 1618 	ldw (CNAME,sp),x ; *const_name
      0099A4 F6 A4 0F         [ 4] 1619 	call skip_string
      0099A7 6B 01            [ 2] 1620 	ldw x,(CNAME,sp)
      0099A9 16 04 5C         [ 4] 1621 	call strlen  
      0099AC AB 05            [ 1] 1622 	add a,#CONST_REC_XTRA_BYTES 
      0099AC 90 F6            [ 1] 1623 	ld (RECLEN,sp),a 
                                   1624 ; copy name in buffer  
      0099AE 27 1B            [ 2] 1625 	ldw y,(CNAME,sp) 
      0099B0 0D 01 27         [ 2] 1626 	ldw x,#tib  
      0099B3 0A F1            [ 1] 1627 	ld a,(RECLEN,sp)
      0099B5 26               [ 1] 1628 	ld (x),a 
      0099B6 07               [ 1] 1629 	incw x  
      0099B7 90 5C 5C         [ 4] 1630 	call strcpy 
      0099BA 0A 01            [ 2] 1631 	ldw (BUFPTR,sp),x 
                                   1632 ; x not updated by strcpy 
                                   1633 ; BUFPTR must be incremented 
                                   1634 ; to point after name 
      0099BC 20               [ 1] 1635 	clrw x 
      0099BD EE 05            [ 1] 1636 	ld a,(RECLEN,sp)
      0099BE A0 04            [ 1] 1637 	sub a,#CONST_REC_XTRA_BYTES-1
      0099BE 1E               [ 1] 1638 	ld xl,a  
      0099BF 02 1D 00         [ 2] 1639 	addw x,(BUFPTR,sp)
      0099C2 02 4B            [ 2] 1640 	ldw (BUFPTR,sp),x 
      0099C4 00 FE            [ 1] 1641 	ld a,#TK_EQUAL 
      0099C6 84 27 1D         [ 4] 1642 	call expect 
      0099C9 20 D7            [ 2] 1643 	ldw y,(YSAVE,sp) ; restore xstack pointer 
      0099CB CD 1A A6         [ 4] 1644 	call expression 
      0099CB 1E 02            [ 1] 1645 	cp a,#TK_INTGR 
      0099CD F6 6B            [ 1] 1646 	jreq 5$ 
      0099CF 01 A4 0F         [ 2] 1647 	jp syntax_error 
      001E06                       1648 5$:	_xpop 
      0099D2 4C C7            [ 1]    1     ld a,(y)
      0099D4 00               [ 1]    2     ldw x,y 
      0099D5 0F 72            [ 2]    3     ldw x,(1,x)
      0099D7 5F 00 0E 72      [ 2]    4     addw y,#CELL_SIZE 
      0099DB BB 00            [ 2] 1649 	ldw (YSAVE,sp),y ; save xtack pointer 
      0099DD 0E FE            [ 2] 1650 	ldw y,(BUFPTR,sp)
      0099DF 7B 01            [ 1] 1651 	ld (y),a 
      0099E1 A4 F0 4E         [ 2] 1652 	ldw (1,y),x 
                                   1653 ; record completed in buffer 
                                   1654 ; check if constant already exist 
                                   1655 ; if exist and \U option then update  
      0099E4 AB 80 00 18      [ 1] 1656 	clr farptr 
      0099E6 1E 01            [ 2] 1657 	ldw x,(CNAME,sp)
      0099E6 5B 05 81         [ 4] 1658 	call search_const 
      0099E9 5D               [ 2] 1659 	tnzw x 
      0099E9 88 CD            [ 1] 1660 	jreq 6$ ; new constant  
      0099EB 98 3D            [ 1] 1661 	tnz (UPDATE,sp)
      0099ED 11 01            [ 1] 1662 	jreq 8$ 
      0099EF 27 03            [ 2] 1663 	jra 7$	
      001E2A                       1664 6$:	
      0099F1 CC 97 3C         [ 2] 1665 	ldw x,free_eeprom  
      001E2D                       1666 7$:	
      0099F4 84 81 19         [ 2] 1667 	ldw farptr+1,x 
      0099F6 AE 16 68         [ 2] 1668 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 157.
Hexadecimal [24-Bits]



      0099F6 A6 06            [ 1] 1669 	ld a,(RECLEN,sp)
      0099F8 CD 99 E9         [ 4] 1670 	call write_nbytes
                                   1671 ; update free_eeprom 
      0099FB 5F               [ 1] 1672 	clrw x 
      0099FB 4B 00            [ 1] 1673 	ld a,(RECLEN,sp)
      0099FD CD               [ 1] 1674 	ld xl,a 
      0099FE 9C 2B 4D 27      [ 2] 1675 	addw x,free_eeprom 
      009A02 12 0C 01         [ 2] 1676 	ldw free_eeprom,x
      001E43                       1677 8$: ; check for next constant 
      009A05 CD 98 3D         [ 4] 1678 	call next_token 
      009A08 A1 08            [ 1] 1679 	cp a,#TK_COMMA 
      009A0A 27 F1            [ 1] 1680 	jrne 9$ ; no other constant 
      009A0C A1 07 27         [ 2] 1681 	jp const_loop 
      001E4D                       1682 9$: 
      001E4D                       1683 	_unget_token    
      009A0F 05 55 00 03 00   [ 1]    1      mov in,in.saved  
      001E52                       1684 10$: 
      001E52                       1685 	_drop VSIZE 
      009A14 02 84            [ 2]    1     addw sp,#VSIZE 
      009A16 81 85            [ 2] 1686 	popw y ; restore xstack pointer 
      009A17 81               [ 4] 1687 	ret 
                                   1688 
                                   1689 
                                   1690 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1691 ; return program size 
                                   1692 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      001E57                       1693 prog_size:
      009A17 CD 99 F6         [ 2] 1694 	ldw x,txtend 
      009A1A A1 01 27 03      [ 2] 1695 	subw x,txtbgn 
      009A1E CC               [ 4] 1696 	ret 
                                   1697 
                                   1698 ;----------------------------
                                   1699 ; print program information 
                                   1700 ;---------------------------
      001E5F                       1701 program_info: 
      009A1F 97 3C 90         [ 2] 1702 	ldw x,#PROG_ADDR 
      009A22 F6 93 EE         [ 4] 1703 	call puts 
      009A25 01 72 A9         [ 2] 1704 	ldw x,txtbgn 
      009A28 00 03 C3 00      [ 1] 1705 	mov base,#16 
      009A2C 21 23 05         [ 4] 1706 	call prt_i16
      009A2F A6 0A CC 97      [ 1] 1707 	mov base,#10  
      009A33 3E 5D 27         [ 2] 1708 	ldw x,#PROG_SIZE
      009A36 F8 89 58         [ 4] 1709 	call puts 
      009A39 72 FB 01         [ 4] 1710 	call prog_size 
      009A3C 1F 01 AE         [ 4] 1711 	call prt_i16 
      009A3F 16 68 72         [ 2] 1712 	ldw x,#STR_BYTES 
      009A42 F0 01 5B         [ 4] 1713 	call puts
      009A45 02 81 1B         [ 2] 1714 	ldw x,txtbgn
      009A47 A3 36 04         [ 2] 1715 	cpw x,#app 
      009A47 52 01            [ 1] 1716 	jrult 2$
      009A49 0F 01 CD         [ 2] 1717 	ldw x,#FLASH_MEM 
      009A4C 98 3D            [ 2] 1718 	jra 3$
      009A4E 4D 26 03         [ 2] 1719 2$: ldw x,#RAM_MEM 	 
      009A51 CC 9A E0         [ 4] 1720 3$:	call puts 
      009A54 A1 10            [ 1] 1721 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 158.
Hexadecimal [24-Bits]



      009A56 27 06 A1         [ 4] 1722 	call putc
      009A59 11               [ 4] 1723 	ret 
                                   1724 
      009A5A 26 05 03 01 72 61 6D  1725 PROG_ADDR: .asciz "program address: "
             20 61 64 64 72 65 73
             73 3A 20 00
      009A5E 2C 20 70 72 6F 67 72  1726 PROG_SIZE: .asciz ", program size: "
             61 6D 20 73 69 7A 65
             3A 20 00
      009A5E CD 98 3D 74 65 73 00  1727 STR_BYTES: .asciz " bytes" 
      009A61 20 69 6E 20 46 4C 41  1728 FLASH_MEM: .asciz " in FLASH memory" 
             53 48 20 6D 65 6D 6F
             72 79 00
      009A61 4D 26 03 CC 97 3C 4D  1729 RAM_MEM:   .asciz " in RAM memory" 
             20 6D 65 6D 6F 72 79
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
      009A67                       1743 list:
      009A67 A1 81 26 06 CD   [ 2] 1744 	btjf flags,#FRUN,0$
      009A6C 98 56            [ 1] 1745 	ld a,#ERR_CMD_ONLY
      009A6E FD 20 5D         [ 2] 1746 	jp tb_error
      009A71                       1747 0$:	 
      009A71 A1 84 26         [ 4] 1748 	call next_token 
      009A74 05 CD            [ 1] 1749 	cp a,#TK_CHAR 
      009A76 98 7C            [ 1] 1750 	jrne 2$
      009A78 20 54 0C         [ 4] 1751 	call get_char 
      009A7A A4 DF            [ 1] 1752 	and a,#0xDF 
      009A7A A1 05            [ 1] 1753 	cp a,#'C 
      009A7C 26 05            [ 1] 1754 	jrne 1$
      009A7E CD 9A 17         [ 4] 1755 	call list_const
      009A81 20               [ 4] 1756 	ret 
      009A82 07 16 BC         [ 2] 1757 1$: jp syntax_error 
      009A83                       1758 2$:	_unget_token 
      009A83 A1 85 26 08 CD   [ 1]    1      mov in,in.saved  
      009A88 98 72 57         [ 4] 1759 	call prog_size 
      009A8A 22 01            [ 1] 1760 	jrugt 3$
      009A8A F6               [ 4] 1761 	ret 
      001F14                       1762 3$: _vars VSIZE
      009A8B EE 01            [ 2]    1     sub sp,#VSIZE 
      009A8D 20 3F 1B         [ 2] 1763 	ldw x,txtbgn 
      009A8F 1F 05            [ 2] 1764 	ldw (LN_PTR,sp),x 
      009A8F A1               [ 2] 1765 	ldw x,(x) 
      009A90 03 26            [ 2] 1766 	ldw (FIRST,sp),x ; list from first line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 159.
Hexadecimal [24-Bits]



      009A92 10 89 CD         [ 2] 1767 	ldw x,#MAX_LINENO ; biggest line number 
      009A95 98 63            [ 2] 1768 	ldw (LAST,sp),x 
      009A97 85 CD 9D         [ 4] 1769 	call arg_list
      009A9A E4               [ 1] 1770 	tnz a
      009A9B 5D 27            [ 1] 1771 	jreq list_loop 
      009A9D 28 CD            [ 1] 1772 	cp a,#2 
      009A9F 9D 40            [ 1] 1773 	jreq 4$
      009AA1 20 2B            [ 1] 1774 	cp a,#1 
      009AA3 27 06            [ 1] 1775 	jreq first_line 
      009AA3 A1 82 26         [ 2] 1776 	jp syntax_error 
      009AA6 08               [ 2] 1777 4$:	popw x 
      009AA7 CD 98            [ 2] 1778 	ldw (LAST+2,sp),x 
      001F37                       1779 first_line:
      009AA9 56               [ 2] 1780 	popw x
      009AAA FD 5F            [ 2] 1781 	ldw (FIRST,sp),x 
      001F3A                       1782 lines_skip:
      009AAC 02 20 1F         [ 2] 1783 	ldw x,txtbgn
      009AAF 1F 05            [ 2] 1784 2$:	ldw (LN_PTR,sp),x 
      009AAF A1 06 26         [ 2] 1785 	cpw x,txtend 
      009AB2 13 CD            [ 1] 1786 	jrpl list_exit 
      009AB4 9B               [ 2] 1787 	ldw x,(x) ;line# 
      009AB5 26 A6            [ 2] 1788 	cpw x,(FIRST,sp)
      009AB7 07 CD            [ 1] 1789 	jrpl list_loop 
      009AB9 99 E9            [ 2] 1790 	ldw x,(LN_PTR,sp) 
      009ABB 90 F6            [ 1] 1791 	ld a,(2,x)
      009ABD 93 EE 01         [ 1] 1792 	ld acc8,a 
      009AC0 72 A9 00 03      [ 1] 1793 	clr acc16 
      009AC4 20 08 00 0D      [ 2] 1794 	addw x,acc16
      009AC6 20 E3            [ 2] 1795 	jra 2$ 
                                   1796 ; print loop
      001F5A                       1797 list_loop:
      009AC6 55 00            [ 2] 1798 	ldw x,(LN_PTR,sp)
      009AC8 03 00            [ 1] 1799 	ld a,(2,x) 
      009ACA 02 4F 20         [ 4] 1800 	call prt_basic_line
      009ACD 12 05            [ 2] 1801 	ldw x,(LN_PTR,sp)
      009ACE E6 02            [ 1] 1802 	ld a,(2,x)
      009ACE 0D 01 27         [ 1] 1803 	ld acc8,a 
      009AD1 03 CD 82 85      [ 1] 1804 	clr acc16 
      009AD5 72 BB 00 0D      [ 2] 1805 	addw x,acc16
      009AD5 72 A2 00         [ 2] 1806 	cpw x,txtend 
      009AD8 03 90            [ 1] 1807 	jrpl list_exit
      009ADA F7 90            [ 2] 1808 	ldw (LN_PTR,sp),x
      009ADC EF               [ 2] 1809 	ldw x,(x)
      009ADD 01 A6            [ 2] 1810 	cpw x,(LAST,sp)  
      009ADF 84 DE            [ 1] 1811 	jrslt list_loop
      009AE0                       1812 list_exit:
      009AE0 5B 01 81 00 01   [ 1] 1813 	mov in,count 
      009AE3 AE 16 B8         [ 2] 1814 	ldw x,#pad 
      009AE3 52 01 CD         [ 2] 1815 	ldw basicptr,x 
      001F87                       1816 	_drop VSIZE 
      009AE6 9A 47            [ 2]    1     addw sp,#VSIZE 
      009AE8 4D 27 38         [ 4] 1817 	call program_info 
      009AEB 81               [ 4] 1818 	ret
                                   1819 
                                   1820 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 160.
Hexadecimal [24-Bits]



                                   1821 ;--------------------------
                                   1822 ; BASIC: EDIT 
                                   1823 ;  copy program in FLASH 
                                   1824 ;  to RAM for edition 
                                   1825 ;-------------------------
      001F8D                       1826 edit:
      009AEB CD 98 3D         [ 4] 1827 	call qsign 
      009AEE 6B 01            [ 1] 1828 	jreq 1$ 
      009AF0 A4 30 A1         [ 2] 1829 	ldw x,#NOT_SAVED 
      009AF3 20 27 09         [ 4] 1830 	call puts 
      009AF6 A6               [ 4] 1831 	ret 
      001F99                       1832 1$: 
      009AF7 84 55 00 03      [ 2] 1833 	ldw y,#app_sign ; source address 
      009AFB 00 02 20         [ 2] 1834     ldw x,app_size  
      009AFE 24 00 04         [ 2] 1835 	addw x,#4 
      009AFF CF 00 0D         [ 2] 1836 	ldw acc16,x  ; bytes to copy 
      009AFF CD 9A 47         [ 2] 1837 	ldw x,#rsign ; destination address 
      009B02 4D 26 03         [ 4] 1838 	call move  
      009B05 CC 97 3C         [ 2] 1839 	ldw x,#free_ram 
      009B08 CF 00 1B         [ 2] 1840 	ldw txtbgn,x 
      009B08 7B 01 A1 20      [ 2] 1841 	addw x,rsize  
      009B0C 26 05 CD         [ 2] 1842 	ldw txtend,x 
      009B0F 82               [ 4] 1843 	ret 
                                   1844 
      009B10 DD 20 D8 A1 21 26 05  1845 NOT_SAVED: .asciz "No application saved.\n"
             CD 83 A7 20 CF 6F 6E
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
      009B1C                       1857 prt_basic_line:
      009B1C CD 84            [ 2] 1858 	pushw y 
      009B1E 55 20 CA         [ 1] 1859 	ld count,a 
      009B21 E6 02            [ 1] 1860 	ld a,(2,x)
      009B21 A6 84 03         [ 1] 1861 	cp a,count 
      009B23 2A 03            [ 1] 1862 	jrpl 1$ 
      009B23 5B 01 81         [ 1] 1863 	ld count,a 
      009B26 CF 00 04         [ 2] 1864 1$:	ldw basicptr,x 
      009B26 52 01 CD 9A      [ 2] 1865 	ldw y,#tib  
      009B2A E3 4D 27         [ 4] 1866 	call decompile 
      009B2D 2D 09 A1         [ 4] 1867 	call puts 
      009B2E A6 0D            [ 1] 1868 	ld a,#CR 
      009B2E CD 98 3D         [ 4] 1869 	call putc 
      009B31 6B 01            [ 2] 1870 	popw y 
      009B33 A4               [ 4] 1871 	ret 
                                   1872 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 161.
Hexadecimal [24-Bits]



                                   1873 
                                   1874 ;---------------------------------
                                   1875 ; BASIC: PRINT|? arg_list 
                                   1876 ; print values from argument list
                                   1877 ;----------------------------------
                           000001  1878 	CCOMMA=1
                           000001  1879 	VSIZE=1
      001FF5                       1880 print:
      001FF5                       1881 	_vars VSIZE 
      009B34 30 A1            [ 2]    1     sub sp,#VSIZE 
      001FF7                       1882 reset_comma:
      009B36 10 27            [ 1] 1883 	clr (CCOMMA,sp)
      001FF9                       1884 prt_loop:
      009B38 09 55 00         [ 4] 1885 	call next_token
      009B3B 03 00            [ 1] 1886 	cp a,#CMD_END 
      009B3D 02 A6            [ 1] 1887 	jrult 0$
      009B3F 84 20            [ 1] 1888 	cp a,#TK_COLON 
      009B41 19 04            [ 1] 1889 	jreq 0$
      009B42 A1 80            [ 1] 1890 	cp a,#TK_CMD
      009B42 CD 9A            [ 1] 1891 	jrne 10$
      002008                       1892 0$:
      002008                       1893 	_unget_token 
      009B44 E3 4D 26 03 CC   [ 1]    1      mov in,in.saved  
      009B49 97 3C            [ 2] 1894 	jra 8$ 
      009B4B                       1895 10$:	
      009B4B 7B 01            [ 1] 1896 	cp a,#TK_QSTR
      009B4D A1 10            [ 1] 1897 	jreq 1$
      009B4F 26 05            [ 1] 1898 	cp a,#TK_CHAR 
      009B51 CD 81            [ 1] 1899 	jreq 2$ 
      009B53 EA 20            [ 1] 1900 	cp a,#TK_CFUNC 
      009B55 D8 1F            [ 1] 1901 	jreq 3$
      009B56 A1 08            [ 1] 1902 	cp a,#TK_COMMA 
      009B56 CD 82            [ 1] 1903 	jreq 4$
      009B58 07 20            [ 1] 1904 	cp a,#TK_SHARP 
      009B5A D3 24            [ 1] 1905 	jreq 5$
      009B5B 20 37            [ 2] 1906 	jra 7$ 
      002025                       1907 1$:	; print string 
      009B5B 5B 01 81         [ 4] 1908 	call puts
      009B5E 5C               [ 1] 1909 	incw x
      009B5E 52 01 CD 9B      [ 2] 1910 	subw x,basicptr 
      009B62 26 4D 27         [ 2] 1911 	ldw in.w,x  
      009B65 54 CD            [ 2] 1912 	jra reset_comma
      002032                       1913 2$:	; print character 
      009B67 98 3D 6B         [ 4] 1914 	call get_char 
      009B6A 01 A4 30         [ 4] 1915 	call putc 
      009B6D A1 30            [ 2] 1916 	jra reset_comma 
      00203A                       1917 3$: ; print character function value  	
      009B6F 27 09 A6         [ 4] 1918 	call get_code_addr 
      009B72 84               [ 4] 1919 	call (x)
      009B73 55 00 03         [ 4] 1920 	call putc
      009B76 00 02            [ 2] 1921 	jra reset_comma 
      002043                       1922 4$: ; set comma state 
      009B78 20 40            [ 1] 1923 	cpl (CCOMMA,sp)
      009B7A 20 B2            [ 2] 1924 	jra prt_loop   
      002047                       1925 5$: ; # character must be followed by an integer   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 162.
Hexadecimal [24-Bits]



      009B7A CD 9B 26         [ 4] 1926 	call next_token
      009B7D 4D 26            [ 1] 1927 	cp a,#TK_INTGR 
      009B7F 03 CC            [ 1] 1928 	jreq 6$
      009B81 97 3C BC         [ 2] 1929 	jp syntax_error 
      009B83                       1930 6$: ; set tab width
      009B83 CD 82 24         [ 4] 1931 	call get_int24 
      009B86 90               [ 1] 1932 	ld a,xl 
      009B87 F6 93            [ 1] 1933 	and a,#15 
      009B89 EE 01 72         [ 1] 1934 	ld tab_width,a 
      009B8C A9 00            [ 2] 1935 	jra reset_comma 
      00205C                       1936 7$:	
      00205C                       1937 	_unget_token 
      009B8E 03 4D 2B 08 26   [ 1]    1      mov in,in.saved  
      009B93 0C 35 02         [ 4] 1938 	call condition
      009B96 00               [ 1] 1939 	tnz a 
      009B97 0F 20            [ 1] 1940 	jreq 8$    
      009B99 0A 18 37         [ 4] 1941     call print_top
      009B9A 20 8B            [ 2] 1942 	jra reset_comma 
      00206C                       1943 8$:
      009B9A 35 04            [ 1] 1944 	tnz (CCOMMA,sp)
      009B9C 00 0F            [ 1] 1945 	jrne 9$
      009B9E 20 04            [ 1] 1946 	ld a,#CR 
      009BA0 CD 09 44         [ 4] 1947     call putc 
      002075                       1948 9$:	_drop VSIZE 
      009BA0 35 01            [ 2]    1     addw sp,#VSIZE 
      009BA2 00               [ 4] 1949 	ret 
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
      002078                       1967 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      002078                       1968 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      002078                       1969 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      002078                       1970 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      002078                       1971 save_context:
      009BA3 0F 00 04         [ 2] 1972 	ldw x,basicptr 
      009BA4 1F 03            [ 2] 1973 	ldw (BPTR,sp),x
      009BA4 5F C6 00         [ 1] 1974 	ld a,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 163.
Hexadecimal [24-Bits]



      009BA7 0F 14            [ 1] 1975 	ld (IN,sp),a
      009BA9 01 27 03         [ 1] 1976 	ld a,count 
      009BAC 53 A6            [ 1] 1977 	ld (CNT,sp),a  
      009BAE FF               [ 4] 1978 	ret
                                   1979 
                                   1980 ;-----------------------
                                   1981 ; restore previously saved 
                                   1982 ; BASIC interpreter context 
                                   1983 ; from stack 
                                   1984 ;-------------------------
      002088                       1985 rest_context:
      009BAF 72 A2            [ 2] 1986 	ldw x,(BPTR,sp)
      009BB1 00 03 90         [ 2] 1987 	ldw basicptr,x 
      009BB4 F7 90            [ 1] 1988 	ld a,(IN,sp)
      009BB6 EF 01 A6         [ 1] 1989 	ld in,a
      009BB9 84 06            [ 1] 1990 	ld a,(CNT,sp)
      009BBA C7 00 03         [ 1] 1991 	ld count,a  
      009BBA 5B               [ 4] 1992 	ret
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
      002098                       2006 input_var:
      009BBB 01 81            [ 2] 2007 	pushw y 
      009BBD                       2008 	_vars VSIZE 
      009BBD CD 98            [ 2]    1     sub sp,#VSIZE 
      00209C                       2009 input_loop:
      009BBF 3D 4D            [ 1] 2010 	clr (SKIP,sp)
      009BC1 27 15 A1         [ 4] 2011 	call next_token 
      009BC4 06 26            [ 1] 2012 	cp a,#TK_QSTR 
      009BC6 09 CD            [ 1] 2013 	jrne 1$ 
      009BC8 9C 2B A6         [ 4] 2014 	call puts 
      009BCB 07               [ 1] 2015 	incw x 
      009BCC CD 99 E9 81      [ 2] 2016 	subw x,basicptr 
      009BD0 55 00 03         [ 2] 2017 	ldw in.w,x 
      009BD3 00 02            [ 1] 2018 	cpl (SKIP,sp)
      009BD5 CD 9B 5E         [ 4] 2019 	call next_token 
      009BD8 81 85            [ 1] 2020 1$: cp a,#TK_VAR  
      009BD9 27 03            [ 1] 2021 	jreq 2$ 
      009BD9 CD 9B BD         [ 2] 2022 	jp syntax_error
      009BDC 4D 27 4B         [ 4] 2023 2$:	call get_addr
      009BDF CD 98 3D         [ 2] 2024 	ldw ptr16,x 
      009BE2 4D 27            [ 1] 2025 	tnz (SKIP,sp)
      009BE4 43 A1            [ 1] 2026 	jrne 21$ 
      009BE6 87 27 07         [ 4] 2027 	call var_name 
      009BE9 55 00 03         [ 4] 2028 	call putc   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 164.
Hexadecimal [24-Bits]



      0020CC                       2029 21$:
      009BEC 00 02            [ 1] 2030 	ld a,#':
      009BEE 20 38 CD         [ 4] 2031 	call putc 
      009BF1 9B BD 4D         [ 4] 2032 	call save_context 
      009BF4 26 03 CC 97      [ 1] 2033 	clr count  
      009BF8 3C 0A A6         [ 4] 2034 	call readln 
      009BF9 AE 16 68         [ 2] 2035 	ldw x,#tib 
      009BF9 90 F6 93         [ 1] 2036 	push count
      009BFC EE 01            [ 1] 2037 	push #0 
      009BFE 72 A9 00         [ 2] 2038 	addw x,(1,sp)
      009C01 03               [ 1] 2039 	incw x 
      0020E7                       2040 	_drop 2 
      009C02 C7 00            [ 2]    1     addw sp,#2 
      009C04 0D CF 00 0E      [ 1] 2041 	clr in 
      009C08 90 F6 93         [ 4] 2042 	call get_token
      009C0B EE 01            [ 1] 2043 	cp a,#TK_INTGR
      009C0D 72 A9            [ 1] 2044 	jreq 3$ 
      009C0F 00 03            [ 1] 2045 	cp a,#TK_MINUS
      009C11 C4 00 0D         [ 4] 2046 	call get_token 
      009C14 02 C4            [ 1] 2047 	cp a,#TK_INTGR 
      009C16 00 0E            [ 1] 2048 	jreq 22$
      009C18 02 C4 00         [ 4] 2049 	call rest_context 
      009C1B 0F 02 72         [ 2] 2050 	jp syntax_error
      002103                       2051 22$:
      009C1E A2 00 03         [ 4] 2052 	call neg_acc24	
      002106                       2053 3$: 
      009C21 90 F7 90         [ 1] 2054 	ld a,acc24 
      009C24 EF 01 20         [ 2] 2055 	ldw x,acc16 
      009C27 B7 A6 84 81      [ 4] 2056 	ld [ptr16],a
      009C2B 72 5C 00 1A      [ 1] 2057 	inc ptr8  
      009C2B 52 02 CD 9B      [ 5] 2058 	ldw [ptr16],x 
      009C2F D9 4D 27         [ 4] 2059 	call rest_context
      009C32 69 CD 98         [ 4] 2060 	call next_token 
      009C35 3D A1            [ 1] 2061 	cp a,#TK_COMMA
      009C37 88 27            [ 1] 2062 	jrne 4$ 
      009C39 0B A1 89         [ 2] 2063 	jp input_loop
      002125                       2064 4$:
      009C3C 27 07            [ 1] 2065 	cp a,#TK_NONE 
      009C3E 55 00            [ 1] 2066 	jreq input_exit  
      009C40 03 00            [ 1] 2067 	cp a,#TK_COLON 
      009C42 02 20            [ 1] 2068     jreq input_exit 
      009C44 55 6B 02         [ 2] 2069 	jp syntax_error 
      002130                       2070 input_exit:
      002130                       2071 	_drop VSIZE 
      009C47 CD 9B            [ 2]    1     addw sp,#VSIZE 
      009C49 D9 A1            [ 2] 2072 	popw y 
      009C4B 84               [ 4] 2073 	ret 
                                   2074 
                                   2075 
                                   2076 ;---------------------
                                   2077 ; BASIC: REM | ' 
                                   2078 ; skip comment to end of line 
                                   2079 ;---------------------- 
      002135                       2080 remark::
      009C4C 27 03 CC 97 3C   [ 1] 2081 	mov in,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 165.
Hexadecimal [24-Bits]



      009C51 81               [ 4] 2082  	ret 
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
      00213B                       2098 wait: 
      00213B                       2099 	_vars VSIZE
      009C51 90 F6            [ 2]    1     sub sp,#VSIZE 
      009C53 93 EE            [ 1] 2100 	clr (XMASK,sp) 
      009C55 01 72 A9         [ 4] 2101 	call arg_list 
      009C58 00 03            [ 1] 2102 	cp a,#2
      009C5A C7 00            [ 1] 2103 	jruge 0$
      009C5C 0D CF 00         [ 2] 2104 	jp syntax_error 
      009C5F 0E 90            [ 1] 2105 0$:	cp a,#3
      009C61 F6 93            [ 1] 2106 	jrult 1$
      00214D                       2107 	_xpop  ; xor mask 
      009C63 EE 01            [ 1]    1     ld a,(y)
      009C65 72               [ 1]    2     ldw x,y 
      009C66 A9 00            [ 2]    3     ldw x,(1,x)
      009C68 03 6B 01 7B      [ 2]    4     addw y,#CELL_SIZE 
      009C6C 02               [ 1] 2108 	ld a,xl 
      009C6D A1 89            [ 1] 2109 	ld (XMASK,sp),a 
      002159                       2110 1$: _xpop ; mask
      009C6F 27 10            [ 1]    1     ld a,(y)
      009C71 93               [ 1]    2     ldw x,y 
      009C71 7B 01            [ 2]    3     ldw x,(1,x)
      009C73 CA 00 0D 02      [ 2]    4     addw y,#CELL_SIZE 
      009C77 CA               [ 1] 2111     ld a,xl  
      009C78 00 0E            [ 1] 2112 	ld (MASK,sp),a 
      002165                       2113 	_xpop ; address 
      009C7A 02 CA            [ 1]    1     ld a,(y)
      009C7C 00               [ 1]    2     ldw x,y 
      009C7D 0F 02            [ 2]    3     ldw x,(1,x)
      009C7F 20 0E 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009C81 F6               [ 1] 2114 2$:	ld a,(x)
      009C81 7B 01            [ 1] 2115 	and a,(MASK,sp)
      009C83 C8 00            [ 1] 2116 	xor a,(XMASK,sp)
      009C85 0D 02            [ 1] 2117 	jreq 2$ 
      002175                       2118 	_drop VSIZE 
      009C87 C8 00            [ 2]    1     addw sp,#VSIZE 
      009C89 0E               [ 4] 2119 	ret 
                                   2120 
                                   2121 ;---------------------
                                   2122 ; BASIC: BSET addr,mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 166.
Hexadecimal [24-Bits]



                                   2123 ; set bits at 'addr' corresponding 
                                   2124 ; to those of 'mask' that are at 1.
                                   2125 ; arguments:
                                   2126 ; 	addr 		memory address RAM|PERIPHERAL 
                                   2127 ;   mask        mask|addr
                                   2128 ; output:
                                   2129 ;	none 
                                   2130 ;--------------------------
      002178                       2131 bit_set:
      009C8A 02 C8 00         [ 4] 2132 	call arg_list 
      009C8D 0F 02            [ 1] 2133 	cp a,#2	 
      009C8F 72 A2            [ 1] 2134 	jreq 1$ 
      009C91 00 03 90         [ 2] 2135 	jp syntax_error
      002182                       2136 1$: 
      002182                       2137 	_xpop ; mask 
      009C94 F7 90            [ 1]    1     ld a,(y)
      009C96 EF               [ 1]    2     ldw x,y 
      009C97 01 20            [ 2]    3     ldw x,(1,x)
      009C99 99 A6 84 5B      [ 2]    4     addw y,#CELL_SIZE 
      009C9D 02               [ 1] 2138 	ld a,xl
      009C9E 81               [ 1] 2139 	push a  
      009C9F                       2140 	_xpop ; addr  
      009C9F 35 10            [ 1]    1     ld a,(y)
      009CA1 00               [ 1]    2     ldw x,y 
      009CA2 0B 81            [ 2]    3     ldw x,(1,x)
      009CA4 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CA4 35               [ 1] 2141 	pop a 
      009CA5 0A               [ 1] 2142 	or a,(x)
      009CA6 00               [ 1] 2143 	ld (x),a
      009CA7 0B               [ 4] 2144 	ret 
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
      00219A                       2156 bit_reset:
      009CA8 81 19 7B         [ 4] 2157 	call arg_list 
      009CA9 A1 02            [ 1] 2158 	cp a,#2  
      009CA9 90 89            [ 1] 2159 	jreq 1$ 
      009CAB 4F AE 16         [ 2] 2160 	jp syntax_error
      0021A4                       2161 1$: 
      0021A4                       2162 	_xpop ; mask 
      009CAE 68 90            [ 1]    1     ld a,(y)
      009CB0 CE               [ 1]    2     ldw x,y 
      009CB1 00 1C            [ 2]    3     ldw x,(1,x)
      009CB3 90 A3 B6 80      [ 2]    4     addw y,#CELL_SIZE 
      009CB7 25               [ 1] 2163 	ld a,xl 
      009CB8 05               [ 1] 2164 	cpl a
      009CB9 1D               [ 1] 2165 	push a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 167.
Hexadecimal [24-Bits]



      0021B0                       2166 	_xpop ; addr  
      009CBA 00 80            [ 1]    1     ld a,(y)
      009CBC 20               [ 1]    2     ldw x,y 
      009CBD 04 01            [ 2]    3     ldw x,(1,x)
      009CBE 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CBE 72               [ 1] 2167 	pop a 
      009CBF B0               [ 1] 2168 	and a,(x)
      009CC0 00               [ 1] 2169 	ld (x),a 
      009CC1 1E               [ 4] 2170 	ret 
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
      0021BD                       2182 bit_toggle:
      009CC2 90 85 81         [ 4] 2183 	call arg_list 
      009CC5 A1 02            [ 1] 2184 	cp a,#2 
      009CC5 3B 00            [ 1] 2185 	jreq 1$ 
      009CC7 0B AE 9F         [ 2] 2186 	jp syntax_error
      0021C7                       2187 1$: _xpop ; mask 
      009CCA 1E CD            [ 1]    1     ld a,(y)
      009CCC 8A               [ 1]    2     ldw x,y 
      009CCD 21 CE            [ 2]    3     ldw x,(1,x)
      009CCF 00 1C 35 10      [ 2]    4     addw y,#CELL_SIZE 
      009CD3 00               [ 1] 2188 	ld a,xl
      009CD4 0B               [ 1] 2189 	push a 
      0021D2                       2190 	_xpop  ; addr  
      009CD5 CD 98            [ 1]    1     ld a,(y)
      009CD7 92               [ 1]    2     ldw x,y 
      009CD8 32 00            [ 2]    3     ldw x,(1,x)
      009CDA 0B AE 9F 30      [ 2]    4     addw y,#CELL_SIZE 
      009CDE CD               [ 1] 2191 	pop a 
      009CDF 8A               [ 1] 2192 	xor a,(x)
      009CE0 21               [ 1] 2193 	ld (x),a 
      009CE1 CE               [ 4] 2194 	ret 
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
      0021DF                       2207 bit_test:
      009CE2 00 1E 72         [ 4] 2208 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 168.
Hexadecimal [24-Bits]



      009CE5 B0 00            [ 1] 2209 	cp a,#2
      009CE7 1C CD            [ 1] 2210 	jreq 0$
      009CE9 98 92 AE         [ 2] 2211 	jp syntax_error
      0021E9                       2212 0$:	
      0021E9                       2213 	_xpop 
      009CEC 9F 41            [ 1]    1     ld a,(y)
      009CEE CD               [ 1]    2     ldw x,y 
      009CEF 8A 21            [ 2]    3     ldw x,(1,x)
      009CF1 81 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009CF2 9F               [ 1] 2214 	ld a,xl 
      009CF2 CD 9C            [ 1] 2215 	and a,#7
      009CF4 A9               [ 1] 2216 	push a   
      009CF5 A6 03            [ 1] 2217 	ld a,#1 
      009CF7 42 CF            [ 1] 2218 1$: tnz (1,sp)
      009CF9 00 21            [ 1] 2219 	jreq 2$
      009CFB 4F               [ 1] 2220 	sll a 
      009CFC 81 01            [ 1] 2221 	dec (1,sp)
      009CFD 20 F7            [ 2] 2222 	jra 1$
      009CFD CD 98            [ 1] 2223 2$: ld (1,sp),a  
      002203                       2224 	_xpop ; address  
      009CFF 3D A1            [ 1]    1     ld a,(y)
      009D01 85               [ 1]    2     ldw x,y 
      009D02 27 0C            [ 2]    3     ldw x,(1,x)
      009D04 A1 05 27 03      [ 2]    4     addw y,#CELL_SIZE 
      009D08 CC               [ 1] 2225 	pop a 
      009D09 97               [ 1] 2226 	and a,(x)
      009D0A 3C 02            [ 1] 2227 	jreq 3$
      009D0B A6 01            [ 1] 2228 	ld a,#1 
      009D0B CD               [ 1] 2229 3$:	clrw x 
      009D0C 9A               [ 1] 2230 	ld xl,a
      009D0D 17               [ 1] 2231 	clr a  
      009D0E 20               [ 4] 2232 	ret
                                   2233 
                                   2234 ;--------------------
                                   2235 ; BASIC: POKE addr,byte
                                   2236 ; put a byte at addr 
                                   2237 ;--------------------
      002216                       2238 poke:
      009D0F 03 19 7B         [ 4] 2239 	call arg_list 
      009D10 A1 02            [ 1] 2240 	cp a,#2
      009D10 CD 98            [ 1] 2241 	jreq 1$
      009D12 72 16 BC         [ 2] 2242 	jp syntax_error
      009D13                       2243 1$:	
      002220                       2244 	_xpop ; byte   
      009D13 CF 00            [ 1]    1     ld a,(y)
      009D15 1A               [ 1]    2     ldw x,y 
      009D16 CD 98            [ 2]    3     ldw x,(1,x)
      009D18 3D A1 32 27      [ 2]    4     addw y,#CELL_SIZE 
      009D1C 03               [ 1] 2245     ld a,xl 
      009D1D CC               [ 1] 2246 	push a 
      00222B                       2247 	_xpop ; address 
      009D1E 97 3C            [ 1]    1     ld a,(y)
      009D20 93               [ 1]    2     ldw x,y 
      009D20 CD 9C            [ 2]    3     ldw x,(1,x)
      009D22 2B A1 84 27      [ 2]    4     addw y,#CELL_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 169.
Hexadecimal [24-Bits]



      009D26 03               [ 1] 2248 	pop a 
      009D27 CC               [ 1] 2249 	ld (x),a 
      009D28 97               [ 4] 2250 	ret 
                                   2251 
                                   2252 ;-----------------------
                                   2253 ; BASIC: PEEK(addr)
                                   2254 ; get the byte at addr 
                                   2255 ; input:
                                   2256 ;	none 
                                   2257 ; output:
                                   2258 ;	X 		value 
                                   2259 ;-----------------------
      002237                       2260 peek:
      009D29 3C 19 76         [ 4] 2261 	call func_args
      009D2A A1 01            [ 1] 2262 	cp a,#1 
      009D2A 90 F6            [ 1] 2263 	jreq 1$
      009D2C 93 EE 01         [ 2] 2264 	jp syntax_error
      002241                       2265 1$: _xpop ; address  
      009D2F 72 A9            [ 1]    1     ld a,(y)
      009D31 00               [ 1]    2     ldw x,y 
      009D32 03 01            [ 2]    3     ldw x,(1,x)
      009D33 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D33 72 C7 00         [ 1] 2266 	ld farptr,a 
      009D36 1A 72 5C         [ 2] 2267 	ldw ptr16,x 
      009D39 00 1B 72 CF      [ 5] 2268 	ldf a,[farptr]
      009D3D 00               [ 1] 2269 	clrw x 
      009D3E 1A               [ 1] 2270 	ld xl,a 
      009D3F 81               [ 1] 2271 	clr a 
      009D40 81               [ 4] 2272 	ret 
                                   2273 
                                   2274 ;---------------------------
                                   2275 ; BASIC IF expr : instructions
                                   2276 ; evaluate expr and if true 
                                   2277 ; execute instructions on same line. 
                                   2278 ;----------------------------
      002258                       2279 if: 
      009D40 F6 A0 03         [ 4] 2280 	call condition  
      00225B                       2281 	_xpop 
      009D43 88 4B            [ 1]    1     ld a,(y)
      009D45 00               [ 1]    2     ldw x,y 
      009D46 72 FB            [ 2]    3     ldw x,(1,x)
      009D48 01 F6 EE 01      [ 2]    4     addw y,#CELL_SIZE 
      009D4C 5B               [ 1] 2282 	tnz  a  
      009D4D 02 81            [ 1] 2283 	jrne 9$ 
                                   2284 ;skip to next line
      009D4F 55 00 03 00 01   [ 1] 2285 	mov in,count
      00226C                       2286 	_drop 2 
      009D4F 90 89            [ 2]    1     addw sp,#2 
      009D51 52 04 5F         [ 2] 2287 	jp next_line
      009D54 1F               [ 4] 2288 9$:	ret 
                                   2289 
                                   2290 ;------------------------
                                   2291 ; BASIC: FOR var=expr 
                                   2292 ; set variable to expression 
                                   2293 ; leave variable address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 170.
Hexadecimal [24-Bits]



                                   2294 ; on stack and set
                                   2295 ; FLOOP bit in 'flags'
                                   2296 ;-----------------
                           000001  2297 	RETL1=1 ; return address  
                           000003  2298 	FSTEP=3  ; variable increment int24
                           000006  2299 	LIMIT=6 ; loop limit, int24  
                           000009  2300 	CVAR=9   ; control variable 
                           00000B  2301 	INW=11   ;  in.w saved
                           00000D  2302 	BPTR=13 ; baseptr saved
                           00000D  2303 	VSIZE=13  
      002272                       2304 for: ; { -- var_addr }
      009D55 01               [ 2] 2305 	popw x ; call return address 
      002273                       2306 	_vars VSIZE 
      009D56 90 AE            [ 2]    1     sub sp,#VSIZE 
      009D58 40               [ 2] 2307 	pushw x  ; RETL1 
      009D59 00 90            [ 1] 2308 	ld a,#TK_VAR 
      009D5B C3 00 25         [ 4] 2309 	call expect
      009D5E 24 35 17         [ 4] 2310 	call get_addr
      009D61 03 93            [ 2] 2311 	ldw (CVAR,sp),x  ; control variable 
      009D63 5C CD 8A         [ 4] 2312 	call let_eval 
      009D66 21 A6 3D CD      [ 1] 2313 	bset flags,#FLOOP 
      009D6A 89 C4 1E         [ 4] 2314 	call next_token 
      009D6D 03 CD            [ 1] 2315 	cp a,#TK_CMD 
      009D6F 9D 40            [ 1] 2316 	jreq 1$
      009D71 C7 00 0D         [ 2] 2317 	jp syntax_error
      002291                       2318 1$:  
      009D74 CF 00 0E         [ 4] 2319 	call get_code_addr
      009D77 CD 98 A9         [ 2] 2320 	cpw x,#to   
      009D7A A6 0D            [ 1] 2321 	jreq to
      009D7C CD 89 C4         [ 2] 2322 	jp syntax_error 
                                   2323 
                                   2324 ;-----------------------------------
                                   2325 ; BASIC: TO expr 
                                   2326 ; second part of FOR loop initilization
                                   2327 ; leave limit on stack and set 
                                   2328 ; FTO bit in 'flags'
                                   2329 ;-----------------------------------
      00229C                       2330 to: ; { var_addr -- var_addr limit step }
      009D7F 1E 01 5C 1F 01   [ 2] 2331 	btjt flags,#FLOOP,1$
      009D84 72 5F 00         [ 2] 2332 	jp syntax_error
      009D87 0E 16 03         [ 4] 2333 1$: call expression   
      009D8A 90 F6            [ 1] 2334 	cp a,#TK_INTGR 
      009D8C C7 00            [ 1] 2335 	jreq 2$ 
      009D8E 0F 72 B9         [ 2] 2336 	jp syntax_error
      0022AE                       2337 2$: _xpop
      009D91 00 0E            [ 1]    1     ld a,(y)
      009D93 20               [ 1]    2     ldw x,y 
      009D94 C5 01            [ 2]    3     ldw x,(1,x)
      009D95 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      009D95 1E 01            [ 1] 2338 	ld (LIMIT,sp),a 
      009D97 CD 98            [ 2] 2339 	ldw (LIMIT+1,sp),x
      009D99 92 AE 9D         [ 4] 2340 	call next_token
      009D9C A5 CD            [ 1] 2341 	cp a,#TK_NONE  
      009D9E 8A 21            [ 1] 2342 	jreq 4$ 
      009DA0 5B 04            [ 1] 2343 	cp a,#TK_CMD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 171.
Hexadecimal [24-Bits]



      009DA2 90 85            [ 1] 2344 	jrne 3$
      009DA4 81 20 63         [ 4] 2345 	call get_code_addr
      009DA7 6F 6E 73         [ 2] 2346 	cpw x,#step 
      009DAA 74 61            [ 1] 2347 	jreq step
      0022CE                       2348 3$:	
      0022CE                       2349 	_unget_token   	 
      009DAC 6E 74 73 20 69   [ 1]    1      mov in,in.saved  
      0022D3                       2350 4$:	
      009DB1 6E 20            [ 1] 2351 	clr (FSTEP,sp) 
      009DB3 45 45 50         [ 2] 2352 	ldw x,#1   ; default step  
      009DB6 52 4F            [ 2] 2353 	ldw (FSTEP+1,sp),x 
      009DB8 4D 0A            [ 2] 2354 	jra store_loop_addr 
                                   2355 
                                   2356 
                                   2357 ;----------------------------------
                                   2358 ; BASIC: STEP expr 
                                   2359 ; optional third par of FOR loop
                                   2360 ; initialization. 	
                                   2361 ;------------------------------------
      0022DC                       2362 step: ; {var limit -- var limit step}
      009DBA 00 04 00 22 03   [ 2] 2363 	btjt flags,#FLOOP,1$
      009DBB CC 16 BC         [ 2] 2364 	jp syntax_error
      009DBB AE 40 00         [ 4] 2365 1$: call expression 
      009DBE 35 08            [ 1] 2366 	cp a,#TK_INTGR
      009DC0 00 0F            [ 1] 2367 	jreq 2$
      009DC2 A3 47 F8         [ 2] 2368 	jp syntax_error
      0022EE                       2369 2$:	
      0022EE                       2370 	_xpop 
      009DC5 24 17            [ 1]    1     ld a,(y)
      009DC7 F6               [ 1]    2     ldw x,y 
      009DC8 26 0C            [ 2]    3     ldw x,(1,x)
      009DCA 5C 72 5A 00      [ 2]    4     addw y,#CELL_SIZE 
      009DCE 0F 26            [ 1] 2371 	ld (FSTEP,sp),a 
      009DD0 F6 1D            [ 2] 2372 	ldw (FSTEP+1,sp),x ; step
                                   2373 ; if step < 0 decrement LIMIT 
      009DD2 00               [ 1] 2374 	tnz a
      009DD3 08 20            [ 1] 2375 	jrpl store_loop_addr 
      009DD5 09 F6            [ 1] 2376 	ld a,(LIMIT,sp)
      009DD7 5C 4D            [ 2] 2377 	ldw x,(LIMIT+1,sp)
      009DD9 26 FB 5A         [ 2] 2378 	subw x,#1 
      009DDC 20 E0            [ 1] 2379 	sbc a,#0 
      009DDE 5F 4F            [ 1] 2380 	ld (LIMIT,sp),a 
      009DE0 CF 00            [ 2] 2381 	ldw (LIMIT+1,sp),x 
                                   2382 ; leave loop back entry point on cstack 
                                   2383 ; cstack is 1 call deep from interpreter
      00230B                       2384 store_loop_addr:
      009DE2 25 81 04         [ 2] 2385 	ldw x,basicptr
      009DE4 1F 0D            [ 2] 2386 	ldw (BPTR,sp),x 
      009DE4 90 89 52         [ 2] 2387 	ldw x,in.w 
      009DE7 05 72            [ 2] 2388 	ldw (INW,sp),x   
      009DE9 5F 00 0E CD      [ 1] 2389 	bres flags,#FLOOP 
      009DED 94 80 AB 05      [ 1] 2390 	inc loop_depth  
      009DF1 6B               [ 4] 2391 	ret 
                                   2392 
                                   2393 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 172.
Hexadecimal [24-Bits]



                                   2394 ; BASIC: NEXT var 
                                   2395 ; FOR loop control 
                                   2396 ; increment variable with step 
                                   2397 ; and compare with limit 
                                   2398 ; loop if threshold not crossed.
                                   2399 ; else stack. 
                                   2400 ; and decrement 'loop_depth' 
                                   2401 ;--------------------------------
      00231E                       2402 next: ; {var limit step retl1 -- [var limit step ] }
      009DF2 05 1F 01 90      [ 1] 2403 	tnz loop_depth 
      009DF6 AE 40            [ 1] 2404 	jrne 1$ 
      009DF8 00 1E 01         [ 2] 2405 	jp syntax_error 
      002327                       2406 1$: 
      009DFB 17 03            [ 1] 2407 	ld a,#TK_VAR 
      009DFD 90 C3 00         [ 4] 2408 	call expect
      009E00 25 24 1A         [ 4] 2409 	call get_addr 
                                   2410 ; check for good variable after NEXT 	 
      009E03 90 F6            [ 2] 2411 	cpw x,(CVAR,sp)
      009E05 11 05            [ 1] 2412 	jreq 2$  
      009E07 26 07 90         [ 2] 2413 	jp syntax_error ; not the good one 
      002336                       2414 2$: 
      009E0A 5C CD 94         [ 2] 2415 	ldw ptr16,x 
                                   2416 	; increment variable 
      009E0D 8B               [ 1] 2417 	ld a,(x)
      009E0E 26 11            [ 2] 2418 	ldw x,(1,x)  ; get var value 
      009E10 72 FB 04         [ 2] 2419 	addw x,(FSTEP+1,sp) ; var+step 
      009E10 16 03            [ 1] 2420 	adc a,(FSTEP,sp)
      009E12 90 F6 C7 00      [ 4] 2421 	ld [ptr16],a
      009E16 0F 72 B9 00      [ 1] 2422 	inc ptr8  
      009E1A 0E 20 DC 19      [ 5] 2423 	ldw [ptr16],x 
      009E1D C7 00 0C         [ 1] 2424 	ld acc24,a 
      009E1D 0F 03 0F         [ 2] 2425 	ldw acc16,x 
      009E20 04 06            [ 1] 2426 	ld a,(LIMIT,sp)
      009E21 1E 07            [ 2] 2427 	ldw x,(LIMIT+1,sp)
      009E21 1E 03 5B 05      [ 2] 2428 	subw x,acc16 
      009E25 90 85 81         [ 1] 2429 	sbc a,acc24
      009E28 18 03            [ 1] 2430 	xor a,(FSTEP,sp)
      009E28 90 89            [ 1] 2431 	xor a,#0x80
      009E2A 52 08            [ 1] 2432 	jrmi loop_back  
      009E2C 0F 06            [ 2] 2433 	jra loop_done   
                                   2434 ; check sign of STEP  
      009E2E CD 98            [ 1] 2435 	ld a,(FSTEP,sp)
      009E30 3D A1            [ 1] 2436 	jrpl 4$
                                   2437 ;negative step
      009E32 04 26 0D         [ 1] 2438     ld a,acc8 
      009E35 CD 98            [ 1] 2439 	jrslt loop_back   
      009E37 8C A4            [ 2] 2440 	jra loop_done  
      002371                       2441 4$: ; positive step
      009E39 DF A1 55 26 08   [ 2] 2442 	btjt acc8,#7,loop_done 
      002376                       2443 loop_back:
      009E3E 03 06            [ 2] 2444 	ldw x,(BPTR,sp)
      009E40 20 07 A1         [ 2] 2445 	ldw basicptr,x 
      009E43 03 27 08 CC 97   [ 2] 2446 	btjf flags,#FRUN,1$ 
      009E48 3C 02            [ 1] 2447 	ld a,(2,x)
      009E49 C7 00 03         [ 1] 2448 	ld count,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 173.
Hexadecimal [24-Bits]



      009E49 A6 03            [ 2] 2449 1$:	ldw x,(INW,sp)
      009E4B CD 99 E9         [ 2] 2450 	ldw in.w,x 
      009E4E 81               [ 4] 2451 	ret 
      00238B                       2452 loop_done:
                                   2453 	; remove loop data from stack  
      009E4E 1F               [ 2] 2454 	popw x
      00238C                       2455 	_drop VSIZE 
      009E4F 01 CD            [ 2]    1     addw sp,#VSIZE 
      009E51 98 63 1E 01      [ 1] 2456 	dec loop_depth 
      009E55 CD               [ 2] 2457 	jp (x)
                                   2458 
                                   2459 ;----------------------------
                                   2460 ; called by goto/gosub
                                   2461 ; to get target line number 
                                   2462 ; output:
                                   2463 ;    x    line address 
                                   2464 ;---------------------------
      002393                       2465 get_target_line:
      009E56 94 80 AB         [ 4] 2466 	call next_token  
      009E59 05 6B            [ 1] 2467 	cp a,#TK_INTGR
      009E5B 05 16            [ 1] 2468 	jreq get_target_line_addr 
      009E5D 01 AE            [ 1] 2469 	cp a,#TK_LABEL 
      009E5F 16 68            [ 1] 2470 	jreq look_target_symbol 
      009E61 7B 05 F7         [ 2] 2471 	jp syntax_error
                                   2472 ; the target is a line number 
                                   2473 ; search it. 
      0023A1                       2474 get_target_line_addr:
      009E64 5C CD            [ 2] 2475 	pushw y 
      009E66 94 9C 1F         [ 4] 2476 	call get_int24 ; line # 
      009E69 03               [ 1] 2477 	clr a
      009E6A 5F 7B 05 A0      [ 2] 2478 	ldw y,basicptr 
      009E6E 04 97            [ 2] 2479 	ldw y,(y)
      009E70 72 FB            [ 2] 2480 	pushw y 
      009E72 03 1F            [ 2] 2481 	cpw x,(1,sp)
      0023B1                       2482 	_drop 2  
      009E74 03 A6            [ 2]    1     addw sp,#2 
      009E76 32 CD            [ 1] 2483 	jrult 11$
      009E78 99               [ 1] 2484 	inc a 
      0023B6                       2485 11$: ; scan program for this line# 	
      009E79 E9 16 07         [ 4] 2486 	call search_lineno  
      009E7C CD               [ 2] 2487 	tnzw x ; 0| line# address 
      009E7D 9B 26            [ 1] 2488 	jrne 2$ 
      009E7F A1 84            [ 1] 2489 	ld a,#ERR_NO_LINE 
      009E81 27 03 CC         [ 2] 2490 	jp tb_error 
      009E84 97 3C            [ 2] 2491 2$:	popw y  
      009E86 90               [ 4] 2492 	ret 
                                   2493 
                                   2494 ; the GOTO|GOSUB target is a symbol.
      0023C4                       2495 look_target_symbol:
      009E87 F6 93            [ 2] 2496 	pushw y 
      009E89 EE               [ 2] 2497 	pushw x 
      009E8A 01 72 A9 00      [ 1] 2498 	clr acc16 
      009E8E 03 17 07 16      [ 2] 2499 	ldw y,txtbgn 
      009E92 03 90 F7         [ 1] 2500 1$:	ld a,(3,y) ; first TK_ID on line 
      009E95 90 EF            [ 1] 2501 	cp a,#TK_LABEL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 174.
Hexadecimal [24-Bits]



      009E97 01 72            [ 1] 2502 	jreq 3$ 
      009E99 5F 00 19         [ 1] 2503 2$:	ld a,(2,y); line length 
      009E9C 1E 01 CD         [ 1] 2504 	ld acc8,a 
      009E9F 9D E4 5D 27      [ 2] 2505 	addw y,acc16 ;point to next line 
      009EA3 06 0D 06 27      [ 2] 2506 	cpw y,txtend 
      009EA7 1B 20            [ 1] 2507 	jrult 1$
      009EA9 03 0A            [ 1] 2508 	ld a,#ERR_BAD_VALUE
      009EAA CC 16 BE         [ 2] 2509 	jp tb_error 
      0023EB                       2510 3$: ; found a TK_LABEL 
                                   2511 	; compare with GOTO|GOSUB target 
      009EAA CE 00            [ 2] 2512 	pushw y ; line address 
      009EAC 25 A9 00 04      [ 2] 2513 	addw y,#4 ; label string 
      009EAD 1E 03            [ 2] 2514 	ldw x,(3,sp) ; target string 
      009EAD CF 00 1A         [ 4] 2515 	call strcmp
      009EB0 AE 16            [ 1] 2516 	jrne 4$
      009EB2 68 7B            [ 2] 2517 	popw y 
      009EB4 05 CD            [ 2] 2518 	jra 2$ 
      0023FC                       2519 4$: ; target found 
      009EB6 89               [ 2] 2520 	popw x ;  address line target  
      0023FD                       2521 	_drop 2 ; target string 
      009EB7 05 5F            [ 2]    1     addw sp,#2 
      009EB9 7B 05            [ 2] 2522 	popw y 
      009EBB 97               [ 4] 2523 	ret
                                   2524 
                                   2525 
                                   2526 ;--------------------------------
                                   2527 ; BASIC: ON expr GOTO|GOSUB line# [,line#]*
                                   2528 ; selective goto or gosub 
                                   2529 ;--------------------------------
      002402                       2530 cmd_on:
      009EBC 72 BB 00 25 CF   [ 2] 2531 	btjt flags,#FRUN,0$ 
      009EC1 00 25            [ 1] 2532 	ld a,#ERR_RUN_ONLY
      009EC3 CC 16 BE         [ 2] 2533 	jp tb_error 
      009EC3 CD 98 3D         [ 4] 2534 0$:	call expression 
      009EC6 A1 08            [ 1] 2535 	cp a,#TK_INTGR
      009EC8 26 03            [ 1] 2536 	jreq 1$
      009ECA CC 9E 49         [ 2] 2537 	jp syntax_error
      009ECD                       2538 1$: _xpop
      009ECD 55 00            [ 1]    1     ld a,(y)
      009ECF 03               [ 1]    2     ldw x,y 
      009ED0 00 02            [ 2]    3     ldw x,(1,x)
      009ED2 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
                                   2539 ; the selector is the element indice 
                                   2540 ; in the list of arguments. {1..#elements} 
      009ED2 5B               [ 1] 2541 	ld a,xl ; keep only bits 7..0
      009ED3 08 90            [ 1] 2542 	jreq 9$ ; element # begin at 1. 
      009ED5 85               [ 1] 2543 	push a  ; selector  
      009ED6 81 17 BD         [ 4] 2544 	call next_token
      009ED7 A1 80            [ 1] 2545 	cp a,#TK_CMD 
      009ED7 CE 00            [ 1] 2546 	jreq 2$ 
      009ED9 1E 72 B0         [ 2] 2547 	jp syntax_error 
      009EDC 00 1C 81         [ 4] 2548 2$: call get_code_addr
                                   2549 ;; must be a GOTO or GOSUB 
      009EDF A3 24 8E         [ 2] 2550 	cpw x,#goto 
      009EDF AE 9F            [ 1] 2551 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 175.
Hexadecimal [24-Bits]



      009EE1 1E CD 8A         [ 2] 2552 	cpw x,#gosub 
      009EE4 21 CE            [ 1] 2553 	jreq 4$ 
      009EE6 00 1C 35         [ 2] 2554 	jp syntax_error 
      00243D                       2555 4$: 
      009EE9 10               [ 1] 2556 	pop a 
      009EEA 00               [ 2] 2557 	pushw x ; save routine address 	
      009EEB 0B               [ 1] 2558 	push a  ; selector  
      002440                       2559 5$: ; skip elements in list until selector==0 
      009EEC CD 98            [ 1] 2560 	dec (1,sp)
      009EEE 92 35            [ 1] 2561 	jreq 6$ 
                                   2562 ; can be a line# or a label 
      009EF0 0A 00 0B         [ 4] 2563 	call next_token 
      009EF3 AE 9F            [ 1] 2564 	cp a,#TK_INTGR 
      009EF5 30 CD            [ 1] 2565 	jreq 52$
      009EF7 8A 21            [ 1] 2566 	cp a,#TK_LABEL 
      009EF9 CD 9E            [ 1] 2567 	jreq 54$
      009EFB D7 CD 98         [ 2] 2568 	jp syntax_error 
      002452                       2569 52$: ; got a line number 
      009EFE 92 AE 9F         [ 1] 2570 	ld a,in ; skip over int24 value 
      009F01 41 CD            [ 1] 2571 	add a,#CELL_SIZE ; integer size  
      009F03 8A 21 CE         [ 1] 2572 	ld in,a 
      009F06 00 1C            [ 2] 2573 	jra 56$
      009F08 A3 B6 84         [ 4] 2574 54$: call skip_string ; skip over label 	
      00245F                       2575 56$: ; if another element comma present 
      009F0B 25 05 AE         [ 4] 2576 	call next_token
      009F0E 9F 48            [ 1] 2577 	cp a,#TK_COMMA 
      009F10 20 03            [ 1] 2578 	jreq 5$ 
                                   2579 ; arg list exhausted, selector to big 
                                   2580 ; continue execution on next line 
      002466                       2581 	_drop 3 ; drop selector and GOTO|GOSUB address 
      009F12 AE 9F            [ 2]    1     addw sp,#3 
      009F14 59 CD            [ 2] 2582 	jra 9$
      00246A                       2583 6$: ;at selected position  
      00246A                       2584 	_drop 1 ; discard selector
      009F16 8A 21            [ 2]    1     addw sp,#1 
                                   2585 ; here only the routine address 
                                   2586 ; of GOTO|GOSUB is on stack 
      009F18 A6 0D CD         [ 4] 2587     call get_target_line
      009F1B 89 C4 81         [ 2] 2588 	ldw ptr16,x 	
      009F1E 70 72 6F 67 72   [ 1] 2589 	mov in,count ; move to end of line  
      009F23 61               [ 2] 2590 	popw x ; cmd address, GOTO||GOSUB 
      009F24 6D 20 61         [ 2] 2591 	cpw x,#goto 
      009F27 64 64            [ 1] 2592 	jrne 7$ 
      009F29 72 65 73         [ 2] 2593 	ldw x,ptr16 
      009F2C 73 3A            [ 2] 2594 	jra jp_to_target
      002482                       2595 7$: 
      009F2E 20 00            [ 2] 2596 	jra gosub_2 ; target in ptr16 
      002484                       2597 9$: ; expr out of range skip to end of line
                                   2598     ; this will force a fall to next line  
      009F30 2C 20 70 72 6F   [ 1] 2599 	mov in,count
      002489                       2600 	_drop 2
      009F35 67 72            [ 2]    1     addw sp,#2 
      009F37 61 6D 20         [ 2] 2601 	jp next_line  
                                   2602 
                                   2603 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 176.
Hexadecimal [24-Bits]



                                   2604 ;------------------------
                                   2605 ; BASIC: GOTO line# 
                                   2606 ; jump to line# 
                                   2607 ; here cstack is 2 call deep from interpreter 
                                   2608 ;------------------------
      00248E                       2609 goto:
      009F3A 73 69 7A 65 3A   [ 2] 2610 	btjt flags,#FRUN,goto_1  
      009F3F 20 00            [ 1] 2611 	ld a,#ERR_RUN_ONLY
      009F41 20 62 79         [ 2] 2612 	jp tb_error 
      002498                       2613 goto_1:
      009F44 74 65 73         [ 4] 2614 	call get_target_line
      00249B                       2615 jp_to_target:
      009F47 00 20 69         [ 2] 2616 	ldw basicptr,x 
      009F4A 6E 20            [ 1] 2617 	ld a,(2,x)
      009F4C 46 4C 41         [ 1] 2618 	ld count,a 
      009F4F 53 48 20 6D      [ 1] 2619 	mov in,#3 
      009F53 65               [ 4] 2620 	ret 
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
      0024A8                       2635 gosub:
      009F54 6D 6F 72 79 00   [ 2] 2636 	btjt flags,#FRUN,gosub_1 
      009F59 20 69            [ 1] 2637 	ld a,#ERR_RUN_ONLY
      009F5B 6E 20 52         [ 2] 2638 	jp tb_error 
      009F5E 41               [ 4] 2639 	ret 
      0024B3                       2640 gosub_1:
      009F5F 4D 20 6D         [ 4] 2641 	call get_target_line 
      009F62 65 6D 6F         [ 2] 2642 	ldw ptr16,x 
      0024B9                       2643 gosub_2: 
      009F65 72               [ 2] 2644 	popw x 
      0024BA                       2645 	_vars VSIZE  
      009F66 79 00            [ 2]    1     sub sp,#VSIZE 
      009F68 89               [ 2] 2646 	pushw x ; RET_ADDR 
      009F68 72 01 00         [ 2] 2647 	ldw x,ptr16 
      009F6B 23               [ 2] 2648 	pushw x ; TARGET
                                   2649 ; save BASIC subroutine return point.   
      009F6C 05 A6 07         [ 2] 2650 	ldw x,basicptr
      009F6F CC 97            [ 2] 2651 	ldw (RET_BPTR,sp),x 
      009F71 3E 00 00         [ 2] 2652 	ldw x,in.w 
      009F72 1F 07            [ 2] 2653 	ldw (RET_INW,sp),x
      009F72 CD               [ 2] 2654 	popw x 
      009F73 98 3D            [ 2] 2655 	jra jp_to_target
                                   2656 
                                   2657 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 177.
Hexadecimal [24-Bits]



                                   2658 ; BASIC: RETURN 
                                   2659 ; exit from BASIC subroutine 
                                   2660 ;------------------------
                           000003  2661 	RET_BPTR=3 ; basicptr return point 
                           000005  2662 	RET_INW=5  ; in.w return point 
                           000004  2663 	VSIZE=4  
      0024CE                       2664 return:
      009F75 A1 04 26 10 CD   [ 2] 2665 	btjt flags,#FRUN,0$ 
      009F7A 98 8C            [ 1] 2666 	ld a,#ERR_RUN_ONLY
      009F7C A4 DF A1         [ 2] 2667 	jp tb_error 
      0024D8                       2668 0$:	
      009F7F 43 26            [ 2] 2669 	ldw x,(RET_ADDR,sp) 
      009F81 04 CD 9D         [ 2] 2670 	ldw basicptr,x
      009F84 4F 81            [ 1] 2671 	ld a,(2,x)
      009F86 CC 97 3C         [ 1] 2672 	ld count,a  
      009F89 55 00            [ 2] 2673 	ldw x,(RET_INW,sp)
      009F8B 03 00 02         [ 2] 2674 	ldw in.w,x 
      009F8E CD               [ 2] 2675 	popw x 
      0024E8                       2676 	_drop VSIZE 
      009F8F 9E D7            [ 2]    1     addw sp,#VSIZE 
      009F91 22               [ 2] 2677 	pushw x
      009F92 01               [ 4] 2678 	ret  
                                   2679 
                                   2680 ;----------------------------------
                                   2681 ; BASIC: RUN
                                   2682 ; run BASIC program in RAM
                                   2683 ;----------------------------------- 
      0024EC                       2684 run: 
      009F93 81 52 06 CE 00   [ 2] 2685 	btjf flags,#FRUN,0$  
      009F98 1C               [ 1] 2686 	clr a 
      009F99 1F               [ 4] 2687 	ret
      0024F3                       2688 0$: 
      009F9A 05 FE 1F 01 AE   [ 2] 2689 	btjf flags,#FBREAK,1$
      0024F8                       2690 	_drop 2 
      009F9F 7F FF            [ 2]    1     addw sp,#2 
      009FA1 1F 03 CD         [ 4] 2691 	call rest_context
      0024FD                       2692 	_drop CTXT_SIZE 
      009FA4 99 FB            [ 2]    1     addw sp,#CTXT_SIZE 
      009FA6 4D 27 31 A1      [ 1] 2693 	bres flags,#FBREAK 
      009FAA 02 27 07 A1      [ 1] 2694 	bset flags,#FRUN 
      009FAE 01 27 06         [ 2] 2695 	jp interpreter 
      009FB1 CC 97 3C         [ 2] 2696 1$:	ldw x,txtbgn
      009FB4 85 1F 05         [ 2] 2697 	cpw x,txtend 
      009FB7 2B 0C            [ 1] 2698 	jrmi run_it 
      009FB7 85 1F 01         [ 2] 2699 	ldw x,#err_no_prog
      009FBA CD 09 A1         [ 4] 2700 	call puts 
      009FBA CE 00 1C 1F 05   [ 1] 2701 	mov in,count
      009FBF C3               [ 4] 2702 	ret 
      00251E                       2703 run_it:	 
      00251E                       2704 	_drop 2 ; drop return address 
      009FC0 00 1E            [ 2]    1     addw sp,#2 
      002520                       2705 run_it_02: 
      009FC2 2A 38 FE         [ 4] 2706     call ubound 
      009FC5 13 01 2A         [ 4] 2707 	call clear_vars 
                                   2708 ; clear data pointer 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 178.
Hexadecimal [24-Bits]



      009FC8 11               [ 1] 2709 	clrw x 
      009FC9 1E 05 E6         [ 2] 2710 	ldw data_ptr,x 
      009FCC 02 C7 00 0F      [ 1] 2711 	clr data_ofs 
      009FD0 72 5F 00 0E      [ 1] 2712 	clr data_len 
                                   2713 ; initialize BASIC pointer 
      009FD4 72 BB 00         [ 2] 2714 	ldw x,txtbgn 
      009FD7 0E 20 E3         [ 2] 2715 	ldw basicptr,x 
      009FDA E6 02            [ 1] 2716 	ld a,(2,x)
      009FDA 1E 05 E6         [ 1] 2717 	ld count,a
      009FDD 02 CD A0 51      [ 1] 2718 	mov in,#3	
      009FE1 1E 05 E6 02      [ 1] 2719 	bset flags,#FRUN 
      009FE5 C7 00 0F         [ 2] 2720 	jp interpreter 
                                   2721 
                                   2722 
                                   2723 ;----------------------
                                   2724 ; BASIC: END
                                   2725 ; end running program
                                   2726 ;---------------------- 
      002548                       2727 cmd_end: 
                                   2728 ; clean stack 
      009FE8 72 5F 00         [ 2] 2729 	ldw x,#STACK_EMPTY
      009FEB 0E               [ 1] 2730 	ldw sp,x 
      009FEC 72 BB 00         [ 2] 2731 	jp warm_start
                                   2732 
                                   2733 ;---------------------------
                                   2734 ; BASIC: GET var 
                                   2735 ; receive a key in variable 
                                   2736 ; don't wait 
                                   2737 ;---------------------------
      00254F                       2738 cmd_get:
      009FEF 0E C3 00         [ 4] 2739 	call next_token 
      009FF2 1E 2A            [ 1] 2740 	cp a,#TK_VAR 
      009FF4 07 1F            [ 1] 2741 	jreq 0$
      009FF6 05 FE 13         [ 2] 2742 	jp syntax_error 
      009FF9 03 2F DE         [ 4] 2743 0$: call get_addr 
      009FFC CF 00 19         [ 2] 2744 	ldw ptr16,x 
      009FFC 55 00 04         [ 4] 2745 	call qgetc 
      009FFF 00 02            [ 1] 2746 	jreq 2$
      00A001 AE 16 B8         [ 4] 2747 	call getc  
      00A004 CF 00 05 5B      [ 4] 2748 2$: clr [ptr16]
      00A008 06 CD 9E DF      [ 1] 2749 	inc ptr8 
      00A00C 81 3F 00 19      [ 4] 2750 	clr [ptr16]
      00A00D 72 5C 00 1A      [ 1] 2751 	inc ptr8 
      00A00D CD A8 31 27      [ 4] 2752 	ld [ptr16],a 
      00A011 07               [ 4] 2753 	ret 
                                   2754 
                                   2755 
                                   2756 ;-----------------
                                   2757 ; 1 Khz beep 
                                   2758 ;-----------------
      00257C                       2759 beep_1khz:: 
      00A012 AE A0 3A         [ 2] 2760 	ldw x,#100
      00A015 CD 8A 21 81      [ 2] 2761 	ldw y,#1000
      00A019 20 20            [ 2] 2762 	jra beep
                                   2763 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 179.
Hexadecimal [24-Bits]



                                   2764 ;-----------------------
                                   2765 ; BASIC: TONE expr1,expr2
                                   2766 ; used TIMER2 channel 1
                                   2767 ; to produce a tone 
                                   2768 ; arguments:
                                   2769 ;    expr1   frequency 
                                   2770 ;    expr2   duration msec.
                                   2771 ;---------------------------
      002585                       2772 tone:
      00A019 90 AE B6         [ 4] 2773 	call arg_list 
      00A01C 80 CE            [ 1] 2774 	cp a,#2 
      00A01E B6 82            [ 1] 2775 	jreq 1$
      00A020 1C 00 04         [ 2] 2776 	jp syntax_error 
      00258F                       2777 1$: 
      00258F                       2778 	_xpop 
      00A023 CF 00            [ 1]    1     ld a,(y)
      00A025 0E               [ 1]    2     ldw x,y 
      00A026 AE 00            [ 2]    3     ldw x,(1,x)
      00A028 7C CD 94 AC      [ 2]    4     addw y,#CELL_SIZE 
      00A02C AE               [ 2] 2779 	pushw x ; duration 
      002599                       2780 	_xpop ; frequency
      00A02D 00 80            [ 1]    1     ld a,(y)
      00A02F CF               [ 1]    2     ldw x,y 
      00A030 00 1C            [ 2]    3     ldw x,(1,x)
      00A032 72 BB 00 7E      [ 2]    4     addw y,#CELL_SIZE 
      00A036 CF 00            [ 1] 2781 	ldw y,x ; frequency 
      00A038 1E               [ 2] 2782 	popw x  ; duration 
      0025A5                       2783 beep:  
      00A039 81               [ 2] 2784 	pushw x 
      00A03A 4E 6F 20         [ 2] 2785 	ldw x,#TIM2_CLK_FREQ
      00A03D 61               [ 2] 2786 	divw x,y ; cntr=Fclk/freq 
                                   2787 ; round to nearest integer 
      00A03E 70 70 6C 69      [ 2] 2788 	cpw y,#TIM2_CLK_FREQ/2
      00A042 63 61            [ 1] 2789 	jrmi 2$
      00A044 74               [ 1] 2790 	incw x 
      0025B1                       2791 2$:	 
      00A045 69               [ 1] 2792 	ld a,xh 
      00A046 6F 6E 20         [ 1] 2793 	ld TIM2_ARRH,a 
      00A049 73               [ 1] 2794 	ld a,xl 
      00A04A 61 76 65         [ 1] 2795 	ld TIM2_ARRL,a 
                                   2796 ; 50% duty cycle 
      00A04D 64               [ 1] 2797 	ccf 
      00A04E 2E               [ 2] 2798 	rrcw x 
      00A04F 0A               [ 1] 2799 	ld a,xh 
      00A050 00 53 0F         [ 1] 2800 	ld TIM2_CCR1H,a 
      00A051 9F               [ 1] 2801 	ld a,xl
      00A051 90 89 C7         [ 1] 2802 	ld TIM2_CCR1L,a
      00A054 00 04 E6 02      [ 1] 2803 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      00A058 C1 00 04 2A      [ 1] 2804 	bset TIM2_CR1,#TIM2_CR1_CEN
      00A05C 03 C7 00 04      [ 1] 2805 	bset TIM2_EGR,#TIM2_EGR_UG
      00A060 CF               [ 2] 2806 	popw x 
      00A061 00 05 90         [ 4] 2807 	call pause02
      00A064 AE 16 68 CD      [ 1] 2808 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      00A068 92 96 CD 8A      [ 1] 2809 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00A06C 21               [ 4] 2810 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 180.
Hexadecimal [24-Bits]



                                   2811 
                                   2812 ;-------------------------------
                                   2813 ; BASIC: ADCON 0|1 [,divisor]  
                                   2814 ; disable/enanble ADC 
                                   2815 ;-------------------------------
                           000003  2816 	ONOFF=3 
                           000001  2817 	DIVSOR=1
                           000004  2818 	VSIZE=4 
      0025DC                       2819 power_adc:
      00A06D A6 0D CD         [ 4] 2820 	call arg_list 
      00A070 89 C4            [ 1] 2821 	cp a,#2	
      00A072 90 85            [ 1] 2822 	jreq 1$
      00A074 81 01            [ 1] 2823 	cp a,#1 
      00A075 27 03            [ 1] 2824 	jreq 0$ 
      00A075 52 01 BC         [ 2] 2825 	jp syntax_error 
      00A077 4F               [ 1] 2826 0$:	clr a 
      00A077 0F               [ 1] 2827 	clrw x
      0025EC                       2828 	_xpush   ; divisor  
      00A078 01 A2 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A079 90 F7            [ 1]    2     ld (y),a 
      00A079 CD 98 3D         [ 2]    3     ldw (1,y),x 
      0025F5                       2829 1$: _at_next 
      00A07C A1 02 25         [ 1]    1     ld a,(3,y)
      00A07F 08               [ 1]    2     ldw x,y 
      00A080 A1 0A            [ 2]    3     ldw x,(4,x)
      00A082 27               [ 2] 2830 	tnzw x 
      00A083 04 A1            [ 1] 2831 	jreq 2$ 
      0025FE                       2832 	_xpop
      00A085 80 26            [ 1]    1     ld a,(y)
      00A087 07               [ 1]    2     ldw x,y 
      00A088 EE 01            [ 2]    3     ldw x,(1,x)
      00A088 55 00 03 00      [ 2]    4     addw y,#CELL_SIZE 
      002607                       2833 	_xdrop  
      00A08C 02 20 5D 03      [ 2]    1     addw y,#CELL_SIZE 
      00A08F 9F               [ 1] 2834 	ld a,xl
      00A08F A1 02            [ 1] 2835 	and a,#7
      00A091 27               [ 1] 2836 	swap a 
      00A092 12 A1 04         [ 1] 2837 	ld ADC_CR1,a
      00A095 27 1B A1 82      [ 1] 2838 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00A099 27 1F A1 08      [ 1] 2839 	bset ADC_CR1,#ADC_CR1_ADON 
      00261A                       2840 	_usec_dly 7 
      00A09D 27 24 A1         [ 2]    1     ldw x,#(16*7-2)/4
      00A0A0 09               [ 2]    2     decw x
      00A0A1 27               [ 1]    3     nop 
      00A0A2 24 20            [ 1]    4     jrne .-4
      00A0A4 37 08            [ 2] 2841 	jra 3$
      00A0A5 72 11 54 01      [ 1] 2842 2$: bres ADC_CR1,#ADC_CR1_ADON
      00A0A5 CD 8A 21 5C      [ 1] 2843 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00262B                       2844 3$:	
      00A0A9 72               [ 4] 2845 	ret
                                   2846 
                                   2847 ;-----------------------------
                                   2848 ; BASIC: ADCREAD (channel)
                                   2849 ; read adc channel {0..5}
                                   2850 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 181.
Hexadecimal [24-Bits]



                                   2851 ;   A 		TK_INTGR 
                                   2852 ;   X 		value 
                                   2853 ;-----------------------------
      00262C                       2854 analog_read:
      00A0AA B0 00 05         [ 4] 2855 	call func_args 
      00A0AD CF 00            [ 1] 2856 	cp a,#1 
      00A0AF 01 20            [ 1] 2857 	jreq 1$
      00A0B1 C5 16 BC         [ 2] 2858 	jp syntax_error
      00A0B2                       2859 1$: _xpop 
      00A0B2 CD 98            [ 1]    1     ld a,(y)
      00A0B4 8C               [ 1]    2     ldw x,y 
      00A0B5 CD 89            [ 2]    3     ldw x,(1,x)
      00A0B7 C4 20 BD 03      [ 2]    4     addw y,#CELL_SIZE 
      00A0BA A3 00 05         [ 2] 2860 	cpw x,#5 
      00A0BA CD 98            [ 2] 2861 	jrule 2$
      00A0BC 56 FD            [ 1] 2862 	ld a,#ERR_BAD_VALUE
      00A0BE CD 89 C4         [ 2] 2863 	jp tb_error 
      00A0C1 20               [ 1] 2864 2$: ld a,xl
      00A0C2 B4 00 0E         [ 1] 2865 	ld acc8,a 
      00A0C3 A6 05            [ 1] 2866 	ld a,#5
      00A0C3 03 01 20         [ 1] 2867 	sub a,acc8 
      00A0C6 B2 54 00         [ 1] 2868 	ld ADC_CSR,a
      00A0C7 72 16 54 02      [ 1] 2869 	bset ADC_CR2,#ADC_CR2_ALIGN
      00A0C7 CD 98 3D A1      [ 1] 2870 	bset ADC_CR1,#ADC_CR1_ADON
      00A0CB 84 27 03 CC 97   [ 2] 2871 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00A0D0 3C 54 04         [ 2] 2872 	ldw x,ADC_DRH
      00A0D1 A6 84            [ 1] 2873 	ld a,#TK_INTGR
      00A0D1 CD               [ 4] 2874 	ret 
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
      002668                       2887 digital_read:
      002668                       2888 	_vars VSIZE 
      00A0D2 98 7C            [ 2]    1     sub sp,#VSIZE 
      00A0D4 9F A4 0F         [ 4] 2889 	call func_args
      00A0D7 C7 00            [ 1] 2890 	cp a,#1
      00A0D9 24 20            [ 1] 2891 	jreq 1$
      00A0DB 9B 16 BC         [ 2] 2892 	jp syntax_error
      00A0DC                       2893 1$: _xpop 
      00A0DC 55 00            [ 1]    1     ld a,(y)
      00A0DE 03               [ 1]    2     ldw x,y 
      00A0DF 00 02            [ 2]    3     ldw x,(1,x)
      00A0E1 CD 9C 2B 4D      [ 2]    4     addw y,#CELL_SIZE 
      00A0E5 27 05 CD         [ 2] 2894 	cpw x,#15 
      00A0E8 98 B7            [ 2] 2895 	jrule 2$
      00A0EA 20 8B            [ 1] 2896 	ld a,#ERR_BAD_VALUE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 182.
Hexadecimal [24-Bits]



      00A0EC CC 16 BE         [ 2] 2897 	jp tb_error 
      00A0EC 0D 01 26         [ 4] 2898 2$:	call select_pin 
      00A0EF 05 A6            [ 1] 2899 	ld (PINNO,sp),a
      00A0F1 0D CD            [ 1] 2900 	ld a,(GPIO_IDR,x)
      00A0F3 89 C4            [ 1] 2901 	tnz (PINNO,sp)
      00A0F5 5B 01            [ 1] 2902 	jreq 8$
      00A0F7 81               [ 1] 2903 3$: srl a 
      00A0F8 0A 01            [ 1] 2904 	dec (PINNO,sp)
      00A0F8 CE 00            [ 1] 2905 	jrne 3$ 
      00A0FA 05 1F            [ 1] 2906 8$: and a,#1 
      00A0FC 03               [ 1] 2907 	clrw x 
      00A0FD C6               [ 1] 2908 	ld xl,a 
      00A0FE 00               [ 1] 2909 	clr a 
      00269C                       2910 	_drop VSIZE
      00A0FF 02 6B            [ 2]    1     addw sp,#VSIZE 
      00A101 05               [ 4] 2911 	ret
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
      00269F                       2926 digital_write:
      00269F                       2927 	_vars VSIZE 
      00A102 C6 00            [ 2]    1     sub sp,#VSIZE 
      00A104 04 6B 06         [ 4] 2928 	call arg_list  
      00A107 81 02            [ 1] 2929 	cp a,#2 
      00A108 27 03            [ 1] 2930 	jreq 1$
      00A108 1E 03 CF         [ 2] 2931 	jp syntax_error
      0026AB                       2932 1$: _xpop 
      00A10B 00 05            [ 1]    1     ld a,(y)
      00A10D 7B               [ 1]    2     ldw x,y 
      00A10E 05 C7            [ 2]    3     ldw x,(1,x)
      00A110 00 02 7B 06      [ 2]    4     addw y,#CELL_SIZE 
      00A114 C7               [ 1] 2933 	ld a,xl 
      00A115 00 04            [ 1] 2934 	ld (PINVAL,sp),a
      0026B7                       2935 	_xpop 
      00A117 81 F6            [ 1]    1     ld a,(y)
      00A118 93               [ 1]    2     ldw x,y 
      00A118 90 89            [ 2]    3     ldw x,(1,x)
      00A11A 52 05 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A11C A3 00 0F         [ 2] 2936 	cpw x,#15 
      00A11C 0F 05            [ 2] 2937 	jrule 2$
      00A11E CD 98            [ 1] 2938 	ld a,#ERR_BAD_VALUE
      00A120 3D A1 02         [ 2] 2939 	jp tb_error 
      00A123 26 10 CD         [ 4] 2940 2$:	call select_pin 
      00A126 8A 21            [ 1] 2941 	ld (PINNO,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 183.
Hexadecimal [24-Bits]



      00A128 5C 72            [ 1] 2942 	ld a,#1
      00A12A B0 00            [ 1] 2943 	tnz (PINNO,sp)
      00A12C 05 CF            [ 1] 2944 	jreq 4$
      00A12E 00               [ 1] 2945 3$: sll a
      00A12F 01 03            [ 1] 2946 	dec (PINNO,sp)
      00A131 05 CD            [ 1] 2947 	jrne 3$
      00A133 98 3D            [ 1] 2948 4$: tnz (PINVAL,sp)
      00A135 A1 85            [ 1] 2949 	jrne 5$
      00A137 27               [ 1] 2950 	cpl a 
      00A138 03 CC            [ 1] 2951 	and a,(GPIO_ODR,x)
      00A13A 97 3C            [ 2] 2952 	jra 8$
      00A13C CD 98            [ 1] 2953 5$: or a,(GPIO_ODR,x)
      00A13E 72 CF            [ 1] 2954 8$: ld (GPIO_ODR,x),a 
      0026E7                       2955 	_drop VSIZE 
      00A140 00 1A            [ 2]    1     addw sp,#VSIZE 
      00A142 0D               [ 4] 2956 	ret
                                   2957 
                                   2958 
                                   2959 ;-----------------------
                                   2960 ; BASIC: STOP
                                   2961 ; stop progam execution  
                                   2962 ; without resetting pointers 
                                   2963 ; the program is resumed
                                   2964 ; with RUN 
                                   2965 ;-------------------------
      0026EA                       2966 stop:
      00A143 05 26 06 CD 92   [ 2] 2967 	btjt flags,#FRUN,2$
      00A148 6B               [ 1] 2968 	clr a
      00A149 CD               [ 4] 2969 	ret 
      0026F1                       2970 2$:	 
                                   2971 ; create space on cstack to save context 
      00A14A 89 C4 18         [ 2] 2972 	ldw x,#break_point 
      00A14C CD 09 A1         [ 4] 2973 	call puts 
      0026F7                       2974 	_drop 2 ;drop return address 
      00A14C A6 3A            [ 2]    1     addw sp,#2 
      0026F9                       2975 	_vars CTXT_SIZE ; context size 
      00A14E CD 89            [ 2]    1     sub sp,#CTXT_SIZE 
      00A150 C4 CD A0         [ 4] 2976 	call save_context 
      00A153 F8 72 5F         [ 2] 2977 	ldw x,#tib 
      00A156 00 04 CD         [ 2] 2978 	ldw basicptr,x
      00A159 8B               [ 1] 2979 	clr (x)
      00A15A 26 AE 16 68      [ 1] 2980 	clr count  
      00A15E 3B               [ 1] 2981 	clrw x 
      00A15F 00 04 4B         [ 2] 2982 	ldw in.w,x
      00A162 00 72 FB 01      [ 1] 2983 	bres flags,#FRUN 
      00A166 5C 5B 02 72      [ 1] 2984 	bset flags,#FBREAK
      00A16A 5F 00 02         [ 2] 2985 	jp interpreter 
      00A16D CD 8F AA A1 84 27 12  2986 break_point: .asciz "\nbreak point, RUN to resume.\n"
             A1 11 CD 8F AA A1 84
             27 06 CD A1 08 CC 97
             3C 65 73 75 6D 65 2E
             0A 00
                                   2987 
                                   2988 ;-----------------------
                                   2989 ; BASIC: NEW
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 184.
Hexadecimal [24-Bits]



                                   2990 ; from command line only 
                                   2991 ; free program memory
                                   2992 ; and clear variables 
                                   2993 ;------------------------
      00A183                       2994 new: 
      00A183 CD 82 8D 22 01   [ 2] 2995 	btjf flags,#FRUN,0$ 
      00A186 81               [ 4] 2996 	ret 
      00273C                       2997 0$:	
      00A186 C6 00 0D         [ 4] 2998 	call clear_basic 
      00A189 CE               [ 4] 2999 	ret 
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
      002740                       3010 erase:
      00A18A 00 0E 72 C7      [ 1] 3011 	clr farptr 
      002744                       3012 	_vars VSIZE 
      00A18E 00 1A            [ 2]    1     sub sp,#VSIZE 
      00A190 72 5C 00         [ 4] 3013 	call next_token 
      00A193 1B 72            [ 1] 3014 	cp a,#TK_CHAR 
      00A195 CF 00            [ 1] 3015 	jreq 0$ 
      00A197 1A CD A1         [ 2] 3016 	jp syntax_error
      00A19A 08 CD 98         [ 4] 3017 0$: call get_char 
      00A19D 3D A1            [ 1] 3018 	and a,#0XDF 
      00A19F 08 26            [ 1] 3019 	cp a,#'E
      00A1A1 03 CC            [ 1] 3020 	jrne 1$
      00A1A3 A1 1C 00         [ 2] 3021 	ldw x,#EEPROM_BASE 
      00A1A5 CF 00 19         [ 2] 3022 	ldw farptr+1,x 
      00A1A5 A1 00 27         [ 2] 3023 	ldw x,#EEPROM_END
      00A1A8 07               [ 1] 3024 	clr a 
      00A1A9 A1 0A            [ 2] 3025 	jra 3$ 
      00A1AB 27 03            [ 1] 3026 1$: cp a,#'F 
      00A1AD CC 97            [ 1] 3027 	jreq 2$
      00A1AF 3C 15 FC         [ 2] 3028 	ldw x,#err_bad_value
      00A1B0 CC 16 BE         [ 2] 3029 	jp tb_error
      00276F                       3030 2$:
      00A1B0 5B 05 90         [ 2] 3031 	ldw x,#app_space  
      00A1B3 85 81 19         [ 2] 3032 	ldw farptr+1,x 
      00A1B5 A6 02            [ 1] 3033 	ld a,#(FLASH_END>>16)&0XFF 
      00A1B5 55 00 04         [ 2] 3034 	ldw x,#FLASH_END&0xffff
      00277A                       3035 3$:
      00A1B8 00 02            [ 1] 3036 	ld (LIMIT,sp),a 
      00A1BA 81 02            [ 2] 3037 	ldw (LIMIT+1,sp),x 
                                   3038  ; operation done from RAM
                                   3039  ; copy code to RAM in tib   
      00A1BB CD 07 42         [ 4] 3040 	call move_erase_to_ram
      002781                       3041 4$:	 
      00A1BB 52 04 0F         [ 4] 3042     call scan_block 
      00A1BE 01 CD            [ 1] 3043 	jreq 5$  ; block already erased 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 185.
Hexadecimal [24-Bits]



      00A1C0 99 FB            [ 1] 3044     ld a,#'E 
      00A1C2 A1 02 24         [ 4] 3045     call putc 
      00A1C5 03 CC 97         [ 4] 3046 	call block_erase   
                                   3047 ; this block is clean, next  
      00A1C8 3C A1 03         [ 2] 3048 5$:	ldw x,#BLOCK_SIZE
      00A1CB 25 0C 90         [ 4] 3049 	call incr_farptr
                                   3050 ; check limit, 24 bit substraction  	
      00A1CE F6 93            [ 1] 3051 	ld a,(LIMIT,sp)
      00A1D0 EE 01            [ 2] 3052 	ldw x,(LIMIT+1,sp)
      00A1D2 72 A9 00 03      [ 2] 3053 	subw x,farptr+1
      00A1D6 9F 6B 01         [ 1] 3054 	sbc a,farptr 
      00A1D9 90 F6            [ 1] 3055 	jrugt 4$ 
      00A1DB 93 EE 01         [ 4] 3056 9$: call clear_basic
      00A1DE 72 A9            [ 2] 3057 	ldw x,(LIMIT+1,sp)
      00A1E0 00 03 9F         [ 2] 3058 	cpw x,#EEPROM_END
      00A1E3 6B 02            [ 1] 3059 	jrne 10$
      00A1E5 90 F6 93         [ 4] 3060 	call func_eefree 
      0027AE                       3061 10$:
      0027AE                       3062 	_drop VSIZE 
      00A1E8 EE 01            [ 2]    1     addw sp,#VSIZE 
      00A1EA 72               [ 4] 3063 	ret 
                                   3064 	
                                   3065 
                                   3066 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3067 ;  check for application signature 
                                   3068 ; output:
                                   3069 ;   Carry    0 app present 
                                   3070 ;            1 no app installed  
                                   3071 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0027B1                       3072 qsign: 
      00A1EB A9 00 03         [ 2] 3073 	ldw x,app_sign 
      00A1EE F6 14 02         [ 2] 3074 	cpw x,SIGNATURE ; "BC" 
      00A1F1 18               [ 4] 3075 	ret 
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
      0027B8                       3088 fill_write_buffer:
      00A1F2 01               [ 1] 3089 	push a 
      00A1F3 27               [ 1] 3090 	tnz a 
      00A1F4 F9 5B            [ 1] 3091 	jreq 9$ 
      00A1F6 04               [ 1] 3092 1$: ld a,(x)
      00A1F7 81               [ 1] 3093 	incw x 
      00A1F8 90 F7            [ 1] 3094 	ld (y),a 
      00A1F8 CD 99            [ 1] 3095 	incw y 
      00A1FA FB A1            [ 1] 3096 	dec (1,sp) 
      00A1FC 02 27            [ 1] 3097 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 186.
Hexadecimal [24-Bits]



      00A1FE 03               [ 1] 3098 9$:	pop a 
      00A1FF CC               [ 4] 3099     ret 	
                                   3100 
                                   3101 ;--------------------------------------
                                   3102 ;  fill pad buffer with zero 
                                   3103 ;  input:
                                   3104 ;	none 
                                   3105 ;  output:
                                   3106 ;    y     buffer address  
                                   3107 ;--------------------------------------
      0027C8                       3108 clear_block_buffer:
      00A200 97               [ 1] 3109 	push a 
      00A201 3C AE 16 B8      [ 2] 3110 	ldw y,#block_buffer 
      00A202 90 89            [ 2] 3111 	pushw y
      00A202 90 F6            [ 1] 3112 	ld a,#BLOCK_SIZE   
      00A204 93 EE            [ 1] 3113 1$:	clr (y)
      00A206 01 72            [ 1] 3114 	incw y
      00A208 A9               [ 1] 3115 	dec a  
      00A209 00 03            [ 1] 3116 	jrne 1$ 	
      00A20B 9F 88            [ 2] 3117 9$: popw y 
      00A20D 90               [ 1] 3118 	pop a 			
      00A20E F6               [ 4] 3119 	ret 
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
      0027DC                       3131 save_app:
      00A20F 93               [ 2] 3132 	pushw x 
      00A210 EE 01            [ 2] 3133 	pushw y 
      0027DF                       3134 	_vars VSIZE
      00A212 72 A9            [ 2]    1     sub sp,#VSIZE 
      00A214 00 03 84         [ 4] 3135 	call qsign 
      00A217 FA F7            [ 1] 3136 	jrne 1$
      00A219 81 28 73         [ 2] 3137 	ldw x,#CANT_DO 
      00A21A CD 09 A1         [ 4] 3138 	call puts 
      00A21A CD 99 FB         [ 2] 3139 	jp 9$
      0027EF                       3140 1$: 
      00A21D A1 02 27         [ 2] 3141 	ldw x,txtbgn
      00A220 03 CC 97         [ 2] 3142 	cpw x,txtend 
      00A223 3C 09            [ 1] 3143 	jrult 2$ 
      00A224 AE 28 B5         [ 2] 3144 	ldw x,#NO_APP
      00A224 90 F6 93         [ 4] 3145 	call puts 
      00A227 EE 01 72         [ 2] 3146 	jp 9$
      002800                       3147 2$: 
                                   3148 ; block programming flash
                                   3149 ; must be done from RAM
                                   3150 ; moved in tib  
      00A22A A9 00 03         [ 4] 3151 	call move_prg_to_ram
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 187.
Hexadecimal [24-Bits]



                                   3152 ; initialize farptr 
                                   3153 ; to app_sign address 
      00A22D 9F 43 88 90      [ 1] 3154 	clr farptr 
      00A231 F6 93 EE         [ 2] 3155 	ldw x,#app_sign 
      00A234 01 72 A9         [ 2] 3156 	ldw farptr+1,x
                                   3157 ; initialize local variables 
      00A237 00 03 84         [ 4] 3158 	call prog_size
      00A23A F4 F7            [ 2] 3159 	ldw (TOWRITE,sp),x
      00A23C 81 03            [ 1] 3160 	clr (COUNT,sp)
                                   3161 ; first bock 
                                   3162 ; containt signature 2 bytes 
                                   3163 ; and size 	2 bytes 
                                   3164 ; use Y as pointer to block_buffer
      00A23D CD 27 C8         [ 4] 3165 	call clear_block_buffer ; -- y=*block_buffer	
                                   3166 ; write signature
      00A23D CD 99 FB         [ 2] 3167 	ldw x,SIGNATURE ; "BC" 
      00A240 A1 02            [ 2] 3168 	ldw (y),x 
      00A242 27 03 CC 97      [ 2] 3169 	addw y,#2
      00A246 3C 90            [ 2] 3170 	ldw x,(TOWRITE,sp)
      00A248 F6 93            [ 2] 3171 	ldw (y),x
      00A24A EE 01 72 A9      [ 2] 3172 	addw y,#2   
      00A24E 00 03            [ 1] 3173 	ld a,#(BLOCK_SIZE-4)
      00A250 9F 88            [ 1] 3174 	ld (CNT_LO,sp),a 
      00A252 90 F6 93         [ 2] 3175 	cpw x,#(BLOCK_SIZE-4) 
      00A255 EE 01            [ 1] 3176 	jrugt 3$
      00A257 72               [ 1] 3177 	ld a,xl 
      00A258 A9 00            [ 1] 3178 3$:	ld (CNT_LO,sp),a   
      00A25A 03 84 F8         [ 2] 3179 	ldw x,txtbgn 
      00A25D F7 81            [ 2] 3180 	ldw (XTEMP,sp),x 
      00A25F                       3181 32$: 
      00A25F CD 99            [ 2] 3182 	ldw x,(XTEMP,sp)
      00A261 F6 A1            [ 1] 3183 	ld a,(CNT_LO,sp)
      00A263 02 27 03         [ 4] 3184 	call fill_write_buffer 
      00A266 CC 97            [ 2] 3185 	ldw (XTEMP,sp),x 
      00A268 3C 16 B8         [ 2] 3186 	ldw x,#block_buffer
      00A269 CD 07 9C         [ 4] 3187 	call write_buffer
      00A269 90 F6 93         [ 2] 3188 	ldw x,#BLOCK_SIZE 
      00A26C EE 01 72         [ 4] 3189 	call incr_farptr  
                                   3190 ; following blocks 
      00A26F A9 00            [ 2] 3191 	ldw x,(XTEMP,sp)
      00A271 03 9F A4         [ 2] 3192 	cpw x,txtend 
      00A274 07 88            [ 1] 3193 	jruge 9$ 
      00A276 A6 01            [ 2] 3194 	ldw x,(TOWRITE,sp)
      00A278 0D 01 27         [ 2] 3195 	subw x,(COUNT,sp)
      00A27B 05 48            [ 2] 3196 	ldw (TOWRITE,sp),x 
      00A27D 0A 01            [ 1] 3197 	ld a,#BLOCK_SIZE 
      00A27F 20 F7 6B         [ 2] 3198 	cpw x,#BLOCK_SIZE 
      00A282 01 90            [ 1] 3199 	jruge 4$ 
      00A284 F6               [ 1] 3200 	ld a,xl 
      00A285 93 EE            [ 1] 3201 4$:	ld (CNT_LO,sp),a 
      00A287 01 72 A9         [ 4] 3202 	call clear_block_buffer 
      00A28A 00 03            [ 2] 3203 	jra 32$ 
      00286B                       3204 9$:	_drop VSIZE 
      00A28C 84 F4            [ 2]    1     addw sp,#VSIZE 
      00A28E 27 02            [ 2] 3205     popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 188.
Hexadecimal [24-Bits]



      00A290 A6               [ 2] 3206 	popw x 
      00A291 01               [ 4] 3207 	ret 
                                   3208 
                                   3209 
      00A292 5F 97                 3210 SIGNATURE: .ascii "BC"
      00A294 4F 81 6E 27 74 20 66  3211 CANT_DO: .asciz "Can't flash application, already one in FLASH\nuse ERASE \F before"
             6C 61 73 68 20 61 70
             70 6C 69 63 61 74 69
             6F 6E 2C 20 61 6C 72
             65 61 64 79 20 6F 6E
             65 20 69 6E 20 46 4C
             41 53 48 0A 75 73 65
             20 45 52 41 53 45 20
             5C 46 20 62 65 66 6F
             72 65 00
      00A296 4E 6F 20 61 70 70 6C  3212 NO_APP: .asciz "No application in RAM"
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
      0028CB                       3224 write:
      00A296 CD 99 FB         [ 4] 3225 	call expression
      00A299 A1 02            [ 1] 3226 	cp a,#TK_INTGR 
      00A29B 27 03            [ 1] 3227 	jreq 0$
      00A29D CC 97 3C         [ 2] 3228 	jp syntax_error
      00A2A0                       3229 0$: _xpop 
      00A2A0 90 F6            [ 1]    1     ld a,(y)
      00A2A2 93               [ 1]    2     ldw x,y 
      00A2A3 EE 01            [ 2]    3     ldw x,(1,x)
      00A2A5 72 A9 00 03      [ 2]    4     addw y,#CELL_SIZE 
      00A2A9 9F 88 90         [ 1] 3230 	ld farptr,a 
      00A2AC F6 93 EE         [ 2] 3231 	ldw ptr16,x 
      0028E4                       3232 1$:	
      00A2AF 01 72 A9         [ 4] 3233 	call next_token 
      00A2B2 00 03            [ 1] 3234 	cp a,#TK_COMMA 
      00A2B4 84 F7            [ 1] 3235 	jreq 2$ 
      00A2B6 81 20            [ 2] 3236 	jra 9$ ; no more data 
      00A2B7 CD 1A A6         [ 4] 3237 2$:	call expression
      00A2B7 CD 99            [ 1] 3238 	cp a,#TK_INTGR
      00A2B9 F6 A1            [ 1] 3239 	jreq 3$
      00A2BB 01 27 03         [ 2] 3240 	jp syntax_error
      0028F7                       3241 3$:	_xpop 
      00A2BE CC 97            [ 1]    1     ld a,(y)
      00A2C0 3C               [ 1]    2     ldw x,y 
      00A2C1 90 F6            [ 2]    3     ldw x,(1,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 189.
Hexadecimal [24-Bits]



      00A2C3 93 EE 01 72      [ 2]    4     addw y,#CELL_SIZE 
      00A2C7 A9               [ 1] 3242 	ld a,xl 
      00A2C8 00               [ 1] 3243 	clrw x 
      00A2C9 03 C7 00         [ 4] 3244 	call write_byte
      00A2CC 19 CF 00         [ 2] 3245 	ldw x,#1 
      00A2CF 1A 92 BC         [ 4] 3246 	call incr_farptr 
      00A2D2 00 19            [ 2] 3247 	jra 1$ 
      00290D                       3248 9$:
      00A2D4 5F               [ 4] 3249 	ret 
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
      00290E                       3260 char:
      00A2D5 97 4F 81         [ 4] 3261 	call func_args 
      00A2D8 A1 01            [ 1] 3262 	cp a,#1
      00A2D8 CD 9C            [ 1] 3263 	jreq 1$
      00A2DA 2B 90 F6         [ 2] 3264 	jp syntax_error
      002918                       3265 1$:	_xpop
      00A2DD 93 EE            [ 1]    1     ld a,(y)
      00A2DF 01               [ 1]    2     ldw x,y 
      00A2E0 72 A9            [ 2]    3     ldw x,(1,x)
      00A2E2 00 03 4D 26      [ 2]    4     addw y,#CELL_SIZE 
      00A2E6 0A               [ 1] 3266 	ld a,xl
      00A2E7 55 00            [ 1] 3267 	and a,#0x7f 
      00A2E9 04               [ 4] 3268 	ret
                                   3269 
                                   3270 ;---------------------
                                   3271 ; BASIC: ASC(string|char|TK_CFUNC)
                                   3272 ; extract first character 
                                   3273 ; of string argument 
                                   3274 ; output:
                                   3275 ;    A:X    int24 
                                   3276 ;---------------------
      002925                       3277 ascii:
      00A2EA 00 02            [ 1] 3278 	ld a,#TK_LPAREN
      00A2EC 5B 02 CC         [ 4] 3279 	call expect 
      00A2EF 97 EF 81         [ 4] 3280 	call next_token 
      00A2F2 A1 02            [ 1] 3281 	cp a,#TK_QSTR 
      00A2F2 85 52            [ 1] 3282 	jreq 1$
      00A2F4 0D 89            [ 1] 3283 	cp a,#TK_CHAR 
      00A2F6 A6 85            [ 1] 3284 	jreq 2$ 
      00A2F8 CD 99            [ 1] 3285 	cp a,#TK_CFUNC 
      00A2FA E9 CD            [ 1] 3286 	jreq 0$
      00A2FC 98 72 1F         [ 2] 3287 	jp syntax_error
      00293C                       3288 0$: ; cfunc 
      00A2FF 09               [ 4] 3289 	call (x)
      00A300 CD 9D            [ 2] 3290 	jra 3$
      00293F                       3291 1$: ; quoted string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 190.
Hexadecimal [24-Bits]



      00A302 13               [ 1] 3292 	ld a,(x)
      00A303 72               [ 1] 3293 	push a  
      00A304 14 00 23         [ 4] 3294 	call skip_string
      00A307 CD               [ 1] 3295 	pop a  	
      00A308 98 3D            [ 2] 3296 	jra 3$ 
      002947                       3297 2$: ; character 
      00A30A A1 80 27         [ 4] 3298 	call get_char 
      00A30D 03               [ 1] 3299 3$:	clrw x 
      00A30E CC               [ 1] 3300 	rlwa x   
      00294C                       3301 4$:	_xpush  
      00A30F 97 3C 00 03      [ 2]    1     subw y,#CELL_SIZE
      00A311 90 F7            [ 1]    2     ld (y),a 
      00A311 CD 98 56         [ 2]    3     ldw (1,y),x 
      00A314 A3 A3            [ 1] 3302 	ld a,#TK_RPAREN 
      00A316 1C 27 03         [ 4] 3303 	call expect
      00295A                       3304 9$:	
      00295A                       3305 	_xpop  
      00A319 CC 97            [ 1]    1     ld a,(y)
      00A31B 3C               [ 1]    2     ldw x,y 
      00A31C EE 01            [ 2]    3     ldw x,(1,x)
      00A31C 72 04 00 23      [ 2]    4     addw y,#CELL_SIZE 
      00A320 03               [ 4] 3306 	ret 
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
      002964                       3317 key:
      00A321 CC 97 3C         [ 4] 3318 	call getc 
      00A324 CD               [ 4] 3319 	ret
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
      002968                       3331 qkey:: 
      00A325 9B               [ 1] 3332 	clrw x 
      00A326 26 A1 84         [ 1] 3333 	ld a,rx1_head
      00A329 27 03 CC         [ 1] 3334 	sub a,rx1_tail 
      00A32C 97 3C            [ 1] 3335 	jreq 9$ 
      00A32E 90               [ 2] 3336 	cplw x
      00A32F F6 93            [ 1] 3337 	ld a,#255    
      002974                       3338 9$: 
      00A331 EE               [ 4] 3339 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 191.
Hexadecimal [24-Bits]



                                   3340 
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
      002975                       3352 gpio:
      00A332 01 72 A9         [ 4] 3353 	call func_args 
      00A335 00 03            [ 1] 3354 	cp a,#2
      00A337 6B 06            [ 1] 3355 	jreq 1$
      00A339 1F 07 CD         [ 2] 3356 	jp syntax_error  
      00297F                       3357 1$:	_at_next 
      00A33C 98 3D A1         [ 1]    1     ld a,(3,y)
      00A33F 00               [ 1]    2     ldw x,y 
      00A340 27 11            [ 2]    3     ldw x,(4,x)
      00A342 A1 80 26         [ 2] 3358 	cpw x,#PA_BASE 
      00A345 08 CD            [ 1] 3359 	jrmi bad_port
      00A347 98 56 A3         [ 2] 3360 	cpw x,#PI_BASE+1 
      00A34A A3 5C            [ 1] 3361 	jrpl bad_port
      00A34C 27               [ 2] 3362 	pushw x 
      002990                       3363 	_xpop
      00A34D 0E F6            [ 1]    1     ld a,(y)
      00A34E 93               [ 1]    2     ldw x,y 
      00A34E 55 00            [ 2]    3     ldw x,(1,x)
      00A350 03 00 02 03      [ 2]    4     addw y,#CELL_SIZE 
      00A353 72 FB 01         [ 2] 3364 	addw x,(1,sp)
      00299C                       3365 	_drop 2 
      00A353 0F 03            [ 2]    1     addw sp,#2 
      00A355 AE               [ 1] 3366 	clr a 
      00A356 00               [ 4] 3367 	ret
      0029A0                       3368 bad_port:
      00A357 01 1F            [ 1] 3369 	ld a,#ERR_BAD_VALUE
      00A359 04 20 2F         [ 2] 3370 	jp tb_error
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
      00A35C                       3382 uflash:
      00A35C 72 04 00         [ 2] 3383 	ldw x,app_sign
      00A35F 23 03 CC         [ 2] 3384 	cpw x,#4243 ; signature "BC" 
      00A362 97 3C            [ 1] 3385 	jreq 1$
      00A364 CD 9B 26         [ 2] 3386 	ldw x,app_size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 192.
Hexadecimal [24-Bits]



      00A367 A1 84 27         [ 2] 3387 	addw x,#app
      00A36A 03 CC            [ 2] 3388 	jra 2$
      00A36C 97 3C 00         [ 2] 3389 1$:	ldw x,#app_space 
      00A36E 4F               [ 1] 3390 2$:	clr a 
      00A36E 90               [ 4] 3391 	ret 
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
      0029BA                       3408 usr:
      00A36F F6               [ 2] 3409 	pushw x 
      00A370 93 EE            [ 2] 3410 	pushw y 	
      00A372 01 72 A9         [ 4] 3411 	call func_args 
      00A375 00 03            [ 1] 3412 	cp a,#1 
      00A377 6B 03            [ 1] 3413 	jreq 1$
      00A379 1F 04            [ 1] 3414 	cp a,#2
      00A37B 4D 2A            [ 1] 3415 	jreq 1$  
      00A37D 0D 7B 06         [ 2] 3416 	jp syntax_error 
      00A380 1E               [ 1] 3417 1$: push a 
      0029CC                       3418 	_xpop 
      00A381 07 1D            [ 1]    1     ld a,(y)
      00A383 00               [ 1]    2     ldw x,y 
      00A384 01 A2            [ 2]    3     ldw x,(1,x)
      00A386 00 6B 06 1F      [ 2]    4     addw y,#CELL_SIZE 
      00A38A 07 93            [ 1] 3419 	ldw y,x  ; arg|addr 
      00A38B 84               [ 1] 3420     pop a 
      00A38B CE 00            [ 1] 3421 	cp a,#1 
      00A38D 05 1F            [ 1] 3422 	jreq 3$
      0029DC                       3423 	_xpop  ; x=code addr  
      00A38F 0D CE            [ 1]    1     ld a,(y)
      00A391 00               [ 1]    2     ldw x,y 
      00A392 01 1F            [ 2]    3     ldw x,(1,x)
      00A394 0B 72 15 00      [ 2]    4     addw y,#CELL_SIZE 
      00A398 23               [ 1] 3424 	exgw x,y ; y=code addr, x=arg 
      00A399 72 5C            [ 4] 3425 3$: call (y)
      00A39B 00               [ 1] 3426 	push a 
      00A39C 20 81            [ 1] 3427 	ld a,yl  
      00A39E                       3428 	_xpush 
      00A39E 72 5D 00 20      [ 2]    1     subw y,#CELL_SIZE
      00A3A2 26 03            [ 1]    2     ld (y),a 
      00A3A4 CC 97 3C         [ 2]    3     ldw (1,y),x 
      00A3A7 84               [ 1] 3429 	pop a 
      00A3A7 A6 85            [ 2] 3430 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 193.
Hexadecimal [24-Bits]



      00A3A9 CD               [ 2] 3431 	popw x 
      00A3AA 99               [ 4] 3432 	ret 
                                   3433 
                                   3434 
                                   3435 ;------------------------------
                                   3436 ; BASIC: BYE 
                                   3437 ; halt mcu in its lowest power mode 
                                   3438 ; wait for reset or external interrupt
                                   3439 ; do a cold start on wakeup.
                                   3440 ;------------------------------
      0029F9                       3441 bye:
      00A3AB E9 CD 98 72 13   [ 2] 3442 	btjf UART1_SR,#UART_SR_TC,.
      00A3B0 09               [10] 3443 	halt
      00A3B1 27 03 CC         [ 2] 3444 	jp cold_start  
                                   3445 
                                   3446 ;----------------------------------
                                   3447 ; BASIC: SLEEP 
                                   3448 ; halt mcu until reset or external
                                   3449 ; interrupt.
                                   3450 ; Resume progam after SLEEP command
                                   3451 ;----------------------------------
      002A02                       3452 sleep:
      00A3B4 97 3C 52 30 FB   [ 2] 3453 	btjf UART1_SR,#UART_SR_TC,.
      00A3B6 72 16 00 22      [ 1] 3454 	bset flags,#FSLEEP
      00A3B6 CF               [10] 3455 	halt 
      00A3B7 00               [ 4] 3456 	ret 
                                   3457 
                                   3458 ;-------------------------------
                                   3459 ; BASIC: PAUSE expr 
                                   3460 ; suspend execution for n msec.
                                   3461 ; input:
                                   3462 ;	none
                                   3463 ; output:
                                   3464 ;	none 
                                   3465 ;------------------------------
      002A0D                       3466 pause:
      00A3B8 1A F6 EE         [ 4] 3467 	call expression
      00A3BB 01 72            [ 1] 3468 	cp a,#TK_INTGR
      00A3BD FB 04            [ 1] 3469 	jreq 1$ 
      00A3BF 19 03 72         [ 2] 3470 	jp syntax_error
      002A17                       3471 1$: _xpop 
      00A3C2 C7 00            [ 1]    1     ld a,(y)
      00A3C4 1A               [ 1]    2     ldw x,y 
      00A3C5 72 5C            [ 2]    3     ldw x,(1,x)
      00A3C7 00 1B 72 CF      [ 2]    4     addw y,#CELL_SIZE 
      002A20                       3472 pause02:
      00A3CB 00 1A C7         [ 2] 3473 	ldw timer,x 
      00A3CE 00 0D CF         [ 2] 3474 1$: ldw x,timer 
      00A3D1 00               [ 2] 3475 	tnzw x 
      00A3D2 0E 7B            [ 1] 3476 	jreq 2$
      00A3D4 06               [10] 3477 	wfi 
      00A3D5 1E 07            [ 1] 3478 	jrne 1$
      00A3D7 72               [ 1] 3479 2$:	clr a 
      00A3D8 B0               [ 4] 3480 	ret 
                                   3481 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 194.
Hexadecimal [24-Bits]



                                   3482 ;------------------------------
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
      002A2E                       3493 awu:
      00A3D9 00 0E C2         [ 4] 3494   call expression
      00A3DC 00 0D            [ 1] 3495   cp a,#TK_INTGR
      00A3DE 18 03            [ 1] 3496   jreq 1$
      00A3E0 A8 80 2B         [ 2] 3497   jp syntax_error
      002A38                       3498 1$: _xpop 
      00A3E3 12 20            [ 1]    1     ld a,(y)
      00A3E5 25               [ 1]    2     ldw x,y 
      00A3E6 7B 03            [ 2]    3     ldw x,(1,x)
      00A3E8 2A 07 C6 00      [ 2]    4     addw y,#CELL_SIZE 
      002A41                       3499 awu02:
      00A3EC 0F 2F 07         [ 2] 3500   cpw x,#5120
      00A3EF 20 1A            [ 1] 3501   jrmi 1$ 
      00A3F1 35 0F 50 F2      [ 1] 3502   mov AWU_TBR,#15 
      00A3F1 72 0E            [ 1] 3503   ld a,#30
      00A3F3 00               [ 2] 3504   div x,a
      00A3F4 0F 15            [ 1] 3505   ld a,#16
      00A3F6 62               [ 2] 3506   div x,a 
      00A3F6 1E 0D            [ 2] 3507   jra 4$
      002A52                       3508 1$: 
      00A3F8 CF 00 05         [ 2] 3509   cpw x,#2048
      00A3FB 72 01            [ 1] 3510   jrmi 2$ 
      00A3FD 00 23 05 E6      [ 1] 3511   mov AWU_TBR,#14
      00A401 02 C7            [ 1] 3512   ld a,#80
      00A403 00               [ 2] 3513   div x,a 
      00A404 04 1E            [ 2] 3514   jra 4$   
      002A60                       3515 2$:
      00A406 0B CF 00 01      [ 1] 3516   mov AWU_TBR,#7
      002A64                       3517 3$:  
                                   3518 ; while X > 64  divide by 2 and increment AWU_TBR 
      00A40A 81 00 40         [ 2] 3519   cpw x,#64 
      00A40B 23 07            [ 2] 3520   jrule 4$ 
      00A40B 85 5B 0D 72      [ 1] 3521   inc AWU_TBR 
      00A40F 5A               [ 2] 3522   srlw x 
      00A410 00 20            [ 2] 3523   jra 3$ 
      002A70                       3524 4$:
      00A412 FC               [ 1] 3525   ld a, xl
      00A413 4A               [ 1] 3526   dec a 
      00A413 CD 98            [ 1] 3527   jreq 5$
      00A415 3D               [ 1] 3528   dec a 	
      002A75                       3529 5$: 
      00A416 A1 84            [ 1] 3530   and a,#0x3e 
      00A418 27 07 A1         [ 1] 3531   ld AWU_APR,a 
      00A41B 03 27 26 CC      [ 1] 3532   bset AWU_CSR,#AWU_CSR_AWUEN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 195.
Hexadecimal [24-Bits]



      00A41F 97               [10] 3533   halt 
                                   3534 
      00A420 3C               [ 4] 3535   ret 
                                   3536 
                                   3537 ;------------------------------
                                   3538 ; BASIC: TICKS
                                   3539 ; return msec ticks counter value 
                                   3540 ; input:
                                   3541 ; 	none 
                                   3542 ; output:
                                   3543 ;	X 		TK_INTGR
                                   3544 ;-------------------------------
      00A421                       3545 get_ticks:
      00A421 90 89 CD         [ 1] 3546 	ld a,ticks 
      00A424 98 7C 4F         [ 2] 3547 	ldw x,ticks+1 
      00A427 90               [ 4] 3548 	ret 
                                   3549 
                                   3550 ;------------------------------
                                   3551 ; BASIC: ABS(expr)
                                   3552 ; return absolute value of expr.
                                   3553 ; input:
                                   3554 ;   none
                                   3555 ; output:
                                   3556 ;   xstack    positive int24 
                                   3557 ;-------------------------------
      002A87                       3558 abs:
      00A428 CE 00 05         [ 4] 3559 	call func_args 
      00A42B 90 FE            [ 1] 3560 	cp a,#1 
      00A42D 90 89            [ 1] 3561 	jreq 0$ 
      00A42F 13 01 5B         [ 2] 3562 	jp syntax_error
      002A91                       3563 0$:  
      00A432 02 25 01         [ 4] 3564 	call abs24 
      002A94                       3565 	_xpop 
      00A435 4C F6            [ 1]    1     ld a,(y)
      00A436 93               [ 1]    2     ldw x,y 
      00A436 CD 8D            [ 2]    3     ldw x,(1,x)
      00A438 09 5D 26 05      [ 2]    4     addw y,#CELL_SIZE 
      00A43C A6               [ 4] 3566 	ret 
                                   3567 
                                   3568 ;------------------------------
                                   3569 ; BASIC: LSHIFT(expr1,expr2)
                                   3570 ; logical shift left expr1 by 
                                   3571 ; expr2 bits 
                                   3572 ; output:
                                   3573 ; 	A 		TK_INTGR
                                   3574 ;   X 		result 
                                   3575 ;------------------------------
      002A9E                       3576 lshift:
      00A43D 05 CC 97         [ 4] 3577 	call func_args
      00A440 3E 90            [ 1] 3578 	cp a,#2 
      00A442 85 81            [ 1] 3579 	jreq 1$
      00A444 CC 16 BC         [ 2] 3580 	jp syntax_error
      002AA8                       3581 1$: _xpop 
      00A444 90 89            [ 1]    1     ld a,(y)
      00A446 89               [ 1]    2     ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 196.
Hexadecimal [24-Bits]



      00A447 72 5F            [ 2]    3     ldw x,(1,x)
      00A449 00 0E 90 CE      [ 2]    4     addw y,#CELL_SIZE 
      00A44D 00 1C            [ 1] 3582     ldw y,x    
      002AB3                       3583 	_at_top  ; T@ 
      00A44F 90 E6            [ 1]    1     ld a,(y)
      00A451 03               [ 1]    2     ldw x,y 
      00A452 A1 03            [ 2]    3     ldw x,(1,x)
      00A454 27 15            [ 2] 3584 	tnzw y 
      00A456 90 E6            [ 1] 3585 	jreq 4$
      00A458 02               [ 1] 3586 2$:	rcf 
      00A459 C7               [ 2] 3587 	rlcw x 
      00A45A 00               [ 1] 3588 	rlc a 
      00A45B 0F 72            [ 2] 3589 	decw y 
      00A45D B9 00            [ 1] 3590 	jrne 2$
      002AC3                       3591 4$: _store_top  ; T! 
      00A45F 0E 90            [ 1]    1     ld (y),a 
      00A461 C3 00 1E         [ 2]    2     ldw (1,y),x     
      00A464 25 E9            [ 1] 3592 	ld a,#TK_INTGR
      00A466 A6               [ 4] 3593 	ret
                                   3594 
                                   3595 ;------------------------------
                                   3596 ; BASIC: RSHIFT(expr1,expr2)
                                   3597 ; logical shift right expr1 by 
                                   3598 ; expr2 bits.
                                   3599 ; output:
                                   3600 ; 	A 		TK_INTGR
                                   3601 ;   X 		result 
                                   3602 ;------------------------------
      002ACB                       3603 rshift:
      00A467 0A CC 97         [ 4] 3604 	call func_args
      00A46A 3E 02            [ 1] 3605 	cp a,#2 
      00A46B 27 03            [ 1] 3606 	jreq 1$
      00A46B 90 89 72         [ 2] 3607 	jp syntax_error
      002AD5                       3608 1$: _xpop 
      00A46E A9 00            [ 1]    1     ld a,(y)
      00A470 04               [ 1]    2     ldw x,y 
      00A471 1E 03            [ 2]    3     ldw x,(1,x)
      00A473 CD 94 8B 26      [ 2]    4     addw y,#CELL_SIZE 
      00A477 04 90            [ 1] 3609     ldw y,x   
      002AE0                       3610 	_at_top  ; T@  
      00A479 85 20            [ 1]    1     ld a,(y)
      00A47B DA               [ 1]    2     ldw x,y 
      00A47C EE 01            [ 2]    3     ldw x,(1,x)
      00A47C 85 5B            [ 2] 3611 	tnzw y 
      00A47E 02 90            [ 1] 3612 	jreq 4$
      00A480 85               [ 1] 3613 2$:	rcf 
      00A481 81               [ 2] 3614 	rrcw x
      00A482 46               [ 1] 3615 	rrc a  
      00A482 72 00            [ 2] 3616 	decw y 
      00A484 00 23            [ 1] 3617 	jrne 2$
      002AF0                       3618 4$: _store_top  ; T! 
      00A486 05 A6            [ 1]    1     ld (y),a 
      00A488 06 CC 97         [ 2]    2     ldw (1,y),x     
      00A48B 3E CD            [ 1] 3619 	ld a,#TK_INTGR
      00A48D 9B               [ 4] 3620 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 197.
Hexadecimal [24-Bits]



                                   3621 
                                   3622 ;--------------------------
                                   3623 ; BASIC: FCPU integer
                                   3624 ; set CPU frequency 
                                   3625 ;-------------------------- 
                                   3626 
      002AF8                       3627 fcpu:
      00A48E 26 A1            [ 1] 3628 	ld a,#TK_INTGR
      00A490 84 27 03         [ 4] 3629 	call expect 
      00A493 CC 97 3C         [ 4] 3630 	call get_int24 
      00A496 90               [ 1] 3631 	ld a,xl 
      00A497 F6 93            [ 1] 3632 	and a,#7 
      00A499 EE 01 72         [ 1] 3633 	ld CLK_CKDIVR,a 
      00A49C A9               [ 4] 3634 	ret 
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
      002B07                       3645 pin_mode:
      002B07                       3646 	_vars VSIZE 
      00A49D 00 03            [ 2]    1     sub sp,#VSIZE 
      00A49F 9F 27 62         [ 4] 3647 	call arg_list 
      00A4A2 88 CD            [ 1] 3648 	cp a,#2 
      00A4A4 98 3D            [ 1] 3649 	jreq 1$
      00A4A6 A1 80 27         [ 2] 3650 	jp syntax_error 
      002B13                       3651 1$: _xpop 
      00A4A9 03 CC            [ 1]    1     ld a,(y)
      00A4AB 97               [ 1]    2     ldw x,y 
      00A4AC 3C CD            [ 2]    3     ldw x,(1,x)
      00A4AE 98 56 A3 A5      [ 2]    4     addw y,#CELL_SIZE 
      00A4B2 0E 27            [ 1] 3652 	ldw y,x ; mode 
      002B1E                       3653 	_xpop ; Dx pin 
      00A4B4 08 A3            [ 1]    1     ld a,(y)
      00A4B6 A5               [ 1]    2     ldw x,y 
      00A4B7 28 27            [ 2]    3     ldw x,(1,x)
      00A4B9 03 CC 97 3C      [ 2]    4     addw y,#CELL_SIZE 
      00A4BD CD 2B 64         [ 4] 3654 	call select_pin 
      00A4BD 84 89            [ 1] 3655 	ld (PINNO,sp),a  
      00A4BF 88 01            [ 1] 3656 	ld a,#1 
      00A4C0 0D 01            [ 1] 3657 	tnz (PINNO,sp)
      00A4C0 0A 01            [ 1] 3658 	jreq 4$
      00A4C2 27               [ 1] 3659 2$:	sll a 
      00A4C3 26 CD            [ 1] 3660 	dec (PINNO,sp)
      00A4C5 98 3D            [ 1] 3661 	jrne 2$ 
      00A4C7 A1 84            [ 1] 3662 	ld (PINNO,sp),a
      00A4C9 27 07            [ 1] 3663 	ld a,(PINNO,sp)
      00A4CB A1 03            [ 1] 3664 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      00A4CD 27 0D            [ 1] 3665 	ld (GPIO_CR1,x),a 
      00A4CF CC 97 3C 01      [ 2] 3666 4$:	cpw y,#OUTP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 198.
Hexadecimal [24-Bits]



      00A4D2 27 10            [ 1] 3667 	jreq 6$
                                   3668 ; input mode
                                   3669 ; disable external interrupt 
      00A4D2 C6 00            [ 1] 3670 	ld a,(PINNO,sp)
      00A4D4 02               [ 1] 3671 	cpl a 
      00A4D5 AB 03            [ 1] 3672 	and a,(GPIO_CR2,x)
      00A4D7 C7 00            [ 1] 3673 	ld (GPIO_CR2,x),a 
                                   3674 ;clear bit in DDR for input mode 
      00A4D9 02 20            [ 1] 3675 	ld a,(PINNO,sp)
      00A4DB 03               [ 1] 3676 	cpl a 
      00A4DC CD 98            [ 1] 3677 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      00A4DE 63 02            [ 1] 3678 	ld (GPIO_DDR,x),a 
      00A4DF 20 0C            [ 2] 3679 	jra 9$
      002B55                       3680 6$: ;output mode  
      00A4DF CD 98            [ 1] 3681 	ld a,(PINNO,sp)
      00A4E1 3D A1            [ 1] 3682 	or a,(GPIO_DDR,x) ; bit==1 for output 
      00A4E3 08 27            [ 1] 3683 	ld (GPIO_DDR,x),a 
      00A4E5 DA 5B            [ 1] 3684 	ld a,(PINNO,sp)
      00A4E7 03 20            [ 1] 3685 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      00A4E9 1A 04            [ 1] 3686 	ld (GPIO_CR2,x),a 
      00A4EA                       3687 9$:	
      002B61                       3688 	_drop VSIZE 
      00A4EA 5B 01            [ 2]    1     addw sp,#VSIZE 
      00A4EC CD               [ 4] 3689 	ret
                                   3690 
                                   3691 ;------------------------
                                   3692 ; select Arduino pin 
                                   3693 ; input:
                                   3694 ;   X 	 {0..15} Arduino Dx 
                                   3695 ; output:
                                   3696 ;   A     stm8s208 pin 
                                   3697 ;   X     base address s208 GPIO port 
                                   3698 ;---------------------------
      002B64                       3699 select_pin:
      00A4ED A4               [ 2] 3700 	sllw x 
      00A4EE 13 CF 00         [ 2] 3701 	addw x,#arduino_to_8s208 
      00A4F1 1A               [ 2] 3702 	ldw x,(x)
      00A4F2 55               [ 1] 3703 	ld a,xl 
      00A4F3 00               [ 1] 3704 	push a 
      00A4F4 04               [ 1] 3705 	swapw x 
      00A4F5 00 02            [ 1] 3706 	ld a,#5 
      00A4F7 85               [ 4] 3707 	mul x,a 
      00A4F8 A3 A5 0E         [ 2] 3708 	addw x,#GPIO_BASE 
      00A4FB 26               [ 1] 3709 	pop a 
      00A4FC 05               [ 4] 3710 	ret 
                                   3711 ; translation from Arduino D0..D15 to stm8s208rb 
      002B74                       3712 arduino_to_8s208:
      00A4FD CE 00                 3713 .byte 3,6 ; D0 
      00A4FF 1A 20                 3714 .byte 3,5 ; D1 
      00A501 19 00                 3715 .byte 4,0 ; D2 
      00A502 02 01                 3716 .byte 2,1 ; D3
      00A502 20 35                 3717 .byte 6,0 ; D4
      00A504 02 02                 3718 .byte 2,2 ; D5
      00A504 55 00                 3719 .byte 2,3 ; D6
      00A506 04 00                 3720 .byte 3,1 ; D7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 199.
Hexadecimal [24-Bits]



      00A508 02 5B                 3721 .byte 3,3 ; D8
      00A50A 02 CC                 3722 .byte 2,4 ; D9
      00A50C 97 EF                 3723 .byte 4,5 ; D10
      00A50E 02 06                 3724 .byte 2,6 ; D11
      00A50E 72 00                 3725 .byte 2,7 ; D12
      00A510 00 23                 3726 .byte 2,5 ; D13
      00A512 05 A6                 3727 .byte 4,2 ; D14
      00A514 06 CC                 3728 .byte 4,1 ; D15
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
      002B94                       3741 random:
      00A516 97 3E 76         [ 4] 3742 	call func_args 
      00A518 A1 01            [ 1] 3743 	cp a,#1
      00A518 CD A4            [ 1] 3744 	jreq 1$
      00A51A 13 16 BC         [ 2] 3745 	jp syntax_error
      00A51B                       3746 1$:  
      002B9E                       3747 	_xpop   
      00A51B CF 00            [ 1]    1     ld a,(y)
      00A51D 05               [ 1]    2     ldw x,y 
      00A51E E6 02            [ 2]    3     ldw x,(1,x)
      00A520 C7 00 04 35      [ 2]    4     addw y,#CELL_SIZE 
      00A524 03               [ 2] 3748 	pushw x 
      00A525 00               [ 1] 3749 	push a  
      00A526 02 81            [ 1] 3750 	ld a,#0x80 
      00A528 15 01            [ 1] 3751 	bcp a,(1,sp)
      00A528 72 00            [ 1] 3752 	jreq 2$
      00A52A 00 23            [ 1] 3753 	ld a,#ERR_BAD_VALUE
      00A52C 06 A6 06         [ 2] 3754 	jp tb_error
      002BB4                       3755 2$: 
                                   3756 ; acc16=(x<<5)^x 
      00A52F CC 97 3E         [ 2] 3757 	ldw x,seedx 
      00A532 81               [ 2] 3758 	sllw x 
      00A533 58               [ 2] 3759 	sllw x 
      00A533 CD               [ 2] 3760 	sllw x 
      00A534 A4               [ 2] 3761 	sllw x 
      00A535 13               [ 2] 3762 	sllw x 
      00A536 CF               [ 1] 3763 	ld a,xh 
      00A537 00 1A 14         [ 1] 3764 	xor a,seedx 
      00A539 C7 00 0D         [ 1] 3765 	ld acc16,a 
      00A539 85               [ 1] 3766 	ld a,xl 
      00A53A 52 04 89         [ 1] 3767 	xor a,seedx+1 
      00A53D CE 00 1A         [ 1] 3768 	ld acc8,a 
                                   3769 ; seedx=seedy 
      00A540 89 CE 00         [ 2] 3770 	ldw x,seedy 
      00A543 05 1F 05         [ 2] 3771 	ldw seedx,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 200.
Hexadecimal [24-Bits]



                                   3772 ; seedy=seedy^(seedy>>1)
      00A546 CE 00 01         [ 2] 3773 	ldw x,seedy 
      00A549 1F               [ 2] 3774 	srlw x 
      00A54A 07               [ 1] 3775 	ld a,xh 
      00A54B 85 20 CD         [ 1] 3776 	xor a,seedy 
      00A54E C7 00 16         [ 1] 3777 	ld seedy,a  
      00A54E 72               [ 1] 3778 	ld a,xl 
      00A54F 00 00 23         [ 1] 3779 	xor a,seedy+1 
      00A552 05 A6 06         [ 1] 3780 	ld seedy+1,a 
                                   3781 ; acc16>>3 
      00A555 CC 97 3E         [ 2] 3782 	ldw x,acc16 
      00A558 54               [ 2] 3783 	srlw x 
      00A558 1E               [ 2] 3784 	srlw x 
      00A559 03               [ 2] 3785 	srlw x 
                                   3786 ; x=acc16^x 
      00A55A CF               [ 1] 3787 	ld a,xh 
      00A55B 00 05 E6         [ 1] 3788 	xor a,acc16 
      00A55E 02 C7 00         [ 1] 3789 	ld acc16,a 
      00A561 04               [ 1] 3790 	ld a,xl 
      00A562 1E 05 CF         [ 1] 3791 	xor a,acc8 
      00A565 00 01 85         [ 1] 3792 	ld acc8,a 
                                   3793 ; seedy=acc16^seedy 
      00A568 5B 04 89         [ 1] 3794 	xor a,seedy+1
      00A56B 81               [ 1] 3795 	ld xl,a 
      00A56C C6 00 0D         [ 1] 3796 	ld a,acc16 
      00A56C 72 01 00         [ 1] 3797 	xor a,seedy
      00A56F 23               [ 1] 3798 	ld xh,a 
      00A570 02 4F 81         [ 2] 3799 	ldw seedy,x 
                                   3800 ; return seedx_lo&0x7f:seedy modulo expr + 1 
      00A573 C6 00 15         [ 1] 3801 	ld a,seedx+1
      00A573 72 09            [ 1] 3802 	and a,#127
      002C09                       3803 	_xpush 
      00A575 00 23 12 5B      [ 2]    1     subw y,#CELL_SIZE
      00A579 02 CD            [ 1]    2     ld (y),a 
      00A57B A1 08 5B         [ 2]    3     ldw (1,y),x 
      00A57E 04               [ 1] 3804 	pop a 
      00A57F 72               [ 2] 3805 	popw x 
      002C14                       3806 	_xpush 
      00A580 19 00 23 72      [ 2]    1     subw y,#CELL_SIZE
      00A584 10 00            [ 1]    2     ld (y),a 
      00A586 23 CC 97         [ 2]    3     ldw (1,y),x 
      00A589 E7 CE 00         [ 4] 3807 	call mod24 
      002C20                       3808 	_xpop
      00A58C 1C C3            [ 1]    1     ld a,(y)
      00A58E 00               [ 1]    2     ldw x,y 
      00A58F 1E 2B            [ 2]    3     ldw x,(1,x)
      00A591 0C AE 96 CB      [ 2]    4     addw y,#CELL_SIZE 
      00A595 CD 8A 21         [ 2] 3809 	addw x,#1 
      00A598 55 00            [ 1] 3810 	adc a,#0  
      00A59A 04               [ 4] 3811 	ret 
                                   3812 
                                   3813 ;---------------------------------
                                   3814 ; BASIC: WORDS 
                                   3815 ; affiche la listes des mots du
                                   3816 ; dictionnaire ainsi que le nombre
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 201.
Hexadecimal [24-Bits]



                                   3817 ; de mots.
                                   3818 ;---------------------------------
                           000001  3819 	WLEN=1 ; word length
                           000002  3820 	LLEN=2 ; character sent to console
                           000003  3821 	WCNT=3 ; count words printed 
                           000003  3822 	VSIZE=3 
      002C2F                       3823 words:
      002C2F                       3824 	_vars VSIZE
      00A59B 00 02            [ 2]    1     sub sp,#VSIZE 
      00A59D 81 02            [ 1] 3825 	clr (LLEN,sp)
      00A59E 0F 03            [ 1] 3826 	clr (WCNT,sp)
      00A59E 5B 02 33 43      [ 2] 3827 	ldw y,#kword_dict+2
      00A5A0 93               [ 1] 3828 0$:	ldw x,y
      00A5A0 CD               [ 1] 3829 	ld a,(x)
      00A5A1 9C F2            [ 1] 3830 	and a,#15 
      00A5A3 CD 94            [ 1] 3831 	ld (WLEN,sp),a 
      00A5A5 F0 5F            [ 1] 3832 	inc (WCNT,sp)
      00A5A7 CF               [ 1] 3833 1$:	incw x 
      00A5A8 00               [ 1] 3834 	ld a,(x)
      00A5A9 07 72 5F         [ 4] 3835 	call putc 
      00A5AC 00 09            [ 1] 3836 	inc (LLEN,sp)
      00A5AE 72 5F            [ 1] 3837 	dec (WLEN,sp)
      00A5B0 00 0A            [ 1] 3838 	jrne 1$
      00A5B2 CE 00            [ 1] 3839 	ld a,#70
      00A5B4 1C CF            [ 1] 3840 	cp a,(LLEN,sp)
      00A5B6 00 05            [ 1] 3841 	jrmi 2$   
      00A5B8 E6 02            [ 1] 3842 	ld a,#SPACE 
      00A5BA C7 00 04         [ 4] 3843 	call putc 
      00A5BD 35 03            [ 1] 3844 	inc (LLEN,sp) 
      00A5BF 00 02            [ 2] 3845 	jra 3$
      00A5C1 72 10            [ 1] 3846 2$: ld a,#CR 
      00A5C3 00 23 CC         [ 4] 3847 	call putc 
      00A5C6 97 E7            [ 1] 3848 	clr (LLEN,sp)
      00A5C8 72 A2 00 02      [ 2] 3849 3$:	subw y,#2 
      00A5C8 AE 17            [ 2] 3850 	ldw y,(y)
      00A5CA FF 94            [ 1] 3851 	jrne 0$ 
      00A5CC CC 97            [ 1] 3852 	ld a,#CR 
      00A5CE C8 09 44         [ 4] 3853 	call putc  
      00A5CF 5F               [ 1] 3854 	clrw x 
      00A5CF CD 98            [ 1] 3855 	ld a,(WCNT,sp)
      00A5D1 3D               [ 1] 3856 	ld xl,a 
      00A5D2 A1 85 27         [ 4] 3857 	call prt_i16 
      00A5D5 03 CC 97         [ 2] 3858 	ldw x,#words_count_msg
      00A5D8 3C CD 98         [ 4] 3859 	call puts 
      002C7C                       3860 	_drop VSIZE 
      00A5DB 72 CF            [ 2]    1     addw sp,#VSIZE 
      00A5DD 00               [ 4] 3861 	ret 
      00A5DE 1A CD 89 CD 27 03 CD  3862 words_count_msg: .asciz " words in dictionary\n"
             89 D4 72 3F 00 1A 72
             5C 00 1B 72 3F 00 1A
             72
                                   3863 
                                   3864 
                                   3865 ;-----------------------------
                                   3866 ; BASIC: TIMER expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 202.
Hexadecimal [24-Bits]



                                   3867 ; initialize count down timer 
                                   3868 ;-----------------------------
      002C95                       3869 set_timer:
      00A5F4 5C 00 1B         [ 4] 3870 	call arg_list
      00A5F7 72 C7            [ 1] 3871 	cp a,#1 
      00A5F9 00 1A            [ 1] 3872 	jreq 1$
      00A5FB 81 16 BC         [ 2] 3873 	jp syntax_error
      00A5FC                       3874 1$: 
      002C9F                       3875 	_xpop  
      00A5FC AE 00            [ 1]    1     ld a,(y)
      00A5FE 64               [ 1]    2     ldw x,y 
      00A5FF 90 AE            [ 2]    3     ldw x,(1,x)
      00A601 03 E8 20 20      [ 2]    4     addw y,#CELL_SIZE 
      00A605 CF 00 12         [ 2] 3876 	ldw timer,x 
      00A605 CD               [ 4] 3877 	ret 
                                   3878 
                                   3879 ;------------------------------
                                   3880 ; BASIC: TIMEOUT 
                                   3881 ; return state of timer 
                                   3882 ; output:
                                   3883 ;   A:X     0 not timeout 
                                   3884 ;   A:X     -1 timeout 
                                   3885 ;------------------------------
      002CAC                       3886 timeout:
      00A606 99 FB A1         [ 2] 3887 	ldw x,timer 
      00A609 02               [ 1] 3888 	clr a 
      00A60A 27 03            [ 2] 3889 	jra logical_not 
                                   3890 
                                   3891 ;--------------------------------
                                   3892 ; BASIC NOT(expr) 
                                   3893 ; return logical complement of expr
                                   3894 ;--------------------------------
      002CB2                       3895 func_not:
      00A60C CC 97 3C         [ 4] 3896 	call func_args  
      00A60F A1 01            [ 1] 3897 	cp a,#1
      00A60F 90 F6            [ 1] 3898 	jreq 1$
      00A611 93 EE 01         [ 2] 3899 	jp syntax_error
      002CBC                       3900 1$: _xpop 
      00A614 72 A9            [ 1]    1     ld a,(y)
      00A616 00               [ 1]    2     ldw x,y 
      00A617 03 89            [ 2]    3     ldw x,(1,x)
      00A619 90 F6 93 EE      [ 2]    4     addw y,#CELL_SIZE 
      002CC5                       3901 logical_not: 
      00A61D 01               [ 1] 3902 	tnz a 
      00A61E 72 A9            [ 1] 3903 	jrne 2$
      00A620 00               [ 2] 3904 	tnzw x 
      00A621 03 90            [ 1] 3905 	jrne 2$  
      00A623 93               [ 1] 3906 	cpl a 
      00A624 85               [ 2] 3907 	cplw x  
      00A625 81               [ 4] 3908 	ret 
      00A625 89               [ 1] 3909 2$: clr a 
      00A626 AE               [ 1] 3910 	clrw x 
      00A627 F4               [ 4] 3911 	ret 
                                   3912 
                                   3913 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 203.
Hexadecimal [24-Bits]



                                   3914 ;-----------------------------------
                                   3915 ; BASIC: IWDGEN expr1 
                                   3916 ; enable independant watchdog timer
                                   3917 ; expr1 is delay in multiple of 62.5µsec
                                   3918 ; expr1 -> {1..16383}
                                   3919 ;-----------------------------------
      002CD1                       3920 enable_iwdg:
      00A628 24 65 90         [ 4] 3921 	call arg_list
      00A62B A3 7A            [ 1] 3922 	cp a,#1 
      00A62D 12 2B            [ 1] 3923 	jreq 1$
      00A62F 01 5C BC         [ 2] 3924 	jp syntax_error 
      00A631                       3925 1$: _xpop  
      00A631 9E C7            [ 1]    1     ld a,(y)
      00A633 53               [ 1]    2     ldw x,y 
      00A634 0D 9F            [ 2]    3     ldw x,(1,x)
      00A636 C7 53 0E 8C      [ 2]    4     addw y,#CELL_SIZE 
      00A63A 56 9E            [ 1] 3926 	push #0
      00A63C C7 53 0F 9F      [ 1] 3927 	mov IWDG_KR,#IWDG_KEY_ENABLE
      00A640 C7               [ 1] 3928 	ld a,xh 
      00A641 53 10            [ 1] 3929 	and a,#0x3f
      00A643 72               [ 1] 3930 	ld xh,a  
      00A644 10 53 08         [ 2] 3931 2$:	cpw x,#255
      00A647 72 10            [ 2] 3932 	jrule 3$
      00A649 53 00            [ 1] 3933 	inc (1,sp)
      00A64B 72               [ 1] 3934 	rcf 
      00A64C 10               [ 2] 3935 	rrcw x 
      00A64D 53 04            [ 2] 3936 	jra 2$
      00A64F 85 CD AA A0      [ 1] 3937 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A653 72               [ 1] 3938 	pop a  
      00A654 11 53 08         [ 1] 3939 	ld IWDG_PR,a 
      00A657 72               [ 1] 3940 	ld a,xl
      00A658 11               [ 1] 3941 	dec a 
      00A659 53 00 81 E0      [ 1] 3942 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      00A65C C7 50 E2         [ 1] 3943 	ld IWDG_RLR,a 
      00A65C CD 99 FB A1      [ 1] 3944 	mov IWDG_KR,#IWDG_KEY_REFRESH
      00A660 02               [ 4] 3945 	ret 
                                   3946 
                                   3947 
                                   3948 ;-----------------------------------
                                   3949 ; BASIC: IWDGREF  
                                   3950 ; refresh independant watchdog count down 
                                   3951 ; timer before it reset MCU. 
                                   3952 ;-----------------------------------
      002D0F                       3953 refresh_iwdg:
      00A661 27 12 A1 01      [ 1] 3954 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      00A665 27               [ 4] 3955 	ret 
                                   3956 
                                   3957 
                                   3958 ;-------------------------------------
                                   3959 ; BASIC: LOG(expr)
                                   3960 ; return logarithm base 2 of expr 
                                   3961 ; this is the position of most significant
                                   3962 ; bit set. 
                                   3963 ; input: 
                                   3964 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 204.
Hexadecimal [24-Bits]



                                   3965 ;   A     TK_INTGR 
                                   3966 ;   xstack log2 
                                   3967 ;*********************************
      002D14                       3968 log2:
      00A666 03 CC 97         [ 4] 3969 	call func_args 
      00A669 3C 4F            [ 1] 3970 	cp a,#1 
      00A66B 5F 72            [ 1] 3971 	jreq 1$
      00A66D A2 00 03         [ 2] 3972 	jp syntax_error 
      002D1E                       3973 1$: 
      002D1E                       3974 	_xpop    
      00A670 90 F7            [ 1]    1     ld a,(y)
      00A672 90               [ 1]    2     ldw x,y 
      00A673 EF 01            [ 2]    3     ldw x,(1,x)
      00A675 90 E6 03 93      [ 2]    4     addw y,#CELL_SIZE 
      00A679 EE               [ 1] 3975 	tnz a
      00A67A 04 5D            [ 1] 3976 	jrne 2$ 
      00A67C 27               [ 2] 3977 	tnzw x 
      00A67D 25 90            [ 1] 3978 	jrne 2$
      00A67F F6 93            [ 1] 3979 	ld a,#ERR_BAD_VALUE
      00A681 EE 01 72         [ 2] 3980 	jp tb_error 
      00A684 A9 00            [ 1] 3981 2$: push #24 
      00A686 03               [ 2] 3982 3$: rlcw x 
      00A687 72               [ 1] 3983     rlc a 
      00A688 A9 00            [ 1] 3984 	jrc 4$
      00A68A 03 9F            [ 1] 3985 	dec (1,sp) 
      00A68C A4 07            [ 1] 3986 	jrne 3$
      00A68E 4E               [ 1] 3987 4$: clrw x 
      00A68F C7               [ 1] 3988     pop a 
      00A690 54               [ 1] 3989 	dec a
      00A691 01               [ 1] 3990 	rlwa x  
      002D40                       3991 9$:	
      00A692 72               [ 4] 3992 	ret 
                                   3993 
                                   3994 ;-----------------------------------
                                   3995 ; BASIC: BIT(expr) 
                                   3996 ; expr ->{0..23}
                                   3997 ; return 2^expr 
                                   3998 ; output:
                                   3999 ;    A:X    2^expr 
                                   4000 ;-----------------------------------
      002D41                       4001 bitmask:
      00A693 16 50 CA         [ 4] 4002     call func_args 
      00A696 72 10            [ 1] 4003 	cp a,#1
      00A698 54 01            [ 1] 4004 	jreq 1$
      00A69A AE 00 1B         [ 2] 4005 	jp syntax_error 
      002D4B                       4006 1$: _xpop 
      00A69D 5A 9D            [ 1]    1     ld a,(y)
      00A69F 26               [ 1]    2     ldw x,y 
      00A6A0 FA 20            [ 2]    3     ldw x,(1,x)
      00A6A2 08 72 11 54      [ 2]    4     addw y,#CELL_SIZE 
      00A6A6 01               [ 1] 4007 	ld a,xl 
      00A6A7 72 17 50         [ 2] 4008 	ldw x,#1 
      00A6AA CA 17            [ 1] 4009 	and a,#23
      00A6AB 27 0A            [ 1] 4010 	jreq 9$
      00A6AB 81               [ 1] 4011 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 205.
Hexadecimal [24-Bits]



      00A6AC 4F               [ 1] 4012 	clr a 
      002D5E                       4013 2$: 
      00A6AC CD               [ 2] 4014 	slaw x 
      00A6AD 99               [ 1] 4015 	rlc a 	
      00A6AE F6 A1            [ 1] 4016 	dec (1,sp)
      00A6B0 01 27            [ 1] 4017 	jrne 2$ 
      002D64                       4018 4$:
      002D64                       4019     _drop 1 
      00A6B2 03 CC            [ 2]    1     addw sp,#1 
      00A6B4 97               [ 4] 4020 9$:	ret 
                                   4021 
                                   4022 ;------------------------------
                                   4023 ; BASIC: INVERT(expr)
                                   4024 ; 1's complement 
                                   4025 ;--------------------------------
      002D67                       4026 invert:
      00A6B5 3C 90 F6         [ 4] 4027 	call func_args
      00A6B8 93 EE            [ 1] 4028 	cp a,#1 
      00A6BA 01 72            [ 1] 4029 	jreq 1$
      00A6BC A9 00 03         [ 2] 4030 	jp syntax_error
      002D71                       4031 1$: _xpop 
      00A6BF A3 00            [ 1]    1     ld a,(y)
      00A6C1 05               [ 1]    2     ldw x,y 
      00A6C2 23 05            [ 2]    3     ldw x,(1,x)
      00A6C4 A6 0A CC 97      [ 2]    4     addw y,#CELL_SIZE 
      00A6C8 3E               [ 1] 4032 	cpl a 
      00A6C9 9F               [ 2] 4033 	cplw x 
      00A6CA C7               [ 4] 4034 	ret 
                                   4035 
                                   4036 ;------------------------------
                                   4037 ; BASIC: DO 
                                   4038 ; initiate a DO ... UNTIL loop 
                                   4039 ;------------------------------
                           000003  4040 	DOLP_ADR=3 
                           000005  4041 	DOLP_INW=5
                           000004  4042 	VSIZE=4 
      002D7D                       4043 do_loop:
      00A6CB 00               [ 2] 4044 	popw x 
      002D7E                       4045 	_vars VSIZE 
      00A6CC 0F A6            [ 2]    1     sub sp,#VSIZE 
      00A6CE 05               [ 2] 4046 	pushw x 
      00A6CF C0 00 0F         [ 2] 4047 	ldw x,basicptr 
      00A6D2 C7 54            [ 2] 4048 	ldw (DOLP_ADR,sp),x
      00A6D4 00 72 16         [ 2] 4049 	ldw x,in.w 
      00A6D7 54 02            [ 2] 4050 	ldw (DOLP_INW,sp),x
      00A6D9 72 10 54 01      [ 1] 4051 	inc loop_depth 
      00A6DD 72               [ 4] 4052 	ret 
                                   4053 
                                   4054 ;--------------------------------
                                   4055 ; BASIC: UNTIL expr 
                                   4056 ; loop if exprssion is false 
                                   4057 ; else terminate loop
                                   4058 ;--------------------------------
      002D90                       4059 until: 
      00A6DE 0F 54 00 FB      [ 1] 4060 	tnz loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 206.
Hexadecimal [24-Bits]



      00A6E2 CE 54            [ 1] 4061 	jrne 1$ 
      00A6E4 04 A6 84         [ 2] 4062 	jp syntax_error 
      002D99                       4063 1$: 
      00A6E7 81 1B AB         [ 4] 4064 	call condition  
      00A6E8                       4065 	_xpop 
      00A6E8 52 01            [ 1]    1     ld a,(y)
      00A6EA CD               [ 1]    2     ldw x,y 
      00A6EB 99 F6            [ 2]    3     ldw x,(1,x)
      00A6ED A1 01 27 03      [ 2]    4     addw y,#CELL_SIZE 
      00A6F1 CC               [ 1] 4066 	tnz a 
      00A6F2 97 3C            [ 1] 4067 	jrne 9$ 
      00A6F4 90 F6            [ 2] 4068 	ldw x,(DOLP_ADR,sp)
      00A6F6 93 EE 01         [ 2] 4069 	ldw basicptr,x 
      00A6F9 72 A9            [ 1] 4070 	ld a,(2,x)
      00A6FB 00 03 A3         [ 1] 4071 	ld count,a 
      00A6FE 00 0F            [ 2] 4072 	ldw x,(DOLP_INW,sp)
      00A700 23 05 A6         [ 2] 4073 	ldw in.w,x 
      00A703 0A               [ 4] 4074 	ret 
      002DB8                       4075 9$:	; remove loop data from stack  
      00A704 CC               [ 2] 4076 	popw x
      002DB9                       4077 	_drop VSIZE
      00A705 97 3E            [ 2]    1     addw sp,#VSIZE 
      00A707 CD AB E4 6B      [ 1] 4078 	dec loop_depth 
      00A70B 01               [ 2] 4079 	jp (x)
                                   4080 
                                   4081 ;--------------------------
                                   4082 ; BASIC: PORTA...PORTI  
                                   4083 ;  return constant value 
                                   4084 ;  PORT  base address 
                                   4085 ;---------------------------
      002DC0                       4086 const_porta:
      00A70C E6 01 0D         [ 2] 4087 	ldw x,#PA_BASE 
      00A70F 01               [ 1] 4088 	clr a 
      00A710 27               [ 4] 4089 	ret 
      002DC5                       4090 const_portb:
      00A711 05 44 0A         [ 2] 4091 	ldw x,#PB_BASE 
      00A714 01               [ 1] 4092 	clr a 
      00A715 26               [ 4] 4093 	ret 
      002DCA                       4094 const_portc:
      00A716 FB A4 01         [ 2] 4095 	ldw x,#PC_BASE 
      00A719 5F               [ 1] 4096 	clr a 
      00A71A 97               [ 4] 4097 	ret 
      002DCF                       4098 const_portd:
      00A71B 4F 5B 01         [ 2] 4099 	ldw x,#PD_BASE 
      00A71E 81               [ 1] 4100 	clr a 
      00A71F 81               [ 4] 4101 	ret 
      002DD4                       4102 const_porte:
      00A71F 52 02 CD         [ 2] 4103 	ldw x,#PE_BASE 
      00A722 99               [ 1] 4104 	clr a 
      00A723 FB               [ 4] 4105 	ret 
      002DD9                       4106 const_portf:
      00A724 A1 02 27         [ 2] 4107 	ldw x,#PF_BASE 
      00A727 03               [ 1] 4108 	clr a 
      00A728 CC               [ 4] 4109 	ret 
      002DDE                       4110 const_portg:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 207.
Hexadecimal [24-Bits]



      00A729 97 3C 90         [ 2] 4111 	ldw x,#PG_BASE 
      00A72C F6               [ 1] 4112 	clr a 
      00A72D 93               [ 4] 4113 	ret 
      002DE3                       4114 const_porth:
      00A72E EE 01 72         [ 2] 4115 	ldw x,#PH_BASE 
      00A731 A9               [ 1] 4116 	clr a 
      00A732 00               [ 4] 4117 	ret 
      002DE8                       4118 const_porti:
      00A733 03 9F 6B         [ 2] 4119 	ldw x,#PI_BASE 
      00A736 02               [ 1] 4120 	clr a 
      00A737 90               [ 4] 4121 	ret 
                                   4122 
                                   4123 ;-------------------------------
                                   4124 ; following return constant 
                                   4125 ; related to GPIO register offset 
                                   4126 ;---------------------------------
      002DED                       4127 const_odr:
      00A738 F6               [ 1] 4128 	clr a 
      00A739 93 EE 01         [ 2] 4129 	ldw x,#GPIO_ODR
      00A73C 72               [ 4] 4130 	ret 
      002DF2                       4131 const_idr:
      00A73D A9               [ 1] 4132 	clr a 
      00A73E 00 03 A3         [ 2] 4133 	ldw x,#GPIO_IDR
      00A741 00               [ 4] 4134 	ret 
      002DF7                       4135 const_ddr:
      00A742 0F               [ 1] 4136 	clr a
      00A743 23 05 A6         [ 2] 4137 	ldw x,#GPIO_DDR
      00A746 0A               [ 4] 4138 	ret 
      002DFC                       4139 const_cr1:
      00A747 CC               [ 1] 4140 	clr a 
      00A748 97 3E CD         [ 2] 4141 	ldw x,#GPIO_CR1
      00A74B AB               [ 4] 4142 	ret 
      002E01                       4143 const_cr2:
      00A74C E4               [ 1] 4144 	clr a
      00A74D 6B 01 A6         [ 2] 4145 	ldw x,#GPIO_CR2
      00A750 01               [ 4] 4146 	ret 
                                   4147 ;-------------------------
                                   4148 ; BASIC: POUT 
                                   4149 ;  constant for port mode
                                   4150 ;  used by PMODE 
                                   4151 ;  to set pin as output
                                   4152 ;------------------------
      002E06                       4153 const_output:
      00A751 0D               [ 1] 4154 	clr a 
      00A752 01 27 05         [ 2] 4155 	ldw x,#OUTP
      00A755 48               [ 4] 4156 	ret 
                                   4157 
                                   4158 ;-------------------------
                                   4159 ; BASIC: PINP 
                                   4160 ;  constant for port mode
                                   4161 ;  used by PMODE 
                                   4162 ;  to set pin as input
                                   4163 ;------------------------
      002E0B                       4164 const_input:
      00A756 0A               [ 1] 4165 	clr a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 208.
Hexadecimal [24-Bits]



      00A757 01 26 FB         [ 2] 4166 	ldw x,#INP 
      00A75A 0D               [ 4] 4167 	ret 
                                   4168 	
                                   4169 ;-----------------------
                                   4170 ; memory area constants
                                   4171 ;-----------------------
      002E10                       4172 const_eeprom_base:
      00A75B 02               [ 1] 4173 	clr a  
      00A75C 26 05 43         [ 2] 4174 	ldw x,#EEPROM_BASE 
      00A75F E4               [ 4] 4175 	ret 
                                   4176 
                                   4177 ;---------------------------
                                   4178 ; BASIC: DATA 
                                   4179 ; when the interpreter find 
                                   4180 ; a DATA line it skip it.
                                   4181 ;---------------------------
      002E15                       4182 data:
      00A760 00 20 02 EA 00   [ 1] 4183 	mov in,count 
      00A765 E7               [ 4] 4184 	ret 
                                   4185 
                                   4186 ;------------------------------
                                   4187 ; check if it is a DATA line 
                                   4188 ; input: 
                                   4189 ;    X    line address 
                                   4190 ; output:
                                   4191 ;    Z    set if DATA line 
                                   4192 ;----------------------------
      002E1B                       4193 is_data_line:
      00A766 00 5B            [ 2] 4194 	ldw x,(4,x)
      00A768 02 81 49         [ 2] 4195 	ldw x,(code_addr,x)
      00A76A A3 2E 15         [ 2] 4196 	cpw x,#data 
      00A76A 72               [ 4] 4197 	ret 
                                   4198 
                                   4199 ;---------------------------
                                   4200 ; set DATA pointer at line# 
                                   4201 ; specified by X 
                                   4202 ;---------------------------
      002E24                       4203 data_line:
      00A76B 00 00            [ 2] 4204 	pushw y 
      00A76D 23               [ 1] 4205 	clr a 
      00A76E 02 4F 81         [ 4] 4206 	call search_lineno
      00A771 5D               [ 2] 4207 	tnzw x 
      00A771 AE A7            [ 1] 4208 	jrne 3$
      00A773 98 CD            [ 1] 4209 2$:	ld a,#ERR_NO_LINE 
      00A775 8A 21 5B         [ 2] 4210 	jp tb_error
      002E32                       4211 3$: ; check if valid data line 
      00A778 02 52            [ 1] 4212     ldw y,x 
      00A77A 04 CD A0         [ 4] 4213 	call is_data_line 
      00A77D F8 AE            [ 1] 4214 	jrne 2$ 
      002E39                       4215 set_data_ptr: 	
      00A77F 16 68 CF 00      [ 2] 4216 	ldw data_ptr,y
      00A783 05 7F 72         [ 1] 4217 	ld a,(2,y)
      00A786 5F 00 04         [ 1] 4218 	ld data_len,a 
      00A789 5F CF 00 01      [ 1] 4219 	mov data_ofs,#FIRST_DATA_ITEM 
      00A78D 72 11            [ 2] 4220 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 209.
Hexadecimal [24-Bits]



      00A78F 00               [ 4] 4221 	ret
                                   4222 
                                   4223 ;---------------------------------
                                   4224 ; BASIC: RESTORE [line#]
                                   4225 ; set data_ptr to first data line
                                   4226 ; if no DATA found pointer set to
                                   4227 ; zero.
                                   4228 ; if a line# is given as argument 
                                   4229 ; a data line with that number 
                                   4230 ; is searched and the data pointer 
                                   4231 ; is set to it. If there is no 
                                   4232 ; data line with that number 
                                   4233 ; the program is interrupted. 
                                   4234 ;---------------------------------
      002E4A                       4235 restore:
      00A790 23 72 18 00      [ 1] 4236 	clr data_ptr 
      00A794 23 CC 97 E7      [ 1] 4237 	clr data_ptr+1
      00A798 0A 62 72 65      [ 1] 4238 	clr data_ofs 
      00A79C 61 6B 20 70      [ 1] 4239 	clr data_len
      00A7A0 6F 69 6E         [ 4] 4240 	call next_token 
      00A7A3 74 2C            [ 1] 4241 	cp a,#TK_INTGR
      00A7A5 20 52            [ 1] 4242 	jrne 0$
      00A7A7 55 4E 20         [ 4] 4243 	call get_int24 
      00A7AA 74 6F            [ 2] 4244 	jra data_line 
      002E66                       4245 0$:	
      002E66                       4246 	_unget_token  
      00A7AC 20 72 65 73 75   [ 1]    1      mov in,in.saved  
      00A7B1 6D 65 2E         [ 2] 4247 	ldw x,txtbgn
      00A7B4 0A 00            [ 2] 4248 	pushw y 
                                   4249 ; search first DATA line 
      00A7B6                       4250 data_search_loop: 	
      00A7B6 72 01 00         [ 2] 4251 	cpw x,txtend
      00A7B9 23 01            [ 1] 4252 	jruge restore_error 
      00A7BB 81 93            [ 1] 4253 	ldw y,x 
      00A7BC CD 2E 1B         [ 4] 4254 	call is_data_line 
      00A7BC CD 95            [ 1] 4255 	jreq set_data_ptr
      002E7C                       4256 try_next_line: 
      00A7BE 98               [ 1] 4257 	ldw x,y 
      00A7BF 81 02            [ 1] 4258 	ld a,(2,x)
      00A7C0 C7 00 0E         [ 1] 4259 	ld acc8,a 
      00A7C0 72 5F 00 19      [ 1] 4260 	clr acc16 
      00A7C4 52 03 CD 98      [ 2] 4261 	addw x,acc16 
      00A7C8 3D A1            [ 2] 4262 	jra data_search_loop
      002E8C                       4263 restore_error:	
      00A7CA 04 27            [ 1] 4264     ld a,#ERR_NO_DATA 
      00A7CC 03 CC 97         [ 2] 4265 	jp tb_error 
                                   4266 
                                   4267 
                                   4268 ;---------------------------------
                                   4269 ; BASIC: READ 
                                   4270 ; return next data item | 0 
                                   4271 ;---------------------------------
                           000001  4272 	CTX_BPTR=1 
                           000003  4273 	CTX_IN=3 
                           000004  4274 	CTX_COUNT=4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 210.
Hexadecimal [24-Bits]



                           000005  4275 	INT24=5
                           000007  4276 	VSIZE=7 
      002E91                       4277 read:
      002E91                       4278 	_vars  VSIZE 
      00A7CF 3C CD            [ 2]    1     sub sp,#VSIZE 
      002E93                       4279 read01:	
      00A7D1 98 8C A4         [ 1] 4280 	ld a,data_ofs
      00A7D4 DF A1 45         [ 1] 4281 	cp a,data_len 
      00A7D7 26 0C            [ 1] 4282 	jreq 2$ ; end of line  
      00A7D9 AE 40 00         [ 4] 4283 	call save_context
      00A7DC CF 00 1A         [ 2] 4284 	ldw x,data_ptr 
      00A7DF AE 47 FF         [ 2] 4285 	ldw basicptr,x 
      00A7E2 4F 20 15 A1 46   [ 1] 4286 	mov in,data_ofs 
      00A7E7 27 06 AE 96 7C   [ 1] 4287 	mov count,data_len  
      00A7EC CC 97 3E         [ 4] 4288 	call expression 
      00A7EF A1 84            [ 1] 4289 	cp a,#TK_INTGR 
      00A7EF AE B6            [ 1] 4290 	jreq 1$ 
      00A7F1 80 CF 00         [ 2] 4291 	jp syntax_error 
      002EB8                       4292 1$:
      00A7F4 1A A6 02         [ 4] 4293 	call next_token ; skip comma
      00A7F7 AE 7F FF         [ 2] 4294 	ldw x,basicptr 
      00A7FA CF 00 06         [ 2] 4295 	ldw data_ptr,x 
      00A7FA 6B 01 1F 02 CD   [ 1] 4296 	mov data_ofs,in 
      00A7FF 87 C2 88         [ 4] 4297 	call rest_context
      00A801                       4298 	_xpop 
      00A801 CD 89            [ 1]    1     ld a,(y)
      00A803 44               [ 1]    2     ldw x,y 
      00A804 27 08            [ 2]    3     ldw x,(1,x)
      00A806 A6 45 CD 89      [ 2]    4     addw y,#CELL_SIZE 
      002ED2                       4299 	_drop VSIZE 
      00A80A C4 CD            [ 2]    1     addw sp,#VSIZE 
      00A80C 88               [ 4] 4300 	ret 
      002ED5                       4301 2$: ; end of line reached 
      00A80D 40 AE 00 80      [ 2] 4302 	ldw y, data_ptr 
      00A811 CD 89 36 7B      [ 1] 4303 	clr data_ptr
      00A815 01 1E 02 72      [ 1] 4304 	clr data_ptr+1   
      00A819 B0 00 1A C2      [ 1] 4305 	clr data_ofs 
      00A81D 00 19 22 E0      [ 1] 4306 	clr data_len 
      00A821 CD 95 98         [ 4] 4307 	call try_next_line 
      00A824 1E 02            [ 2] 4308 	jra read01
                                   4309 
                                   4310 
                                   4311 ;---------------------------------
                                   4312 ; BASIC: SPIEN clkdiv, 0|1  
                                   4313 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   4314 ; if clkdiv==-1 disable SPI
                                   4315 ; 0|1 -> disable|enable  
                                   4316 ;--------------------------------- 
                           000005  4317 SPI_CS_BIT=5
      002EEE                       4318 spi_enable:
      00A826 A3 47 FF         [ 4] 4319 	call arg_list 
      00A829 26 03            [ 1] 4320 	cp a,#2
      00A82B CD 9D            [ 1] 4321 	jreq 1$
      00A82D BB 16 BC         [ 2] 4322 	jp syntax_error 
      00A82E                       4323 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 211.
Hexadecimal [24-Bits]



      00A82E 5B 03 81 C7      [ 1] 4324 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A831 85               [ 2] 4325 	popw x  
      00A831 CE               [ 2] 4326 	tnzw x 
      00A832 B6 80            [ 1] 4327 	jreq spi_disable 
      00A834 C3               [ 2] 4328 	popw x 
      00A835 A8 F1            [ 1] 4329 	ld a,#(1<<SPI_CR1_BR)
      00A837 81               [ 4] 4330 	mul x,a 
      00A838 9F               [ 1] 4331 	ld a,xl 
      00A838 88 4D 27         [ 1] 4332 	ld SPI_CR1,a 
                                   4333 ; configure ~CS on PE5 (D10 on CN8) as output. 
      00A83B 0A F6 5C 90      [ 1] 4334 	bset PE_ODR,#SPI_CS_BIT	; set ~CS high  
      00A83F F7 90 5C 0A      [ 1] 4335 	bset PE_DDR,#SPI_CS_BIT  ; pin as output 
                                   4336 ; configure SPI as master mode 0.	
      00A843 01 26 F6 84      [ 1] 4337 	bset SPI_CR1,#SPI_CR1_MSTR
                                   4338 ; ~CS line controlled by sofware 	
      00A847 81 12 52 01      [ 1] 4339 	bset SPI_CR2,#SPI_CR2_SSM 
      00A848 72 10 52 01      [ 1] 4340     bset SPI_CR2,#SPI_CR2_SSI 
                                   4341 ; enable SPI
      00A848 88 90 AE 16      [ 1] 4342 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A84C B8               [ 4] 4343 	ret 
      002F21                       4344 spi_disable:
      002F21                       4345 	_drop #2; throw first argument.
      00A84D 90 89            [ 2]    1     addw sp,##2 
                                   4346 ; wait spi idle 
      00A84F A6 80            [ 1] 4347 1$:	ld a,#0x82 
      00A851 90 7F 90         [ 1] 4348 	and a,SPI_SR
      00A854 5C 4A            [ 1] 4349 	cp a,#2 
      00A856 26 F9            [ 1] 4350 	jrne 1$
      00A858 90 85 84 81      [ 1] 4351 	bres SPI_CR1,#SPI_CR1_SPE
      00A85C 72 13 50 C7      [ 1] 4352 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A85C 89 90 89 52      [ 1] 4353 	bres PE_DDR,#SPI_CS_BIT 
      00A860 06               [ 4] 4354 	ret 
                                   4355 
      002F39                       4356 spi_clear_error:
      00A861 CD A8            [ 1] 4357 	ld a,#0x78 
      00A863 31 26 09         [ 1] 4358 	bcp a,SPI_SR 
      00A866 AE A8            [ 1] 4359 	jreq 1$
      00A868 F3 CD 8A 21      [ 1] 4360 	clr SPI_SR 
      00A86C CC               [ 4] 4361 1$: ret 
                                   4362 
      002F45                       4363 spi_send_byte:
      00A86D A8               [ 1] 4364 	push a 
      00A86E EB 2F 39         [ 4] 4365 	call spi_clear_error
      00A86F 84               [ 1] 4366 	pop a 
      00A86F CE 00 1C C3 00   [ 2] 4367 	btjf SPI_SR,#SPI_SR_TXE,.
      00A874 1E 25 09         [ 1] 4368 	ld SPI_DR,a
      00A877 AE A9 35 CD 8A   [ 2] 4369 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A87C 21 CC A8         [ 1] 4370 	ld a,SPI_DR 
      00A87F EB               [ 4] 4371 	ret 
                                   4372 
      00A880                       4373 spi_rcv_byte:
      00A880 CD 88            [ 1] 4374 	ld a,#255
      00A882 02 72 5F 00 19   [ 2] 4375 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A887 AE B6 80         [ 1] 4376 	ld a,SPI_DR 
      00A88A CF               [ 4] 4377 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 212.
Hexadecimal [24-Bits]



                                   4378 
                                   4379 ;------------------------------
                                   4380 ; BASIC: SPIWR byte [,byte]
                                   4381 ; write 1 or more byte
                                   4382 ;------------------------------
      002F66                       4383 spi_write:
      00A88B 00 1A CD         [ 4] 4384 	call expression
      00A88E 9E D7            [ 1] 4385 	cp a,#TK_INTGR 
      00A890 1F 05            [ 1] 4386 	jreq 1$
      00A892 0F 03 CD         [ 2] 4387 	jp syntax_error 
      002F70                       4388 1$:	
      00A895 A8               [ 1] 4389 	ld a,xl 
      00A896 48 CE A8         [ 4] 4390 	call spi_send_byte 
      00A899 F1 90 FF         [ 4] 4391 	call next_token 
      00A89C 72 A9            [ 1] 4392 	cp a,#TK_COMMA 
      00A89E 00 02            [ 1] 4393 	jrne 2$ 
      00A8A0 1E 05            [ 2] 4394 	jra spi_write 
      00A8A2 90               [ 1] 4395 2$:	tnz a 
      00A8A3 FF 72            [ 1] 4396 	jreq 3$
      002F80                       4397 	_unget_token  
      00A8A5 A9 00 02 A6 7C   [ 1]    1      mov in,in.saved  
      00A8AA 6B               [ 4] 4398 3$:	ret 
                                   4399 
                                   4400 
                                   4401 ;-------------------------------
                                   4402 ; BASIC: SPIRD 	
                                   4403 ; read one byte from SPI 
                                   4404 ;-------------------------------
      002F86                       4405 spi_read:
      00A8AB 04 A3 00         [ 4] 4406 	call spi_rcv_byte 
      00A8AE 7C               [ 1] 4407 	clrw x 
      00A8AF 22               [ 1] 4408 	ld xl,a 
      00A8B0 01               [ 1] 4409 	clr a  
      00A8B1 9F               [ 4] 4410 	ret 
                                   4411 
                                   4412 ;------------------------------
                                   4413 ; BASIC: SPISEL 0|1 
                                   4414 ; set state of ~CS line
                                   4415 ; 0|1 deselect|select  
                                   4416 ;------------------------------
      002F8D                       4417 spi_select:
      00A8B2 6B 04 CE         [ 4] 4418 	call next_token 
      00A8B5 00 1C            [ 1] 4419 	cp a,#TK_INTGR 
      00A8B7 1F 01            [ 1] 4420 	jreq 1$
      00A8B9 CC 16 BC         [ 2] 4421 	jp syntax_error 
      00A8B9 1E               [ 2] 4422 1$: tnzw x  
      00A8BA 01 7B            [ 1] 4423 	jreq cs_high 
      00A8BC 04 CD A8 38      [ 1] 4424 	bres PE_ODR,#SPI_CS_BIT
      00A8C0 1F               [ 4] 4425 	ret 
      002F9F                       4426 cs_high: 
      00A8C1 01 AE 16 B8      [ 1] 4427 	bset PE_ODR,#SPI_CS_BIT
      00A8C5 CD               [ 4] 4428 	ret 
                                   4429 
                                   4430 ;-------------------------------
                                   4431 ; BASIC: PAD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 213.
Hexadecimal [24-Bits]



                                   4432 ; Return pad buffer address.
                                   4433 ;------------------------------
      002FA4                       4434 pad_ref:
      00A8C6 88 1C AE         [ 2] 4435 	ldw x,#pad 
      00A8C9 00               [ 1] 4436 	clr a
      00A8CA 80               [ 4] 4437 	ret 
                                   4438 
                                   4439 
                                   4440 ;------------------------------
                                   4441 ;      dictionary 
                                   4442 ; format:
                                   4443 ;   link:   2 bytes 
                                   4444 ;   name_length+flags:  1 byte, bits 0:3 lenght,4:8 kw type   
                                   4445 ;   cmd_name: 16 byte max 
                                   4446 ;   cmd_index: 2 bytes 
                                   4447 ;------------------------------
                                   4448 	.macro _dict_entry len,name,cmd_idx 
                                   4449 	.word LINK 
                                   4450 	LINK=.
                                   4451 name:
                                   4452 	.byte len   	
                                   4453 	.ascii "name"
                                   4454 	.word cmd_idx 
                                   4455 	.endm 
                                   4456 
                           000000  4457 	LINK=0
                                   4458 ; respect alphabetic order for BASIC names from Z-A
                                   4459 ; this sort order is for a cleaner WORDS cmd output. 	
      002FA9                       4460 kword_end:
      002FA9                       4461 	_dict_entry,3+F_XOR,XOR,XOR_IDX ; xor operator
      00A8CB CD 89                    1 	.word LINK 
                           002FAB     2 	LINK=.
      002FAB                          3 XOR:
      00A8CD 36                       4 	.byte 3+F_XOR   	
      00A8CE 1E 01 C3                 5 	.ascii "XOR"
      00A8D1 00 1E                    6 	.word XOR_IDX 
      002FB1                       4462 	_dict_entry,5,WRITE,WRITE_IDX;write  
      00A8D3 24 16                    1 	.word LINK 
                           002FB3     2 	LINK=.
      002FB3                          3 WRITE:
      00A8D5 1E                       4 	.byte 5   	
      00A8D6 05 72 F0 03 1F           5 	.ascii "WRITE"
      00A8DB 05 A6                    6 	.word WRITE_IDX 
      002FBB                       4463 	_dict_entry,5,WORDS,WORDS_IDX;words 
      00A8DD 80 A3                    1 	.word LINK 
                           002FBD     2 	LINK=.
      002FBD                          3 WORDS:
      00A8DF 00                       4 	.byte 5   	
      00A8E0 80 24 01 9F 6B           5 	.ascii "WORDS"
      00A8E5 04 CD                    6 	.word WORDS_IDX 
      002FC5                       4464 	_dict_entry 4,WAIT,WAIT_IDX;wait 
      00A8E7 A8 48                    1 	.word LINK 
                           002FC7     2 	LINK=.
      002FC7                          3 WAIT:
      00A8E9 20                       4 	.byte 4   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 214.
Hexadecimal [24-Bits]



      00A8EA CE 5B 06 90              5 	.ascii "WAIT"
      00A8EE 85 85                    6 	.word WAIT_IDX 
      002FCE                       4465 	_dict_entry,3+F_IFUNC,USR,USR_IDX;usr
      00A8F0 81 42                    1 	.word LINK 
                           002FD0     2 	LINK=.
      002FD0                          3 USR:
      00A8F2 43                       4 	.byte 3+F_IFUNC   	
      00A8F3 43 61 6E                 5 	.ascii "USR"
      00A8F6 27 74                    6 	.word USR_IDX 
      002FD6                       4466 	_dict_entry,5,UNTIL,UNTIL_IDX;until 
      00A8F8 20 66                    1 	.word LINK 
                           002FD8     2 	LINK=.
      002FD8                          3 UNTIL:
      00A8FA 6C                       4 	.byte 5   	
      00A8FB 61 73 68 20 61           5 	.ascii "UNTIL"
      00A900 70 70                    6 	.word UNTIL_IDX 
      002FE0                       4467 	_dict_entry,6+F_IFUNC,UFLASH,UFLASH_IDX;uflash 
      00A902 6C 69                    1 	.word LINK 
                           002FE2     2 	LINK=.
      002FE2                          3 UFLASH:
      00A904 63                       4 	.byte 6+F_IFUNC   	
      00A905 61 74 69 6F 6E 2C        5 	.ascii "UFLASH"
      00A90B 20 61                    6 	.word UFLASH_IDX 
      002FEB                       4468 	_dict_entry,6+F_IFUNC,UBOUND,UBOUND_IDX;ubound
      00A90D 6C 72                    1 	.word LINK 
                           002FED     2 	LINK=.
      002FED                          3 UBOUND:
      00A90F 65                       4 	.byte 6+F_IFUNC   	
      00A910 61 64 79 20 6F 6E        5 	.ascii "UBOUND"
      00A916 65 20                    6 	.word UBOUND_IDX 
      002FF6                       4469 	_dict_entry,4,TONE,TONE_IDX;tone  
      00A918 69 6E                    1 	.word LINK 
                           002FF8     2 	LINK=.
      002FF8                          3 TONE:
      00A91A 20                       4 	.byte 4   	
      00A91B 46 4C 41 53              5 	.ascii "TONE"
      00A91F 48 0A                    6 	.word TONE_IDX 
      002FFF                       4470 	_dict_entry,2,TO,TO_IDX;to
      00A921 75 73                    1 	.word LINK 
                           003001     2 	LINK=.
      003001                          3 TO:
      00A923 65                       4 	.byte 2   	
      00A924 20 45                    5 	.ascii "TO"
      00A926 52 41                    6 	.word TO_IDX 
      003006                       4471 	_dict_entry,5,TIMER,TIMER_IDX;set_timer
      00A928 53 45                    1 	.word LINK 
                           003008     2 	LINK=.
      003008                          3 TIMER:
      00A92A 20                       4 	.byte 5   	
      00A92B 5C 46 20 62 65           5 	.ascii "TIMER"
      00A930 66 6F                    6 	.word TIMER_IDX 
      003010                       4472 	_dict_entry,7+F_IFUNC,TIMEOUT,TMROUT_IDX;timeout 
      00A932 72 65                    1 	.word LINK 
                           003012     2 	LINK=.
      003012                          3 TIMEOUT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 215.
Hexadecimal [24-Bits]



      00A934 00                       4 	.byte 7+F_IFUNC   	
      00A935 4E 6F 20 61 70 70 6C     5 	.ascii "TIMEOUT"
      00A93C 69 63                    6 	.word TMROUT_IDX 
      00301C                       4473 	_dict_entry,5+F_IFUNC,TICKS,TICKS_IDX;get_ticks
      00A93E 61 74                    1 	.word LINK 
                           00301E     2 	LINK=.
      00301E                          3 TICKS:
      00A940 69                       4 	.byte 5+F_IFUNC   	
      00A941 6F 6E 20 69 6E           5 	.ascii "TICKS"
      00A946 20 52                    6 	.word TICKS_IDX 
      003026                       4474 	_dict_entry,4,STOP,STOP_IDX;stop 
      00A948 41 4D                    1 	.word LINK 
                           003028     2 	LINK=.
      003028                          3 STOP:
      00A94A 00                       4 	.byte 4   	
      00A94B 53 54 4F 50              5 	.ascii "STOP"
      00A94B CD 9B                    6 	.word STOP_IDX 
      00302F                       4475 	_dict_entry,4,STEP,STEP_IDX;step 
      00A94D 26 A1                    1 	.word LINK 
                           003031     2 	LINK=.
      003031                          3 STEP:
      00A94F 84                       4 	.byte 4   	
      00A950 27 03 CC 97              5 	.ascii "STEP"
      00A954 3C 90                    6 	.word STEP_IDX 
      003038                       4476 	_dict_entry,5,SPIWR,SPIWR_IDX;spi_write
      00A956 F6 93                    1 	.word LINK 
                           00303A     2 	LINK=.
      00303A                          3 SPIWR:
      00A958 EE                       4 	.byte 5   	
      00A959 01 72 A9 00 03           5 	.ascii "SPIWR"
      00A95E C7 00                    6 	.word SPIWR_IDX 
      003042                       4477 	_dict_entry,6,SPISEL,SPISEL_IDX;spi_select
      00A960 19 CF                    1 	.word LINK 
                           003044     2 	LINK=.
      003044                          3 SPISEL:
      00A962 00                       4 	.byte 6   	
      00A963 1A 50 49 53 45 4C        5 	.ascii "SPISEL"
      00A964 00 98                    6 	.word SPISEL_IDX 
      00304D                       4478 	_dict_entry,5+F_IFUNC,SPIRD,SPIRD_IDX; spi_read 
      00A964 CD 98                    1 	.word LINK 
                           00304F     2 	LINK=.
      00304F                          3 SPIRD:
      00A966 3D                       4 	.byte 5+F_IFUNC   	
      00A967 A1 08 27 02 20           5 	.ascii "SPIRD"
      00A96C 20 CD                    6 	.word SPIRD_IDX 
      003057                       4479 	_dict_entry,5,SPIEN,SPIEN_IDX;spi_enable 
      00A96E 9B 26                    1 	.word LINK 
                           003059     2 	LINK=.
      003059                          3 SPIEN:
      00A970 A1                       4 	.byte 5   	
      00A971 84 27 03 CC 97           5 	.ascii "SPIEN"
      00A976 3C 90                    6 	.word SPIEN_IDX 
      003061                       4480 	_dict_entry,5,SLEEP,SLEEP_IDX;sleep 
      00A978 F6 93                    1 	.word LINK 
                           003063     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 216.
Hexadecimal [24-Bits]



      003063                          3 SLEEP:
      00A97A EE                       4 	.byte 5   	
      00A97B 01 72 A9 00 03           5 	.ascii "SLEEP"
      00A980 9F 5F                    6 	.word SLEEP_IDX 
      00306B                       4481     _dict_entry,4,SIZE,SIZE_IDX; cmd_size 
      00A982 CD 88                    1 	.word LINK 
                           00306D     2 	LINK=.
      00306D                          3 SIZE:
      00A984 66                       4 	.byte 4   	
      00A985 AE 00 01 CD              5 	.ascii "SIZE"
      00A989 89 36                    6 	.word SIZE_IDX 
      003074                       4482 	_dict_entry,4,SAVE,SAVE_IDX ;save_app 
      00A98B 20 D7                    1 	.word LINK 
                           003076     2 	LINK=.
      00A98D                          3 SAVE:
      00A98D 81                       4 	.byte 4   	
      00A98E 53 41 56 45              5 	.ascii "SAVE"
      00A98E CD 99                    6 	.word SAVE_IDX 
      00307D                       4483 	_dict_entry 3,RUN,RUN_IDX;run
      00A990 F6 A1                    1 	.word LINK 
                           00307F     2 	LINK=.
      00307F                          3 RUN:
      00A992 01                       4 	.byte 3   	
      00A993 27 03 CC                 5 	.ascii "RUN"
      00A996 97 3C                    6 	.word RUN_IDX 
      003085                       4484 	_dict_entry,6+F_IFUNC,RSHIFT,RSHIFT_IDX;rshift
      00A998 90 F6                    1 	.word LINK 
                           003087     2 	LINK=.
      003087                          3 RSHIFT:
      00A99A 93                       4 	.byte 6+F_IFUNC   	
      00A99B EE 01 72 A9 00 03        5 	.ascii "RSHIFT"
      00A9A1 9F A4                    6 	.word RSHIFT_IDX 
      003090                       4485 	_dict_entry,3+F_IFUNC,RND,RND_IDX;random 
      00A9A3 7F 81                    1 	.word LINK 
                           003092     2 	LINK=.
      00A9A5                          3 RND:
      00A9A5 A6                       4 	.byte 3+F_IFUNC   	
      00A9A6 06 CD 99                 5 	.ascii "RND"
      00A9A9 E9 CD                    6 	.word RND_IDX 
      003098                       4486 	_dict_entry,6,RETURN,RET_IDX;return 
      00A9AB 98 3D                    1 	.word LINK 
                           00309A     2 	LINK=.
      00309A                          3 RETURN:
      00A9AD A1                       4 	.byte 6   	
      00A9AE 02 27 0E A1 04 27        5 	.ascii "RETURN"
      00A9B4 12 A1                    6 	.word RET_IDX 
      0030A3                       4487 	_dict_entry,7,RESTORE,REST_IDX;restore 
      00A9B6 82 27                    1 	.word LINK 
                           0030A5     2 	LINK=.
      0030A5                          3 RESTORE:
      00A9B8 03                       4 	.byte 7   	
      00A9B9 CC 97 3C 54 4F 52 45     5 	.ascii "RESTORE"
      00A9BC 00 86                    6 	.word REST_IDX 
      0030AF                       4488 	_dict_entry 3,REM,REM_IDX;remark 
      00A9BC FD 20                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 217.
Hexadecimal [24-Bits]



                           0030B1     2 	LINK=.
      0030B1                          3 REM:
      00A9BE 0B                       4 	.byte 3   	
      00A9BF 52 45 4D                 5 	.ascii "REM"
      00A9BF F6 88                    6 	.word REM_IDX 
      0030B7                       4489 	_dict_entry,6,REBOOT,RBT_IDX;cold_start
      00A9C1 CD 98                    1 	.word LINK 
                           0030B9     2 	LINK=.
      0030B9                          3 REBOOT:
      00A9C3 63                       4 	.byte 6   	
      00A9C4 84 20 03 4F 4F 54        5 	.ascii "REBOOT"
      00A9C7 00 82                    6 	.word RBT_IDX 
      0030C2                       4490 	_dict_entry,4+F_IFUNC,READ,READ_IDX;read  
      00A9C7 CD 98                    1 	.word LINK 
                           0030C4     2 	LINK=.
      0030C4                          3 READ:
      00A9C9 8C                       4 	.byte 4+F_IFUNC   	
      00A9CA 5F 02 72 A2              5 	.ascii "READ"
      00A9CE 00 03                    6 	.word READ_IDX 
      0030CB                       4491 	_dict_entry,4+F_IFUNC,QKEY,QKEY_IDX;qkey  
      00A9D0 90 F7                    1 	.word LINK 
                           0030CD     2 	LINK=.
      0030CD                          3 QKEY:
      00A9D2 90                       4 	.byte 4+F_IFUNC   	
      00A9D3 EF 01 A6 07              5 	.ascii "QKEY"
      00A9D7 CD 99                    6 	.word QKEY_IDX 
      0030D4                       4492 	_dict_entry,5+F_IFUNC,PORTI,PRTI_IDX;const_porti 
      00A9D9 E9 CD                    1 	.word LINK 
                           0030D6     2 	LINK=.
      00A9DA                          3 PORTI:
      00A9DA 90                       4 	.byte 5+F_IFUNC   	
      00A9DB F6 93 EE 01 72           5 	.ascii "PORTI"
      00A9E0 A9 00                    6 	.word PRTI_IDX 
      0030DE                       4493 	_dict_entry,5+F_IFUNC,PORTH,PRTH_IDX;const_porth 
      00A9E2 03 81                    1 	.word LINK 
                           0030E0     2 	LINK=.
      00A9E4                          3 PORTH:
      00A9E4 CD                       4 	.byte 5+F_IFUNC   	
      00A9E5 89 D4 81 54 48           5 	.ascii "PORTH"
      00A9E8 00 7A                    6 	.word PRTH_IDX 
      0030E8                       4494 	_dict_entry,5+F_IFUNC,PORTG,PRTG_IDX;const_portg 
      00A9E8 5F C6                    1 	.word LINK 
                           0030EA     2 	LINK=.
      0030EA                          3 PORTG:
      00A9EA 00                       4 	.byte 5+F_IFUNC   	
      00A9EB 2F C0 00 30 27           5 	.ascii "PORTG"
      00A9F0 03 53                    6 	.word PRTG_IDX 
      0030F2                       4495 	_dict_entry,5+F_IFUNC,PORTF,PRTF_IDX;const_portf
      00A9F2 A6 FF                    1 	.word LINK 
                           0030F4     2 	LINK=.
      00A9F4                          3 PORTF:
      00A9F4 81                       4 	.byte 5+F_IFUNC   	
      00A9F5 50 4F 52 54 46           5 	.ascii "PORTF"
      00A9F5 CD 99                    6 	.word PRTF_IDX 
      0030FC                       4496 	_dict_entry,5+F_IFUNC,PORTE,PRTE_IDX;const_porte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 218.
Hexadecimal [24-Bits]



      00A9F7 F6 A1                    1 	.word LINK 
                           0030FE     2 	LINK=.
      0030FE                          3 PORTE:
      00A9F9 02                       4 	.byte 5+F_IFUNC   	
      00A9FA 27 03 CC 97 3C           5 	.ascii "PORTE"
      00A9FF 90 E6                    6 	.word PRTE_IDX 
      003106                       4497 	_dict_entry,5+F_IFUNC,PORTD,PRTD_IDX;const_portd
      00AA01 03 93                    1 	.word LINK 
                           003108     2 	LINK=.
      003108                          3 PORTD:
      00AA03 EE                       4 	.byte 5+F_IFUNC   	
      00AA04 04 A3 50 00 2B           5 	.ascii "PORTD"
      00AA09 16 A3                    6 	.word PRTD_IDX 
      003110                       4498 	_dict_entry,5+F_IFUNC,PORTC,PRTC_IDX;const_portc
      00AA0B 50 29                    1 	.word LINK 
                           003112     2 	LINK=.
      003112                          3 PORTC:
      00AA0D 2A                       4 	.byte 5+F_IFUNC   	
      00AA0E 11 89 90 F6 93           5 	.ascii "PORTC"
      00AA13 EE 01                    6 	.word PRTC_IDX 
      00311A                       4499 	_dict_entry,5+F_IFUNC,PORTB,PRTB_IDX;const_portb
      00AA15 72 A9                    1 	.word LINK 
                           00311C     2 	LINK=.
      00311C                          3 PORTB:
      00AA17 00                       4 	.byte 5+F_IFUNC   	
      00AA18 03 72 FB 01 5B           5 	.ascii "PORTB"
      00AA1D 02 4F                    6 	.word PRTB_IDX 
      003124                       4500 	_dict_entry,5+F_IFUNC,PORTA,PRTA_IDX;const_porta 
      00AA1F 81 1C                    1 	.word LINK 
                           003126     2 	LINK=.
      00AA20                          3 PORTA:
      00AA20 A6                       4 	.byte 5+F_IFUNC   	
      00AA21 0A CC 97 3E 41           5 	.ascii "PORTA"
      00AA25 00 6C                    6 	.word PRTA_IDX 
      00312E                       4501 	_dict_entry 5,PRINT,PRT_IDX;print 
      00AA25 CE B6                    1 	.word LINK 
                           003130     2 	LINK=.
      003130                          3 PRINT:
      00AA27 80                       4 	.byte 5   	
      00AA28 A3 10 93 27 08           5 	.ascii "PRINT"
      00AA2D CE B6                    6 	.word PRT_IDX 
      003138                       4502 	_dict_entry,4+F_IFUNC,POUT,POUT_IDX;const_output
      00AA2F 82 1C                    1 	.word LINK 
                           00313A     2 	LINK=.
      00313A                          3 POUT:
      00AA31 B6                       4 	.byte 4+F_IFUNC   	
      00AA32 84 20 03 AE              5 	.ascii "POUT"
      00AA36 B6 80                    6 	.word POUT_IDX 
      003141                       4503 	_dict_entry,4,POKE,POKE_IDX;poke 
      00AA38 4F 81                    1 	.word LINK 
                           003143     2 	LINK=.
      00AA3A                          3 POKE:
      00AA3A 89                       4 	.byte 4   	
      00AA3B 90 89 CD 99              5 	.ascii "POKE"
      00AA3F F6 A1                    6 	.word POKE_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 219.
Hexadecimal [24-Bits]



      00314A                       4504 	_dict_entry,5,PMODE,PMODE_IDX;pin_mode 
      00AA41 01 27                    1 	.word LINK 
                           00314C     2 	LINK=.
      00314C                          3 PMODE:
      00AA43 07                       4 	.byte 5   	
      00AA44 A1 02 27 03 CC           5 	.ascii "PMODE"
      00AA49 97 3C                    6 	.word PMODE_IDX 
      003154                       4505 	_dict_entry,4+F_IFUNC,PINP,PINP_IDX;const_input
      00AA4B 88 90                    1 	.word LINK 
                           003156     2 	LINK=.
      003156                          3 PINP:
      00AA4D F6                       4 	.byte 4+F_IFUNC   	
      00AA4E 93 EE 01 72              5 	.ascii "PINP"
      00AA52 A9 00                    6 	.word PINP_IDX 
      00315D                       4506 	_dict_entry,4+F_IFUNC,PEEK,PEEK_IDX;peek 
      00AA54 03 90                    1 	.word LINK 
                           00315F     2 	LINK=.
      00315F                          3 PEEK:
      00AA56 93                       4 	.byte 4+F_IFUNC   	
      00AA57 84 A1 01 27              5 	.ascii "PEEK"
      00AA5B 0A 90                    6 	.word PEEK_IDX 
      003166                       4507 	_dict_entry,5,PAUSE,PAUSE_IDX;pause 
      00AA5D F6 93                    1 	.word LINK 
                           003168     2 	LINK=.
      003168                          3 PAUSE:
      00AA5F EE                       4 	.byte 5   	
      00AA60 01 72 A9 00 03           5 	.ascii "PAUSE"
      00AA65 51 90                    6 	.word PAUSE_IDX 
      003170                       4508 	_dict_entry,3+F_IFUNC,PAD,PAD_IDX;pad_ref 
      00AA67 FD 88                    1 	.word LINK 
                           003172     2 	LINK=.
      003172                          3 PAD:
      00AA69 90                       4 	.byte 3+F_IFUNC   	
      00AA6A 9F 72 A2                 5 	.ascii "PAD"
      00AA6D 00 03                    6 	.word PAD_IDX 
      003178                       4509 	_dict_entry,2+F_OR,OR,OR_IDX; OR operator 
      00AA6F 90 F7                    1 	.word LINK 
                           00317A     2 	LINK=.
      00317A                          3 OR:
      00AA71 90                       4 	.byte 2+F_OR   	
      00AA72 EF 01                    5 	.ascii "OR"
      00AA74 84 90                    6 	.word OR_IDX 
      00317F                       4510 	_dict_entry,2,ON,ON_IDX; cmd_on 
      00AA76 85 85                    1 	.word LINK 
                           003181     2 	LINK=.
      003181                          3 ON:
      00AA78 81                       4 	.byte 2   	
      00AA79 4F 4E                    5 	.ascii "ON"
      00AA79 72 0D                    6 	.word ON_IDX 
      003186                       4511 	_dict_entry,3+F_IFUNC,ODR,ODR_IDX;const_odr 
      00AA7B 52 30                    1 	.word LINK 
                           003188     2 	LINK=.
      003188                          3 ODR:
      00AA7D FB                       4 	.byte 3+F_IFUNC   	
      00AA7E 8E CC 81                 5 	.ascii "ODR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 220.
Hexadecimal [24-Bits]



      00AA81 43 5A                    6 	.word ODR_IDX 
      00AA82                       4512 	_dict_entry,3+F_IFUNC,NOT,NOT_IDX;func_not 
      00AA82 72 0D                    1 	.word LINK 
                           003190     2 	LINK=.
      003190                          3 NOT:
      00AA84 52                       4 	.byte 3+F_IFUNC   	
      00AA85 30 FB 72                 5 	.ascii "NOT"
      00AA88 16 00                    6 	.word NOT_IDX 
      003196                       4513 	_dict_entry,4,NEXT,NEXT_IDX;next 
      00AA8A 23 8E                    1 	.word LINK 
                           003198     2 	LINK=.
      003198                          3 NEXT:
      00AA8C 81                       4 	.byte 4   	
      00AA8D 4E 45 58 54              5 	.ascii "NEXT"
      00AA8D CD 9B                    6 	.word NEXT_IDX 
      00319F                       4514 	_dict_entry,3,NEW,NEW_IDX;new
      00AA8F 26 A1                    1 	.word LINK 
                           0031A1     2 	LINK=.
      0031A1                          3 NEW:
      00AA91 84                       4 	.byte 3   	
      00AA92 27 03 CC                 5 	.ascii "NEW"
      00AA95 97 3C                    6 	.word NEW_IDX 
      0031A7                       4515 	_dict_entry,6+F_IFUNC,LSHIFT,LSHIFT_IDX;lshift
      00AA97 90 F6                    1 	.word LINK 
                           0031A9     2 	LINK=.
      0031A9                          3 LSHIFT:
      00AA99 93                       4 	.byte 6+F_IFUNC   	
      00AA9A EE 01 72 A9 00 03        5 	.ascii "LSHIFT"
      00AAA0 00 52                    6 	.word LSHIFT_IDX 
      0031B2                       4516 	_dict_entry,3+F_IFUNC,LOG,LOG_IDX;log2 
      00AAA0 CF 00                    1 	.word LINK 
                           0031B4     2 	LINK=.
      0031B4                          3 LOG:
      00AAA2 13                       4 	.byte 3+F_IFUNC   	
      00AAA3 CE 00 13                 5 	.ascii "LOG"
      00AAA6 5D 27                    6 	.word LOG_IDX 
      0031BA                       4517 	_dict_entry 4,LIST,LIST_IDX;list
      00AAA8 03 8F                    1 	.word LINK 
                           0031BC     2 	LINK=.
      0031BC                          3 LIST:
      00AAAA 26                       4 	.byte 4   	
      00AAAB F7 4F 81 54              5 	.ascii "LIST"
      00AAAE 00 4E                    6 	.word LIST_IDX 
      0031C3                       4518 	_dict_entry 3,LET,LET_IDX;let 
      00AAAE CD 9B                    1 	.word LINK 
                           0031C5     2 	LINK=.
      0031C5                          3 LET:
      00AAB0 26                       4 	.byte 3   	
      00AAB1 A1 84 27                 5 	.ascii "LET"
      00AAB4 03 CC                    6 	.word LET_IDX 
      0031CB                       4519 	_dict_entry,3+F_CFUNC,KEY,KEY_IDX;key 
      00AAB6 97 3C                    1 	.word LINK 
                           0031CD     2 	LINK=.
      0031CD                          3 KEY:
      00AAB8 90                       4 	.byte 3+F_CFUNC   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 221.
Hexadecimal [24-Bits]



      00AAB9 F6 93 EE                 5 	.ascii "KEY"
      00AABC 01 72                    6 	.word KEY_IDX 
      0031D3                       4520 	_dict_entry,7,IWDGREF,IWDGREF_IDX;refresh_iwdg
      00AABE A9 00                    1 	.word LINK 
                           0031D5     2 	LINK=.
      0031D5                          3 IWDGREF:
      00AAC0 03                       4 	.byte 7   	
      00AAC1 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00AAC1 A3 14                    6 	.word IWDGREF_IDX 
      0031DF                       4521 	_dict_entry,6,IWDGEN,IWDGEN_IDX;enable_iwdg
      00AAC3 00 2B                    1 	.word LINK 
                           0031E1     2 	LINK=.
      0031E1                          3 IWDGEN:
      00AAC5 0C                       4 	.byte 6   	
      00AAC6 35 0F 50 F2 A6 1E        5 	.ascii "IWDGEN"
      00AACC 62 A6                    6 	.word IWDGEN_IDX 
      0031EA                       4522 	_dict_entry,6+F_IFUNC,INVERT,INVERT_IDX;invert 
      00AACE 10 62                    1 	.word LINK 
                           0031EC     2 	LINK=.
      0031EC                          3 INVERT:
      00AAD0 20                       4 	.byte 6+F_IFUNC   	
      00AAD1 1E 4E 56 45 52 54        5 	.ascii "INVERT"
      00AAD2 00 44                    6 	.word INVERT_IDX 
      0031F5                       4523 	_dict_entry,5,INPUT,INPUT_IDX;input_var  
      00AAD2 A3 08                    1 	.word LINK 
                           0031F7     2 	LINK=.
      0031F7                          3 INPUT:
      00AAD4 00                       4 	.byte 5   	
      00AAD5 2B 09 35 0E 50           5 	.ascii "INPUT"
      00AADA F2 A6                    6 	.word INPUT_IDX 
      0031FF                       4524 	_dict_entry,2,IF,IF_IDX;if 
      00AADC 50 62                    1 	.word LINK 
                           003201     2 	LINK=.
      003201                          3 IF:
      00AADE 20                       4 	.byte 2   	
      00AADF 10 46                    5 	.ascii "IF"
      00AAE0 00 40                    6 	.word IF_IDX 
      003206                       4525 	_dict_entry,3+F_IFUNC,IDR,IDR_IDX;const_idr 
      00AAE0 35 07                    1 	.word LINK 
                           003208     2 	LINK=.
      003208                          3 IDR:
      00AAE2 50                       4 	.byte 3+F_IFUNC   	
      00AAE3 F2 44 52                 5 	.ascii "IDR"
      00AAE4 00 3E                    6 	.word IDR_IDX 
      00320E                       4526 	_dict_entry,3,HEX,HEX_IDX;hex_base
      00AAE4 A3 00                    1 	.word LINK 
                           003210     2 	LINK=.
      003210                          3 HEX:
      00AAE6 40                       4 	.byte 3   	
      00AAE7 23 07 72                 5 	.ascii "HEX"
      00AAEA 5C 50                    6 	.word HEX_IDX 
      003216                       4527 	_dict_entry,4+F_IFUNC,GPIO,GPIO_IDX;gpio 
      00AAEC F2 54                    1 	.word LINK 
                           003218     2 	LINK=.
      003218                          3 GPIO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 222.
Hexadecimal [24-Bits]



      00AAEE 20                       4 	.byte 4+F_IFUNC   	
      00AAEF F4 50 49 4F              5 	.ascii "GPIO"
      00AAF0 00 3A                    6 	.word GPIO_IDX 
      00321F                       4528 	_dict_entry,4,GOTO,GOTO_IDX;goto 
      00AAF0 9F 4A                    1 	.word LINK 
                           003221     2 	LINK=.
      003221                          3 GOTO:
      00AAF2 27                       4 	.byte 4   	
      00AAF3 01 4A 54 4F              5 	.ascii "GOTO"
      00AAF5 00 38                    6 	.word GOTO_IDX 
      003228                       4529 	_dict_entry,5,GOSUB,GOSUB_IDX;gosub 
      00AAF5 A4 3E                    1 	.word LINK 
                           00322A     2 	LINK=.
      00322A                          3 GOSUB:
      00AAF7 C7                       4 	.byte 5   	
      00AAF8 50 F1 72 18 50           5 	.ascii "GOSUB"
      00AAFD F0 8E                    6 	.word GOSUB_IDX 
      003232                       4530 	_dict_entry,3,GET,GET_IDX; cmd_get 
      00AAFF 81 2A                    1 	.word LINK 
                           003234     2 	LINK=.
      00AB00                          3 GET:
      00AB00 C6                       4 	.byte 3   	
      00AB01 00 10 CE                 5 	.ascii "GET"
      00AB04 00 11                    6 	.word GET_IDX 
      00323A                       4531 	_dict_entry,4+F_IFUNC,FREE,FREE_IDX;free
      00AB06 81 34                    1 	.word LINK 
                           00323C     2 	LINK=.
      00AB07                          3 FREE:
      00AB07 CD                       4 	.byte 4+F_IFUNC   	
      00AB08 99 F6 A1 01              5 	.ascii "FREE"
      00AB0C 27 03                    6 	.word FREE_IDX 
      003243                       4532 	_dict_entry,3,FOR,FOR_IDX;for 
      00AB0E CC 97                    1 	.word LINK 
                           003245     2 	LINK=.
      003245                          3 FOR:
      00AB10 3C                       4 	.byte 3   	
      00AB11 46 4F 52                 5 	.ascii "FOR"
      00AB11 CD 82                    6 	.word FOR_IDX 
      00324B                       4533 	_dict_entry,4,FCPU,FCPU_IDX;fcpu 
      00AB13 5F 90                    1 	.word LINK 
                           00324D     2 	LINK=.
      00324D                          3 FCPU:
      00AB15 F6                       4 	.byte 4   	
      00AB16 93 EE 01 72              5 	.ascii "FCPU"
      00AB1A A9 00                    6 	.word FCPU_IDX 
      003254                       4534 	_dict_entry,5,ERASE,ERASE_IDX; erase 
      00AB1C 03 81                    1 	.word LINK 
                           003256     2 	LINK=.
      00AB1E                          3 ERASE:
      00AB1E CD                       4 	.byte 5   	
      00AB1F 99 F6 A1 02 27           5 	.ascii "ERASE"
      00AB24 03 CC                    6 	.word ERASE_IDX 
      00325E                       4535 	_dict_entry,3,END,END_IDX;cmd_end  
      00AB26 97 3C                    1 	.word LINK 
                           003260     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 223.
Hexadecimal [24-Bits]



      003260                          3 END:
      00AB28 90                       4 	.byte 3   	
      00AB29 F6 93 EE                 5 	.ascii "END"
      00AB2C 01 72                    6 	.word END_IDX 
      003266                       4536 	_dict_entry,6+F_IFUNC,EEPROM,EEPROM_IDX;const_eeprom_base   
      00AB2E A9 00                    1 	.word LINK 
                           003268     2 	LINK=.
      003268                          3 EEPROM:
      00AB30 03                       4 	.byte 6+F_IFUNC   	
      00AB31 90 93 90 F6 93 EE        5 	.ascii "EEPROM"
      00AB37 01 90                    6 	.word EEPROM_IDX 
      003271                       4537 	_dict_entry,6+F_IFUNC,EEFREE,EEFREE_IDX; func_eefree 
      00AB39 5D 27                    1 	.word LINK 
                           003273     2 	LINK=.
      003273                          3 EEFREE:
      00AB3B 07                       4 	.byte 6+F_IFUNC   	
      00AB3C 98 59 49 90 5A 26        5 	.ascii "EEFREE"
      00AB42 F9 90                    6 	.word EEFREE_IDX 
      00327C                       4538 	_dict_entry,4,EDIT,EDIT_IDX ; edit 
      00AB44 F7 90                    1 	.word LINK 
                           00327E     2 	LINK=.
      00327E                          3 EDIT:
      00AB46 EF                       4 	.byte 4   	
      00AB47 01 A6 84 81              5 	.ascii "EDIT"
      00AB4B 00 28                    6 	.word EDIT_IDX 
      003285                       4539 	_dict_entry,6+F_CMD,DWRITE,DWRITE_IDX;digital_write
      00AB4B CD 99                    1 	.word LINK 
                           003287     2 	LINK=.
      003287                          3 DWRITE:
      00AB4D F6                       4 	.byte 6+F_CMD   	
      00AB4E A1 02 27 03 CC 97        5 	.ascii "DWRITE"
      00AB54 3C 90                    6 	.word DWRITE_IDX 
      003290                       4540 	_dict_entry,5+F_IFUNC,DREAD,DREAD_IDX;digital_read
      00AB56 F6 93                    1 	.word LINK 
                           003292     2 	LINK=.
      003292                          3 DREAD:
      00AB58 EE                       4 	.byte 5+F_IFUNC   	
      00AB59 01 72 A9 00 03           5 	.ascii "DREAD"
      00AB5E 90 93                    6 	.word DREAD_IDX 
      00329A                       4541 	_dict_entry,2,DO,DO_IDX;do_loop
      00AB60 90 F6                    1 	.word LINK 
                           00329C     2 	LINK=.
      00329C                          3 DO:
      00AB62 93                       4 	.byte 2   	
      00AB63 EE 01                    5 	.ascii "DO"
      00AB65 90 5D                    6 	.word DO_IDX 
      0032A1                       4542 	_dict_entry,3,DEC,DEC_IDX;dec_base
      00AB67 27 07                    1 	.word LINK 
                           0032A3     2 	LINK=.
      0032A3                          3 DEC:
      00AB69 98                       4 	.byte 3   	
      00AB6A 56 46 90                 5 	.ascii "DEC"
      00AB6D 5A 26                    6 	.word DEC_IDX 
      0032A9                       4543 	_dict_entry,3+F_IFUNC,DDR,DDR_IDX;const_ddr 
      00AB6F F9 90                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 224.
Hexadecimal [24-Bits]



                           0032AB     2 	LINK=.
      0032AB                          3 DDR:
      00AB71 F7                       4 	.byte 3+F_IFUNC   	
      00AB72 90 EF 01                 5 	.ascii "DDR"
      00AB75 A6 84                    6 	.word DDR_IDX 
      0032B1                       4544 	_dict_entry,4,DATA,DATA_IDX;data  
      00AB77 81 AB                    1 	.word LINK 
                           0032B3     2 	LINK=.
      00AB78                          3 DATA:
      00AB78 A6                       4 	.byte 4   	
      00AB79 84 CD 99 E9              5 	.ascii "DATA"
      00AB7D CD 98                    6 	.word DATA_IDX 
      0032BA                       4545 	_dict_entry,3+F_IFUNC,CRL,CRL_IDX;const_cr1 
      00AB7F 7C 9F                    1 	.word LINK 
                           0032BC     2 	LINK=.
      0032BC                          3 CRL:
      00AB81 A4                       4 	.byte 3+F_IFUNC   	
      00AB82 07 C7 50                 5 	.ascii "CRL"
      00AB85 C6 81                    6 	.word CRL_IDX 
      00AB87                       4546 	_dict_entry,3+F_IFUNC,CRH,CRH_IDX;const_cr2 
      00AB87 52 01                    1 	.word LINK 
                           0032C4     2 	LINK=.
      0032C4                          3 CRH:
      00AB89 CD                       4 	.byte 3+F_IFUNC   	
      00AB8A 99 FB A1                 5 	.ascii "CRH"
      00AB8D 02 27                    6 	.word CRH_IDX 
      0032CA                       4547 	_dict_entry,5,CONST,CONST_IDX; cmd_const 
      00AB8F 03 CC                    1 	.word LINK 
                           0032CC     2 	LINK=.
      0032CC                          3 CONST:
      00AB91 97                       4 	.byte 5   	
      00AB92 3C 90 F6 93 EE           5 	.ascii "CONST"
      00AB97 01 72                    6 	.word CONST_IDX 
      0032D4                       4548 	_dict_entry,4+F_CFUNC,CHAR,CHAR_IDX;char
      00AB99 A9 00                    1 	.word LINK 
                           0032D6     2 	LINK=.
      0032D6                          3 CHAR:
      00AB9B 03                       4 	.byte 4+F_CFUNC   	
      00AB9C 90 93 90 F6              5 	.ascii "CHAR"
      00ABA0 93 EE                    6 	.word CHAR_IDX 
      0032DD                       4549 	_dict_entry,3,BYE,BYE_IDX;bye 
      00ABA2 01 72                    1 	.word LINK 
                           0032DF     2 	LINK=.
      0032DF                          3 BYE:
      00ABA4 A9                       4 	.byte 3   	
      00ABA5 00 03 CD                 5 	.ascii "BYE"
      00ABA8 AB E4                    6 	.word BYE_IDX 
      0032E5                       4550 	_dict_entry,5,BTOGL,BTOGL_IDX;bit_toggle
      00ABAA 6B 01                    1 	.word LINK 
                           0032E7     2 	LINK=.
      0032E7                          3 BTOGL:
      00ABAC A6                       4 	.byte 5   	
      00ABAD 01 0D 01 27 0D           5 	.ascii "BTOGL"
      00ABB2 48 0A                    6 	.word BTOGL_IDX 
      0032EF                       4551 	_dict_entry,5+F_IFUNC,BTEST,BTEST_IDX;bit_test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 225.
Hexadecimal [24-Bits]



      00ABB4 01 26                    1 	.word LINK 
                           0032F1     2 	LINK=.
      0032F1                          3 BTEST:
      00ABB6 FB                       4 	.byte 5+F_IFUNC   	
      00ABB7 6B 01 7B 01 EA           5 	.ascii "BTEST"
      00ABBC 03 E7                    6 	.word BTEST_IDX 
      0032F9                       4552 	_dict_entry,4,BSET,BSET_IDX;bit_set 
      00ABBE 03 90                    1 	.word LINK 
                           0032FB     2 	LINK=.
      0032FB                          3 BSET:
      00ABC0 A3                       4 	.byte 4   	
      00ABC1 00 01 27 10              5 	.ascii "BSET"
      00ABC5 7B 01                    6 	.word BSET_IDX 
      003302                       4553 	_dict_entry,4,BRES,BRES_IDX;bit_reset
      00ABC7 43 E4                    1 	.word LINK 
                           003304     2 	LINK=.
      003304                          3 BRES:
      00ABC9 04                       4 	.byte 4   	
      00ABCA E7 04 7B 01              5 	.ascii "BRES"
      00ABCE 43 E4                    6 	.word BRES_IDX 
      00330B                       4554 	_dict_entry,3+F_IFUNC,BIT,BIT_IDX;bitmask
      00ABD0 02 E7                    1 	.word LINK 
                           00330D     2 	LINK=.
      00330D                          3 BIT:
      00ABD2 02                       4 	.byte 3+F_IFUNC   	
      00ABD3 20 0C 54                 5 	.ascii "BIT"
      00ABD5 00 0A                    6 	.word BIT_IDX 
      003313                       4555 	_dict_entry,3,AWU,AWU_IDX;awu 
      00ABD5 7B 01                    1 	.word LINK 
                           003315     2 	LINK=.
      003315                          3 AWU:
      00ABD7 EA                       4 	.byte 3   	
      00ABD8 02 E7 02                 5 	.ascii "AWU"
      00ABDB 7B 01                    6 	.word AWU_IDX 
      00331B                       4556 	_dict_entry,3+F_IFUNC,ASC,ASC_IDX;ascii
      00ABDD EA 04                    1 	.word LINK 
                           00331D     2 	LINK=.
      00331D                          3 ASC:
      00ABDF E7                       4 	.byte 3+F_IFUNC   	
      00ABE0 04 53 43                 5 	.ascii "ASC"
      00ABE1 00 06                    6 	.word ASC_IDX 
      003323                       4557 	_dict_entry,3+F_AND,AND,AND_IDX ; AND operator 
      00ABE1 5B 01                    1 	.word LINK 
                           003325     2 	LINK=.
      003325                          3 AND:
      00ABE3 81                       4 	.byte 3+F_AND   	
      00ABE4 41 4E 44                 5 	.ascii "AND"
      00ABE4 58 1C                    6 	.word AND_IDX 
      00332B                       4558 	_dict_entry,7+F_IFUNC,ADCREAD,ADCREAD_IDX;analog_read
      00ABE6 AB F4                    1 	.word LINK 
                           00332D     2 	LINK=.
      00332D                          3 ADCREAD:
      00ABE8 FE                       4 	.byte 7+F_IFUNC   	
      00ABE9 9F 88 5E A6 05 42 1C     5 	.ascii "ADCREAD"
      00ABF0 50 00                    6 	.word ADCREAD_IDX 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 226.
Hexadecimal [24-Bits]



      003337                       4559 	_dict_entry,5,ADCON,ADCON_IDX;power_adc 
      00ABF2 84 81                    1 	.word LINK 
                           003339     2 	LINK=.
      00ABF4                          3 ADCON:
      00ABF4 03                       4 	.byte 5   	
      00ABF5 06 03 05 04 00           5 	.ascii "ADCON"
      00ABFA 02 01                    6 	.word ADCON_IDX 
      003341                       4560 kword_dict::
      003341                       4561 	_dict_entry,3+F_IFUNC,ABS,ABS_IDX ;abs
      00ABFC 06 00                    1 	.word LINK 
                           003343     2 	LINK=.
      003343                          3 ABS:
      00ABFE 02                       4 	.byte 3+F_IFUNC   	
      00ABFF 02 02 03                 5 	.ascii "ABS"
      00AC02 03 01                    6 	.word ABS_IDX 
                                   4562 
                                   4563 ;comands and fonctions address table 	
      003349                       4564 code_addr::
      00AC04 03 03 02 04 04 05 02  4565 	.word abs,power_adc,analog_read,ascii,awu,bitmask ; 0..7
             06 02 07 02 05
      00AC10 04 02 04 01 21 DF 21  4566 	.word bit_reset,bit_set,bit_test,bit_toggle,bye,char,const_cr2  ; 8..15
             BD 29 F9 29 0E 2E 01
      00AC14 2D FC 2E 15 2D F7 1C  4567 	.word const_cr1,data,const_ddr,dec_base,do_loop,digital_read,digital_write ;16..23 
             24 2D 7D 26 68 26 9F
      00AC14 CD 99 F6 A1 01 27 03  4568 	.word edit,const_eeprom_base,cmd_end,erase,fcpu,save_app,for,gosub,goto,gpio ; 24..31 
             CC 97 3C 27 DC 22 72
             24 A8 24 8E 29 75
      00AC1E 1C 1F 2D F2 22 58 20  4569 	.word hex_base,const_idr,if,input_var,invert,enable_iwdg,refresh_iwdg,key ; 32..39 
             98 2D 67 2C D1 2D 0F
             29 64
      00AC1E 90 F6 93 EE 01 72 A9  4570 	.word let,list,log2,lshift,next,new ; 40..47
             00 03 89 88 A6
      00AC2A 80 15 01 27 05 A6 0A  4571 	.word func_not,const_odr,pad_ref,pause,pin_mode,peek,const_input ; 48..55
             CC 97 3E 22 37 2E 0B
      00AC34 22 16 2E 06 1F F5 2D  4572 	.word poke,const_output,print,const_porta,const_portb,const_portc,const_portd,const_porte ; 56..63
             C0 2D C5 2D CA 2D CF
             2D D4
      00AC34 CE 00 15 58 58 58 58  4573 	.word const_portf,const_portg,const_porth,const_porti,qkey,read,cold_start,remark ; 64..71 
             58 9E C8 00 15 C7 00
             0E 9F
      00AC44 C8 00 16 C7 00 0F CE  4574 	.word restore,return, random,rshift,run,free ; 72..79
             00 17 CF 00 15
      00AC50 CE 00 17 54 9E C8 00  4575 	.word sleep,spi_read,spi_enable,spi_select,spi_write,step,stop,get_ticks  ; 80..87
             17 C7 00 17 9F C8 00
             18 C7
      00AC60 00 18 CE 00 0E 54 54  4576 	.word set_timer,timeout,to,tone,ubound,uflash,until,usr ; 88..95
             54 9E C8 00 0E C7 00
             0E 9F
      00AC70 C8 00 0F C7 00 0F C8  4577 	.word wait,words,write,cmd_size,cmd_on,cmd_get,cmd_const ; 96..99
             00 18 97 C6 00 0E C8
      00AC7E 00 17 95 CF           4578 	.word func_eefree,0 
                                   4579 
                                   4580 
                                   4581 
                                   4582 
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
      00340D                         30 test:
      00340D                         31     _vars VSIZE 
      00AC82 00 17            [ 2]    1     sub sp,#VSIZE 
      00AC84 C6 00 16         [ 2]   32     ldw x,#LOOP_CNT
      00AC87 A4 7F            [ 2]   33     ldw (CNTR,sp),x  
      00AC89 72 A2 00         [ 2]   34     ldw x,ticks 
      00AC8C 03 90            [ 2]   35     ldw (T,sp),x
      003419                         36 1$: ; test add24 
      00AC8E F7 90            [ 1]   37     ld a,#(VAL1>>16)&0XFF
      00AC90 EF 01 84         [ 2]   38     ldw x,#VAL1&0XFFFF
      00AC93 85 72 A2         [ 1]   39     ld acc24,a 
      00AC96 00 03 90         [ 2]   40     ldw acc24+1,x  
      00AC99 F7 90            [ 1]   41     ld a,#(VAL4>>16)&0XFF
      00AC9B EF 01 CD         [ 2]   42     ldw x,#(VAL4&0XFFFF)
      00AC9E 84 55 90         [ 4]   43     call add24 
      00ACA1 F6 93            [ 2]   44     ldw x,(CNTR,sp)
      00ACA3 EE 01 72         [ 2]   45     subw x,#1
      00ACA6 A9 00            [ 2]   46     ldw (CNTR,sp),x 
      00ACA8 03 1C            [ 1]   47     jrne 1$
      00ACAA 00 01 A9         [ 4]   48     call prt_acc24
      00ACAD 00 81            [ 1]   49     ld a,#SPACE 
      00ACAF CD 09 44         [ 4]   50     call putc 
      00ACAF 52 03 0F         [ 2]   51     ldw x,ticks 
      00ACB2 02 0F 03         [ 2]   52     subw x,(T,sp)
      00ACB5 90 AE B3         [ 4]   53     call prt_i16  
      00ACB8 C3 93            [ 1]   54     ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 228.
Hexadecimal [24-Bits]



      00ACBA F6 A4 0F         [ 4]   55     call putc
                                     56 
                                     57 ; test mul24     
      00ACBD 6B 01 0C         [ 2]   58     ldw x,LOOP_CNT
      00ACC0 03 5C            [ 2]   59     ldw (CNTR,sp),x 
      00ACC2 F6 CD 89         [ 2]   60     ldw x,ticks 
      00ACC5 C4 0C            [ 2]   61     ldw (T,sp),x 
      003455                         62 2$: 
      00ACC7 02 0A            [ 1]   63     ld a,#(VAL1>>16)&0XFF
      00ACC9 01 26 F5         [ 2]   64     ldw x,#VAL1&0XFFFF
      00ACCC A6 46 11         [ 1]   65     ld acc24,a 
      00ACCF 02 2B 09         [ 2]   66     ldw acc24+1,x  
      00ACD2 A6 20            [ 1]   67     ld a,#(VAL2>>16)&0XFF
      00ACD4 CD 89 C4         [ 2]   68     ldw x,#(VAL2&0XFFFF)
      00ACD7 0C 02 20         [ 4]   69     call mul24 
      00ACDA 07 A6            [ 2]   70     ldw x,(CNTR,sp)
      00ACDC 0D CD 89         [ 2]   71     subw x,#1
      00ACDF C4 0F            [ 2]   72     ldw (CNTR,sp),x 
      00ACE1 02 72            [ 1]   73     jrne 2$ 
      00ACE3 A2 00 02         [ 4]   74    call prt_acc24 
      00ACE6 90 FE            [ 1]   75    ld a,#SPACE 
      00ACE8 26 CF A6         [ 4]   76    call putc 
      00ACEB 0D CD 89         [ 2]   77     ldw x,ticks 
      00ACEE C4 5F 7B         [ 2]   78     subw x,(T,sp)
      00ACF1 03 97 CD         [ 4]   79     call prt_i16 
      00ACF4 98 92            [ 1]   80     ld a,#CR 
      00ACF6 AE AC FF         [ 4]   81     call putc 
                                     82 ; test mul24 with overflow     
      00ACF9 CD 8A 21         [ 2]   83     ldw x,LOOP_CNT
      00ACFC 5B 03            [ 2]   84     ldw (CNTR,sp),x 
      00ACFE 81 20 77         [ 2]   85     ldw x,ticks 
      00AD01 6F 72            [ 2]   86     ldw (T,sp),x 
      003491                         87 3$: 
      00AD03 64 73            [ 1]   88     ld a,#(VAL1>>16)&0XFF
      00AD05 20 69 6E         [ 2]   89     ldw x,#VAL1&0XFFFF
      00AD08 20 64 69         [ 1]   90     ld acc24,a 
      00AD0B 63 74 69         [ 2]   91     ldw acc24+1,x  
      00AD0E 6F 6E            [ 1]   92     ld a,#(VAL4>>16)&0XFF
      00AD10 61 72 79         [ 2]   93     ldw x,#(VAL4&0XFFFF)
      00AD13 0A 00 5D         [ 4]   94     call mul24 
      00AD15 1E 03            [ 2]   95     ldw x,(CNTR,sp)
      00AD15 CD 99 FB         [ 2]   96     subw x,#1
      00AD18 A1 01            [ 2]   97     ldw (CNTR,sp),x 
      00AD1A 27 03            [ 1]   98     jrne 3$ 
      00AD1C CC 97 3C         [ 4]   99     call prt_acc24    
      00AD1F A6 20            [ 1]  100     ld a,#SPACE 
      00AD1F 90 F6 93         [ 4]  101     call putc 
      00AD22 EE 01 72         [ 2]  102     ldw x,ticks 
      00AD25 A9 00 03         [ 2]  103     subw x,(T,sp)
      00AD28 CF 00 13         [ 4]  104     call prt_i16 
      00AD2B 81 0D            [ 1]  105     ld a,#CR 
      00AD2C CD 09 44         [ 4]  106     call putc 
                                    107 ; test mul24  with negative result   
      00AD2C CE 00 13         [ 2]  108     ldw x,LOOP_CNT
      00AD2F 4F 20            [ 2]  109     ldw (CNTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 229.
Hexadecimal [24-Bits]



      00AD31 13 00 0F         [ 2]  110     ldw x,ticks 
      00AD32 1F 01            [ 2]  111     ldw (T,sp),x 
      0034CD                        112 4$:
      00AD32 CD 99            [ 1]  113     ld a,#(VAL1>>16)&0XFF
      00AD34 F6 A1 01         [ 2]  114     ldw x,#VAL1&0XFFFF
      00AD37 27 03 CC         [ 1]  115     ld acc24,a 
      00AD3A 97 3C 90         [ 2]  116     ldw acc24+1,x  
      00AD3D F6 93            [ 1]  117     ld a,#(VAL5>>16)&0XFF
      00AD3F EE 01 72         [ 2]  118     ldw x,#(VAL5&0XFFFF)
      00AD42 A9 00 03         [ 4]  119     call mul24 
      00AD45 1E 03            [ 2]  120     ldw x,(CNTR,sp)
      00AD45 4D 26 06         [ 2]  121     subw x,#1
      00AD48 5D 26            [ 2]  122     ldw (CNTR,sp),x 
      00AD4A 03 43            [ 1]  123     jrne 4$ 
      00AD4C 53 81 4F         [ 4]  124     call prt_acc24 
      00AD4F 5F 81            [ 1]  125     ld a,#SPACE 
      00AD51 CD 09 44         [ 4]  126     call putc 
      00AD51 CD 99 FB         [ 2]  127     ldw x,ticks 
      00AD54 A1 01 27         [ 2]  128     subw x,(T,sp)
      00AD57 03 CC 97         [ 4]  129     call prt_i16 
      00AD5A 3C 90            [ 1]  130     ld a,#CR 
      00AD5C F6 93 EE         [ 4]  131     call putc 
                                    132 ; test abs24 
      00AD5F 01 72 A9         [ 2]  133     ldw x,LOOP_CNT
      00AD62 00 03            [ 2]  134     ldw (CNTR,sp),x 
      00AD64 4B 00 35         [ 2]  135     ldw x,ticks 
      00AD67 CC 50            [ 2]  136     ldw (T,sp),x 
      003509                        137 5$: 
      00AD69 E0 9E            [ 1]  138     ld a,#0xff
      00AD6B A4 3F 95         [ 2]  139     ldw x,#0xffff
      00AD6E A3 00 FF         [ 4]  140     call abs24 
      00AD71 23 06 0C         [ 1]  141     ld acc24,a 
      00AD74 01 98 56         [ 2]  142     ldw acc24+1,x
      00AD77 20 F5            [ 2]  143     ldw x,(CNTR,sp)
      00AD79 35 55 50         [ 2]  144     subw x,#1
      00AD7C E0 84            [ 2]  145     ldw (CNTR,sp),x 
      00AD7E C7 50            [ 1]  146     jrne 5$ 
      00AD80 E1 9F 4A         [ 4]  147     call prt_acc24 
      00AD83 35 55            [ 1]  148     ld a,#SPACE 
      00AD85 50 E0 C7         [ 4]  149     call putc 
      00AD88 50 E2 35         [ 2]  150     ldw x,ticks 
      00AD8B AA 50 E0         [ 2]  151     subw x,(T,sp)
      00AD8E 81 18 12         [ 4]  152     call prt_i16 
      00AD8F                        153 6$:
      00AD8F 35 AA            [ 1]  154     ld a,#CR 
      00AD91 50 E0 81         [ 4]  155     call putc 
      00AD94 CD 35 7C         [ 4]  156     call read_integer 
      00AD94 CD 99 F6 A1 01   [ 1]  157     mov farptr,acc24 
      00AD99 27 03 CC 97 3C   [ 1]  158     mov farptr+1,acc16 
      00AD9E 55 00 0E 00 1A   [ 1]  159     mov farptr+2,acc8 
      00AD9E 90 F6 93         [ 4]  160     call read_integer 
      00ADA1 EE 01 72         [ 1]  161     ld a,acc24 
      00ADA4 A9 00 03         [ 2]  162     ldw x,acc16 
      00ADA7 4D 26 08 5D 26   [ 1]  163     mov acc24,farptr 
      00ADAC 05 A6 0A CC 97   [ 1]  164     mov acc16,farptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 230.
Hexadecimal [24-Bits]



      00ADB1 3E 4B 18 59 49   [ 1]  165     mov acc8,farptr+2 
      00ADB6 25 04 0A         [ 4]  166     call div24 
      00ADB9 01               [ 1]  167     push a 
      00ADBA 26               [ 2]  168     pushw x 
      00ADBB F8 5F 84         [ 4]  169     call prt_acc24 
      00ADBE 4A 02            [ 1]  170     ld a,#SPACE 
      00ADC0 CD 09 44         [ 4]  171     call putc 
      00ADC0 81               [ 2]  172     popw x
      00ADC1 CF 00 0D         [ 2]  173     ldw acc16,x  
      00ADC1 CD 99 F6         [ 1]  174     pop acc24 
      00ADC4 A1 01 27         [ 4]  175     call prt_acc24
      00ADC7 03 CC            [ 2]  176     jra 6$
      003579                        177     _drop VSIZE 
      00ADC9 97 3C            [ 2]    1     addw sp,#VSIZE 
      00ADCB 90               [ 4]  178     ret 
                                    179 
                                    180 
      00357C                        181 read_integer:
      00ADCC F6 93            [ 1]  182     ld a,#'? 
      00ADCE EE 01 72         [ 4]  183     call putc  
      00ADD1 A9 00 03 9F      [ 1]  184 	clr count  
      00ADD5 AE 00 01         [ 4]  185 	call readln 
      00ADD8 A4 17 27         [ 2]  186 	ldw x,#tib 
      00ADDB 0A 88 4F         [ 1]  187 	push count
      00ADDE 4B 00            [ 1]  188 	push #0 
      00ADDE 58 49 0A         [ 2]  189 	addw x,(1,sp)
      00ADE1 01               [ 1]  190 	incw x 
      003594                        191 	_drop 2 
      00ADE2 26 FA            [ 2]    1     addw sp,#2 
      00ADE4 72 5F 00 01      [ 1]  192 	clr in 
      00ADE4 5B 01 81         [ 4]  193 	call get_token
      00ADE7 A1 84            [ 1]  194 	cp a,#TK_INTGR
      00ADE7 CD 99            [ 1]  195 	jreq 3$ 
      00ADE9 F6 A1            [ 1]  196 	cp a,#TK_MINUS
      00ADEB 01 27 03         [ 4]  197 	call get_token 
      00ADEE CC 97            [ 1]  198 	cp a,#TK_INTGR 
      00ADF0 3C 90            [ 1]  199 	jreq 2$
      00ADF2 F6 93 EE         [ 2]  200 	jp syntax_error
      0035AD                        201 2$:
      00ADF5 01 72 A9         [ 4]  202 	call neg_acc24  	
      0035B0                        203 3$: 
      00ADF8 00               [ 4]  204     ret 
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
      00ADF9 03 43                   31 app_sign:  .word 0 ; .ascii "BC"  ; signature 
      00ADFB 53 81                   32 app_size: .word 0 
      00ADFD                         33 app: 
                                     34 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 232.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |     A32     =  000005     |   4 ABS        003343 R
    ABS_IDX =  000000     |     ACK     =  000006     |   4 ADCON      003339 R
    ADCON_ID=  000002     |   4 ADCREAD    00332D R   |     ADCREAD_=  000004 
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
  4 AND        003325 R   |     AND_IDX =  0000FA     |     ARG_OFS =  000002 
    ARROW_LE=  000080     |     ARROW_RI=  000081     |   4 ASC        00331D R
    ASC_IDX =  000006     |     ATMP    =  000001     |     ATTRIB  =  000002 
  4 AUTO_RUN   000157 R   |   4 AWU        003315 R   |   4 AWUHandl   000004 R
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
    BELL    =  000007     |     BINARY  =  000001     |   4 BIT        00330D R
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BIT_IDX =  00000A 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  00000D     |   4 BRES       003304 R   |     BRES_IDX=  00000C 
    BS      =  000008     |   4 BSET       0032FB R   |     BSET_IDX=  00000E 
    BSIZE   =  000006     |   4 BTEST      0032F1 R   |     BTEST_ID=  000010 
  4 BTOGL      0032E7 R   |     BTOGL_ID=  000012     |     BTW     =  000001 
    BUFPTR  =  000003     |   4 BYE        0032DF R   |     BYE_IDX =  000014 
    C       =  000001     |     CAN     =  000018     |   4 CANT_DO    002873 R
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
  4 CHAR       0032D6 R   |     CHAR_IDX=  000016     |     CLKOPT  =  004807 
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
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMDX    =  000001 
    CMD_END =  000002     |     CNAME   =  000001     |     CNT     =  000006 
    CNTR    =  000003     |     CNT_LO  =  000004     |     COMMA   =  00002C 
  4 CONST      0032CC R   |   4 CONST_CO   001D25 R   |     CONST_ID=  0000BE 
    CONST_RE=  000005     |     COUNT   =  000003     |     CPOS    =  000003 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  4 CRH        0032C4 R   |     CRH_IDX =  000018     |   4 CRL        0032BC R
    CRL_IDX =  00001A     |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
  4 DATA       0032B3 R   |     DATA_IDX=  00001C     |     DBG_A   =  000008 
    DBG_CC  =  000009     |     DBG_X   =  000006     |     DBG_Y   =  000004 
    DC1     =  000011     |     DC2     =  000012     |     DC3     =  000013 
    DC4     =  000014     |   4 DDR        0032AB R   |     DDR_IDX =  00001E 
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  4 DEC        0032A3 R   |     DEC_IDX =  000020     |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |     DIVISOR =  000001 
    DIVSOR  =  000001     |     DLE     =  000010     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |   4 DO         00329C R   |     DOLP_ADR=  000003 
    DOLP_INW=  000005     |     DO_IDX  =  000022     |   4 DREAD      003292 R
    DREAD_ID=  000024     |   4 DWRITE     003287 R   |     DWRITE_I=  000026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 234.
Hexadecimal [24-Bits]

Symbol Table

  4 EDIT       00327E R   |     EDIT_IDX=  000028     |   4 EEFREE     003273 R
    EEFREE_I=  0000C0     |   4 EEPROM     003268 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_I=  00002A     |     EEPROM_S=  000800 
    EEPTR   =  000003     |     EM      =  000019     |   4 END        003260 R
    END_IDX =  00002C     |     ENQ     =  000005     |     EOF     =  0000FF 
    EOT     =  000004     |   4 ERASE      003256 R   |     ERASE_ID=  00002E 
    ERR_BAD_=  00000A     |     ERR_BUF_=  00000F     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_D=  00000C     |     ERR_NO_F=  00000E 
    ERR_NO_L=  000005     |     ERR_NO_P=  00000D     |     ERR_OVER=  000010 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    ETB     =  000017     |     ETX     =  000003     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  4 FCPU       00324D R   |     FCPU_IDX=  000030     |     FF      =  00000C 
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
  4 FLASH_ME   001EC8 R   |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLOOP   =  000002 
    FLSI    =  01F400     |   4 FOR        003245 R   |     FOR_IDX =  000034 
  4 FREE       00323C R   |     FREE_IDX=  000090     |     FRUN    =  000000 
    FS      =  00001C     |     FSLEEP  =  000003     |     FSTEP   =  000003 
    FTRAP   =  000001     |     F_AND   =  000070     |     F_CFUNC =  000020 
    F_CMD   =  000000     |     F_CONST =  000030     |     F_IFUNC =  000010 
    F_OR    =  000080     |     F_XOR   =  000090     |   4 GET        003234 R
    GET_IDX =  0000BC     |   4 GOSUB      00322A R   |     GOSUB_ID=  000036 
  4 GOTO       003221 R   |     GOTO_IDX=  000038     |   4 GPIO       003218 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_IDX=  00003A 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |     GS      =  00001D 
  4 HEX        003210 R   |     HEX_IDX =  00003C     |     HOME    =  000082 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 235.
Hexadecimal [24-Bits]

Symbol Table

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
    I2C_WRIT=  000000     |   4 IDR        003208 R   |     IDR_IDX =  00003E 
  4 IF         003201 R   |     IF_IDX  =  000040     |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   4 INPUT      0031F7 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
    INPUT_ID=  000042     |     INPUT_PU=  000001     |     INT24   =  000005 
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
    INT_VECT=  008058     |   4 INVERT     0031EC R   |     INVERT_I=  000044 
    INW     =  00000B     |     IPOS    =  000001     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |   4 IWDGEN     0031E1 R   |     IWDGEN_I=  000046 
  4 IWDGREF    0031D5 R   |     IWDGREF_=  000048     |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |     KCHAR   =  000002 
  4 KEY        0031CD R   |     KEY_END =  000083     |     KEY_IDX =  00004A 
    KW_TYPE_=  0000F0     |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000002     |   4 LET        0031C5 R   |     LET_IDX =  00004C 
    LF      =  00000A     |     LIMIT   =  000001     |     LINENO  =  000005 
  4 LINK    =  003343 R   |   4 LIST       0031BC R   |     LIST_IDX=  00004E 
    LL      =  000001     |     LLEN    =  000002     |     LL_HB   =  000001 
    LN_PTR  =  000005     |   4 LOG        0031B4 R   |     LOG_IDX =  000050 
    LOOP_CNT=  002710     |   4 LSHIFT     0031A9 R   |     LSHIFT_I=  000052 
    MAJOR   =  000002     |     MASK    =  000002     |     MAX_LINE=  007FFF 
    MINOR   =  000000     |     MULOP   =  000001     |     N1      =  000004 
    N2      =  000007     |     NAFR    =  004804     |     NAK     =  000015 
    NAMEPTR =  000001     |     NCLKOPT =  004808     |     NEG     =  000001 
  4 NEW        0031A1 R   |     NEW_IDX =  000056     |   4 NEXT       003198 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 236.
Hexadecimal [24-Bits]

Symbol Table

    NEXT_IDX=  000054     |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NLEN    =  000001     |     NLEN_MAS=  00000F     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   4 NOT        003190 R   |     NOT_IDX =  000058 
  4 NOT_SAVE   001FBA R   |   4 NO_APP     0028B5 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   4 NonHandl   000000 R
  4 ODR        003188 R   |     ODR_IDX =  00005A     |   4 ON         003181 R
    ONOFF   =  000003     |     ON_IDX  =  0000BA     |     OP      =  000002 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   4 OR         00317A R   |     OR_IDX  =  0000FC 
    OUTP    =  000001     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVRWR   =  000004 
    PA      =  000000     |   4 PAD        003172 R   |     PAD_IDX =  00005C 
    PAD_SIZE=  000080     |   4 PAUSE      003168 R   |     PAUSE_ID=  00005E 
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   4 PEEK       00315F R   |     PEEK_IDX=  000062 
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PINNO   =  000001     |   4 PINP       003156 R
    PINP_IDX=  000064     |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   4 PMODE      00314C R
    PMODE_ID=  000060     |   4 POKE       003143 R   |     POKE_IDX=  000066 
  4 PORTA      003126 R   |   4 PORTB      00311C R   |   4 PORTC      003112 R
  4 PORTD      003108 R   |   4 PORTE      0030FE R   |   4 PORTF      0030F4 R
  4 PORTG      0030EA R   |   4 PORTH      0030E0 R   |   4 PORTI      0030D6 R
  4 POUT       00313A R   |     POUT_IDX=  000068     |     PREV    =  000001 
  4 PRINT      003130 R   |     PROD    =  000001     |     PROD_SIG=  00000A 
  4 PROG_ADD   001E9E R   |   4 PROG_SIZ   001EB0 R   |     PRTA_IDX=  00006C 
    PRTB_IDX=  00006E     |     PRTC_IDX=  000070     |     PRTD_IDX=  000072 
    PRTE_IDX=  000074     |     PRTF_IDX=  000076     |     PRTG_IDX=  000078 
    PRTH_IDX=  00007A     |     PRTI_IDX=  00007C     |     PRT_IDX =  00006A 
    PSIZE   =  000001     |     PSTR    =  000003     |   4 QKEY       0030CD R
    QKEY_IDX=  00007E     |     QSIGN   =  000005     |     RAM_BASE=  000000 
    RAM_END =  0017FF     |   4 RAM_MEM    001ED9 R   |     RAM_SIZE=  001800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 237.
Hexadecimal [24-Bits]

Symbol Table

    RBT_IDX =  000082     |   4 READ       0030C4 R   |     READ_IDX=  000080 
  4 REBOOT     0030B9 R   |     RECLEN  =  000005     |   4 REG_A      000562 R
  4 REG_CC     000566 R   |   4 REG_EPC    000555 R   |   4 REG_SP     00056B R
  4 REG_X      00055E R   |   4 REG_Y      00055A R   |     RELOP   =  000001 
  4 REM        0030B1 R   |     REM_IDX =  000084     |   4 RESTORE    0030A5 R
    REST_IDX=  000086     |     RETL1   =  000001     |   4 RETURN     00309A R
    RET_ADDR=  000003     |     RET_BPTR=  000003     |     RET_IDX =  000088 
    RET_INW =  000005     |   4 RND        003092 R   |     RND_IDX =  00008A 
    ROP     =  004800     |     RS      =  00001E     |   4 RSHIFT     003087 R
    RSHIFT_I=  00008C     |     RSIGN   =  000006     |     RST_SR  =  0050B3 
  4 RUN        00307F R   |     RUN_IDX =  00008E     |     RXCHAR  =  000001 
    RX_QUEUE=  000008     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   4 SAVE       003076 R
    SAVE_IDX=  000032     |     SEPARATE=  000000     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |     SI      =  00000F 
    SIGN    =  000001     |   4 SIGNATUR   002871 R   |   4 SIZE       00306D R
    SIZE_IDX=  0000B8     |     SKIP    =  000005     |   4 SLEEP      003063 R
    SLEEP_ID=  000092     |     SO      =  00000E     |     SOH     =  000001 
    SPACE   =  000020     |   4 SPIEN      003059 R   |     SPIEN_ID=  000096 
  4 SPIRD      00304F R   |     SPIRD_ID=  000094     |   4 SPISEL     003044 R
    SPISEL_I=  000098     |   4 SPIWR      00303A R   |     SPIWR_ID=  00009A 
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
  4 STEP       003031 R   |     STEP_IDX=  00009C     |   4 STOP       003028 R
    STOP_IDX=  00009E     |     STR     =  000003     |   4 STR_BYTE   001EC1 R
    STX     =  000002     |     SUB     =  00001A     |     SUP     =  000084 
    SWIM_CSR=  007F80     |     SYN     =  000016     |     T       =  000001 
    TAB     =  000009     |     TABW    =  000004     |     TAB_WIDT=  000004 
    TARGET  =  000001     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   4 TICKS      00301E R
    TICKS_ID=  0000A0     |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 238.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM4_CR1=  000007     |     TIM4_CR1=  000000     |     TIM4_CR1=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 239.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_CR1=  000001     |     TIM4_CR1=  000002     |     TIM4_EGR=  005343 
    TIM4_EGR=  000000     |     TIM4_IER=  005341     |     TIM4_IER=  000000 
    TIM4_PSC=  005345     |     TIM4_PSC=  000000     |     TIM4_PSC=  000007 
    TIM4_PSC=  000004     |     TIM4_PSC=  000001     |     TIM4_PSC=  000005 
    TIM4_PSC=  000002     |     TIM4_PSC=  000006     |     TIM4_PSC=  000003 
    TIM4_PSC=  000000     |     TIM4_PSC=  000001     |     TIM4_PSC=  000002 
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   4 TIMEOUT    003012 R
  4 TIMER      003008 R   |     TIMER_ID=  0000A2     |     TIM_CR1_=  000007 
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
    TK_XOR  =  000089     |     TMROUT_I=  0000A4     |   4 TO         003001 R
  4 TONE       002FF8 R   |     TONE_IDX=  0000A8     |     TOWRITE =  000005 
    TO_IDX  =  0000A6     |   4 Timer4Up   000021 R   |   4 TrapHand   000012 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 240.
Hexadecimal [24-Bits]

Symbol Table

    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   4 UBOUND     002FED R   |     UBOUND_I=  0000AA 
  4 UBTN_Han   000068 R   |   4 UFLASH     002FE2 R   |     UFLASH_I=  0000AC 
  4 UNTIL      002FD8 R   |     UNTIL_ID=  0000AE     |     UPDATE  =  000006 
    US      =  00001F     |   4 USER_ABO   000070 R   |   4 USR        002FD0 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
    USR_IDX =  0000B0     |   4 Uart1RxH   0008D2 R   |   4 UserButt   000044 R
    VAL1    =  02FFFF     |     VAL2    =  00002A     |     VAL3    =  000003 
    VAL4    =  0005FF     |     VAL5    =  FFFFFFFD     |     VSISE   =  000003 
    VSIZE   =  000008     |     VT      =  00000B     |   4 WAIT       002FC7 R
    WAIT_IDX=  0000B2     |     WCNT    =  000003     |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  4 WORDS      002FBD R   |     WORDS_ID=  0000B4     |   4 WRITE      002FB3 R
    WRITE_ID=  0000B6     |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XFIRST  =  000001     |     XMASK   =  000001     |     XOFF    =  000013 
    XON     =  000011     |   4 XOR        002FAB R   |     XOR_IDX =  0000FE 
    XSAVE   =  000002     |     XSTACK_E=  001773     |     XSTACK_S=  00003C 
    XTEMP   =  000001     |     YSAVE   =  000007     |     YTEMP   =  000003 
  4 abs        002A87 R   |   4 abs24      0001DF R   |   5 acc16      00000D GR
  5 acc24      00000C GR  |   5 acc32      00000B GR  |   5 acc8       00000E GR
  4 accept_c   000C0D R   |   4 add24      00016A R   |   4 add_char   0013AC R
  4 add_spac   00117D R   |   4 analog_r   00262C R   |   4 and_cond   001B59 R
  4 and_fact   001B3D R   |   4 app        003604 R   |   4 app_sign   003600 R
  4 app_size   003602 R   |   4 app_spac   003600 GR  |   4 arduino_   002B74 R
  4 arg_list   00197B R   |   5 array_si   000020 R   |   4 ascii      002925 R
  4 at_tst     000FE4 R   |   4 atoi24     0018B4 GR  |   4 atoi_exi   00191A R
  4 awu        002A2E R   |   4 awu02      002A41 R   |   4 bad_port   0029A0 R
  5 base       00000A GR  |   5 basicptr   000004 GR  |   4 beep       0025A5 R
  4 beep_1kh   00257C GR  |   4 bin_exit   000E49 R   |   4 bit_rese   00219A R
  4 bit_set    002178 R   |   4 bit_test   0021DF R   |   4 bit_togg   0021BD R
  4 bitmask    002D41 R   |   4 bkslsh_t   000F91 R   |   4 bksp       0009AB R
  2 block_bu   0016B8 GR  |   4 block_er   0007C0 R   |   4 break_po   002718 R
  4 bye        0029F9 R   |   4 char       00290E R   |   4 clear_ba   001518 R
  4 clear_bl   0027C8 R   |   4 clear_va   001470 R   |   4 clock_in   00008B R
  4 cloop_1    001DCE R   |   4 cmd_cons   001DA8 R   |   4 cmd_end    002548 R
  4 cmd_get    00254F R   |   4 cmd_itf    000570 R   |   4 cmd_line   00174B R
  4 cmd_name   0013CC R   |   4 cmd_on     002402 R   |   4 cmd_size   001C45 R
  4 code_add   003349 GR  |   4 cold_sta   0000C3 R   |   4 colon_ts   000FB8 R
  4 comma_ts   000FC3 R   |   4 comp_msg   00169B R   |   4 compile    0010E9 GR
  4 conditio   001BAB R   |   4 const_cr   002DFC R   |   4 const_cr   002E01 R
  4 const_dd   002DF7 R   |   4 const_ee   002E10 R   |   4 const_id   002DF2 R
  4 const_in   002E0B R   |   4 const_lo   001DC9 R   |   4 const_od   002DED R
  4 const_ou   002E06 R   |   4 const_po   002DC0 R   |   4 const_po   002DC5 R
  4 const_po   002DCA R   |   4 const_po   002DCF R   |   4 const_po   002DD4 R
  4 const_po   002DD9 R   |   4 const_po   002DDE R   |   4 const_po   002DE3 R
  4 const_po   002DE8 R   |   4 convert_   000DB7 R   |   4 convert_   00096F R
  4 copy_com   001019 R   |   5 count      000003 GR  |   4 cp24       0001A4 R
  4 cp24_ax    0001D6 R   |   4 cp_loop    00192C R   |   4 cpl24      0001E6 R
  4 cpy_cmd_   001165 R   |   4 cpy_quot   0011A5 R   |   4 create_g   000CE1 R
  4 cs_high    002F9F R   |   4 dash_tst   000FD9 R   |   4 data       002E15 R
  5 data_len   000009 R   |   4 data_lin   002E24 R   |   5 data_ofs   000008 R
  5 data_ptr   000006 R   |   4 data_sea   002E70 R   |   4 dec_base   001C24 R
  4 decomp_l   00125E R   |   4 decompil   001216 GR  |   4 del_line   000CB4 R
  4 delete_l   000A98 R   |   4 delete_n   0009BB R   |   4 delete_u   000A5D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 241.
Hexadecimal [24-Bits]

Symbol Table

  4 digital_   002668 R   |   4 digital_   00269F R   |   4 div24      000327 R
  4 divu24_8   000309 R   |   4 do_loop    002D7D R   |   4 do_progr   0007B3 R
  4 edit       001F8D R   |   4 enable_i   002CD1 R   |   4 eql_tst    00106E R
  4 equal      0013BF R   |   4 erase      002740 R   |   4 erase_ex   0007E4 R
  4 erase_fl   0007DA R   |   4 err_bad_   0015FC R   |   4 err_buf_   001672 R
  4 err_cmd_   0015C0 R   |   4 err_div0   001585 R   |   4 err_dupl   0015DA R
  4 err_math   00156C R   |   4 err_mem_   001551 R   |   4 err_msg    00152F R
  4 err_no_a   001608 R   |   4 err_no_d   00163B R   |   4 err_no_f   00165F R
  4 err_no_l   001594 R   |   4 err_no_p   00164B R   |   4 err_not_   0015EB R
  4 err_over   00167F R   |   4 err_run_   0015AA R   |   4 err_synt   00155E R
  4 escaped    000DCC GR  |   4 expect     001969 R   |   4 expressi   001AA6 R
  4 factor     0019C7 R   |   5 farptr     000018 R   |   4 fcpu       002AF8 R
  4 fetchc     000660 R   |   4 fill_wri   0027B8 R   |   4 final_te   000C06 R
  4 first_li   001F37 R   |   5 flags      000022 GR  |   4 for        002272 R
  4 free       001C29 R   |   5 free_eep   000024 R   |   7 free_ram   000080 R
  4 func_arg   001976 R   |   4 func_eef   001D3B R   |   4 func_not   002CB2 R
  4 ge         0013C1 R   |   4 get_addr   0017F2 R   |   4 get_arra   001997 R
  4 get_char   00180C R   |   4 get_cmd_   0011F5 R   |   4 get_code   0017D6 R
  4 get_cons   001CC0 R   |   4 get_esca   00097B R   |   4 get_int2   0017FC R
  4 get_targ   002393 R   |   4 get_targ   0023A1 R   |   4 get_tick   002A80 R
  4 get_toke   000F2A GR  |   4 getc       000954 GR  |   4 gosub      0024A8 R
  4 gosub_1    0024B3 R   |   4 gosub_2    0024B9 R   |   4 goto       00248E R
  4 goto_1     002498 R   |   4 gpio       002975 R   |   4 gt         0013BD R
  4 gt_tst     001079 R   |   4 hex_base   001C1F R   |   4 hex_dump   0006A0 R
  4 if         002258 R   |   5 in         000001 GR  |   5 in.saved   000002 GR
  5 in.w       000000 GR  |   4 incr_far   0008B6 R   |   4 input_ex   002130 R
  4 input_lo   00209C R   |   4 input_va   002098 R   |   4 insert_c   000A1A R
  4 insert_l   000D0D R   |   4 insert_l   000D7C R   |   4 interp_l   00178C R
  4 interpre   001767 R   |   4 invalid    0005B5 R   |   4 invalid_   000636 R
  4 invert     002D67 R   |   4 is_alnum   000E7E GR  |   4 is_alpha   000E64 GR
  4 is_data_   002E1B R   |   4 is_digit   000E75 GR  |   4 is_symbo   000E87 R
  4 itoa       00184F GR  |   4 itoa_loo   001871 R   |   4 jp_to_ta   00249B R
  4 key        002964 R   |   4 kword_di   003341 GR  |   4 kword_en   002FA9 R
  4 le         0013C6 R   |   4 ledoff     00046B R   |   4 ledon      000466 R
  4 ledtoggl   000470 R   |   4 left_par   000479 R   |   4 let        001C7D GR
  4 let_arra   001C8B R   |   4 let_eval   001C93 R   |   4 let_var    001C90 R
  4 lines_sk   001F3A R   |   4 list       001EE8 R   |   4 list_con   001CCF R
  4 list_exi   001F7C R   |   4 list_loo   001F5A R   |   4 log2       002D14 R
  4 logical_   002CC5 R   |   4 look_tar   0023C4 R   |   4 loop_bac   002376 R
  5 loop_dep   00001F R   |   4 loop_don   00238B R   |   4 lshift     002A9E R
  4 lt         0013C4 R   |   4 lt_tst     0010A2 R   |   4 mem_peek   0005D2 R
  4 mod24      0003D5 R   |   4 move       00142C GR  |   4 move_dow   00144B R
  4 move_era   000742 R   |   4 move_exi   00146C R   |   4 move_lef   0009F2 R
  4 move_loo   001450 R   |   4 move_prg   000782 R   |   4 move_rig   000A00 R
  4 move_up    00143D R   |   4 mul24      00025D R   |   4 mul_char   0013AE R
  4 mulu24_8   00022A R   |   4 nbr_tst    000F5D R   |   4 ne         0013C9 R
  4 neg24      0001F3 R   |   4 neg_acc2   00020D R   |   4 neg_ax     000205 R
  4 new        002736 R   |   4 next       00231E R   |   4 next_lin   00176F R
  4 next_tok   0017BD GR  |   4 no_match   00193E R   |   4 number     000666 R
  4 other      0010CB R   |   4 overwrit   000C32 R   |   2 pad        0016B8 GR
  4 pad_ref    002FA4 R   |   4 parse_bi   000E27 R   |   4 parse_in   000DD4 R
  4 parse_ke   000EAA R   |   4 parse_qu   000D7F R   |   4 parse_sy   000E92 R
  4 pause      002A0D R   |   4 pause02    002A20 R   |   4 peek       002237 R
  4 peek_byt   000600 R   |   4 pin_mode   002B07 R   |   4 plus_tst   001042 R
  4 poke       002216 R   |   4 power_ad   0025DC R   |   4 prcnt_ts   001063 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 242.
Hexadecimal [24-Bits]

Symbol Table

  4 print      001FF5 R   |   4 print_fa   000645 R   |   4 print_he   000C67 GR
  4 print_re   0004C5 R   |   4 print_st   0005C5 R   |   4 print_to   001837 R
  4 prog_siz   001E57 R   |   4 program_   001E5F R   |   4 program_   00075C R
  4 program_   000782 R   |   4 prt_acc2   001829 R   |   4 prt_basi   001FD1 R
  4 prt_i16    001812 R   |   4 prt_loop   001FF9 R   |   4 prt_peek   000448 GR
  4 prt_reg1   0004A6 R   |   4 prt_reg8   000484 R   |   4 prt_regs   0003DE GR
  5 ptr16      000019 GR  |   5 ptr8       00001A R   |   4 putc       000944 GR
  4 puts       0009A1 GR  |   4 qgetc      00094D GR  |   4 qkey       002968 GR
  4 qmark_ts   000FEF R   |   4 qsign      0027B1 R   |   4 random     002B94 R
  4 read       002E91 R   |   4 read01     002E93 R   |   4 read_int   00357C R
  4 readln     000AA6 GR  |   4 readln_l   000AB3 R   |   4 readln_q   000C4F R
  4 refresh_   002D0F R   |   4 regs_sta   000421 R   |   4 relation   001ADE R
  4 relop_st   0013B1 R   |   4 remark     002135 GR  |   4 repl       00057E R
  4 repl_exi   0005A6 R   |   4 reset_co   001FF7 R   |   4 rest_con   002088 R
  4 restore    002E4A R   |   4 restore_   002E8C R   |   4 return     0024CE R
  4 right_al   001193 GR  |   4 row_alig   00089B R   |   4 row_eras   000715 R
  4 row_eras   000742 R   |   4 row_loop   000683 R   |   4 rparnt_t   000FAD R
  4 rshift     002ACB R   |   7 rsign      00007C R   |   7 rsize      00007E R
  4 rt_msg     001689 R   |   4 run        0024EC R   |   4 run_app    000135 R
  4 run_it     00251E R   |   4 run_it_0   002520 R   |   5 rx1_head   00002E R
  5 rx1_queu   000026 R   |   5 rx1_tail   00002F R   |   4 save_app   0027DC R
  4 save_con   002078 R   |   4 scan_blo   0008C4 R   |   4 search_c   001D64 R
  4 search_d   00191E GR  |   4 search_e   001966 R   |   4 search_l   000C89 GR
  4 search_l   000C98 R   |   4 search_n   001922 R   |   5 seedx      000014 R
  5 seedy      000016 R   |   4 select_p   002B64 R   |   4 send_esc   0009C9 R
  4 send_par   0009D4 R   |   4 set_data   002E39 R   |   4 set_time   002C95 R
  4 sharp_ts   000FCE R   |   4 show_row   000671 R   |   4 single_c   0013A7 R
  4 skip       000F17 R   |   4 skip_str   0017E3 R   |   4 slash_ts   001058 R
  4 sleep      002A02 R   |   4 software   00147F R   |   4 spaces     000A0E GR
  4 spi_clea   002F39 R   |   4 spi_disa   002F21 R   |   4 spi_enab   002EEE R
  4 spi_rcv_   002F5B R   |   4 spi_read   002F86 R   |   4 spi_sele   002F8D R
  4 spi_send   002F45 R   |   4 spi_writ   002F66 R   |   2 stack_fu   001774 GR
  2 stack_un   001800 R   |   4 star_tst   00104D R   |   4 step       0022DC R
  4 stop       0026EA R   |   4 store_lo   00230B R   |   4 str_matc   00194B R
  4 str_tst    000F4D R   |   4 strcmp     00140B R   |   4 strcpy     00141C GR
  4 strlen     001400 GR  |   4 sub24      000187 R   |   4 symb_loo   000E93 R
  4 syntax_e   0016BC GR  |   4 system_i   0014C5 R   |   5 tab_widt   000023 GR
  4 tb_error   0016BE GR  |   4 term       001A63 R   |   4 term01     001A6B R
  4 term_exi   001AA3 R   |   4 test       00340D R   |   4 test_p     0005BD R
  2 tib        001668 GR  |   4 tick_tst   001007 R   |   5 ticks      00000F R
  4 timeout    002CAC R   |   5 timer      000012 GR  |   4 timer2_i   0000A1 R
  4 timer4_i   0000AE R   |   4 tk_id      0016AC R   |   4 to         00229C R
  4 to_eepro   0007AB R   |   4 to_flash   0007B0 R   |   4 to_hex_c   000C7E GR
  4 to_upper   0018A8 GR  |   4 token_ch   0010E2 R   |   4 token_ex   0010E6 R
  4 tone       002585 R   |   4 try_next   002E7C R   |   5 txtbgn     00001B GR
  5 txtend     00001D GR  |   4 uart1_ge   000954 GR  |   4 uart1_in   0008FF R
  4 uart1_pu   000944 GR  |   4 uart1_qg   00094D GR  |   4 uart1_se   00090F R
  4 ubound     001C72 R   |   4 uflash     0029A5 R   |   4 unlock_e   0006DF R
  4 unlock_f   0006FA R   |   4 until      002D90 R   |   4 user_int   000057 R
  4 usr        0029BA R   |   4 var_name   0011EB GR  |   5 vars       000030 GR
  4 wait       00213B R   |   4 warm_ini   0014F6 R   |   4 warm_sta   001748 R
  4 words      002C2F R   |   4 words_co   002C7F R   |   4 write      0028CB R
  4 write_bl   000860 GR  |   4 write_bu   00079C R   |   4 write_by   0007E6 R
  4 write_ee   000822 R   |   4 write_ex   00085B R   |   4 write_fl   00080C R
  4 write_nb   000885 R   |   2 xstack_f   001738 GR  |   2 xstack_u   001774 GR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 243.
Hexadecimal [24-Bits]

Symbol Table


ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 244.
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

