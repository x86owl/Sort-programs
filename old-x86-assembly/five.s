; PROGRAM: This program will change or manipulate the bytes HELLO ---> BINGO

section .data
	msg db "HELLO WORLD", 0xA ; hex 10 stands for newline
	length equ $- msg

section .text
global _start

_start:
	mov eax, 4		; System call for system write
	mov ebx, 1		; FD (file descriptor) 1
	mov dword[msg],"BING"	; dword can change 4 bytes
	mov ecx, msg
	mov edx, length
	int 0x80
	
	jmp _exit

_exit:
	mov ebx, 0
	mov eax, 1
	int 0x80 
