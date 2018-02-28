#!/bin/sh

#===================================================================================
# WP-CLI - http://wp-cli.org/
#===================================================================================

# setup
name="WP-CLI"
check="/usr/local/bin/wp"

# Installation
if [ ! -e $check ]; then
    printf "\033[1;37mInstalling $name...\033[0m\n"
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    sudo mv wp-cli.phar /usr/local/bin/wp
    printf "\n\n"
fi
