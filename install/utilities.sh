#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/usr/bin/curl" ]; then
    echo ""
    info "Installing curl."
    sudo apt install -y curl
    echo ""
fi

if [ ! -e "/usr/bin/git" ]; then
    echo ""
    info "Installing Git."
    sudo apt install -y git
    echo ""
fi

if [ ! -e "/usr/bin/htop" ]; then
    echo ""
    info "Installing htop."
    sudo apt install -y htop
    echo ""
fi

if [ ! -e "/usr/bin/ncdu" ]; then
    echo ""
    info "Installing ncdu."
    sudo apt install -y ncdu
    echo ""
fi

if [ ! -e "/usr/bin/ag" ]; then
    echo ""
    info "Installing ag."
    sudo apt install -y silversearcher-ag
    echo ""
fi

if [ ! -e "/usr/bin/tmux" ]; then
    echo ""
    info "Installing tmux."
    sudo apt install -y tmux
    echo ""
fi

if [ ! -e "/usr/bin/unzip" ]; then
    echo ""
    info "Installing unzip."
    sudo apt install -y unzip
    echo ""
fi

if [ ! -e "/usr/bin/vim" ]; then
    echo ""
    info "Installing vim."
    sudo apt install -y vim
    echo ""
fi

if [ ! -e "/usr/bin/wget" ]; then
    echo ""
    info "Installing wget."
    sudo apt install -y wget
    echo ""
fi

if [ ! -e "/usr/bin/zip" ]; then
    echo ""
    info "Installing zip."
    sudo apt install -y zip
    echo ""
fi
