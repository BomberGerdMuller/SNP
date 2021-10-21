/************************************************************************************************/
/* program: 02/12/source.s									*/
/* description: stores values from R0-R2 in the stack and then loads it back to R3-R5.		*/
/* depends on: - 										*/
/************************************************************************************************/

	.global	_start
_start:
	MOV	R0, #140
	MOV	R1, #204
	MOV	R2, #251

	STM	SP!, {R0-R2}		@ laedt Werte von R0 bis R2 in den Stack
	LDMEA	SP!, {R3-R5}		@ laedt Werte von dem Stack in R3 bis R5


	
_exit:
	MOV	R7, #1
	SWI	0

