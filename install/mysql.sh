#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/mysql" ]; then
    echo ""
    info "Installing MySQL."
    sudo apt install -y mysql-server
    echo ""
fi
