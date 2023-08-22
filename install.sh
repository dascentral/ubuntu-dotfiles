#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

sudo apt update

./install/utilities.sh
./install/certbot.sh
./install/supervisor.sh

# END global software install
###########################################################################################
# BEGIN optional software install

echo -n "Install Nginx, MySQL, PHP, & Redis? (y/N) "
read -r -n1 install
echo ""
if [ "$install" = "y" ]; then
    ./install/nginx.sh
    ./install/mysql.sh
    ./install/php.sh
    ./install/composer.sh
    ./install/redis.sh
fi

# END optional software install
###########################################################################################
# BEGIN wrap up

# best to do last since it changes the shell
./install/oh-my-zsh.sh
