#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/supervisor" ]; then
    echo ""
    info "Installing Supervisor."
    sudo apt install -y supervisor
    sudo service supervisor restart
    echo ""
fi
