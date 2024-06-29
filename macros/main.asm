%include "macros.asm"

section .text:
    global _start

_start:
    call printDigit 8

    call printDigitSum 1, 2