#include <stdlib.h>
#include <stdio.h>

struct Vec
{
  double **values;
  int n;
};

extern "C" {
    void veccreate_(Vec *x, int *n);
    void vecsetvalue_(Vec *x, int *i, double *val);
    void vecprint_(Vec *x);
    void vecdestroy_(Vec *x);
    }

void veccreate_(Vec *x, int *n)
{
   x -> values = new double*[*n];
   x -> n = *n;
}

void vecsetvalue_(Vec *x, int *i, double *val)
{
     x -> values[*i] = new double;
     *x -> values[*i] = *val;
}

void vecprint_(Vec *x)
{
   for(int i = 0; i < x->n; i++)
   {
     printf("%f\n", *x -> values[i]);
   }
}

void vecdestroy_(Vec *x)
{
  for(int i = 0; i < x->n; i++)
  {
    delete x -> values[i];
  }
  delete[] x -> values;
}
