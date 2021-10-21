/************************************************************************************************/
/* program: mult_r0_mit_r1.s									*/
/* description: Multiplies 2 Numbers (73, 25) and Moves the output to 				*/
/* depends on: - 										*/
/************************************************************************************************/

	.global	mult_r0_mit_r1
mult_r0_mit_r1:
	PUSH	{LR}
	MOV	R2, R0 
	BNE 	loop		@ zur loop Branchen
loop:	
	ADD	R0, R2 			@ R2 zu R0 hinzufuegen
	SUB	R1, R1, #1	@ R2 1 abziehen bis es 1 erreich. R0 ist standardmäßig nicht auf 0 und
				@ somit muss nur N-1 mal R2 addiert werden. 
	CMP	R1, #1	
	BNE 	loop		@ Wenn R2 1 erreicht hat, nicht mehr in die loop springen, das
				@ Ergebnis liegt in R0
	POP	{PC}	
	
