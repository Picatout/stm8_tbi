NEW 
1 ' write binary code in flash and execute it.
2 ' square a number 
20   RESTORE 
22 ' machine code 
30 DATA $9F,$42,$4F,$81 
50 LET A=UFLASH : ? "routine at "; A 
60 FOR I=0 TO  3
70  WRITE A+I,READ 
80 NEXT I 
90 input "number {1..255, 0 quit} to square?"n
100 ? USR(A,n)
110 if n<>0 : goto 90 

