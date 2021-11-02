.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

.global wait_ca_1us 
.global wait_ca_1ms
.global wait_ca_1s

wait_ca_1us:
	MOV PC, LR

wait_ca_1ms:
	PUSH {LR}
loop_R1ms:
	MOV R2, #1000
inner_loop:
	BL wait_ca_1us
	SUB R2, R2, #1
	CMP R2, #0
	IT NE
	BNE inner_loop
	SUB R0, R0, #1
	CMP R0, #0
	IT NE
	BNE loop_R1ms
	POP {PC}



wait_ca_1s:
	PUSH {LR}
	MOV R1, R0
loop_R1s:
	MOV R0, #1000
	BL wait_ca_1ms
	SUB R1, R1, #1
	CMP R1, #0
	IT NE
	BNE loop_R1s
	POP {PC}
