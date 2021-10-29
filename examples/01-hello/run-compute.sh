#!/bin/sh -eu

. ../../cfg/setup-compute.sh
SETTINGS=../../cfg/settings-compute.sh

PROGRAM=hello
stc ${PROGRAM}.swift
turbine-cobalt-run.zsh -n 2 -s ${SETTINGS} ${PROGRAM}.tcl

