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
        vim \
        openssh-server && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config \
    && sed -i "PasswordAuthentication yes" /etc/ssh/sshd_config

# SSH
EXPOSE 22

# Set shell
SHELL ["/bin/bash", "-c"]

ENTRYPOINT service ssh start && tail -f /dev/null