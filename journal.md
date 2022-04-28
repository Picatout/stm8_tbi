#### 2022-04-27

*  Déboguer:
``` 
>? peek($A904), 
compile error, syntax error
? peek($A904), 
              ^
```
Le bogue était causé par une constante **COMMA** définie dans la commande **PRINT** du fichier [TinyBasic.asm](TinyBasic.asm) qui faisait interférence avec le même symbole utilisé dans [ascii.inc](ascii.inc)
j'ai renommé la constante de **PRINT**  **CCOMMA**. 
```
; dans PRINT variable locale 
;---------------------------------
; BASIC: PRINT|? arg_list 
; print values from argument list
;----------------------------------
	CCOMMA=1
	VSIZE=1
print:
```
```
; dans get_token du compiler.asm
; la valeur définie dans ascii.inc est attendue ici. 
comma_tst:
	_case COMMA sharp_tst 
	ld a,#TK_COMMA
	jp token_char
sharp_tst:

```
Correction testée.
```
Tiny BASIC for STM8
Copyright, Jacques Deschenes 2019,2022
version 1 .2 
running application in FLASH at address: $A904 
> ? char(peek($A900),char(peek($a901)
BC

>
```

*  Déboguer impression entier en base hexadecimal. Digit plus significatif manquant.

* Crétion du fichier [app.asm](app.asm) qui doit-être le dernier lié car l'étiquette **app_space:** doit-être localisé complètement à la fin du code binaire. 

* Réécriture du fichier [Makefile](Makefile)

* Tester et doboguer commande **ERASE**. 

* 9:39 commit 


* __NOTE:__ <br>Lorsqu'une application en FLASH est interrompue les pointeurs BASIC **txtbgn** et **txtend** demeurent inchangés donc la commande LIST affiche le programme en FLASH et 
  la commande **RUN** redémarre le programme en FLASH. Il faut faire la commande **NEW** pour ramener  **txtbgn** et **txtend** en mémoire RAM et pouvoir écrire un nouveau programme.


* Alignement des variables BASIC sur adresse 32 bits 
```
	.bndry 16 
vars:: .blkw 26 ; BASIC variables A-Z, keep it as but last .
```

#### 2022-04-26

* ajouter commandes **TORAM** et **TOFLASH**. 

* Ajout de la commande **ERASE** pour effacer la mémoire FLASH utilisateur.

* Modifié *Uart1RxHandler* pour enlever les macros *_led2_on* et *_led2_off*  qui étaient insérées au début et à la fin de la routine. 

* Supprimé  étiquette *user_space* indiquant la mémoire libre en flash après le système TinyBasic. Remplacé par 3 étiquettes. 
```
; space for user application  
app_space:
app_sign: .ascii "BC"  ; signature 
app_size:  .word 28
app: ; BASIC byte code for blink.bas application. 
; 10 do btogl $500a,32 pause 250 until qkey bres $500a,32 end 
.byte 0,10,28,128,0,38,128,0,20,132,80,10,9,132,0,32,128,0,96,132
.byte 0,250,128,0,178,129,0,128
```
Au démarrage la routine *cold_start*  vérifie s'il y a une application em mémoire flash et l'exécute si c'est le cas. sinon va à la ligne de commande.
```
; check for application in flash memory 
	ldw x,app_sign 
	cpw x,#0x4243
	jreq 3$
	jp cmd_line 
3$:	 
	ldw x,#app 
	ldw basicptr,x
	ldw txtbgn,x 
	ld a,(2,x)
	ld count,a 
	ld a,#3 
	ld in,a 
	ldw x,app_size 
	addw x,txtbgn 
	ldw txtend,x  
	jp interp_loop 
    jra .  
```
* La commande BASIC **UFLASH**  a étée modifiée pour tenir compte du nouvel arrangement. 

```
;-------------------------
; BASIC: UFLASH 
; return free flash address
; input:
;  none 
; output:
;	A		TK_INTGR
;   X 		free address 
;---------------------------
uflash:
	ldw x,app_sign
	cpw x,#4243 ; signature "BC" 
	jreq 1$
	ldw x,app_size 
	addw x,#app
	jra 2$
1$:	ldw x,#app_space 
2$:	ld a,#TK_INTGR 
	ret 
```

* Supprimé système de fichier dans mémoire flash étendue ainsi que le code associé et mis à jour [tib_reference.md](tbi_reference.md). 

* Modifié la routne *parse_keyword* dans [compiler.asm](compiler.asm) pour laisser tomber la commande **LET** qui et inutile. 
```
original:

4$:	
	ldw y,(XFIRST,sp)
	ld (y),a 
	incw y 
	ldw (y),x
	addw y,#2  
5$:	_drop VSIZE 
	ret  	

modifié:

4$:	
	ldw y,(XFIRST,sp)
	cpw x,#LET_IDX 
	jreq 5$ ; don't compile LET command.
	ld (y),a 
	incw y 
	ldw (y),x
	addw y,#2  
5$:	_drop VSIZE 
	ret  	

```


* Mise à jour du [manuel de référence](tbi_reference.md).

##### 2022-04-25 

* Création de la branche de développement **v2**.

* Modifié la valeur de **TK_COLON** de **1** à **0xb** dans [bit_macros.inc](tbi_macros.inc) pour supprimer un test dans *next_token*. La commande **INPUT** a été mmodifiée en conséquence.   

* Modifié *text_token* pour qu'il n'y est qu'un point de sortie à **9$:** 

* Modifié version information in [TinyBasic.asm](TinyBasic.asm).

* Modifié code in *next_token* in [TinyBasic.asm](TinyBasic.asm).
```
original:
6$: 
	addw y,in.w 
	ldw y,(y)
	cp a,#TK_INTGR
	jrpl 7$
    addw y,#code_addr
	ldw y,(y) 

modifié:
6$: 
	addw y,in.w 
	ldw y,(y)
	cp a,#TK_INTGR
	jrpl 7$
	ldw y,(code_addr,y) 
```

#### 2022-04-23 

* Modifié  **search_lineno**  le registe **A** détermine maintenant si la rechere débute au début du texte ou à partir de la ligne courante du programme.
    * Si A=0  cherche à partir de *txtbgn*. 
    * Si A=1  cherche a partir de la ligne où est rendu le compteur ordinal de la VM.
    
#### 2022-04-21

* Création d'un nouveau dépôt pour **stm8 TinyBASIC V2.0** 

* Objectifs:  
    * Améliorer la performance ce l'interpréteur en modifiant le format du bytecode. Comme en Forth chaque token sera associé à un code machine exécutable. Le compilateur va convertir le texte source en format RPN (Reverse Polish Notation) pour améliorer la performance. Cependant contrairement à une machine virtuelelle Forth il n'y aura qu'une seule pile soit celle pointée par **SP** du STM8. Le jeu d'instruction du STM8 étant optimisé pour effecter les opérations ALU entre la pile et les registres **A**,**X** et **Y**.

    * Réduire la taille du code idéalement à moins de 8Ko. 

* La communication se fera par terminal en utilisant le USART1 que tous les MCU STM8 possèdent.

* Le USART3 ne sera pas utilisé. Le code a été supprimé dans [TinyBasic.asm](TinyBasic.asm).

* Modifié **itoa** pour inclure un espace après l'entier.
