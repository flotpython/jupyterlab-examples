#! /bin/bash

docker pull docker.io/library/ubuntu:latest

# use with --force in case it does not trigger while it should
OPTS=""
case "$1" in
  -f|--force)
     OPTS="--no-cache" ;;
esac


# build & tag & push all at the same time

function build-python-nodejs {
  docker buildx build $OPTS \
    -f python-nodejs.Dockerfile \
    -t dockerhub.pl.sophia.inria.fr/python-nodejs:latest \
    --push .
}

function build-python-nodejs-rust {
  docker buildx build $OPTS \
    -f python-nodejs-rust.Dockerfile \
    -t dockerhub.pl.sophia.inria.fr/python-nodejs-rust:latest \
    --push .
}

build-python-nodejs && build-python-nodejs-rust
