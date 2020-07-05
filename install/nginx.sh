#!/bin/sh

# install Nginx
if [ ! -e "/etc/nginx" ]; then
    printf "\033[1;37mConfiguring Nginx config.\n\033[0m"
    sudo -v
    sudo apt update
    sudo apt install -y nginx
    sudo ufw allow 'Nginx Full'
fi

# configure Nginx
if [ ! -e "/etc/nginx/sites-available/default.original" ]; then
    printf "\033[1;37mConfiguring Nginx config.\n\033[0m"
    sudo -v
    mkdir -p /var/www/html/server
    mv /var/www/html/index* /var/www/html/server
    cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
    cp ~/utils/resources/nginx/default /etc/nginx/sites-available
    sudo service nginx reload
    printf "\n\n"
fi
