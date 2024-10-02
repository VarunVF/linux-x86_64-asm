# Jumps, calls and comparisons

## Flags

Flags are like boolean variables, but they are only 1 bit wide.
They are either true or false (corresponding to a set or unset bit).

Individual flags are part of a larger flags register.

| Flag Symbol  | Description       |
| ------------ | ----------------- |
| `CF`         | Carry             |
| `PF`         | Parity            |
| `ZF`         | Zero              |
| `SF`         | Sign              |
| `OF`         | Overflow          |
| `AF`         | Adjust            |
| `IF`         | Interrupt Enabled |


## Pointers (registers):

| Pointer Name | Meaning       | Description                             |
| ------------ | ------------- | --------------------------------------- |
| `rip`         | Index pointer | Points to the next address to be executed in the control flow. |
| `rsp`         | Stack pointer | Points to the top address of the stack. |
| `rbp`         | Base pointer  | Points to the bottom of the stack.      |



## Control Flow

The `rip` register holds the address of the next instruction to be executed.
After each instruction, it is incremented (need not be by 1).
This makes the control flow naturally top to bottom.
(instruction pointer / program counter)

However, some instructions like jumps (`jmp`) or calls (`call`) can change the
control flow (effectively modifying the `rip`).

## Jump

A `jmp` instruction (jump) causes execution to "jump" to the specified memory address, by loading this value into the `rip` register.

Jumps example:

```nasm

_start:
        jmp _start
        ; loads the value of the "_start" label into rip
        ; creates infinite loop
```


## Comparisons

Comparisons (`cmp`) allow programs to take different paths based on conditions.
Comparisons are performed on registers.
Upon performing a comparison, certain flags are set.

| `cmp a, b`                             |
| -------- | --------------------------- |
| `a == b` | ZF = 1 (zero flag is set)   |
| `a != b` | ZF = 0 (zero flag is reset) |
| (always) | SF = `msb(a - b)`           |
| ...      | ...                         |

After a comparison is made, a conditional jump can be made, based on the status of the flags that were set.

| jump symbol (signed) | jump symbol (unsigned) | Meaning                  |
| -------------------- | -----------------------|------------------------- |
| `je`                  | -                      | "jump equal"             |
| `jne`                 | -                      | "jump not equal"         |
| `jg`                  | `ja`                    | "jump greater than"      |
| `jge`                 | `jae`                   | "jump greater or equal"  |
| `jl`                  | `jb`                    | "jump less than"         |
| `jle`                 | `jbe`                   | "jump less or equal"     |
| `jz`                  | -                      | "jump zero"              |
| `jnz`                 | -                      | "jump not zero"          |
| `jo`                  | -                      | "jump if overflow occured" |
| `jno`                 | -                      | "jump if overflow did not occur" |
| `js`                  | -                      | "jump if signed"         |
| `jns`                 | -                      | "jump if not signed"     |


Comparisons example:
```nasm
_start:
        mov rax, 4     ; set value in rax
        cmp rax, 23    ; compare value in rax with 23
                       ; this fails which causes flags to be set
        je _label      ; the jump is not taken
```


## Registers as pointers

The default registers can be treated as pointers.
The square brackets are used to dereference pointers.

Example:
```nasm
        mov rax, rbx      ; Loads the value in rbx into rax
        mov rax, [rbx]    ; Loads the value pointed to by rbx into rax
```

## Calls
A call is like a jump, but when a call is used, the original position the call
was made can be returned to using ret.
A label can be used like a function that can be called and that "returns".
This is called a subroutine.

Example:

```nasm
section .data:
        message db "Hello, world!", 10, 0

section .text
        global _start

_printHello:
        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, 14
        syscall
        ret                 ; return to previous position (return address)

_start:
        call _printHello    ; jump to the _printHello label and return

        mov rax, 60
        mov rdi, 0
        syscall
```