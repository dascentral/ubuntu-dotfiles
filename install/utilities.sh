#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/usr/bin/curl" ]; then
    info "Installing curl."
    sudo apt install -y curl
    print "\n"
fi

if [ ! -e "/usr/bin/git" ]; then
    info "Installing Git."
    sudo apt install -y git
    print "\n"
fi

if [ ! -e "/usr/bin/htop" ]; then
    info "Installing htop."
    sudo apt install -y htop
    print "\n"
fi

if [ ! -e "/usr/bin/ncdu" ]; then
    info "Installing ncdu."
    sudo apt install -y ncdu
    print "\n"
fi

if [ ! -e "/usr/bin/ag" ]; then
    info "Installing ag."
    sudo apt install -y silversearcher-ag
    print "\n"
fi

if [ ! -e "/usr/bin/tmux" ]; then
    info "Installing tmux."
    sudo apt install -y tmux
    print "\n"
fi

if [ ! -e "/usr/bin/unzip" ]; then
    info "Installing unzip."
    sudo apt install -y unzip
    print "\n"
fi

if [ ! -e "/usr/bin/vim" ]; then
    info "Installing vim."
    sudo apt install -y vim
    print "\n"
fi

if [ ! -e "/usr/bin/wget" ]; then
    info "Installing wget."
    sudo apt install -y wget
    print "\n"
fi

if [ ! -e "/usr/bin/zip" ]; then
    info "Installing zip."
    sudo apt install -y zip
    print "\n"
fi
