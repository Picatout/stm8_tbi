NEW 
5 ' test vitesse d'utilisation d'une constante symbolique par rapport
6 ' a une constante numerique. 
10  CONST TEST=1024
14  ? "CONST TEST=";TEST 
20  ? "test assignation d'une variable. 1000 boucles"
24  ? "constante numerique LET A=$500A:"; 
30 LET T=TICKS
32 FOR I=1 TO 1000: LET A=$500A : NEXT I : ? TICKS-T " msec."
34 ? "constante symbolique LET A=TEST: ";
40 LET T=TICKS 
42 FOR I=1 TO 1000:LET A=TEST :NEXT I : ?  TICKS-T " msec."
50 CONST LED2=$500A
60 ? "test basculement etat LED2 sur la carte."
64 ? "constante numerique BTOGL $500A , 5: ";
70 LET T=TICKS 
72 FOR I=1 TO 1000: BTOGL $500A , 5 : NEXT I:  ? TICKS-T " msec."
74 ? "constante symbolique BTOGL LED2 , 5: "; 
80 LET T=TICKS 
84 FOR I=1 TO 1000: BTOGL LED2 , 5 :NEXT I : ?  TICKS-T " msec." 
90 ? "Assignation d'une fonction constante LET A=PORTC:";
92 LET T=TICKS 
94 FOR I=1 TO 1000: LET A=PORTC:NEXT I: ? TICKS-T " msec."

