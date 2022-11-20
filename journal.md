### 2022-11-19

* Remplacé ldw x,zp_var par _ldxz zp_var dans terminal.asm et fait un commit.

* Remplacé ldw x,zp_var par _ldxz zp_var dans decompiler.asm et fait un commit. 

* Remplacé ldw x,zp_var par _ldxz zp_var dans compiler.asm et fait un commit. 

* Remplacé ldw x,zp_var par _ldxz zp_var dans debug_support.asm et fait un commit.

* Remplacé ldw x,zp_var par _ldxz zp_var dans files.asm et fait un commit.

* Remplacé ldw x,zp_var par _ldxz zp_var dans flash_prog.asm et fait un commit.

* Remplacé ldw x,zp_var par _ldxz zp_var dans arithm24.asm et fait un commit. 

* Remplacé ldw x,zp_var par _ldxz zp_var dans TinyBasic.asm et fait un commit. 

* Création de plusierus macros dans [gen_macros.inc](inc/gen_macros.inc) pour combler les déficiences de l'assembleur qui n'optimise pas les 
opérations sur la page zéro qui peuvent-être codées sur 2 octets au lieu de 3,4 ou même 5. Ces macros ont permis de gagner 219 octets. Les macros
concernées finissent par **z**, i.e. **_incz**, **_decz**, etc. 

* Modifié *cold_start* dans [hardware_init.asm](hardware_init.asm) pour ne pas afficher l'information système en autorun. 

### 2022-11-18

* Taille actuel au moment du commit, 15246 octets.

* Je débute un travail de réduction de la taille du binaire. La taille actuelle sans tenir compte de l'alignement de 128 octets avant *app_space* 
est de 15253 octets compilé avec [debug_support.asm](debug_support.asm).

* Corrigé bogue dans *readln* du fichier [terminal.asm](terminal.asm).
	
	1. CTRL-E ne fonctionne pas.  Bogue corrigé. 
	1. Insertion en début de ligne fait disparaître le **&gt;** du prompt. Bogue corrég dans routine *move_left*  Lorsque le paramètre **n** de la commande
	ANSI **ESC[nD]  était à zéro reculait quand même d'un caractère. 

* Modifié routine *decompile* dans [decompiler.asm](decompiler.asm), maintenant accepte un paramètre dans A pour choisir si 
le numéro de ligne doit-être aligné à droite sur 5 espaces. 

* Commit 16:25 

* Création de la sous-routine *print_err_msg*  pour factorisé cette opération qui apparaissait 2 fois dans *tb_error*.

* Création de la macro _err_entry dans [TinyBasic.asm](TinyBasic.asm) pour créer la table *err_msg* et enlever les constantes 
**ERR_XX** dans le fichier [tbi_macros.inc](tbi_macros.inc).  Cette méthode réduit les risques d'erreurs lors de modification de la table.

* Supprimé l'affiche du *token id* dans la routine *tb_error*. 

* commit 11:14

* Corrigé bogue dans commande **SAVE** qui plantait après la sauvegarde. C'étai du à l'écrasement de l'octet fin de ligne 
pendant la procédure de sauvegare. Ajout code pour remettre à zéro.

* Corrigé bogue dans commande **AUTORUN** l'option **\C** n'était par reconnue.

* Modifié *print_registers* dans [debug_support.asm](debug_support.asm)  pour ajouter l'impression de l'adresse de retour. 
Corrigé bogue, l'offset pour obtenir l'addresse de sp avant trap n'était pas correcte.

### 2022-11-17

* La commande **RUN** n'initialisait pas correctement les pointeurs de variables dynamiques lors que le programme à exécuter 
se trouvait en mémoire FLASH.  Bogue corrigé.  

* erase \f n'efface que le premier block. Bogue corrigé.

* bogues à corrigés:
	
	* save reboot le MCU lorsque hymne.bas est sauvegardé. 




* Corrigé bogue dans routine *cold_start* du fichier [hardware_init.asm](hardware_init.asm). Dans la section *run_app* initialisait *txtbgn* avec 
la mauvaise valeur. 

* Commit 20:17 hre 

* Modification au [readme.md](readme.md)

* Commit 16:40

*  __Notes:__ 

1. Sur la carte __NUCLEO_8S207K8__ le périphérique I2C n'est accessible que comme fonction alterntive sur les broches 
__PB4__ __(CN4:7)__ et __PB5__ __(CN4:8)__. Pour utiliser ce périphérique il faut donc activé le bit 
__6__ dans le registre __OPT2__ __(0x4803)__.  Ensuite pour activer la fonction alternative il faut réinitialisé le MCU. Ceci peut-être fait
sur la ligne de commande de la façon suivante:
```
>LET A=PEEK($4803) OR 64:WRITE $4803,A:REBOOT 


Tiny BASIC for STM8
Copyright, Jacques Deschenes 2019,2022
version 2.5R0

>
```   
Pour désactiver cette fonction alternative il faut faire:
```
>LET A=NOT 64 AND PEEK($4803):WRITE $4803,A: REBOOT


Tiny BASIC for STM8
Copyright, Jacques Deschenes 2019,2022
version 2.5R0

>
``` 

