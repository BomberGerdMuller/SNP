u04_04.elf:
	as -g -o u04_04.o u04_04.s;ld -g -o u04_04.elf u04_04.o -T ../lib/stm32f1.ld
	
u04_05.elf: ../lib/lib_gpio.o
	as -g -o u04_05.o u04_05.s;ld -g -o u04_05.elf ../lib/lib_gpio.o u04_05.o -T ../lib/stm32f1.ld

led_d7_an.elf:
	as -g -o u04_04.o u04_04.s;ld -g -o led_d7_an.elf u04_04.o -T ../lib/stm32f1.ld
	
led_d7_aus.elf:
	as -g -o u04_05.o u04_05.s;ld -g -o led_d7_aus.elf u04_05.o -T ../lib/stm32f1.ld

led_d2_d7_d13_an.elf:
	as -g -o u04_07.o u04_07.s;ld -g -o led_d2_d7_d13_an.elf u04_07.o ../lib/lib_gpio.o -T ../lib/stm32f1.l

led_d2_d7_d13_aus.elf: ../lib/lib_gpio.o
	as -g -o u04_07.o u04_07.s;ld -g -o led_d2_d7_d13_aus.elf u04_07.o ../lib/lib_gpio.o -T ../lib/stm32f1.ld

u04_05.elf: ../lib/lib_gpio.o u04_05.s ../uebung03/mult_r0_mit_r1.o
	as -g -o u04_05.o u04_05.s; ld -g -o u04_05.elf u04_05.o ../lib/lib_gpio.o ../uebung03/mult_r0_mit_r1.o -T ../lib/stm32f1.ld

../uebung03/mult_r0_mit_r1.o: ../uebung03/mult_r0_mit_r1.s
	as -g -o ../uebung03/mult_r0_mit_r1.o ../uebung03/mult_r0_mit_r1.s


../lib/lib_gpio.o: ../lib/lib_gpio.s
	as -g -o ../lib/lib_gpio.o ../lib/lib_gpio.s


test.elf:
	as -g -o ledD7func.o ledD7func.s 
	as -g -o test.o test.s;ld -g -o test.elf test.o ledD7func.o -T ../lib/stm32f1.ld

ledD7func.o: ledD7func.s
	as -g -o ledD7func.o ledD7func.s

led_d2_an.elf:
	as -g -o d2.o d2.s;ld -g -o led_d2_an.elf d2.o -T ../lib/stm32f1.ld
