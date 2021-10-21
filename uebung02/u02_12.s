/************************************************************************************************/
/* program: u02_12.s										*/
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

/*
	Bei beiden STM und LDM handelt es sich um die Empty-Ascending Stackstrategie,
	Da beim laden der Werte in den Stack erst der Wert geschrieben wird und danach der Stack-Pointer
	erhoeht wird. Beim laden der Werte aus dem Stack wird erst der Stack-Pointer verringert
	und anschließend der Wert ausgelesen.
*/
	
_exit:
	MOV	R7, #1
	SWI	0

