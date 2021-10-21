/************************************************************************************************/
/* program: 02/11/source.s									*/
/* description: Moves three numbers ti R0-R2. Then it stores them in the Program-Stack		*/
/* depends on: - 										*/
/************************************************************************************************/

	.global	_start
_start:
	MOV	R0, #140
	MOV	R1, #204
	MOV	R2, #251

	STM	SP!, {R0-R2} 		@ Mit dem Debugger sieht man: die Speicherstelle von SP ist "leer"
					@ und die Adresse hat sich erhoet -> Stack-Strategie: Empty Ascending (EA)
_exit:
	MOV	R7, #1
	SWI	0

