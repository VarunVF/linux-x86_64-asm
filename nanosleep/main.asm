; on x86_64 architecture, one quad-word = 8 bytes = 64 bits.

section .data
    delay: dq 5, 500000000      ; represents a timespec object (two integers): 5.5s delay

section .text
    global _start

_start:
    ; will sleep for 5.5 seconds and then exit
    mov rax, 35                 ; sys_nanosleep
    mov rdi, delay
    mov rsi, 0
    syscall

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall