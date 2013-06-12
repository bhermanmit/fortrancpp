#include <stdlib.h>
#include <stdio.h>

struct Vec
{
  int n;
  double *values;
};

extern "C" {
    void veccreate(Vec *x, int n);
    void vecsetvalue(Vec  *x, int i, double val);
    void vecprint(Vec *x);
    void vecdestroy(Vec *x);
    }

void veccreate(Vec *x, int n)
{
    double *temp = new double[n];
    printf("%d\n",n);
    x -> n = n;
    x -> values = temp;
}

void vecsetvalue(Vec *x, int i, double val)
{
     x -> values[i] = val;
}

void vecprint(Vec *x)
{
    for(int i = 0; i < x->n; i++)
    {
       printf("%f\n", x -> values[i]);
    }
}

void vecdestroy(Vec *x)
{
    delete[] x -> values;
}
