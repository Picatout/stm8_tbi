##### 2022-04-24 

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
