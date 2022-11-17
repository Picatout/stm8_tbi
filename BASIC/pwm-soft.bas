NEW 
1 PWM.SOFT 
5 ' Software PWM, controle LD2 sur la carte  
7 GOSUB HELP 
10 LET R =511, S=1, N=0, P=0 : ? R ;
20 LOOP ' PWM loop 
22 IF K=P : LET N=N+1, S=N/10+1
24 IF K<>P : LET S=1, N=0
26 LET P=K, K=0 
30 IF R : BSET PORTC ,BIT(5) 
40 FOR A =0 TO R : NEXT A 
50 BRES PORTC ,BIT(5) 
60 FOR A =A TO 1023 : NEXT A 
70 IF KEY?  : LET K=KEY : GOSUB UPPER 
72 IF (K=ASC(\D) OR K=ASC(\U)) AND K=P : LET N=N+1, S=N/10+1
74 IF K=0 OR K<>P : LET S=1, N=0
78 IF K=0 : GOTO 30 
80 IF K =ASC (\U) : GOTO 200 
84 IF K =ASC (\F)  : LET R =1023 : GOTO 600 : REM  pleine intensite 
90 IF K =ASC (\D) : GOTO 400 
94 IF K =ASC (\O) : LET R =0 : GOTO 600 : REM  eteindre
96 IF K= ASC(\?) : GOSUB HELP : GOTO 600
100 IF K =ASC (\Q) : GOSUB  CLS : END 
110 GOTO LOOP
200 IF R <1023 :LET R =R +S : GOTO 600 
210 GOTO LOOP
400 IF R >0  : LET R =R -S : GOTO 600 
410 GOTO LOOP
600 IF R<0 : LET R=0 
602 IF R>1023 : LET R=1023 
604 GOSUB CLS : PRINT R ; 
610 GOTO LOOP 

1000 UPPER ' upper case letter
1010 IF K<ASC(\a) : RETURN
1020 IF K>ASC(\z) : RETURN 
1030 LET K=K-32 
1040 RETURN 

2000 CLS ' clear terminal screen and move cursor home
2010 PRINT CHAR(27);"[2J";CHAR(27);"[H" 
2020 RETURN 

3000 HELP 
3010 GOSUB CLS
3012 ? "To control LD2 use:" 
3014 ? ,"'D' decrease intensity"
3016 ? ,"'U' increase intensity"
3018 ? ,"'F' full intensity"
3020 ? ,"'O' turn off LD2"
3024 ? ,"'Q' quit."
3026 ? ,"'?' help"
3028 ? "Press any key to leave this help screen."
3030 DO UNTIL KEY? : ? KEY 
3032 GOSUB CLS 
3034 RETURN 
