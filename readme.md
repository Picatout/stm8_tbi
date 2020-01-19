**AVERTISSEMENT Ce projet est en construction et le code change continuellement. Il ne s'agit pas d'une version stable.**

Il s'agit d'une implémentation du [Tiny BASIC](https://en.wikipedia.org/wiki/Tiny_BASIC) originellement conçu par [Dennis Allison](https://en.wikipedia.org/wiki/Dennis_Allison) au milieu des années 197x. Cette implémentation est créée en me référend aux documents [TINYDISK.DOC](TINYDISK.DOC) et [TINYDISK.ASM](TINYDISK.ASM). Cepandant elle n'est pas exactement identique. Comme il s'agit de programmer un microcontrôleur et non un ordinateur d'usage général des fonctions et commandes spécifiques à cet objectif sont ajoutées.

Ce système a été développé et testé sur une carte NUCLEO-8S208RB ![NUCLEO-8S208RB](docs/images/carte.png)

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


