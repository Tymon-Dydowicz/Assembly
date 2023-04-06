bits    64
default rel
global  main
extern  printf
extern  scanf

section .data
    message db  'sqrt(%lf) = %lf ',0xA, 0
    input	db '%lf', 0
    step dq 0.125

section .bss
	end	resq 1


section .text
main:
    sub     rsp, 8

    lea	    rdi, [input]
    lea     rsi, [end]
    call	scanf wrt ..plt

    xor     rdx, rdx
    movq    xmm3, rdx
    movlpd xmm4, [step]
    movlpd xmm8, [end]

    loop:
    addsd   xmm3, xmm4
    movsd   xmm0, xmm3
    sqrtsd  xmm1, xmm0

    lea     rdi, [message]
    mov     al, 2
    call    printf wrt ..plt
    
    cmpltsd xmm0, xmm8
    movq rbx, xmm0
    cmp rbx, -1
    jz loop

    add     rsp, 8
    mov     rax, 0
    ret
