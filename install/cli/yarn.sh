#!/bin/sh

#===================================================================================
# Ubuntu Utilities - yarn
#===================================================================================

# Install or Update Yarn
if [ ! -e "/usr/local/bin/yarn" ]; then
    printf "\033[1mInstalling yarn.\033[0m\n"
    npm install -g yarn
else
    printf "\033[1mUpdating yarn.\033[0m\n"
    yarn self-update
fi
    
# Wrap it up
printf "\n"