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
; defined functions:
;   getc   wait for a character 
;   qgetc  check if char available 
;   putc   send a char to terminal
;   puts   print a string to terminal
;   readln  read text line from terminal 
;   spaces  print n spaces on terminal 
;   print_hex  print hex value from A 
;------------------------------

SEPARATE=0 

.if SEPARATE 
    .module TERMINAL  
    .include "config.inc"

    .area CODE 
.endif 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   UART subroutines
;;   used for user interface 
;;   communication channel.
;;   settings: 
;;		115200 8N1 no flow control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Uart1 intterrupt handler 
;;; on receive character 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------------
; UART receive character
; in a FIFO buffer 
; CTRL+C (ASCII 3)
; cancel program execution
; and fall back to command line
; CTRL+X reboot system 
; CTLR+Z erase EEPROM autorun 
;        information and reboot
;--------------------------
UartRxHandler: ; console receive char 
	btjf UART_SR,#UART_SR_RXNE,5$ 
	ld a,UART_DR 
	cp a,#CTRL_C 
	jrne 2$
	jp user_interrupted
2$:
	cp a,#CAN ; CTRL_X 
	jrne 3$
	_swreset 	
3$:	cp a,#CTRL_Z 
	jrne 4$
	call clear_autorun
	_swreset 
4$:
	push a 
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
; initialize UART, 115200 8N1
; called from cold_start in hardware_init.asm 
; input:
;	none
; output:
;   none
;---------------------------------------------
uart_init:
	bset UART_PORT_DDR,#UART_TX_PIN 
    bset UART_PORT_CR1,#UART_TX_PIN 
    bset UART_PORT_CR2,#UART_TX_PIN 
; enable UART clock
	bset CLK_PCKENR1,#UART_PCKEN 	
uart_set_baud:: 
	push a 
	bres UART,#UART_CR1_PIEN
; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
	ld a,#CLK_SWR_HSI
	cp a,CLK_CMSR 
	jreq 2$ 
1$: ; 8 Mhz 	
	mov UART_BRR2,#0x05 ; must be loaded first
	mov UART_BRR1,#0x4
	jra 3$
2$: ; 16 Mhz 	
	mov UART_BRR2,#0x0b ; must be loaded first
	mov UART_BRR1,#0x08
3$:
    clr UART_DR
	mov UART_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
	bset UART_CR2,#UART_CR2_SBK
    btjf UART_SR,#UART_SR_TC,.
    clr rx1_head 
	clr rx1_tail
	bset UART,#UART_CR1_PIEN
	pop a  
	ret


;---------------------------------
;  set output vector 
;  input:
;     A     STDOUT -> uart 
;           BUFOUT -> [ptr16]
;     X     buffer address 
;---------------------------------
set_output:
	ldw ptr16,x 
	ldw x,#uart_putc 
	cp a,#STDOUT 
	jreq 1$
	cp a,#BUFOUT 
	jrne 9$  
	ldw x,#buf_putc 
1$: ldw out,x 
9$:	ret 


;---------------------------------
;  vectorized character output 
;  input:
;     A   character to send 
;---------------------------------
putc:
	pushw x 
	_ldxz out 
	call (x)
	popw x 
	ret 

;---------------------------------
; output character to a buffer 
; pointed by ptr16
; input:
;    A     character to save 
;---------------------------------
buf_putc:
	ld [ptr16],a
	_incz ptr8 
	jrne 9$
	_incz ptr16 
9$:	clr [ptr16] 
	ret 


;---------------------------------
; uart_putc
; send a character via UART
; input:
;    A  	character to send
;---------------------------------
uart_putc:: 
	btjf UART_SR,#UART_SR_TXE,.
	ld UART_DR,a 
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
uart_qgetc::
	_ldaz rx1_head 
	sub a,rx1_tail 
	ret 

;---------------------------------
; wait character from UART 
; input:
;   none
; output:
;   A 			char  
;--------------------------------	
getc:: ;console input
uart_getc::
	call uart_qgetc
	jreq uart_getc 
	pushw x 
;; rx1_queue must be in page 0 	
	ld a,#rx1_queue
	add a,rx1_head 
	clrw x  
	ld xl,a 
	ld a,(x)
	push a
	_ldaz rx1_head 
	inc a 
	and a,#RX_QUEUE_SIZE-1
	_straz rx1_head 
	pop a  
	popw x
	ret 

;-----------------------------
;  constants replacing 
;  ANSI sequence received 
;  from terminal.
;  These are the ANSI sequences
;  accepted by readln function
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
; send an ASCIZ string to UART 
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
1$:	incw x 
	ret 

