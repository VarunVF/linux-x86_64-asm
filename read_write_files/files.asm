SYS_READ        equ 0
SYS_WRITE       equ 1
SYS_OPEN        equ 2
SYS_CLOSE       equ 3
SYS_EXIT        equ 60

STDIN           equ 0
STDOUT          equ 1
STDERR          equ 2

O_RDONLY        equ 0               ; 0
O_WRONLY        equ 1               ; 2^0
O_RDWR          equ 2               ; 2^1
O_CREAT         equ 64              ; 2^6
O_APPEND        equ 1024            ; 2^10
O_DIRECTORY     equ 65536           ; 2^16
O_PATH          equ 2097152         ; 2^21
O_TMPFILE       equ 4194304         ; 2^32