#!/bin/sh

#===================================================================================
# PHP 7.1
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
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.1-fpm
sudo apt-get install -y php7.1-cli
sudo apt-get install -y php7.1-mcrypt
sudo apt-get install -y php7.1-gd
sudo apt-get install -y php7.1-mysql
sudo apt-get install -y php7.1-pgsql
sudo apt-get install -y php7.1-imap
sudo apt-get install -y php-memcached
sudo apt-get install -y php7.1-mbstring
sudo apt-get install -y php7.1-xml
sudo apt-get install -y php7.1-curl
sudo apt-get install -y php7.1-bcmath
sudo apt-get install -y php7.1-sqlite3
sudo apt-get install -y php7.1-xdebug
sudo apt-get install -y php7.1-zip
#sudo apt-get install -y php7.1-common
#sudo apt-get install -y php7.1-curl
#sudo apt-get install -y php7.1-dev
#sudo apt-get install -y php7.1-intl
#sudo apt-get install -y php7.1-json
#sudo apt-get install -y php7.1-ldap
#sudo apt-get install -y php7.1-opcache
#sudo apt-get install -y php7.1-phpdbg
#sudo apt-get install -y php7.1-recode
#sudo apt-get install -y php7.1-snmp
#sudo apt-get install -y php7.1-tidy
#sudo sed -i 's/\;cgi\.fix_pathinfo\=1/cgi\.fix_pathinfo\=0/g' /etc/php/7.1/fpm/php.ini
sudo service php7.1-fpm restart
printf "\n\n"
