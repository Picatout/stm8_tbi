NEW 
5 ' test vitesse d'utilisation d'une constante symbolique par rapport
6 ' a une constante numerique. 
10  CONST TEST=1024
20  ? "test assignation d'une variable."
24  ? "constante numerique: ", 
30 T=TICKS FOR I=1 TO 10000 A=$500A NEXT I ? TICKS-T "MSEC."
34 ? "constante symbolique: ", 
40 T=TICKS FOR I=1 TO 10000 A=TEST NEXT I ?  TICKS-T "MSEC."
50 CONST LED2=$500A
60 ? "test basculement etat LED2 sur la carte."
64 ? "constante numerique: ",
70 T=TICKS FOR I=1 TO 10000 BTOGL $500A , 32 NEXT I  ? TICKS-T "MSEC."
74 ? "constante symbolique: ", 
80 T=TICKS FOR I=1 TO 10000 BTOGL LED2 , 32 NEXT I  ?  TICKS-T "MSEC." 


