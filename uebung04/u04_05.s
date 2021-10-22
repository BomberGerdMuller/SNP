.global _start
_start:
	MOV R0, #0x0
	BL port_open
	BL gpio_init
	BL gpio_set
	@BP


end_loop:
	b	end_loop
