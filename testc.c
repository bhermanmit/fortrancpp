#include <stdlib.h>
#include <stdio.h>
#define Malloc(type,n) (type *)malloc((n)*sizeof(type))

struct Vec
{
  double **values;
};

extern "C" {
    void testret_(float *mat);
    float testdot_(int *N, float *vec1, float *vec2);
    void testmat_(int *N, float *mat1, float *mat2, float *mat3);
    void vecsetvalues_(Vec *x, int *n, double vals[]);
    void vecgetvalues_(Vec *x, int *n);
    }

void testret_( float *mat ) 
{
    *mat = *mat + 1;
}

float testdot_(  int *N, float *vec1, float *vec2 ) 
{
    int i;
    float dot;

    dot = 0.0;

    for (i=0; i<*N; i++) { 
      dot = dot + *(vec1+i) * *(vec2+i);
      }
    return dot;
}

void testmat_(  int *N, float *mat1, float *mat2, float *mat3 ) 
{
    int i,j,k;
    float dot;

    // Assign stuff to mat3 from mat1 and mat2
    for (i=0; i<*N; i++) { 
      for (j=0; j<*N; j++) {
         dot = 0.0;
         for (k=0; k<*N; k++ ) {
           dot = dot + *(mat1+(*N*j+k)) * *(mat2+(*N*i+j));
         }
         *(mat3+(*N*j+i)) = dot;
       }
    }

}

void vecsetvalues_( Vec *x, int *n, double vals[] )
{
   x -> values = Malloc(double *, *n);
   for(int i = 0; i < *n; i++)
   {
      x -> values[i] = &vals[i];
   }
}

void vecgetvalues_( Vec *x, int *n )
{
   for(int i = 0; i < *n; i++)
   {
     printf("%f\n", *x -> values[i]);
   }

}
