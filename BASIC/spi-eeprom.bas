NEW 
   1 SPI.EEPROM 
   4 ' test SPI with 25LC640 EEPROM 
   10 SPI.EN 1,2 ' Fspi=Fmstr/8
   14 SPI.SEL 1:SPI.WR 6:SPI.SEL 0 'enable WEL bit in EEPROM 
   18 SPI.SEL 1:SPI.WR 5: IF NOT SPI.RD AND 2 :GOTO 200
   26 SPI.SEL 0
   30 ? "writing 16 random values to EEPROM\n{"
   34 SPI.SEL 1:SPI.WR 2,0,0
   38 FOR I =0 TO 15
   42 LET D=RND(256):?D;:SPI.WR D:NEXT I:?"}"  
   46 SPI.SEL 0 
   50 GOSUB 100' wait for write completed 
   54 SPI.SEL 1:SPI.WR 3,0,0
   58 ? "\nreading back EEPROM\n{"
   62 FOR I =0 TO 15:PRINT SPI.RD; :NEXT I:?"}"
   66 SPI.SEL 0:
   70 SPI.EN 0
   74 END  
   98 ' wait for write completed 
  100 SPI.SEL 1:SPI.WR 5:LET S =SPI.RD :SPI.SEL 0
  110 IF S AND 1 :GOTO 100
  120 RETURN 
  200 PRINT "failed to enable WEL bit in EEPROM "; A 
  210 SPI.SEL 0  ' deselect EEPROM 
  220 SPI.EN 0 ' disable SPI 
