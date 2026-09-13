global _start

section .data
	msg db "Hello Friend!", 0x0a ;0x0a is 10 [newline character]
	len equ $ - msg ;calculating string length 

section .text
_start:
	mov eax, 4	; sys_write system call 
	mov ebx, 1	; stdout file descriptor
	mov ecx, msg	; bytes to write
	mov edx, len	; number of bytes to write
	int 0x80	; interept system call
	mov eax, 1	; sys_exit system call
	mov ebx, 0	; exit status is 0
	int 0x80
