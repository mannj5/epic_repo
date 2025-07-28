ASM = nasm
LL = ld
ASMFLAGS = -f elf64

SRC = $(wildcard *.asm)
OBJ = $(SRC:.asm=.o)
PROGS = $(SRC:.asm=)

all: $(PROGS)

%: %.o
	$(LL) $< -o $@

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm -f $(PROGS) *.o
