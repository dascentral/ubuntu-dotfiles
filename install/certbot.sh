#!/bin/sh

if [ ! -e "/usr/bin/certbot" ]; then
    printf "\033[1;37mInstalling Certbot.\n\033[0m"
    sudo apt install software-properties-common
    sudo add-apt-repository universe
    sudo apt update
    sudo apt install -y certbot python3-certbot-nginx
fi
