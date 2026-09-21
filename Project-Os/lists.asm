section .data
	list DB 1,2,3,4

section .text
global _start

_start:
	mov eax, 1
	mov bl, [list]
	int 80h
