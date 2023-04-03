#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

sudo apt update

./install/utilities.sh
./install/certbot.sh

# END global software install
###########################################################################################
# BEGIN optional software install

./install/nginx.sh
./install/php.sh
./install/composer.sh
./install/redis.sh

# END optional software install
###########################################################################################
# BEGIN wrap up

# best to do last since it changes the shell
./install/oh-my-zsh.sh
