#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

setup_node() {
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  echo "$(tput setaf 2)=============== Installing and Upgrading Ansible ==============$(tput setaf 9)"
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"

}

install_ansible() {
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  echo "$(tput setaf 2)=============== Installing and Upgrading Ansible ==============$(tput setaf 9)"
  echo "$(tput setaf 2)===============================================================$(tput setaf 9)"
  sudo apt-get update
  sudo apt-get install --upgrade ansible
}



if [ $# -eq 0 ]; then
  echo "Execute <./setup.sh -h> for more options."

else
  case $1 in
    install_ansible) install_ansible
    ;;
    version) version
    ;;
    *)
    echo "        ./$(basename $0) setup_node"
    echo "        ./$(basename $0) install_ansible"
    exit 1
    ;;
    esac
fi

