#!/bin/sh

#===================================================================================
# Nginx
#===================================================================================

# Setup
name="Nginx"
check="/usr/sbin/nginx"

# Check if installed
if [ -e $check ]; then
    printf "\033[1;37m$name already installed.\n\n\033[0m"
    exit 0;
fi

# Install
printf "\033[1mInstalling $name...\033[0m\n"
sudo apt-get install -y nginx
sudo chown -R $USER:$USER /usr/share/nginx/html
sudo chown -R $USER:$USER /etc/nginx/sites-available
sudo chown -R $USER:$USER /etc/nginx/sites-enabled
mkdir -p /usr/share/nginx/html/server
mkdir -p /usr/share/nginx/html/dev
mkdir -p /usr/share/nginx/html/stage
mkdir -p /usr/share/nginx/html/prod
mv /usr/share/nginx/html/50x.html /usr/share/nginx/html/server
mv /usr/share/nginx/html/index.html /usr/share/nginx/html/server
sudo sed -i 's/root \/usr\/share\/nginx\/html\;/root \/usr\/share\/nginx\/html\/server\;/g' /etc/nginx/sites-available/default
sudo service nginx reload
printf "\n\n"
