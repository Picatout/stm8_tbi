    .area CODE 

.nlist
.include "inc/stm8s207.inc" 
.include "inc/nucleo_8s207.inc"
.include "tbi_macros.inc" 
.list 
 square:
   ld a,xl ; 0x9f 
   mul x,a ; 0x42  
   clr a   ; 0x4F 
   ret     ; 0x81
