NEW
1 SERVO.CTRL 
5 ' servo-motor control on channel 1 on D3 
6 ' servo-pulse range 500 usec - 2500 usec.
10 ' enable servo-motor control
20 SERVO.EN 1 ' 0 to disable 
30 'enable channel 1
40 SERVO.CH.EN 1,1 
50 ADCON 1 
60 ' read analog input channel and set TIM1.CCR1 register with value.
70 DO 
80 ? "\b\b\b\b\b";:LET N=ADCREAD(0)*2+500: ? n;
90 SERVO.POS 1,N  
100 UNTIL KEY? ' quit when a key is pressed 
110 ' disable servo motor control 
120  SERVO.CH.EN 1,0 ' disable channel 0
130  SERVO.EN 0 ' disable TIMER1 
140 END 

