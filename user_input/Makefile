all : final

clean :
	rm main.o final

final : main.o
	ld main.o -o final

main.o :
	nasm main.asm -f elf64 -o main.o
