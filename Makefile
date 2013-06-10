CC = g++
F90 = gfortran 
# Make sure the CC and F77 compilers were built with the same glibc library
# g77 will work fine on most systems
CFLAGS = -Wall 

OBJS = testc.o

all: main lib 

main : main.o $(OBJS) 
	$(F90) -g -o testcode main.o $(OBJS) -lstdc++

testc.o : testc.c   
	$(CC) $(CFLAGS) -g -c testc.c  

main.o : main.f90
	$(F90) -g -c -cpp main.f90

# Default Targets for Cleaning up the Environment
clean :
	rm *.o
	rm *.a

pristine :
	rm *.o
	rm *.a
	touch *.c

ctags :
	ctags *.c

# Target for making the library

lib: $(OBJS)
	ar -rc libbblas.a $(OBJS) 
	ranlib libbblas.a
