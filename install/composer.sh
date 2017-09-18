#!/bin/sh

#===================================================================================
# Composer - https://getcomposer.org/download/
#===================================================================================

# setup
name="Composer"
check="/usr/local/bin/composer"

# Check if installed
if [ -e $check ]; then
    printf "\033[1;37m$name already installed.\n\n\033[0m"
    exit 0;
fi

# Install
printf "\033[1;33mInstalling $name...\033[0m\n"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
printf "\n\n"
