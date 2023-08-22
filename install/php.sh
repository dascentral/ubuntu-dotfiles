#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/apt/sources.list.d/ondrej-ubuntu-php-jammy.list" ]; then
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update
fi

./install/php80.sh
./install/php81.sh
./install/php82.sh

# TODO: update sudoers.d
