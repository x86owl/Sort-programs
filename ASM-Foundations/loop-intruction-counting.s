;    day: 10,
;    title: "Loop Instructions & Counting",
;    tag: "CONTROL FLOW",
;    theory: `x86 has dedicated loop instructions that use RCX/ECX/CX as the implicit counter. They're compact but less flexible than CMP+JNE patterns.

section .data
	arr dd 1,2,3,4,5,6,7,8,9,10

section .text
global _start
_start:
	lea rsi, [rel arr]		; rsi = pointer to array
	mov ecx, 10			; loop counter
	xor eax, eax  			; sum = 0

.sum_loop:
	add eax, [rsi]			; sum += *rsi
	add rsi, 4			; rsi += sizeof(int) = 4
	loop .sum_loop			; ecx--; jnz sum_loop		; eax = 55

	;; ── Preferred modern equivalent (same speed, explicit) ──
	lea rsi, [rel arr]
	mov ecx, 10
	xor eax, eax
	
.fast_loop:
	add eax, [rsi]
	add rsi, 4
	dec ecx
	jnz .fast_loop 			; 2 separate instructions, but fused by CPU
	
	;; ── Unrolled loop: process 4 elements per iteration ──
	lea rsi, [rel arr]
	mov ecx, 10 / 2			; 5 iterations (2 elements per pass)
	xor eax, eax
	
.unrolled:
	add eax, [rsi]			; elem[0]
	add eax, [rsi+4]		; elem[1]
	add rsi, 8
	dec ecx
	jnz .unrolled	

	;; ── LOOPNE: search loop (like strchr) ──
    	;; Find first non-zero byte in data	
	lea rdi, [rel arr]
	mov ecx, 10
	
.search:
	cmp byte[rdi], 0		; set ZF if zero byte found
	loopne .search			; continue while ZF=0 AND ecx≠0			;; if found: ZF=1, rdi points to the byte

	;; ── Nested loops (i: 0..2, j: 0..2) ──
	mov r8d, 3			; outer counter
.outer:
	mov r9d, 3			; inner counter
	
.inner:
	; body: r8d = outer i, r9d = inner j
	dec r9d
	jnz .inner
	dec r8d
	jnz .outer
		
	mov eax, 60
	xor rdi, rdi
	syscall
	
