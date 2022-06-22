NEW 
    1 ' i2c write test 
    5 CONST STP=0, NO_STP=1 
   10  I2C.OPEN 100
   20  DIM DEV.ID = 160
   30  BUFFER TBUF , 16
   40  POKE TBUF , 0 POKE TBUF + 1, 0
   44  FOR I=TBUF+2 TO I+13 POKE I,RND(94)+32 NEXT I 
   50  INPUT "how many to write?"N 
   60  I2C.WRITE DEV.ID , N, TBUF,NO_STP  
   64  PAUSE 10 
   70  I2C.CLOSE
   80  END  
