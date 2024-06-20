#!/bin/bash
NAME=${1:-github-ssh}

docker build -t $NAME .
