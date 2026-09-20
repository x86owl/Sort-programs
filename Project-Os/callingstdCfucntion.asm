extern test
extern exit

section .data

section .text
global main


main:
	PUSH 2
	PUSH 3
	CALL test
	PUSH eax
	CALL exit

	
