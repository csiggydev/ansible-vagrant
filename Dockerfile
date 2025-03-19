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

# Accept SSH args
ARG SSH_PRIVATE_KEY
ARG SSH_PUBLIC_KEY

# Set up SSH key for root user (for key-based authentication)
RUN mkdir -p /root/.ssh && \
    echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa && \
    echo "$SSH_PUBLIC_KEY" > /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys && \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan -H github.com >> /root/.ssh/known_hosts

# SSH config
RUN sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config \
    && sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH
EXPOSE 22

# Set shell
SHELL ["/bin/bash", "-c"]

ENTRYPOINT service ssh start && tail -f /dev/null