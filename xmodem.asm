;;
; Copyright Jacques Deschênes 2019,2020 
; This file is part of PABasic 
;
;     PABasic is free software: you can redistribute it and/or modify
;     it under the terms of the GNU General Public License as published by
;     the Free Software Foundation, either version 3 of the License, or
;     (at your option) any later version.
;
;     PABasic is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;     GNU General Public License for more details.
;
;     You should have received a copy of the GNU General Public License
;     along with PABasic.  If not, see <http://www.gnu.org/licenses/>.
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; implementing XMODEM protocol 
;; REF: https://en.wikipedia.org/wiki/XMODEM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    .module XMODEM

    .nlist
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 
    .list 
    
    .area DATA

checksum:   .blkb 1 ; received block checksum 

    .area CODE 


;-----------------------
; Transmit file in RAM 
;-----------------------
xtransmit::

    ret 

;------------------------------
; wait character with timeout
; input:
;   Y    timeout value 
; output:
;   A    character received | 0 if timeout
;------------------------------
    TMR=2
    VSIZE=2
wait_char:
    _vars VSIZE 
    clr a 
    
    call qkey 

    _drop VSIZE 
    ret 

;-----------------------
; receive a file in RAM 
; input:
;   X used as pointer to RAM 
; output:
;   X  data size received 
;      zero if failed 
;-----------------------
xreceive::
    ret 




