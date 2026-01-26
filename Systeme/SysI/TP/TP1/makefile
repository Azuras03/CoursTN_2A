CC=clang
CFLAGS=-Wall -Wextra -Wformat

q1: q1.c
	$(CC) $(CFLAGS) -o q1.o q1.c
q2: q2.c
	$(CC) $(CFLAGS) -o q2.o q2.c 
q3: q3.c
	$(CC) $(CFLAGS) -o q3.o q3.c
q4: q4.c
	$(CC) $(CFLAGS) -o q4.o q4.c
q5: q5.c
	$(CC) $(CFLAGS) -o q5.o q5.c
runq1: q1
	./q1.o

runq2: q2
	./q2.o

runq3: q3
	./q3.o ls -lt /

runq4: q4
	./q4.o mkdir toto
runq5: q5
	./q5.o

clean:
	rm -f *.o