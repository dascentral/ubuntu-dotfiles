#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

sudo apt update

./install/utilities.sh
./install/certbot.sh
./install/oh-my-zsh.sh

# END global software install
###########################################################################################
# BEGIN optional software install

./install/nginx.sh

echo -n "Install PHP & Composer? (y/N) "
read -r -n1 install
echo ""
if [ "$install" = "y" ]; then
    ./install/php.sh
    ./install/composer.sh
fi

echo -n "Install Redis? (y/N) "
read -r -n1 install
echo ""
if [ "$install" = "y" ]; then
    ./install/redis.sh
fi
