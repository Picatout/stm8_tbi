    NEW 
    1 CHIP.ID 
    5 ' extract information from Unique ID registers.
   10 ? "X=" ; PEEK ( 18637 ) * 256 + PEEK ( 18638 ) ; 
   20 ? ", Y=" ; PEEK ( 18639 ) * 256 + PEEK ( 18640 ) ; 
   30 ? ", Wafer#=" ; PEEK ( 18641 ) ; 
   40 ? ", Lot=" ; : FOR I = 18642 TO I + 6 : ? CHAR ( PEEK ( I ) ) ; : NEXT I 
   