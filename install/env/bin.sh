#!/bin/sh

#===================================================================================
# Ubuntu Utilities - /usr/local/bin
#===================================================================================

printf "\n\033[1mCopying scripts to /usr/local/bin.\033[0m\n"

# Install /usr/local/bin scripts
sudo chown -R $USER:$USER /usr/local/bin
sudo cp ~/utils/bin/* /usr/local/bin
sudo chown -R $USER:$USER /usr/local/bin

# Wrap it up
printf "\n"