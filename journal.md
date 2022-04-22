#### 2022-04-21

* commit 772a21d63847b53dd827c659403abd0390ce3b06 (HEAD -> master)<br>
  Date:   Thu Apr 21 20:14:13 2022 -0400

    J'ai décidé d'abandonné l'idée d'amélioration majaure sur de cette version et de créer une toute nouvelle vesion 2 dans une autre git

* 14:22 commit avant modifications majeures.

* Réinitialisé le git à la version 1.0. Recommencer optimisation. 

* Création du dossier BASIC pour les fichiers programme source.

* Copié utilitaire SendFile dans le dossier BASIC. Création du script [send.sh](send.sh) 

* Déplacé code du compilateur dans un fichier séparé [compiler.asm](compiler.asm)

* Déplacé code du decompilateur dans un fichier séparé [decompiler.asm](decompiler.asm)

* Suppression des commandes **XRCV** et **XTRMT**. 

* Renommé commande **SIZE** **FREE**. 

* Modifié le compilateur pour laisser tomber la commande **LET**. 


#### 2022-04-20 

* Débuté travail pour réduire la taille et améliorer la performance. 

    * objectif: réduire taille à moins de 8Ko. 

* Éliminer les commandes **XRCV** et **XTRMT**  

* Modifié Makefile pour créer un fichier **.bin**. 

* Command must be terminated by end of line or ':'. 

* Extrait le code du compilateur de [TinyBasic.asm](TinyBasic.asm) pour le mettre dans un fichier séparé [compiler.asm](compiler.asm).

#### 2022-04-19

* Copy de SendFile dans dossier BASIC.

* Tests et débogage. 

* Renommé commande **SIZE** **FREE**. Mis à jour [tbi_reference.md](tbi_reference.md)

#### 2022-04-18

* À faire tests. 

* Nettoyage et création dossier **BASIC**.

* Remplacer **call (x)** par **jp (x)** dans interp_loop  pour les commandes replacer les **ret** par des **jp interp_loop** à la fin des commandes.

<hr>

#### 2020-07-24

* Mise à jour documentation 

#### 2020-07-23 
 
* Corrigé bogue dans **seek_fdrive**.

#### 2020-07-22

* Je me ravise et supprime les mots **COMA**, **COMC** et **CONSOLE**.  Cette fonctionnalité de pouvoir sélectionner la console me paraît superflue dans le contexte. Donc la console est toujours branchée sur UART1 et UART3 est utilisé pour les autres types de communications comme le transfert de fichiers.

* séparation des files de réceptions et des gestionnaires d'interruption pour les 2 UART. 

#### 2020-07-21

* Déboger commande **XRCV** en fait le bogue était dans **UartRxHandler**. Les commandes **CTRL-C**,**CTRL-X** et **CTRL-Z** ne sont pas compatible avec **XRCV** je les ai donc désactivées.

#### 2020-07-20

* Travail sur xmodem.asm et commande XRCV.

#### 2020-07-19 

* Travail sur xmodem.asm et commande XRCV

#### 2020-07-18

* Travail sur commande XRCV

#### 2020-07-17

* Ajout du module [xmodem.asm](xmodem.asm).  Ce module va permettre de faire des transferts de fichiers BASIC entre la carte **NUCLEO** et le **PC** hôte. Les fichiers seront transmis sous leur forme tokenisé.  Pour faire ce transfert il fallait un deuxième canal de communication avec le PC. Donc le **UART3** est maintenant initialisé selon la même configuration que le **UART1**. Les commandes de transfert **XTRMT** et **XRCV** vérifie quel est le UART utilisé pour la console et sélectionne automatiquement l'autre UART pour le transfert du fichier.

* Ajout de la commande **CONSOLE COMA|COMC** pour sélectionner quel UART utilisé pour la console. Par défaut c'est le **COMA** qui est utilisé.

    * **COMA** correspond au périphérique **UART1** du mcu. 
    * **COMC** correspond au périphérique **UART3** du mcu.

* Ajout des constantes   **COMA** et **COMC** 

* commande BASIC **XTRMT**  pour transmettre le fichier qui et en mémoire RAM selon le protocole XMODEM. Complété et testé. 

* commande BASIC **XRCV** Pour la réception d'un fichier selon le protocole XMODEM. Le fichier est stocké en mémoire RAM. 

#### 2020-05-16

