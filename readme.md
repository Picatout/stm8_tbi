## 2022-06-10, version 2.0

* Nombreuses modfications par rapport à la version __1.x__. TinyBASIC est de moins en moins Tiny. Il ressemble de plus en plus à Microsoft BASIC tel qu'il existait sur les ordinateur 8 bits des années 80, tel que le Apple II, Commode VIC-20,C64 et Tandy TRS-80. Le comportement de plusieurs commandes a été modifié. Il faut consulter le [manuel de référence](tbi_reference.md).

  1. Les entiers sont maintenant de 24 bits au lieu de 16 bits. Ce qui permet d'accéder la mémoire étendue pour y enregistrer des données avec la commande
  **WRITE** et de les relire avec la commande **PEEK**. 

  1. Les commandes **GOTO** et **GOSUB** acceptent maintenant une étiquette comme cible.  Une étiquette (label) peut-être inscrit au début d'une ligne 
  à cet effet.

  1. Concernant la sauvegarde des programmes dans la mémoire FLASH du MCU. Il n'y a plus de sauvegarde dans la mémoire étendue. Cette mémoire n'est plus utilisée par le système BASIC. Cependant les applications peuvent l'utiliser avec la commande **WRITE** et la fonction **PEEK**. Puisque maintenant les entiers sont de 24 bits au lieu de 16 bits les adresses au delà de 65535 sont maintenant accessibles à ces 2 commandes. Les programmes sont conservés mainteant dans la mémoire sous l'adresse 65536 dans la partie qui n'est pas utilisée par le système BASIC.  En ce moment il reste environ 19000 octets 
  de libres. Ça va diminuer ave l'ajout de nouvelles fonctionnalités au système BASIC. 

  1. La commande **SAVE** n'accepte plus de nom de fichier. Le nom du programme doit-être indiqué sur la première ligne de celui-ci sous la forme d'une 
  étiquette (label). 
  
  1. La commande **FORGET** a été remplacé par la commande **ERASE**. Il est maintenant possible d'effacer un seul fichier. 

  1. Plusieurs commandes ont étées ajoutées. Voir le [manuel de référence](tbi_reference.md).

  1. Les fonctions **OR**, **AND** et **XOR** ont étées transformées en opérateurs infixes.

  1. De nombreux bogues ont étés détectés et corrigés.
  
## 2022-04-21 version 2.0

J'ai décidé de laisser tomber le système de fichier en mémoire flash étendue. Un seul programme est sauvegardé en mémoire FLASH et il s'exécute automatiquement au démarrage du MCU. Les commandes suivante sont donc disparues 
de la version 2.0: **DIR**,**FORGET** et **LOAD** 

La commande **SAVE** ne prend aucun argument et sauvegarde le programme en mémoire RAM dans la mémoire FLASH. Ce programme devient alors l'application qui s'exécute à l'initialisation de la carte. 

La nouvelle commande **ERASE \E|\F** Efface la mémoire EEPROM ou la mémoire FLASH en conservant seulement le système TinyBASIC. 

La nouvelle commande **EDIT** copie le programme qui a été sauvegardé avec la commande **SAVE** vers la mémoire RAM pour modification.

<hr>

Pour suivre l'évolution du projet vous pouvez consulter le [journal](journal.md).

Il s'agit d'une implémentation du [Tiny BASIC](https://en.wikipedia.org/wiki/Tiny_BASIC) originellement conçu par [Dennis Allison](https://en.wikipedia.org/wiki/Dennis_Allison) au milieu des années 197x. Cette implémentation est créée en me référend aux documents [TINYDISK.DOC](TINYDISK.DOC) et [TINYDISK.ASM](TINYDISK.ASM). Cependant elle n'est pas exactement identique. Comme il s'agit de programmer un microcontrôleur et non un ordinateur d'usage général des fonctions et commandes spécifiques à cet objectif sont ajoutées.

Ce système a été développé et testé sur une carte NUCLEO-8S208RB ![NUCLEO-8S208RB](docs/images/carte.png)

## utilisation
Il suffit de brancher la carte **NUCLEO-8S208RB** avec un cable USB au PC. 
Cette carte comprend son propre programmeur **ST-LINK/V2.1** ainsi qu'un canal de communication sériel utilisant le UART1 du mcu **STM8S208RB**. Tiny BASIC utilise ce canal de communication pour l'interface utilisateur. 

Sur le PC lorsqu'on branche le cable de la carte un nouveau périphérique **/dev/ttyACMx** apparaît:
```
jacques@HP8200:~/github/stm8_tbi$ ls /dev/ttyACM*
/dev/ttyACM0
jacques@HP8200:~/github/stm8_tbi$ 
```
Il faut donc configurer l'émulateur de terminal pour utiliser ce périphérique:

![configuration gtkTerm](docs/images/gtkTerm_config.png)

![capture écran](docs/images/TinyBASIC_boot_msg.png)
## fonctionnement 

Il s'agit d'un interpréteur. Au départ il s'agissait d'un interpréteur pur. C'est à dire que le texte source du programme était sauvegardé tel quel et était lu et analyser à chaque exécution. Il n'y avait  pas de génération de code intermédiaire pour exécution sur une machine virtuelle. L'avantage est au niveau de la simplicité. Par exemple la commande **LIST** ne nécessitait pas de désassemblage pour afficher le contenu du texte original puisque celui-ci était sauvegardé tel quel. 

L'inconvénient est au niveau de la vitesse d'éxécution qui est beaucoup plus lente. J'ai donc modifié le code pour utiliser une méthode intermédiaire entre la compilation en byte code pour une machine virtuelle et l'interprétation pure. Cette méthode consiste à remplacer le texte original en une liste d'unités lexicales. L'analyse lexicale n'est faite qu'une fois. Avec cette méthode l'exécution est 4 à 5 fois plus rapide selon mes tests. Par exemple le code suivant:
```
>t=ticks:for a=0 to 1000:next a:print ticks-t
  13
```
avait un temps d'exécution qui affichait 56 ou 57 millisecondes alors qu'avec cette nouvelle implémentation l'affichage oscille entre 12 et 13 millisecondes. 

L'inconvénient est que le code est plus complexe. Lorsqu'une ligne est saisie par l'utilisateur le texte est d'abord *compilée* en une liste d'unitée lexicale avant d'être exécutée. 

De plus la commande **LIST** qui était très simple est maintenant plus complexe car il faut *décompiler* la liste des unités lexicales pour afficher le programme. 

## Notes historique

* Avant même l'invention de l'expression *logiciel libre* Tiny BASIC a été le premier logiciel libre. Ce qui l'à rendu populaire sur les premier ordinateurs qui possédaient peu de mémoire RAM.

* La première version TRS-80 modèle I, était vendu avec 4Ko de mémoire RAM et une version de Tiny BASIC en ROM. Cependant ils ont rapidement ajouter les calculs en virgule flottante par la suite.  

* Les mots réservés **GOTO** et **GOSUB** du BASIC viennent de l'époque du FORTRAN alors que les espaces dans ce langage n'étaient pas significatifs. Ainsi dans Tiny BASIC qui avait adopté cette syntaxe on pouvait écrire **GOTO** au lieu de **GO TO**. Ce **GOTO** en un seul mot est devenu usuel dans de nombreux langages par la suite comme le **goto** du **C**. 

## documentation
* [manuel de référence de stm8 Tiny BASIC](tbi_reference.md)
* [manuel de l'utilisateur de stm8 Tiny BASIC](manuel_util_tb.md)
* [journal de développement](journal.md)


