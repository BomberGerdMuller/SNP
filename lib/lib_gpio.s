.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

.global port_open
.global gpio_init
.global gpio_set


/*
 Function: port_open
 Description: Initializes the GPIO pins
 Input: R0 -> Port (A=0 ... G=7)
*/
port_open:
PUSH	{LR}
ldr r1, =0x40021018		@ 0x40021018 Adresse APB2ENR
ldr r2, [r1]
MOV R3, #0b100
LSL R3, R3, R0
orr r2, r2, R3			@ 04 Wert um Port A zu aktivieren
str r2, [r1]			@ Set IOPAEN bit in RCC_APB2ENR to 1 to enable GPIO
POP {PC}

/*
Function: gpio_init
Description: Initializes the GPIO pins
Input:	R0 -> Port (A=0 ... G=7)
		R1 -> Pin (0 ... 15)
		R2 -> Mode (0 Input / 1 Output)
 */
gpio_init:
PUSH {LR}
PUSH {R2}
PUSH {R1}
BL get_point_register
POP {R2}
CMP R2, #0x7
ADDGT R0, R0, #0x4
SUBGT R2,R2, #0x08
MOV R2,R2,LSL #2
LDR R1, [R0]
and r1, r1 #0xfffffff0, ROL R2
POP {R3}
CMP R3, #0
MOV R6, #0b0100
ORRET R1, R1, R6, LSL R2
MOV R6, #0b0010
ORRGT R1, R1, R6, LSL R2
str r1, [R0]
POP {PC}



get_point_register:
PUSH {LR}
MOV R1, 0x400
LDR R1, =0x40010800		@ 0x40010800 Adresse Port A CRH
loop:
	CMP R0, #0
	ADDNE R1, R1, #0x400
	SUBNE R0, R0, #1
	BNE loop
	POP {PC}
ADD R0, R1, R0
POP {PC}

gpio_set:
PUSH {LR}
BL get_point_register
ADD R0, R0, 0x10
LDR R1, [R0]
POP {R4}
MOV R5, #1
MOV R6, R5, LSL R2
cmp R4, #0
MOVEQ R4, R4, LSL #16
ORR R1, R1, R4
@ldr r0, =0b100000000 			@ ZZ Wert um PA8 high zu setzen
@ MOV r2, #16
@LSR r0, r0, #16
str r1, [r0]			@ Set BS8 in GPIOA_BSRR to 1 to set PA8 high
POP {PC}
