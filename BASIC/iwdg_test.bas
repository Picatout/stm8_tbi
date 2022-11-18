NEW
1  IWDG 
5 ' indepencdent watchdog timer test 
10 IWDGEN 16383 ' enable **IWDG** with 1 second delay  
20 IF KEY? :GOTO 40
30 ? \.;:pause 100: IWDGREF  ' reset **IWDG** before it expire. 
34 GOTO 20  
40 ? "\nThe IWDG will reset MCU in 1 second .
