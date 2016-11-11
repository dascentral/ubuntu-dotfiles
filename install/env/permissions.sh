#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Various Permission Updates
#===================================================================================

printf "\033[1mUpdating permissions.\033[0m\n"

# /usr/lib/node_modules
if [ -e "/usr/lib/node_modules" ]; then
    sudo chown -R $USER /usr/lib/node_modules
fi

# Wrap it up
printf "\n"