2.  Sur la carte __NUCLEO_8S207K8__ le périphérique __SPI__ n'est pas relié aux connecteur __CN3__ même si le [manuel de l'utilisateur](docs/NUCLEO-8S207K8/) laisse
entendre qu'il pourrait l'être. Pourtant tel qu'indiqué sur [la schématique](nucleo-32-S207K8-B03_Schematic.pdf) il n'y a aucune facilité sur la carte pour remplacer __TMR2_CH1 (CN3:13)__ par
__SPI_NSS__ et __TMR2_CH2 (CN3_14)__ par __SPI_MOSI__.  Seul la broche __SPI_MISO (CN3:15)__ est disponible.  Une bourde de conception de la carte.  

### 2022-11-16

* commit 21:05 

* Testé i2c avec le programme [i2c_oled.bas](BASIC/i2c_oled.bas) avec succès.

* Testé i2c avec le programme [i2c_eeprom.bas](BASIC/i2c_eeprom.bas) avec succès.

* Modifié *check_forbidden*.

* Modifié commande **I2C_OPEN** et **I2C.CLOSE**  pour utlisé le périphérique I2C sur les broches alternatives PB4,PB5 communes aux 2 cartes.

* Modifié *next_line* pour ajouter un CR après l'impression du numéro de ligne.

*  Travail sur [i2c.asm](i2c.asm)

*  Mise à jour du manuel de référence [tbi_reference.md](tbi_reference.md).

*  Réordonné la séquence de sélection dans routine *factor*. 

*  Commit 9:34 hre  

*  Modifié  [build.sh](build.sh)

### 2022-11-15 

* Modification du Makefile et config.inc pour accomoder plusieurs cartes cibles.

	* Présentement supporte les cartes d'expérimentation suivantes:
	
		* __NUCLEO_8S208RB__ 
		* __NUCLEO_8S207K8__ 

	
	* Modification de [config.inc](config.inc)

	* Ajout du script [build.sh](build.sh) 

		* USAGE: __./build.sh  s207||s208 [flash]__ 


