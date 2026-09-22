section .data
	pathname DD "/home/solo_shell/Nasm assembly/x86 Assembly/test.txt"

section .bss
	buffer resb 10 		;including the newline character from the test.txt

section .text
global main

main:
	MOV eax, 5
	MOV ebx, pathname
	MOV ecx, 0
	INT 80h

	MOV ebx,eax
	MOV eax, 19
	MOV ecx, 20
	MOV edx, 0
	INT 80h

	MOV eax, 3
	MOV ecx, buffer
	MOV edx, 10
	INT 80h
	
	MOV eax, 1
	MOV ebx, 0
	INT 80h
