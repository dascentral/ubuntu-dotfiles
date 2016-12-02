#!/bin/sh

#===================================================================================
# NVM Install Script - https://github.com/creationix/nvm/
#===================================================================================

# setup
name="NVM"
check="/home/$USER/.nvm"

# Check if installed
printf "\033[1mInstalling $name...\033[0m"
if [ -e $check ]; then
    printf "\033[1m already installed.\n\n\033[0m"
    exit 1;
fi
printf "\n"

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# The following lines SHOULD be added to ~/.bashrc
#export NVM_DIR="/home/administrator/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Wrap it up
printf "\n\n"