NEW 
1  BLINK
5 ' Blink LED2 on card 
10 DO BTOGL PORTC,BIT(5) PAUSE 500 UNTIL KEY? 
20 LET K=KEY 
30 BRES PORTC,BIT(5) 
40 END 

