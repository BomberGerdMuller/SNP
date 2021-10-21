/************************************************************************************************/
/* program: u03_06.s
/* description: Solves the following problem: 73x25 , 857/17 with the help of the library lib_math.s
/* depends on: lib_math.s 
/************************************************************************************************/

.global main

main:
	PUSH {LR}
	MOV R0, #73
	MOV R1, #25
	BL mult_r0_mit_r1
	PUSH {R0}
	LDR  R1, var1_addr
    LDR  R0, [R1]
	MOV R1, #17
	BL div_r0_durch_r1
	PUSH {R0}
	PUSH {R1}
	LDR R0, =string
	POP {R3}
	POP {R2}
	POP {R1}
	BL printf
	POP {PC}
var1_addr: .word var1
_exit:
	MOV PC, LR
.data
string:
	.asciz "73x25 = %d\n857/17 = %d R%d.\n"
	var1: .word 857
