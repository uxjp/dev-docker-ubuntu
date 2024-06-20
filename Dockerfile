FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    git \
    openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y neovim

WORKDIR /app
