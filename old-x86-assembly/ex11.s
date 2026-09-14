;PROGRAM :This program will call the function 

section .data
	LINUX_SYSCALL equ 0x80
	
section .text
global _start

_start:
	call function
	mov eax, 1
	mov ebx, 0
	int LINUX_SYSCALL

function:
	push ebp
	mov ebp, esp
	sub esp, 5
	mov byte[esp],'H'	
	mov byte[esp+1],'i'
	mov byte[esp+2],'y'
	mov byte[esp+3],'a'
	mov byte[esp+4],'!'
	
	mov eax, 4
	mov ebx, 1
	mov ecx, esp		; character buffer
	mov edx, 5		; size count 
	int LINUX_SYSCALL	

	mov esp, ebp
	pop ebp
	ret
