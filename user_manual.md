[français](manuel_util_tb.md)

# STM8 Tiny BASIC v2.5 user's manual 

# STM8 TinyBASIC user's manual, version 2.6

<a id="index"></a>
 * [Introduction](#intro)
 * [supported boards](#supported-boards)
 * [TinyBASIC firwmare installation](#firmware-install)
 * [Terminal configuration](#terminal-setup)
 * [programs examples](#programs-examples)

<a id="intro"></a>
## Introduction 

STM8 TinyBASIC is a simple programming language but that enable all MCU peripherals configuration and usage. Although there is no support for interrupts.
TinyBASIC system istself use the following interrupts

* **TIMER4 Update** that increment an internal milliseconds counter.
* **UART(1 or 3) RX full**, to queue characters received from terminal.
* **I2C** to support TinyBASIC **I2C.xxxx** commands. 
* **AWU** to support TinyBASIC **AWU** command.
* **EXTI4** only on NUCLEO-8S208RB board. That interrupt is triggered by pushing **USER** button.

STM8 TinyBASIC is a simple language for simple microcontrollers projets. 

The system is design to work with host PC of any operating system as it required only a terminal emulator software on the host. The terminal emulator must be **VT100** compatible as TinyBASIC send some ANSI sequences to the host terminal. 

STM8 TinyBASIC project is itself developped on an Ubuntu system and the repository can be found at [https://github.com/Picatout/stm8_tbi](https://github.com/Picatout/stm8_tbi).

This an open source project distributed under [GNU version 3 licence](LICENSE.TXT).

[index](#index)
<hr align="left" width="40%">

<a id="supported-boards"></a>
## Supported boards

**to be done**

[index](#index)
<hr align="left" width="40%">

<a id="firmware-install"></a>
## TinyBASIC firmware installation

**to be done**

[index](#index)
<hr align="left" width="40%">

<a id="terminal-setup"></a>
## Terminal configuration 

**to be done**

[index](#index)
<hr align="left" width="40%">

<a id="programs-examples"></a>
## Programs examples

**to be done**

[index](#index)
