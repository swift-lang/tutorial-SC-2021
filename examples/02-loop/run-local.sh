#!/bin/sh -eu

. ../../cfg/setup-local.sh

PROGRAM=loop
stc     ${PROGRAM}.swift
turbine ${*} ${PROGRAM}.tcl
