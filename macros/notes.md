# Macros

A macro expands into a predefined set of instrcutions to perform a task.

## How Macros Work
Although macros can take a number of "arguments", they are not the same as subroutines.

Macros are expanded by the assembler at the place they are used. This means the body of the macro is simply copied and pasted at the location where the macro was used. Any arguments passed to the macro are replaced with their values in the body.

## Defining Macros
A macro in NASM is defined using the `%macro` directive.
It has the format `%macro <name> <argc> <body>` and ends with `%endmacro`.
- `<name>`: The name of the macro.
- `<argc>`: The number of arguments the macro takes.
- `<body>`: The body of the macro.

For example, we can define a macro to exit the program:

    %macro exit 0
        mov rax, 60         ; sys_exit
        mov rdi, 0          ; no error
        syscall
    %endmacro


If we now wish to indicate an error code when exiting the program, we can rewrite our macro to take one argument.
Here, `%1` refers to the first argument passed to the macro.


    %macro exit 1
        mov rax, 60         ; sys_exit
        mov rdi, %1         ; error code
        syscall
    %endmacro


Consider using the macro with an error code of 64:

    exit 64

The macro would be expanded to something similar to:

    mov rax, 60
    mov rdi, 64
    syscall


##  Local Labels
Local labels are used to avoid duplicate label errors.

Macros can define labels inside their bodies, such as the `_loop` label here.

    %macro freeze 0
    _loop:
        jmp _loop
    %endmacro

If such a macro is used more than once in code, then there will be duplicate label errors. The same code is pasted multiple times in the code. Consider the following code:

    _start:
        freeze
        freeze

This code will expand to:

    _start:
        _loop:
            jmp _loop
        _loop:
            jmp _loop

As you can see, the `_loop` label has been defined twice which will result in a redefined symbol error.

We can avoid this with local labels by adding `%%` to the label name:

    %macro freeze 0
    %%_loop:
        jmp %%_loop
    %endmacro

Now, in the expanded code, each `%%loop` label will have a different name which avoids the name conflicts.

# Constants
Constants are symbols that are assigned a value which never changes and is known at compile time.
Constants are somewhat similar to macros, except that they do not translate to any machine code instructions. They are just symbols that give more meaning to certain values. This can make code more readable.

## Defining Constants
In NASM, we use the `equ` directive to define constants.

    SYS_READ 0
    SYS_WRITE 1

    STDIN equ 0
    STDOUT equ 1
    STDERR equ 2

These numbers can now be instead referred to by their symbol in code:

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, message
    mov rdx, 10
    syscall
