# Manuel de l'utilisateur de TinyBASIC 

Tiny BASIC pour STM8 est un langage simple qui cependant permet de configurer et d'utiliser tous les périphériques du microcontrôleur. La seule limitation est que les interruptions ne sont pas utilisée. Tiny BASIC lui-même utilise l'interruption du TIMER4 et l'interruption externe 4 pour le bouton utilisateur qui est sur la carte. 

L'objectif de ce manuel est de présenter les fonctionnalités du langage à travers des applications du microcontrôleur. Je n'ai pas définie toutes les constantes des registres du MCU dans le langage il est donc nécessaire de se réréfer au [feuillet de spécifications](docs/stm8s208rb.pdf) ainsi qu'au manuel de référence du [STM8S](docs/stm8s_reference.pdf). Le manuel d'utilisateur de la carte [NUCLEO-8S208RB](docs/nucleo-8s208rb_user_manual.pdf) est aussi utile.

Il est aussi recommander de lire en pré-requis de ce manuel la [référence du langage Tiny BASIC](readme.md)

### abbréviation des commandes 
Le nom des commandes peut-être abrégé au plus court à 2 lettres. Il est avantageux d'utiliser l'abbréviation la plus courte pour sauver de la mémoire mais aussi pour un léger gain en vitesse d'exécution.

la commande **WORDS** affiche la liste complète des mots qui sont dans le dictionnaires. Cette liste n'est pas en ordre alphabétique mais dans l'ordre de classement dans le dictionnaire. Il est préférable de mettre les mots les plus utilisés au début du dictionnaire.

nom|abrévation
-|-
ABS|AB
ASC|AS
BREAK|BREA
BRES|BR
BSET|BS
BTOGL|BT
BYE|BY
CHAR|CH
CRH|CRH
CRL|CRL
DDR|DD
DEC|DE
DIR|DI
EEPROM|EE
FOR|FO
FORGET|FORG
GOSUB|GOS
GOTO|GOT
GPIO|GP
HEX|HE
IDR|ID
IF|IF
INPUT|IN
KEY|KE
LET|LE
LIST|LI
LOAD|LO
NEW|NEW
NEXT|NE
ODR|OD
PAUSE|PA
PEEK|PE
POKE|PO
QKEY|QK
PRINT|?
REMARK|'
RETURN|RET
RND|RN
RUN|RU
SAVE|SA
SHOW|SH
SIZE|SI
SLEEP|SL
STEP|STE
STOP|ST
TICKS|TI
TO|TO
UBOUND|UB
UFLASH|UF
USR|US
WAIT|WA
WORDS|WO
WRITE|WR


## exemple 1 blinky 
Sur la carte il y a une LED indentifiée **LD2**. Cette LED est connecté à la pin 5 du GPIO C. La proche en question est pré-configurée en mode sortie par le système Tiny-BASIC. Pour contrôler son état il suffit donc de modifier l'éatt du bit 5 du registre **ODR** du GPIO C. Dans ce premier exemple nous allons faire clignoer cette LED au rythme de 1 fois par seconde.
```
   10 bt gp(2,odr),32
   20 pa 500
   30 got 10
```
Notez que j'utilise les abbréviations les plus courtes de chaque commande.

## exemple 2 PWM logiciel

Dans cet exemple l'intensité de la LED est contrôlée par PWM logiciel.
```
   10 r=0
   15 k=0
   20 if r:bs gp(2,odr),32
   30 for a=0to r:ne a
   35 br gp(2,odr),32
   40 for a=a to 256:ne a
   60 if qk: k=key 
   70 if k=asc(\u):gosub 100
   80 if k=asc(\d):gosub 200
   84 if k=asc(\q):stop
   90 goto 15
  100 if r<256:r=r+1
  110 ret
  200 if r>0:r=r-1
  210 ret
```
L'intensité de la LED est contrôlée à partir du terminal avec les touches **u** pour augmenter l'intensitée et **d** pour la réduire. La variable **R** contrôle l'intensitée. 
* **10** et **15** initialiation de variables 
* **20** si **R** est **>0** on allume la LED 
* **30** on compte jusqu'à ce que la variable **A** dépasse la valeur de **R** 
* **35** on éteint la LED 
* **40** on compte jusqu'à ce que la variable **A** dépasse 256.
* **60** **QKEY** est appelée pour vérifiée s'il y a un caractère reçu de la console. Si c'est le cas le caractère est lu dans la variable **K**.
* **70**,**80** et **84** on compare la valeur de **K** avec les caractères ASCII *u*,*d* et *q*. 
* **90** on boucle à **15** au début du cycle **PWM**.
* **100** sous-routine pour augmenter l'intensité.
* **200** sous-routine pour réduire l'intensité.