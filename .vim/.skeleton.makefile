PROJECT = WSU-CRYPT

EXE = wsuCrypt

SHELL = /bin/bash

CFLAGS += -Wall -Wextra -O3 -Werror # -g -Wpedantic

.PHONY = all clean project

all: project

project:
	$(CC) $(CFLAGS) $(EXE).c -o $(EXE)

clean:
	$(RM) $(EXE)
