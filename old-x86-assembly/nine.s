;PROGRAM: This program will perform text manipulation | Stack operation
section .data
	msg db "Hii!", 0xA
	len equ $- msg

section .text
global _start

_start:
	mov eax, 4
	mov dword[msg+1], 'e'
	mov dword[msg+2], 'y' 
	mov dword[msg+3], '!'
    mov ebx, 1	; FD (file descriptor) 1
	mov ecx, msg
	mov edx, len
	int 80h

	jmp _exit

_exit:
	mov eax, 1
	mov ebx, 0
	int 80h
