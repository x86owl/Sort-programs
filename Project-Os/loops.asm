section .data
	list DB 1,2,3,4

section .text
global _start


_start:
	MOV eax, 0
	MOV bl, 0

loop:
	MOV bl, [list + eax]
	MOV cl, bl
	ADD eax, 1		;INC eax
	CMP eax, 4
	JE end
	JMP loop

end:
	MOV eax,1
	MOV ebx,1
	INT 80h
