section .data
	message db "Hello, world!", 10, 0

section .text
	global _start

_start:
	; sys_write
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 14
	syscall

	; sys_exit
	mov rax, 60
	mov rdi, 0
	syscall

