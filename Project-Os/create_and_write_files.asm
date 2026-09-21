section .data
	pathname DD "/home/solo_shell/Nasm assembly/x86 Assembly/newfile.txt"
	write DD "Hello Friend!",0AH,0DH,"$"
section .text
global main

main:
	MOV eax, 5
	MOV ebx, pathname
	MOV ecx, 101o		;o means octal value(base8) performing the xor operation
	MOV edx, 700o
	INT 80h
	
	MOV ebx, eax
	MOV eax, 4
	MOV ecx, write
	MOV edx, 16
	INT 80h
	
	MOV eax, 1
	MOV ebx, 0
	INT 80h

