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

;---------------------------------------
; BASIC command and functions indexes
; for addressing 'code_addr' table
;--------------------------------------

    ABS_IDX=0        ; absolute function
    ADCON_IDX=ABS_IDX+2   ;  adc on 
    ADCREAD_IDX=ADCON_IDX+2
    AND_IDX=ADCREAD_IDX+2     ;
    ASC_IDX=AND_IDX+2     ;
    AWU_IDX=ASC_IDX+2 
    BIT_IDX=AWU_IDX+2
    BRES_IDX=BIT_IDX+2
    BSET_IDX=BRES_IDX+2
    BTEST_IDX=BSET_IDX+2
    BTOGL_IDX=BTEST_IDX+2
    BYE_IDX=BTOGL_IDX+2
    CHAR_IDX=BYE_IDX+2
    CRH_IDX=CHAR_IDX+2
    CRL_IDX=CRH_IDX+2
    DATA_IDX=CRL_IDX+2
    DATALN_IDX=DATA_IDX+2
    DDR_IDX=DATALN_IDX+2
    DEC_IDX=DDR_IDX+2
    DO_IDX=DEC_IDX+2
    DREAD_IDX=DO_IDX+2
    DWRITE_IDX=DREAD_IDX+2
    EDIT_IDX=DWRITE_IDX+2
    EEPROM_IDX=EDIT_IDX+2
    END_IDX=EEPROM_IDX+2
    ERASE_IDX=END_IDX+2
    FCPU_IDX=ERASE_IDX+2
    SAVE_IDX=FCPU_IDX+2
    FOR_IDX=SAVE_IDX+2
    GOSUB_IDX=FOR_IDX+2
    GOTO_IDX=GOSUB_IDX+2
    GPIO_IDX=GOTO_IDX+2
    HEX_IDX=GPIO_IDX+2
    IDR_IDX=HEX_IDX+2
    IF_IDX=IDR_IDX+2
    INPUT_IDX=IF_IDX+2
    INVERT_IDX=INPUT_IDX+2
    IWDGEN_IDX=INVERT_IDX+2
    IWDGREF_IDX=IWDGEN_IDX+2
    KEY_IDX=IWDGREF_IDX+2
    LET_IDX=KEY_IDX+2
    LIST_IDX=LET_IDX+2
    LOG_IDX=LIST_IDX+2
    LSHIFT_IDX=LOG_IDX+2
    MULDIV_IDX=LSHIFT_IDX+2
    NEXT_IDX=MULDIV_IDX+2
    NEW_IDX=NEXT_IDX+2
    NOT_IDX=NEW_IDX+2
    ODR_IDX=NOT_IDX+2
    OR_IDX=ODR_IDX+2
    PAD_IDX=OR_IDX+2
    PAUSE_IDX=PAD_IDX+2
    PMODE_IDX=PAUSE_IDX+2
    PEEK_IDX=PMODE_IDX+2
    PINP_IDX=PEEK_IDX+2
    POKE_IDX=PINP_IDX+2
    POUT_IDX=POKE_IDX+2
   	PRT_IDX=POUT_IDX+2 ; PRINT commande index 
    PRTA_IDX=PRT_IDX+2
    PRTB_IDX=PRTA_IDX+2
    PRTC_IDX=PRTB_IDX+2
    PRTD_IDX=PRTC_IDX+2
    PRTE_IDX=PRTD_IDX+2
    PRTF_IDX=PRTE_IDX+2
    PRTG_IDX=PRTF_IDX+2
    PRTH_IDX=PRTG_IDX+2
    PRTI_IDX=PRTH_IDX+2
    QKEY_IDX=PRTI_IDX+2
    READ_IDX=QKEY_IDX+2
    RBT_IDX=READ_IDX+2  ; REBOOT
	REM_IDX=RBT_IDX+2 ; REMARK command index 
    REST_IDX=REM_IDX+2 ; RESTORE
    RET_IDX=REST_IDX+2  ; RETURN 
    RND_IDX=RET_IDX+2 ; RANDOM 
    RSHIFT_IDX=RND_IDX+2
    RUN_IDX=RSHIFT_IDX+2
    SHOW_IDX=RUN_IDX+2
    FREE_IDX=SHOW_IDX+2
    SLEEP_IDX=FREE_IDX+2
    SPIRD_IDX=SLEEP_IDX+2
    SPIEN_IDX=SPIRD_IDX+2
    SPISEL_IDX=SPIEN_IDX+2
    SPIWR_IDX=SPISEL_IDX+2
    STEP_IDX=SPIWR_IDX+2
    STOP_IDX=STEP_IDX+2
    TICKS_IDX=STOP_IDX+2
    TIMER_IDX=TICKS_IDX+2
    TMROUT_IDX=TIMER_IDX+2  ; TIMEOUT
    TO_IDX=TMROUT_IDX+2
    TONE_IDX=TO_IDX+2
    UBOUND_IDX=TONE_IDX+2
    UFLASH_IDX=UBOUND_IDX+2
    UNTIL_IDX=UFLASH_IDX+2
    USR_IDX=UNTIL_IDX+2
    WAIT_IDX=USR_IDX+2
    WORDS_IDX=WAIT_IDX+2
    WRITE_IDX=WORDS_IDX+2
    XOR_IDX=WRITE_IDX+2
    SIZE_IDX=XOR_IDX+2 
    ON_IDX=SIZE_IDX+2 
    GET_IDX=ON_IDX+2 
        

