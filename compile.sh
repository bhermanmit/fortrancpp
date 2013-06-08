gfortran -c -g main.f90
g++ -c -g data.cpp
gfortran -g main.o data.o -lstdc++
