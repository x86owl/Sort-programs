;PROGRAM : This program will showcase the work of MOV — The Workhorse Instruction

section .data
	value dd -5		;signed 32-bit value

section .text
global _start
_start:
	;; ── Immediate to register ──
	mov rax, 100
	mov ebx, 0xCAFE
	mov cl, 'Z'
	
	;; ── Register to register (same size!) ──
	mov rdx, rax
	mov esi, ebx	
	
	;; ── Memory to register ──
	mov eax, [value]

	;; ── MOVZX: zero-extend smaller → larger ──
	mov bl, 0xFF
	movzx eax, bl
	movzx rax, bl

	;; ── MOVSX: sign-extend (preserve sign bit) ──
	mov bl, 0xFF
	movsx eax, bl
	movsx rax, byte [value+3]

	;; ── XCHG: swap two registers ──
	mov rax, 10
	mov rbx, 20
	xchg rax,rbx
	
	mov rax, 60
	xor rdi, rdi
	syscall
	
	

