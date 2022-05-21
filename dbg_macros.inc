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


;----------------------------------
;  macros used for debugging
;---------------------------------
;-------------------------------
;  macros used to help debugging
;-------------------------------
    
    DBG_CC=9
    DBG_A=8 
    DBG_X=6 
    DBG_Y=4 
    .macro _dbg_save_regs 
    .if DEBUG 
    push cc ; (9,sp)
    push a   ; (8,sp)
    pushw x  ; (6,sp)
    pushw y  ; (4,sp)
    ; save acc24 
    ld a,acc24 
    ldw x,acc16 
    pushw x 
    push a 
    .endif 
    .endm 

    .macro _dbg_restore_regs 
    ; restore acc24 
    .if DEBUG 
    pop a 
    popw x 
    ld acc24,a 
    ldw acc16,x 
    popw y 
    popw x 
    pop a 
    pop cc 
    .endif 
    .endm 

    .macro _dbg_getc
    .if DEBUG  
    _dbg_save_regs 
    call getc
    ld (DBG_A,sp),a 
    _dbg_restore_regs
    .endif   
    .endm 

    .macro _dbg_putc
    .if DEBUG  
    push cc 
    call putc 
    pop cc 
    .endif 
    .endm 

    .macro _dbg_puts
    .if DEBUG  
    _dbg_save_regs
    call puts 
    _dbg_restore_regs
    .endif 
    .endm 

    .macro _dbg_prti24 
    .if DEBUG 
    _dbg_save_regs
    call prti24 
    _dbg_restore_regs
    .endif 
    .endm 

    .macro _dbg_prt_regs
    .if DEBUG 
    call print_registers
    .endif  
    .endm 

    .macro _dbg_peek addr 
    .if DEBUG 
    _dbg_save_regs 
    ldw x,addr 
    call peek     
    _dbg_restore_regs
    .endif 
    .endm 

    .macro _dbg_parser_init 
    .if DEBUG 
    _dbg_save_regs
    call parser_init 
    _dbg_restore_regs
    .endif 
    .endm

    .macro _dbg_readln
    .if DEBUG 
    _dbg_save_regs
    call readln
    _dbg_restore_regs
    .endif 
    .endm

    .macro _dbg_number
    .if DEBUG 
    _dbg_save_regs
    call number 
    _dbg_restore_regs
    .endif 
    .endm  

    .macro _dbg_nextword
    .if DEBUG 
    _dbg_save_regs
    call get_token   
    _dbg_restore_regs
    .endif 
    .endm  

    .macro _dbg_dots 
    .if DEBUG 
    _dbg_save_regs
    call dots 
    _dbg_restore_regs
    .endif 
    .endm 

    .macro _dbg_trap
    bset flags,#FTRAP 
    trap 
    .endm 

    .macro _dbg_mark n  
    .if DEBUG 
    push cc
    push a 
    ld a,#n 
    call putc
    btjf UART1_SR,#UART_SR_TC,. 
    pop a 
    pop cc 
    .endif 
    .endm 
    
    .macro _dbg_prt_var var 
    .if DEBUG 
    _dbg_save_regs 
    ldw x,var 
    ldw acc16,x 
    clr acc24 
    clrw x 
    ld a,#16+128  
    call prti24
    ld a,#CR 
    call putc  
    _dbg_restore_regs
    .endif  
    .endm 

    .macro _dbg_show
    .if DEBUG  
    _dbg_save_regs 
    call show 
    _dbg_restore_regs
    .endif 
    .endm 




