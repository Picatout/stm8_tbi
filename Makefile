#############################
# TinyBasic make file
#############################
NAME=TinyBasic
SDAS=sdasstm8
SDCC=sdcc
SDAR=sdar
OBJCPY=objcpy 
CFLAGS=-mstm8 -lstm8 -L$(LIB_PATH) -I../inc
INC=../inc/
INCLUDES=$(INC)stm8s208.inc $(INC)ascii.inc $(INC)gen_macros.inc $(INC)nucleo_8s208.inc cmd_idx.inc tbi_macros.inc dbg_macros.inc 
BUILD=build/
SRC=hardware_init.asm arithm24.asm debug_support.asm flash_prog.asm terminal.asm compiler.asm decompiler.asm $(NAME).asm test.asm app.asm
OBJECT=$(BUILD)$(NAME).rel
OBJECTS=$(BUILD)$(SRC:.asm=.rel)
LIST=$(BUILD)$(NAME).lst
FLASH=stm8flash
BOARD=stm8s208rb
PROGRAMMER=stlinkv21


.PHONY: all

all: clean 
	@echo
	@echo "**********************"
	@echo "compiling $(NAME)       "
	@echo "**********************"
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(SRC) 
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx $(OBJECT) 
	objcopy -Iihex -Obinary  $(BUILD)$(NAME).ihx $(BUILD)$(NAME).bin 
	@echo 
	@ls -l  $(BUILD)$(NAME).bin 
	@echo 


.PHONY: clean 
clean: build
	@echo
	@echo "***************"
	@echo "cleaning files"
	@echo "***************"
	rm -f $(BUILD)*

build:
	mkdir build

separate: clean $(SRC)
	$(SDAS) -g -l -o $(BUILD)hardware_init.rel hardware_init.asm  
	$(SDAS) -g -l -o $(BUILD)flash_prog.rel flash_prog.asm  
	$(SDAS) -g -l -o $(BUILD)terminal.rel terminal.asm  
	$(SDAS) -g -l -o $(BUILD)compiler.rel compiler.asm  
	$(SDAS) -g -l -o $(BUILD)decompiler.rel decompiler.asm  
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(NAME).asm  
	$(SDAS) -g -l -o $(BUILD)app.rel app.asm  


flash: $(LIB)
	@echo
	@echo "***************"
	@echo "flashing device"
	@echo "***************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s flash -w $(BUILD)$(NAME).ihx 

# read flash memory 
read: 
	$(FLASH) -c $(PROGRAMMER) -p$(BOARD) -s flash -b 16384 -r flash.dat 