* Continuer test et débogage. Pas trouvé d'autres bogues aujourd'hui.

* Modifié le comportement de *itoa*. En hexadécimal n'imprime que les 4 derniers digits pour éviter que les nombres négatifs s'affichent avec 6 digits, i.e. $FFED au lieu de $FFFFED 


#### 2020-05-15 

*  Corrigé bogue dans le traitement des relations. 

* Corrigé bogue dans commande **RESTORE**. N'avait pas été mis à jour lors du passage en mode indirect. 

* Corrigé bogue dans commande **PMODE**. Plantait lorsqu'un broche en mode sortie était réinitialisée en mode entrée. Causé par le bit *External interrupt enabled* dans CR2 qui était à 1 mode sortie. L'orde de configuration a été changé le bit *External interrupt enabled* dans CR2 est mis à zéro avant de mettre le bit à 0 dans **DDR**.  


#### 2020-05-14

**session 2**

* Corrigé bogue, le compilateur acceptait une ligne BASIC vide si l'espace texte était vide.

* Corrigé bogue dans fonction **ASC()** qui n'acceptait le type TK_CFUNC comme argument ce qui doit-être le cas. 

* Corrigé bogue dans *get_token* les opérateurs relationnels à 2 caractères n'étaient pas analysée correctement.

* Corrigé bogue dans l'exécution des expressions qui ne rendait pas toujours le terminateur de commande **':'**.

**session 1**

* Dans [terminal.inc](terminal.inc) renommé *delete_end* en *delete_nchar*.

* Dans [terminal.inc](terminal.inc) amélioration des commentaires.

#### 2020-05-13

**session 2**

* Corrigé bogue dans *autorun:* il n'y avait pas de test sur 'A' avant le *jrne 1$*.

* Modifié *strlen* retourne la longueur de la chaîne dans 'A' plutôt que 'X'. Les chaînes n'auront jamais plus de 80 caractères. 

* Corrigé bogue dans *readln* fonction **CTRL_E** n'enregistrait pas la bonne longueur de ligne.

**session 1**

 Si vous avez utilisé stm8_tbi et que vous avez sauvegarder des programmes sur le *flash drive* vous avez constater qu'à chaque mise à jour du *firmware* vous perdiez vos programmes. Vous pensiez peut-être que le système de fichiers était bogué mais ce n'est pas le problème. 

  Le problème est le suivant; les fichiers sont sauvegardés sous forme *tokenizé* et non sous forme texte source. En fait le programme n'existe pas en tant que texte source sur la carte **NUCLEO**, il n'y a pas suffisamment de mémoire RAM pour ça. Chaque ligne saisie est compilée avant d'être rangée dans la mémoire RAM réservée au programme BASIC. Le texte source n'existe qu'une seule ligne à la fois dans le *tib* (le tampon mémoire qui reçoit le texte tapé par l'utilisateur) au moment de sa saisie. Donc chaque fois que le software *TinyBasic* est modifié les adresses des fonctions et commandes changent et par conséquent un programme sauvergardé dans une version précédente du système *TinyBasic* n'est plus valide. Une façon de régler ce problème est d'utiliser des valeurs d'index pour les commandes/fonctions au lieu de l'adresse du code. À l'exécution l'adresse du code est localisé grâce à l'index qui réfère à une table de correspondance. Si les index des commandes reste constants entre les différentes versions de TinyBasic il est possible de retrouver l'adresse d'exécution à partir de la table. Le seul inconvénient est que l'interpréteur est un peu plus lent à cause du degré d'indirection supplémentaire. 

  * Modification du code pour utiliser un modèle inderect pour les commandes. Maintenant chaque commande a un index associé dans le fichier [cmd_index.inc](cmd_index.inc) qui permet de trouver l'adresse d'exécution en *runtime* dans la table *code_addr*. 
  ```
  >t=ticks:for a=1to10000:next a:?ticks-t
  94

>t=ticks:for a=1to100:for b=1to10000:next b:next a:?ticks-t
9391

>t=ticks:for a=1to10000:i=muldiv(5000,25,30):next a:? ticks-t
1185

>t=ticks:for a=1to10000:b=rnd(50):next a:? ticks-t
 599

>t=ticks:for a=1 to 10000:b=3*5+rnd(1000):next a:? ticks-t
 850
```
Un peu plus lent que le modèle d,exécution direct et c'était prévisible.

#### 2020-05-12

* Continuation du travail sur l'éditeur de texte. Étant que cette partie du progamme sera plus complexe j'ai décidé de transférer ces fonctions dans un fichier séparé. le fichier [terminal.asm](termina.asm). Seul les fonctions de bas niveau *getc* et *putc* demeurent dans le fichier principal du projet. 

#### Nouveaux mode d'édition de ligne:

* **HOME** amène curseur en début de ligne 
* **END** amène le curseur en fin de ligne 
* **FLÈCHE GAUCHE** déplace le curseur d'un caractère vers la gauche 
* **FLÈCHE DROITE** déplace le curseur d'un caractère vers la droite
* **SUP**  efface le caractère sous le curseur 
* **CTRL_O** commute en alternance entre les modes *insertion/écrasement*
* **nnCTRL_E** permet d'afficher la ligne *nn* dans l'éditeur pour modification
* **BACKSPACE**  efface le caractère à gauche du curseur
* **CTRL_D**  supprime la ligne au complet
* **CTRL_R** réaffiche la dernière ligne qui a été éditée.

#### 2020-05-11

* modifier *prt_basic_line* pour imprimer dans un tampon plutôt que directement vers UART1 

* **CTRL_E** Permet la recherche d'une ligne BASIC dans le texte et la copie dans le TIB pour édition.

* Travail débuté: améliorer *readln* pour plus de facilité d'édition. 
    * utilisation flèches pour déplacer le curseur au milieu de la ligne 
    * HOME début de la ligne 
    * END  fin de la ligne 
    * modes insertion|overwrite 


#### 2020-05-10

* Mise à jour de [tbi_reference.md](tbi_reference.md) 

* Corrigé bogue dans routine *multipy*, signe opérandes X et Y  n'était pas inversé. 

* Ajouter la fonction **MULDIV**. Cette fonction permet de faire un multiplication suivie d'une division en conservant le produit sur 32 bits et éviter une erreur de débordement sur la multiplication. Voici un exemple.

```
>? 5000*10/10 ' erreur débordement sur la multiplication 
-1554  ' mauvaise réponse.

>? muldiv(5000,10,10)
5000  ' bonne réponse 

>? -5000*10/10 ' erreur débordement sur la multiplication 
1553 ' mauvaise réponse

>? muldiv(-5000,10,10)
-5000  ' bonne réponse 

>? muldiv(32000,25,10)
14464 ' mauvaise réponse car le quotient > INT16_MAX 

>? muldiv(32000,25,30)
26666  ' bonne réponse car le quotient est < INT16_MAX 

>t=ticks:for a=1to10000:i=muldiv(5000,25,30):next a:? ticks-t
1161 ' temps requis en msec pour exécuter 10 000 opérations MULDIV()

```

Pour que le résultat soit valide il faut quand même que le quotient soit dans l'intervalle des entiers 16 bits {-32768..32767}.

#### 2020-05-09

* Retravailler les opérations arithmétiques et ajout de la fonction **MULDIV**.

* Éliminer la commande **XPEEK** qui permettait de lire la mémoire FLASH au delà de 0xffff. Cette mémoire est réservée au système de fichier.

* Il y avait 2 routines d'impression des entiers, *print_int* et *prti24* pour imprimer les adresse 24 bits.  Remplacer par une seule routine qui imprime des entiers de 24 bits.

* Modifié  commande **TONE** pour utiliser *pause* au lieu du timer pour la durée ce qui permet de faire:
```
>timer 10000: do tone 440,250:pause 250 until timeout
```

* Ajout la fonction **PAD** qui retourne l'adresse du tampon de travail de 128 octets.


#### 2020-05-08

* Corrigé bogue dans commande **DIR** qui affichait la mauvaise valeur d'espace libre sur le disque flash. 

* Corrigé bogue dans commande **SAVE**. Le dernier octet du fichier était écrasé par un zéro.


#### 2020-05-07

* Réécriture du système de fichier pour utiliser la programmation et l'effacement par bloc plus rapide que les opérations octet par octet. 

#### 2020-05-06

**session 2** 

* Débuté modification au système d'écriture dans la mémoire FLASH/EEPROM pour utliser le mode par bloc plus rapide. 

**session 1**

