global _start

_start:
	call func
	mov eax, 1	; sys exit call
	int 0x80

func:
	mov ebx, 42
	pop eax
	jmp eax  	; ret is used to return in assembly(jmp eax)
	
