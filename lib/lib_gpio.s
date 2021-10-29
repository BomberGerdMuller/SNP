/********************************************************************/
/*	library: lib_gpio.s												*/												       */
/*	description:	Let you control Port A-G on the Nucleo Board	*/
/*	depends on:	-													*/																*/
/********************************************************************/
	.syntax unified
	.cpu cortex-m3
	.thumb

	.word 0x20000400
	.word 0x080000ed
	.space 0xe4

	.global port_open
	.global gpio_set
	.global gpio_init
@ Aktiviert einen Port
@ Input: 	R0 = Port [0..7] -> Port A-G
port_open:
	PUSH	{LR}
	LDR 	R1, =0x40021018				@ 0x40021018 Adresse APB2ENR
	LDR 	R2, [R1]					
	MOV		R3, #0b100					@ Standart 
	MOV		R0, R3, LSL R0				@ Bit Shift um R0 viele Stellen für das jeweilige Register
	ORR 	R2, R2, R0					@ Die "1" per logischem ODER in die Konfiguration schreiben
	STR 	R2, [R1]					@ Set IOPAEN bit in RCC_APB2ENR to 1 to enable GPIOA
	POP		{PC}

@ Initialisiert einen Port
@ Input: 	R0 = Port [0..7] -> Port A-G
@			R1 = Pin [0..15] -> Pin 0-15
@			R2 = Mode [0..3] -> Mode 0-3
gpio_init:
	PUSH	{LR}

	@ R0 und R1 "saven"
	PUSH	{R2}
	PUSH	{R1}						
	
	BL		get_port_register			@ Port-Register holen
	POP		{R2}						@ Pin-Nummer in R2
	CMP		R2, #7						@ I: Ist die Pinnummer > 7 ?
	ITT 	GT
	ADDGT 	R1, R1, #0x04				@ T: Dem Port-Register die Offset-Adresse hinzufügen
	SUBGT	R2, R2, #0x08				@ T:Pointer auf Pin-Bereich ausrichten
	MOV		R2, R2, LSL #2				@ Jeder Pin hat 4 Konfigurationsbits -> Pin-Nummer*4
	LDR 	R0, [R1]					@ Laden des Port-Configuration-Register

	MOV 	R3, #0x0000000f				@ Bitmaske invertieren
	MOV		R3, R3, LSL R2				@ 1er nach links verschieben
	EOR		R3, R3, #0xffffffff			@ Bits invertieren
	AND 	R0, R0, R3					@ 4 Konfigurations-Bits des Pins auf 0 setzen
	POP		{R3}						@ Modus: Eingabe/Ausgabe holen
	CMP		R3, #0						@ I:0: Eingabe, 1: Ausgabe
	ITE		LE
	MOVLE	R3, #0b0100					@ T:Bitmaske für Eingabe Floating input (reset state)
	MOVGT	R3, #0b0010					@ E:Bitmaske für Ausgabe Push_Pull
	MOV		R3, R3, LSL R2				@ Bitmaske an korrekte Stelle schieben.
	ORR 	R0, R3						@ CNF:MODE Pin-Konfiguration reinschreiben
	STR 	R0, [R1]					@ Set CNF8:MODE8 in GPIOA_CRH
	
	POP		{PC}


gpio_set:
	PUSH	{LR}

	@ R0 und R1 "saven"
	PUSH	{R2}						@ GPIO-Pin Low(0)/High(1) sichern
	PUSH	{R1}						@ Pin-Nummer sichern

	BL		get_port_register			@ Port-Nummer in R0 durch Zeiger auf Port-Register ersetzen
	ADD 	R1, R1, #0x10				@ Zeiger auf Port-Configuration-Register ausrichten
	LDR 	R0, [R1]					@ Laden des Port-Configuration-Register
	POP		{R2}						@ Pin-Nummer holen

	POP 	{R3}						@ GPIO-Pin Low(0)/High(1) holen
	CMP		R3, #0		
	IT		LE				
	MOVLE	R2, R2, LSL #16				@ Falls Set Low -> obere 16 Bit sind reset
	MOV 	R3, #1
	MOV 	R3, R3, LSL R2
	ORR 	R0, R3						@ Pin High/Low setzen
	STR 	R0, [R1]					@ Änderungen speichern
	POP		{PC}
	
	
get_port_register:
	PUSH	{LR}
	ldr 	R1, =0x40010800				@ Port-Register Port A (Start)
get_port_register_loop:
	CMP		R0, #0						@ Falls = 0 beendet
	ITT 	GT
	ADDGT	R1, #0x400					@ Wenn noch höherer Port als Ziel: Pointer um 0x400 verschieben.
	SUBGT	R0, #1						@ Anzahl übriger Additionen verringern	
	BGT		get_port_register_loop		@ Falls noch Additionen übrig: Springen
	POP		{PC}
