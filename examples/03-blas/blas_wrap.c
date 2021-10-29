
/**
   BLAS_WRAP.C
   Tcl/C interface for BLAS functions
   (You can auto-generate this with SWIG)
*/
 
#include <assert.h>

#include <tcl.h>

#include "cblas.h"

/**
   Set leaf package name here:
*/
#define LEAF_PKG_NAME blas

/**
   Set leaf package version here:
*/
#define LEAF_PKG_VERSION 0.0.1

/**
   Shorten command creation lines.
   The namespace is prepended
 */
#define COMMAND(tcl_function, pkg, c_function)

/**
   usage: blas::ddot [ N blob_X blob_Y ] => double_result
   Z = dot product X*Y
 */
static int
BLAS_ddot_Cmd(ClientData cdata, Tcl_Interp *interp,
              int objc, Tcl_Obj *const objv[])
{
  assert(objc == 4);
  int N;
  double* X;
  double* Y;
  int rc;

  // Unpack Tcl inputs
  rc = Tcl_GetIntFromObj(interp, objv[1], &N);
  assert(rc == TCL_OK);
  long pointer;
  rc = Tcl_GetLongFromObj(interp, objv[2], &pointer);
  assert(rc == TCL_OK);
  X = (double*) pointer;
  rc = Tcl_GetLongFromObj(interp, objv[3], &pointer);
  assert(rc == TCL_OK);
  Y = (double*) pointer;

  // Call BLAS
  double Z = cblas_ddot(N, X, 1, Y, 1);

  // Pack Tcl outputs
  Tcl_Obj* result = Tcl_NewDoubleObj(Z);
  Tcl_SetObjResult(interp, result);
  return TCL_OK;
}

int DLLEXPORT
Tclblas_Init(Tcl_Interp *interp)
{
  if (Tcl_InitStubs(interp, TCL_VERSION, 0) == NULL)
    return TCL_ERROR;

  if (Tcl_PkgProvide(interp, "blas", "0.0.1") == TCL_ERROR)
    return TCL_ERROR;

  Tcl_CreateObjCommand(interp,
                       "blas::c::ddot", BLAS_ddot_Cmd,
                       NULL, NULL);

  Tcl_Namespace* ns =
    Tcl_FindNamespace(interp, "blas", NULL, 0);

  Tcl_Export(interp, ns, "*", 0);
  return TCL_OK;
}
