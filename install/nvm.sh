#!/bin/sh

#===================================================================================
# NVM Install Script - https://github.com/creationix/nvm/
#===================================================================================

# setup
name="NVM"
check="/home/$USER/.nvm"

# Check if installed
if [ -e $check ]; then
    printf "\033[1;37m$name already installed.\n\n\033[0m"
    exit 0;
fi

# Install
printf "\033[1;33mInstalling $name...\033[0m\n"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# The following lines SHOULD be added to ~/.bashrc automatically...
#export NVM_DIR="/home/administrator/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Wrap it up
printf "\n\n"
