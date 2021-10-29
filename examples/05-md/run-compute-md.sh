#!/bin/bash -eu

. ../../cfg/setup-compute.sh
. setup-md.sh
SETTINGS=../../cfg/settings-compute.sh

PROGRAM=run-md
stc     ${PROGRAM}.swift
turbine-cobalt-run.zsh -n 4 -s ${SETTINGS} ${PROGRAM}.tcl
