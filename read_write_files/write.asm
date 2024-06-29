%include "files.asm"

section .data
    filename: "myfile.txt", 0           ; zero-delimited filename
    text: db "Hello ASM"

section .text
    global _start

_start:
    ; open the file
    mov rax, SYS_OPEN
    mov rdi, filename                   ; const char* filename
    mov rsi, O_CREAT+O_WRONLY           ; int flags
    mov rdx, 0644o                      ; int mode (file permission)
    syscall

    push rax
    ; write to the file
    mov rdi, rax                        ; unsigned int fd 
    mov rax, SYS_READ
    mov rsi, text                       ; char* buf
    mov rdx, 9                          ; size_t count
    syscall

    ; close the file
    mov rax, SYS_CLOSE
    pop rdi
    syscall

    ; exit
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall