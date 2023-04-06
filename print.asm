bits    64
default rel
global  main
extern  printf
extern  scanf

section .data
	hello_msg		db 'Type text: ', 10, 0
	scan_format		db '%1023s', 0
	print_format	db '%s', 10, 0
	print_inp_format	db 'Provided: %s', 10, 0

section .bss
	input  resb 1024
	output resb 1024

section .text
main:
	sub rsp, 8

	lea	rdi, [hello_msg]
	mov al, 0
	call	printf wrt ..plt

	add rsp, 8
	ret
