; hello world program

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_length
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

section .data
    msg: db "Hello, World!", 0xA
    msg_length equ $-msg
