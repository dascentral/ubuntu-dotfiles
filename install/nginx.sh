#!/bin/sh

# install Nginx
if [ ! -e "/etc/nginx" ]; then
    printf "\033[1;37mInstalling Nginx.\n\033[0m"
    sudo apt install -y nginx
    sudo ufw allow 'Nginx Full'
fi

# configure Nginx
if [ ! -e "/etc/nginx/sites-available/default.original" ]; then
    printf "\033[1;37mBacking up default Nginx site.\n\033[0m"
    mkdir -p /var/www/html/server
    mv /var/www/html/index* /var/www/html/server
    cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
    printf "\n\n"
fi

# copy default site into place
cp ~/utils/resources/nginx/default /etc/nginx/sites-available
sudo service nginx reload
