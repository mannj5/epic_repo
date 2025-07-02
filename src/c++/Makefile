CC = g++
CFLAGS = -Wall -pedantic -std=gnu99 -lm
SRC = $(wildcard *.cpp)
PROGS = $(SRC:.cpp=)

all: $(PROGS)
# List programs as targets so auto-complete works
$(PROGS):
        
clean:
	rm -f $(PROGS) *.o