* Ajout du support pour la  carte [NUCLEO-8S207K8](https://www.st.com/en/evaluation-tools/nucleo-8s207k8.html)

	* Ajout de [inc/stm8s207k8.inc](inc/stm8s207.inc)

	* Ajout de [nucleo_8s207.inc](inc/nucleo_8s207.inc)

### 2022-11-14

* commit 15:56

* Création du fichier [files.asm](files.asm) et déplacé routines de fichiers dans celui-ci.

* Modifié commande **SAVE** pour éviter les doublons. Si un fichier avec le même nom existe il est remplacé.

### 2022-11-12

* commit 20:55 hre 

* __Bogue:__ parfois la commande **SAVE** plante à la fin de son exécution. Cependant le programme est sauvegardé correctement. 

* Modifié *itoa* , maintenant n'insère plus d'espace. En conséquence j'ai du modifié:
	* *system_information* 
	* La commande **PRINT** 
	* *decompile*

* Déboguer commande **SAVE**

* Testé la commande **CHAIN** avec les programmes 
	* [chain_main.bas](BASIC/chain_main.bas), 
	* [chain_hello.bas](BASIC/chain_hello.bas), 
	* [chain_world.bas](BASIC/chain_world.bas), 

* Corrigé bogue dans commande **ERASE**. 

* A faire: tester et déboguer commandes **SAVE**,**ERASE** et **CHAIN**. 

* Modifié **CHAIN** et **END** pour tenir compte de la nouvelle structure de l'interpréteur.

* Corrigé bogue dans commande **LIST** 

* Modifié routines *decompile* et *itoa* pour améliorer la présentation de  la commande **LIST**.

* Commit 11:40 hre 

* Résultats du test [target.bas](BASIC/target.bas)
```
>run
1000 loop each test
GOTO using symbolic target 
 100 msec
GOTO using line # 	
 98 msec
GOSUB using symbolic target 	
 120 msec
GOSUB using line # 	
 115 msec
```


* Testé avec succès [stack.bas](BASIC/stack.bas)

* Créé la macro **_incw.s** pour en réduire la taille. l'assembleur *sdasstm8* ne reconnait pas l'adressage court. Donc je code l'instruction à la main. Utilise 4 octets de moins.
```
.macro _incw.s v 
.byte 0x3c,v+1 ; inc v+1 forme courte, 2 octets au lieu de 4   
jrne .+4
.byte 0x3c,v   ; inc v  forme courte 
.endm 
```

* commit 10:13 hre

* Corrigé bogue dans *cmd_input_var*.  Testé [on.bas](BASIC/on.bas)

* Corrigé bogue dans **.macro _incw v**. L'offset du *jrne* était de +4 alors qu'il doit-être de +6 
```
    ;  increment 16 bits variable 
    .macro _incw  v 
        inc v+1  
        jrne .+6 ; 2 octets 
        inc v  ; 4 octets 
    .endm 
```

### 2022-11-11

* À faire: débogué **ON expr GOTO|GOSUB**.  Réinialise le MCU 

* Testé [restore.bas](BASIC/restore.bas)

* Testé [hymne.bas](BASIC/hymne.bas)

* Modifié et testé [input.bas](BASIC/input.bas)

* Modifié et testé [goto_test.bas](BASIC/goto_test.bas)

* Modifié et testé [gosub_test.bas](BASIC/gosub_test.bas)

* Modifié et testé [const.bas](BASIC/const.bas)

* Modifié et testé [usr_test.bas](BASIC/usr_test.bas)

* Corrigé bogue dans *cmd_key*. Maintenant [pwm_soft.bas](BASIC/pwm-soft.bas) fonctionne.

* commit 15:40 

* programme [pwm_soft.bas](BASIC/pwm-soft.bas) ne fonctionne pas. 

* Corrigé bogue dans **cmd_input_var**.

* commit 14:30 

* Corrigé bogue dans *insert_line* du module [compiler.asm](compiler.asm). 

* Corrigé bogue dans *cmd_print** qui ne gérait pas correctement la fonction **CHAR_IDX**. 

* Commit 12:30 hre

* Corrigé bogue dans *cmd_write*, bogue régressif testant A pour le type de token.

* Corrigé bogue dans *and_cond*,  les conditions entre parenthèses n'étaient pas prises en compte. 

* Corrigé bogue dans *let_var*,  l'adresse de la variable dans ptr16 était écrasé lorsque l'évaluation d'expression appellait **uflash**.

* Corrigé bogue dans *relation* la comparaison **REL_NE_IDX** n'était pas tenu en compte. 

### 2022-11-10

* Commit 22:00hre 

* Débogué  *func_read_data* et associés. 

* Corrigé bogue dans *let_dvar* et dans *kword_dim*.

* commit 16:00 hre 

* Débogué **cmd_if**. 

* Corrigé bogue dans les macros **_code_addr** et **_call_code** 

* Annulé l'utilisation de **SUB**. 

* Test du nouveau mot réservé **SUB**. 

* Déboguer liste d'arguments des fonctions et procédures. 

* commit 9:54  version 2.5R0 , le mot réservé **LET** est maintenant obligatoire ainsi que le terminateur de commande **:**.

* Débogué routine *relation*. 

* Corrigé *_dict_entry,1,^/","/,COMMA_IDX* en enlevant le **\\** avant la virgule. dans **"\\,"**.  

* [speed-test.bas](BASIC/speed-test.bas), version révisée. 
```
>run
FOR...NEXT test
 110 msec
DO...UNTIL test
 179 msec
GOSUB test
 132 msec
```
* [speed-test1.bas](BASIC/speed-test1.bas), version originale. 
```
>list
    1 '  speed test
    2 ?  "FOR...NEXT test"
    5 LET  T= TICKS 
    7 FOR  I=  1TO  1000
   10 LET  A=  23*  4+  5
   20 NEXT  I
   30 ? TICKS -  T;  " msec"
   70 ?  "DO...UNTIL test"
   80 LET  T= TICKS 
  100 DO 
  110 LET  A=  34*  56%  23+  4
  120 LET  B=  B+  1: UNTIL  B>  1000
  130 ? TICKS -  T;  " msec"
  150 ?  "GOSUB test"
  160 LET  T= TICKS 
  170 FOR  I=  1TO  1000: GOSUB  300: NEXT  I
  180 ? TICKS -  T;  " msec"
  200 END 
  300 RETURN 
program address:  $91, program size:  304 bytes in RAM memory

>run
FOR...NEXT test
 67 msec
DO...UNTIL test
 181 msec
GOSUB test
 29 msec
```
Amélioration minime de performance. La version  2.1R2 donnait ceci:
* Avant optimisation 
```
    1 rem speed test
    2 ? "FOR...NEXT test"
    5  T= TICKS
    7  FOR I= 1 TO 1000
   10  A= 23* 4+ 5
   20  NEXT I
   30  PRINT TICKS- T;" msec"
   70  ? "DO...UNTIL test"
   80  T=TICKS 
   100 DO 
   110 LET A=34*56%23+4 
   120 LET B=B+1 : UNTIL B>1000 
   130 ? TICKS-T;" msec" 
   150 ? "GOSUB test"
   160 T=TICKS 
   170 FOR I=1 TO 1000 : GOSUB 300 : NEXT I
   180 ? TICKS-T;" msec" 
   200 END
   300 RETURN 

>run
FOR...NEXT test
 68 msec
DO...UNTIL test
 186 msec 
GOSUB test
 33 msec 

```


### 2022-11-09

* bogue dans decompile
```
>54 let a=23
Registers state at break point.
--------------------------
EPC: $93D5( 37845)
X: $36 ( 54)
Y: $16BB ( 5819)
A: $0 ( 0)
CC: $20 ( 32)
SP: $17F7 ( 6135)

>list
Registers state at break point.
--------------------------
EPC: $9731( 38705)
X: $1664 ( 5732)
Y: $1773 ( 6003)
A: $3 ( 3)
CC: $21 ( 33)
SP: $17EE ( 6126)
126
Registers state at break point.
--------------------------
EPC: $9735( 38709)
X: $1667 ( 5735)
Y: $1773 ( 6003)
A: $0 ( 0)
CC: $23 ( 35)
SP: $17EE ( 6126)

program address:  $91, program size:  11 bytes in RAM memory

```

### 2022-11-08

* bogue
```
>let a=23*4 : ? a
 92

>let a=a*a

>? a
 8464

  $16B8	  $0  $0  $8 $77  $9  $0 $3F  $0 ___w__?_
 5825 5823
syntax error
    0 
```

* Retravaillé *parse_integer*

* Travail sur le compilateur à complété.

### 2022-11-07 

#### session 2

* commit fait à 11:31  avant de débuté une modification majeure du système qui consiste à tokenisé la machine virtuelle.

	* changement de la structure du dictionnaire, le champ addresse code de type **.word** est remplacé par le champ token de type **.byte**
	```
	
	```

#### session 1

* Remplacé les étiquette en début de ligne par **SUB nom**. 

* Corrigé bogue dans *decompile* qui ne décompilait pas correctement les **TK_LABEL**. 

* Modifié la commande **LET** pour accepté un liste de variables.

### 2022-11-06

* Travail complété, aucune amélioration de performance. 
```
>run
FOR...NEXT test
 71 msec
DO...UNTIL test
 186 msec
GOSUB test
 33 msec

```

* Ajout TrapHandler 

* Modifié   *print_registers* dans [debug_support.asm](debug_support.asm).  Doit-être appellé seulement via le *TrapHandler* 

### 2022-11-05

* bogue:
```
Tiny BASIC for STM8
Copyright, Jacques Deschenes 2019,2022
version  2.1R2

>? a

>let a=23*4+5

>? a

>? 23*4+5

>? a

>? 23*4+5: ? a
 97

>? 23*4+5:
 97

>? a: 
 0

>let a=23*4+5:
syntax error
 5816  A= 23* 4+ 5u
>? a:
 97

>

```

* Retravailler la chaîne d'évalution des conditions booléenne. 

* Modifier *remark* 

* Modifié *next_token*, *interpreter* et *_unget_token*.

### 2022-11-04

* Travail d'optimisation vitesse d'exécution.

* Corrigé bogue dans *func_char*. 


### 2022-11-03

* Création de la branche V2_5. 

* Rendre obligatoire le mot réservé **LET** et le séparateur de commande **:**.

* Différencier les étiquettes cible en début de ligne de celles en argument des **GOSUB|GOTO**

* les identifiants symboliques de variables et constantes sont identifiés par **TK_DVAR** et **TK_CONST**. 

### 2022-10-29

* Début du travail d'optimisation de l'interpréteur à partir de la version 2.1R2 

* Avant optimisation 
```
    1 rem speed test
    2 ? "FOR...NEXT test"
    5  T= TICKS
    7  FOR I= 1 TO 1000
   10  A= 23* 4+ 5
   20  NEXT I
   30  PRINT TICKS- T;" msec"
   70  ? "DO...UNTIL test"
   80  T=TICKS 
   100 DO 
   110 LET A=34*56%23+4 
   120 LET B=B+1 : UNTIL B>1000 
   130 ? TICKS-T;" msec" 
   150 ? "GOSUB test"
   160 T=TICKS 
   170 FOR I=1 TO 1000 : GOSUB 300 : NEXT I
   180 ? TICKS-T;" msec" 
   200 END
   300 RETURN 

>run
FOR...NEXT test
 68 msec
DO...UNTIL test
 186 msec 
GOSUB test
 33 msec 

```

### 2022-10-25 

* Corrigé une erreur d'orthographe dans [tbi_reference.md](tbi_reference.md)

### 2022-06-26

* commit 21:41

* Ajout du démo [pwm-soft.bas](BASIC/pwm-soft.bas).

* Réorganisé l'ordre des comparaisons dans *interp_loop* mettant les plus probables en premier. Légé gain en rapidité.

* Suppression de la sous-routine *get_addr* et renommé  macro *_get_code_addr* en *_get_addr*. Remplacé *call get_addr* par la macro *_get_addr*.  Ainsi 4 cycles 
machines sont sauvé à chaque appel. 

* Suppression de sous routine *get_char* pour la remplacé par la macro *_get_char*. 

* Déboguer *decompile* sort du garbage quand il décompile dans un tampon. Le bogue était and *buf_putc*. l'instruction machine *inc* n'affecte pas le carry flag.

version boguée:
```
buf_putc:
	ld [ptr16],a
	inc ptr8 
	jrnc 9$    ; erreur carry flag pas modifié par **inc**
	inc ptr16 
9$:	clr [ptr16] 
	ret 
```
version corrigée:
```
buf_putc:
	ld [ptr16],a
	inc ptr8 
	jrne 9$
	inc ptr16 
9$:	clr [ptr16] 
	ret 
```

* Modifié *print_registers* dans [debug_support.asm](debug_support.asm) pour sauvegarder la variable système *out*. 

* Modifié *tone* pour préserver registre **X**. 

* Début du travail sur la version 2.1R2 

* Ajout d'un numéro de révision pour avoir un meilleur traçage des versions.

### 2022-06-25

* commit 21:04

* mise à jour du [readme.md](readme.md)

* Mise à jour du [manuel de référence](tbi_reference.md).

* Incrémenté le numéro de version à 2.1

* Création d'un vidéo de démonstration du périphérique **I2C**

### 2022-06-24

* commit 22:13

* [BASIC/i2c_oled.bas](BASIC/i2c_oled.bas) fonctionne maintenant.

* Modifié **READ** pour accepter commentaire à la fin de la ligne. 

* Travail sur [BASIC/i2c_oled.bas](BASIC/i2c_oled.bas).

	* Mode d'adressage horizontal: <br>
	Les 128 colonnes d'une page doivent-être mise à jour dans la même commande sinon le pointeur de colonne est remis à zéro à chaque commande.
	Par contre le pointeur de page n'est pas remis à zéro à la fin d'une commande. 

### 2022-06-23

* Travail sur [BASIC/i2c_oled.bas](BASIC/i2c_oled.bas).
	* Affichage allume mais pointeur addresse ne fonctionne pas correctement.

### 2022-06-22

* Création de [BASIC/i2c_oled.bas](BASIC/i2c_oled.bas) pour teste l'interface **I2C** avec un affichage OLED avec controller SSD1306.

### 2022-06-21

* Supprimé commande BASIC **I2C.ERROR**. Les commandes disponibles sont:
	* **I2C.OPEN**
	* **I2C.CLOSE**
	* **I2C.READ**
	* **I2C.WRITE**


* commit 20:48

* Enfin réussi à faire fonctionner le périphérique **I2C** pour écrire et lire dans une mémoire EEPROM 24LC512. 

* Modifié *UserButtonHandler*  les rebonds du bouton n'étaient pas filtré correctement. 

### 2022-06-20

* Après 1 semaine à essayer de faire fonctionner correctement le périphérique I2C avec une mémoire EEPROM 24LC512 j'ai décidé de faire un test avec 
une version I2C entièrement logicielle (bit-bang).  [i2c_soft.asm](i2c_soft.ams).

### 2022-06-19

* Ajout de la routine *set_int_priority* dans [hardware_init.asm](hardware_init.asm).

### 2022-06-18

* Supprimer opérateur '#' inutile. 

* Modifié **BUFFER** qui maintenant est une commande plutôt qu'une fonction. 

* Travail sur périphérique I2C. 

### 2022-06-17

* Test I2C sur mémoire 24LC512.  

* Modifié priorité interruption timer4 pour niveau 1.

### 2022-06-16

* Commande **BUFFER**  à corriger.

* commit 22:24

* Travail sur [i2c.asm](i2c.asm)

* Corrigé macro _usec_dly  dans [tbi_macros.inc](tbi_macros.in).

### 2022-06-15

* commit 22:28

* bogue dans editeur **CTRL_E**. Corrigé, le bogue était dans *decompile*, introduit lors de la modification pour traiter l'opérateur **#**.

```
>list
   10  PRINT BUFFER( TEST , 10)
   20  CONST C1 = 10
   30  DIM V1 = 30
   40  PRINT# V1 ,# C1 
program address:  $90, program size:  73 bytes in RAM memory

>40
>   40  1,#c1
```

* Ajout de l'opérateur **#** pour déréférencer les variables. 

* Ajout de la function **BUFFER name, size**  qui réserve de la mémoire pour un tampon. 

* Travail sur pilote de périphérique pour I2C, fichier [i2c.asm](i2c.asm).

* Test périphérique i2c.

* Modifié commande **REBBOT** et routine *Uart1RxHandler* pour utiliser la macro *_swreset* au lieu d'un saut vers cold_start.

### 2022-06-14

* commit 16:30

* Vectorisé la routine *putc* à travers la variable système ajoutée *out*. 

* Ajout des routines *set_output* et *buf_putc* dans [terminal.asm](terminal.asm).

* Modifié routine *decompile* pour décompiler directement vers le terminal sans passer par un tampon.

* Ajout de la commande **TRACE** qui envoie au terminal le no de ligne en cours d'exécution.

### 2022-06-13

* Écriture de [i2c_test.bas](BASIC/i2c_test_.bas) 

### 2022-06-12

* Commit 11:34 

* Mise à jour [tbi_reference.md](tbi_reference.md).

* Supprimer l'utilisation des raccourcis pour les mots réservés. Mise à jour de [tbi_reference.md](tbi_reference.md).

* Mofifié *strcmp*,  inversé signification du flag **Z**, Z=1 indique que le chaînes sont égles. Et s'arrure maintenant que les 2 chaînes sont de la même longueur.


* Modifié *tb_error* ne doit pas afficher le message *rt_msg* lorsque l'erreur se produit sur l'exécution en mode interactif.

* Modifié *search_name*, *factor*, *cmd_dim*,*let_dvar*, REC_XTRA_BYTES ajouté au nom recherché.

### 2022-06-11

* Corrigé bogue dans *search_name*  et *get_value* la longueur de l'enregistrement n'était pas masqué correctement utilisait NAME_MAX_LEN ce qui n'est pas correct car avec l'ajout de REC_XTRA_BYTES à la longueur du nom ça peut faire plus que 15.

* bogue. programme gèle lorsque référence un nom de la constante dépassant 9 caractères.
```
>li
    1  LABEL_TROP_LONG 
   10 CONST HELLO.WORLD = 11
   20 PRINT HELLO.WORLD 
program address:  $90, program size:  63 bytes in RAM memory

>run
```


* commit 22:01

* Modifié *add_space* in [decompiler.asm](decompiler.asm). Remplacé *call is_alnum* apr *call is_symbol_char*. 

* Mise à jour de [tbi_reference.md](tbi_reference.md).

* Modifié macro *_dict_entry* pour enlevrt l'étiquette *name:* qui était inutile et m'empêchait de renommer **QKEY** en **KEY?**.

* Renommé **QKEY** en **KEY?**. 

* Ajouter les caractères __','__ et __'?'__ comme valides dans les symboles. 

* commit 16:20

* renommé routine *list* en *cmd_list* et *print* en *cmd_print*.

* Travail sur [tbi_reference.md](tbi_reference.md).

* Modifié commande **LIST** pour capturer les erreurs de syntaxe.

### 2022-06-10

* Création d'un vidéo de démonstration des nouvelles fonctionnalités.

* Repassé à la branche v2 et réactivation du support DEBUG. 

* reconstruire master avec DEBUG=0. 

* 15:41 checkout master et merge branche V2. 

* commit 15:40

* Mise à jour de l'information sur la commande **PRINT** dans [tbi_reference.md](tbi_reference.md)

* Retravaillé  *hex_dump* et *show_row* dans [debug_support.asm](debug_support.asm).

* Retravaillé *decompile* dans [decompiler.asm](decompiler.asm).

* Supprimé la variable système *tab_width* ainsi que l'utilisation de caractère **#** dans la commande **PRINT** qui servait à ajuster la valeur de 
*tab_width*.

* Modifié *itoa* ajoute maintenant un espace au début.

* Modifié *print_top* n'ajoute plus d'espace après l'impression du nombre.

* Modifié *prt_acc24* n'appelle plus *right_align*.   

* Pour créer un espace entre les items imprimés il faut maintenant les séparer par une virgule. 

* Modifié commande **PRINT**  Ajout du jeton TK_SEMIC i.e. le caractère **;** qui annule l'espacement entre les items imprimés ainsi que le retour à la ligne.  Maintenant le jeton **TK_COMMA** sert à sauter à la prochaine colonne dont la largeur est définie par la variable système *tab_width*. Cet modification a pour but d'être conforme au comportement de Microsoft BASIC utilisé dans les ordinateurs 8 bits des années 80. i.e. Apple II, Commodore PET,C64,VIC-20, Tandy TRS-80, etc. Ce projet tend à s'aligner sur Microsoft BASIC version 1.x.  

* Révision du code.

### 2022-06-09

* commit 22:30

* Mise à jour de [tb_reference.md](tb_reference.md).

* Création des routines *cmd_line_only* et *runtime_only* pour réduire la répétion de code. 

* commit 16:19

* Modifié commande **LIST** pour indiquer que le programme a possiblement des lignes manquante, flag **FLN_REJECTED** activé par le compilateur.

* Modifié *insert_line* pour initialiser un flag lorsqu'une insertion est refusée  *memory full*. 

* commit 15:34

* Réparer *parse_integer*, le registre **Y** n'était pas initialisé sur XSTACK_EMPTY avant d'appeller *atio24*. 

* Réparer commande **LIST**. Aussi remplacé virgule comme séparateur par **-** pour être conforme au BASIC tradtionnel, i.e. Commodore C64,VIC20,PET, etc.

### 2022-06-08

* commit 20:38 

* Modifié commandes **AUTORUN**,**EDIT**,**ERASE** et **RUN** pour accepter une étiquette au lieu d'une addresse de programme. 

* réparé routine *search_fit*, il fallait arrondir la taille au block.

* Ajout de la commande **CHAIN addr [, line#]**. Le programme appellant execute le programme à **addr** à partir de la ligne **line#**. Lorsque ce programme 
se termine le programme appellant se poursuit. L'information de retour est conservée sur la pile de contrôle et prend 8 octets. Un programme chaîné peut utilisé **CHAIN**  pour appeller un autre programme. La profondeur est limitée par la taille de la pile de contrôle. La commande **END** a été modifiée en conséquence.

* commit 11:34

* Réparer la fonction **CTRL+E** dans *readln** .  Le pointeur xtack n'était restaurer avant de faire l'appel à **atoi24**. 

* Modifié **Uart1RxHandler** pour ajouter la fonction d'effacement autorun **CTRL+Z**. 

* Réinstaurer commande **AUTORUN**.  Les 4 premiers octets de la mémoire EEPROM doivent-être réseverer pour la commande **AUTORUN**. 
	* AUTORUN \C  annule l'autorun 
	* AUTORUN *addr*  enregistre au début de l'EEPROM  **AR addr** 
		* __AR__ est la signature de la commande autorun 
		* __addr__ est l'adresse du programme à lancer au démarrage. 
	* Si un programme **AUTORUN** bloque il est possible de l'annuler avec un **CTRL+Z**. Ceci a pour effet d'effacer les paramètres **AUTORUN** 
	de l'EEPROM et de réinitialiser la carte. 


* Modifié commande **SAVE** pour que la commande tienne compte des programmes suprimés. **SAVE** essai de sauvegarder dans le premier espace suffisamment large.

### 2022-06-07

* Commit 22:56

* Modifié la commande **ERASE \E|\F|addr** Si l'argument est une adresse de programme en mémoire FLASH seul ce programme est effacé à l'exception des 
champs signature est grandeur. La signature est remplacée par **XX**. 

* Modifié la commande **EDIT** maintenant prend une adresse comme argument. L'adresse doit correspondre à celle d'un programme en mémoire FLASH.

* commit 9:31

* Modifié **UFLASH** pour scanner tous les blocs à partir de *app_space* jusqu'à *0x10000*. Retourne l'adresse du premier block vide.

* Modifié commande **RUN** pour accepter optionnellement une adresse de programme en mémoire FLASH.

* Modifié *qsign* et en conséquence: **UFLASH** et *cold_star*

### 2022-06-06

* commit 23:12

* Modifié commande **SAVE** pour pouvoir sauvegarder plusieurs programmes.

* Ajouter commande **DIR** pour lister progammes sauvegardés en mémoire FLASH.

### 2022-06-05

* commit 22:09

* À faire:
	* Modifié commande **SAVE** pour pouvoir sauvegarder plusieurs programmes.
	* Modifié la commande **EDIT**  pour sélectionner un programme à rééditer. 
	* Ajouter commande **DIR** pour afficher la liste des programmes sauvegardés.

* Modifié commadne **ERASE * pour ajouter une adresse optionnelle de début d'effacement. 

* commit 21:33

* Modifié *write_byte* dans [flash_prog.asm](flash_prog.asm) pour incrémenté *farptr* après l'écriture de l'octet.

* Modifié la commande BASIC **WRITE** pour tenir compte de la modification à *writ_byte*. 

* Modifié la commande **WRITE** pour accepter les caractères et les chaînes en argument. 

* Élimininer l'Option __\E__ de la commande **LIST** puisque maintenant les constantes ne sont plus sauvegardées dans l'EEPROM.

* commit 20:24

* Modifié [debug_support.asm](debug_support.asm). N'utilise plus l'instruction machine **TRAP**. Utilise les macros:
	* **_dbg_prt_regs**  affiche le contenu des registes au point d'arrêt et quitte. 
	* **_dbg_cmd_itf**   petite interface de commandes pour examiner le contenu de la mémoire. Il n'y a que 3 commandes:
		* __p addr__  Affiche les 8 octets à partir de l'adresse *addr*. 
		* __s addr__  Imprime la chaîne .asciz qui est à cette adresse. 
		* __q__  Quitte l'interface de commande et revient au BASIC.

* commit 16:14

* Réparer le support au débogage. [debug_support.asm](debug_support.asm). Éliminé **dbg_macors.inc**.

* commit 11:11	

* Corrigé bogue dans *search_name*. La supression du bit indiquant qu'il s'agit d'une constante avait été oublié.
```
2$: ; skip this one 	
	ldW Y,(WLKPTR,sp)
	ld a,(y)
	and a,#NAME_MAX_LEN ; cet ajustement avait été oublié.
	ld acc8,a 
	addw y,acc16 
	jra 1$  
```

### 2022-06-04

*  bogue , ne peut créer 2 constantes 
```
>10 const test=1024, led2=20490

>20 ? test led2

>run
1024 

```

* Modifié commande **CONST** pour enregistrer les constantes en RAM avec les variables. Le bit 7 de l'octet REC_LEN servira à les différencier. Si ce bit 
est à **1** il s'agit d'une constante. Le but de cette modification est d'améliorer la vitesse des routines *factor* qui font la recherche. Il n'est plus
nécessaire de rechercher dans 2 localisation différentes. 

### 2022-06-03

* commit 23:02

* Ajout de la commande **DIM** pour créer des variables situées après *txtend** 

* Déboguer **LSHIFT** et **RSHIFT**. 

* Supprimé la constante système **PORTH** puisque non disponible sur la carte NUCLEO-8S208RB.

### 2022-06-02

* 21:29 commit 

* corrigé bogue 
```
>li
   10 '  exemple d'utilisation de la pile 
   20 INPUT "nombre "N:IF N=0 END
   30 PUSH N
   32 GOSUB SQUARE 
   34 PRINT POP
   40 GOTO 20
   50  SQUARE PUSH PICK(0)*POP
   60 RETURN
program address:  $80, program size:  150 bytes in RAM memory

>run
nombre :25
run time error, syntax error

 $D4   $0 $20  $E $80 $A5  $1  $3 $53 $51 $55 $41 $52 $45  $0
   32 GOSUB SQUARE 
last token id:    0
>

```
Dans **RETURN** erreur de variable local utilisée pour récupéré le pointeur BASIC de retour. Dans *look_target_symbol* la chaîne du *label* n'était pas sautée. *call skip_string* ajouté. 


* Ajouter des commandes et fonctions pour pousser des expressions sur le stack. Permet de passer des arguments aux fonctions. 
	* __PUSH__ expr  empile une expression   
	* __POP__  fonction pour dépiler une expression .
	* __PICK__ *n* optient le nième élément de la pile. 
	* __DROP__ *n* Jette le sommet de la pile.
	* __PUT__  *n* *expr*  place *expr* sur le nième élément de la pile    
	* __ALLOC__ *n*  réserver *n* enplacement sur la pile. 


### 2022-06-01

* commit 21:04

* Optimisation de *div24*.

* Corrigé bogue dans *atoi24*.  Modifié code pour utilisé *mulu24_8* au lieu de *mul24* qui produisait un overflow lors de la saisied de **$ffffff**.

* Corrigé bogue dans *interp_loop*.
```
4$: cp a,#TK_LABEL
	jrne 5$  ; cette instruction était manquante. 
```


### 2022-05-29

* 22:26 commit 

* Modifié le modèle d'exécution de la machine virtuelle en remplacant les token de commandes par les adresses des routines. Le but est d'améliorer la performance.

* 21:27 commit 

* Réécriture de *mul24* et *mulu24_8* ainsi que de *itoa24* affecté par la modification arithmétique.

### 2022-05-28

* 22:13 commit.

* Corrigé bogue and *mul24*  **N2** n'était pas sauvegardé sur la pile lorsque positif. Réécris *mulu24_8*.

### 2022-05-27

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

### 2022-05-26

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

### 2022-05-25

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

### 2022-05-24

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

### 2022-05-23

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

### 2022-05-22

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


### 2022-05-21

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

### 2022-05-20

* bogue 
```
>? invert(-171)
run time error, syntax error

>? invert(171)
-172

>? -171

run time error, syntax error
```
### 2022-05-19

* Modification de *next_token* pour simplifier et améliorer la performance. Maintenant retourne seulement la constant TK_ID dans A et l'adresse de sa valeur dans X. La récupération de la valeur et la mise à jour de **in.w** est à la charge du client. 

* conversion rendue à **LOG**. 

* Bogue  

### 2022-05-18

* Création du fichier [arithm24.asm](arithm24.asm) transféré les routines arithmétiques sur entier 24 bits dans ce fichier. 

* Écris et testé  routine *div24*. 

* Transféré opération arithmétiques 16/32 bits dans [arithm16.asm](arithm16.asm).

* Débuter la transformation du code pour opérer avec des entiers 24 bits. 

	* Ajout d'une pile pour les expressions.  *xstack*  avec la variable pointeur *xsp* pour cette pile.


### 2022-05-17

* Réécriture de la sous-routine  *mulu24_8* dans [TinyBasic.asm](TinyBasic.asm). 

* Travail sur test arithmétique sur entiers 24 bits [test.asm](test.asm)

### 2022-05-15

* Modification de *itoa* dans [TinyBasic.asm](TinyBasic.asm). 
	
	* Enlevé espace à la fin de la chaîne.

	* Ajouté paramètre d'entrée dans A pour convesion signée **A&lt;&gt;0** ou non signée **A=0**. 

### 2022-05-13 

* Création du fichier [float.asm](float.asm) dans le but d'ajouter les opérations arithmétiques sur le type float32 au format [IEEE-754](https://fr.wikipedia.org/wiki/IEEE_754).

### 2022-05-11

* 8:30   la branche V2 a été fusionné à la branche master.  Retour à la branche V2 pour le développement.


### 2022-05-10

* Mettre à jour [tbi_reference.md](tbi_reference.md). 


*  Modifié commmande **LIST** pour accepter l'argument optionel **\C** qui affiche la liste des constantes en EEPROM plutôt que le programme. 

*  Modifié  **CONST** pour accepter l'argument **\U** qui permet la mise à jour d'une constante. Sans cette option si la constante exite déjà la commande est ignorée. l'indicateur booléen **FUPDATE** a été ajouté dans la variable sytème *flags*. 


*  Ajouter sous-routine *get_const_value* 

*  Modifié routine *factor* pour accepter les *TK_LABEL*. 

### 2022-05-09

* À faire:  Modifié le compilateur pour qu'il remplace les TK_LABEL qui sont des constantes par leur valeur. 

* Création des fichiers [dbg_macros.inc](dbg_macros.inc) et [debug.asm](debug.asm).  

* Débogué commande **CONST** . 

*  Debogué  *search_const*. 

* Modifié *next_token* qui maintenant saute par dessus la chaîne des **TK_LABEL* et renvoie le pointeur sur la chaîne dans X. *skip_label* devenu inutile a été supprimé. *Décompile*, *interp_loop* ont étés modifié pour tenir compte de la modification à TK_LABEL 

### 2022-05-08

* Ajout de la commande **CONST** qui permet de définir des constantes qui sont sauvegardées dans la mémoire EEPROM.

### 2022-05-07

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


### 2022-05-06

* Ajout de la commande **GET** *var* qui vérifie s'il y a un caractère de reçu. Si c'est le cas la valeur ASCII du caractère est assignée à la varable sinon **0**. **GET** n'attend pas la réception d'un caractère. 

* Modifié les compilateur et décompilateur pour tenir compte du type TK_LABEL.

* Ajouté et testé  cible symboliques pour les commandes **GOTO** et **GOSUB** voir test [BASIC/target.bas](BASIC/target.bas)

### 2022-05-05

* À faire:
	

	* Ajouter la possibilié de créer des variables et constantes  symboliques. 

	* Support pour symbole comme cible des **GOTO** et **GOSUB** 


* Modifié  parse_keyword pour extraire parse_symbol dans le fichier [compiler.asm](compiler.asm)	

* Déplacé les sous-routines  *is_alpha*, *is_digit*, *is_alnum*  dans le fichier [compiler.asm](compiler.asm). 

* Ajouter commande  &nbsp; **ON** *expr* &nbsp; **GOTO|GOSUB**. 

* Corrigé bogue dans commande **INPUT** qui n'acceptait pas les entiers négatifs. 


### 2022-05-01

* Réorganisation de code. 
	
	* Déplacé code d'initialisation mcu dans [hardware_init.asm](hardware_init.asm).

	* Déplacé routines programmation **IAP** dans [flash_prog.asm](flash_prog.asm)

	* Déplacé code d'initialisation UART1 et routines dans [terminal.asm](terminal.asm) 

### 2022-04-30

* Optimisation de next_token 


### 2022-04-29 

* Renommé **FLASHAPP** en **SAVE** 

* Ajout de la commande **EDIT** .

* Débogage 

### 2022-04-27

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

### 2022-04-26

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

#### 2022-04-25 

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

### 2022-04-23 

* Modifié  **search_lineno**  le registe **A** détermine maintenant si la rechere débute au début du texte ou à partir de la ligne courante du programme.
    * Si A=0  cherche à partir de *txtbgn*. 
    * Si A=1  cherche a partir de la ligne où est rendu le compteur ordinal de la VM.
    
### 2022-04-21

* Création d'un nouveau dépôt pour **stm8 TinyBASIC V2.0** 

* Objectifs:  
    * Améliorer la performance ce l'interpréteur en modifiant le format du bytecode. Comme en Forth chaque token sera associé à un code machine exécutable. Le compilateur va convertir le texte source en format RPN (Reverse Polish Notation) pour améliorer la performance. Cependant contrairement à une machine virtuelelle Forth il n'y aura qu'une seule pile soit celle pointée par **SP** du STM8. Le jeu d'instruction du STM8 étant optimisé pour effecter les opérations ALU entre la pile et les registres **A**,**X** et **Y**.

    * Réduire la taille du code idéalement à moins de 8Ko. 

* La communication se fera par terminal en utilisant le USART1 que tous les MCU STM8 possèdent.

* Le USART3 ne sera pas utilisé. Le code a été supprimé dans [TinyBasic.asm](TinyBasic.asm).

* Modifié **itoa** pour inclure un espace après l'entier.
