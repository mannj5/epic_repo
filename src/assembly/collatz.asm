; collatz: find the number of iterations to reach 0 given a number

section .text
    global _start

_start:
    mov rdx, 1        ; this will be my shitty way of providing the argument to the prog
    mov rax, 60

loop:
    cmp rdx, 1        ; if 1, return immediately
    je base
    add rdi, 1        ; increment return value
    test rdx, 1       ; check if even/odd
    jne odd
even:
    sar rdx, 1        ; shift right by 1 (divide by 2)
    jmp loop          ; recurse
odd:
    imul rdx, 3
    add rdx, 1
    jmp loop
base:
    syscall
