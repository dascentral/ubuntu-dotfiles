#!/bin/sh

#===================================================================================
# Aliases
#===================================================================================

# Start it up
printf "\033[1;37mInstalling aliases.\033[0m"

# Global
cp ~/utils/aliases/aliases ~/.aliases

# Laravel
cat ~/utils/aliases/aliases-laravel >> ~/.aliases

# MySQL
cat ~/utils/aliases/aliases-mysql >> ~/.aliases

# PHP
cat ~/utils/aliases/aliases-php >> ~/.aliases

# Git
cat ~/utils/aliases/aliases-git >> ~/.aliases

# Jenkins
cat ~/utils/aliases/aliases-jenkins >> ~/.aliases

# Web Server
if [ -e "/etc/nginx" ]; then
    cat ~/utils/aliases/aliases-nginx >> ~/.aliases
elif [ -e "/etc/apache2" ]; then
    cat ~/utils/aliases/aliases-apache >> ~/.aliases
fi

# Custom Aliases
if [ -e "/home/${USER}/.aliases-custom" ]; then
    cat /home/${USER}/.aliases-custom >> ~/.aliases
fi

# Wrap it up
printf "\n\n"
