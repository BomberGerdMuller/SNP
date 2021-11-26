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

/* function lcd_enable: toggle enable-pin (PB8) to initiate write-data-event */	
lcd_enable:
     PUSH {LR}
     MOV R0, #0x01
     BL port_open
     MOV R0, #0x01
     MOV R1, #8
     MOV R2, #1
     BL gpio_init
     MOV R0, #0x01
     MOV R1, #8
     MOV R2, #1
     BL gpio_set

     MOV R0, #1
     BL delay_s
     MOV R0, #0x01
     MOV R1, #8
     MOV R2, #0
     BL gpio_set
     MOV R0, #1
     BL delay_s
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
     MOV R0, #50
     BL delay_ms
     MOV R0, #0b0011
     BL lcd_send_4bit
     MOV R0, #5
     BL delay_ms 
     MOV R0, #0b0011
     BL lcd_send_4bit
     
     MOV  R0, #0b0001
     BL delay_ms

     MOV R0, #0b0011
     BL lcd_send_4bit

     MOV R0, #0b0010
     BL lcd_send_4bit

     MOV R0, #0b0010
     BL lcd_send_4bit
     MOV R0, #0b1000
     BL lcd_send_4bit
     
     MOV R0, #0b0000
     BL lcd_send_4bit
     MOV R0, #0b1000
     BL lcd_send_4bit     
     
     MOV R0, #0b0000
     BL lcd_send_4bit
     MOV R0, #0b0001
     BL lcd_send_4bit  

     MOV R0, #0b0000
     BL lcd_send_4bit
     MOV R0, #0b0100
     BL lcd_send_4bit       

     POP {PC}


lcd_send_8bit:
     PUSH {LR}

     POP  {PC}


lcd_reset:
     PUSH {LR}
       

     POP  {PC}


lcd_send_4bit_8:
     PUSH {LR}

     POP  {PC}

lcd_send_4bit:
     PUSH {LR}
     MOV R4, R0
     MOV R0, #0x1
     BL port_open
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
     
     MOV R2, 0b1
     AND R2, R4
     MOV R0, 0x1
     MOV R1, #6
     BL gpio_set

     MOV R2, 0b1
     LSR R4, R4, #1
     AND R2, R4
     MOV R0, 0x1
     MOV R1, #5
     BL gpio_set

     MOV R2, 0b1
     LSR R4, R4, #1
     AND R2, R4
     MOV R0, 0x1
     MOV R1, #11
     BL gpio_set

     MOV R2, 0b1
     LSR R4, R4, #1
     AND R2, R4
     MOV R0, 0x1
     MOV R1, #10
     BL gpio_set
     MOV R0, #1
     BL delay_s
     BL lcd_enable
     POP  {PC}

.type EnableLCDClockGPIOB, %function
EnableLCDClockGPIOB:
	PUSH 	{LR}
	
	POP		{PC}

	
.type ConfigureLCDPinsPBx, %function
ConfigureLCDPinsPBx:
	PUSH 	{LR}

	POP	{PC}

