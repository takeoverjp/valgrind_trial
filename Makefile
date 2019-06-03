CFLAGS=-g
CC=gcc

BIN=memleak \
	fdleak

.PHONY: all clean
all: run-memleak run-fdleak
clean:
	rm -f $(BIN) *.o *~

memleak: memleak.c
	$(CC) -o $@ $^

run-memleak: memleak
	valgrind ./$^

fdleak: fdleak.c
	$(CC) -o $@ $^

run-fdleak: fdleak
	valgrind --track-fds=yes ./$^
