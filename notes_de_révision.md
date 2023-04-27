# Notes de révision

## 2023-04-27 

### version V4.0R0 

* Cette version étant incompatible avec les versions antérieures elle possède un numéro de version majeur supérieur. 

    *  La fonction **BIT()**  a étée suprimée. Le même résutlat peut-être obtenu avec la fonction **LSHFIT()**.
    *  Les commandes **BRES**,**BSET** et **BTOGL** ont une sémantique différente  incompatible avec l'usage des versions antérieures.

* La commande **RANDOMIZE** a été ajoutée. 

* Des modifications importantes à la machine virtuelle ont été effectuées pour la rendre plus performante.

## 2023-04-22

* Version V3.2R1 
    * Il s'agit d'une optimisation de performance de la machine virtuelle. Ce nouveau modèle de la machine virtuelle utilise le registre **Y** comme compteur ordinal au lieu du registre **X** qui devait-être continuellement sauvegardé dans la variable système **basicptr**.  De plus les appels au routines de commandes sont faites par une instruction **JP** au lieu d'une instruciton **CALL** et la sortie des routines utilise la macro **_next**  qui est un saut vers **interp_loop**. D'autres optimisations ont étées effectuées pour améliorer la rapidité de la machine virtuelle.
    Le gain de performance est appréciable. Le gain varie de 25% à 50% dépendant du type d'opération.

    * Des bogues ont étés découverts et corrigés. 

    * Correction d'une erreur sur un lien interne dans les manuels de références.

    * Tout les programmes dans le répertoire **BASIC** fonctionnent correctement.

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

