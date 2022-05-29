#### 2022-05-28

* 22:13 commit.

* Corrigé bogue and *mul24*  **N2** n'était pas sauvegardé sur la pile lorsque positif. Réécris *mulu24_8*.

#### 2022-05-27

* bogue
```
>? 1000*1000
run time error, overflow

$16B8   $0  $0  $F $80  $0 $64 $84  $0  $3 $E8 $20 $84  $0  $3 $E8
    0 PRINT 1000*1000
last token id:   48
>
```

* Modifié la fonction **UFLASH** pour alignée l'adresse sur un bloc de 128 octets.

* Corrigé bogue dans fonction **UBOUND** 
```
>new

>? ubound
 696 

>NEW

>5  ' ce programme joue la gamme. 

>10 @(1)= 440 :@(2)= 466 :@(3)= 494 :@(4)= 523 :@(5)= 554 :@(6)= 587 

>20 @(7)= 622 :@(8)= 659 :@(9)= 698 :@(10)= 740 :@(11)= 784 :@(12)=831 

>30 FOR I = 1 TO  12 :TONE @(I ), 200 :NEXT I 

>

>? ubound
 747 

>
```

* Corrigé bogue dans **TIMEOUT** qui retournait toujours **-1**.

* Corrigé bogue dans routine *get_token*  qui affectait le listing. Les commentaires débutant par le mot **REM** n'étaient pas listé correctement alors que ceux débutant par un apostrophe l'était. 

```
>10 rem ceci est un commentaire 

>li
   10 'CECI
program address:  $80, program size:   33 bytes in RAM memory

```

* Renommé les constantes système **CRH** et **CRL** en **CR1**,**CR2**.

* Renommé la fonction **LOG** en **LOG2**. 

* Suppression de la fonction **INVERT** qui faisait la même chose que l'opérateur **NOT**. 

* Modifié **IF** et **UNTIL** pour tester les 3 octets pour la nullité. 

* Travail de mise à jousr du fichier [tbi_reference.md](tbi_reference.md).

#### 2022-05-26

* 22:28  commit 

* bogue:  
```
>pmode 5,pinp

>? dread(5)
run time error, division by 0

$16B8   $0  $0  $F $80  $0 $66 $81  $0 $24  $6 $84  $0  $0  $5  $7
    0 PRINT DREAD(5)
last token id:   80
>

```
Le bogue était dans la routine *pin_mode* qui écrasait le registre **Y** qui doit-être préservé en tout temps car il est le pointeur pour *xstack*.


* Travail de mise à jousr du fichier [tbi_reference.md](tbi_reference.md).

* Réparé bogue dans **READ** et **RESTORE**. Réécriture des routines.

```
>NEW

>5 ' joue 4 mesures de l'hymne a la joie

>10 RESTORE 

>20 DATA 440,250,440,250,466,250,523,250,523,250,466,250,440,250

>30 DATA 392,250,349,250,349,250,392,250,440,250,440,375,392,125

>40 DATA 392,500

>50 FOR I =1 TO 15 ? i,: TONE READ ,READ :NEXT I 

>60 END 

>

>run
Registers state at abort point.
--------------------------
EPC:  32
X:$5B7E (23422)
Y: $9A ( 154)
A: $4D (  77)
CC:  $1 (   1)
SP:$17DB (6107)

?

```

<hr>

* la fonction **NOT(_expr_)** a été remplacée par un opérateur unaire qui a la priorité sur l'opérateur **AND**.

* Réparé bogue dans la commande **WORDS** qui rendait le système inopérand. le registre **Y** n'était pas préservé.  

```
>a=2 ? a
   2 

>b=4 ? b
   4 

>if a>=2 and b<=4 ? a,b 
   2    4 

>words
ABS ADCON ADCREAD AND ASC AWU BIT BRES BSET BTEST BTOGL BYE CHAR CONST CRH
CRL DATA DDR DEC DO DREAD DWRITE EDIT EEFREE EEPROM END ERASE FCPU FOR FREE
GET GOSUB GOTO HEX IDR IF INPUT INVERT IWDGEN IWDGREF KEY LET LIST LOG LSHIFT
NEW NEXT NOT ODR ON OR PAD PAUSE PEEK PINP PMODE POKE POUT PRINT PORTA PORTB
PORTC PORTD PORTE PORTF PORTG PORTH PORTI QKEY READ REBOOT REM RESTORE RETURN
RND RSHIFT RUN SAVE SIZE SLEEP SPIEN SPIRD SPISEL SPIWR STEP STOP TICKS
TIMEOUT TIMER TO TONE UBOUND UFLASH UNTIL USR WAIT WORDS WRITE XOR 
  99 words in dictionary

>? a b
   0    0 

>a=2 ?a
   0 

>
```


