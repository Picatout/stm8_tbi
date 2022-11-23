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
a id="cli"></a>
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
## Vocabulary INDEXe
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

[main index](#index-princ)<hr>

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
