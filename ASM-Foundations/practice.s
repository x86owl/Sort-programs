;In this section we are going to practice every program written 

section  .data
	
section .text
global _start
_start:
	mov eax, 1
	mov ebx, 73
	add ebx, 2
	sub ebx, 25 
	int 80h
	
