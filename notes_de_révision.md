# Notes de révision

## 2023-03-09 

* Version V3.1R12 ajoute 2 commandes 
    * **CLK_HSE** pour commuter le master clock vers un cristal ou un oscillateur externe.
    * **CLK_HSI** pour commuter le master clock vers l'oscillateur interne de 16Mhz.  

## 2022-12-30 V3.1R1 

Ajout des commandes PWM. Et mise à jour des manuels de références. Création d'une pré-release pour cette version.

*  __PWM.CH.EN__
* __PWM.EN__
* __PWM.OUT__ 


## 2022-12-24, V3.0R4
* Il s'agit de recodage majeur qui a commencé par le recodage du module [arithm24.asm](arithm24.asm) pour améliorer la performance de l'évaluation des expressions arithmétiques.

* La pile des arguments xstack qui utilisait le registre **Y** comme pointeur de pile a été supprimée. Les arguments des commandes et fonctions BASIC sont maintenant passés sur la pile matérielle.
Le registre **Y** est maintenant utilisé comme registre temporaire. 

* Les commandes et fonctions qui maninulaient la pile des expressions ont été supprimés. Empruntées au langage Forth elles ne cadraient pas vraiment avec Tiny BASIC. Les commandes et fonctions éliminées sont: 
    * **ALLOC** 
    * **DROP**
    * **PICK**
    * **POP** 
    * **PUSH**
    * **PUT** 

