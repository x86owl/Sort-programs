;PROGRAM : This program will showcase the Data Sizes & Memory Layout

section .data
	; DB = Define Byte (1 byte each)
	byte_val db 0xff	; the value = 255
	
	; DW = Define Word (2 bytes)
	word_val dw 0x1234	; it  will store as 34 12

	; DD = Define Dword (4 bytes)
	dword_val dd 0xDEADBEFF ; stored as: EF BE AD DE

	; DQ = Define Qword (8 bytes)
	qword_val dq 1234567890
	
	; String (array of bytes, null-terminated)
	msg db "HELLO!" , 0x0A, 0	; 0x0A = newline, 0 = nul
	
	; Array of 5 dwords
	arr dd 10,20,30,40,50
	
section .bss
	; RESB/RESW/RESD/RESQ = Reserve (uninitialized)
	buffer resb 64		; reserve 64 bytes
	num resb 1		; reserve 1 dword

section .text
global _start
_start:
	; Load different sizes from memory
	mov al, [byte_val]	; 8-bit load
	mov ax, [word_val]	; 16-bit load
	mov eax, [dword_val]	; 32-bit load
	mov rax, [qword_val]	; 64-bit load
	
	; Explicit size override (needed when ambiguous)
	mov byte [buffer], 'X'	; store 1 byte
	mov dword [num], 9999	; store 4 bytes

	mov rax, 60		; exit call
	xor rdi, rdi
	syscall		
