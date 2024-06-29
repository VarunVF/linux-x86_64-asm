%include "putRAX.asm"

section .data
    msg_hello: db "Hello, World!", 10, 0

section .text
    global _start

_start:
    mov rax, msg_hello
    call putRAX

    ; sys_exit
    mov rax, 60
    mov rdi, 0                  ; exit code 0
    syscall