* Modifié *next_token* pour améliorer la performance. 
```
>t=ticks:for a=1 to 100:for b=1to10000:next b:next a:? ticks-t
8955

>t=ticks:for a=1to10000:b=rnd(50):next a:? ticks-t
 584

>t=ticks:for a=1 to 10000:b=3*5+rnd(1000):next a:? ticks-t
 827
```

#### 2020-05-05

**session 2**

* modifier *next_token* pour améliorer la performance. Modifié valeur de **TK_VAR** et **TK_INTGR.**

* Corrigé bogue dans AUTORUN, Affiachait une erreur de syntaxe sur argument chaîne vide.

```
>t=ticks:for a=1 to 100:for b=1to10000:next b:next a:? ticks-t
8955

>t=ticks:for a=1to10000:b=rnd(50):next a:? ticks-t
 613

>t=ticks:for a=1 to 10000:b=3*5+rnd(1000):next a:? ticks-t
 868

```

**session 1**

* merge branche test dans master. 

* Corrigé bogue dans *insert_line*.

* Corrigé bogue dans **INPUT**.

* Modifié boucle de l'interpréteur. 

* Corrigé bogue dans **NEW**.

* Corrigé bogue dans *spi_enable*

* Corrigé bogue dans appel de fonctions imbriquées qui retournait une erreur de syntaxe injustifiée. Cause du problème: adresse de retour dans la fonctions *func_args* était sauvegardée dans une variable. Cette valeur était écrasée par l'imbrication de fonctions.

#### 2020-05-03,04

* Réécriture de code compilateur. Le *pad* a été agrandi à 128 octets et sert de tampon pour la compilation. La ligne compilée est copié à partir du *pad* vers la zone texte.

#### A faire

* Corrigé bogue dans insert_line. Insertion supprime les lignes suivantes.

* Corrigé bogue dans INPUT

### 2020-05-02

* tests des commandes et mise à jour du manuel [tbi_reference.md](tbi_reference.md)

* Corrigé bogue dans commande BASIC **INPUT**. La pile n'était pas balancée ce qui conduisait à un crash.  

* Corrigé bogue dans commande BASIC **LET**. N'acceptait pas la variable tableau **@**.

* Corrigé bogue dans commande BASIC **LIST**. La commande ne gérait pas les arguments correctement.

* Corrigé bogue dans commande **END** qui ne réinitalisait pas la pile. 

#### A FAIRE:
   
* Vérifier commandes SPI ne fonctionnent plus 


### 2020-05-01

* Retravaillé le code pour améliorer la performance de l'interpréteur. 

* Modifié commande **WORDS**, mainteant imprime le nombre de mots dans le dictionnaire.

* Réécrit commande "PRINT" 

* Réoganisation des valeurs des constantes __TK__ pour optimiser le sélecteur de token dans next_token.

Derniers test de vitesse
```
>t=ticks:for a=1 to 100:for b=1to10000:next b:next a:? ticks-t
9639

>t=ticks:for a=1to10000:b=rnd(50):next a:? ticks-t
 658

>t=ticks:for a=1 to 10000:b=3*5+rnd(1000):next a:? ticks-t
 909

>

```

### 2020-04-30

* Ajout du fichier **xmodem.asm** pour permettre de le transfert de progammes BASIC entre le PC et la carte NUCLEO. XMODEM  est un protocole de transfert de fichiers datant des années 197x. Il y aura deux nouvelles commandes BASIC pour le transfert:  
    * **FILERX**, servira à recevoir un fichier à partir du PC. 
    * **FILETX** *nom_fichier*, servira à transmettre le programme en RAM dans un fichier sur le PC.

* Renommé  **PABasic.asm** en **TinyBasic.asm**.

* Renommé  **pab_macros.inc** en  **tbi_macros.inc**.

* Corrigé bogue dans **SAVE**, **LOAD**, **FORGET** 

* Mofifié **AUTORUN** maintenant une chaîne vide fournie en argument annulle un autorun existant. Et l'absence d'argument affiche le nom du fichier autorun. 

* **CTRL-C** Réinitialize la carte. 

* **CTRL-Z** Annule un autorun et réinitialize la carte.  

### 2020-04-29

* Éliminé la pile *dstack*. L'architecture du ST8 se prête mal à la réalisation d'une machine virtuelle à deux piles. Je pense améliorer la performance en éliminant cette pile pour n'utiliser que la pile définie par l'architectrue du MCU.

