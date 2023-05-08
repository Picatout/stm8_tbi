NEW
1 PWM.HARD 
5 ' pwm on D3 using TIMER1 channel 1
10 CONST TIM1.CR1=$5250,TIM1.ARRH=$5262,TIM1.ARRL=$5263,TIM1.CCMR1=$5258 
20 CONST TIM1.CCR1H=$5265,TIM1.CCR1L=$5266,TIM1.EGR=$5257,TIM1.CCER1=$525C 
30 CONST TIM.CCMR.OCM=4,TIM1.PSCRH=$5260,TIM1.PSCRL=$5261,CLK.PCKENR1=$50C7
40 CONST TIM1.BRK=$526D,TIM1.MOE=7
50 ' Enable TIMER1 clock 
60 BSET CLK.PCKENR1,7
70 ' Set up TIMER1 channel 1 for pwm output MODE 1 
80 POKE TIM1.CCMR1, LSHIFT(6,TIM.CCMR.OCM):BSET TIM1.BRK,TIM1.MOE
90 ' no prescale divisor on TIMER clock  
100 POKE TIM1.PSCRH,0:POKE TIM1.PSCRL,0 
110 ' 1023 for counter period, this give 10 bits resolution like the ADC 
120 POKE TIM1.ARRH,3:POKE TIM1.ARRL,255
130 POKE TIM1.CCR1H,1:POKE TIM1.CCR1L,255 
140 ' enable counter 
150 BSET TIM1.CCER1,0:BSET TIM1.EGR,0:BSET TIM1.CR1,0
160 ' enable analog digital converter 
170 ADCON 1 
180 ' read analog input channel and set TIM1.CCR1 register with value.
190 DO 
200 GOSUB CLR.LN:LET N=ADCREAD(0): ? n;
210 POKE TIM1.CCR1H,N/256:POKE TIM1.CCR1L,N
220 GET K UNTIL K ' quit when a key is pressed 
230 BRES TIM1.CCER1,0:BRES TIM1.CR1,0:BRES CLK.PCKENR1,7
240 END 
300 ' clear line, move cursor left 
310 CLR.LN 
320 ? char(27)"[G";char(27);"[K";
330 RETURN  

