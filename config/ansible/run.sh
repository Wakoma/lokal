#!/usr/bin/env bash

set -euo pipefail

export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_FORCE_COLOR=true
export ANSIBLE_VERBOSITY=0

export repo_owner=Wakoma
export repo_name=Lokal
export repo_branch=main

ROOT_SSH_USER=root
PRIMARY_SSH_USER=ubuntu

ansible-playbook \
  -e root_ssh_user=${ROOT_SSH_USER} \
  -e primary_ssh_user=${PRIMARY_SSH_USER} \
  -i config/ansible/hosts.yml \
  config/ansible/preprovision.playbook.yml

ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -i config/ansible/hosts.yml \
    config/ansible/base.playbook.yml

ansible-playbook \
    -e primary_ssh_user=${PRIMARY_SSH_USER} \
    -e repo_owner=${repo_owner} \
    -e repo_name=${repo_name} \
    -e repo_branch=${repo_branch} \
    -i config/ansible/hosts.yml \
    config/ansible/deploy-services.playbook.yml
