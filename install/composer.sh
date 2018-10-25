#!/bin/sh

#===================================================================================
# Composer - https://getcomposer.org/download/
#===================================================================================

# setup
name="Composer"
check="/usr/local/bin/composer"

# Installation
if [ ! -e $check ]; then
    printf "\033[1;37mInstalling $name...\033[0m\n"
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    printf "\n\n"
else
    composer self-update
    printf "\n\n"
fi
