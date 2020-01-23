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
    SUBR=BYE+1
    EXIT=SUBR+1
    EXEC=EXIT+1
    BRANCH=EXEC+1
    ZBRANCH=BRANCH+1
    EMIT=ZBRANCH+1
    KEY=EMIT+1
    QKEY=KEY+1
    DOTQ=QKEY+1
    DELETE=DOTQ+1
    SPACES=DELETE+1
    PRTOS=SPACES+1
    LIT=PRTOS+1
    LITC=LIT+1
    FETCH=LITC+1
    CFETCH=FETCH+1
    STORE=CFETCH+1
    CSTORE=STORE+1
    ROT=CSTORE+1
    NROT=ROT+1
    DROP=NROT+1
    DUP=DROP+1
    SWAP=DUP+1
    OVER=SWAP+1
    NEG=OVER+1
    ZLT=NEG+1
    PLUS=ZLT+1
    MINUS=PLUS+1
    SLASH=MINUS+1
    MOD=SLASH+1
    STARU=MOD+1
    STAR=STARU+1
    DECIM=STAR+1
    HEXA=DECIM+1
