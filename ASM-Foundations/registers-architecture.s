;PROGRAM: "Registers & Architecture Overview"	| Day 1 ---> 10/03/2026
section .data

section .text
global _start

_start:
	; Move values into registers
	mov rax, 42		; RAX = 42 (64-bit)
	mov ebx, 100		; EBX = 100 (32-bit, zeros upper 32 bits of RBX)
	mov cx, 0xFF		; CX = 255 (16-bit)
	mov dl, 'A'		; DL = 65 (8-bit low byte of RDX)
	
	; Copy between registers
	mov rsi, rax		; RSI = RAX = 42
	mov rdi, rbx		; RDI = RBX = 100 (zero-extended)

	; RAX is used for syscall number AND return value  	
	mov rax, 60		; syscall: exit
	mov rdi, 0		; exit code 0
	syscall

