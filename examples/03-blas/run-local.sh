#!/bin/bash -eu

. ../../cfg/setup-local.sh

export TURBINE_USER_LIB=${PWD}

PROGRAM=dot
stc     ${PROGRAM}.swift
turbine ${PROGRAM}.tcl
