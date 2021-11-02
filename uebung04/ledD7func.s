.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4
@ .global turnonLED
.global port_open
.global gpio_init
.global gpio_set

port_open:
PUSH {LR}
@ Clock Register Aktivieren
PUSH {R0}
ldr r1, =0x40021018		@ 0x40021018 Adresse APB2ENR
ldr r0, [r1]
MOV R3, #0x04
POP {R4}
LSL R3, R3, R4
orr r0, r0, R3		    @ 04 Wert um Port A zu aktivieren
str r0, [r1]			@ Set IOPAEN bit in RCC_APB2ENR to 1 to enable GPIOA
POP {PC}

gpio_init:
PUSH {LR}
@ PA8 auf Output setzen
ldr r1, =0x40010804		@ 0x40010800 Adresse Port A CRH
ldr r0, [r1]
and r0, 0xfffffff0
orr r0, 0b00100000			@ CNF:MODE Bits für PA8 als Ausgang Push_Pull
str r0, [r1]			@ Set CNF8:MODE8 in GPIOA_CRH
POP {PC}

gpio_set:
PUSH {LR}
@ PA8 auf 1 setzen
ldr r1, =0x40010810		@ ZZZZZZZZ Adresse BSRR Port A
MOV r2, 1
MOv R0, r2, LSL 10
@ldr r0, =0b100000000 			@ ZZ Wert um PA8 high zu setzen
@ MOV r2, #16
@LSR r0, r0, #16
str r0, [r1]			@ Set BS8 in GPIOA_BSRR to 1 to set PA8 high
POP {PC}

