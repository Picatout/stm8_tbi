#############################
# Make file for NUCLEO board
#############################
BOARD=stm8s207K8
PROGRAMMER=stlinkv21
FLASH_SIZE=65536
BOARD_INC=../inc/stm8s207.inc ../inc/nucleo_8s207.inc
include Makefile
