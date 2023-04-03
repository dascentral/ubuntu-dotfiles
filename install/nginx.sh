#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

# execute only if Nginx is not already installed
if [ ! -e "/etc/nginx" ]; then
    echo -n "Install Nginx? (y/N) "
    read -r -n1 install
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing Nginx."
        sudo apt install -y nginx
        sudo ufw allow 'Nginx Full'
    fi
fi

# END installation
###########################################################################################
# BEGIN configuration

# only configure if Nginx is installed
if [ -e "/etc/nginx" ]; then
    # update ownership of these locations
    sudo chown -R $USER:$USER /var/www/html
    sudo chown -R $USER:$USER /etc/nginx/sites-available
    sudo chown -R $USER:$USER /etc/nginx/sites-enabled

    # move default Nginx site into its own folder
    if [ ! -e "/var/www/html/server" ]; then
        printf "\033[1;37mMoving default Nginx site into '/var/www/html/server'.\n\033[0m"

        # copy default site to new location
        mkdir -p /var/www/html/server
        cp /var/www/html/index* /var/www/html/server

        # back up default Nginx config
        cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original

        # copy new config into place
        cp ${DOTFILES}/config/nginx/default /etc/nginx/sites-available

        # reload Nginx
        sudo service nginx reload

        # remove original default site files
        rm /var/www/html/index*

        echo ""
    fi
fi
