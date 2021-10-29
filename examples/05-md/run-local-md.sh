#!/bin/bash -eu

. ../../cfg/setup-local.sh
. setup-md.sh

PROGRAM=run-md
stc     ${PROGRAM}.swift
turbine ${PROGRAM}.tcl 
