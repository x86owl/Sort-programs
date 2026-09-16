;day: 14,
;    title: "Conditional Moves — CMOV",
;    tag: "CONTROL FLOW",
;    theory: `CMOVcc (Conditional MOVe) performs a register-to-register MOV only when a condition is true. It's the branchless equivalent of a simple if/else.

section .data

section .text
global _start
	
; abs(rdi) → rax  using CMOV
abs_val:
	mov rax, rdi
	neg rdi
	test rax, rax
	cmovs rax, rdi
	ret

; max(rdi, rsi) → rax
max_val:
	mov rax, rdi
	cmp rdi, rsi
	cmovl rax, rsi
	ret

; min(rdi, rsi) → rax
min_val:
	mov rax, rdi
	cmp rdi, rsi
	cmovg rax, rsi
	ret

; clamp(val=rdi, lo=rsi, hi=rdx) → rax
clamp:
	mov rax, rdi
	cmp rax, rsi
	cmovl rax, rsi
	cmp rax, rdx
	cmovg rax, rdx
	ret

; branchless select: rdi ? rsi : rdx
;  (ternary without jumps)
ternary:
	test rdi, rdi
	mov rax, rax
	cmovnz rax, rsi
	ret

_start:
	mov rdi, -42
	call abs_val
	
	mov rdi, 7
	mov rsi, 13
	call max_val

	mov rdi, 255
	mov rsi, 0
	mov rdx, 100
	call clamp

	mov rax, 5
	mov rbx, 3
	cmp rax, rbx
	mov rcx, rax
	cmovg rax, rbx
	cmovg rbx, rcx

	mov rax, 60
	xor rdi, rdi
	syscall	
