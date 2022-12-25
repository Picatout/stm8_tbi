[français](notes_de_révision.md)

# STM8 Tiny BASIC release notes

## 2022-12-24, V3.0R4

* Rewriting of [arithm24.asm](arithm24.asm) to improve expression evaluation performance.

* Removing parameter stack that was using **Y** register as stack pointer. Now BASIC commands and functions receive their arguments on regular stack. 

* As the parameter stack was removed all related commands and functions have also been removed. They borrowed from Forth language philosophy and wasn't a good fit for a Tiny BASIC language.The removed commands and functions are:
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


