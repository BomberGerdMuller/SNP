.global _start
_start:
	MOV R0, #0x0
	BL port_open
	BL gpio_init
	BL gpio_set
	@BP


_exit:
	MOV R7, #0x1
	SWI 0x0
	