NEW 
1 I2C_TEST  
2 ' TRACE 1 
3 ' SCL -> PE1 -> CN8:10,  SDA -> PE2 -> CN8:9  
4 ' test 24LC512  EEPROM 
20 CONST DEVID=$A0 ' device address 
30 DIM COUNT ' bytes to write or read  
32 DIM EADR ' eeprom address 
34 DIM BUFF  ' buffer address 
38 ' open I2C 
40 I2C.OPEN 100 ' SCL -> 100 Khz 
48 ' select eeprom address to read from  
50  EADR=0  BUFF=PAD+4 
58  ' read 10 bytes 
60  COUNT=10 GOSUB EE.READ 
70  ' print read values 
80  FOR I=BUFF TO I+COUNT-1 ? PEEK(I); next I  ? 
100 ' write 10 byte
119  I=#BUFF  POKE I,RSHIFT(EADR,8)  POKE I+1,EADR 
110  FOR I=I+2 TO I+COUNT-1 POKE I,A A=A+1 : NEXT I 
120  GOSUB EE.WRITE  
128  'read back
130 FOR I=BUFF TO I+COUNT-1 POKE I,0 NEXT I 
150 GOSUB EE.READ  
158 ' print values 
160 FOR I=BUFF TO I+9 ? PEEK(I); NEXT I  ? 
190 END 
198 ' set eeprom address to access 
200 SEND.ADDR 
210 POKE pad,RSHIFT(EADR,8) poke pad+1,EADR
220 I2C.WRITE DEVID,2,PAD  
240 RETURN 
298 ' read n bytes, address must be sent first 
300 EE.READ 
320 GOSUB SEND.ADDR 
340 I2C.READ DEVID, COUNT ,BUFF 
390 RETURN 
398 ' write n bytes to eeprom 
400 EE.WRITE ' address is sent with data bytes 
420 I2C.WRITE DEVID, COUNT+2, BUFF   
430 RETURN 
