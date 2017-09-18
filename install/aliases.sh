#!/bin/sh

#===================================================================================
# Aliases
#===================================================================================

# setup
name="aliases"

# Start it up
printf "\033[1;33mInstalling $name..."

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

# Wrap it up
printf " complete.\033[0m"
printf "\n\n"
