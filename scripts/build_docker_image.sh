#!/bin/bash

# Local use

# ssh key
if [ -z "$SSH_PRIVATE_KEY" ]; then
    echo "SSH keys not set! Please set SSH_PRIVATE_KEY env var."
    exit 1
fi

export SSH_PRIVATE_KEY="$(cat ~/.ssh/ansible_docker_dev_key)"
export SSH_PUBLIC_KEY="$(cat ~/.ssh/ansible_docker_dev_key.pub)"

# build image
docker build --build-arg SSH_PRIVATE_KEY=$SSH_PRIVATE_KEY --build-arg SSH_PUBLIC_KEY=$SSH_PUBLIC_KEY -t docker-ubuntu-test-img .