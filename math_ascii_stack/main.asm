section .data
    digit db 0, 10

section .text
    global _start

; print the digit in rax (from 0 to 9).
_printRAXdigit:
    add rax, 48
    mov [digit], al
    ; sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

_start:
    mov rax, 5
    add rax, 3
    call _printRAXdigit

    mov rax, 6
    mov rbx, 2
    div rbx     ; divides rax by the value in rbx
    call _printRAXdigit


    mov rbx, 5
    push rbx
    mov rbx, 7
    push rbx

    pop rax
    call _printRAXdigit

    pop rax
    call _printRAXdigit

    ; sys_exit
    mov rax, 60
    mov rdi, 0
    syscall
