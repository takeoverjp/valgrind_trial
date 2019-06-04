CFLAGS=-g
CXXFLAGS=-g
CC=gcc
CXX=g++
VALOPT=--error-exitcode=1

BIN=mem_leak \
	mem_double_free \
	mem_use_after_free \
	mem_out_of_range \
	fd_leak \
	test_badcode

.PHONY: all clean
all: $(BIN)
run: run-mem_leak \
	run-mem_double_free \
	run-mem_use_after_free \
	run-mem_out_of_range \
	run-fd_leak 
clean:
	rm -f $(BIN) *.o *~

mem_leak: mem_leak.c
	$(CC) $(CFLAGS) -o $@ $^

run-mem_leak: mem_leak
	! valgrind $(VALOPT) --leak-check=full ./$^

mem_double_free: mem_double_free.c
	$(CC) $(CFLAGS) -o $@ $^

run-mem_double_free: mem_double_free
	! valgrind $(VALOPT) ./$^

mem_use_after_free: mem_use_after_free.c
	$(CC) $(CFLAGS) -o $@ $^

run-mem_use_after_free: mem_use_after_free
	! valgrind $(VALOPT) ./$^

mem_out_of_range: mem_out_of_range.c
	$(CC) $(CFLAGS) -o $@ $^

run-mem_out_of_range: mem_out_of_range
	! valgrind $(VALOPT) ./$^

fd_leak: fd_leak.c
	$(CC) $(CFLAGS) -o $@ $^

run-fd_leak: fd_leak
	valgrind $(VALOPT) --track-fds=yes ./$^

test_badcode: test_badcode.cpp badcode.c
	$(CXX) $(CXXFLAGS) -o $@ $^ `pkg-config --libs cpputest`

run-test_badcode: test_badcode
	valgrind $(VALOPT) --leak-check=full --show-leak-kinds=all --track-fds=yes ./$^
