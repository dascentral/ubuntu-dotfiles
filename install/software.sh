#!/bin/sh

if [ ! -e "/usr/bin/git" ]; then
    printf "\033[1;37mInstalling Git.\n\033[0m"
    sudo apt install -y git
fi

if [ ! -e "/usr/bin/ag" ]; then
    printf "\033[1;37mInstalling ag.\n\033[0m"
    sudo apt install -y silversearcher-ag
fi

if [ ! -e "/usr/bin/tmux" ]; then
    printf "\033[1;37mInstalling tmux.\n\033[0m"
    sudo apt install -y tmux
fi

if [ ! -e "/usr/bin/vim" ]; then
    printf "\033[1;37mInstalling vim.\n\033[0m"
    sudo apt install -y vim
fi

if [ ! -e "/usr/bin/curl" ]; then
    printf "\033[1;37mInstalling curl.\n\033[0m"
    sudo apt install -y curl
fi

if [ ! -e "/usr/bin/ncdu" ]; then
    printf "\033[1;37mInstalling ncdu.\n\033[0m"
    sudo apt install -y ncdu
fi

if [ ! -e "/usr/bin/wget" ]; then
    printf "\033[1;37mInstalling wget.\n\033[0m"
    sudo apt install -y wget
fi

if [ ! -e "/usr/bin/zip" ]; then
    printf "\033[1;37mInstalling zip.\n\033[0m"
    sudo apt install -y zip
fi

if [ ! -e "/usr/bin/unzip" ]; then
    printf "\033[1;37mInstalling unzip.\n\033[0m"
    sudo apt install -y unzip
fi

if [ ! -e "/usr/bin/htop" ]; then
    printf "\033[1;37mInstalling htop.\n\033[0m"
    sudo apt install -y htop
fi
