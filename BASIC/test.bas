new 
  10  ' ceci est un test de performance 
  20  LET T=TICKS
  30  FOR I=1 TO 10000 GOSUB 100 NEXT I
  40  PRINT TICKS-T
  50  END
 100  RETURN
