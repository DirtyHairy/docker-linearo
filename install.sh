#!/bin/bash

SCRIPT=`basename $0`
TARGETS="\
    arm-eabi-addr2line \
    arm-eabi-ar \
    arm-eabi-as \
    arm-eabi-c++ \
    arm-eabi-c++filt \
    arm-eabi-cpp \
    arm-eabi-dwp \
    arm-eabi-elfedit \
    arm-eabi-g++ \
    arm-eabi-gcc \
    arm-eabi-gcc-7.1.1 \
    arm-eabi-gcc-ar \
    arm-eabi-gcc-nm \
    arm-eabi-gcc-ranlib \
    arm-eabi-gcov \
    arm-eabi-gcov-dump \
    arm-eabi-gcov-tool \
    arm-eabi-gdb \
    arm-eabi-gprof \
    arm-eabi-ld \
    arm-eabi-ld.bfd \
    arm-eabi-ld.gold \
    arm-eabi-nm \
    arm-eabi-objcopy \
    arm-eabi-objdump \
    arm-eabi-ranlib \
    arm-eabi-readelf \
    arm-eabi-size \
    arm-eabi-strings \
    arm-eabi-strip"

usage() {
    test -n "$1" && echo $1 && echo

    echo "usage: $SCRIPT <target-directory>"

    exit 1
}

test -n "$1" || usage
test -d "$1" || usage "target '$1' is not a directory"
test -f ./linearo_in_docker.sh || usage "this must be run from the directory with linearo_in_docker.sh"

for target in $TARGETS; do
    ln -s "`pwd`/linearo_in_docker.sh" "$1/$target"
done
