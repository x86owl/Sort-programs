;PROGRAM: This program will show the basic arithmetics like addition and subtraction
section .data

section .text
global _start

_start:
	mov ebx, 20	; putting value(20) into ebx register 
	sub ebx, 5	; then subtracting 5 from ebx
	add ebx, 58	; then adding the 58 to the ebx register
	
	jmp exit	

exit:
	mov eax, 1	; system exit
	int 0x80	; interrupt	80h means hexdecimal.
