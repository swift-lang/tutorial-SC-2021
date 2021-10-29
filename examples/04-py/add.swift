
/**
   Example 4 - ADD.SWIFT
*/

// Swift/T libraries:
import io;
import python;
import string;

// This example: See ./numpy.swift
import numpy;

f()
{
  python(
----
print("Python works!")
repr(0)
----);
}

main
{
  f();
  matrix A1 = eye(3);
  matrix A2 = eye(3);
  matrix sum = add(A1, A2);
  printf("2*eye(3)=%s", sum);
}
