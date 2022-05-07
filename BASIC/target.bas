NEW

   5 ' target test comparing line# vs symbolic target 
   6 ? "10000 loop each test"
   7 ? "GOTO using symbolic target ", 
  10  A=0 T=TICKS
  20   TEST A=A+1 
  30  IF A<10000 GOTO TEST 
  40  PRINT TICKS-T  " msec"
  50  ? "GOTO using line # ",  
  60 A=0 T=TICKS 
  70 TEST A=A+1 
  80 IF A<10000 GOTO 70 
  90 ? TICKS-T   " msec"
  100 ? "GOSUB using symbolic target ",  
  110 A=0 T=TICKS 
  120 DO GOSUB TGSUB UNTIL A=10000 
  140 ? TICKS-T   " msec"
  150 GOTO 220  
  200 TGSUB A=A+1 
  210 RETURN 
  220 ? "GOSUB using line # ", 
  224 A=0 T=TICKS 
  230 DO GOSUB 200 UNTIL A=10000 
  250 ? TICKS-T   " msec"
  260 END  

RUN 

