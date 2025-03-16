<h1 align="center" style="display: block; font-size: 2.5em; font-weight: bold; margin-block-start: 1em; margin-block-end: 1em;">
<a name="logo" ><img align="center" src="https://raw.githubusercontent.com/csiggydev/ansible-vagrant/refs/heads/main/docs/img/ansible-vagrant-logo.jpg" style="width:50%;height:50%"/></a>
  <br /><br /><strong>Ansible Playground</strong>
</h1>


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