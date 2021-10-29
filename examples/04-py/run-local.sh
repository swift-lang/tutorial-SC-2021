#!/bin/bash -eu

. ../../cfg/setup-local.sh

PROGRAM=add
stc     ${PROGRAM}.swift
turbine ${PROGRAM}.tcl
