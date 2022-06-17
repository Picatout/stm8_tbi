NEW 
1 I2C_TEST  
2 ' TRACE 1 
3 ' SCL -> PE1 -> CN8:10,  SDA -> PE2 -> CN8:9  
10 DIM R.W=0 ' READ=1/WRITE=0 bit
20 DIM CO=0 ' 0 -> data only, 128 -> cmd+data 
30 DIM D.C=0 ' 0 -> command, 64 -> data 
38 ' open I2C 
40 I2C.OPEN 0,0,100 ' adrmode=7 bits ,no ack,SCL -> 100 Khz 
48 ' load data in buffer  dev_adr,CoDC,cmd 
50  poke pad,$78  poke pad+1,0  poke pad+2,$AE 
60  I2C.WRITE 3, PAD ' count, buffer 
70  IF timeout  i2c.error 
80  poke pad+2,$AF 
90  I2C.WRITE 3, PAD
100 IF timeout  i2c.error  
