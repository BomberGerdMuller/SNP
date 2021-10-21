/************************************************************************************************/
/* program: u02_09.s										*/
/* description: Adds 432 and 177. 								*/
/* depends on: -										*/
/************************************************************************************************/

	.global	_start
_start:
	MOV	R1, #543
	MOV	R2, #432
/*
	Bei SUB R0, R1, R2 kommt 111 --> 0x6F heraus
	Bei SUB R0, R2, R1 kommt -111 --> 0xFFFFFF91
	Also das 2er Komplement von 111
*/
	SUB R0, R2, R1 @ => 0xFFFFFF91
	/* Test für den CPSR
	SUBS R0, R2, R1 @ => 0xFFFFFF91
	MRS	R1, CPSR @ CPSR => 10000000000000000000000000010000 <-- Bit 31 ist 1 also wurde das Negative Flag gesetzt
	 */
_exit:
	MOV	R7, #1
	SWI	0

