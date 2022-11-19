;;
; Copyright Jacques Deschênes 2019,2022  
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
    .module I2C   
    .include "config.inc"

    .area CODE 
.endif 

;--------------------------------
;  I2C peripheral drive 
;  pins: 
;   SCL -> PE1 -> CN8:10 | CN9:3
;   SDA -> PE2 -> CN8:9  | CN9:5 
; 
;  Support only 7 bit addressing 
;  and master mode 
;--------------------------------

I2C_STATUS_DONE=7 ; bit 7 of i2c_status indicate operation completed  
I2C_STATUS_NO_STOP=6 ; don't send a stop at end of transmission

;------------------------------
; i2c global interrupt handler
;------------------------------
I2cIntHandler:
    ld a, I2C_SR2 ; errors status 
    clr I2C_SR2 
    and a,#15 
    jreq 1$
    or a,i2c_status 
    _straz i2c_status 
    bset I2C_CR2,#I2C_CR2_STOP
    iret 
1$: ; no error detected 
    btjf i2c_status,#I2C_STATUS_DONE,2$
    clr I2C_ITR 
    iret 
; handle events 
2$: clrw x 
    _ldaz i2c_idx 
    ld xl,a 
    btjt I2C_SR1,#I2C_SR1_SB,evt_sb 
    btjt I2C_SR1,#I2C_SR1_ADDR,evt_addr 
    btjt I2C_SR1,#I2C_SR1_BTF,evt_btf  
    btjt I2C_SR1,#I2C_SR1_TXE,evt_txe 
    btjt I2C_SR1,#I2C_SR1_RXNE,evt_rxne 
    btjt I2C_SR1,#I2C_SR1_STOPF,evt_stopf 
    iret 

evt_sb: ; start bit, send address 
    _ldaz i2c_devid
    ld I2C_DR,a 
    iret 

evt_btf: 
    btjf I2C_SR3,#I2C_SR3_TRA,#evt_rxne  
    tnz i2c_count 
    jrne evt_txe_1 
    jra end_of_tx 

evt_addr: ; EV6  
    btjt I2C_SR3,#I2C_SR3_TRA,evt_txe
    iret 
evt_txe: 
    tnz i2c_count 
    jreq end_of_tx 
evt_txe_1:
    ld a,([i2c_buf],x)
    ld I2C_DR,a
    _incz i2c_idx 
    dec i2c_count
1$: iret 

; end of transmission
end_of_tx:
    bset i2c_status,#I2C_STATUS_DONE  
    btjt i2c_status,#I2C_STATUS_NO_STOP,1$
    bset I2C_CR2,#I2C_CR2_STOP
1$: clr I2C_ITR
    iret 


evt_rxne: 
    tnz i2c_count 
    jreq evt_stopf  
1$: ld a,I2C_DR 
    ld ([i2c_buf],x),a  
    _incz i2c_idx 
    _decz i2c_count
    jrne 4$
    bres I2C_CR2,#I2C_CR2_ACK
4$: iret 

evt_stopf:
    ld a,I2C_DR 
    ld ([i2c_buf],x),a 
    bset I2C_CR2,#I2C_CR2_STOP
    bset i2c_status,#I2C_STATUS_DONE
    clr I2C_ITR 
    iret  



; error message 
I2C_ERR_NONE=0 
I2C_ERR_NO_ACK=1 ; no ack received 
I2C_ERR_OVR=2 ; overrun 
I2C_ERR_ARLO=3 ; arbitration lost 
I2C_ERR_BERR=4 ; bus error 

i2c_error_msg:
    .word i2c_error_none, i2c_error_no_ack,i2c_error_overrun 
    .word i2c_error_arbitration, i2c_error_bus_error 

i2c_error: .asciz "i2c error, "
i2c_error_none: .asciz ""
i2c_error_no_ack: .asciz "no ACK received\n"
i2c_error_overrun: .asciz "overrrun\n"
i2c_error_arbitration: .asciz "bus arbitration lost\n"
i2c_error_bus_error: .asciz "misplaced start or stop\n"
i2c_error_timeout: .asciz "i2c operation time out,"
i2c_bytes_left: .asciz " bytes left.\n" 
;---------------------------
; BASIC: I2C.ERROR 
; display error message 
;---------------------------
cmd_i2c_error:
    _ldaz i2c_status 
    and a,#15 
    jrne 0$
; i2c report no error but there was a timeout.
    bset I2C_CR2,#I2C_CR2_STOP    
    ldw x,#i2c_error_timeout 
    call puts 
    clrw x 
    _ldaz i2c_count
    ld xl,a 
    call prt_i16
    ldw x,#i2c_bytes_left 
    call puts 
    bres I2C_CR1,#I2C_CR1_PE  
    jra 6$  
0$: 
    ldw x,#i2c_error
    call puts 
    btjt i2c_status,#I2C_SR2_AF,1$
    btjt i2c_status,#I2C_SR2_ARLO,2$
    btjt i2c_status,#I2C_SR2_BERR,3$
    btjf i2c_status,#I2C_SR2_OVR,4$ 
    ret 
1$:
    ld a,#I2C_ERR_NO_ACK 
    jra 5$
