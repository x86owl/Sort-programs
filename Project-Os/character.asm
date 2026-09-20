section .data
	char DB 'I'

section .text
global _start

_start:
	mov eax, 1
	mov ebx, [char]
	int 80h
