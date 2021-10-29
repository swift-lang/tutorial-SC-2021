#!/bin/zsh -eu

A=( SIMULATIONS NP ND STEP_NUM STEP_PRINT_NUM DT MASS PRINTINFO
    SCALE_FACTOR SCALE_OFFSET SEED )

if [[ ${#*} != ${#A} ]]
then
  echo "usage: ${A}"
  exit 1
fi

# Scan argv
for a in ${A}
do
  eval "${a}='$1'"
  shift
done

. ../../cfg/setup-local.sh
. ./setup-md.sh

PROGRAM=run-mds
stc     ${PROGRAM}.swift
turbine -n 2 ${PROGRAM}.tcl          \
  --simulations=${SIMULATIONS}       \
  --np=${NP}                         \
  --nd=${ND}                         \
  --step_num=${STEP_NUM}             \
  --step_print_num=${STEP_PRINT_NUM} \
  --dt=${DT}                         \
  --mass=${MASS}                     \
  --printinfo=${PRINTINFO}           \
  --scale_factor=${SCALE_FACTOR}     \
  --scale_offset=${SCALE_OFFSET}     \
  --seed=${SEED}
