; PROGRAM: This program will do the unconditional jmp and exit with the 73

section .text
global _start

_start:
	mov ebx, 73		; storing the value in ebx
	mov eax, 1
	
    jmp _end
	mov ecx, 21

_end:
	int 80h	
