;PROGRAM: In this program we will explore the Bitwise Operations & Shifts

section .data

section .text
global _start
_start:
	;; ── AND: masking (keep specific bits) ──
	mov eax, 0b11001101		; 0xcd = 205	
	and eax, 0b00001111		; 0xd = 13
	
	;; ── OR: setting bits ──
	mov eax, 0b10100000
	or eax,  0b00001111		;set low nibble → eax = 0b10101111
	
	;; ── XOR: toggling / zeroing ──
	mov eax, 0b11001100
	xor eax, 0b00001111		;toggle low nibble → 0b11000011
	xor eax, eax			

	;; ── NOT ──
	mov al, 0b10110101		; 0xb5
	not al				; = 0b01001010 = 0x4A
	
	;; ── TEST (non-destructive AND) ──
	mov eax, 0b10000000
	test eax, eax
	test eax, 1
	
	;; ── SHL / SHR ──
	mov eax, 5
	shl eax, 1
	shl eax, 2
	shr eax, 3

	;; ── SAR preserves sign bit ──
	mov eax, -8
	sar eax, 1
	
	;; ── Shift count from CL ──
	mov cl, 4
	mov eax, 0xFF
	shl eax, cl
	
	;; ── Rotate ──
	mov al, 0b10110001
	rol al, 1
	rol al, 1
	
	;; ── Extract a bit field (bits 4–7 of eax) ──
	mov eax, 0xABCD
	shr eax, 4
	and eax, 0xF
	
	mov rax, 60
	xor rdi, rdi
	syscall


	
