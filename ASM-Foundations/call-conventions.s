;day: 9,
;    title: "Functions — CALL, RET & Calling Conventions",
;    tag: "STACK & FUNCTIONS",
;   theory: `Functions in assembly are just labeled code regions. CALL and RET handle the mechanics.

section .data
	result dq 0

section .text
global _start

;; ── add(a, b) → a + b ──
;; Arguments: rdi=a, rsi=b
;; Returns: rax
add_ints:
	mov rax, rdi
	add rax, rsi
	ret				; return value in rax

;; ── factorial(n) → n! (recursive) ──
;; Argument: rdi = n
;; Returns:  rax = n!
factorial:
	push rbp
	mov rbp, rsp			; standard prologue
	push rbx			; save called-rbx
	
	mov rbx, rdi			; rbx = n (survive the recursive call
	cmp rbx, 1
	jle .base			; if n <= 1, return 1
	lea rdi, [rbx - 1]		; arg: n-1
	call factorial			; rax = factorial(n-1
	imul rax, rbx			; rax = n * factorial(n-1)
	jmp .done	
.base:
	mov rax, 1

.done:
	pop rbx				; restore callee-saved
	pop rbp				
	ret				; ┘ standard epilogue

;; ── sum_array(arr, len) ──
;; rdi = pointer to int64 array
;; rsi = number of elements
;; returns: rax = sum
sum_array:
	xor rax, rax			; sum = 0
	test rsi, rsi
	jz .done 			; len == 0 → return 0

.loop:
	add rax, [rdi]			; sum += *arr
	add rdi, 8			; arr++ (8 bytes per qword)
	dec rsi
	jnz .loop
.done:
	ret

_start:
	;; Call add_ints(30, 12)
	mov rdi, 30
	mov rsi, 12
	call add_ints			; rax = 42

	;; Call factorial(10)
	mov rdi, 10
	call factorial
	mov [result], rax
	
	;; Call sum_array
	lea rdi, [ arr]
	mov rsi, 5
	call sum_array			; rax = 150
	
	mov rax, 60
	xor rdi, rdi
	syscall
	
