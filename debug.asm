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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  debugging support code 
;;  assembled only when DEBUG=1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    DEBUG=1 

    .if DEBUG 

    .macro _reg_name name  
    ld a,#name 
    call putc 
    ld a,#'=
    call putc 
    .endm 

    .area CODE 

    prt_regs:
    _dbg_save_regs 
    mov base,#16
    ld a,#CR 
    call putc 
; print CC 
    _reg_name 'C 
    ld a,(DBG_CC,sp)
    clrw x 
    ld xl,a 
    call print_int  
; print A 
    _reg_name 'A 
    ld a,(DBG_A,SP)
    clrw x 
    ld xl,a  
    call print_int
; print Y 
    _reg_name 'Y 
    ldw x,(DBG_Y,sp)
    call print_int     
; print X 
    _reg_name 'X 
    ldw x,(DBG_X,sp)
    call print_int 
    mov base,#10
    _dbg_restore_regs      
    ret 

   .endif ; DEBUG 

