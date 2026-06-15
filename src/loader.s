BITS 32

MAGIC_NUMBER        equ 0x1BADB002
FLAGS               equ 0x0
CHECKSUM            equ -(MAGIC_NUMBER + FLAGS)
KERNEL_STACK_SIZE   equ 4096

extern test

section .multiboot
align 4
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

section .text

global _start
_start:
    mov     esp, kernel_stack + KERNEL_STACK_SIZE
    push    dword 6
    push    dword 7
    call    test
    add     esp, 8
.end:
    jmp     .end

section .bss
align 4
kernel_stack:
    resb    KERNEL_STACK_SIZE

section .note.GNU-stack noalloc
