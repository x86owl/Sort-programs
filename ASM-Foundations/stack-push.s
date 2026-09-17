;PROGRAM --->    day: 8,
;   title: "The Stack — PUSH, POP & RSP",
;   tag: "STACK & FUNCTIONS",
;   theory: `The stack is a contiguous region of memory that grows DOWNWARD in x86. RSP (Stack Pointer) always points to the CURRENT top element.

section .data
	
section .text
global _start
_start:
	;; ── Basic PUSH / POP ──
	mov rax, 0xAAAA
	mov rbx, 0xBBBB
	mov rcx, 0xCCCC

	push rax		; rsp -= 8, [rsp] = 0xAAAA
	push rbx
	push rcx

	;; ── Saving registers around a call ──
	mov rdi, 42
	push rdi		; save rdi
	pop rdi 		; restore rdi = 42

	;; ── Peeking at stack without popping ──
	push rax
	mov rbx, [rsp]		; rbx = rax (no pop yet)
	add rsp, 8		; manual "pop" without destination

	;; ── PUSHA/POPA equivalent (push all) ──
	push rax
	push rbx
	push rcx
	push rdx
	
	; ... do stuff ...
	pop rdx
	pop rcx
	pop rbx
	pop rax

	;; ── Allocate/free local space on stack ──
	sub rsp, 32		; allocate 32 bytes of local space
	mov qword[rsp], 10	; local var 1 at [rsp]
	mov qword[rsp+8], 20	; local var 2 at [rsp+8]
	mov qword[rsp+16], 30	; local var 3 at [rsp+16]
	
	add rsp, 32		; free locals (pop the frame)

	;; ── Save/restore flags ──
	pushfq 			; RFFLAGS	
	and qword[rsp], ~(1<<10); clear DF (direction flag)
	popfq 			; restore RFFLAGS

	mov rax, 60
	xor rdi, rdi
	syscall
	
