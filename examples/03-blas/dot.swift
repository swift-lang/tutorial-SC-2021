
/**
   Example 3 - DOT.SWIFT
*/

// Swift/T libraries:
import blob;
import io;
import matrix;

// BLAS library for this example:
import blas;

main
{
  // Swift floats are 64-bit
  float A[];
  float B[];
  int N = 3;
  foreach i in [0:N-1]
  {
    A[i] = itof(i);   // integer-to-float
    B[i] = itof(i+1);
  }

  // Use => for output ordering
  printf("A") =>
    vector_print(A) =>
    printf("\nB") =>
    vector_print(B)
    =>
    float z = blas_ddot(N, A, B);

  printf("\nA*B=%0.1f", z);
}
