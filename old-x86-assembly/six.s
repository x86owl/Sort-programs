;PROGRAM: This program will replace the hello worlds 8 bytes into to "beloved"

section .data
	msg db "Hello x86owl", 0xA
	len equ $- msg

section .text
global _start

_start:
	mov rax, 1	; system write
	mov rdi, 1	; FD file descriptor
	mov rcx, "Beloved "	
	mov qword[msg], rcx	
	mov rsi, msg	; buffer
	mov rdx, len	; length count
	syscall 	; Telling the kernel to do it

	jmp _exit

_exit:
	mov rax, 60	; exit status rax 60 equivalent to eax 1
	mov rdi, 0	
	syscall 	; telling the kernel to exit
