.syntax unified
.cpu cortex-m3
.thumb

.section .VectorTable, "a"
.word _StackEnd
.word Reset_Handler
.space 0x34
.word SysTick_Handler
.space 0xac

.include "../lib/stm32f103.inc"

.text
.type Reset_Handler, %function
.global Reset_Handler
Reset_Handler:
    bl EnableClockGPIOx
    bl ConfigurePinsPAx
    bl StartSysTick
    bl lcd_init