.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

.global _start

_start:
@init PA8
MOV R0, #0x0
BL port_open
MOV R0, #0x0
MOV R1, #8
MOV R2, #1
BL gpio_init

endlessLoop:
BL turnOnLEDs
MOV R0, 10
BL wait_ca_1s
BL turnOffLEDs
MOV R0, 10
BL wait_ca_1s
B endlessLoop



turnOnLEDs:
PUSH {LR}
MOV R0, #0x0
MOV R1, #8
MOV R2, #1
BL gpio_set
POP {PC}

turnOffLEDs:
PUSH {LR}
MOV R0, #0x0
MOV R1, #8
MOV R2, #0
BL gpio_set
POP {PC}

@ eLoop:
@     B eLoop
