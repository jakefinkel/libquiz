
.libquiz: printer.c
	gcc -dynamiclib -o libquiz.dylib -dy printer.c
.test: test.c
	gcc -L. -lquiz -o test test.c
	install_name_tool -change libquiz.dylib @executable_path/libquiz.dylib test

all: .libquiz | .test

install: 
	mkdir libquiz && mv libquiz.dylib libquiz/ && mv test libquiz/ && cp printer.h libquiz/
	zip libquiz.zip libquiz/*
	rm -rf libquiz/