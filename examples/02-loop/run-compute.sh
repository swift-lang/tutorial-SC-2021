#!/bin/bash -eu

. ../../cfg/setup-compute.sh
SETTINGS=../../cfg/settings-compute.sh

PROCS=4
while getopts "n:" OPTION 
do
  echo $OPTION
  case ${OPTION} in
    n) PROCS=${OPTARG} ;;
    *) exit 1          ;;
  esac
done

PROGRAM=loop
stc ${PROGRAM}.swift
turbine-cobalt-run.zsh -n ${PROCS} -s ${SETTINGS} ${PROGRAM}.tcl
