    .area CODE 

.include "tbi_macros.inc" 

 square:
   _at_top  
   rrwa X
   ld xl,a 
   mul x,a 
  clr a 
  _xpush 
   ret
