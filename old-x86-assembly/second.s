;THE PROGRAM: Its a simple multiplication program written in  x86 assembly

section .data

section .text
global _start

_start:
	mov eax, 10		; First number goes in eax
	mov ecx, 5		; second number goes into ecx | this is important
	mul ecx			; Result: eax = eax * ebx (10 * 5 = 50)

	mov ebx, eax	; storing the eax value into ebx
	jmp end			; jump to the end of label. so it can exit properly

end:
	mov eax, 1
	int 0x80
