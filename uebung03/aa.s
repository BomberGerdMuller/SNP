/********************************************************************************************/
/* library:        func_math.s                                                                    */
/* description: Provides mathematiocal functions                                            */
/*                function div_r0_durch_r1: divides R0 with R1                                */
/*                function mult_r0_mit_r1: multiplies R0 and R1                                */
/* depends on:    -                                                                            */
/********************************************************************************************/
    .global mult_r0_mit_r1
    .global div_r0_durch_r1


/********************************************************************************************/
/* function: div_r0_durch_r1:                                                                */
/* description: multiplies the values of R0 and R1    and returns the result in R0            */
/********************************************************************************************/
/* input:    R0:    number to be divided                                                        */
/*             R1: number to divide through                                                    */
/* output:    R0: quotient of both numbers                                                    */
/* helper:     R2                                                                                */
/*            R3                                                                                */
/*            R4                                                                                */
/*            R5                                                                                */
/********************************************************************************************/
div_r0_durch_r1:
    PUSH {LR}
    MOV R2, #0
    MOV R3, R0
    MOV R4, #0
    MOV R5, #0

teildividend:
    CMP R0, R1
    BLT programmende1
verschiebung_erhoehen:
    MOV R3, R0, LSR R2
    CMP R3, R1
    ADDGE R2,R2,#1
    BGE verschiebung_erhoehen
    SUB R2, R2, #1
    MOV R3, R0, LSR R2
divisionsschleife:
    MOV R4, R4,LSL #1
    CMP R3, R1
    SUBGE R3, R3, R1
    ADDGE R4, R4, #1
    SUB R2, R2, #1
    CMP R2, #0
    BLT programmende2
    MOV R5, R0, LSR R2
    AND R5, R5, #1
    MOV R3, R3, LSL #1
    ADD R3, R3, R5
    B divisionsschleife


programmende1:
    POP {PC}

programmende2:
    MOV R0, R4
    MOV R1, R3
    POP {PC}


/********************************************************************************************/
/* function: mult_r0_mit_r1:                                                                */
/* description: multiplies the values of R0 and R1    and returns the result in R0            */
/********************************************************************************************/
/* input:    R0:    number to get multiplied                                                    */
/*             R1: number to multiply with                                                        */
/* output:    R0: product of both numbers                                                        */
/* helper:     R2: saves partial results of multiplication                                        */
/********************************************************************************************/
mult_r0_mit_r1:        
    PUSH {LR}
    MOV R2, #0
loop:
    ADD R2, R2, R0
    SUB R1, R1, #1
    CMP R1, #0
    BNE loop
    MOV R0, R2
    POP {PC}