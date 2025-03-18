# Jammy Image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        software-properties-common \
        python3 \
        curl \
        telnet \
        openssh-server && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# SSH
EXPOSE 22

# Set shell
SHELL ["/bin/bash", "-c"]

ENTRYPOINT service ssh start && bash