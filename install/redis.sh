#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/redis" ]; then
    info "Installing Redis."
    sudo apt install -y redis-server
    printf "\n"
fi
