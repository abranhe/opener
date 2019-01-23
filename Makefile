PREFIX ?= /usr/local

SRC = cli.c $(wildcard deps/*/*.c) 

OBJ_SRC = $(SRC:.c=.o)

CFLAGS = -D_GNU_SOURCE -std=c99 -I deps/opener/ -I deps/os.c/

LFLAGS = -Wall -Wno-format-y2k -W -Wstrict-prototypes \
	-Wpointer-arith -Wreturn-type -Wcast-qual -Wwrite-strings -Wswitch \
	-Wshadow -Wcast-align -Wbad-function-cast -Wchar-subscripts -Winline \
	-Wnested-externs -Wredundant-decls

opener: $(OBJ_SRC)
	$(CC) $(OBJ_SRC) -o $@

.SUFFIXES: .c .o
.c.o:
	$(CC) $< $(CFLAGS) $(LFLAGS) -c -o $@

install: opener
	cp -f opener $(PREFIX)/bin/opener

uninstall:
	rm -f $(PREFIX)/bin/opener

run-test: opener
	bash ./test.sh

clean:
	rm -f opener *.o deps/**/*.o *.gc{ov,da,no}

.PHONY: clean run-test install uninstall
