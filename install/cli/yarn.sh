#!/bin/sh

#===================================================================================
# Ubuntu Utilities - yarn
#===================================================================================

printf "\033[1mInstalling yarn.\033[0m\n"

# Install or Update Yarn
if [ -e "/usr/local/bin/yarn" ]; then
    npm install -g yarn
else
    yarn self-update
fi
    
# Wrap it up
printf "\n"