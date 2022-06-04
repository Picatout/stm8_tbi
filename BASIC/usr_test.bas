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
30 DATA $90,$F6,$93,$EE,$1,$72,$A2,$0,$3,$90,$F7,$90
40 DATA $EF,$1,$CD,$2+$80,$5C+$80,$81
50 A=UFLASH 
60 FOR I=1 TO  18
70 WRITE A,READ : a=a+1 
80 NEXT I 
90 input "number to square?"n
100 ? USR(uflash,n)
110 goto 90 
