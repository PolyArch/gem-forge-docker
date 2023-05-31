#!/bin/bash

source $(dirname -- $0)/globals.sh

# Kill and remove image.
docker kill $CONTAINER_NAME
docker rm $CONTAINER_NAME
