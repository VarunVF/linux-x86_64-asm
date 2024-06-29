section .text:


; exit with no error
%macro exit 0
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro


%macro printDigit 1
    mov rax, %1
    call _printRAXDigit
%endmacro


%macro printDigitSum 2
    mov rax, %1
    add rax, %2
    call _printRAXDigit
%endmacro


; local labels
%macro freeze 0
%%loop:
    jmp _loop
%endmacro

; equ directive: often used in macro files
; similar to a #define or enum in C
; assigns a symbol to a compile-time known constant value
; these symbols will be replaced by their actual values.
STDIN equ 0
STDOUT equ 1
STDERR equ 2

; we can include external files: %include "filename.asm"
; macros and constants are often defined in included files.
; include simply copies and pastes the contents of the file at the position it is included.