#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

# execute only if not already installed
if [ ! -e "/etc/supervisor" ]; then
    echo ""
    info "Installing Supervisor."
    sudo apt install -y supervisor
    echo ""
fi
