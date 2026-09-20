section .data

section .text
global _start

_start:
	
	mov al, 0b11111111
	mov bl, 0b001
	ADD al, bl
	ADC ah, 0
	int 80h
