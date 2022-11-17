  NEW 
    1 SPEED.TEST
    2 ? "FOR...NEXT test"
    5  LET T= TICKS
    7  FOR I= 1 TO 1000
   10  LET A=34*56%23+4
   20  NEXT I
   30  PRINT TICKS- T;" msec"
   70  ? "DO...UNTIL test"
   80  LET B=1 , T=TICKS 
   100 DO 
   110 LET A=34*56%23+4 
   120 LET B=B+1 : UNTIL B>1000 
   130 ? TICKS-T;" msec" 
   150 ? "GOSUB test"
   160 LET T=TICKS 
   170 FOR I=1 TO 1000
   180 GOSUB 300 
   184 NEXT I
   190 ? TICKS-T;" msec" 
   200 END
   300 LET A=34*56%23+4
   400 RETURN 
