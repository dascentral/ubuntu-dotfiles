#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

# TODO: see if we can check to see if this has already been added
sudo add-apt-repository ppa:ondrej/php
sudo apt update

./install/php80.sh
./install/php81.sh
./install/php82.sh

# TODO: update sudoers.d
