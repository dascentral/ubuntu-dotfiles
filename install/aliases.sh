#!/bin/sh

#===================================================================================
# Aliases
#===================================================================================

# Start it up
printf "\033[1;37mInstalling aliases.\033[0m"

# Global
cp ~/utils/shell/aliases/.aliases ~/.aliases

# Laravel
cat ~/utils/shell/aliases/.aliases-laravel >> ~/.aliases

# MySQL
cat ~/utils/shell/aliases/.aliases-mysql >> ~/.aliases

# PHP
cat ~/utils/shell/aliases/.aliases-php >> ~/.aliases

# Git
cat ~/utils/shell/aliases/.aliases-git >> ~/.aliases

# Jenkins
cat ~/utils/shell/aliases/.aliases-jenkins >> ~/.aliases

# Web Server
if [ -e "/etc/nginx" ]; then
    cat ~/utils/shell/aliases/.aliases-nginx >> ~/.aliases
elif [ -e "/etc/apache2" ]; then
    cat ~/utils/shell/aliases/.aliases-apache >> ~/.aliases
fi

# Custom Aliases
if [ -e "/home/${USER}/.aliases-custom" ]; then
    cat /home/${USER}/.aliases-custom >> ~/.aliases
fi

# Wrap it up
printf "\n\n"
