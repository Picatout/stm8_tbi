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
    .module PROC_TABLE 
    .include "config.inc"

    .area CODE 
.endif 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  table of code routines 
;; used by virtual machine 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.macro _code_entry proc_address,token_name    
	.word proc_address
	token_name =TOK_IDX 
	TOK_IDX=TOK_IDX+1 
	.endm 

	TOK_IDX=0
code_addr:
; command end marker  
	_code_entry next_line, EOL_IDX  ; $0 
	_code_entry do_nothing, COLON_IDX   ; $1 ':'
    CMD_END = TOK_IDX-1 
; caractères délimiteurs 
    _code_entry syntax_error, COMMA_IDX ; $2  ',' 
	_code_entry syntax_error,SCOL_IDX  ; $3 ';' 
	_code_entry syntax_error, LPAREN_IDX ; $4 '(' 
	_code_entry syntax_error, RPAREN_IDX ; $5 ')' 
	_code_entry syntax_error, QUOTE_IDX  ; $6 '"' 
    DELIM_LAST=TOK_IDX-1 
; literal values 
	_code_entry syntax_error,LIT_IDX   ; $7  24 bits integers literal 
    _code_entry syntax_error,LITW_IDX  ; $8 16 bits literal 
    _code_entry syntax_error,LNADR_IDX ; $9 line address literal 
    LIT_LAST=TOK_IDX-1 
; variable identifiers  
	_code_entry syntax_error,VAR_IDX    ; $B 
	_code_entry syntax_error,ARRAY_IDX  ; $C
	_code_entry jump_label,LABEL_IDX  ; $D  
    SYMB_LAST=TOK_IDX-1 
; arithmetic operators      
	_code_entry syntax_error, ADD_IDX   ; $E 
	_code_entry syntax_error, SUB_IDX   ; $F
	_code_entry syntax_error, DIV_IDX   ; $10 
	_code_entry syntax_error, MOD_IDX   ; $11
	_code_entry syntax_error, MULT_IDX  ; $12 
    OP_ARITHM_LAST=TOK_IDX-1 
; relational operators
	_code_entry syntax_error,REL_LE_IDX  ; $13 
	_code_entry syntax_error,REL_EQU_IDX ; $14  
	_code_entry syntax_error,REL_GE_IDX  ; $15 
	_code_entry syntax_error,REL_LT_IDX  ; $16 
	_code_entry syntax_error,REL_GT_IDX  ; $17 
	_code_entry syntax_error,REL_NE_IDX  ; $18 
    OP_REL_LAST=TOK_IDX-1 
; boolean operators 
    _code_entry syntax_error, NOT_IDX    ; $19
    _code_entry syntax_error, AND_IDX    ; $1A 
    _code_entry syntax_error, OR_IDX     ; $1B 
    _code_entry syntax_error, XOR_IDX    ; $1C
    BOOL_OP_LAST=TOK_IDX-1 
; keywords 
    _code_entry kword_const, CONST_IDX   ; $1D
    _code_entry kword_data, DATA_IDX     ; $1E 
    _code_entry kword_dim, DIM_IDX       ; $1F 
    _code_entry kword_do, DO_IDX         ; $20 
    _code_entry kword_end, END_IDX       ; $21 
    _code_entry kword_for, FOR_IDX       ; $22
    _code_entry kword_gosub, GOSUB_IDX   ; $23 
    _code_entry kword_goto, GOTO_IDX     ; $24 
    _code_entry kword_if, IF_IDX         ; $25 
    _code_entry kword_let, LET_IDX       ; $26 
    _code_entry kword_next, NEXT_IDX     ; $27 
    _code_entry kword_on, ON_IDX         ; $28 
	_code_entry kword_remark, REM_IDX    ; $29 
    _code_entry kword_return, RET_IDX    ; $2A
    _code_entry syntax_error, STEP_IDX   ; $2B 
    _code_entry kword_stop, STOP_IDX     ; $2C
    _code_entry syntax_error, TO_IDX     ; $2D
    _code_entry kword_until, UNTIL_IDX   ; $2E
    KWORD_LAST=TOK_IDX-1 
; constant functions 
    _code_entry const_cr1, CR1_IDX      ; $2F 
    _code_entry const_cr2, CR2_IDX      ; $30
    _code_entry const_ddr, DDR_IDX      ; $31 
    _code_entry const_eeprom_base, EEPROM_IDX ; $32
    _code_entry const_idr, IDR_IDX      ; $33
    _code_entry const_odr, ODR_IDX      ; $34
    _code_entry const_pad_ref, PAD_IDX  ; $35 
    _code_entry const_pmode_input, PINP_IDX ; $36 
    _code_entry const_pmode_output, POUT_IDX ; $37
    _code_entry const_porta, PORTA_IDX   ; $38
    _code_entry const_portb, PORTB_IDX   ; $39
    _code_entry const_portc, PORTC_IDX   ; $3A
    _code_entry const_portd, PORTD_IDX   ; $3B
    _code_entry const_porte, PORTE_IDX   ; $3C
    _code_entry const_portf, PORTF_IDX   ; $3D 
    _code_entry const_portg, PORTG_IDX   ; $3E
    _code_entry const_porti, PORTI_IDX   ; $3F
    FUNC_CONST_LAST=TOK_IDX-1 
