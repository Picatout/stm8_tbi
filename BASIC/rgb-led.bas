NEW
1 RGB.LED   
5 ' Control of RGB LED using PWM commands  
10 PWM.EN 1,16 
20 PWM.CH.EN 1,1 
30 PWM.CH.EN 2,1 
40 PWM.CH.EN 3,1 
50 INPUT "input R value"R 
60 INPUT "input G value"G 
70 INPUT "input B value"B 
80 PWM.OUT 1,R 
90 PWM.OUT 2,G 
100 PWM.OUT 3,B
110 ? "(Q)uit or else to repeat": LET K=KEY AND $DF 
120 IF K<>ASC(\Q) GOTO 50
130 PWM.CH.EN 1,0:PWM.CH.EN 2,0: PWM.CH.EN 3,0  
140 PWM.EN 0 


