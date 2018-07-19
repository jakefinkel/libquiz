
.libquiz: printer.c
	gcc -dynamiclib -o libquiz.dylib -dy printer.c
.test: test.c
	gcc -L. -lquiz -o test test.c
	
all: .libquiz | .test