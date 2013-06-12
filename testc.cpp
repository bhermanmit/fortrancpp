#include <stdlib.h>
#include <stdio.h>

struct Vec
{
  double *values;
  int n;
};

extern "C" {
    Vec * veccreate(Vec *x, int n);
    Vec * vecsetvalue(Vec  *x, int i, double val);
    void vecprint(Vec *x);
    Vec * vecdestroy(Vec *x);
    }

Vec * veccreate(Vec *x, int n)
{
    double *temp = new double[n];
    x = new Vec;
    printf("%d\n",n);
    x -> n = n;
    x -> values = temp;
    return x;
}

Vec * vecsetvalue(Vec *x, int i, double val)
{
     x -> values[i] = val;
     return x;
}

void vecprint(Vec *x)
{
    for(int i = 0; i < x->n; i++)
    {
       printf("%f\n", x -> values[i]);
    }
}

Vec * vecdestroy(Vec *x)
{
    delete[] x -> values;
    x = NULL;
    return x;
}
