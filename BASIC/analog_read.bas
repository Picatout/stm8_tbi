NEW 
    1 AN.READ
    5 'demo lecture analogique et impression en décimal.
   10 LET K = 0 :PRINT K;: ADCON  1 
   20 DO 
   30 LET R =ADCREAD ( 0 )
   40 IF R :BSET PORTC,5
   50 FOR A = 0 TO R :NEXT A 
   60 BRES PORTC,5 
   70 FOR A =A TO  1023 :NEXT A 
   80 PRINT char(27)"[G";R;
   90 GET K UNTIL K 
 
