; day: 12,
;    title: "Memory Addressing Modes",
;    tag: "MEMORY OPS",
;    theory: `x86's addressing modes are one of its most powerful features.

section .data
	; int array[5] = { 10, 20, 30, 40, 50}
	arr dd 10, 20, 30, 40, 50

	; struct point p = { 1, 2, 3}
	p_x  	dd 1
	p_y 	dd 2
	p_z	dd 3
	
	; 4x4 int matrix
	matrix	dd 1,2,3,4,  5,6,7,8,  9,10,11,12,  13,14,15,16

section .text
global _start
_start:
	;; ── Direct (immediate address) ──
	mov eax, [arr]			; arr[0] = 10
	
	;; ── Register indirect ──
	lea rsi, [rel arr]
	mov eax, [rsi]
	mov eax, [rsi+4]
	
	;; ── Base + scaled index (array indexing) ──
	lea rbx, [rel arr]
	mov rcx, 3
	mov eax, [rbx + rcx * 4]
	
	;; ── Struct field access ──
	lea rdi, [rel p_x]
	mov eax, [rdi]
	mov eax, [rdi + 4]
	mov eax, [rdi + 8]
	
	;; ── Matrix: matrix[row][col] ──
	lea rbx, [rel matrix]
	mov rax, 2
	mov rcx, 3
	mov edx, [ rbx + rax*16 + rcx*4]

	;; ── Stack-relative (local variables) ──
	sub rsp, 24
	mov dword [rsp], 100		; local[0]
	mov dword [rsp+4], 200
	mov dword [rsp+8], 300
	mov eax, [rsp + 4]
	add rsp, 24
	
	;; ── RIP-relative (PIC code) ──
	;lea rax, [rel arr]		; 64 bit machine correct way
	;lea rax, [arr]			; This is also works
	
	mov rax, 60
	xor rdi, rdi
	syscall
	
	
