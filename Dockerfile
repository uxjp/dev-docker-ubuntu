FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    git \
    openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-17-jdk
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y neovim

RUN apt-get install -y curl unzip maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
