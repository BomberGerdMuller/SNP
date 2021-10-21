/********************************************************************************************************/
/* program: u03_06.s											*/
/* description: Solves the following problem: 73x25 , 857/17 with the help of the library lib_math.s	*/
/* depends on: lib_math.s										*/ 
/********************************************************************************************************/

.global main

main:
	PUSH	{LR}
	MOV	R0, #73
	MOV	R1, #25
	BL	mult_r0_mit_r1		@ R0 mit R0 multiplizieren
	PUSH	{R0}			@ Ergebnis der Multiplikation in Stack pushen
	LDR	R1, var1_addr
	LDR	R0, [R1]
	MOV	R1, #17
	BL	div_r0_durch_r1		@ R0 durch R0 Dividieren
	PUSH	{R0}			@ Ergebnis der Division in Stack pushen
	PUSH	{R1}			@ Rest der Division in Stack pushen

	LDR	R0, =string

	POP	{R3}			@ Rest
	POP	{R2}			@ Ergebnis division
	POP	{R1}			@ Ergebis Multiplikation
	BL	printf			@ print
	POP	{PC}

var1_addr: .word var1

_exit:
	MOV PC, LR

.data
string:
	.asciz "73x25 = %d\n857/17 = %d R%d.\n"
	var1: .word 857

