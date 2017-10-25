#!/bin/bash

DOCKER_IMAGE="cnspeckn/linearo-arm:7.1.1-2017.08-1"

COMMAND=`basename $0`

docker run -it --rm \
    -e DOCKER_UID=`id -u` -e DOCKER_GID=`id -g` \
    -v "`pwd`:/work" \
    $DOCKER_IMAGE "$COMMAND" "$@"
