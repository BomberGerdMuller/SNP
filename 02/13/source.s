/************************************************************************************************/
/* program: 02/13/source.s
/* description: Multiplies 2 Numbers (73, 25) and Moves the output to 
/* depends on: - 
/************************************************************************************************/

	.global	_start
_start:
	MOV	R1, #73
	MOV	R2, #25
	MOV	R0, #0		@ R0 initial auf 0 setzen
	BNE loop		@ zur loop Branchen

loop:	
	ADD	R0, R1 		@ R1 zu R0 hinzufügen
	SUB	R2, R2, #1	@ R2 1 abziehen bis es 0 erreich
	CMP	R2, #0	
	BNE loop		@ Wenn R2 0 erreicht hat, nicht mehr in die loop springen, das
				@ Ergebnis liegt in R0

_exit:
	MOV	R7, #1
	SWI	0

