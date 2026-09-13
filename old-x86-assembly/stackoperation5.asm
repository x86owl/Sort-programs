global _start

section .data
	addr db "yellow", 0x0a  ; yellow is a string that we should manipulate

section .text
_start:
	mov [addr], byte 'H'	; replacing y to H
	mov [addr+5], byte '!'	; replacing w to !
	mov eax, 4 	; sys_write system call
	mov ebx, 1	; stdout file descriptior
	mov ecx, addr 	; bytes to write
	mov edx, 6 	; number of bytes to write
	int 0x80	; perform system call
	mov eax, 1	; sys_exit system call
	mov ebx, 0 	; exit status is 0
	int 0x80
