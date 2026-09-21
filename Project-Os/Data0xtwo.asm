section .data
	num1 DB 4
	num2 DB 6

section .text
global _start


_start:
	mov bl, [num1]
	mov ch, [num2]
	mov eax, 1
	int 80h
