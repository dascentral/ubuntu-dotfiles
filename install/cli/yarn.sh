#!/bin/sh

#===================================================================================
# Ubuntu Utilities - yarn
#===================================================================================

# Install or Update Yarn
if [ ! -e "/usr/bin/yarn" ]; then
    printf "\033[1mInstalling yarn.\033[0m\n"
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get install yarn
else
    printf "\033[1mUpdating yarn.\033[0m\n"
    yarn self-update
fi
    
# Wrap it up
printf "\n"