[français](tbi_reference_fr.md)

# STM8 Tiny BASIC version 2.5 language refenrece

<a id="main-index"></a>
## main index 

* [Data types](#data)

* [Variables](#variables)

* [Arithmetic expressions](#expressions)

* [Syntax](#syntaxe)

* [Numeric bases](#bases)

* [Command line](#cli)

* [BASIC commands and functions](#index)

* [Files system](#files)

* [Firmware installation](#install)

* [Using board](#using)

* [Sending a BASIC program to board](#send)

* [Source code](#sources)
<hr>

[main index](#index-princ)
<a id="data"></a>
### Data types 

The only data type supported is 24 bits signed integers in range **-8388608...8388607**.

For [PRINT](#print) and [INPUT](#input) commands and only for these 2 commands quoted string are supported. 

Also **\c**,  i.e. a backslash followed by an ASCII character is also supported by **PRINT** and as parameter for some commands. 

It is also possible to print a character from its ASCII code usint [CHAR](#char) function. This function can also be used in expressions. When an expression using [CHAR](#char) function is given as a parameter to command [PRINT](#print) the [CHAR](#char) function must not be the first factor of the expression.
```
 >? char(33),2*char(33)
!	66 

>? char(33)*2
!
run time error, syntax error
    0 ? CHAR ( 33 ) * 

>
``` 

<hr>

[main index](#index-princ)
<a id="variables"></a>
### Variables 

In Tiny BASIC there was only 26 variables given the names of alphabet letters {**A..Z**}. This hold in this BASIC but more variables can be created using keyword [DIM](#dim). The maximum length of the dynamic variables is 15 characters. 

### Array 
There is a predefine single dimension array named **'@'**. A minimum 10 elements are reserved for this array but its actual size depend on program size and the number of dynamic variables and constants defined in the program.
The leftover free space is given to **@** array. 

The first indice of the array is **1** and the last is known by invoking [UBOUND](#ubound) function. 

### Labels 
**Labels** are name used as first element of a BASIC line to identify a [GOSUB](#gosub) or [GOTO](#goto) target. 

Labels name have the same format as dynamic variables and constants names. 

1. Maximum 15 characters 
1. Begin with a letter 
1. Can include digits,'**.**','**_**' and '**?**' characters
<hr>

[main index](#index-princ)
<a id="expressions"></a>
### Arithmetic expressions
There is 5 arithmetic operators, plus parenthesis. Order of priority is:

1. '**(**'expression'**)**'
1. '**-|+**' unary minus or plus.  
1. '__*__' multiplication, '__/__' division and '__%__' modulo 
1. '__+__' addition and '__-__' substraction

Quotient is rounded toward zero. 

### Relational operators 
Expressions can be compared for size with the following operators. Relations return -1 for true and 0 for false.

1. **'&gt;'**   True if left is greater than right expression.
1. **'&lt;'** True if left is smaller than right expression.
1. **'&gt;='** True if left is greater or equal to right expression. 
1. **'&lt;='** True if left is smaller or equal to right expression. 
1. **'='** True if both expressions have the same value. 
1. **'&lt;&gt;'** or **'&gt;&lt;'** True if expressions have a different value.

### Boolean operators 
The **NOT**,**AND**,**OR** and **XOR** are binary operators like their machine level equivalent. But as relations return only **0|-1** they are effective as boolean expression operators used as condition in [IF](#if) and [UNTIL](#until) statement. 
<hr>

[main index](#index-princ)
<a id="syntax"></a>
### Syntax 
The code use for writing program is [ASCII](https://en.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange).

Each program line start with a line number in range {1..32767} followed optionally by a label then a list of commands separated by **':'** character. If no line number is given the line is compiled and interpreted immedialety.
```
>let t=ticks:for i=1 to 10000: let a=10:next i : ? ticks-t
400  
```
A command is followed by its parameters list. The comma separate the parameters. Function parameters must be between parentheses but functions without parameters don't require parenthesis. 

As names can comprise digits it is important to put a space after a command or function name if it is followed by un number. 
```
?3*5  ' don't need space after '?'.
 15 

> for i=1to 100 :? i;: next i  ' need a space between 'to' and '100' 
```

Names can be entered in lower case and are converted to upper case. The language is not case sensitive.

The command [PRINT](#print) can be replacec by [?](#print).

The keyword [REM](#rem) can be replaced by a tick **'**. 

End of line mark the end of command. There is no command continuation on next line.
<hr>

[main index](#index-princ)
<a id="bases"></a>
### Numeric bases
Integers can be typed in 3 numeric bases. 

1. Decimal: ['-'|'+']*digit+
    * -1343 
    * +4677 
    * 987
1. Hexadecimal: ['-'|'+']*hex_digit+
    * -$ffe
    * +$134a
    * $A5a5
1. binary: ['-'|'+']*['0'|'1']+
    * -%101
    * +%1011
    * %11111101 

Integers are printable only in decimal or hexadecimal.

<hr>

[main index](#index-princ)

<a id="cli"></a>
## Command line

At startup a beep is sounded and system information is displayed on terminal. followed by
**&gt;** which is the prompt.
```
Tiny BASIC for STM8
Copyright, Jacques Deschenes 2019,2022
version 2.5R1

>
```
From there the user can enter direct commands or edit program lines. A line is limited to 79 characters and edition is terminated by **ENTER** key. When **ENTER** is pressed the input text is compiled to a tokens list. If there no line number this tokens list is executed immediately.

Otherwise the line is inserted in program space in RAM area. 

* Line numbers are limited to range {1...32767}.

* if an existing line with the same number as the last edited one exist the new one 
replace it. 

* If the new line as no text an a line with that number exist then it is erased.  

* Lines are inserted sorted in increasing line number. 

Some commands can only be used in direct mode others only inside programs. An error is displayed if a command is used in bad context. 

The program in RAM is lost each time then MCU is resetted but it can be save in FLASH memory using [SAVE](#save) commmand.

On Linux systems it is possible to write programs in a text editor on the PC the send it to the board using [send.sh](send.sh) script.

### Editing hot keys

The following hot keys can be used while entering a text line in terminal.

key|function 
-|-
BS|Delete character left of cursor 
ln CTRL+E|**ln** being a line number this display that line for editing. 
CTLR+R|Redisplay last line entered.
CTRL+D|Delete currently edted line. 
HOME| Move cursor to beginning of line.
END| Move cursor to end of line.
left arrow| Move cursor left one character. 
right arrow| Move cursor right one character.
CTRL+O|Toggle between insert and overwirte mode. Cursor change shape.
<hr>

[main index](#index-princ)
<a id="index"></a>
# Commands and functions reference

**{C,P}** after command name indicate which context is valid for this command. **C** for command line and **P** for program. 

[main index](#index-princ)

<a id="index"></a>
## Vocabulary index
name|description 
-|-
[ABS](#abs)|function that return absolute value.
[ADCON](#adcon)|Power analog to digital converter.
[ADCREAD](#adcread)|Read analog input pin.
[ALLOC](#alloc)| Allocate space on data stack.
[AND](#and)| Boolean operator.
[ASC](#asc)|Return ASCII value of a character.
[AUTORUN](#autorun)|Enable or disable program auto run.
[AWU](#awu)| Put board in sleep mode for some msec.
[BIT](#bit)| Compute 2^bit. 
[BRES](#bres)|Reset a bit in a peripheral register.
[BSET](#bset)|Set a bit in a peripheral register.
[BTEST](#btest)|Return the state of a bit in a peripheral register.
[BTOGL](#btogl)|Toggle a bit in a peripheral register.
[BUFFER](#buffer)|Allocate a buffer in RAM.
[BYE](#bye)|But board in sleep mode.
[CHAIN](#chain)|Chain program execution. 
[CHAR](#char)|Return the character corresponding to ASCII code.
[CONST](#const)|Keyword to define symboli constants.
[CR1](#cr1)|Return offset of GPIO CR1 register.
[CR2](#cr2)|Return offset of GPIO CR2 register.
[DATA](#data)|keyword that introduce a data line.
[DDR](#ddr)|Return the offser of GPIO DDR register.
[DEC](#dec)|Define decimal base as output for [PRINT](#print) command.
[DIM](#dim)|Keyword used to define dynamic variables.
[DIR](#dir)|Lis programs saved in FLASH memory.
[DO](#do)|Keyword to introduce a  DO..UNTIL control structure.
[DREAD](#dread)|Read a digital pin.
[DROP](#drop)| Drop top element of data stack.
[DWRITE](#dwrite)|Write a digital pin.
[EDIT](#edit)|Load in RAM a program saved in FLASH for edition.
[EEFREE](#eefree)|Return EEPROM free address.
[EEPROM](#eeprom)|REturn EEPROM start address.
[END](#end)|Terminate program execution.
[ERASE](#erase)|Erase a program saved in FLASH memory.
[FCPU](#fcpu)|Set MCU operating frequency.
[FOR](#for)|Keyword that start a FOR..NEXT control structure
[FREE](#free)|Return free RAM bytes.
[GET](#get)|Read a character in variable, not wait.
[GOSUB](#gosub)|Subroutine call.
[GOTO](#goto)|Unconditional jump.
[HEX](#hex)|Set hexadecimal base for [PRINT](#print) command.
[I2C.CLOSE](#i2c_close)| Close I2C peripheral. 
[I2C.OPEN](#i2c_open)| Open I2C peripheral.
[I2C.READ](#i2c_read)| read data from I2C peripheral.
[I2C.WRITE](#i2c_write)| Write data to I2C peripheral.
[IDR](#idr)|Return GPIO IDR register offset.
[IF](#if)|Keyword for conditional execution.
[INPUT](#input)|Input number in a variable.
[IWDGEN](#iwdgen)|Enable Independant Watchdog Timer.
[IWDGREF](#iwdgref)|Refresh IWDG before it expire.
[KEY](#key)|wait a key from termnal.
[KEY?](#qkey)|Check if there is a key waiting in terminal queue.
[LET](#let)|Keyword to initialize variables.
[LIST](#list)|List program in RAM.
[LOG2](#log)|Return base 2 log of an integer.
[LSHIFT](#lshift)|Shift left an integer.
[NEW](#new)|Clear RAM memory from program.
[NEXT](#next)|Close FOR..NEXT loop.
[NOT](#not)| Boolean NOT operator.
[ODR](#odr)|Return GPIO ODR register offset.
[ON](#on)|Keyword for selective GOTO or GOSUB. 
[OR](#or)|Boolean operator OR.
[PAD](#pad)|Return address of 128 bytes working buffer.
[PAUSE](#pause)|Suspend execution for some milliseconds.
[PEEK](#peek)|Return byte value at some address.
[PICK](#pick)|Return integer from data stack at selected position.
[PINP](#pinp)|Read one of Arduino digital pin.
[PMODE](#pmode)|Set OUT|INP mode of an Arduino Pin.
[POKE](#poke)|Set byte value at some address.
[POP](#pop)|Function that remove and return top of data stack .
[POUT](#pout)|Change state of Arduino digital pin.
[PRINT or ?](#print)| Print, string, charater or integer to terminal. 
[PORTA](#prtx)|Return base address GPIO A 
[PORTB](#prtx)|Return base address GPIO B
[PORTC](#prtx)|Return base address GPIO C
[PORTD](#prtx)|Return base address GPIO D
[PORTE](#prtx)|Return base address GPIO E
[PORTF](#prtx)|Return base address GPIO F
[PORTG](#prtx)|Return base address GPIO G
[PORTI](#prtx)|Return base address GPIO I
[PUSH](#push)|Push integer on data stack.
[PUT](#put)| Put an integer on data stack at selected position.
[READ](#read)|Read in a variable data item from DATA line.
[REBOOT](#reboot)|Reinitialize MCU.
[REM ou '](#rem)| Start a comment.
[RESTORE](#restore)|Reinitialize DATA pointer.
[RETURN](#return)|Exit from subroutine.
[RND](#rnd)|Return a random number.
[RSHIFT](#rshift)|Shift right an integer.
[RUN](#run)|Execute program.
[SAVE](#save)| Save program in RAM to FLASH memory. 
[SIZE](#size)| Display address and size of active program.
[SLEEP](#sleep)|Put MCU in low energy mode.
[SPIEN](#spien)|Enable SPI peripheral.
[SPIRD](#spird)|Read data from SPI peripheral.
[SPISEL](#spisel)|Select SPI channel.
[SPIWR](#spiwr)|Write data to SPI peripheral.
[STEP](#step)|Keyword used in FOR..NEXT loop to set increment.
[STOP](#stop)|Stop program execution without resetting it.
[TICKS](#ticks)|Return milliseconds coutn since power up.
[TIMEOUT](#timeout)|Return true if TIMER as expired.
[TIMER](#timer)|Set TIMER.
[TO](#to)|Keyword used in  FOR..NEXT loop to set limit.
[TONE](#tone)|Tone generator.
[UBOUND](#ubound)|Return last indice of @ array.
[UFLASH](#uflash)|Return first free block address of FLASH memory.
[UNTIL](#until)|Keyword that close DO..UNTIL control loop.
[USR](#usr)|Function to call machine code routine.
[WAIT](#wait)|Monitor some register state for expected change. 
[WORDS](#words)|List vocabulary with token index.
[WRITE](#write)|Write data to FLASH or EEPROM.
[XOR](#xor)| Boolean operator exclusive OR.

[main index](#index-princ)
<hr>

<a id="abs"></a>
### ABS(*expr*)  {C,P}
This function return the absolute value of the expression. 
```
>? abs(-45)
45
```
[index](#index)
<a id="adcon"></a>
### ADCON 0|1 [,divisor]
This command power on|off the analog/digital converter.
**1** for **ON**, **0** for   **OFF*<br/> *divisor* parameter determine converter convertisseur et doit-être un entier dans l'intervalle {0..7}. This divisor is applied to Master clock Fosc. 11 clock cycles are required per convertion.  If divisor is not given it is consired to be **0**.

paramer|divisor|Fconv
-|-|-
0|2|8Mhz
1|3|5,33Mhz
2|4|4Mhz
3|6|2,66Mhz
4|8|2Mhz
5|10|1,6Mhz
6|12|1,33Mhz 
7|18|0,89Mhz
```
>adcon 1,0 ' enable ADC maximum frequency

>?adcread(0) 'read channel 0 
 757

>adcon 0 ' disable ADC 
```
Disabling ADC reduce MCU power consumption.

[index](#index)
<a id="adcread"></a>
### ADCREAD(channer) {C,P}
Read one of 7 analog inputs on CN4. 
Pinout is different for each board.

MCU<br>channel|NUCLEO-8S208RB<br>CN4:pin|NUCLEO-8S207K8<br>CN4:pin|
-|-|-
0|6|12
1|5|11
2|4|10
3|3|9
4|2|7
5|1|8
12|CN9:16|6


```
>adcon 1,0 ' active ADC fréquence maximale

>?adcread(0) 'Lecture canal 0 
 655

```

[index](#index)
<a id="alloc"></a>
### ALLOC n {C,P}
Reserve *n* slots on data stack. These slots can be used as temporary or local variables in subroutines. See also [PICK](#pick), [PUT](#put) and [DROP](#drop). 

[index](#index)
<a id="and"></a>
### *expr1|rel1|cond1* **AND** *expr2|rel2|cond2* {C,P}
Boolean operator to insert between two expressions or relations. This is a bit to bit **AND** operator. 

See also [NOT](#not),[OR](#or),[XOR](#xor).

```
>a=2 ? a
   2 

>b=4 ? b
   4 

>if a>=2 and b<=4 ? "true" 
   true

>
```

[index](#index)
<a id="asc"></a>
### ASC(*string*|\c) {C,P}
This function return the ASCII value for first character of a string or of single character.
See also [CHAR](#char) function which is the opposite of this one.
```
    >? asc("AB")
    65 

    >? asc(\Z)
    90

    >
```
[index](#index)
<a id="autorun"></a>
### AUTORUN \C|name {C}
This command enable or disable program auto execution at board power up or rinitialisation.

* AUTORUN name  search for a file with that name and if found set it as autorun program.

* AUTORUN \C   cancel any autorun. 

* CTRL-Z  can also be used to cancel an autorun program if stuck in an infinite loop.

[index](#index)
<a id="awu"></a>
### AWU *expr*  {C,P}
This command put MCU in low power mode __(HALT)__ for some amount of milliseconds defined by *expr*.
After wakeup the program continue execution after this command. The command name come from the peripheral used **A**uto-**W**ake**U**p.

*expr* must be in range {1..32720}. The maximum delay is around 30.7 secondes.
```
>awu 1  ' 1 millisecond

>awu 30720 ' 30.7 seconds

>
```

[index](#index)
<a id="bit"></a>
### BIT(*expr*) {C,P}
This function return 2^*expr*, i.e. 2 power of *expr* which must bit in the range {0..23}.

```
>for i=0 to 23: ? bit(i);:next i
1 2 4 8 16 32 64 128 1 2 4 8 16 32 64 128 65536 131072 262144 524288 1048576 2097152 4194304 -8388608 

> bset PORTC,bit(5) ' Turn on user LED on board.

```
index](#index)
<a id="bres"></a>
### BRES addr,mask {C,P}
This command reset one or more bits at **addr**. Each bit of *mask* that are at **1** are reset at target address. The address can be RAM or register. 
```
>bres PORTC,bit(5) ' turn off user LED on board. 
```

[index](#index)
<a id="bset"></a>
### BSET addr,mask  {C,P}
This command set one or more bits at *addr*. Each bit of *mask* that is at **1** is set at target address. The address can be RAM or register.
```
>bset $500a,&100000 ' turn on user LED on board.
```

[index](#index)
<a id="btest"></a>
### BTEST(addr,bit) {C,P}
This function return the state of a single bit at *addr*. *bit* is the position of bit to be tested in range {0..7}.
```
>? btest($50f3,5) ' BEEP_CSR enable bit 
   0
```

[index](#index)
<a id="btogl"></a>
### BTOGL addr,mask  {C,P}
This command toggle one or more bits at *addr*. bits of *mask* that are at **1** are inverted in target address. The address can be RAM or register.
```
>btogl PORTC,32 ' toggle user LED state.
```

[index](#index)
<a id="buffer"></a>
### BUFFER *name*, *size* {P}
This command reserve buffer space in RAM.  This buffer can written to with [POKE](#poke) and 
read from with [PEEK](#peek). 

For usage examples look at [i2c_eeprom.bas](BASIC/i2c_eeprom.bas) and [i2c_oled.bas](BASIC/i2c_oled.bas) programs. 

* *name* is the name of variable holding buffer address.

* *size* is in BYTES. 

Size is limited by free RAM leftover by the program. 

```
>list
   10  BUFFER BUF , 16: ' create buffer 
   20  FOR I= BUF  TO I+ 15 POKE I, RND( 255) NEXT I : ' write to buffer
   30  FOR I= BUF  TO I+ 15 PRINT PEEK( I); NEXT I : ' read from buffer
program address:  $90, program size:  108 bytes in RAM memory

>run
 215 248 88 147 11 229 252 86 214 192 27 194 136 88 227 115
>
```

[index](#index)
<a id="bye"></a>
### BYE  {C,P}
This command place the MCU in HALT mode from which only a reset can reset it.

[index](#index)
<a id="chain"></a>
### CHAIN name[,line#] {P}
This command is used to run a progrm stored in file system from the actual running program.

* *name* is the program file name.

* *line#' is optional and indicate at which line the execution should start. 

When the chained program leave execution continue at the calling program after the **CHAIN** command. 

A chained program can itself use **CHAIN** to execute another program file. The depth of chaining is limited by stack size. 

[index](#index)
<a id="char"></a>
### CHAR(*expr*) {C,P}
This function return the ASCII character corresponding code *expr* which must be in the range {0..127}.
```
>for a=32 to 126:? char(a);:next a 
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
>
```

[index](#index)
<a id="const"></a>
### CONST name=value [,name=value] {P}
This keyword is used to define symbolic constants. The list of constants to be defined are separated by comma **','**. 

 * **name** is constant name. 
 * **value** is a constant expression. 
 ```
>list
    5 ' Test symbolic constant speed in comparison to literal constant.
   10 CONST TEST = 1024 
   20 ? "assign a varaible." 
   24 ? "literal constant: " ; 
   30 LET T = TICKS : FOR I = 1 TO 10000 : LET A = 20490 : NEXT I 
   32 ? TICKS - T ; "MSEC." 
   34 ? "symbolic constant: " ; 
   40 LET T = TICKS : FOR I = 1 TO 10000 : LET A = TEST : NEXT I 
   44 ? TICKS - T ; "MSEC." 
   50 CONST LED = 20490 
   60 ? "Test toggling user LED on board." 
   64 ? "Literal constant: " ; 
   70 LET T = TICKS : FOR I = 1 TO 10000 : BTOGL 20490 , 32 : NEXT I 
   72 ? TICKS - T ; "MSEC." 
   74 ? "Symbolic constant: " ; 
   80 LET T = TICKS : FOR I = 1 TO 10000 : BTOGL LED , 32 : NEXT I 
   90 ? TICKS - T ; "MSEC." 
program address: $91, program size: 496 bytes in RAM memory

>run
assign a varaible.
literal constant: 418 MSEC.
symbolic constant: 541 MSEC.
Test toggling user LED on board.
Literal constant: 587 MSEC.
Symbolic constant: 714 MSEC.

>
```

[index](#index)
<a id="cr1"></a>
### CR1 (C,P)
This constant is the offset of **CR1** register from  GPIO base address. It must be added to **PORTx** constant to be accessed.  

In input mode this register configure pull-up and in output mode it select between *push-pull* and *open-drain*. 

See also [ODR](#odr),[IDR](#idr),[DDR](#ddr),[CR2](#cr2)

[index](#index)
<a id="cr2"></a>
### CR2 {C,P}
This constant is the offset of **CR2** register from GPIO base address. It must be added to **PORTx** constant to be accessed.  

In input mode it is used to enable or disable external interrupt on pin. In output mode it is used to limit port slew ratte (i.e. toggling speed). 

See also [ODR](#odr),[IDR](#idr),[DDR](#ddr),[CR1](#cr1)

[index](#index)
<a id="data"></a>
### DATA {P}
This keyword is used to declare a line containing only data. The interpreter skip over data lines. The data is accessed using [READ](#read) function. Each the a data item is read 
the data pointer is moved to next item. Reading data after the last item is a fatal error.
Note that contrary to Microsoft BASIC this is a function not a command. It doesn't accept any parameter. 

See also [RESTORE](#restore).

```
>list
    5 ' Play a tune from score in DATA lines 
   10 RESTORE 
   20 DATA 440,250,440,250,466,250,523,250,523,250,466,250,440,250
   30 DATA 392,250,349,250,349,250,392,250,440,250,440,375,392,125
   40 DATA 392,500
   50 FOR I =1TO 15:TONE READ ,READ :NEXT I 
```

[index](#index)
<a id="ddr"></a>
### DDR {C,P}
This constant is the offset of DDR register from GPIO base address. It must be added to **PORTx** constant to be accessed. 

This register is used to set GPIO pin as input or output. 

See also [ODR](#odr),[IDR](#idr),[CR1](#cr1),[CR2](#cr2)

```
>bset portc+ddr,bit(5) ' set user led pin as output

>
```

[index](#index)
<a id="dec"></a>
### DEC {C,P}
This command is used to set the number printing format to decimal. It is the default format 
at startup. 

See also [HEX](#hex).

```
>HEX:?-10:DEC:?-10
$FFFFF6
-10
```
[index](#index)
<a id="dim"></a>
### DIM var_name[=expr][,var_name[=expr]] {P}
This keyword is used to define symbolic variables in extra to the 26 Tiny BASIC variables {A..Z}. 

* *var_name* is variable name and must be at least 2 characters beginning with a letter. The first letter can be followed by **'_'**,**'.'**,**'?'** and letters. The maximum length is 15 characters. 

* *expr* is optional and used to initialize the variable. If not present the variable is initialized to **0**. 

* The comma **','** is used as list separator.

[index](#index)
<a id="do"></a>
### DO {C,P}
Keyword used to introduce a **DO..UNTIL *condition* ** loop. The instructions inside the loop are executed until *condition* become true. 

See also [UNTIL](#until). 
```
>li
   10 A = 1 
   20 DO 
   30 PRINT A;
   40 A =A + 1 
   50 UNTIL A > 10 

>run
   1 2 3 4 5 6 7 8 9 10
``` 
[index](#index)
<a id="dir"></a>
## DIR {C}
This command display the list of program saved in file system. Program saved with command [SAVE](#save) are run in place. 

See also [SAVE](#save),[ERASE](#erase) and [AUTORUN](#autorun).
```
>>DIR
$BB04 84 bytes,BLINK
$BB84 218 bytes,HYMNE
$BC84 127 bytes,FIBONACCI
```
[index](#index)
<a id="dread"></a>
### DREAD *pin*
This function return the state of a digital pin which as been defined as input with [PMODE](#pmode). The value returned is either **0** or **1**. Tables below give pinout for each board.

<hr align="left" width="40%">
NUCLEO-8S208RB<br/>

MCU<BR>PORT | Arduino Dx | board con
-|-|-
PD6|D0_RX|CN7:1
PD5|D1_TX|CN7:2
PE0|D2_IO|CN7:3
PC1|D3_TIM|CN7:4
PG0|D4_IO|CN7:5
PC2|D5_TIM|CN7:6 
PC3|D6_TIM|CN7:7
PD1|D7_IO|CN7_8
PD3|D8_IO|CN8:1
PC4|D9_TIM|CN8:2
PE5|D10_TIM_SPI_CS|CN8:3
PC6|D11_TIM_MOSI|CN8:4
PC7|D12_MISO|CN8:5
PC5|D13_SPI_CK|CN8:6 
PE2|D14_SDA|CN8:9
PE1|D15_SCL|CN8:10

<hr align="left" width="40%">
NUCLEO-8S207K8<BR/>

MCU<BR>PORT | Arduino Dx | board con
-|-|-
PD5|D0_TX|CN3:1
PD6|D1_RX|CN3:2
PD0|D2|CN3:5
PC1|D3|CN3:6
PD2|D4|CN3:7
PC2|D5|CN3:8
PC3|D6|CN3:9
PA1|D7|CN3:10
PA2|D8|CN3:11
PC4|D9|CN3:12
PD4|D10|CN3:13
PD3|D11|CN3:14
PC7|D12|CN3:15


```
10 PMODE 5,PINP 
20 ? DREAD(5)
```
[index](#index)
<a id="drop"></a>
### DROP *n* {C,P}
This command free *n* top slots from data stack.

See [ALLOC](#alloc),[PICK](#pick),[PUT](#put),[PUSH](#push),[POP](#pop).

[index](#index)

<a id="dwrite"></a>
### DWRITE *pin*,*level* 
This command change the state of a digital output pin defined as output by command [PMODE](#pmode). 

* *pin* is one of available **Dx** on board.

* *level* is **1** or **0**. 

See also [PMODE](#pmode), [DREAD](#dread).
```
10 PMODE 10,POUT ' configure D10 as output 
20 DWRITE 10, 0  ' set pin to 0 level 
```

[index](#index)
<a id="edit"></a>
### EDIT name {C}
Copy a program file from FLASH to RAM for modification.
```
>dir
$BB04 84 bytes,BLINK
$BB84 218 bytes,HYMNE

>edit blink

>list
    1 BLINK 
    5 ' Blink LED2 on card 
   10 DO BTOGL PORTC , BIT ( 5 ) PAUSE 500 UNTIL KEY? 
   20 LET A = KEY 
   30 BRES PORTC , BIT ( 5 ) 
   40 END 
program address: $91, program size: 84 bytes in RAM memory

>

```
[index](#index)
<a id="eefree"></a>
### EEFREE {C,P}
This function return first free EEPROM address. The EEPROM is scanned from start address until 8 consecutives **0** values are found. The EEPROM is consedered free from that first zero to end.

See also [AUTORUN](#autorun),[EEPROM](#eeprom).

```
>hex ? eeprom
$4000 

>autorun blink

>? eeprom
$4000 

>for i=EEPROM to i+15:? i;peek(i):next i
$4000 $41 
$4001 $52 
$4002 $BB 
$4003 $0 
$4004 $0 
$4005 $0 
$4006 $0 
$4007 $0 
$4008 $0 
$4009 $0 
$400A $0 
$400B $0 
$400C $0 
$400D $0 
$400E $0 
$400F $0 

>? eefree
$4003 

>
```

[index](#index)
<a id="eeprom"></a>
### EEPROM {C,P}
Return the base address of EEPROM. 

See also [AUTORUN](#autorun),[EEFREE](#eefree).
```
>hex:? eeprom,peek(eeprom)
$4000 	$41 

>
```

[index](#index)
<a id="end"></a>
### END {C,P}
This keyword end program. It can be place anywhere in a program.

See also [STOP](#stop)
```
>list
   10 LET A = 0 
   20 LET A = A + 1 
   30 ? A ; : IF A > 100 : END 
   40 GOTO 20 
program address: $91, program size: 52 bytes in RAM memory

>run
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 
>
```
[index](#index)
<a id=erase></a>
### ERASE \E|\F|NAME {C}
This command is used to erase persistant memory, FLASH or EEPROM. 

* *\E* erase all EEPROM 
* *\F* erase all FLASH memory starting at **app_space**, i.e. after system firmware.
* *NAME* erase a specific program file.

See also [SAVE](#save),[DIR](#dir)

[index](#index)
<a id="fcpu"></a>
### FCPU *integer*
This command set CPU clock frequency without affecting peripheral clock which stay at 16Mhz.

* *integer* in range **{0..7}**, Fcpu=16Mhz/2^7.

Reducing CPU clock frequency reduce energy consumption.
```
>fcpu 7 ' 125Khz

>let t=ticks: for i=1 to 10000:next i: ? ticks-t;" msec"
18140  msec

>fcpu 0 ' 16 Mhz 

>let t=ticks: for i=1 to 10000:next i: ? ticks-t;" msec"
97  msec

>
```

[index](#index)
<a id="for"></a>
### FOR *var*=*expr1* TO *expr2* [STEP *expr3*] NEXT *var* {C,P}
Keyword **FOR** intialiaze a counted loop that exit when the control variable pass the limit.

* *var* is the control variable {A..Z}.
* *expr1* is initial value of variable.
* [TO](#to) keyword to introduce loop limit. 
* *expr2* limit value.
* [STEP](#step) keyword introduce the increment applied at variable at end of each loop.
* *expr3* increment value.
* [NEXT](#next) keyword that close the loop. NEXT apply the increment and check for limit.
if limit is crossed over the loop exit.
* *var* same as control variable.

A FOR..NEXT loop can span many lines of codes except for the initialization which must me on the same line. 

FOR..NEXT loops can be nested.

```
>list
    5 'multipliation table 1..10 
   10 FOR A = 1 TO 10 
   20 FOR B = 1 TO 10 
   30 ? A * B ,; 
   40 NEXT B : ? 
   50 NEXT A 
program address: $91, program size: 91 bytes in RAM memory

>run
1 	2 	3 	4 	5 	6 	7 	8 	9 	10 	
2 	4 	6 	8 	10 	12 	14 	16 	18 	20 	
3 	6 	9 	12 	15 	18 	21 	24 	27 	30 	
4 	8 	12 	16 	20 	24 	28 	32 	36 	40 	
5 	10 	15 	20 	25 	30 	35 	40 	45 	50 	
6 	12 	18 	24 	30 	36 	42 	48 	54 	60 	
7 	14 	21 	28 	35 	42 	49 	56 	63 	70 	
8 	16 	24 	32 	40 	48 	56 	64 	72 	80 	
9 	18 	27 	36 	45 	54 	63 	72 	81 	90 	
10 	20 	30 	40 	50 	60 	70 	80 	90 	100 	

>
``` 

[index](#index)
<a id="free"></a>
### FREE {C,P}
This function return size of free RAM in BYTES.
```
>new

>? free
5561 

>10 ? "hello world!"

>? free
5542 

>
```

[index](#index)
<a id="get"></a>
### GET *var* 
This command read a character in a variable from terminal but contrary to [KEY](#key) it doesn't wait for it.
If no character is available when invoked it return **0**.

See also [KEY](#key),[KEY?](#qkey)

```
10 PRINT "Press a key to end.\n" : PAUSE 400
20 DO ? "hello ";:  GET A: UNTIL A<>0 

```

[index](#index)
<a id="gosub"></a>
### GOSUB *line#*|*label* {P}
Subroutine call.

* *line#* is the line number where the subroutine is located.
* *label* placed at beginning of line can be used as subroutine name instead of line number.
label name obey same rules as variables and constants names.
```
>li
5 ' test GOSUB with line# and label
10 GOSUB 100 
20 GOSUB LBL1 
30 END 
100 ? "GOSUB line# works!" return 
200 LBL1 ? "GOSUB label works!" return 

>run
GOSUB line# works!
GOSUB label works!

>
```

[index](#index)
<a id="goto"></a>
### GOTO *line#*|*label* {P}
This keyword do an unconditionnal jump to some other program line.
* *line#*  is target program line.
* *label* is a label at beginning of a line used as GOTO target.

```
>li
    5 ' test GOTO avec line# et label 
   10 GOTO 100
   20  LBL1 PRINT "GOTO label works!"
   30 END
  100 PRINT "GOTO line# works!"GOTO LBL1 
program address:  $80, program size:  119 bytes in RAM memory

>run
GOTO line# works!
GOTO label works!

>
```
[index](#index)
<a id="hex"></a>
### HEX {C,P}
This command select integer output format for [PRINT](#print) command.

See also [DEC](#dec).
```
>HEX ?-10 DEC:?-10
$FFFFF6
  -10
```

<hr>

<a id="files"></a>
### Files system 

**to be done**
<hr>

<a id="install"></a>
### Firmware installation

**to be done**
<hr>

<a id="using"></a>
### Using board

**to be done**
<hr>

<a id="send"></a>
### Sending a BASIC program to board

**to be done**
<hr>

<a id="sources"></a>
### Source code 

**to be done**
