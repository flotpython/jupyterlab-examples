FROM ubuntu:latest

RUN true \
&& apt-get update \
&& apt-get install -y python3 python3-pip python3-venv \
&& apt-get install -y nodejs npm \
&& apt-get install -y iproute2 \
&& rm -rf /var/lib/apt/lists/* \
&& true

# Explicitly set UID/GID to 1001 to match GitHub Runner
RUN groupadd -g 1001 build && \
    useradd -m -u 1001 -g 1001 -s /bin/bash build && \
    echo "build ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/build/project

RUN chown build:build /home/build

# 4. Switch to the non-root user
USER build
