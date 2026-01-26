FROM ubuntu:latest

RUN true \
&& apt-get update \
&& apt-get install -y python3 python3-pip python3-venv \
&& apt-get install -y nodejs npm \
&& true
