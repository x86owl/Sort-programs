		; This program will show case the square of a number
section .data

section .text
global _start

_start:
	push ebp		; saving the old base pointer
	mov ebp, esp		; seting the stack pointer as the base 
	sub esp, 4		; Move the stack pointer down by 4 bytes(make a "drawer" for one number)
	mov dword [ebp - 4], 6	; Store the number 6 into that "drawer" (at ebp - 4)
	imul eax, [ ebp - 4]	; Load the value from the drawer into a register (eax) 
	
	mov esp, ebp
	pop ebp			; (Epilogue)
	
	mov ebx, eax
	mov eax, 1
	int 80h
