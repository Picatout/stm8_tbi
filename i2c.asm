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

;--------------------------------
;  I2C peripheral drive 
;  pins: 
;   SCL -> PE1 -> CN8:10 | CN9:3
;   SDA -> PE2 -> CN8:9  | CN9:5 
;--------------------------------

I2C_STATUS_OK=7 ; bit 7 of i2c_status used indicate OK status 

;------------------------------
; i2c global interrupt handler
;------------------------------
I2cIntHandler:
    ld a,I2C_SR2 ; errors status 
    clr I2C_SR2 
    and a,#15 
    ld i2c_status,a 
    jreq 1$
ld a,#'E 
call putc
    bset I2C_CR2,#I2C_CR2_SWRST
    _usec_dly 1
    bres I2C_CR2,#I2C_CR2_SWRST
    iret 
1$: ; no error detected 
; handle events 
    clrw x 
    ld a,i2c_idx 
    ld xl,a 
    btjt I2C_SR1,#I2C_SR1_SB,evt_sb 
;    btjt I2C_SR1,#I2C_SR1_TXE,evt_txe 
    btjt I2C_SR1,#I2C_SR1_BTF,evt_txe 
    btjt I2C_SR1,#I2C_SR1_ADDR,evt_addr 
    btjt I2C_SR1,#I2C_SR1_ADD10,evt_add10
    btjt I2C_SR1,#I2C_SR1_RXNE,evt_rxne 
    btjt I2C_SR1,#I2C_SR1_STOPF,evt_stopf 
    btjt I2C_SR1,#I2C_SR2_WUFH,evt_wufh 
    iret 

evt_sb: ; start bit, send address 
    ld a,([i2c_buf],x)
    ld I2C_DR,a 
    inc i2c_idx 
    dec i2c_count 
    iret 

evt_txe:
    tnz i2c_count
    jreq evt_btf  
    ld a,([i2c_buf],x)
    ld I2C_DR,a
    inc i2c_idx 
    dec i2c_count
4$: iret  

evt_btf:
    bset I2C_CR2,#I2C_CR2_STOP 
    iret 

evt_addr: 
    ld a,I2C_SR3
    jra evt_txe        

evt_add10:
    btjt I2C_SR1,#I2C_SR1_TXE,evt_txe        
    iret     

evt_rxne: 
    ld a,#I2C_DR 
    ld ([i2c_buf],x),a  
    inc i2c_idx 
    dec i2c_count 
    jreq evt_stopf
    iret 

evt_stopf:
    bset I2C_CR2,#I2C_CR2_STOP
    bset i2c_status,#7 ; reception completed 
    iret 

evt_wufh:
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


;---------------------------
; BASIC: I2C.ERROR 
; display error message 
;---------------------------
i2c_display_error:
    ld a,i2c_status 
    and a,#15 
    jrne 0$
    ret 
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
5$: bres I2C_CR1,#0
    sll a 
    clrw x 
    ld xl,a 
    addw x,#i2c_error_msg 
    ldw x,(x)
    call puts 
    clr i2c_status
    ret  


;--------------------------------
; BASIC: I2C.open admode,ack, freq 
; enable I2C peripheral
; admode: address mode 7|10 bits 
;    0   7 bits 
;    1   10 bits 
; ack: 
;   0 don't send ACK, 
;   1 send ACK on byte recieved.
; freq:
;   SCL in Khz 
;--------------------------------
i2c_open:
; enable peripheral clock
	bset CLK_PCKENR1,#CLK_PCKENR1_I2C 	
    ldw x,#16 ; peripheral clock frequency 
    ldw I2C_FREQR,x
    call next_token 
    cp a,#TK_INTGR
    jreq 0$ 
    bres CLK_PCKENR1,#CLK_PCKENR1_I2C
    jp syntax_error 
0$: ; address mode 7 or 10 bits 
    ld a,#0x40 
    ld I2C_OARH,a 
    call get_int24 
    tnzw x 
    jreq 1$
    ld a,#0xC0
    ld I2C_OARH,a    
