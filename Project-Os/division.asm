
section .text
global _start

_start:
	MOV eax, 0xff
	MOV ecx, 2
	IDIV ecx
	INT 80h
