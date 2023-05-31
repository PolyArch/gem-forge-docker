makefile_dir := $(dirname (abspath $(lastword $(MAKEFILE_LIST))))
globals_path := ${makefile_dir}/scripts/globals.sh

.PHONY: all
all: run

# Build image. Docker will incrementally build any updates to the Dockerfile.
.PHONY: build
build:
	.${makefile_dir}/scripts/build.sh

# Launch a container for this image.
.PHONY: launch
launch: build
	-.${makefile_dir}/scripts/launch.sh

# Relaunch a container if the image has been updated.
.PHONY: relaunch
relaunch: kill launch

# Run the container launched.
.PHONY: run
run: launch
	.${makefile_dir}/scripts/run.sh

# Kill and clean the container.
.PHONY: kill
kill:
	-.${makefile_dir}/scripts/kill.sh

# Kill the container and remove the image.
.PHONY: clean
clean: kill
	-.${makefile_dir}/scripts/clean.sh
