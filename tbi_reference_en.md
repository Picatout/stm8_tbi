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

<a id="cli"></a>
### Command line

**to be done**
<hr>

<a id="index"></a>
### BASIC commands and function

**to be done**
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
