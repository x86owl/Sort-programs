;PROGRAM: This program will showcase the basic arithmetics

section .data
	
section .text
global _start
_start:
	;; ── ADD & SUB ──
	mov rax, 50
	add rax, 40
	sub rax, 10
	inc rax
	dec rax
	neg rax
	
	;; ── Overflow detection with ADC (128-bit add) ──
	mov rax, 0xffffffffffffffff
	mov rbx, 1
	add rax, rbx
	adc rdx, 0	

	;; ── MUL (unsigned) ──
	mov eax, 1000
	mov ecx, 500
	mul ecx

	;; ── IMUL (signed, 2-operand form) ──
	mov rax, -7
	imul rax, 6
	imul rax, rax, 10

	;; ── DIV (unsigned) ──
	mov eax, 100
	xor edx, edx
	mov ecx, 70
	div ecx

	;; ── IDIV (signed) ──
	mov eax, -100
	cdq			;signed extend
	mov ecx, 7
	idiv ecx
	
	mov rax, 60
	xor rdi, rdi
	syscall

	
