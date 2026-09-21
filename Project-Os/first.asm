section .text
global _start

_start:
	mov eax, 1
	mov ebx, 41
	int 80h
