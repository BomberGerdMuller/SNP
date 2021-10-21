/************************************************************************************************/
/* program: u03_05.s
/* description: Solves the following problem: 73x25 , 857/17 with the help of the library lib_math.s
/* depends on: lib_math.s 
/************************************************************************************************/

.global _start

_start:
    
	MOV	R0, #73
	MOV	R1, #25
	BL	mult_r0_mit_r1
	PUSH	{R0}

	MOV	R0, #857
	MOV	R1, #17
	BL	div_r0_durch_r1
	POP	{R2}

_exit:
	MOV	R7, #1
	SWI	0

