
(float z) blas_ddot(int N, float X[], float Y[])
{
  blob x = blob_from_floats(X);
  blob y = blob_from_floats(Y);
  z = blas_ddot_blobs(N, x, y);
}

(float z) blas_ddot_blobs(int n, blob x, blob y)
"blas" "0.0.1"
[
// Blobs are presented to Tcl as a [ list pointer length handle ]
// The pointer is an integer: you can cast it to a pointer at the C level
// The length is in bytes - ignore the handle  
----
  set <<z>> [ blas::ddot_impl <<n>> <<x>> <<y>> ]
----
];       
