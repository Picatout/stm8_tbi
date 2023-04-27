NEW 
    1 AN.READ
    5 'demo lecture analogique et impression en décimal.
   10 LET K = 0 :PRINT K;: ADCON  1 
   20 LET R =ADCREAD ( 0 )
   30 IF R :BSET PORTC,5
   40 FOR A = 0 TO R :NEXT A 
   50 BRES PORTC,5 
   60 FOR A =A TO  1023 :NEXT A 
   70 IF KEY? :LET K =KEY AND $DF
   80 IF K =ASC (\Q):ADCON  0 :END
   90 PRINT "\b\b\b\b\b\b";R;
  100 GOTO  20 

