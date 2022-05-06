 NEW 
   5  ? "testing ON expr GOTO line#,line#,..."
   7  INPUT "select 1-4"A 
  10  ON A GOTO 100,200,300,500  
  14  ? "Woops! selector out of range." : END  
  20  GOTO 500 
 100  PRINT 100 :GOTO 500
 200  PRINT 200 :GOTO 500
 300  PRINT 300 :GOTO 500 
 500 ? "testing ON expr GOSUB line#,line#..." 
 505 INPUT "select 1-6"B
 510 A=1 ON A*B GOSUB 600,700,800,900,1000,1100 
 520 IF (B>6) GOTO 14 
 522 if B<1 GOTO 14 
 524 GOTO 5  
 600 ? 600 : RETURN 
 700 ? 700 : RETURN 
 800 ? 800 : RETURN 
 900 ? 900 : RETURN 
 1000 ? 1000 : RETURN 
 1100 ? 1100 : RETURN 
 