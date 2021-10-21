all: u03_01 u03_03 u03_05

u03_01: u03_01.o mult_r0_mit_r1.o
	ld -o u03_01 u03_01.o mult_r0_mit_r1.o

u03_01.o: u03_01.s
	as -g -o u03_01.o u03_01.s

mult_r0_mit_r1.o: mult_r0_mit_r1.s
	as -g -o mult_r0_mit_r1.o mult_r0_mit_r1.s


u03_03: u03_03.o
	ld -o u03_03 u03_03.o

u03_03.o: u03_03.s
	as -g -o u03_03.o u03_03.s



u03_05: u03_05.o lib_math.o
	ld -o u03_05 u03_05.o lib_math.o

u03_06: u03_06.s lib_math.s
	gcc -o u03_06 u03_06.s lib_math.s

u03_07: u03_07.s lib_math.s
	gcc -g -o u03_07 u03_07.s lib_math.s

lib_math.o: lib_math.s
	as -g -o lib_math.o lib_math.s

u03_05.o: u03_05.s
	as -g -o u03_05.o u03_05.s
