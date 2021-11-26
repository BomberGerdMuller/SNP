.syntax unified
.cpu cortex-m3
.thumb

.include "stm32f103.inc"

TimerValue=45

.text

.type SysTick_Handler, %function
.global SysTick_Handler
SysTick_Handler:
	ldr r0, =SCS
	ldr r0, [r0, #SCS_SYST_CSR]
	tst r0, #0x10000
	beq SysTick_Handler_Exit
	sub r10, r10, #1
SysTick_Handler_Exit:
	bx lr
	
.type delay_s, %function
.global delay_s
delay_s:
	push {lr}
	MUL R0, #1000
	BL delay_ms
	pop {lr}
	mov pc, lr

.type delay_ms, %function
.global delay_ms
delay_ms:
	push {lr}	
	MOV R10, #200
	MUL R10, R0, R10
	BL delay_5us
	pop {lr}
	mov pc, lr

.type delay_5us, %function
.global delay_5us
delay_5us:
	cmp r10, #0
	bgt delay_5us
	mov pc, lr

@ r0 = Count-Down value for timer
.type StartSysTick, %function
.global StartSysTick
StartSysTick:
	ldr r0, =TimerValue
	ldr r1, =SCS

	str r0, [r1, #SCS_SYST_RVR]
	
	@ldr r0, =0
	str r0, [r1, #SCS_SYST_CVR]

	ldr r0, =7
	str r0, [r1, #SCS_SYST_CSR]

	mov pc, lr
