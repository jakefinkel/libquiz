
.libquiz: printer.c
	gcc -dynamiclib -o libquiz.dylib -dy printer.c
.test: test.c
	gcc -L. -lquiz -o test test.c

all: .libquiz | .test

install: 
	mkdir libquiz && mv libquiz.dylib libquiz/ && mv test libquiz/ && cp printer.h libquiz/
	zip libquiz.zip libquiz/
	rm -rf libquiz/