* Travail de mise à jousr du fichier [tbi_reference.md](tbi_reference.md).

<hr>

* 16:38 merge V2 à master 

* commit 1637 

* Corrigé bogue dans *cmd_const*  lorsqu'on utilise l'option *\U*  la variable *free_eeprom* était incrémentée même s'il ne s'agissait pas d'une nouvelle constante.
```
	call write_nbytes
	tnz (UPDATE,sp)
	jrne 8$ ; not a new constant, don't update free_eeprom
; update free_eeprom 
```

* Corrigé bogue dans le decompiler. l'ordre des addresses dans *relop_str* était incorrect. Le bon ordre est. 
```
relop_str: .word gt,equal,ge,lt,ne,le 
```

* Corrigé bogue dans **INPUT**.  Le saut conditionnel *jrne 22$* avait été oublié après le cp a,#TK_MINUS .


* Corrigé bogue CTRL+R qui ne fonctionnait pas dans l'édition de ligne. Un test sur la valeur de **A** avait été oublié. Bogue présent dans version 1.1.


* Bogue dans *readln*
	
	* le mode insertion fait planté le système.  Localisé bogue dans *insert_char* 
	* Trouvé le bogue, une erreur de nom de VSISE au lieu de VSIZE en entête de routine. Vérification faite le bogue était déjà présent dans la version 1.1

```
	IPOS=1
	KCHAR=2 
    LLEN=3 
	VSISE=3 
insert_char: 

```



* Corrigé bogue dans *parse_binary*.

* Travail de mise à jousr du fichier [tbi_reference.md](tbi_reference.md)

* Suppression de la fonction **GPIO** puisque l'expression **PORTx+reg** retourne la même valeur.

```
>? gpio(portc,idr)
20491 

>? portc+idr
20491 

>
```

#### 2022-05-25

* commit 20:06

*  Modifié  *parse_keyword*,*decompile* et *arg_list* pour tenir compte de la nouvelle structure.

*  Modifié la structure du dictionnaire pour unifié les 2 dictionnaires *op_dict* et *kw_dict*

	* noms *keyword* et *étiquettes* limités à 15 charactères pour donner un bit de plus au champ *keyword type*. 

	* Ajouté '.' et '_'  dans l'alphabet des noms 

<hr>

* commit 11:22,  binary size: 13956 bytes 

* Travail sur les opérateurs AND|OR|XOR complété.

	* Ajouter routine *and_factor*, *and_term*  

	* priorité des opérateurs   AND a la précédence sur OR et XOR qui ont la même précédence. 

	* Les opérateurs de précédenc

#### 2022-05-24

* Commit 

* Début de la transformation des fonctions AND,OR et XOR en opérateurs. 
	
	* Création de la routine *condition*. 
	
	* Modification de la routine *parse_keyword*.

	* Création du dictionnaire *op_dict*. 

	* Création de la routine *search_op_dict*.
	

* Corrigé bogue dans *arg_list*

* commit 

* Corrigé bogue dans *arg_list*

* Corrigé bogue dans **PRINT**, *relation* et *cp24*. Réécris *cp24_ax*

#### 2022-05-23

* bogue 
```
>a=1 do ? a, a=a+1 pause 100 until a>15
   1    1 

>

```

* Réparé bogue dans *cp24*. 

* Réparé bogue dans **RESTORE** et **READ**. 

* Réparé bogue dans **NEXT** et modifié code dans **STEP** pour décrémenter la limite lorsque *step* est négatif. 

* Réparé bogue dans **RND**. Appellais *div24* au lieu de *mod24*.   euh!!!!

#### 2022-05-22

* Travail sur **RND**  ne semble pas correct. 

* Renommé  *cp24* en *cp24_ax* et créé *cp24*. 

* Corrigé bogue dans **PEEK**, utilisati une instruction *ld a,(x)* ce qui ne permettait pas de lire la mémoire flash au delà de $ffff.

