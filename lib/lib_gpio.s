.syntax unified
.cpu cortex-m3
.thumb

     .global port_open
     .global gpio_init
     .global gpio_set

port_open:
     PUSH {LR}
     ldr r1, =0x40021018      @ 40021018 Adresse APB2ENR
     ldr r2, [r1]
     MOV R6, #4
     MOV R3, R6, LSL R0
     orr r2, r2, R3           @ 100 bis 1000000 Wert um Port A bis Port E zu aktivieren
     str r2, [r1]             @ Set IOPxEN bit in RCC_APB2ENR to 1 to enable GPIOx
     @ MOV PC, LR
     POP {PC}

get_portx_register:
     PUSH {LR}
     LDR R1,=#0x40010800
     loop:
         cmp R0, #0
         ITTT NE
         ADDNE R1, R1, #0x400
         SUBNE R0, R0, #1
         BNE loop
     MOV R0, R1
     POP {PC}

gpio_init:
     PUSH {LR}
     PUSH {R2}
     PUSH {R1}
     BL get_portx_register
     POP {R2}
     CMP R2,#0x7
     ITT GT
     ADDGT R0,R0,#0x04
     SUBGT R2,R2,#0x08
     MOV R2,R2,LSL #2
     LDR R1, [R0]
     MOV R6, #0xFFFFFFF0
     MOV R5, #32
     SUB R5, R5, R2
gpio_shift_loop1:
          ROR  R6, #1
          SUBS R5, #1
          IT NE
          BNE gpio_shift_loop1
     AND R1, R1,R6
     POP {R3}
     CMP R3, #0
     IT EQ
     MOVEQ R6, #0b0100
     IT GT
     MOVGT R6, #0b0010
     CMP  R2, #0
     IT EQ
     BEQ  gpio_shift_loop2_end
gpio_shift_loop2:
          LSL  R6, #1
          SUBS R2, R2, #1
          IT NE
          BNE gpio_shift_loop2
gpio_shift_loop2_end:
     ORR  R1, R1,R6
     STR  R1, [R0]
     POP  {PC}

     @ldr r1, =0x40010804        @ 40010800 Adresse Port A CRH
     @ldr r0, [r1]
     @and r0, #0xfffffff0
     @orr r0, #0b001            @ CNF:MODE Bits für PA8 als Ausgang Push_Pull
     @str r0, [r1]            @ Set CNF8:MODE8 in GPIOA_CRH
     @MOV PC, LR



gpio_set:
     PUSH {LR}
     PUSH {R2}
     PUSH {R1}
     BL get_portx_register
     POP {R2}
     ADD R0, R0, #0x10
     LDR R1, [R0]
     POP {R4}
     MOV R5, #1
     MOV R6, R5, LSL R2
     CMP R4, #0
     IT EQ
     MOVEQ R6, R6, LSL #16
     ORR R1, R1, R6
     STR R1, [R0]
     POP {PC}

