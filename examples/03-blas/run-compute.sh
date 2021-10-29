#!/bin/sh -eu

. ../../cfg/setup-compute.sh
SETTINGS=../../cfg/settings-compute.sh

export TURBINE_USER_LIB=${PWD}

PROGRAM=dot
stc ${PROGRAM}.swift
turbine-cobalt-run.zsh -n 2 -s ${SETTINGS} ${PROGRAM}.tcl

