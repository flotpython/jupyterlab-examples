FROM ubuntu:latest

RUN true \
&& apt-get update \
&& apt-get install -y python3 python3-pip python3-venv \
&& apt-get install -y nodejs npm \
&& apt-get install -y iproute2 \
&& true

RUN useradd -m -s /bin/bash build && \
    echo "build ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/build/project
RUN chown build:build /home/build

# 4. Switch to the non-root user
USER build
