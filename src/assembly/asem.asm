.global _start
.intel_syntax noprefix

_start:
    // say hello world
    mov rax, 1
    mov rdi, 1
    lea rsi, [hello_world]
    mov rdx, 14
    syscall

    // sys exit call
    mov rax, 60
    mov rdi, 8
    syscall

hello_world:
    .asciz "Hello, World!\n"
