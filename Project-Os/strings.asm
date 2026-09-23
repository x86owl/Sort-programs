section .data
	string1 DB "Hey",0 
	string2 DB "boy",0

section .text
global _start

_start:
	mov ebx, [string1]
	mov eax, 1
	int 80h

