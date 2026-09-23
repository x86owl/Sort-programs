
section .text
global _start


_start:
	MOV eax, 2
	SHL eax, 1 		;SHR eax, 1 0010 -> 0001  | 0 carrys the remainings
	INT 80h
	
