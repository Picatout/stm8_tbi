    .area CODE 

.nlist
.include "inc/stm8s207.inc" 
.include "inc/nucleo_8s207.inc"
.include "tbi_macros.inc" 
.list 
 square:
   _at_top  
   rrwa X
   ld xl,a 
   mul x,a 
  clr a 
  _xpush 
   ret
