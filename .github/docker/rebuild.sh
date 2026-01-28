#! /bin/bash

docker pull docker.io/library/ubuntu:latest

# build & tag & push all at the same time

docker buildx build \
  -f python-nodejs.Dockerfile \
  -t dockerhub.pl.sophia.inria.fr/python-nodejs:latest \
  --push .
