#!/bin/sh

# install PHP
if [ ! -e "/etc/php" ]; then
    printf "\033[1;37mInstalling PHP.\n\033[0m"
    sudo apt install -y php-fpm php-mysql
fi
