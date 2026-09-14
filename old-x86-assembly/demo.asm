global _start

section .text
_start:
	mov ecx, 73	; ecx set to 73
	mov ebx, 30	; exit status 30
	mov eax, 1	; sys exit
	cmp ecx, 10	; comparing ecx to 100
	je skip		; jump if greater than skip label
	mov ebx, 4	; exit status is 4

skip:
	int 0x80 	; interrupt
