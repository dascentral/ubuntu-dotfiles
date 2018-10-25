#!/bin/sh

#===================================================================================
# /usr/local/bin
#===================================================================================

printf "\033[1;37mCopying scripts to /usr/local/bin.\033[0m\n"

# Install /usr/local/bin scripts
sudo chown -R $USER:$USER /usr/local/bin
sudo cp ~/utils/resources/bin/* /usr/local/bin
sudo chown -R $USER:$USER /usr/local/bin

# Wrap it up
printf "\n"
