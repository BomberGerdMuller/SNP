/************************************************************************************************/
/* program: u02_10.s	 									*/
/* description: Pushes three numbers to stack and pops two numbers from the stack.		*/
/*		Then it loads the value where the Stack-Pointer is pointing to, to R0.		*/
/* depends on: - 										*/
/************************************************************************************************/

	.global	_start
_start:	
	MOV	R1, #140		@ R1 = 140
	MOV	R2, #204		@ R2 = 204
	MOV	R3, #251		@ R3 = 251

	push	{R1}			@ stack = 140 (R1)
	push	{R2}			@ stack = 140, 204 (R2)
	push	{R3}			@ stack = 140, 204, 251 (R3)

	pop	{R4}			@ stack = 140, 204; R4 = 251
	pop	{R5}			@ stack = 140; R5 = 204

	LDR	R0, [SP]		@ R0 = 140
/*	
	Einen Rueckschluss auf die genaue Stackstrategie kann man damit nicht ziehen, da man nicht weiss,
	ob sich der Stack-Pointer erhoeht oder verringert. Da sich jedoch der Wert 140 an der Stack-Pointer-Adresse
	befindet kann man darauf schliessen, dass die Strategie "empty" und nicht "full" ist. Dabei wird bei
	"pop {R5}" erst der Wert (204) in R5 geschrieben und anschliessend der Stack-Pointer erhoeht oder verringert,
	sodass er auf den Wert 104 zeigt.  
*/
_exit:
	MOV	R7, #1
	SWI	0

