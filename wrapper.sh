#!/bin/bash

export PATH="/opt/gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi/bin/:$PATH"

COMMAND="$1"
shift

gosu $DOCKER_UID:$DOCKER_GID $COMMAND "$@"
