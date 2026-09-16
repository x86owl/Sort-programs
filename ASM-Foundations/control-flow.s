;PROGRAM : In this section we are going to learn about Flags Register & Comparisons

section .data

section .text
global _start
_start:
	;; ── CMP sets flags based on subtraction ──
	mov eax, 10
	mov ebx, 10
	cmp eax, ebx			; 10-10=0 → ZF=1, CF=0, SF=0, OF=0
	
	mov eax, 5
	mov ebx, 10	
	cmp eax, ebx			

	;; ── TEST: check if register is zero ──
	xor eax, eax 			; eax=0
	test eax, eax			; 0 AND 0 = 0 → ZF=1
	
	;; ── TEST: check specific bit ──
	mov eax, 0b10110100
	test eax, (1 << 2)
	test eax, (1 << 4)
	
	;; ── SETcc: store flag result as 0 or 1 ──
	mov eax, 7
	cmp eax, 7	
	sete al
	setne al
	setl al
	setg al
	setb al
	seta al
	
	;; ── Manipulating flags directly ──
	clc				; clear CF
	stc				; set CF
	cld				
	std	

	;; ── LAHF / SAHF: load/store AH with lower 8 flag bits ──
	lahf				; AH = lower 8 bits of FLAGS
	sahf				; restore FLAGS from AH

	mov rax, 60
	xor rdi,rdi
	syscall
