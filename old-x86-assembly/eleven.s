;PROGRAM: This program will call the other function
section .data
	
	LINUX_SYSCALL equ 0x80

section .text
global _start

_start:
	
	call function 
	mov eax, 1
	int LINUX_SYSCALL	

function:
	mov ebx, 73
	pop eax			; deleting the eax
	jmp eax			; returing to the eax from the start function
