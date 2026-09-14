;PROGRAM: This program exit with 6 (instead of 0) | showcasing program run successfully
section .data 

section .text
global _start

_start:
	mov eax, 6 	; setting the value 6 to the eax
	mov ebx, eax	; putting the value in ebx register

	jmp _exit	; jump instruction that will jump to the _exit label

_exit:
	mov eax, 1	; setting eax 1 to for exit status
	int 80h		; system  interrupt

