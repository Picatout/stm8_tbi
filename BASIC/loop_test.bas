NEW
   5 ' performance test 
   10 LET T = TICKS 
   12 FOR I = 1 TO 10000 
   14 NEXT I 
   16 ? TICKS - T ; " msec" 
   20 LET I = 1 , T = TICKS 
   22 DO LET I = I + 1 
   24 UNTIL I > 10000 
   26 ? TICKS - T ; " msec" 
   30 LET I = 1 , T = TICKS 
   32 LET I = I + 1 
   34 IF I <= 10000 GOTO 32 
   36 ? TICKS - T ; " msec" 
