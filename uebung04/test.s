.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4
.global _start
@ .global port_open
@ .global gpio_init
@ .global gpio_set
_start:
    mov r0, #0x0
    BL port_open
    BL gpio_init
    BL gpio_set


loop:
    B loop
