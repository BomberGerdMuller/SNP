.syntax unified
.cpu cortex-m3
.thumb

     .global lcd_send_4bit
     .global lcd_send_4bit_8
     .global lcd_init
     .global lcd_send_8bit
     .global lcd_enable
     .global lcd_write
     .global lcd_command
     
lcd_send_4bit:
     PUSH {LR}
     
     
     POP {PC}

/* function lcd_enable: toggle enable-pin (PB8) to initiate write-data-event */	
    lcd_enable:
     PUSH {LR}
     
     
     POP  {PC}
     
/* function lcd_write: turn RS (PB9) on to initiate write-mode */	
lcd_write:
	PUSH	{LR}
 
     
     POP  {PC}

/* function lcd_command: turn RS (PB9) off to initiate command-mode */	
lcd_command:
	PUSH	{LR}
 
     
     POP  {PC}

lcd_init:
     PUSH {LR}
     
     POP {PC}


lcd_send_8bit:
     PUSH {LR}

     POP  {PC}


lcd_reset:
     PUSH {LR}
       

     POP  {PC}

     #Data 4 -> D10 = PB6
     #Data 5 -> D4 = PB5
     #Data 6 -> PB 11
     #Data 7 -> D6 = PB 10
lcd_send_4bit_8:
     PUSH {LR}
     MOV R4, R0
     # Open Port B
     MOV R0, #0x1
     BL port_open
     #Init  PB6 
     MOV R0, #0x1
     MOV R1, #6
     MOV R2, #1
     BL gpio_init

     MOV R0, #0x1
     MOV R1, #5
     MOV R2, #1
     BL gpio_init

     MOV R0, #0x1
     MOV R1, #11
     MOV R2, #1
     BL gpio_init

     MOV R0, #0x1
     MOV R1, #10
     MOV R2, #1
     BL gpio_init
     
     MOV R2, 0b1000
     AND R5, R4
     MOV R0, 0x1
     MOV R1 #6
     BL gpio_set

     MOV R2, 0b0100
     AND R5, R4
     MOV R0, 0x1
     MOV R1 #5
     BL gpio_set

     MOV R2, 0b0010
     AND R5, R4
     MOV R0, 0x1
     MOV R1 #11
     BL gpio_set

     MOV R2, 0b0001
     AND R5, R4
     MOV R0, 0x1
     MOV R1 #10
     BL gpio_set
     POP  {PC}


.type EnableLCDClockGPIOB, %function
EnableLCDClockGPIOB:
	PUSH 	{LR}
	
	POP		{PC}

	
.type ConfigureLCDPinsPBx, %function
ConfigureLCDPinsPBx:
	PUSH 	{LR}

	POP	{PC}
