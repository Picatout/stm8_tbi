#############################
# librairies make file
#############################
NAME=TinyBasic
SDAS=sdasstm8
SDCC=sdcc
SDAR=sdar
OBJCPY=objcpy 
CFLAGS=-mstm8 -lstm8 -L$(LIB_PATH) -I../inc
INC=../inc/
INCLUDES=$(INC)stm8s208.inc
BUILD=build/
SRC=$(NAME).asm terminal.asm compiler.asm decompiler.asm 
OBJECTS=$(BUILD)$(SRC:.asm=.rel)
SYMBOLS=$(OBJECTS:.rel=.sym)
LISTS=$(OBJECTS:.rel=.lst)
FLASH=stm8flash
BOARD=stm8s208rb
PROGRAMMER=stlinkv21

.PHONY: all

all: clean $(NAME).rel $(NAME).ihx $(NAME).bin
$(NAME).rel: $(SRC)
	@echo
	@echo "**********************"
	@echo "compiling $(NAME)       "
	@echo "**********************"
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(NAME).asm 
	$(SDAS) -g -l -o $(BUILD)terminal.rel terminal.asm	
	$(SDAS) -g -l -o $(BUILD)compiler.rel compiler.asm	
	$(SDAS) -g -l -o $(BUILD)decompiler.rel decompiler.asm	


$(NAME).ihx: $(BUILD)$(NAME).rel $(BUILD)terminal.rel $(BUILD)compiler.rel $(BUILD)decompiler.rel 
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx $^  


$(NAME).bin:  $(BUILD)$(NAME).ihx
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

.PHONY: test 

flash: $(LIB)
	@echo
	@echo "***************"
	@echo "flashing device"
	@echo "***************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s flash -w $(BUILD)$(NAME).ihx 
