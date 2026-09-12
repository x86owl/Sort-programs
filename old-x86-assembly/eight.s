;PROGRAM : This program will do the conditional jmp from this program 

section .data

section .text
global _start

_start:
	mov ecx, 98
	mov ebx, 73	    ; exit status of the code
	mov eax, 1
	cmp ecx, 100	; comparing ecx register to the 100
	jl _end		    ; jump if less than 

	mov ebx, 21	    ; put or replace the ebx, value with new one

_end:
	int 0x80 
