#!/bin/sh

#===================================================================================
# Ubuntu Utilities - ack
#===================================================================================

# setup
name="ack"
check="/usr/bin/ack-grep"

# Check if installed
if [ -e $check ]; then
    exit 0;
fi

# Install
printf "\033[1;37mInstalling $name...\033[0m\n"
sudo apt-get install ack-grep

# Wrap it up
printf "\n"
