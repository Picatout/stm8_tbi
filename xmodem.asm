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

;------------------------
; wait 1 second to receive 
; ACK/NAK character 
; input:
;    Y   wait time in msec 
;------------------------
wait_ack::
	ldw timer,y 
1$:	call qgetc 
	jreq 2$ 
	call getc 
	cp a,#ACK 
	jreq 4$ 
	cp a,#NAK 
	jreq 4$ 
2$:	clr a 
	ldw y, timer
	jrne 1$
4$: clrw y 
	ldw timer,y 
	ret 

;------------------------
; XMODEM receive 128 bytes block
;------------------------
xrcv_block::
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
	ldw y,#500
	call wait_ack 	
	cp a,#ACK 
	jreq 2$ 
	dec (RETRY,sp)
	jrne tx_retries
	ld a,#NAK  
2$:
	_drop VAR_SIZE 
    ret 


