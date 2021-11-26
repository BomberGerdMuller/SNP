
.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

.global _start
_start:
	MOV R0, #0x0
	BL port_open
	MOV R0, #0x0
	MOV R1, #8
	MOV R2, #1
	BL gpio_init
	MOV R0, #0x0
	MOV R1, #8
	MOV R2, #1
	BL gpio_set

loop:
	B loop
