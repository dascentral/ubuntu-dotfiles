#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

./install/utilities.sh
./install/nginx.sh
./install/php.sh
./install/composer.sh
./install/redis.sh
./install/certbot.sh
./install/oh-my-zsh.sh
