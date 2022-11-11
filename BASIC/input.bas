NEW
5 ' test INPUT command 
   10 INPUT "age? "A,"sex(1=M,2=F)? "S
   20 IF S=1 PRINT "man "; : GOTO 40
   30 PRINT "woman ";
   40 IF A>59 PRINT "babyboomer":END
   50 PRINT "still young"
