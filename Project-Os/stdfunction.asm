extern printf
extern exit

section .data
	msg DD "Hello Friend!", 0
	msg2 DD "This is a test!", 0
	fmt DD "the ouput: %s %s",10,0  ;fmt is format specifier and 10 is newline, 0 is null terminator

section .text
global main

main:
	PUSH msg2
	PUSH msg
	PUSH fmt	; This part is imp format and value like C
	CALL printf
	PUSH 6		; exit 	status
	CALL exit

