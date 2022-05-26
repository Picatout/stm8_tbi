;;
; Copyright Jacques Deschênes 2019,2022 
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
;------------------------------
; This file is for functions 
; interfacing with VT100 terminal
; emulator.
; except for getc and putc which
; are in TinyBasic.asm 
; exported functions:
;   puts 
;   readln 
;   spaces 
;------------------------------

    .module TERMINAL

    .include "config.inc"

.if SEPARATE
	.include "inc/nucleo_8s208.inc"
	.include "inc/stm8s208.inc"
	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 
.endif 

;    .list 


    .area CODE 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   UART1 subroutines
;;   used for user interface 
;;   communication channel.
;;   settings: 
;;		115200 8N1 no flow control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Uart1 intterrupt handler 
;;; on receive 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------------
; UART1 receive character
; CTRL+C (ASCII 3)
; cancel program execution
; and fall back to command line
; CTRL+X reboot system 
;--------------------------
Uart1RxHandler: ; console receive char 
	btjf UART1_SR,#UART_SR_RXNE,5$
	ld a,UART1_DR 
	cp a,#CTRL_C 
	jrne 2$
	call putc 
	jp user_interrupted
2$:
	cp a,#CAN ; CTRL_X 
	jrne 3$
	jp cold_start 	
3$:	push a 
	ld a,#rx1_queue 
	add a,rx1_tail 
	clrw x 
	ld xl,a 
	pop a 
	ld (x),a 
	ld a,rx1_tail 
	inc a 
	and a,#RX_QUEUE_SIZE-1
	ld rx1_tail,a 
5$:	iret 

;---------------------------------------------
; initialize UART1, 115200 8N1
; input:
;	none
; output:
;   none
;---------------------------------------------
uart1_init:
    bset PA_DDR,#UART1_TX_PIN
    bset PA_CR1,#UART1_TX_PIN 
    bset PA_CR2,#UART1_TX_PIN 
; enable UART1 clock
	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
uart1_set_baud: 
	push a 
; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
	ld a,#CLK_SWR_HSI
	cp a,CLK_CMSR 
	jreq 2$ 
1$: ; 8 Mhz 	
	mov UART1_BRR2,#0x05 ; must be loaded first
	mov UART1_BRR1,#0x4
	jra 3$
2$: ; 16 Mhz 	
	mov UART1_BRR2,#0x0b ; must be loaded first
	mov UART1_BRR1,#0x08
3$:
    clr UART1_DR
	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
	bset UART1_CR2,#UART_CR2_SBK
    btjf UART1_SR,#UART_SR_TC,.
    clr rx1_head 
	clr rx1_tail
	pop a  
	ret

;---------------------------------
; uart1_putc
; send a character via UART1
; input:
;    A  	character to send
;---------------------------------
putc:: ; console output always on UART1
uart1_putc:: 
	btjf UART1_SR,#UART_SR_TXE,.
	ld UART1_DR,a 
	ret 


;---------------------------------
; Query for character in rx1_queue
; input:
;   none 
; output:
;   A     0 no charcter available
;   Z     1 no character available
;---------------------------------
qgetc::
uart1_qgetc::
	ld a,rx1_head 
	sub a,rx1_tail 
	ret 

;---------------------------------
; wait character from UART1 
; input:
;   none
; output:
;   A 			char  
;--------------------------------	
getc:: ;console input
uart1_getc::
	call uart1_qgetc
	jreq uart1_getc 
	pushw x 
;; rx1_queue must be in page 0 	
	ld a,#rx1_queue
	add a,rx1_head 
	clrw x  
	ld xl,a 
	ld a,(x)
	push a
	ld a,rx1_head 
	inc a 
	and a,#RX_QUEUE_SIZE-1
	ld rx1_head,a 
	pop a  
	popw x
	ret 

;-----------------------------
;  constants replacing 
;  ANSI sequence received 
;  from terminal.
;  These are the ANSI sequences
;  accepted by function readln
;------------------------------
    ARROW_LEFT=128
    ARROW_RIGHT=129
    HOME=130
    KEY_END=131
    SUP=132 

convert_table: .byte 'C',ARROW_RIGHT,'D',ARROW_LEFT,'H',HOME,'F',KEY_END,'3',SUP,0,0

