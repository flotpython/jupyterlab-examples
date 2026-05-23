FROM ubuntu:latest


# Install Python, Node.js, and other necessary tools
RUN true \
&& apt-get update \
&& apt-get install -y python3 python3-pip python3-venv \
&& apt-get install -y nodejs npm \
&& apt-get install -y iproute2 sudo \
&& rm -rf /var/lib/apt/lists/* \
&& true


# Explicitly set UID/GID to 1001 to match GitHub Runner
# this means the github-actions user in the host must have this uid/gid as well
RUN groupadd -g 1001 github-actions && \
    useradd -m -u 1001 -g 1001 -s /bin/bash github-actions && \
    echo "github-actions ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


# Switch to the non-root user
RUN chown -R github-actions:github-actions /home/github-actions
WORKDIR /home/github-actions/project
USER github-actions
