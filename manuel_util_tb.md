# Manuel de l'utilisateur de Tiny BASIC 

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
    5 'Software PWM, controle LD2 sur carte
    7 PRINT # 6,
   10 R = 511 :PRINT R ,
   20 K = 0 
   30 IF R :BSET GPIO ( 2 ,ODR ), 32 
   40 FOR A = 0 TO R :NEXT A 
   50 BRES GPIO ( 2 ,ODR ), 32 
   60 FOR A =A TO  1023 :NEXT A 
   70 IF QKEY :K =KEY 
   80 IF K =ASC (\u):GOTO  200 
   90 IF K =ASC (\d):GOTO  400 
  100 IF K =ASC (\q):STOP 
  110 GOTO  20 
  200 IF R < 1023 :R =R + 1 :GOTO  600 
  210 GOTO  20 
  400 IF R > 0 :R =R - 1 :GOTO  600 
  410 GOTO  20 
  600 PRINT "\b\b\b\b\b",R ,
  610 GOTO  20 
```
L'intensité de la LED est contrôlée à partir du terminal avec les touches **u** pour augmenter l'intensitée et **d** pour la réduire. La variable **R** contrôle l'intensitée. 
