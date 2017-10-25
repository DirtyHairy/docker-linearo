#!/bin/bash

DOCKER_IMAGE=linearo

COMMAND=`basename $0`

docker run -it --rm \
    -e DOCKER_UID=`id -u` -e DOCKER_GID=`id -g` \
    -v "`pwd`:/work" \
    $DOCKER_IMAGE "$COMMAND" "$@"
