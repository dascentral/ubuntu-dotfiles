#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/etc/nginx" ]; then
    info "Installing Nginx."
    sudo apt install -y nginx
    sudo ufw allow 'Nginx Full'
fi

# END installation
###########################################################################################
# BEGIN configuration

mkdir -p /var/www/html/server
mkdir -p /var/www/html/dev
mkdir -p /var/www/html/stage
mkdir -p /var/www/html/uat
mkdir -p /var/www/html/prod

# backup initial default configuration
if [ ! -e "/etc/nginx/sites-available/default.original" ]; then
    printf "\033[1;37mBacking up default Nginx site.\n\033[0m"
    cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
    mkdir -p /var/www/html/server
    mv /var/www/html/index* /var/www/html/server
    printf "\n\n"
fi

# copy default site into place
cp ${DOTFILES}/config/nginx/default /etc/nginx/sites-available
sudo service nginx reload
