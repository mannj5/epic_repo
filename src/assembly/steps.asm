.global _start

.section .text

_start:
    test %edi, %edi
    jle error
    mov %r13, 3
    mov %eax, 0
    
loop:
    cmp %edi, 1
    je base
    add %eax, 1
    test %edi, 1
    jne odd
    sar %edi
    jmp loop
odd:
    imul %edi, %r13d
    add %edi, 1
    jmp loop
base:
    mov %rdi, %rax
    mov %rax, 60
    syscall
error:
    mov %rax, 60
    mov %rdi, 0
    syscall
