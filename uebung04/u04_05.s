
.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

.global _start
_start:
	MOV R0, #0x1
	BL port_open
	MOV R0, #0x1
	MOV R1, #5
	MOV R2, #1
	BL gpio_init
	MOV R0, #0x1
	MOV R1, #5
	MOV R2, #1
	BL gpio_set
	@BP

_exit:
	MOV R7, #0x1
	SWI 0x0
	