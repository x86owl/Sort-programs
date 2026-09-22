section .data

section .text
global main

addition:
	ADD eax,ebx
	RET

main:
	MOV eax, 5
	MOV ebx, 2
	CALL addition
	MOV ebx,eax
	MOV eax, 1
	INT 80h
