#!/bin/sh

#===================================================================================
# Ubuntu Utilities - ack
#===================================================================================

# setup
name="ack"
check="/usr/bin/ack-grep"

# Check if installed
if [ -e $check ]; then
    printf "\033[1;37m$name already installed.\n\n\033[0m"
    exit 0;
fi

# Install
printf "\033[1;33mInstalling $name...\033[0m\n"
sudo apt-get install ack-grep

# Wrap it up
printf "\n"
