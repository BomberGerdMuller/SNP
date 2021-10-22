.global _start
_start:
	MOV R0, #0x0
	BL port_open
	MOV R0, #0x0
	MOV R1, #8
	MOV R2, #0
	BL gpio_init
	MOV R0, #0x0
	MOV R1, #8
	MOV R2, #1
	BL gpio_set
	@BP

end_loop:
	b end_loop
	