; This program will print the hello world program

section .data
	msg db "HELLO BUDDY", 0xA ; hex 10 means newline character
	length equ $- msg

section .text
global _start

_start:
	mov eax, 4		; Syscall number for sys_write
	mov ebx, 1		; File descriptor 1 or FD(stdout) 	
	mov ecx, msg
	mov edx, length		
	int 0x80

	jmp _exit

_exit:	
	mov eax, 1
	mov ebx, 0
	int 0x80

