#!/bin/bash

source $(dirname -- $0)/globals.sh

docker rmi $IMAGE_NAME
