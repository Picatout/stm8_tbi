NEW 
1 I2C.ALT.FUNC 
2 ?"Enable or disable I2C alternate function on NUCLEO_8S207K8 board" 
5 LET A=PEEK($4803)
10 IF A AND 64 : ? "I2C alternate function is enabled." 
20 INPUT "0 Quit\n1 Enable it\n2 Disable it\n"n 
30 IF N=0 : END 
40 IF N=1 : LET A=A OR 64 : GOTO 70 
50 IF N=2 : LET A=NOT 64 AND A : GOTO 70
60 END 
70 WRITE $4803,A 
80 REBOOT 
