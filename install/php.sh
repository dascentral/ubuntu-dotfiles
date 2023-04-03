#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

sudo add-apt-repository ppa:ondrej/php
sudo apt update

./install/php82.sh
./install/php81.sh
./install/php80.sh
