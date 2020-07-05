#!/bin/sh

# install redis
if [ ! -e "/etc/redis" ]; then
    printf "\033[1;37mInstalling Redis.\n\033[0m"
    sudo apt install -y redis-server
fi
