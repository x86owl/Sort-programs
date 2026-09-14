global _start main
extern printf

section .data
	msg db "Testing %i..", 0x0a, 0x00
main:
 push ebp
 push msg
 call printf
 mov ebx, 0
 mov esp, ebp
 pop ebp
 ret


