NEW 
1  SPI.TEST
2  REM RAM 23LC1024 write,read test
3  REM This is a 128KB SPI-RAM 
4  REM Vdd=5.0 RAM Fck max is 16Mhz 
6  CONST RD=3,WR=2,D.OFS=4 
20 SPI.EN 1  
30 REM write 16 random number at address 0 
40 SPI.SEL 1 
44 INPUT "ADDRESS "A 
48 REM write command and address
50 SPI.WR WR,RSHIFT(A,16),RSHIFT(A,8) AND 255,A AND 255  
84 ? "writing 16 bytes in 23LC1024 at address: "; A ;?"\n{";
90 FOR I=1 TO 16
100 LET D=RND(256):SPI.WR D: ? D;  
110 NEXT I : SPI.SEL 0
120 ? "}"
130 ? "reading back 23LC1024\n{" 
140 SPI.SEL 1 
150 SPI.WR RD,RSHIFT(A,16),RSHIFT(A,8) AND 255,A AND 255 
160 FOR I=1 TO 16 
170 ? SPI.RD;
180 NEXT I : ? "}"
190 SPI.SEL 0
200 SPI.EN 0
300 END

