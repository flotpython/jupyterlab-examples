#! /bin/bash

docker pull docker.io/library/ubuntu:latest

# use with --force in case it does not trigger while it should
OPTS=""
case "$1" in
  -f|--force)
     OPTS="--no-cache" ;;
esac


# build & tag & push all at the same time

docker buildx build $OPTS \
  -f python-nodejs.Dockerfile \
  -t dockerhub.pl.sophia.inria.fr/python-nodejs:latest \
  --push .