;--------------------------------
; receive ANSI ESC 
; sequence and convert it
; to a single character code 
; in range {128..255}
; This is called after receiving 
; ESC character. 
; ignored sequence return 0 
; output:
;   A    converted character 
;-------------------------------
get_escape:
    call getc 
    cp a,#'[ ; this character is expected after ESC 
    jreq 1$
    clr a
    ret
1$: call getc 
    ldw x,#convert_table
2$:
    cp a,(x)
    jreq 4$
    addw x,#2
    tnz (x)
    jrne 2$
    clr a
    ret 
4$: incw x 
    ld a,(x)
    cp a,#SUP
    jrne 5$
    push a 
    call getc
    pop a 
5$:
    ret 


;-----------------------------
; send an ASCIZ string to UART1 
; input: 
;   x 		char * 
; output:
;   none 
;-------------------------------
puts::
    ld a,(x)
	jreq 1$
	call putc 
	incw x 
	jra puts 
1$:	ret 


;---------------------------
; delete character at left 
; of cursor on terminal 
; input:
;   none 
; output:
;	none 
;---------------------------
bksp:
	ld a,#BS 
	call putc 
	ld a,#SPACE 
	call putc 
	ld a,#BS 
	call putc 
	ret 
;---------------------------
; delete n character left of cursor 
; at terminal.
; input: 
;   A   number of characters to delete.
; output:
;    none 
;--------------------------	
delete_nchar:
	push a 
0$:	tnz (1,sp)
	jreq 1$
	call bksp 
	dec (1,sp)
	jra 0$
1$:	pop a 
	ret

