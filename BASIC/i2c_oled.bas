NEW 
 1 I2C_OLED 
 2 ' test i2c with OLED display , SSD1306 controller
 3 ' 128x32 pixels 
 4  ' exemple adapted from pico-examples/i2c/oled_i2c
 5 CONST  STP=0, NO_STP=1
10 CONST DEVID=$78
11 ' oled commands set 
12 CONST DISP.SLEEP=$AE,DISP.ON=$AF,DISP.GRRAM=$A4,OLED.ALL.ON=$A5
13 CONST DISP.NORMAL=$A6,OLED.CONTRAST=$81
14 CONST OLED.ADR.MODE=$20, OLED.COL.ADR=$21
16 CONST OLED.PG.ADR=$22, OLED.SEG.REMAP=$A0
18 CONST OLED.MUX.RATIO=$A8, OLED.COM.DIR=$C0, OLED.DISP.OFST=$D3
20 CONST OLED.COM.PIN.CFG=$DA, OLED.CLK.DIV=$D5, OLED.PRECHARGE=$D9 
22 CONST OLED.VCOM.DESEL=$DB, OLED.CHARG.PUMP=$8D
24 CONST DISP.SCROL.LEFT=$27, OLED.SCROLL=$2E, OLED.ADDR=$3C
26 CONST OLED.WIDTH=128, OLED.HEIGHT=64, OLED.PAG.HEIGHT=8
28 CONST OLED.NUM.PAGE=8, OLED.BUF.LEN=1024
29 trace 0
30 BUFFER TBUF,130 
32 DIM CMD,COUNT  
34 LET CMD=TBUF+1
36 DIM TOP=0,BOTTOM=7,LEFT=0,RIGHT=127 ' WINDOW RECT 

50 I2C.OPEN 400
52 GOSUB OLED.INIT
56 GOSUB OLED.CLEAR 
58 GOSUB BLINK
62 GOSUB OLED.CLEAR 
64 ? "binary count fill" 
66 LET COUNT=128 
68 FOR I=1 TO 128: POKE TBUF+I,I: NEXT I
70 FOR I=0 TO 7: GOSUB OLED.DATA: NEXT I  
72 GOSUB WAIT.KEY 
74 GOSUB OLED.CLEAR  
78 GOSUB HELLO
80 GOSUB WAIT.KEY 
82 GOSUB SCROLL 
84 COUNT=1:POKE CMD,DISP.SLEEP:GOSUB OLED.CMD 
85 COUNT=2:POKE CMD,OLED.CHARG.PUMP:POKE CMD+1,$10:GOSUB OLED.CMD 
86 I2C.CLOSE 
88 END  

90 WAIT.KEY 
92 ? "Press a key to continue"
94 LET K=KEY 
96 RETURN 

100 OLED.CMD ' send command 
110 POKE TBUF,$80 
116 I2C.WRITE DEVID,COUNT+1,TBUF,STP   
120 RETURN 

150 ' send data to OLED 
152 OLED.DATA  
154 POKE TBUF,$40
156 I2C.WRITE DEVID,COUNT+1,TBUF,STP 
160 RETURN

200 OLED.INIT ' initialize oled display 
202 ? "Initializing display."
203 COUNT=1 ' Hardware configuration 
210 POKE CMD,DISP.SLEEP : GOSUB OLED.CMD ' turn off display 
212 POKE CMD,OLED.ADR.MODE: GOSUB OLED.CMD ' set memory address mode 
214 POKE CMD,0: GOSUB OLED.CMD ' horizontal mode 
218 POKE CMD,OLED.SEG.REMAP: GOSUB OLED.CMD ' set segment remap 
220 POKE CMD,OLED.MUX.RATIO: GOSUB OLED.CMD ' set multiplex ratio 
222 POKE CMD,OLED.HEIGHT-1: GOSUB OLED.CMD ' 64 
224 POKE CMD,OLED.COM.DIR: GOSUB OLED.CMD ' top..bottom 
226 POKE CMD,OLED.DISP.OFST: GOSUB OLED.CMD ' display offset 
228 POKE CMD,0: GOSUB OLED.CMD ' no offset 
230 POKE CMD,OLED.COM.PIN.CFG: GOSUB OLED.CMD 'set common pins config
232 POKE CMD,$12: GOSUB OLED.CMD ' bits 5=0,4= 1 , see ss1306 datasheet  
234 POKE CMD,OLED.CLK.DIV: GOSUB OLED.CMD ' display clock divisor 
236 POKE CMD,$80: GOSU B OLED.CMD ' div ratio of 1, standard freq 
238 POKE CMD,OLED.PRECHARGE: GOSUB OLED.CMD ' pre-charge period 
240 POKE CMD,$F1: GOSUB OLED.CMD ' phase1=1, phase2=15
242 POKE CMD,OLED.VCOM.DESEL: GOSUB OLED.CMD ' VCOMH deselect level 
244 POKE CMD,$30: GOSUB OLED.CMD ' 0.83Vcc
246 POKE CMD,OLED.CONTRAST: GOSUB OLED.CMD ' set contrast to
248 POKE CMD,$FF: GOSUB OLED.CMD ' maximum value 
250 POKE CMD,OLED.ALL.ON: GOSUB OLED.CMD ' entire display on 
252 POKE CMD,DISP.NORMAL: GOSUB OLED.CMD ' normal display 
254 POKE CMD,OLED.CHARG.PUMP: GOSUB OLED.CMD ' enable charge pump 
256 POKE CMD,$14: GOSUB OLED.CMD  ' bit2=1
258 POKE CMD,OLED.SCROLL: GOSUB OLED.CMD ' no scroll 
260 POKE CMD,DISP.ON: GOSUB OLED.CMD ' turn display on 
264 RETURN 

