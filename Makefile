#############################
# librairies make file
#############################
NAME=TinyBasic
VM=vm1
SDAS=sdasstm8
SDCC=sdcc
SDAR=sdar
CFLAGS=-mstm8 -lstm8 -L$(LIB_PATH) -I../inc
INC=../inc/
INCLUDES=$(INC)stm8s208.inc
BUILD=build/
SRC=$(NAME).asm terminal.asm xmodem.asm 
OBJECTS=$(BUILD)$(SRC:.asm=.rel)
SYMBOLS=$(OBJECTS:.rel=.sym)
LISTS=$(OBJECTS:.rel=.lst)
FLASH=stm8flash
BOARD=stm8s208rb
PROGRAMMER=stlinkv21

.PHONY: all

all: clean $(NAME).rel $(NAME).ihx 

$(NAME).rel: $(SRC)
	@echo
	@echo "**********************"
	@echo "compiling $(NAME)       "
	@echo "**********************"
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(NAME).asm 
	$(SDAS) -g -l -o $(BUILD)terminal.rel terminal.asm	
	$(SDAS) -g -l -o $(BUILD)xmodem.rel xmodem.asm 

$(NAME).ihx: $(BUILD)$(NAME).rel $(BUILD)terminal.rel $(BUILD)xmodem.rel
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(NAME).ihx $^  

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

vm: vm1.asm 
	-rm build/vm1.* 
	$(SDAS) -g -l -o $(BUILD)$(VM).rel $(VM).asm 
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(VM).ihx  $(BUILD)$(VM).rel
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -w $(BUILD)$(VM).ihx