1$: 
    ld a,#TK_COMMA 
    call expect 
; Send ACK after byte received 
    bres I2C_CR2,#I2C_CR2_ACK
    ld a,#TK_INTGR
    call expect 
    call get_int24 
    tnzw x
    jreq 2$ 
    bset I2C_CR2,#I2C_CR2_ACK
2$: ld a,#TK_COMMA 
    call expect 
    ; clock period
    ld a,#TK_INTGR
    call expect  
 ; frequency Khz
    clr I2C_CCRH 
    call get_int24 
    pushw y 
    pushw x 
    ldw y,x 
    ldw x,#16000 ; Fmaster = 16000 Khz 
    divw x,y
; SLOW x=2*CCR
; FAST X=3*CCR | DUTY=1 -> 25*CCR     
    ldw y,x ;  
; check for freq range 
    ld a,#2 ; slow mode divisor 
    popw x 
    cpw x,#100 
    jrule 3$ 
; fast mode 
    bset I2C_CCRH,#I2C_CCRH_FAST 
    ld a,#3 ; fast mode divisor 
    cpw x,#320 
    jrne 3$
; fast mode DUTY=1
    bset I2C_CCRH,#I2C_CCRH_DUTY 
    ld a,#25 ; FAST+DUTY divisor 
3$: ldw x,y 
    div x,a 
    ld a,xl 
    ld I2C_CCRL,a
    ld a,xh 
    or a,I2C_CCRH 
    ld I2C_CCRH,a 
; set risetime
    ld a,#17 
    btjf I2C_CCRH,#I2C_CCRH_FAST,5$
; slow mode rise time max 1µS 
    ld a,#5
5$:     
    ld I2C_TRISER,a     
8$:
    popw y  
; enable interrupt 
    ld a,#7 ; ITBUFEN|ITEVTEN|ITERREN 
    ld I2C_ITR,a     
; enable periphal 
    bset I2C_CR1,#0  
; enable interrupt 
    ret


;------------------------------------
; BASIC: I2C.CLOSE 
; turn off i2c peripheral 
;-------------------------------------
i2c_close:
; disable interrupts 
    clr I2C_ITR 
; disable peripheral     
    bres I2C_CR1,#0 
; disable peripheral clock 
	bres CLK_PCKENR1,#CLK_PCKENR1_I2C 	
    ret

;-------------------------------
; BASIC: I2C.STOP 0|1
; clear|set stop bit 
;-------------------------------
i2c_stop:
    call next_token 
    cp a,#TK_INTGR 
    jreq 1$ 
    jp syntax_error
1$: call get_int24 
    tnzw x 
    jrne 2$
; clear stop bit 
    bres I2C_CR2,#I2C_CR2_STOP 
    ret     
2$: ; set stop bit 
    bset I2C_CR2,#I2C_CR2_STOP 
    ret 

;--------------------------------
; BASIC: I2C.WRITE count, buf_addr 
; write bytes to i2c device 
; count: of bytes to write 
; buf_addr:  address of buffer 
;---------------------------------
i2c_write:
    bres I2C_CR2,#I2C_CR2_SWRST
    bres I2C_CR2,#I2C_CR2_STOP 
    ld a,#TK_INTGR
    call expect 
    call get_int24  
    ld a,xl 
    ld i2c_count,a 
    ld a,#TK_COMMA 
    call expect 
    call expression
    _xpop 
    ldw i2c_buf,x
    clr i2c_idx  
    bset I2C_CR2,#I2C_CR2_START
    ldw x,#50 
    ldw timer,x 
1$: ld a,#i2c_count 
    jreq 9$ 
    ldw x,timer 
    jrne 1$ 
    call i2c_display_error
9$:
    ret 

;-----------------------------------
; BASIC: I2C.READ count, buf_addr 
; read bytes from device 
; count: of bytes to read 
; buf_addr: buffer address 
;-----------------------------------
i2c_read:

    ret 
