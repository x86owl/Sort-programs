;First hello world program in x86 assembly syntax

section .data
	msg db "My first program is Hello World",10
	len equ $- msg

section .text
global _start
_start:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80

