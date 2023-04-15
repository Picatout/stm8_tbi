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
;--------------------------------------
;   Implementation of xmodem transfert protocl
;   REF: https://en.wikipedia.org/wiki/XMODEM
;   DATE: 2020-07-17
;
;--------------------------------------------------

.if SEPARATE 
    .module XMODEM   
    .include "config.inc"

    .area CODE 
.endif 


PACKET_SIZE=128

DEBUG=0

;-----------------------
; wait SOH or EOT
; drain all other char 
; input:
;   Y    time out msec 
; output:
;   A     SOH  start of header
;         EOT end of transmission
;         0   time out
;-----------------------
wait_soh:
	ldw y,#1000
	ldw timer,y 
1$:	clr a
	ldw y,timer 
	jrne 2$
	ret 
2$:	call uart_qgetc 
	jreq 1$ 
	call uart_getc 
	cp a,#SOH 
	jreq 4$ 
	cp a,#EOT 
	jrne 1$ 
4$: clrw y 
	ldw timer,y 
	ret 

;-----------------------
; get next character 
; wait 1 second maximum
;------------------------
get_next:
	ldw y,#1000

;-------------------------------
; getc with timeout 
; input:
;   Y     timeout delay in msec.
; output:
;   A     0|char received
;-------------------------------
getc_to::
	ldw timer,y 
	clr a 
1$: ldw y,timer 
	jrne 2$
	ret 
2$:	call uart_qgetc 
	jreq 1$ 
	call uart_getc 
	clrw y 
	ldw timer,y 
	ret 

;-----------------------------------
; XMODEM receive 128 bytes block
; input:
;   X    receive buffer address
; output:
;   A    ACK packet received ok
;        CAN all tries failed
;        EOT end of file 
;-----------------------------------
	BCOUNT=1 
	CHKSUM=2 
	SERIAL=3
	TRIES=4
	BUFFER=5
	VAR_SIZE=6
xrcv_block::
	_vars VAR_SIZE 
	ldw (BUFFER,sp),x 
	ld a,#10 ; number of tries 
	ld (TRIES,sp),a 
try_again:
	ldw x,(BUFFER,sp)
	call wait_soh
	cp a,#SOH 
	jreq 1$
	cp a,#EOT 
	jrne 2$
	ld a,#ACK  
	call uart_putc 
	ld a,#EOT 
	jra 7$ 		
1$:	;start of header received
	ld a,#PACKET_SIZE
	ld (BCOUNT,sp),a 
	clr (CHKSUM,sp)
	call get_next  
	ld (SERIAL,sp),a 
	call get_next
	add a,(SERIAL,sp)
	inc a 
	jreq 4$
2$:	
	ld a,#NAK 
	call uart_putc 
	dec (TRIES,sp) 
	jrne try_again 
	jra 5$
4$: ; receive data
	call get_next 
	ld (x),a 
	incw x 
	add a,(CHKSUM,sp)
	ld (CHKSUM,sp),a 
	dec (BCOUNT,sp)
	jrne 4$
	call get_next  
	cp a,(CHKSUM,sp)
	jrne 2$
; packet received ok	
	ld a,(SERIAL,sp)
	call print_hex 
	ld a,#ACK
	jra 6$ 
5$: ; all tries failed 
	ld a,#CAN 
6$:	call uart_putc
7$:	_drop VAR_SIZE 
	ret 

;-------------------------
; XMODEM transmit 128 bytes block
; input:
;   A    packet number
;   X    buffer address
;-------------------------
; local variables
	CHKSUM=1 ; byte
	TRIES=2  ; byte 10 retries
	SERIAL=3 ; byte packet number
	PLEN=4   ; byte packet length 128 bytes
	BUFF=5   ; word buffer address 
	VAR_SIZE=6
xtrmt_block::
	_vars VAR_SIZE
	ldw (BUFF,sp),x 
	ld (SERIAL,sp),a 
	ld a,#10 
	ld (TRIES,sp),a 
tx_retries:
	ld a,#SOH 
	call uart_putc 
	ld a,(SERIAL,sp)
	call uart_putc 
	ld a,(SERIAL,sp)
	cpl a 
	call uart_putc 
	clr (CHKSUM,sp)
	ld a,#PACKET_SIZE 
	ld (PLEN,sp),a 
	ldw x,(BUFF,sp)
1$: ld a,(x)
	incw x 
	call uart_putc 
	add a,(CHKSUM,sp)
	ld (CHKSUM,sp),a 
	dec (PLEN,sp)
	jrne 1$ 
	ld a,(CHKSUM,sp)
	call uart_putc
	call get_next
	cp a,#ACK 
	jreq 2$ 
	dec (TRIES,sp)
	jrne tx_retries
	ld a,#NAK  
2$:
	_drop VAR_SIZE 
    ret 


