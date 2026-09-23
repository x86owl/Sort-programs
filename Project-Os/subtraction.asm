section .data

section .text
global _start


_start:
	mov eax, 3
	mov ebx, 5
	SUB eax, ebx
	mov ebx, 2
	ADD eax, ebx
	int 80h
