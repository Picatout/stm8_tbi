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

    .module XMODEM

    .nlist
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
    .list 

	.area CODE 

PACKET_SIZE=128

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
2$:	call qgetc 
	jreq 1$ 
	call getc 
	ret 


;-----------------------------------
; XMODEM receive 128 bytes block
; input:
;   X    receive buffer address
; output:
;   A    ACK packet received ok
;        NAK packet received failed
;        EOT end of file 
;-----------------------------------
	BCOUNT=1 
	CHKSUM=2 
	SERIAL=3
	VAR_SIZE=3
xrcv_block::
	_vars VAR_SIZE 
    call get_next 
	cp a,#EOT 
	jrne 1$
	ld a,#ACK  
	call putc 
	ld a,#EOT 
	jra 6$ 		
1$:	cp a,#SOH 
	jrne 4$ 
	ld a,#PACKET_SIZE
	ld (BCOUNT,sp),a 
	clr (CHKSUM,sp)
	call get_next  
	ld (SERIAL,sp),a 
	call get_next
	add a,(SERIAL,sp)
	inc a 
	jrne 4$
2$: 
	call get_next 
	ld (x),a 
	add a,(CHKSUM,sp)
	ld (CHKSUM,sp),a 
	dec (BCOUNT,sp)
	jrne 2$
	call get_next  
	cp a,(CHKSUM,sp)
	jrne 4$
	ld a,#ACK 
	jra 6$ 
4$: ld a,#CAN 
	call putc
6$:	_drop VAR_SIZE 
	ret 

;-------------------------
; XMODEM transmit 128 bytes block
; input:
;   A    packet number
;   X    buffer address
;-------------------------
; local variables
	CHKSUM=1 ; byte
	RETRY=2  ; byte 10 retries
	PACKNO=3 ; byte packet number
	PLEN=4   ; byte packet length 128 bytes
	BUFF=5   ; word buffer address 
	VAR_SIZE=6
xtrmt_block::
	_vars VAR_SIZE
	ldw (BUFF,sp),x 
	ld (PACKNO,sp),a 
	ld a,#10 
	ld (RETRY,sp),a 
tx_retries:
	ld a,#SOH 
	call putc 
	ld a,(PACKNO,sp)
	call putc 
	ld a,(PACKNO,sp)
	cpl a 
	call putc 
	clr (CHKSUM,sp)
	ld a,#PACKET_SIZE 
	ld (PLEN,sp),a 
	ldw x,(BUFF,sp)
1$: ld a,(x)
	incw x 
	call putc 
	add a,(CHKSUM,sp)
	ld (CHKSUM,sp),a 
	dec (PLEN,sp)
	jrne 1$ 
	ld a,(CHKSUM,sp)
	call putc
	call get_next
	cp a,#ACK 
	jreq 2$ 
	dec (RETRY,sp)
	jrne tx_retries
	ld a,#NAK  
2$:
	_drop VAR_SIZE 
    ret 


