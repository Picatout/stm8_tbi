NEW 
1 ' write binary code in flash and execute it.
2 ' square a number 
3 ' assembly code 
4 ' square:
5 '   _at_top 
6 '   _xpush 
7 '   call mul24 
8 '   ret 
20   RESTORE 
30 DATA $90,$F6,$93,$EE,$01,$01,$97,$42,$4F,$72,$A2
40 DATA $00,$03,$90,$F7,$90,$EF,$01,$81
50 LET A=UFLASH : ? "routine at "; A 
60 FOR I=0 TO  18
70  WRITE A+I,READ 
80 NEXT I 
90 input "number {1..255, 0 quit} to square?"n
100 ? USR(A,n)
110 if n<>0 : goto 90 

