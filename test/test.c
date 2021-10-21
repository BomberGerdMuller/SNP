.global _start

_start:
	MOV R1, #10

	push {R1}

	LDR R0, [SP]

_exit:
	
