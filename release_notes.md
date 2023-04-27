[français](notes_de_révision.md)

# STM8 Tiny BASIC release notes

## 2023-04-27

### version V4.0R0 

* This version is incompatible with previous version hence the change in major version number.
  * Function **BIT()** is no more available, same result can be obtained with function **LSHIFT()**
  * Commands **BRES**,**BSET** and **BTOGL** have a different semantic making them incompatible with previous versions.

* Command **RANDOMAIZE** have been added.

* Major change have been made to virtual machine to improve performance.

## 2023-04-22 

* Version V3.2R1 
  * This is a performance revision. The virtual machine that execute BASIC bytecode has been change. As register **Y** was no more used since the abandon of a second stack for parameters
  it was freed. Then is now repurposed as VM program counter. In previous model register **X** was used for this purpose and it was required to save it continually to *basicptr* system variable. With this new model **Y** rarely require to be saved and when it is required it is pushed on stack. Also the calling model for BASIC commands as changed from a **CALL-RET** model to a **JP code - JP interp_loop**. This save 4 clocks cycles per call. This result in 
  an improved VM performance between 25% to 50% depending on code executed. the **LET** keyword is still slow because evaluating expression is comples. Neverthess a 25% gain is observed.

  * Aside of this optimisation some new bugs have been discovered and corrected.

  * Also a correction in reference manual have been done where 2 paragraphs where using the same link name.

  * All programs in BASIC directory run without issue. 


## 2023-03-09 V3.1R12 

* Two new commands added:
  * **CLK_HSE** to switch MCU master clock to external crystal or oscillator. 
  * **CLK_HSI** to switch MCU master clock to internal 16Mhz oscillator.

## 2022-12-30 V3.1R1

Added PWM commands and update reference manual. Pre release V3.1R1 created.

*  __PWM.CH.EN__
* __PWM.EN__
* __PWM.OUT__ 


## 2022-12-24, V3.0R4

* Rewriting of [arithm24.asm](arithm24.asm) to improve expression evaluation performance.

* Removing parameter stack that was using **Y** register as stack pointer. Now BASIC commands and functions receive their arguments on regular stack. 

* As the parameter stack was removed all related commands and functions have also been removed. They borrowed from Forth language philosophy and were not a good fit for a Tiny BASIC language.The removed commands and functions are:
    * **ALLOC** 
    * **DROP**
    * **PICK**
    * **POP** 
    * **PUSH**
    * **PUT** 


## 2022-12-02, version 2.6R2_D2

* From now tag name will contain a document revision extension in form **_Dx**. So this document revision will tagged **2.6R2_D2**.  

* PDF documents moved to **docs** subdiectory.
  * [docs/user_manual.pdf](docs/user_manual.pdf)
  * [docs/tbi_reference_en.pdf](docs/tbi_reference_en.pdf)
  * [docs/manuel_utilisateur.pdf](docs/manuel_utilisateur.pdf)
  * [docs/tbi_reference_fr.pdf](docs/tbi_reference_fr.pdf)

* Creation of markdown document [release-notes.md](release-notes.md) and [notes_de_révision.md](notes_de_r%C3%A9vision.md). 

## 2022-12-01 Version 2.6R2

Documentation is completed in **english** and **french**. The following PDF documents are available in project root directory.

* English
  * [docs/user_manual.pdf](docs/user_manual.pdf)
  * [docs/tbi_reference_en.pdf](docs/tbi_reference_en.pdf)

* français
  * [docs/manuel_utilisateur.pdf](docs/manuel_utilisateur.pdf)
  * [docs/tbi_reference_fr.pdf](docs/tbi_reference_fr.pdf)


