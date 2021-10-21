/************************************************************************************************/ 	
/* program: u03_03.s										*/		       
/* description : dividiert Register 0 durch Register 1 und speichert das Ergebnis in R0.	*/
/* depends on: -										*/
/************************************************************************************************/
	.global _start
_start:
	MOV	R0, #50
	MOV	R1, #2
	BL div_r0_durch_r1
	B	_exit




div_r0_durch_r1:
	PUSH	{LR}
	MOV	R2, #0					@ Verschiebung
	MOV	R3, R0					@ Wert fuer Berechnungen (Rest der Division)
	MOV 	R4, #0					@ Ergebnis (ganzzahliger Teil)
	MOV 	R5, #0					@ zu holende Zahl
	CMP 	R0, R1
	BLT 	programmende1

verschiebung_erhoehen:
	MOV 		R3, R0, LSR R2				@ R0 um R2 Stellen kuerzen
	CMP 		R3, R1
	ADDGE		R2, R2, #1				@ Verschiebung um 1 hochzählen
	BGE		verschiebung_erhoehen
	
	SUB		R2, R2, #1			@ Anzahl abgeschnittene und damit nachher zu holende Stellen
	MOV		R3, R0, LSR R2			@ erster Teildividend

divisionsschleife:
	MOV		R4, R4, LSL #1			@ vor jedem Durchlauf Ergebnisregister R4 um 1 Stelle nach links schieben
	CMP		R3, R1
	SUBGE		R3, R1					@ Subtraktion Teildividend - Divisor
	ADDGE		R4, R4, #1				@ 1 in Ergebnisregister R4 anhängen
	SUB		R2, R2, #1			@Verschiebung verringern

	CMP		R2, #0
	BLT		programmende2
	MOV		R5, R0, LSR R2			@ die naechste zu holende Stelle an Bit 0
	AND		R5, R5, #1			@ alle Bits außer LSB auf 0 setzen
	MOV		R3, R3, LSL #1			@ schieben, um das 'Holen' vorzubereiten
	ADD		R3, R3, R5			@ Ahnhaengen der naechsten Stelle
	B		divisionsschleife

programmende2: 						@ R0 konnte durch R1 geteilt werden
	MOV 	R0, R4					@ ganzzahliger Anteil des Ergebnisses in R0
	MOV	R1, R3					@ Rest in R1
	POP	{PC}
programmende1:						@ R1 passt kein Mal in R0
	MOV	R1, R0
	MOV 	R0, #0
	POP	{PC}
_exit:
	MOV	R7, #1
	SWI	0
