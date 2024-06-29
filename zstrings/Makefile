ASM=nasm
BUILD_DIR=build/zstrings

.PHONY: always

$(BUILD_DIR)/final: $(BUILD_DIR)/main.o
	ld $(BUILD_DIR)/main.o -o $(BUILD_DIR)/final

$(BUILD_DIR)/main.o: always
	nasm main.asm -f elf64 -o $(BUILD_DIR)/main.o

always:
	mkdir -p $(BUILD_DIR)/