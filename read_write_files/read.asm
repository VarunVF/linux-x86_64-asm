%include "files.asm"

section .data
    filename: db "myfile.txt", 0
    newline: db 10, 0

section .bss
    text: resb 10

section .text
    global _start

_start:
    ; open the file
    mov rax, SYS_OPEN
    mov rdi, filename
    mov rsi, O_RDONLY
    mov rdx, 0
    syscall

    push rax
    ; read the file
    mov rdi, rax
    mov rax, SYS_READ
    mov rsi, text
    mov rdx, 9
    syscall

    ; close the file
    mov rax, SYS_CLOSE
    pop rdi
    syscall

    ; print the text
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, text
    mov rdx, 9
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, newline
    mov rdx, 9
    syscall

    ; exit
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall