;PROGRAM: This program will perform the stack push operation
; Link the program using like this ---> ld -m elf_i386 program.o -o program

section .data
	
	LINUX_SYSCALL equ 0x80

section .text

global _start
_start:
	
    push esp
	sub esp, 4
	mov word[esp], 'H'
	mov word[esp+1], 'e'
	mov word [esp+2], 'y'
	mov word[esp+3], '!'	

	mov eax, 4
	mov ebx, 1
	mov ecx, esp		; pointing to the stack pointer buffer
	mov edx, 4 
	int LINUX_SYSCALL

	jmp _end

_end:
	pop esp
	mov eax, 1
	mov ebx, 0
	int LINUX_SYSCALL
