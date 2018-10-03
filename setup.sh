#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

setup_node() {
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  echo "$(tput setaf 2)====================== Setup Node =============================$(tput setaf 9)"
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  ansible-playbook  playbooks/setup_master_node.yml
}

install_ansible() {
  ansible_version=`sudo apt-cache policy ansible | grep --color -i Candidate | awk '{print $2}'`
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  echo "$(tput setaf 2)==== Installing and Upgrading Ansible to $ansible_version =====$(tput setaf 9)"
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  sudo apt-get update
  sudo apt-get install --upgrade ansible -y
}

if [ $# -eq 0 ]; then
  echo "Execute <./setup.sh -h> for more options."

else
  case $1 in
    install_ansible) install_ansible
    ;;
    setup_node) setup_node
    ;;
    *)
    echo "        ./$(basename $0) setup_node"
    echo "        ./$(basename $0) install_ansible"
    exit 1
    ;;
    esac
fi