; functions 
	_code_entry func_back_slash, BSLASH_IDX ; $40 caractère oblique gauche 
	_code_entry func_abs, ABS_IDX         ; $41
    _code_entry func_analog_read, ADCREAD_IDX ; $42
    _code_entry func_ascii, ASC_IDX         ; $43
    _code_entry func_bit_test, BTEST_IDX    ; $44
    _code_entry func_char, CHAR_IDX         ; $45 
    _code_entry func_digital_read, DREAD_IDX ; $46 
    _code_entry func_eefree, EEFREE_IDX     ; $47
    _code_entry func_free, FREE_IDX         ; $48 
	_code_entry func_i2c_read,I2C_READ_IDX  ; $49 
    _code_entry func_key, KEY_IDX           ; $4A
    _code_entry func_log2, LOG2_IDX         ; $4B
    _code_entry func_lshift, LSHIFT_IDX     ; $4C 
    _code_entry func_peek, PEEK_IDX         ; $4D 
;    _code_entry func_pwm_done,PWM_DONE_IDX 
    _code_entry func_qkey, QKEY_IDX         ; $4E
    _code_entry func_read_data, READ_IDX    ; $4F
    _code_entry func_random, RND_IDX        ; $50 
    _code_entry func_rshift, RSHIFT_IDX     ; $51 
.if NUCLEO_8S208RB
    _code_entry func_spi_read, SPIRD_IDX    ; $52 
.endif 
    _code_entry func_ticks, TICKS_IDX       ; $53 
    _code_entry func_timeout, TIMEOUT_IDX   ; $54 
    _code_entry func_ubound, UBOUND_IDX     ; $55 
    _code_entry func_uflash, UFLASH_IDX     ; $56 
    _code_entry func_usr, USR_IDX           ; $57
    FUNC_LAST=TOK_IDX-1                     
; commands 
    _code_entry cmd_power_adc,ADCON_IDX     ; $5A adc on 
    _code_entry cmd_awu, AWU_IDX            ; $5C
    _code_entry cmd_bit_reset, BRES_IDX     ; $5D
    _code_entry cmd_bit_set, BSET_IDX       ; $5E
    _code_entry cmd_bit_toggle, BTOGL_IDX   ; $5F
    _code_entry cmd_alloc_buffer, BUFFER_IDX ; $60
    _code_entry cmd_bye, BYE_IDX            ; $61
    _code_entry cmd_chain, CHAIN_IDX        ; $62
    _code_entry cmd_dec_base, DEC_IDX       ; $63
    _code_entry cmd_dir, DIR_IDX            ; $64
    _code_entry cmd_digital_write, DWRITE_IDX ; $65
    _code_entry cmd_edit, EDIT_IDX          ; $66
    _code_entry cmd_erase, ERASE_IDX        ; $67
    _code_entry cmd_fcpu, FCPU_IDX          ; $68
    _code_entry cmd_get, GET_IDX            ; $69
    _code_entry cmd_hex_base, HEX_IDX       ; $6A
	_code_entry cmd_i2c_close,I2C_CLOSE_IDX ; $6B
    _code_entry cmd_i2c_error,I2C_ERROR_IDX  ; $6C
	_code_entry cmd_i2c_open,I2C_OPEN_IDX   ; $6D
	_code_entry cmd_i2c_write,I2C_WRITE_IDX ; $6E
    _code_entry cmd_input_var, INPUT_IDX    ; $6F
.if WANT_IWDG
    _code_entry cmd_iwdg_enable, IWDGEN_IDX ; $70
    _code_entry cmd_iwdg_refresh, IWDGREF_IDX ; $71
.endif 
    _code_entry cmd_list, LIST_IDX          ; $72
    _code_entry cmd_new, NEW_IDX            ; $73
    _code_entry cmd_pause, PAUSE_IDX        ; $74
    _code_entry cmd_pin_mode, PIN_MODE_IDX  ; $75
    _code_entry cmd_poke, POKE_IDX          ; $76
   	_code_entry cmd_print, PRINT_IDX        ; $77
    _code_entry cmd_randomize,RNDMZ_IDX     ; 
    _code_entry cmd_save, SAVE_IDX          ; $7B
    _code_entry cmd_pwm_chan_enable, PWM_CHAN_EN_IDX 
    _code_entry cmd_pwm_enable, PWM_EN_IDX 
    _code_entry cmd_pwm_out, PWM_OUT_IDX 
    _code_entry cmd_reboot, RBT_IDX         ; $78
    _code_entry cmd_restore, REST_IDX       ; $79
    _code_entry cmd_run, RUN_IDX            ; $7A
    _code_entry cmd_save, SAVE_IDX          ; $7B
    _code_entry cmd_servo_chan_enable, SERVO_CHAN_EN_IDX 
    _code_entry cmd_servo_enable, SERVO_EN_IDX 
    _code_entry cmd_servo_position, SERVO_POS_IDX 
    _code_entry cmd_size, SIZE_IDX          ; $7C
    _code_entry cmd_sleep, SLEEP_IDX        ; $7D
.if NUCLEO_8S208RB
    _code_entry cmd_spi_enable, SPIEN_IDX   ; $7E
    _code_entry cmd_spi_select, SPISEL_IDX  ; $7F
	_code_entry cmd_spi_write, SPIWR_IDX    ; $80
.endif 
    _code_entry cmd_set_timer, TIMER_IDX    ; $81
    _code_entry cmd_tone, TONE_IDX          ; $82
	_code_entry cmd_trace, TRACE_IDX        ; $83
    _code_entry cmd_wait, WAIT_IDX          ; $84
    _code_entry cmd_words, WORDS_IDX        ; $85
    _code_entry cmd_write, WRITE_IDX        ; $86
.if NUCLEO_8S208RB+SB5_SHORT  
    _code_entry cmd_clock_hsi, CLK_HSI_IDX 
    _code_entry cmd_clock_hse, CLK_HSE_IDX 
.endif 
    CMD_LAST=TOK_IDX-1
