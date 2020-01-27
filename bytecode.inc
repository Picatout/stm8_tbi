;;
; Copyright Jacques Deschênes 2019 
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

    BYE=0
    SUBR=BYE+2
    EXIT=SUBR+2
    EXEC=EXIT+2
    BRANCH=EXEC+2
    ZBRANCH=BRANCH+2
    EMIT=ZBRANCH+2
    KEY=EMIT+2
    QKEY=KEY+2
    DOTQ=QKEY+2
    DELETE=DOTQ+2
    SPACES=DELETE+2
    PRTOS=SPACES+2
    LIT=PRTOS+2
    LITC=LIT+2
    FETCH=LITC+2
    CFETCH=FETCH+2
    STORE=CFETCH+2
    CSTORE=STORE+2
    ROT=CSTORE+2
    NROT=ROT+2
    DROP=NROT+2
    DUP=DROP+2
    SWAP=DUP+2
    OVER=SWAP+2
    NEG=OVER+2
    ZLT=NEG+2
    PLUS=ZLT+2
    MINUS=PLUS+2
    SLASH=MINUS+2
    MOD=SLASH+2
    STARU=MOD+2
    STAR=STARU+2
    DECIM=STAR+2
    HEXA=DECIM+2
    TICKS=HEXA+2
    ONEMINUS=TICKS+2
    ONEPLUS=ONEMINUS+2
    CELLPLUS=ONEPLUS+2 
    LSHIFT=CELLPLUS+2
    RSHIFT=LSHIFT+2 
    NOT=RSHIFT+2
    AND=NOT+2
    OR=AND+2
    XOR=OR+2 
    PICK=XOR+2
    PAUSE=PICK+2
    