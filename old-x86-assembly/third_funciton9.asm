global _start

_start:

	call func
	mov eax, 1
	mov ebx, 0
	int 0x80

func:
	push ebp
	mov ebp, esp
	sub esp, 2
	mov [esp], byte 'H'
	mov [esp+1], byte 'I'
	mov eax, 4	 ; sys_ write system call
	mov ebx, 1 	 ; stdout file descriptor
	mov ecx, esp 	 ; bytes to write
	mov edx, 2 	 ; perform system call
	int 0x80
	mov esp, ebp
	pop ebp
	ret	