;---------------------------------------------------------------
; send ANSI Control Sequence Introducer (CSI) 
; ANSI: CSI 
; note: ESC is ASCII 27
;       [   is ASCII 91
; ref: https://en.wikipedia.org/wiki/ANSI_escape_code#CSIsection  
;----------------------------------------------------------------- 
send_csi:
	push a 
	ld a,#ESC 
	call putc 
	ld a,#'[
	call putc
	pop a  
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
; move cursor at column  
; input:
;    n    colon 
;---------------------------
cursor_column:
	call send_csi 
	call send_parameter 
	ld a,#'G 
	call putc 
	ret 


;--------------------------
; output a single space
;--------------------------
space:
	ld a,#SPACE 
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


;-----------------------------
; send ANSI sequence to delete
; whole display line. 
; cursor set left screen.
; ANSI: CSI K
; input:
;   none
; output:
;   none 
;-----------------------------
erase_line:
; move to screen left 
	call restore_cursor_pos  
; delete from cursor to end of line 
    call send_csi
	ld a,#'K 
	call putc 
	ret 

;-------------------------------
; save current cursor postion 
; this value persist to next 
; call to this procedure.
; ANSI: CSI s
;--------------------------------
save_cursor_pos: 
	call send_csi 
	ld a,#'s 
	call putc 
	ret 

;--------------------------------
; restore cursor position from 
; saved value 
; ANSI: CSI u	
;---------------------------------
restore_cursor_pos:
	push a 
	call send_csi 
	ld a,#'u 
	call putc 
	pop a 
	ret 

;---------------------------------
; move cursor to CPOS 
; input:
;   A     CPOS 
;---------------------------------
move_to_cpos:
	call restore_cursor_pos
	tnz a 
	jreq 9$ 
	call send_csi 
	call send_parameter
	ld a,#'C 
	call putc 
9$:	ret 

;----------------------------------
; change cursor shape according 
; to editing mode 
; input:
;   A      -1 block shape (overwrite) 
;           0 vertical line (insert)
; output:
;   none 
;-----------------------------------
cursor_style:
	tnz a 
	jrne 1$ 
	ld a,#'5 
	jra 2$
1$: ld a,#'1
2$:	
	call send_csi
	call putc 
	call space
	ld a,#'q 
	call putc 
	ret 

;--------------------------
; insert character in text 
; line 
; input:
;   A       character to insert 
;   XL      insert position  
;   XH     line length    
; output:
;   tib     updated
;-------------------------
 ; local variables 
	ICHAR=1 ; character to insert 
	LLEN=2  ; line length
	IPOS=3  ; insert position 
	VSIZE=3  ; local variables size 
insert_char: 
	_vars VSIZE 
    ld (ICHAR,sp),a 
	ldw (LLEN,sp),x 
	clr a 
	rrwa x ; A=IPOS , XL=LLEN, XH=0 
	ld a,xl  
	sub a,(IPOS,sp) 
	addw x,#tib 
	call move_string_right 
	ld a,(ICHAR,sp)
	ld (x),a
	_drop VSIZE  
	ret 

;------------------------------------
; read a line of text from terminal
;  control keys: 
;    BS   efface caractère à gauche 
;    ln+CTRL_E  edit line# 'ln'=line # 
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
; use:
;   Y point end of line  
; output:
;   text in tib  buffer
;   count  line length 
;------------------------------------
	; local variables
	RXCHAR = 1 ; last char received
	LL_HB=1  ; line length high byte 
	LL = 2  ; actual line length
	CPOS=3  ; cursor position 
	OVRWR=4 ; overwrite flag 
	YTEMP=5 ; 
	VSIZE=6 
readln::
	pushw y 
	_vars VSIZE 
	call save_cursor_pos
	clrw x 
	ldw (LL,sp),x 
	ldw (CPOS,sp),x 
	cpl (OVRWR,sp) ; default to overwrite mode 
 	ld a,(OVRWR,sp)
	call cursor_style
	jra skip_display 
readln_loop:
	call display_line
update_cursor:
	ld a,(CPOS,sp)
	call move_to_cpos   
skip_display: 
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
	ld a,(CPOS,sp)
	call delete_left
	cp a,(CPOS,sp)
	jreq 21$ 
	ld (CPOS,SP),a 
	dec (LL,sp)
21$:
    jp readln_loop 
3$:
	cp a,#CTRL_D
	jrne 4$
;delete line 
	clr a 
	ldw x,#tib 
	clr(x)
	clr (CPOS,sp)
	clr (LL,sp)
	jra readln_loop
4$:
	cp a,#CTRL_R 
	jrne 5$
;repeat line 
	tnz (LL,sp)
	jrne readln_loop
	ldw x,#tib 
	call strlen
	tnz a  
	jreq readln_loop
	ld (LL,sp),a 
    ld (CPOS,sp),a
	jra readln_loop 
5$:
	cp a,#CTRL_E 
	jrne 6$
;edit line number 
	ldw x,#tib 
	call atoi24
	clr a
	call search_lineno
	tnzw x 
	jrne 51$
	clr (LL,sp)
	clr (CPOS,sp)
	ldw x,#tib
    clr (x)
	jp readln_loop  
51$:
	ldw line.addr,x
	ld a,(2,x)
	_straz count 
	addw x,#LINE_HEADER_SIZE
	ldw basicptr,x 
	ldw y,x 
	ldw x,#tib 
	ld a,#BUFOUT 
	call set_output
	clr a 
	call decompile
	ld a,#STDOUT 
	call set_output 
    ldw x,#tib  
	call strlen 
	ld (LL,sp),a 
	ld (CPOS,sp),a 
	jp readln_loop
6$:
	cp a,#ARROW_RIGHT
   	jrne 7$ 
; right arrow
	ld a,(CPOS,sp)
    cp a,(LL,sp)
    jrmi 61$
    jp skip_display 
61$:
	inc (CPOS,sp)
    jp update_cursor  
7$: cp a,#ARROW_LEFT  
	jrne 8$
; left arrow 
	tnz (CPOS,sp)
	jrne 71$
	jp skip_display
71$:
	dec (CPOS,sp)
	jp update_cursor 
8$: cp a,#HOME  
	jrne 9$
; HOME 
	clr (CPOS,sp)
	call restore_cursor_pos
	jp skip_display  
9$: cp a,#KEY_END  
	jrne 10$
; KEY_END 
	ld a,(LL,sp)
	ld (CPOS,sp),a 
	jp update_cursor
10$: cp a,#CTRL_O
	jrne 11$ 
; toggle between insert/overwrite
	cpl (OVRWR,sp)
 	ld a,(OVRWR,sp)
	call cursor_style
	call beep_1khz
	jp skip_display
11$: cp a,#SUP 
    jrne final_test 
; del character under cursor 
    ld a,(CPOS,sp)
	cp a,(LL,sp)
	jrne 12$ 
	jp skip_display
12$:
	call delete_under
	dec (LL,sp)
    jp readln_loop 
final_test:
	cp a,#SPACE
	jrpl accept_char
	jp skip_display
accept_char:
	ld a,#TIB_SIZE-1
	cp a, (LL,sp)
	jrpl 1$
	jp skip_display ; max length reached 
1$:	tnz (OVRWR,sp)
	jrne overwrite
; insert mode 
    ld a,(CPOS,sp)
	cp a,(LL,sp)
	jreq overwrite
	clrw x 
    ld xl,a ; xl=cpos 
	ld a,(LL,sp)
	ld xh,a  ; xh=ll 
    ld a,(RXCHAR,sp)
    call insert_char 
    inc (LL,sp)
    inc (CPOS,sp)	
    jp readln_loop 
overwrite:
	clrw x 
	ld a,(CPOS,sp)
	ld xl,a 
	addw x,#tib 
	ld a,(RXCHAR,sp)
	ld (x),a
	call putc 
	ld a,(CPOS,sp)
	cp a,(LL,sp)
	jrmi 1$
	inc (LL,sp)
	clr (1,x) 
1$:	
	inc (CPOS,sp)
	jp skip_display 
readln_quit:
	ldw x,#tib
    clr (LL_HB,sp) 
    addw x,(LL_HB,sp)
    clr (x)
	ld a,(LL,sp)
	_straz count 
	ld a,#CR
	call putc
	_drop VSIZE 
 	ld a,#-1 
	call cursor_style
	popw y 
	ret

;--------------------------
; delete character under cursor
; and update display 
; input:
;   A      cursor position
;   Y      end of line pointer 
; output:
;   A      not change 
;   Y      updated 
;-------------------------
	CPOS=1
	VSIZE=1
delete_under:
	push A ; CPOS 
	clrw x 
	ld xl,a 
	addw x,#tib 
	ld a,(x)
	jreq 2$ ; at end of line  
	call move_string_left
2$: pop a
	ret 


;------------------------------
; delete character left of cursor
; and update display  
; input:
;    A    CPOS 
;    Y    end of line pointer 
; output:
;    A    updated CPOS 
;-------------------------------
delete_left:
	tnz a 
	jreq 9$ 
	push a 
	clrw x 
	ld xl,a  
	addw x,#tib
	decw x
	call move_string_left   
	pop a 
	dec a  
9$:	ret 

;-----------------------------
; move_string_left 
; move .asciz 1 character left 
; input: 
;    X    destination 
; output:
;    x    end of moved string 
;-----------------------------
move_string_left: 
1$:	ld a,(1,x)
	ld (x),a
	jreq 2$  
	incw x 
	jra 1$ 
2$: ret 

;-----------------------------
; move_string_right 
; move .asciz 1 character right 
; to give space for character 
; insertion 
; input:
;   A     string length 
;   X     *str_end 
; output:
;   X     *slot  
;------------------------------
move_string_right: 
	tnz a 
	jreq 9$
	inc a  
	push a
1$: ld a,(x)
	ld (1,x),a
	decw x  
	dec (1,sp)
	jrne 1$
	_drop 1
	incw x  
9$: ret 

;------------------------------
; display '>' on terminal 
; followed by edited line
;------------------------------
display_line:
	call erase_line  
; write edited line 	
	ldw x,#tib 
	call puts 
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

