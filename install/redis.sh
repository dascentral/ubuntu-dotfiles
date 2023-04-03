#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/redis" ]; then
    echo -n "Install Redis? (y/N) "
    read -r -n1 install
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing Redis."
        sudo apt install -y redis-server
        echo ""
    fi
fi
