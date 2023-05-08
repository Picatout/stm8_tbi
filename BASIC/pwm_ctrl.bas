NEW
1 PWM.CTRL 
5 ' PWM control on channel 2 on D5 
10 ' enable PWM control, 16 bits resolution
12 ? "LED control at 244 hertz 16 bits on D5" 
20 PWM.EN 1,16 ' 0 to disable 
30 'enable channel 2
40 PWM.CH.EN 2,1 
50 ADCON 1 
60 ' read analog input channel and set TIM1.CCR1 register with value.
70 DO 
80 GOSUB CLR.LN:LET N=ADCREAD(0)*64: ? n;
90 PWM.OUT 2,N  
100 GET K UNTIL K ' quit when a key is pressed 
110 ' disable PWM control 
120  PWM.CH.EN 2,0 ' disable channel 0
130  PWM.EN 0 ' disable TIMER1 
140 END 
200 ' clear line, move cursor left 
210 CLR.LN 
220 ? char(27)"[G";char(27);"[K";
230 RETURN  