Même tests pour voir gain de performances 
```
>t=ticks:for a=1 to 100:for b=1to10000:next b:next a:? ticks-t
9763

>t=ticks:for a=1to10000:b=rnd(50):next a:? ticks-t
 666

>t=ticks:for a=1 to 10000:b=3*5+rnd(1000):next a:? ticks-t
 925

>

```
C'est sur le test des boucles FOR...NEXT que le gain est le plus visible. Ce n'est pas surprenant puisque c'est boucles utilisait le *dstack*.


* Réécriture la commande **SHOW**  pour un affichage plus pratique.

* Élimination du code devenu inutile. 

### 2020-04-28

* Création d'une branche test. J'essaie d'améliorer la performance de l'interpréteur. Dans la version actuelle 1,000,000 de boucles FOR..NEXT vide s'exécutent en 11256msec. Je vais réécrire complètement la machine virtuelle en espérant un gain significatif.
```
> ' Quelque test de performances

>t=ticks:for a=1 to 100:for b=1to10000:next b:next a:? ticks-t
11256

>t=ticks:for a=1to10000:b=rnd(50):next a:? ticks-t
 754

>t=ticks:for a=1 to 10000:b=3*5+rnd(1000):next a:? ticks-t
1017

>
```

### 2020-04-26

* Mise à jour du document [tbi_reference.md](tbi_refenrence.md) 

* Renommé commande **STOP** -> **END** pour être conforme aux interpréteurs BASIC de l'époque. 

* Renommé la commande **BREAK** -> **STOP**  pour être conforme aux interpréteurs BASIC de l'époque.

* Modification de l'interface SPI. Maintenant la pin D10 est configurée en mode sortie automatiquement lors de l'activation du périphérique SPI par la commande **SPIEN** 

* Ajout du mot **SPISEL** *0|1*  pour sélectionné ou désélectionné le SPI i.e. contrôle de la ligne **~CS**. 

* Les commandes et fonctions pour l'interface SPI sont 
    * **SPIEN** *0|1*   Pour l'activation/désactivation 
    * **SPISEL** *0|1*  Pour la sélection/désélection 
    * **SPIWR** *byte {,byte}*  Pour envoyer 1 ou plusieurs octets par SPI
    * **SPIRD** Fonction qui retourne un octet lu par SPI.

Programme de démonstration d'utilisation du SPI avec mémoire EEPROM externe 25LC640
```
>li 
   10 SPIEN 2,1' spi clock 2Mhz
   20 SPISEL 1:SPIWR 6:SPISEL 0
   22 SPISEL 1:SPIWR 5:IF NOT (AND (SPIRD ,2)):GOTO 200
   24 SPISEL 0
   30 SPISEL 1:SPIWR 2,0,0
   40 FOR I =0TO 31:SPIWR RND (256):NEXT I 
   42 SPISEL 0
   43 GOSUB 100' wait for write completed 
   44 SPISEL 1:SPIWR 3,0,0
   46 HEX :FOR I =0TO 31:PRINT SPIRD ,:NEXT I 
   50 SPISEL 0
   60 SPIEN 0,0
   70 END  
   90 ' wait for write completed 
  100 SPISEL 1:SPIWR 5:S =SPIRD :SPISEL 0
  110 IF AND (S ,1):GOTO 100
  120 RETURN 
  200 PRINT "Echec activation bit WEL dans l'EEPROM"
  210 SPISEL 0
  220 SPIEN 0,0

>run
 $3F $99 $19 $73 $4C $FE $B1 $66 $88 $7F $31 $FD $AD $BA $78 $1B $78 $2F $23 $59 $7D $C6 $2E $D0 $80 $7A $19 $E8 $53 $BC  $5 $AC
>run
 $A0 $AE $DD $32 $C5 $D6 $DB $43 $90 $CA $CF $60 $37 $B9 $D8 $C0  $7 $3B $AE $B2 $58 $5F $B5 $33 $8D $1D $7D $3F $94 $7D $FF $F3
>

```

### 2020-04-25 

