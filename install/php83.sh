#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP() {
    sudo apt install -y php8.3 php8.3-cli php8.3-{curl,gd,intl,ldap,mbstring,mysql,xml,zip}
    sudo apt install -y php8.3-fpm
    sudo a2enconf php8.3-fpm
}

# END functions
###########################################################################################
# BEGIN installation

if [ ! -e "/etc/php/8.3" ]; then
    echo ""
    info "Installing PHP 8.3."
    installPHP
    echo ""
fi

# END installation
###########################################################################################
# BEGIN configuration

filename="/etc/php/8.3/fpm/pool.d/www.conf"

search="user = www-data"
replace="user = ${USER}"
sudo sed -i "s/$search/$replace/" $filename

search="group = www-data"
replace="group = ${USER}"
sudo sed -i "s/$search/$replace/" $filename

sudo service php8.3-fpm restart
