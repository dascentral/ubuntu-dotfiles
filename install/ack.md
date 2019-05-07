#!/bin/sh

#===================================================================================
# ack
#===================================================================================

# setup
name="ack"
check="/usr/bin/ack-grep"

# Installation
if [ ! -e $check ]; then
    printf "\033[1;37mInstalling $name...\033[0m\n"
    sudo apt-get install ack-grep
    printf "\n\n"
fi