*  Ajout de commandes et fonctions pour l'interface SPI. Test interface utilisant une mémoire EEPROM 25LC512 montée sur le connecteur CN8 de la carte NUCLEO.
    * D10   ~CS   sur pin 1 de l'EEPROM, sélectionne l'EEPROM lorsqu'à zéro.
    * D11   MOSI  sur pin 5 de l'EEPROM, données envoyées à l'EEPROM 
    * D12   MISO  sur pin 2 de l'EEPROM, données reçues de l'EEPROM
    * D13   SCK   sur pin 6 de l'EEPROM, signal clock contrôlé par la carte. 
    * GRD         sur pin 4 de l'EEPROM, 0 volt alimentation. 
    * VDD         sur pins 3,7,8 de l'EEPROM, 3 volt alimentation. 

    Je suis capable d'écrire et de lire dans l'EEPROM externe.
    ```
    5 ' programme pour tester l'EEPROM 25LC640
   10 PMODE 10,POUT :DWRITE 10,1 ' D10 en sortie , mettre à 1.
   20 SPIEN 0,1 ' active le SPI 
   30 DWRITE 10,0:SPIWR 6:DWRITE 10,1  'active le bit WEL dans l'EEPROM
   31 ' on vérifie si la commande prédécente a fonctionnée.
   32 DWRITE 10,0:SPIWR 5:IF SPIRD <>2:PRINT "failed":DWRITE 10,1:STOP 
   40 DWRITE 10,0:SPIWR 2,0,0,1,2,3:PAUSE 5:DWRITE 10,1 : écris 1,2,3 dans L'EEPROM
   50 DWRITE 10,0:SPIWR 3,0,0 ' commande de lecture 
   60 PRINT SPIRD ,SPIRD ,SPIRD :DWRITE 10,1 ' lecture des 3 octets écris. 

    run
   1   2   3
   
    ```


### 2020-04-24

* corrigé bogue dans **INPUT** 

* Modifié *print_int* pour qu'il y est moins d'espace lorsque de la commande **LIST** est invoquée. 

* Modifié routine d'initialisation du MCU. Au démarrage **LD2** est allumée et un beep 150 msec est entendue. Juste avant que *warm_init* soit appellée.  

* Ajouter
    * directive **DATA**  permettant d'inclure des données dans un programme.
    * fonction **READ** pour lire les données définie par **DATA**. 
    * Commande **DATALN** *expr* pour localiser le pointeur de **READ** sur une ligne de **DATA** spécifique. 
    * Commande **RESTORE** remet le pointeur de **DATA** au début de la première ligne de données. 

#### exemple d'utilisation du DATA 
```
>list
    5 ' joue 4 mesures de l'hymne a la joie
   10 RESTORE 
   20 DATA 440,250,440,250,466,250,523,250,523,250,466,250,440,250
   30 DATA 392,250,349,250,349,250,392,250,440,250,440,375,392,125
   40 DATA 392,500
   50 FOR I =1TO 15:TONE READ ,READ :NEXT I 

```
la commande **RESTORE** ou **DATALN** doit-être utilisée pour initialiser le pointeur avant de faire un **READ** 

### 2020-04-23

* Retravaillé les routines *goto*,*gosub*, *return*. Maintenant un **GOSUB** n'est pas obligé d'être la dernière instruction sur la ligne. 

* Remplacé les constantes systèmes par des fonctions qui retourne la valeur de la constante. Ça permet de retrouver le bon nom lors du désassemblage. le type de jeton TK_CONST a été éliminé. 

* Modification à la routine *compile*, acceptait les numéros de lignes négatifs. Les numéros de lignes doivent-être dans l'interval **{1..32767}**. 

* révision du code source.

### 2020-04-22

* Modification de la configuration  du UART pour utiliser l'interruption sur réception d'un caractère. Ceci pour permettre au caractère ASCII 3 i.e. CTRL-C d'arrête l'exécution d'un programme BASIC s'exécutant en boucle infinie.

* corrigé bogue dans *next_token* 


### 2020-04-21

* Renommé la fonction **PWR** -> **BIT** 

* Ajouter la fonction **INVERT**(*expr*)  inverse tous les bits. i.e. Complément de 1.

* Ajout de constantes symboliques pour Les noms de port GPIO. **PRTA..PRTI**.

* Ajout de la structure de contrôle **DO...UNTIL _expr_**

### 2020-04-19

* Modification de **IDWGEN**. L'argument représente un multiplede 62,5µsec. 

* Modification à la routine UserButtonHandler. Correction bogue, la ligne BASIC au niveau de l'interruption n'était pas imprimée correctement.

* Correction bogue dans **write_byte**, qui empêchait la modification des options à l'adresse **0x4800**.

