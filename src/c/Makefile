CC = gcc
CFLAGS = -Wall -pedantic -std=gnu99 -lm
SRC = $(wildcard *.c)
PROGS = $(SRC:.c=)

# Comment when not using threads
CFLAGS += -pthread

all: $(PROGS)
# List programs as targets so auto-complete works
$(PROGS):
        
clean:
	rm -f $(PROGS) *.o