2$:
    ld a,#I2C_ERR_ARLO
    jra 5$
3$:
    ld a,#I2C_ERR_BERR 
    jra 5$
4$: 
    ld a,#I2C_ERR_OVR
5$: bres I2C_CR1,#I2C_CR1_PE
    sll a 
    clrw x 
    ld xl,a 
    addw x,#i2c_error_msg 
    ldw x,(x)
    call puts 
    _clrz i2c_status
6$:    
; reset AFR to default peripheral 
    jp warm_start   

;--------------------------------
; BASIC: I2C.open freq 
; enable I2C peripheral
;
; freq:
;   SCL in Khz 
;--------------------------------
cmd_i2c_open:
; program i2c alternate function on PB4 and PB5
; get argument on xstack 
    call arg_list 
    cp a,#1 
    jreq 1$
    jp syntax_error 
1$:
; enable peripheral clock
	bset CLK_PCKENR1,#CLK_PCKENR1_I2C 	
    ld a,#16 ; peripheral clock frequency 
    clr I2C_CR2 
    ld I2C_FREQR,a
; SCL fequency parameter 
    clr I2C_CCRH 
    _xpop   ; A:X freq. 
    pushw y 
    pushw x ; A is ignored  
    ldw y,x 
    ldw x,#16000 ; Fmaster = 16000 Khz 
    divw x,y
; SLOW x=2*CCR
; FAST X=3*CCR | DUTY=1 -> 25*CCR     
    ldw y,x ;  
; check for freq range 
    ld a,#2 ; slow mode divisor 
    popw x  ; freq Khz 
    cpw x,#100 
    jrule 2$ 
; fast mode 
    bset I2C_CCRH,#I2C_CCRH_FAST 
    ld a,#3 ; fast mode divisor 
    cpw x,#320 
    jrne 2$
; fast mode DUTY=1
    bset I2C_CCRH,#I2C_CCRH_DUTY 
    ld a,#25 ; FAST+DUTY divisor 
2$: ldw x,y 
    div x,a 
    ld a,xl 
    ld I2C_CCRL,a
; set risetime
    ld a,#17 
    btjf I2C_CCRH,#I2C_CCRH_FAST,3$
; slow mode rise time max 1µS 
    ld a,#5
3$:     
    ld I2C_TRISER,a     
    popw y  
; enable periphal 
    bset I2C_CR1,#I2C_CR1_PE  
    ret


;------------------------------------
; BASIC: I2C.CLOSE 
; turn off i2c peripheral 
;-------------------------------------
cmd_i2c_close:
; disable interrupts 
    bset I2C_CR2,#I2C_CR2_SWRST 
    nop 
; disable peripheral     
    bres I2C_CR1,#I2C_CR1_PE 
    nop 
; disable peripheral clock 
	bres CLK_PCKENR1,#CLK_PCKENR1_I2C 	
    ret

;----------------------------
; set operation parameters  
; called by i2c_write|i2c_read 
; 
; devid:
;     7 bit device identifier 
;
; count:
;     bytes to send|receive
;
; buf_addr:
;     pointer to buffer 
;  
; no_stop:
;     0   set STOP bit at end 
;     1   don't set STOP bit 
;---------------------------
set_op_params:
    clr i2c_status  
    call arg_list
    cp a,#4 
    jreq 1$
    jp syntax_error 
1$: _xpop ; no_stop 
    jreq 2$
    bset i2c_status,#I2C_STATUS_NO_STOP
2$: _xpop ; buf_addr 
    ldw i2c_buf,x 
    _xpop ; count 
    ld a,xl ; no more than 255 
    _straz i2c_count 
    _xpop ; devid 
    ld a,xl 
    _straz i2c_devid 
    ret 

;--------------------------------
; BASIC: I2C.WRITE devid,count, buf_addr,no_stop 
; write bytes to i2c device 
; devid:  device identifier 
; count: of bytes to write 
; buf_addr: address of bytes buffer 
; no_stop: dont't send a stop
;---------------------------------
cmd_i2c_write:
    call set_op_params
start_op:  
    _clrz i2c_idx 
    ldw x,#500 
    ldw timer,x ; expiration timer
    ld a,#(1<<I2C_ITR_ITBUFEN)|(1<<I2C_ITR_ITERREN)|(1<<I2C_ITR_ITEVTEN) 
    ld I2C_ITR,a 
    ld a,#(1<<I2C_CR2_START)|(1<<I2C_CR2_ACK)
    ld I2C_CR2,a      
1$: btjt i2c_status,#I2C_STATUS_DONE,9$ 
    ldw x,timer 
    jrne 1$ 
    call cmd_i2c_error; operation timeout 
9$: 
    ret 

;-----------------------------------
; BASIC: I2C.READ devid,count, buf_addr, no_stop 
; read bytes from device 
; count: of bytes to read 
; buf_addr: buffer address 
; no_stop: don't send a stop condition 
;-----------------------------------
func_i2c_read:
    call set_op_params 
    _ldaz i2c_devid 
    or a,#1 ; bit0 -> 1 for read 
    _straz i2c_devid
    jra start_op


