NEW 
5 ' test GOSUB with line# and label
10 GOSUB 100 
20 GOSUB LBL1 
30 ? "back from subroutine" 
40 END 
100 ? "GOSUB line# works!" return 
200 LBL1 ? "GOSUB label works" 
210 GOSUB 300
220 return 
300 ? "second level GOSUB" 
310 return 

