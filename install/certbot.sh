#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/usr/bin/certbot" ]; then
    echo ""
    info "Installing Certbot."
    sudo apt install software-properties-common
    sudo add-apt-repository universe
    sudo apt update
    sudo apt install -y certbot python3-certbot-nginx
    echo ""
fi
