section .data

section .text
global _start

_start:
	mov eax, 11		; The number to divide
	mov edx, 0		; it must be 0 | for store the remainder
	mov ecx, 3		; divide by 3
	div ecx			; result: 11/3 eax = eax/ecx 
	
	mov ebx, eax
	jmp end

end:
	mov eax, 1
	int 0x80
