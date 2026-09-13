global _start

_start:
	mov eax, 1	 ; exit (semi colon is a comment in assembly) 
	mov ebx, 12	 ; moving 12 to the ebx 
	sub ebx, 2	 ; subtracting 2 from 12
	add ebx, 10	 ; adding 10 to the ebx so total will be (20)
	int 0x80	 ; interrupt

