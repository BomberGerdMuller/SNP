.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4
@ D2 = PA10
@ D7 = PA8
@ D13 = PA5
.global _start
_start:

	MOV R0, #0x0
	BL port_open

	MOV R0, #0x0
	MOV R1, #8
	MOV R2, #1
	BL gpio_init

	MOV R0, #0x0
	MOV R1, #10
	MOV R2, #1
	BL gpio_init

	MOV R0, #0x0
	MOV R1, #5
	MOV R2, #1
	BL gpio_init

	MOV R0, #0x0
	MOV R1, #8
	MOV R2, #1
	BL gpio_set

	MOV R0, #0x0
	MOV R1, #10
	MOV R2, #1
	BL gpio_set


	MOV R0, #0x0
	MOV R1, #5
	MOV R2, #1
	BL gpio_set

loop:
	b	loop

