FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    git \
    openssh-client

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y neovim
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app
