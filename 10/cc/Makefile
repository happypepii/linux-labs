OBJ = computation.o main.o

.PHONY: all clean

all: example

clean:
	rm -f *.o example

%.o: %.c computation.h
	gcc -c -Wall -std=c99 $< -o $@

example: $(OBJ)
	gcc -o $@ $^