* Corrigé bogue dans *do_loop*. Utilisait le registre y au lieu de x.

* Renommé PRTA..PRTI en PORTA..PORTI. Maintenant retourne l'adresse de base plutôt que l'index dans le tableau. 

* Ajouté un CRLF après chaque constante dans *list_const*.

* variable *ticks* passée à 24 bits. 

* Corrigé bogue dans *mul24*. la variable locale *PROD* n'était pas initialsée à 0 avant d'effectuer la multiplication. Ce qui donnait:
```
>? 4*0
5828

>? 0*4
   0 
``` 

* Éliminé comamnde BASIC **SHOW**.

* Corrigé bogue dans *cmd_const* 

* Corrigé bogue dans *factor*


#### 2022-05-21

* Corrigé bogue dans *mul24* et *div24* du fichier [arithm24.asm](arithm24.asm).

* bogue dans expression:
```
>? (4*-3)
   0 

>? 4*-3
   0 

>? 4*(-3)
   0 

>? (-3)*4
  -3 

>
```

* Corrigé bogue dans commande **INPUT**.

bogue à corrigé, programme est  [on.bas](BASIC/on.bas)
```
>run
testing ON expr GOTO line#,line#,...
select 1-4
run time error, syntax error

 $AC   $0  $7 $15 $80  $0 $44  $2 $73
    7 INPUT "select 1-4"A
last token id:    0
>
```

* Corrigé bogue dans routine *factor*. ne reconnaissait pas les nombres négatifs.

* Corrigé *skip_string* 

* corrigé bogue dans *inerp_loop* 

#### 2022-05-20

* bogue 
```
>? invert(-171)
run time error, syntax error

>? invert(171)
-172

>? -171

run time error, syntax error
```
#### 2022-05-19

* Modification de *next_token* pour simplifier et améliorer la performance. Maintenant retourne seulement la constant TK_ID dans A et l'adresse de sa valeur dans X. La récupération de la valeur et la mise à jour de **in.w** est à la charge du client. 

* conversion rendue à **LOG**. 

* Bogue  

#### 2022-05-18

* Création du fichier [arithm24.asm](arithm24.asm) transféré les routines arithmétiques sur entier 24 bits dans ce fichier. 

* Écris et testé  routine *div24*. 

* Transféré opération arithmétiques 16/32 bits dans [arithm16.asm](arithm16.asm).

* Débuter la transformation du code pour opérer avec des entiers 24 bits. 

	* Ajout d'une pile pour les expressions.  *xstack*  avec la variable pointeur *xsp* pour cette pile.


#### 2022-05-17

* Réécriture de la sous-routine  *mulu24_8* dans [TinyBasic.asm](TinyBasic.asm). 

* Travail sur test arithmétique sur entiers 24 bits [test.asm](test.asm)

#### 2022-05-15

* Modification de *itoa* dans [TinyBasic.asm](TinyBasic.asm). 
	
	* Enlevé espace à la fin de la chaîne.

	* Ajouté paramètre d'entrée dans A pour convesion signée **A&lt;&gt;0** ou non signée **A=0**. 

#### 2022-05-13 

* Création du fichier [float.asm](float.asm) dans le but d'ajouter les opérations arithmétiques sur le type float32 au format [IEEE-754](https://fr.wikipedia.org/wiki/IEEE_754).

#### 2022-05-11

* 8:30   la branche V2 a été fusionné à la branche master.  Retour à la branche V2 pour le développement.


#### 2022-05-10

* Mettre à jour [tbi_reference.md](tbi_reference.md). 


*  Modifié commmande **LIST** pour accepter l'argument optionel **\C** qui affiche la liste des constantes en EEPROM plutôt que le programme. 

*  Modifié  **CONST** pour accepter l'argument **\U** qui permet la mise à jour d'une constante. Sans cette option si la constante exite déjà la commande est ignorée. l'indicateur booléen **FUPDATE** a été ajouté dans la variable sytème *flags*. 


*  Ajouter sous-routine *get_const_value* 

*  Modifié routine *factor* pour accepter les *TK_LABEL*. 

#### 2022-05-09

* À faire:  Modifié le compilateur pour qu'il remplace les TK_LABEL qui sont des constantes par leur valeur. 

* Création des fichiers [dbg_macros.inc](dbg_macros.inc) et [debug.asm](debug.asm).  

