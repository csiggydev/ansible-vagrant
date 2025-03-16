## Ansible Playground

### Build Status

[![Ansible CI Workflow](https://github.com/csiggydev/ansible-vagrant/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/csiggydev/ansible-vagrant/actions/workflows/ci.yml)

### Overview

Test ansible playbooks against VMs instantiated via Vagrant and Virtualbox

### Deployment Requirements

1. Virtualbox
2. Vagrant
3. Ansible
4. Python3

> [!NOTE]
> Vagrant depends on Virtualbox hypervisor to instantiate VMs

#### Vagrant Configuration

Vagrant instructions read from `Vagrantfile` will provision an Ubuntu-Linux (22.04.x) box and will bootstrap python3 and ansible dependencies via file `bootstrap`

Bootstrap instructions: `config.vm.provision "shell", path: "bootstrap"`

#### Ansible

> [!IMPORTANT]
> Set `ansible_python_interpreter` for each ansible host to avoid errors during playbook execution