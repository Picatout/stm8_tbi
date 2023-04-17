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
SRC=hardware_init.asm  debug_support.asm arithm24.asm flash_prog.asm files.asm terminal.asm code_address.asm compiler.asm $(I2C) decompiler.asm $(NAME).asm app.asm
OBJECT=$(BUILD)$(BOARD)/$(NAME).rel
OBJECTS=$(BUILD)$(BOARD)/$(SRC:.asm=.rel)
LIST=$(BUILD)$(BOARD)/$(NAME).lst
FLASH=stm8flash


.PHONY: all

all: clean 
	@echo
	@echo "*************************************"
	@echo "compiling $(NAME)  for $(BOARD)      "
	@echo "*************************************"
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/$(NAME).rel $(SRC) 
	$(SDCC) $(CFLAGS) -Wl-u -o $(BUILD)$(BOARD)/$(NAME).ihx $(OBJECT) 
	objcopy -Iihex -Obinary  $(BUILD)$(BOARD)/$(NAME).ihx $(BUILD)$(BOARD)/$(NAME).bin 
	@echo 
	@ls -l  $(BUILD)$(BOARD)/$(NAME).bin 
	@echo 


.PHONY: clean 
clean:
	@echo
	@echo "***************"
	@echo "cleaning files"
	@echo "***************"
	rm -f $(BUILD)$(BOARD)/*

test: 
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/test.rel test.asm

separate: clean $(SRC)
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/hardware_init.rel hardware_init.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/flash_prog.rel flash_prog.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/terminal.rel terminal.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/compiler.rel compiler.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/decompiler.rel decompiler.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/$(NAME).rel $(NAME).asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/app.rel app.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/debug_support.rel debug_support.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/i2c.rel i2c.asm  
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/code_address.rel code_address.asm  

usr_test:
	$(SDAS) -g -l -o $(BUILD)$(BOARD)/square.rel square.asm  

flash: $(LIB)
	@echo
	@echo "******************"
	@echo "flashing $(BOARD) "
	@echo "******************"
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s flash -w $(BUILD)$(BOARD)/$(NAME).ihx 

# read flash memory 
read: 
	$(FLASH) -c $(PROGRAMMER) -p $(BOARD) -s flash -b 16384 -r flash.dat 

# erase flash memory from 0x8000-0xffff 
erase:
	dd if=/dev/zero bs=1 count=32768 of=zero.bin
	$(FLASH) -c $(PROGRAMMER) -p$(BOARD) -s flash -b 32768 -w zero.bin 
	rm -f zero.bin 

.PHONY: ee_clear 
# erase eeprom 
ee_clear: 
	dd if=/dev/zero bs=1 count=16 of=zero.bin
	$(FLASH) -c $(PROGRAMMER) -p$(BOARD) -s eeprom 16 -w zero.bin 
	rm -f zero.bin 
 
