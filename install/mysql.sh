#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/mysql" ]; then
    echo ""
    echo -n "Install MySQL? (y/N) "
    read -r -n1 install
    echo ""
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing MySQL."
        sudo apt install -y mysql-server
    fi
fi
