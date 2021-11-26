hello.elf: hello.o lib_lcd.o lib_timer.o lib_gpio.o
	ld -g -o hello.elf hello.o -T stm32f1.ld

hello.o: hello.s
	as -g -o hello.o hello.s

lcd.o: lcd.s
	as -g -o lcd.o lcd.s

# lib_lcd.o: lib_lcd.s
# 	as -g -o lib_lcd.o lib_lcd.s

lib_timer.o: lib_timer.s
	as -g -o lib_timer.o lib_timer.s

lib_gpio.o: lib_gpio.s
	as -g -o lib_gpio.o lib_gpio.s
