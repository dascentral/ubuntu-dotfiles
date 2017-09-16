#!/bin/sh

#===================================================================================
# MySQL
#===================================================================================
# Installation instructions via...
# https://serversforhackers.com/c/lemp-nginx-php-laravel
#===================================================================================

# Setup
name="PHP 7.1"
check="/var/run/php/php7.1-fpm.sock"

# Check if installed
if [ -e $check ]; then
    printf "\033[1;37m$name already installed.\n\n\033[0m"
    exit 0;
fi

# Install
printf "\033[1mInstalling $name...\033[0m\n"
sudo apt-get install -y mysql-server
sudo mysql_secure_installation
printf "\n\n"
