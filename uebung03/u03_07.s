/************************************************************************************************/
/* program: u03_06.s
/* description: Solves the following problem: 73x25 , 857/17 with the help of the library lib_math.s
/* depends on: lib_math.s 
/************************************************************************************************/

.global main
.func main
main:
PUSH {LR} @ use pseudo directive
BL getNumber
PUSH {R1} 
BL getNumber @ => R1 = 2 
POP {R0} @ => R0 = 10
/* Ab jetzt ist R0 die erste Zahl und R1 die zweite */
MOV R6, R0
MOV R7, R1
BL mult_r0_mit_r1 @ => R0 = 10 * 2 = 20 
PUSH {R0}
MOV R0, R6
MOV R1, R7
BL div_r0_durch_r1
PUSH {R0}
PUSH {R1}
LDR R0, =string

/* Temp */
POP {R4}
POP {R5}

/* Mult */
MOV R1, R6 
MOV R2, R7
POP {R3}

/* Div */
PUSH {R4}
PUSH {R5}
PUSH {R7}
PUSH {R6}
BL printf
POP {R1}
POP {R1}
POP {R1}
POP {R1}
POP {PC} @ restore PC

getNumber:
PUSH {LR}
SUB SP, SP, #4 @ make a word on stack
LDR R0, addr_messin @ get addr of messagein
BL printf @ and print it
LDR R0, addr_format @ get addr of format
MOV R1, SP @ place SP in R1
BL scanf @ and store entry on stack
LDR R1, [SP] @ get addr of scanf inp

@LDR R0, addr_messout @ get addr of messageout
@BL printf @ print it all
ADD SP, SP, #4 @ adjust stack
POP {PC}

_exit:
MOV PC, LR @ simple exit
addr_messin: .word messagein
addr_format: .word scanformat
addr_messout: .word messageout
.data
messagein: .asciz "Enter your number: "
scanformat: .asciz "%d"
messageout: .asciz "Your number was %d\n"
string:
	.asciz "Results are:\n%d*%d: %d\n%d/%d: %d R%d\n"