;--------------------------
; send ANSI escape sequence
; ANSI: ESC[
; note: ESC is ASCII 27
;       [   is ASCII 91  
;-------------------------- 
send_escape:
	ld a,#ESC 
	call putc 
	ld a,#'[
	call putc 
	ret 

;---------------------
;send ANSI parameter value
; ANSI parameter values are 
; sent as ASCII charater 
; not as binary number.
; this routine 
; convert binary number to 
; ASCII string and send it.
; expected range {0..99}
; input: 
; 	A {0..99} 
; output:
;   none 
;---------------------
send_parameter:
	pushw x 
	clrw x 
	ld xl,a 
	ld a,#10 
	div x,a 
	ld xh,a 
	ld a,xl
    tnz a 
    jreq 2$
	cp a,#9 
	jrule 1$
	ld a,#9
1$:
	add a,#'0 
	call putc
2$:	ld a,xh 
	add a,#'0
	call putc 
	popw x 
	ret 

;--------------------------
; move cursor left n character
; ANSI: ESC[PnD 
; 'Pn' est a numerical parameter
; specifying number of characters 
; displacement.
; input:
;   A     character count
; output:
;   none
;--------------------------
move_left:
	push a 
	call send_escape
    pop a
	call send_parameter 
	ld a,#'D 
	call putc 
	ret	


;--------------------------
; move cursor right n character 
; ANSI: ESC[PnC 
; input:
;   A     character count
; output:
;   none
;--------------------------
move_right:
	push a 
	call send_escape
    pop a
	call send_parameter 
	ld a,#'C 
	call putc 
	ret 


;--------------------------
; print n spaces on terminal
; input:
;  X 		number of spaces 
; output:
;	none 
;---------------------------
spaces::
	ld a,#SPACE 
1$:	tnzw x
	jreq 9$
	call putc 
	decw x
	jra 1$
9$: 
	ret 

;--------------------------
; insert character in text 
; line 
; input:
;   A       character to insert 
;   xl      line length
;   xh      insert position 
;   Y       line pointer 
; output:
;   tib     updated 
;   Y       updated  
;-------------------------
	IPOS=1
	KCHAR=2 
    LLEN=3 
	VSIZE=3 
insert_char: 
	_vars VSIZE 
    ld (KCHAR,sp),a 
    ld a,xh 
	ld (IPOS,sp),a
    ld a,xl 
    ld (LLEN,sp),a  
    ldw x,y
    incw x 
    ld a,(LLEN,sp)
    sub a,(IPOS,sp)
    inc a 
    ld acc8,a 
    clr acc16
    call move
    ldw y,#tib 
    ld a,(IPOS,sp)
    ld acc8,a 
    addw y,acc16 
    ld a,(KCHAR,sp)
    ld (y),a
    incw y  
    ld a,(IPOS,sp)
    call move_left
    ldw x,#tib 
    call puts 
    ld a,(LLEN,sp)
    sub a,(IPOS,sp) 
    call move_left 
	_drop VSIZE 
	ret 


;--------------------------
; delete character under cursor
; input:
;   A       line length   
;   xl      delete position
;   Y       line pointer 
;-------------------------
	CPOS=1
	LLEN=2
	VSIZE=2
delete_under:
	_vars VSIZE 
    ld (LLEN,sp),a 
    ld a,xl 
    ld (CPOS,sp),a 
    ldw x,y ; move destination
    incw y  ; move source 
    ld a,(LLEN,sp)
    sub a,(CPOS,sp)
    inc a ; move including zero at end.
    ld acc8,a 
    clr acc16 
	call move 
    ldw y,#tib 
    ld a,(CPOS,sp)
    ld acc8,a 
    addw y,acc16 
    ldw x,y 
    call puts 
    ld a,#SPACE  
    call putc
    ld a,(LLEN,sp)
    sub a,(CPOS,sp)
    call move_left 
    dec (LLEN,sp)
	_drop VSIZE 
	ret 

;-----------------------------
; send ANSI sequence to delete
; whole line. Cursor position
; is not updated.
; ANSI: ESC[2K
; input:
;   none
; output:
;   none 
;-----------------------------
delete_line:
    call send_escape
	ld a,#'2
	call putc 
	ld a,#'K 
	call putc 
	ret 



;------------------------------------
; read a line of text from terminal
;  control keys: 
;    BS   efface caractère à gauche 
;    ln+CTRL_E  edit ligne# 'ln' line # 
;    CTRL_R  edit previous line.
;    CTRL_D  delete line  
;    HOME  go to start of line  
;    KEY_END  go to end of line 
;    ARROW_LEFT  move cursor left 
;    ARROW_RIGHT  move cursor right 
;    CTRL_O  toggle between insert/overwrite
; input:
;	none
; local variable on stack:
;	LL  line length
;   RXCHAR last received character 
; output:
;   text in tib  buffer
;   count  line length 
;------------------------------------
	; local variables
	LL_HB=1  ; line length high byte 
	RXCHAR = 1 ; last char received
	LL = 2  ; accepted line length
	CPOS=3  ; cursor position 
	OVRWR=4 ; overwrite flag 
	VSIZE=4 
readln::
	pushw y 
	_vars VSIZE 
	clrw x 
	ldw (LL,sp),x 
	ldw (CPOS,sp),x 
	cpl (OVRWR,sp) ; default to overwrite mode 
 	ldw y,#tib ; terminal input buffer
readln_loop:
	call getc
	ld (RXCHAR,sp),a
    cp a,#ESC 
    jrne 0$
    call get_escape 
    ld (RXCHAR,sp),a 
0$:	cp a,#CR
	jrne 1$
	jp readln_quit
1$:	cp a,#LF 
	jrne 2$ 
	jp readln_quit
2$:
	cp a,#BS
	jrne 3$
; delete left 
    tnz (CPOS,sp)
    jreq readln_loop 
    ld a,#1 
    call move_left
    dec (CPOS,sp)
    decw y 
    ld a,(CPOS,sp) 
    jp 12$
3$:
	cp a,#CTRL_D
	jrne 4$
;delete line 
	call delete_line 
    ld a,(CPOS,sp)
    inc a 
    call move_left 
	ld a,#'> 
	call putc 
	ldw y,#tib
	clr (y)
	clr (LL,sp)
	clr (CPOS,sp)
	jra readln_loop
4$:
	cp a,#CTRL_R 
	jrne 5$
;repeat line 
	tnz (LL,sp)
	jrne readln_loop
	ldw y,#tib 
	ldw x,y
	call strlen
	tnz a  
	jreq readln_loop
	ld (LL,sp),a 
    ld (CPOS,sp),a
	ldw x,y  
	call puts
	clr (LL_HB,sp)
	addw y,(LL_HB,sp)
	jra readln_loop 
5$:
	cp a,#CTRL_E 
	jrne 6$
;edit line number 
	ldw x,#tib 
	call atoi24
	ldw x,acc16
	call search_lineno
	tnzw x 
	jrne 51$
;	clr (LL,sp)
;	ldw y,#tib
;   clr (y) 	
	jp readln_quit  
51$:
	ldw basicptr,x
	ld a,(2,x)
	ld count,a 
	ldw y,#tib 
	call decompile 
	clr (LL_HB,sp)
	ld a,#CR 
	call putc 
	ld a,#'>
	call putc
    ldw x,#tib  
	call strlen 
	ld (LL,sp),a 
	call puts 
	ldw y,x
    ld a,(LL,sp)
    ld (CPOS,sp),a  
	jp readln_loop
6$:
	cp a,#ARROW_RIGHT
   	jrne 7$ 
; right arrow
	ld a,(CPOS,sp)
    cp a,(LL,sp)
    jrmi 61$
    jp readln_loop 
61$:
    ld a,#1 
	call move_right 
	inc (CPOS,sp)
    incw y 
    jp readln_loop 
7$: cp a,#ARROW_LEFT  
	jrne 8$
; left arrow 
	tnz (CPOS,sp)
	jrne 71$
	jp readln_loop
71$:
    ld a,#1 
	call move_left 
	dec (CPOS,sp)
    decw y 
	jp readln_loop 
8$: cp a,#HOME  
	jrne 9$
; HOME 
    ld a,(CPOS,sp)
    call move_left 
	clr (CPOS,sp)
    ldw y,#tib 
	jp readln_loop  
9$: cp a,#KEY_END  
	jrne 10$
; KEY_END 
	ld a,(CPOS,sp)
	cp a,(LL,sp)
	jrne 91$
	jp readln_loop 
91$:
	ld a,(LL,sp)
	sub a,(CPOS,sp)
	call move_right 
	ld a,(LL,sp)
	ld (CPOS,sp),a
    ldw y,#tib
    clr acc16 
    ld acc8,a 
    addw y,acc16  
	jp readln_loop 
10$: cp a,#CTRL_O
	jrne 11$ 
; toggle between insert/overwrite
	cpl (OVRWR,sp)
	call beep_1khz
	jp readln_loop 
11$: cp a,#SUP 
    jrne final_test 
; del character under cursor 
    ld a,(CPOS,sp)
    cp a,(LL,sp)
    jrpl 13$
12$:
    ld xl,a    ; cursor position 
    ld a,(LL,sp)  ; line length
    call delete_under
    dec (LLEN,sp)
13$:
    jp readln_loop 
final_test:
	cp a,#SPACE
	jrpl accept_char
	jp readln_loop
accept_char:
	ld a,#TIB_SIZE-1
	cp a, (LL,sp)
	jrpl 1$
	jp readln_loop
1$:	tnz (OVRWR,sp)
	jrne overwrite
; insert mode 
    ld a,(CPOS,sp)
    cp a,(LL,sp)
    jreq overwrite
    ld a,(LL,sp)
    ld xl,a 
    ld a,(CPOS,sp)
    ld xh,a
    ld a,(RXCHAR,sp)
    call insert_char
    inc (LLEN,sp)
    inc (CPOS,sp)	
    jp readln_loop 
overwrite:
	ld a,(RXCHAR,sp)
	ld (y),a
    incw y
    call putc 
	ld a,(CPOS,sp)
	cp a,(LL,sp)
	jrmi 1$
	clr (y)
	inc (LL,sp)
    inc (CPOS,sp)
	jp readln_loop 
1$:	
	inc (CPOS,sp)
	jp readln_loop 
readln_quit:
	ldw y,#tib
    clr (LL_HB,sp) 
    addw y,(LL_HB,sp)
    clr (y)
	ld a,(LL,sp)
	ld count,a 
	ld a,#CR
	call putc
	_drop VSIZE 
	popw y 
	ret

;------------------------------
; print byte  in hexadecimal 
; on console
; input:
;    A		byte to print
;------------------------------
print_hex::
	push a 
	swap a 
	call to_hex_char 
	call putc 
    ld a,(1,sp) 
	call to_hex_char
	call putc
	ld a,#SPACE 
	call putc 
	pop a 
	ret 

;----------------------------------
; convert to hexadecimal digit 
; input:
;   A       digit to convert 
; output:
;   A       hexdecimal character 
;----------------------------------
to_hex_char::
	and a,#15 
	cp a,#9 
	jrule 1$ 
	add a,#7
1$: add a,#'0 
	ret 

