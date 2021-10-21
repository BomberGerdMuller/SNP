/************************************************************************************************/
/* program: u03_01.s										*/
/* description: Multiplies 73 with 25 and 127 with 7 Numbers					*/
/* depends on: mult_r0_mit_r1(.o)								*/
/************************************************************************************************/

	.global	_start
_start:
	MOV	R0, #73
	MOV	R1, #25
	BL	mult_r0_mit_r1
	@MOV	R5, R0
	MOV	R0, #127
	MOV	R1, #7
	BL	mult_r0_mit_r1
	@MOV	R6, R0
	

_exit:
	MOV	R7, #1
	SWI	#0
