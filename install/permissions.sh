#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Various Permission Updates
#===================================================================================

printf "\033[1mUpdating permissions.\033[0m\n"

if [ -e "/usr/lib/node_modules" ]; then
    sudo chown -R $USER /usr/lib/node_modules
fi

if [ -e "/home/administrator/.npm" ]; then
    sudo chown -R $USER:$USER /home/administrator/.npm
fi

if [ -e "/usr/local/lib" ]; then
    sudo chown -R $USER /usr/local/lib
fi

# Wrap it up
printf "\n"