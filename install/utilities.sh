#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/usr/bin/curl" ]; then
    info "Installing curl."
    sudo apt install -y curl
    echo ""
fi

if [ ! -e "/usr/bin/git" ]; then
    info "Installing Git."
    sudo apt install -y git
    echo ""
fi

if [ ! -e "/usr/bin/htop" ]; then
    info "Installing htop."
    sudo apt install -y htop
    echo ""
fi

if [ ! -e "/usr/bin/ncdu" ]; then
    info "Installing ncdu."
    sudo apt install -y ncdu
    echo ""
fi

if [ ! -e "/usr/bin/ag" ]; then
    info "Installing ag."
    sudo apt install -y silversearcher-ag
    echo ""
fi

if [ ! -e "/usr/bin/tmux" ]; then
    info "Installing tmux."
    sudo apt install -y tmux
    echo ""
fi

if [ ! -e "/usr/bin/unzip" ]; then
    info "Installing unzip."
    sudo apt install -y unzip
    echo ""
fi

if [ ! -e "/usr/bin/vim" ]; then
    info "Installing vim."
    sudo apt install -y vim
    echo ""
fi

if [ ! -e "/usr/bin/wget" ]; then
    info "Installing wget."
    sudo apt install -y wget
    echo ""
fi

if [ ! -e "/usr/bin/zip" ]; then
    info "Installing zip."
    sudo apt install -y zip
    echo ""
fi
