#! /bin/bash

docker pull docker.io/library/ubuntu:latest

docker build -f python-nodejs.Dockerfile -t python-nodejs:latest .