* Abandon de la commande **BEEP** remplacée par la commande **TONE** plus flexible. Cette commande utilise la minuterie **TIMER2/CH1** en mode PWM pour générer une tonalitée.


### 2020-04-18

* Ajout de la commande **IWDGEN** *expr*, Auto wakeup watchdog

* Ajout de la commande **IWDGREF**, rafraichie le compteur IWDGPR

* Ajout de la fonction **LOG**(*expr*), retourne le log base 2 de *expr*

* Ajout de la fonction **PWR**(*expr*), retourne 2^*expr* 

* Renommé  **PWRADC** -&gt; **ADCON**

* Renommé  **ANREAD** -&gt; **ADCREAD**


### 2020-04-15

* Ajout de la commande AUTORUN *file* . Cette sert à définir un fichier à exécuter automatique au démarrage. Le nom du fichier est sauvegardé dans l'EEPROM à l'adresse 0x4000 

* Ajout de la commande TIMER *expr* . Celle-ci sert à initialiser une minuterie à rebours.

* Ajout de la fonction TIMEOUT. Celle-ci retourne vrai si le TIMER a expiré. 

* Ajout de la fonction NOT().  Cette fonction retourne la négation logique de l'expression. Retourne -1 si l'expression est nulle et 0 si non nul. 

* ajout de la fonction XPEEK(*expr1*,*expr2*).  Cette fonction sert à lire un octet dans la mémoire étendue au delà de 65535.

### 2020-04-14

* Ajout de la commande AWU et mise à jour du manuel tbi_reference.md 

### 2020-01-30

* Modification de PABasic.asm pour utiliser le **UART1** au lieu du **UART3**. Ce permet de se dispenser d'un adapteur de niveau RS-232 et de l'utilisatio d'un port sériel sur le PC. Le programmeur de la carte **NUCLEO-8S208RB** contient son propre émulateur de port sériel via la connection USB.


### 2020-01-28

* Poursuite du travail sur VM1

### 2020-01-26 

**session #2**

* Travail sur VM1 qui sera la prochaine version de Tiny BASIC. Cette version exécutera du bytecode sur une machine virtuelle.

**session #1**

```
>for a=0to15:?(a),:ne a
 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114
```
Ce problème est résolue, dans *factor* après l'appel récursif à relation la fonction *expect* était appellée sans sauvegarder la valeur de **X**.
```
>for a=0to15:?dread(a),:ne a
   1
syntax error
    0 FOR A = 0 TO  15 :PRINT DREAD (A ),:NEXT A 
last token id:    5
>
```
Ce problème est résolue. Dans digital_read l'argument de la fonction était retiré 2 fois de la pile dstack. 

* Ajout d'un exemple utilisant DWRITE dans le manuel de l'utilisateur.

### 2020-01-25
**session #3** 
* ajout fonction DREAD() et commande DWRITE. 

* Découvert bogue dans FOR..NEXT.
```
>for a=0to15:?(a),:ne a
 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114 114
>for a=0to15:?dread(a),:ne a
   1
syntax error
    0 FOR A = 0 TO  15 :PRINT DREAD (A ),:NEXT A 
last token id:    5
>
```

**session #2**

La carte **NUCLEO-8S208RB posssède des connecteurs compatible avec les cartes Arduino. Je vais donc créer des commandes et fonctions compatibles avec l'API Arduino.

* Ajout des constante **PINP** et **POUT** pour utiliser avec **PMODE**.

* Ajout de la commande PMODE pour configurer les GPIO D0-D15 en mode entrée ou sortie. Cette fonction est équivalente à la fonction Arduino *PinMode*.

* Renommé la fonction **RDADC** en **ANREAD** et limiter les entrées possible à {0..5} pour être compatible avec le connecteur Arduino CN4. Cette fonction devient équivalente à la fonction Arduio *AnalogRead*. 

* Mise à jour du [manuel de référence](tbi_reference.md).

**session #1**

* Ajout de la commande FCPU pour contrôler la fréquence de fonctionnement du CPU. 

* Mise à jour du [manuel de référence](tbi_reference.md)

### 2020-01-24

* Ajout des fonctions LSHIFT() et RSHIFT() 
* Mise à jour du manuel de référence Tiny BASIC.

### 2020-01-23

**session #2**
 
* Ajout des fonctions de bits AND(),OR() et XOR(). 
* Factorisation de code par ajout de la routine *func_args* pour réduire les répétitions.