398 ' blink display 
400 BLINK ? "blink display, key to stop" 
402 LET COUNT=1 
420 POKE CMD,OLED.ALL.ON: GOSUB OLED.CMD 
430 PAUSE 250  
440 POKE CMD,DISP.GRRAM: GOSUB OLED.CMD    
450 PAUSE 250  
460 GET K:IF K=0 GOTO 420
470 RETURN 

598  ' clear display   
600 OLED.CLEAR 
601 LEFT=0,RIGHT=127,TOP=0,BOTTOM=8 
602 GOSUB DRAW.WND
604 FOR I=1 TO 128: POKE TBUF+I,0: NEXT I 
606 LET COUNT=128  
608 FOR I=0 TO 7: GOSUB OLED.DATA: NEXT I 
612 RETURN 

660 DRAW.WND ' set draw window   
662 LET COUNT=3
664 POKE CMD,OLED.PG.ADR:POKE CMD+1,TOP:POKE CMD+2,BOTTOM:GOSUB OLED.CMD 
666 POKE CMD,OLED.COL.ADR:POKE CMD+1,LEFT:POKE CMD+2,RIGHT:GOSUB OLED.CMD 
670 RETURN 

700 SCROLL ? "scroll display" 
702 COUNT=7
704 POKE CMD,$27:POKE CMD+1,0:POKE CMD+2,0 
706 POKE CMD+3,0:POKE CMD+4,7
708 POKE CMD+5,0: GOSUB OLED.CMD:POKE CMD+6,$FF:GOSUB OLED.CMD 
710 COUNT=1:POKE CMD,$2F: GSOUB OLED.CMD 
712 GOSUB WAIT.KEY 
714 POKE CMD,$2E:GOSUB OLED.CMD 
750 RETURN  

800 HELLO ? "say hello"  
806 RESTORE 
808 LET COUNT=128 
810 FOR I=1 TO I+3*8-1 : POKE TBUF+I, READ: NEXT I 'HEL
812 RESTORE 1004  
814 FOR I=I TO I+3*8-1: POKE TBUF+I, READ: NEXT I 'LO_ 
816 RESTORE 1010
818 GOSUB POKE.CHAR 'W 
820 RESTORE 1006 
822 GOSUB POKE.CHAR 'O
824 RESTORE 1012 
826 GOSUB POKE.CHAR 'R
828 RESTORE 1004 
830 GOSUB POKE.CHAR 'L
832 RESTORE 1014 
834 GOSUB POKE.CHAR 'D 
836 FOR P=0 TO 7 
838 GOSUB OLED.DATA 
840 NEXT P 
850 RETURN 

898 ' copy char font to TBUF 
900 POKE.CHAR 
902 FOR I=I TO I+7: POKE TBUF+I, READ: NEXT I 
904 RETURN 

1000 DATA $7F,$10,$10,$10,$10,$10,$7F,0 ' H
1002 DATA $7F,$49,$49,$49,$49,$49,$49,0 ' E
1004 DATA $7F,$40,$40,$40,$40,$40,$40,0 ' L       
1006 DATA $7E,$41,$41,$41,$41,$41,$7E,0 ' O 
1008 DATA 0,0,0,0,0,0,0,0               ' SPACE 
1010 DATA $7F,$20,$10,$E,$10,$20,$7F,0  ' W  
1012 DATA $7F,$9,$9,$9,$19,$2A,$44,0    ' R
1014 DATA $7F,$41,$41,$41,$41,$41,$3E,0 ' D 
