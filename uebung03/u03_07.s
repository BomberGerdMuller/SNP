/********************************************************************************************************/
/* program: u03_07.s											*/
/* description: Takes 2 Integer Input and multiplies/divides it and outputs it on stdout	*/
/* depends on: lib_math.s 										*/
/********************************************************************************************************/

	.global main
	.func main
main:
	PUSH	{LR}
	BL	getNumber
	PUSH	{R1} 
	BL	getNumber 
	POP	{R0}
	/* R0 := erste Eingabe; R1 := zweite Eingabe */
	MOV	R6, R0			@ 1. Zahl zwischenspeichern
	MOV	R7, R1			@ 2. Zahl zwischenspeichern
	BL	mult_r0_mit_r1		@ R0 mit R0 multiplizieren
	PUSH	{R0}			@ Ergebnis der Multiplikation in Stack pushen
	MOV	R0, R6			@ zwischengespeicherte 1. Zahl in R0
	MOV	R1, R7			@ zwischengespeicherte 2. Zahl in R1
	BL	div_r0_durch_r1		@ R0 durch R0 Dividieren
	PUSH	{R0}			@ Ergebnis der Division in Stack pushen
	PUSH	{R1}			@ Rest der Division in Stack pushen

	LDR	R0, =string

	/* Temp */
	POP	{R4}
	POP	{R5}

	/* Mult */
	MOV	R1, R6			@ 1. Zahl
	MOV	R2, R7			@ 2. Zahl
	POP	{R3}			@ Ergebis Multiplikation

	/* Div */
	PUSH	{R4}			@ Rest
	PUSH	{R5}			@ Ergebnis division
	PUSH	{R7}			@ 2. Zahl
	PUSH	{R6}			@ 1. Zahl

	BL	printf			@ print

	ADD SP, SP, #16			@ Stack-Pointer anpassen (4*4)

	POP	{PC}

getNumber:
	PUSH	{LR}
	SUB	SP, SP, #4 		@ make a word on stack
	LDR	R0, addr_messin 	@ get addr of messagein
	BL	printf 			@ and print it
	LDR	R0, addr_format 	@ get addr of format
	MOV	R1, SP 			@ place SP in R1
	BL	scanf			@ and store entry on stack
	LDR	R1, [SP]		@ get addr of scanf inp

	ADD	SP, SP, #4		@ adjust stack
	POP	{PC}

_exit:
	MOV	PC, LR

addr_messin:	.word messagein
addr_format:	.word scanformat

.data
messagein:	.asciz "Enter your number: "
scanformat:	.asciz "%d"
string:		.asciz "Results are:\n%d*%d: %d\n%d/%d: %d R%d\n"
