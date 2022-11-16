;;
; Copyright Jacques Deschênes 2019,2020,2021,2022  
; This file is part of stm8_tbi 
;
;     stm8_tbi is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     stm8_tbi is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with stm8_tbi.  If not, see <http://www.gnu.org/licenses/>.
;;

 .if SEPARATE 
    .module APP_SPACE   
    .include "config.inc"

    .area CODE 
.endif 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  application space 
;;  *** must be last to be linked ***
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	.bndry 128 ; align on FLASH block.
; space for user application  
app_space::
app_sign:  .word 0 ; .ascii "BC"  ; signature 
app_size: .word 0 
app: 

