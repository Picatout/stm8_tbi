# Notes de révision

## 2022-12-24, V3.0R4
* Il s'agit de recodage majeur qui a commencé par le recodage du module [arithm24.asm](arithm24.asm) pour améliorer la performance de l'évaluation des expressions arithmétiques.

* La pile des arguments xstack qui utilisati le registre **Y** comme pointeur de pile a été supprimé. Les arguments des commandes et fonctions BASIC sont maintenant passé sur la pile matérielle.
Le registre **Y** est maintenant utilisé comme registre temporaire. 

* Les commandes et fonctions qui maninulaient la pile des expressions ont été supprimés. Empruntées au langage Forth elle ne cadraient pas vraiment avec Tiny BASIC. Les commandes et fonctions éliminées sont: 
    * **ALLOC** 
    * **DROP**
    * **PICK**
    * **POP** 
    * **PUSH**
    * **PUT** 

