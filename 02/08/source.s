/************************************************************************************************/
/* program: 02/08/source.s										*/
/* description: Adds 432 and 177 								*/
/* depends on: -										*/
/************************************************************************************************/

	.global	_start
_start:
	MOV	R1, #432
	MOV	R2, #177
	ADD	R0, R1, R2 @ 432+177 = 609
/* 
	Unsere "Rueckgabe" wird via echo $? ausgegeben -> 97 ,
	"$?" 'haelt' den Exit-Code des letzten ausgefuehrten Programmes,
	Der Exit-Code wird bei ARM-CPU's konventionell im R0-Register gespeichert.
	Das berechnete Ergebnis steht am Ende im Register R0 und wir nutzen das aus
	um eine schnelle Ausgabe des Programmes zu erhalten.
	609 - 97 = 512 --> Es hat den 512er-Bit abgeschnitten, $? erwartet ein 9-Bit Wort
	es gibt also ein Overflow-Error
*/
_exit:
	MOV	R7, #1
	SWI	0
 
