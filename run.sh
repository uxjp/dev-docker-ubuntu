#!/bin/bash

NAME=github-ssh

./auth-doppler.sh
./build-image.sh $NAME

if [ "$(docker ps -aq -f name=$NAME)" ]; then
    echo "Container with the same name detected before this script run. Stopping and removing the container..."
    docker stop $NAME
    docker rm $NAME
fi

#TODO replace $NAME in the string below
doppler run -- bash -c 'docker run -it --name github-ssh github-ssh bash -c "mkdir -p ~/.ssh && echo \"$ID_RSA_PUB_GITHUB\" > ~/.ssh/id_rsa.pub  && echo \"$ID_RSA_GITHUB\" > ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub && chmod 600 ~/.ssh/id_rsa && ssh-keyscan github.com >> ~/.ssh/known_hosts && git config --global user.name $GITHUB_NAME && git config --global user.email $GITHUB_EMAIL && bash"'
