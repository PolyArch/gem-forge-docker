FROM ubuntu:20.04

ARG USER_ID
ARG GROUP_ID
ARG USER=gf

RUN groupadd -g ${GROUP_ID} ${USER} &&\
    useradd -l -u ${USER_ID} -g ${USER} ${USER} &&\
    usermod -aG sudo ${USER} &&\
    install -d -m 0755 -o ${USER} -g ${USER} /home/${USER} &&\
    apt update &&\
    DEBIAN_FRONTEND=noninteractive apt install -y \
    cmake \
    build-essential \
    autoconf \
    libtool \
    zlib1g \
    zlib1g-dev \
    python3 \
    python3-pip \
    python-is-python3 \
    scons \
    git \
    curl \
    wget \
    sudo \
    vim \
    bear \
    zsh &&\
    pip3 install six numpy sklearn metis

RUN echo ${USER}:${USER} | chpasswd

USER ${USER}

