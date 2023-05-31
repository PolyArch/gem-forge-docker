#!/bin/bash

source $(dirname -- $0)/globals.sh

docker image build \
  --network=host \
  --build-arg USER=$(id -u -n) \
  --build-arg USER_ID=$(id -u) \
  --build-arg GROUP_ID=$(id -g) \
  --build-arg HOME_DIR=$HOME \
  -t $IMAGE_NAME .
