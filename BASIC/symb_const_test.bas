NEW 
    5 ' Test symbolic constant speed in comparison to literal constant.
   10 CONST TEST =1024
   20 PRINT "assign a varaible."
   24 PRINT "literal constant: ";
   30 LET T=TICKS :FOR I=1 TO 10000:LET A=20490: NEXT I
   32 PRINT TICKS-T; "MSEC."
   34 PRINT "symbolic constant: ";
   40 LET T=TICKS :FOR I=1 TO 10000:LET A= TEST: NEXT I
   44 PRINT TICKS-T; "MSEC."
   50 CONST LED =20490
   60 PRINT "Test toggling user LED on board."
   64 PRINT "Literal constant: ";
   70 LET T=TICKS: FOR I=1 TO 10000: BTOGL 20490,5: NEXT I
   72 PRINT TICKS-T; "MSEC."
   74 PRINT "Symbolic constant: ";
   80 LET T=TICKS: FOR I=1 TO 10000: BTOGL LED,5: NEXT I
   90 PRINT TICKS-T; "MSEC."
