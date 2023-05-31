# Base image
FROM ubuntu:20.04

# User name, id, and group
# INFO: build.sh will make a copy based on the user that calls it.
ARG USER_ID
ARG GROUP_ID
ARG USER
ARG HOME_DIR

# Give sudo priveleges.
# Password is your username.
RUN groupadd -g ${GROUP_ID} ${USER} &&\
    useradd -l -u ${USER_ID} -g ${USER} ${USER} &&\
    usermod -aG sudo ${USER} &&\
    install -d -m 0755 -o ${USER} -g ${USER} ${HOME_DIR}
RUN echo ${USER}:${USER} | chpasswd

# Install any packages.
# NOTE: Remember to use `apt-get` not `apt`.
#       `apt` is for the end user and may not be backwards compatible.
RUN apt-get update && apt-get dist-upgrade -y

# INFO: I'd recommend separating the `apt-get install` commands since
#       if any changes are made, rebuilding the image will only run the commands
#       that have changed.
# INFO: Environmnet flag `DEBIAN_FRONTEND=noninteractive` is passed to avoid
#       setting up the time zone.
# INFO: `apt-get install -y` means all packages will install automatically with
#       yes.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    nano \
    vim \
    zsh \
    htop

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    build-essential \
    autoconf \
    libtool \
    zlib1g \
    zlib1g-dev \
    scons \
    bear

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    coinor-libcbc-dev \
    libclang-dev

# Install python related packages.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3 \
    python3-pip \
    python-is-python3

RUN pip3 install --upgrade pip &&\
    pip3 install six numpy sklearn metis

# Set default user.
USER ${USER}

# Set the working directory for any RUN/CMD/ENTRYPOINT/COPY/ADD commands
WORKDIR ${HOME_DIR}

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
