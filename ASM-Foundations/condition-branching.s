;In this program we will explore the Jumps & Conditional Branching

section .data
	msg_pos db "positive",10, 0
	msg_neg db "negative", 10, 0		
	msg_zer db "zero", 10, 0

section .text
global _start
	; ── if/else chain ──
print_sign:
	test rdi, rdi
	jz .is_zero
	js .is_neg	
	lea rsi, [rel msg_pos]
	jmp .print
.is_neg:
	lea rsi, [rel msg_neg]
	jmp .print
.is_zero:
	lea rsi, [rel msg_zer]
.print:
	mov rdx, 9
	mov rax, 1	; syswrite
	mov rdi, 1	; stdout
	syscall
	ret

	; ── while loop: sum 1..10 ──
sum_loop:
	xor eax, eax	; sum = 0
	mov ecx, 1	; i = 1	
.loop:
	cmp ecx, 10
	jg .done
	add eax, ecx
	inc ecx
	jmp .loop
.done
	ret 
	
	; ── do-while: find first set bit ──
first_set_bit:	
	xor eax, eax
.scan:
	test rdi, 1
	jnz .found	
	shr rdi, 1
	inc eax
	jmp .scan
.found 
	ret 

_start:
	mov rdi, 42
	call print_sign
	
	call sum_loop

	mov rdi,  0b10110000
	call first_set_bit
	
	mov rax, 60
	xor rdi, rdi
	syscall
		
