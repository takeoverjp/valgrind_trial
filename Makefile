CFLAGS=-g
CC=gcc

BIN=memleak \
	mem_double_free \
	fdleak

.PHONY: all clean
all: run-memleak run-mem_double_free run-fdleak 
clean:
	rm -f $(BIN) *.o *~

memleak: memleak.c
	$(CC) -o $@ $^

run-memleak: memleak
	valgrind ./$^

mem_double_free: mem_double_free.c
	$(CC) -o $@ $^

run-mem_double_free: mem_double_free
	valgrind ./$^

fdleak: fdleak.c
	$(CC) -o $@ $^

run-fdleak: fdleak
	valgrind --track-fds=yes ./$^