**session #1**

* Corrigé bogue dans la fonction UBOUND(). Lorsqu'utilisée sur la ligne de commande ne tenait pas compte de la liste de tokens en exécution qui se trouve après *txtend*.
* Travail d'optimisation
    * élimination de la variable *lineno* et du code associé. Cette variable était assignée et sauvergardée à plusieurs endroit et pourtant elle n'était jamais lue.
    * Élimination de la variable *array_addr* car en fait il s'agit d'une constante dont la valeur est toujours égal à l'adresse de la variable *tib*. 
    * Retravaillé routine *search_lineno*. 

### 2020-01-22

* Retour à la branche master
* Ajout de l'attribut TK_CONST pour les fonctions qui retourne une constante. Évite de faire un appel de sous-routine.
* Ajout de la commande REBOOT pour réinitialiser le MCU.
* Retravailler routine next_token pour essayer de réduire son temps d'exécution. 

### 2020-01-21
* Création de la branche **vm1** pour tester un machine virtuelle à bytecode. Considérant l'architecture STM8 je crois qu'un modèle de machine virtuelle à une seule pile serait la plus performante. Tous les arguments et paramètres seront sur  la pile du cpu. Il s'agit d'une alltération majeure du système.

*  X registre de travail
*  Y compteur ordinal de la VM 
*  A registre de travail
*  acc16  accumulateur 
*  ptr16  pointeur 16 bits 


* Modification à commmande **BEEP expr1, expr2**. Maintenant la fréquence = 128000/(8*(expr1%31)).

### 2020-01-20

* Corrigé bogue dans commande FORGET
* Modifié commande PWRADC, deuxième argument maintenant optionnel.

* Travail sur [manuel de l'utilisateur](manuel_util_tb.md).

### 2020-01-19

* Corrigé bogue numéro 3. Afficher la position d'une erreur runtime n'est pas implémentée car la procédure serait trop complexe pour le bénéfice. Seule le dernier attribue lexical valide avant l'appel de tb_erreor est affiché sous la ligne de code où l'erreur s'est produite.

* Corrigé bogue numéro 2. 

* Ajout de la fonction BTEST()

* Résolue bogue 1 en créant des indentifiant lexical pour les différent type de fonctions. TK_IFUNC pour les fonctions qui retourne un entier. TK_CFUNC pour les fonctions qui retourne 1 caractère et TK_SFUNC pour les fonctions qui retourne un pointeur vers une chaîne de caractère. 

** BOGUES À RÉSOUDRE** 
1. La commande PRINT ne traite pas la fonction CHAR() correctement. La valeur ASCII du caractère est imprimé au lieu du caractère lui-même.
1. @ ne compile pas correctement.
1. tb_error n'affiche pas correctement la position d'une l'erreur détectée pendant la compilation.

### 2020-01-18

* Corrigé bogue dans remplacement et insertion et suppression de ligne de texte.

* Corrigé prt_basic_line  pour imprimé correctement les chaînes de caractères contentant des caractères de contrôles.

* Corrigé bogue dans système de fichiers.

* mergé branche tokenize to master

1. Commande SAVE 
### 2020-01-17

* Corrigé bogue causée par macro **_dbg_mark** qui ne sauvegardait pas CC

* Corrigé bogue dans boucle FOR imbriquées, le problème était dans la commande NEXT 
  qui ajout 2 à la longueur de la ligne. 
  
* Corrigé bogue dans insert_line, del_line 

* Modifié comportement de get_token pour keyword REM. Modifié commande REM

* Modifié prt_basic_line pour restaurer les commentaires.

* Correction routines du système de fichier pour l'adapter au nouvvel interpréteur

**BOGUES À RÉSOUDRE** 

1.  remplacement de ligne incorrecte.
1.  Suppression de ligne incorrecte.
1.  commande SAVE indique fichier sauvegardé mais ce dernier n'apparaît pas dans DIR.

### 2020-01-16

* bogue boucle FOR imbriquées ne marche pas sur plusieur lignes 

* bogue remplacement de ligne ne marche pas

### 2020-01-15

* Création branche expérimentale **tokeninze** 

### 2020-01-14

* Travail sur manuel utilisateur


### 2020-01-13
* Corrigé bogue dans sous-routine move.
* Corrigé bogue dans fonction GPIO 
