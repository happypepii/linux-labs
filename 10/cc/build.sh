#!/bin/bash

set -ueo pipefail

CC=gcc
LD=gcc
CFLAGS="-Wall -std=c99"

# Intentionally not quoting $CFLAGS as we want it to expand to individual
# parameters (and we know it will not contain any wildcards).
"$CC" -c $CFLAGS computation.c -o computation.o
"$CC" -c $CFLAGS main.c -o main.o

"$LD" -o example main.o computation.o
