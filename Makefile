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
INCLUDES=$(BOARD_INC) $(INC)ascii.inc $(INC)gen_macros.inc cmd_idx.inc tbi_macros.inc dbg_macros.inc 
BUILD=build/
I2C=i2c.asm
SRC=hardware_init.asm arithm24.asm debug_support.asm flash_prog.asm files.asm terminal.asm code_address.asm compiler.asm $(I2C) decompiler.asm $(NAME).asm app.asm 
OBJECT=$(BUILD)$(NAME).rel
OBJECTS=$(BUILD)$(SRC:.asm=.rel)
LIST=$(BUILD)$(NAME).lst
FLASH=stm8flash


.PHONY: all

all: clean 
	@echo
	@echo "*************************************"
	@echo "compiling $(NAME)  for $(BOARD)      "
	@echo "*************************************"
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

test: 
	$(SDAS) -g -l -o $(BUILD)test.rel test.asm

separate: clean $(SRC)
	$(SDAS) -g -l -o $(BUILD)hardware_init.rel hardware_init.asm  
	$(SDAS) -g -l -o $(BUILD)flash_prog.rel flash_prog.asm  
	$(SDAS) -g -l -o $(BUILD)terminal.rel terminal.asm  
	$(SDAS) -g -l -o $(BUILD)compiler.rel compiler.asm  
	$(SDAS) -g -l -o $(BUILD)decompiler.rel decompiler.asm  
	$(SDAS) -g -l -o $(BUILD)$(NAME).rel $(NAME).asm  
	$(SDAS) -g -l -o $(BUILD)app.rel app.asm  
	$(SDAS) -g -l -o $(BUILD)debug_support.rel debug_support.asm  
	$(SDAS) -g -l -o $(BUILD)i2c.rel i2c.asm  
	$(SDAS) -g -l -o $(BUILD)code_address.rel code_address.asm  

usr_test:
	$(SDAS) -g -l -o $(BUILD)square.rel square.asm  

flash: $(LIB)
	@echo
	@echo "******************"
	@echo "flashing $(BOARD) "
	@echo "******************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s flash -w $(BUILD)$(NAME).ihx 

# read flash memory 
read: 
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s flash -b 16384 -r flash.dat 

# erase flash memory from 0x8000-0xffff 
erase:
	dd if=/dev/zero bs=1 count=32768 of=zero.bin
	$(FLASH) -c $(PROGRAMMER) -p$(BOARD) -s flash -b 32768 -w zero.bin 
	rm -f zero.bin 

