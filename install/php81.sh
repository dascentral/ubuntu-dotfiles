#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP() {
    sudo apt install -y php8.1 php8.1-cli php8.1-curl php8.1-gd php8.1-intl php8.1-ldap php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip
    sudo apt install -y php8.1-fpm
}

# END functions
###########################################################################################
# BEGIN script logic

if [ ! -e "/etc/php/8.1" ]; then
    echo ""
    info "Installing PHP 8.1."
    installPHP
    echo ""
fi

# END installation
###########################################################################################
# BEGIN configuration

filename="/etc/php/8.1/fpm/pool.d/www.conf"

search="user = www-data"
replace="user = ${USER}"
sudo sed -i "s/$search/$replace/" $filename

search="group = www-data"
replace="group = ${USER}"
sudo sed -i "s/$search/$replace/" $filename

sudo service php8.1-fpm restart
