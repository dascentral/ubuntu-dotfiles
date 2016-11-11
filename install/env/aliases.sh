#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Aliases
#===================================================================================

printf "\n\033[1mUpdating aliases.\033[0m\n"

# Move aliases into place
cp ~/utils/aliases/aliases ~/.bash_aliases
if [ -e "/etc/apache2" ]; then
    cp ~/utils/aliases/aliases-apache ~/.bash_aliases
fi
if [ -e "/etc/nginx" ]; then
    cp ~/utils/aliases/aliases-nginx ~/.bash_aliases
fi

# Wrap it up
printf "\n"