NEW 
10 REM  exemple d'utilisation de la pile 
20 INPUT "nombre "N : IF N=0 : END 
30 PUSH N 
32 GOSUB SQUARE   
34 PRINT POP 
40 GOTO 20 
50 SQUARE PUSH PICK (0 )*POP 
60 RETURN 
