section .bss
    ; digitSpace stores the final string to be printed
    digitSpace:     resb 100
    
    ; digitSpacePos keeps track of how far along the string we are
    digitSpacePos:  resb 8              ; 64 bits - can hold a register value


section .text
    global _start

_start:
    mov rax, 123
    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall



; _printRAX
;   Print the value in rax, in denary form, along with a newline.
; params:
;   rax
; returns:
;   nothing
_printRAX:
    push rbx                            ; save registers we will modify
    push rcx
    push rdx

    mov rcx, digitSpace
    mov rbx, 10                         ; newline
    mov [rcx], rbx                      ; move newline into the digitSpace
    inc rcx
    mov [digitSpacePos], rcx            ; increment digitSpacePos

__printRAXLoop:
    mov rdx, 0                          ; clear rdx as rdx:rax is used in div instruction
    mov rbx, 10
    div rbx                             ; divide rdx:rax by 10, store remainder in rdx
    push rax
    add rdx, 48                         ; convert digit to character

    mov [rcx], dl                       ; load character into digitSpace
    inc rcx
    mov [digitSpacePos], rcx            ; increment digitSpacePos

    pop rax
    cmp rax, 0
    jne __printRAXLoop

__printRAXLoop2:
    mov rcx, [digitSpacePos]            ; set rcx to the next character

    mov rax, 1                          ; print the character (sys_write)
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
    
    mov rcx, digitSpace
    dec rcx                             ; move backwards
    mov [digitSpacePos], rcx

    cmp rcx, digitSpace
    jge __printRAXLoop2

    pop rdx
    pop rcx
    pop rbx

    ret