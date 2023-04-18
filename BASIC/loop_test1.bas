new 
  10 ' for next speed test 
   12 LET T = TICKS 
   14 FOR I = 1 TO 10000 
   16 NEXT I 
   18 ? TICKS - T ; " MSEC" 
   20 ' DO UNTIL TEST 
   22 LET I = 1 , T = TICKS 
   24 DO LET I = I + 1 : UNTIL I > 10000 
   26 ? TICKS - T ; " MSEC" 
   28 ' GOTO LOOP 
   30 LET I = 1 , T = TICKS 
   32 LET I = I + 1 : IF I <= 10000 GOTO 32 
   34 ? TICKS - T ; " MSEC" 
