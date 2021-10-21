/************************************************************************************************/
/* program: u02_09.s										*/
/* description: Adds 432 and 177. 								*/
/* depends on: -										*/
/************************************************************************************************/

	.global	_start
_start:
	MOV	R2, #543
	MOV	R1, #432
/*
	Nach Beiden Rechnungen, kam jeweils 111 heraus. Das ein Wert negativ ist, liegt also nicht
	"direkt" im Register, sondern an einer anderen Stelle
*/
	MRS	R0, CPSR			@ Mit MRS (Move Register from Status) kann ein Status in ein Register geschrieben werden
	AND	R0, R0, #0xF0000000		@ Das CPSR enthaelt Status zum momentanen Program, mit einer Bitmaske werden nur die Flags
						@ ausgewaehlt, denn da steckt die info ob etwas negativ sein koennte.
						@ Hiernach ist R0 -> 0x0, wie erwartet
	SUB	R0, R1, R2
	MRS	R0, CPSR
	AND	R0, R0, #0xF0000000		@ Hiernach ist R0 -> 0x80000000, sprich: die Flag für Negative wurde auf 1 gesetzt
						@ Die information, dass das ergebnis negativ ist liegt also hier 
_exit:
	MOV	R7, #1
	SWI	0

