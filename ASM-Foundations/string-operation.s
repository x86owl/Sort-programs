;day: 11,
;    title: "String Operations — MOVS, STOS, LODS, SCAS, CMPS",
;    tag: "MEMORY OPS",
;    theory: `x86 has special instructions for operating on memory buffers (strings). They use RSI (source) and RDI (destination) implicitly, and increment/decrement them based on the Direction Flag.

section .data
	src dd "Hello World!", 0
	pat db "world", 0
	
section .bss
	dst resb 64
	
section .text
global _start

; strlen(rdi) → rax
strlen:
	mov rcx, -1			; RCX = 0xFFFFFFFFFFFFFFFF
	xor al, al			; AL = 0 looking for null byte
	cld				; direction = forward 
	repne scasb 			; scan until [RDI] == AL, decrement RCX			; RCX was decremented once per byte checked, plus once for the null
	not rcx				; complement: turns (-count-2) into (count)
	dec rcx				; subtract 1 for null terminator
	mov rax, rcx			
	ret

; memcpy(rdi=dst, rsi=src, rdx=n)
memcpy:
	push rdi
	push rsi
	mov rcx, rdi
	cld
	rep movsb			; copy RCX bytes from [RSI] to [RDI]
	pop rdi
	pop rsi
	ret

; memset(rdi=dst, rsi=val, rdx=n)
memset:
	mov al, sil			; AL = byte value
	mov rcx, rdi
	cld
	rep stosb			; fill RCX bytes of [RDI] with AL
	ret

_start:
	cld				; clear direction flag (always do this first!)

	;; strlen("Hello, World!")
	lea rdi, [rel src]
	call strlen			; rax = 13
	
	;; memcpy src → dst
	lea rdi, [rel dst]	
	lea rsi, [rel src]
	mov rdx, 14			; 13 chars + null
	call memcpy
	
	;; memset dst to 'X'
	lea rdi, [rel dst]
	mov rsi, 'X'
	mov rdx, 5
	call memset			; first 5 bytes = 'XXXXX'

	;; CMPSB: compare two strings char by char
	lea rsi, [rel src]		
	lea rdi, [rel pat]
	mov rcx, 5
	repe cmpsb			; compare up to 5 bytes
	
	; ZF=1 if equal, ZF=0 if mismatch
	mov eax, 60	
	xor rdi, rdi
	syscall
			
