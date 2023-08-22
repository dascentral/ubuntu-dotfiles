#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/redis" ]; then
    echo ""
    info "Installing Redis."
    sudo apt install -y redis-server
    echo ""
fi
