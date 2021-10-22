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
orr r2, r2, #0b100			@ 04 Wert um Port A zu aktivieren	
LSR	R0, R2, R0
str r0, [r1]			@ Set IOPAEN bit in RCC_APB2ENR to 1 to enable GPIO
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
@ PUSH {R2}
@ PUSH {R1}
ldr r1, =0x40010804		@ 0x40010800 Adresse Port A CRH
loop:
SUB	R0,	r0, #1
CMP	R0, #0
ADDGE	r1,	r1,	#256
BGE		loop
ldr r0, [r1]
and r0, #0xfffffff0
orr r0, #0b0010			@ CNF:MODE Bits für PA8 als Ausgang Push_Pull
str r0, [r1]			@ Set CNF8:MODE8 in GPIOA_CRH
POP {PC}

gpio_set:
PUSH {LR}
ldr r1, =0x40010810		@ ZZZZZZZZ Adresse BSRR Port A
MOV r2, #1
MOv R0, r2, LSL #8
@ldr r0, =0b100000000 			@ ZZ Wert um PA8 high zu setzen
@ MOV r2, #16
@LSR r0, r0, #16
str r0, [r1]			@ Set BS8 in GPIOA_BSRR to 1 to set PA8 high
POP {PC}
