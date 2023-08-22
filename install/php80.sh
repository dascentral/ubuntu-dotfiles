#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP() {
    sudo apt install -y php8.0 php8.0-cli php8.0-curl php8.0-gd php8.0-intl php8.0-ldap php8.0-mbstring php8.0-mysql php8.0-xml php8.0-zip
    sudo apt install -y php8.0-fpm
}

# END functions
###########################################################################################
# BEGIN script logic

if [ ! -e "/etc/php/8.0" ]; then
    echo ""
    info "Installing PHP 8.0."
    installPHP
    echo ""
fi

# END installation
###########################################################################################
# BEGIN configuration

filename="/etc/php/8.0/fpm/pool.d/www.conf"

search="user = www-data"
replace="user = ${USER}"
sudo sed -i "s/$search/$replace/" $filename

search="group = www-data"
replace="group = ${USER}"
sudo sed -i "s/$search/$replace/" $filename

sudo service php8.0-fpm restart
