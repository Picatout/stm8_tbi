### 2020-01-24

**sessin #1**

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
