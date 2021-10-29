#!/bin/bash -eu

# BUILD.SH
# Build the blas leaf package

LEAF_PKG=blas
LEAF_SO="libtcl${LEAF_PKG}.so"
LEAF_TCL="${LEAF_PKG}.tcl"

BLAS_HOME=/home/wozniak/Public/sfw/ppc64-login/BLAS
CBLAS_HOME=/home/wozniak/Public/sfw/ppc64-login/CBLAS

CBLAS_INCLUDE=${CBLAS_HOME}/include

BLAS_A=$(  ls ${BLAS_HOME}/*.a )
CBLAS_A=$( ls ${CBLAS_HOME}/lib/*.a )

check()
{
  CODE=${?}
  if [[ ${CODE} != 0 ]]
  then
    MSG=$1
    echo ${MSG}
    exit ${CODE}
  fi
}

check "Could not find tclsh in PATH!"

TCL_HOME=/home/wozniak/Public/sfw/ppc64-login/tcl-8.5.12 
TCL_CONFIG=${TCL_HOME}/lib/tclConfig.sh
TCLSH=${TCL_HOME}/bin/tclsh8.5

# This loads many Tcl configuration variables
. ${TCL_CONFIG}
check "tclConfig.sh failed!"

CFLAGS="-fPIC -std=gnu99 -g -I ${CBLAS_INCLUDE}"

# Compile the Tcl extension
gcc ${CFLAGS} ${TCL_INCLUDE_SPEC} -c ${LEAF_PKG}_wrap.c
check

# Build the Tcl extension as a shared library
gcc -shared -o ${LEAF_SO} ${LEAF_PKG}_wrap.o ${CBLAS_A} ${BLAS_A}
check
echo "created library: ${LEAF_SO}"

# Make the Tcl package index
export LEAF_PKG LEAF_SO LEAF_TCL
${TCLSH} make-package.tcl > pkgIndex.tcl
check
echo "created package."

# Tell the user what they need to do to run this
echo "Set in environment: "
echo "TURBINE_USER_LIB=${PWD}"

exit 0
