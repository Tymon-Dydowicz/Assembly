bits    64
default rel
global  main
extern  printf
extern  scanf

section .data
	;hello_msg		db 'Type text: ', 10, 0
	scan_format		db '%s', 0
	print_format	db '%s', 10, 0
	;print_inp_format	db 'Provided: %s', 10, 0

section .bss
	input  resb 1024
	output resb 1024

section .text
main:
	sub rsp, 8

	;lea	rdi, [hello_msg]
	;mov al, 0
	;call	printf wrt ..plt

	lea	rdi, [scan_format]
	lea	rsi, [input]
	;mov rax, 0
	call	scanf wrt ..plt

	;lea	rsi, [input]
	;lea	rdi, [print_inp_format]
	;mov al, 0
	;call	printf wrt ..plt

	lea rsi, [input]
	lea rdi, [output]

	lea 	rsi, [input]
	lea 	rdi, [output]
	mov 	rcx, 1024
	cld
	rep 	movsb

;strcpy:
	;mov    al, [rsi]
    ;movsb
    ;test    al, al
    ;jnz    strcpy

	lea	rsi, [output]
	lea	rdi, [print_format]
	mov al, 0
	call	printf wrt ..plt

	;xor rax, rax
	add rsp, 8
	ret