* Débogué commande **CONST** . 

*  Debogué  *search_const*. 

* Modifié *next_token* qui maintenant saute par dessus la chaîne des **TK_LABEL* et renvoie le pointeur sur la chaîne dans X. *skip_label* devenu inutile a été supprimé. *Décompile*, *interp_loop* ont étés modifié pour tenir compte de la modification à TK_LABEL 

#### 2022-05-08

* Ajout de la commande **CONST** qui permet de définir des constantes qui sont sauvegardées dans la mémoire EEPROM.

#### 2022-05-07

* bogue dans *decompile*  opérateur **&lt;&gt;** décompilé comme **&lt;=**. 

* Corrigé bogue dans *next_token*. Lorsque qu'un TK_NONE était retourné et que la routine appellante faisait un *_unget_token* le programme entrait dans une boucle infinie. J'ai déplacé la sauvegarde  avant le test de
fin de ligne. 

original:
```
next_token::
	clrw x 
	ld a,in 
; don't replace sub by "cp a,count" 
; if end of line must return with A=0   	
	sub a,count 
	jreq 9$ ; end of line 
0$: 
	mov in.saved,in ; in case "_unget_token" needed 
```

corrigé: 
```
next_token:: 
	clrw x 
	ld a,in
	ld in.saved,a ; in case "_unget_token" needed  
; don't replace sub by "cp a,count" 
; if end of line must return with A=0   	
	sub a,count 
	jreq 9$ ; end of line 
0$: 
	ldw y,basicptr 
```

* Supprimer la commande **DATALN** et modifié la commande **RESTORE** pour lui permettre d'accepter un numéro de ligne comme argument. La commande agit alors comme **DATALN**

* Mise à jour de [tbi_reference.md](tbi_reference.md)

* Renommé  *write_row* en *write_buffer* dans le fichier [flash_prog.asm](flash_prog.asm)

* Modifié  *save_app*  et déboguer.

* Modifié  *clear_vars*. Utilisation du registre **A** au lieu du registre **Y** comme compteur de boucle. 

* Modifié  *run_it* pour ajouter un appel à *clear_vars* avant d'exécuter le programme. 

* Modifié  *run_app* dans *cold_start*  pour faire un saut à *run_it_02*  pour éviter la redoncance de code.

* Création routine **program_info** appellée par la commande **LIST** et par *run_app* in *cold_start*. 


#### 2022-05-06

* Ajout de la commande **GET** *var* qui vérifie s'il y a un caractère de reçu. Si c'est le cas la valeur ASCII du caractère est assignée à la varable sinon **0**. **GET** n'attend pas la réception d'un caractère. 

* Modifié les compilateur et décompilateur pour tenir compte du type TK_LABEL.

* Ajouté et testé  cible symboliques pour les commandes **GOTO** et **GOSUB** voir test [BASIC/target.bas](BASIC/target.bas)

#### 2022-05-05

* À faire:
	

	* Ajouter la possibilié de créer des variables et constantes  symboliques. 

	* Support pour symbole comme cible des **GOTO** et **GOSUB** 


* Modifié  parse_keyword pour extraire parse_symbol dans le fichier [compiler.asm](compiler.asm)	

* Déplacé les sous-routines  *is_alpha*, *is_digit*, *is_alnum*  dans le fichier [compiler.asm](compiler.asm). 

* Ajouter commande  &nbsp; **ON** *expr* &nbsp; **GOTO|GOSUB**. 

* Corrigé bogue dans commande **INPUT** qui n'acceptait pas les entiers négatifs. 


#### 2022-05-01

* Réorganisation de code. 
	
	* Déplacé code d'initialisation mcu dans [hardware_init.asm](hardware_init.asm).

	* Déplacé routines programmation **IAP** dans [flash_prog.asm](flash_prog.asm)

	* Déplacé code d'initialisation UART1 et routines dans [terminal.asm](terminal.asm) 

#### 2022-04-30

* Optimisation de next_token 


#### 2022-04-29 

* Renommé **FLASHAPP** en **SAVE** 

* Ajout de la commande **EDIT** .

* Débogage 

#### 2022-04-27

* Ajout de la commande **FLASHAPP**  à déboguer 

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

* Modifié *next_token* pour qu'il n'y est qu'un point de sortie à **9$:** 

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
