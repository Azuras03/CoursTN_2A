CC = gcc
RM = rm

all: aligne aligne_non

aligne: useGetrusage.o aligne.o
	${CC} -o aligne useGetrusage.o aligne.o

aligne_non:
	${CC} -o non_aligne useGetrusage.o non-aligne.c

mem_virtuelle:
	${CC} -o memVirtuelle memVirtuelle.c

clean:
	${RM} -f *~ *.bak *.tmp \
	         *.o *.s
cleanall: clean
	${RM} -f aligne
