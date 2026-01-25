FROM ubuntu:latest

RUN true \
&& apt-get update \
&& apt-get install -y python3 python3-pip \
&& apt-get install -y nodejs npm \
&& true
