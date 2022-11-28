;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  configuration parameters 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DEBUG=0 ; set to 1 to include debugging code 

SEPARATE=0 ; set to 1 for 'make separate' 


; boards list
; set selected board to 1  
NUCLEO_8S208RB=1
; use this to ensure 
; only one is selected 
.if NUCLEO_8S208RB 
NUCLEO_8S207K8=0
.else 
NUCLEO_8S207K8=1
.endif 

; NUCLEO-8S208RB config.
.if NUCLEO_8S208RB 
    .include "inc/stm8s208.inc" 
    .include "inc/nucleo_8s208.inc"
.endif  

; NUCLEO-8S207K8 config. 
.if NUCLEO_8S207K8 
    .include "inc/stm8s207.inc" 
    .include "inc/nucleo_8s207.inc"
.endif 

; all boards includes 

	.include "inc/ascii.inc"
	.include "inc/gen_macros.inc" 
	.include "tbi_macros.inc" 

