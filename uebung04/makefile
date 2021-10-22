u04_04.elf:
	as -g -o u04_04.o u04_04.s;ld -g -o u04_04.elf u04_04.o -T ../lib/stm32f1.ld
	
u04_05.elf:
	as -g -o u04_05.o u04_05.s;ld -g -o u04_05.elf u04_05.o -T ../lib/stm32f1.ld

led_d7_an.elf:
	as -g -o u04_04.o u04_04.s;ld -g -o led_d7_an.elf u04_04.o -T ../lib/stm32f1.ld
	
led_d7_aus.elf:
	as -g -o u04_05.o u04_05.s;ld -g -o led_d7_aus.elf u04_05.o -T ../lib/stm32f1.ld

u04_05.elf: ../lib/lib_gpio.o u04_05.s
	as -g -o u04_05.o u04_05.s; ld -g -o u04_05.elf u04_05.o ../lib/lib_gpio.o -T ../lib/stm32f1.ld

../lib/lib_gpio.o: ../lib/lib_gpio.s
	as -g -o ../lib/lib_gpio.o ../lib/lib_gpio.s


