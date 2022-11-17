
NEW 
  2 ' Test I2C EEPROM 24LC512
    5 CONST STP=0, NO_STP=1, DEV.ID=$A0 
   10  DIM  EE.ADR : BUFFER TBUF , 16
   20  I2C.OPEN 400
   22  INPUT "1 -> READ, 2 WRITE, 3 WRITE+READ" N 
   30  GOSUB SET.ADDR 
   38 ' fill buffer with data 
   40  FOR I= TBUF + 2 TO TBUF + 15: POKE I, RND(93)+33: NEXT I
   50  IF N=1: GOTO 80
   60 PRINT "Writing buffer to EEPROM"
   64 GOSUB PRT.BUF 
   70  I2C.WRITE DEV.ID, 16, TBUF,STP   
   74  PAUSE 10 ' give time for write to be done 
   78  IF N=2 END   
   80  FOR I=TBUF +2 TO I+15: POKE I,0: NEXT I 
   90  PRINT "Reading EEPROM"
   98  PRINT "Sending address"
   100 I2C.WRITE DEV.ID,2,TBUF,STP
   108 PRINT "Reading data"
   110 I2C.READ DEV.ID,14,TBUF+2,STP 
   120 I2C.CLOSE
   130 GOSUB PRT.BUF 
   140 END

   198 ' set eeprom address pointer 
   200 SET.ADDR 
   210  POKE TBUF,RSHIFT(EE.ADR,8): POKE TBUF+1,EE.ADR
   230  RETURN  
   398 ' print buffer content 
   400  PRT.BUF 
   420  PRINT  
   430  PRINT "buffer={";
   450  FOR I= TBUF  TO TBUF + 15: PRINT PEEK( I);
   460  IF I<15 ";"; 
   470  NEXT I 
   480  PRINT "}"
   490 RETURN 

