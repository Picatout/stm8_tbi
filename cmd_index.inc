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

    ABS_IDX=0     ; absolute function
    ADCON_IDX=1<<1   ;  adc on 
    ADCREAD_IDX=2<<1
    AND_IDX=3<<1     ;
    ASC_IDX=4<<1     ;
    AUTORUN_IDX=5<<1
    AWU_IDX=6<<1
    BIT_IDX=7<<1
    BRES_IDX=8<<1
    BSET_IDX=9<<1
    BTEST_IDX=10<<1
    BTOGL_IDX=11<<1
    BYE_IDX=12<<1
    CHAR_IDX=13<<1
    CRH_IDX=14<<1
    CRL_IDX=15<<1
    DATA_IDX=16<<1
    DATALN_IDX=17<<1
    DDR_IDX=18<<1
    DEC_IDX=19<<1
    DIR_IDX=20<<1
    DO_IDX=21<<1
    DREAD_IDX=22<<1
    DWRITE_IDX=23<<1
    END_IDX=24<<1
    EEPROM_IDX=25<<1
    FCPU_IDX=26<<1
    FOR_IDX=27<<1
    FORGET_IDX=28<<1
    GOSUB_IDX=29<<1
    GOTO_IDX=30<<1
    GPIO_IDX=31<<1
    HEX_IDX=32<<1
    IDR_IDX=33<<1
    IF_IDX=34<<1
    INPUT_IDX=35<<1
    INVERT_IDX=36<<1
    IWDGEN_IDX=37<<1
    IWDGREF_IDX=38<<1
    KEY_IDX=39<<1
    LET_IDX=40<<1
    LIST_IDX=41<<1
    LOAD_IDX=42<<1
    LOG_IDX=43<<1
    LSHIFT_IDX=44<<1
    MULDIV_IDX=45<<1
    NEXT_IDX=46<<1
    NEW_IDX=47<<1
    NOT_IDX=48<<1
    ODR_IDX=49<<1
    OR_IDX=50<<1
    PAD_IDX=51<<1
    PAUSE_IDX=52<<1
    PMODE_IDX=53<<1
    PEEK_IDX=54<<1
    PINP_IDX=55<<1
    POKE_IDX=56<<1
    POUT_IDX=57<<1
   	PRT_IDX=58<<1 ; PRINT commande index 
    PRTA_IDX=59<<1
    PRTB_IDX=60<<1
    PRTC_IDX=61<<1
    PRTD_IDX=62<<1
    PRTE_IDX=63<<1
    PRTF_IDX=64<<1
    PRTG_IDX=65<<1
    PRTH_IDX=66<<1
    PRTI_IDX=67<<1
    QKEY_IDX=68<<1
    READ_IDX=69<<1
    RBT_IDX=70<<1  ; REBOOT
	REM_IDX=71<<1 ; REMARK command index 
    REST_IDX=72<<1 ; RESTORE
    RET_IDX=73<<1  ; RETURN 
    RND_IDX=74<<1 ; RANDOM 
    RSHIFT_IDX=75<<1
    RUN_IDX=76<<1
    SAVE_IDX=77<<1
    SHOW_IDX=78<<1
    FREE_IDX=79<<1
    SLEEP_IDX=80<<1
    SPIRD_IDX=81<<1
    SPIEN_IDX=82<<1
    SPISEL_IDX=83<<1
    SPIWR_IDX=84<<1
    STEP_IDX=85<<1
    STOP_IDX=86<<1
    TICKS_IDX=87<<1
    TIMER_IDX=88<<1
    TMROUT_IDX=89<<1  ; TIMEOUT
    TO_IDX=90<<1
    TONE_IDX=91<<1
    UBOUND_IDX=92<<1
    UFLASH_IDX=93<<1
    UNTIL_IDX=94<<1
    USR_IDX=95<<1
    WAIT_IDX=96<<1
    WORDS_IDX=97<<1
    WRITE_IDX=98<<1
    XOR_IDX=99<<1 
