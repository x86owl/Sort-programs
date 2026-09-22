section .data
	list DD 25,33,44,73,12,10	

section .text
global _start

_start:
	mov edi, 0
	mov eax, [list + edi *4]
	mov ebx, eax

startloop:
	cmp eax, 0
	je exitloop
	inc edi
	mov eax, [list + edi *4]
	cmp eax, ebx
	jle startloop
	mov ebx, eax
	
	jmp startloop

exitloop:
	mov eax, 1
	int 80h
