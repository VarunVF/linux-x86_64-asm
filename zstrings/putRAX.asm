; zstrings - zero-delimited strings (C-style strings)

section .text

; putRAX
;     Print an ASCII zero-delimited string to stdout.
;   params:
;     rax: points to string
;   returns:
;     nothing
putRAX:
    ; save general-purpose registers we will modify
    push rbx
    push rcx

    push rax                    ; save address of string
    mov rbx, 0                  ; string length counter
_putRAXloop:
    mov cl, [rax]               ; hold current character
    cmp cl, 0                   ; compare to null byte
    je _putRAXdone

    inc rax                     ; point to next character
    inc rbx                     ; increment counter
    jmp _putRAXloop

_putRAXdone:
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; unsigned int fd = STDOUT
    pop rsi                     ; address of string
    mov rdx, rbx                ; number of bytes to print
    syscall

    pop rcx
    pop rbx
    ret
