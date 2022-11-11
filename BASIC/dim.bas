new 
1 ' test DIM variables 
10  ? "UBOUND before 'DIM test, pi2=3141592*2' ", ubound 
20 DIM test, pi2=3141592*2  
30 ? "UBOUND after 'DIM test, pi2=3141592*2' ", ubound 
40 ? "variables are initialized at 0.",
50 ? " test=",test 
60 ? "let test=12345, print it: ", 
70 let test=12345
80 ? test 
90 ? "pi2= ", 
100 ? pi2 
