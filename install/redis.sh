#!/bin/sh

#===================================================================================
# Redis - https://redis.io/
#===================================================================================
# Installation instructions via...
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis
#===================================================================================

# setup
name="Redis"
check="/usr/local/bin/redis-cli"

# Check if installed
if [ -e $check ]; then
    printf "\033[1;33m$name already installed.\n\n\033[0m"
    exit 0;
fi

# Install
printf "\033[1;37mInstalling $name...\033[0m\n"
printf "Script incomplete\n";
exit 1;


# Wrap it up
printf "\n\n"
