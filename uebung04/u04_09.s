.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

.global _start
@ D2 = PA10
@ D7 = PA8
@ D13 = PA5

_start:
MOV R0, #0x0
BL port_open
BL turnOnGreenLED
tlLoop:
MOV R0, 3
BL wait_ca_1s
BL transitionGR
MOV R0, 3
BL wait_ca_1s
BL transitionRG
B tlLoop
exit:
    B exit

transitionRG:
PUSH {LR}
BL turnOnYellowLED
MOV R0, 1
BL wait_ca_1s
BL turnOffRedLED
BL turnOffYellowLED
BL turnOnGreenLED
POP {PC}

transitionGR:
PUSH {LR}
BL turnOffGreenLED
BL turnOnYellowLED
MOV R0, 1
BL wait_ca_1s
BL turnOffYellowLED
BL turnOnRedLED
POP {PC}

turnOnRedLED:
PUSH {LR}
MOV R0, #0x0
MOV R1, #5
MOV R2, #1
BL gpio_init
MOV R0, #0x0
MOV R1, #5
MOV R2, #1
BL gpio_set
POP {PC}

turnOnYellowLED:
PUSH {LR}
MOV R0, #0x0
MOV R1, #10
MOV R2, #1
BL gpio_init
MOV R0, #0x0
MOV R1, #10
MOV R2, #1
BL gpio_set
POP {PC}

turnOnGreenLED:
PUSH {LR}
MOV R0, #0x0
MOV R1, #8
MOV R2, #1
BL gpio_init
MOV R0, #0x0
MOV R1, #8
MOV R2, #1
BL gpio_set
POP {PC}

turnOffRedLED:
PUSH {LR}
MOV R0, #0x0
MOV R1, #5
MOV R2, #1
BL gpio_init
MOV R0, #0x0
MOV R1, #5
MOV R2, #0
BL gpio_set
POP {PC}

turnOffYellowLED:
PUSH {LR}
MOV R0, #0x0
MOV R1, #10
MOV R2, #1
BL gpio_init
MOV R0, #0x0
MOV R1, #10
MOV R2, #0
BL gpio_set
POP {PC}

turnOffGreenLED:
PUSH {LR}
MOV R0, #0x0
MOV R1, #8
MOV R2, #1
BL gpio_init
MOV R0, #0x0
MOV R1, #8
MOV R2, #0
BL gpio_set
POP {PC}
