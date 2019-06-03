CFLAGS=-g
CC=gcc

BIN=mem_leak \
	mem_double_free \
	mem_use_after_free \
	mem_out_of_range \
	fd_leak

.PHONY: all clean
all: run-mem_leak \
	run-mem_double_free \
	run-mem_use_after_free \
	run-mem_out_of_range \
	run-fd_leak 
clean:
	rm -f $(BIN) *.o *~

mem_leak: mem_leak.c
	$(CC) -o $@ $^

run-mem_leak: mem_leak
	valgrind ./$^

mem_double_free: mem_double_free.c
	$(CC) -o $@ $^

run-mem_double_free: mem_double_free
	valgrind ./$^

mem_use_after_free: mem_use_after_free.c
	$(CC) -o $@ $^

run-mem_use_after_free: mem_use_after_free
	valgrind ./$^

mem_out_of_range: mem_out_of_range.c
	$(CC) -o $@ $^

run-mem_out_of_range: mem_out_of_range
	valgrind ./$^

fd_leak: fd_leak.c
	$(CC) -o $@ $^

run-fd_leak: fd_leak
	valgrind --track-fds=yes ./$^
