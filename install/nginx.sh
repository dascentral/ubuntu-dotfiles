#!/bin/sh

if [ ! -e "/etc/nginx" ]; then
    printf "\n\033[1;33mNginx has not been installed. Aborting installation.\n\n\033[0m"
    exit 0;
fi

if [ ! -e "/etc/nginx/sites-available/default.original" ]; then
    printf "\033[1;37mInstalling Nginx config.\033[0m"
    cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
    cp ~/utils/resources/nginx/default /etc/nginx/sites-available
    sudo service nginx reload
    printf "\n\n"
fi
