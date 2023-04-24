NEW
   5 ' test INPUT command 
   10 INPUT "age? "A,"sex(1=M,2=F)? "S
   14 IF A=0 : END 
   20 IF S=1 PRINT "man "; : GOTO 40
   30 IF S=2 PRINT "woman "; : GOTO 40 
   34 ? "unknown gender ";
   40 IF A>59 and  A < 88 : PRINT "babyboomer": GOTO 10
   44 IF A>88 PRINT "very old": GOTO 10 
   50 PRINT "still young" : GOTO 10 
