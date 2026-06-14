BITS 32

MAGIC_NUMBER    equ 0x1BADB002
FLAGS           equ 0x0
CHECKSUM        equ -(MAGIC_NUMBER + FLAGS)

section .multiboot
align 4
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

section .text

global _start
_start:
    mov     eax, 0xABCDEF00
.end:
    jmp     .end
