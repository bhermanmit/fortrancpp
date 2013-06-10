#include <stdlib.h>
#include <stdio.h>
#define Malloc(type,n) (type *)malloc((n)*sizeof(type))

struct Vec
{
  double **values;
};

extern "C" {
    void veccreate_(Vec *x, int *n);
    void vecsetvalue_(Vec *x, int *i, double *val);
    void vecprint_(Vec *x, int *n);
    void vecdestroy_(Vec *x);
    }

void veccreate_(Vec *x, int *n)
{
   x -> values = Malloc(double *, *n);
}

void vecsetvalue_(Vec *x, int *i, double *val)
{
   x -> values[*i] = val;
}

void vecprint_(Vec *x, int *n)
{
   for(int i = 0; i < *n; i++)
   {
     printf("%f\n", *x -> values[i]);
   }

}

void vecdestroy_(Vec *x)
{
   free(x -> values);
}
