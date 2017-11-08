#!/bin/sh

#===================================================================================
# Aliases
#===================================================================================

# Start it up
printf "\033[1;37mInstalling aliases.\033[0m"

# Global
cp ~/utils/aliases/aliases ~/.bash_aliases

# Laravel
cat ~/utils/aliases/aliases-laravel >> ~/.bash_aliases

# MySQL
cat ~/utils/aliases/aliases-mysql >> ~/.bash_aliases

# PHP
cat ~/utils/aliases/aliases-php >> ~/.bash_aliases

# Apache
if [ -e "/etc/apache2" ]; then
    cat ~/utils/aliases/aliases-apache >> ~/.bash_aliases
fi

# Nginx
if [ -e "/etc/nginx" ]; then
    cat ~/utils/aliases/aliases-nginx >> ~/.bash_aliases
fi

# Custom Aliases
if [ -e "/home/${USER}/.aliases-custom" ]; then
    cat /home/${USER}/.aliases-custom >> ~/.bash_aliases
fi

# Wrap it up
printf "\n\n"
