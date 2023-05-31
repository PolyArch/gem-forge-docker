#!/bin/bash

source $(dirname -- $0)/globals.sh

docker exec -it $CONTAINER_NAME $DOCKER_SHELL
