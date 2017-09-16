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

# If running Ubuntu 14.04
wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5
sudo apt-get update

# Standard instructions
sudo apt-get install -y mysql-server
sudo mysql_secure_installation
printf "\n\n"
