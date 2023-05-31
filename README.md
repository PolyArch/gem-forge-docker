# Basic Dockerfile Image
A base Dockerfile configuration with helpers for building, running & cleaning.

# Configuration
To set the name of the image & container, along with other configurations,
modify `scripts/globals.sh`.

# Usage
The helper `Makefile` has many useful commands. The individual scripts can also
be called directly.

To build, launch, and run an image, call
```bash
make
```

## Basic Commands
To build or update the image, call
```bash
make build
```

To launch a container, call
```bash
make launch
```

To run the container, call
```bash
make run
```
*Note:* the `run` command will use the latest container, not latest image.

To kill and remove the container, call
```bash
make kill
```

To remove the image (and its container), call
```bash
make clean
```

## QOL Commands
Relaunching a container is also possible with
```bash
make relaunch
```
instead of calling `make kill & make launch`.
