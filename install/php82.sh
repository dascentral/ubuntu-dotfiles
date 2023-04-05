#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP() {
    sudo apt install -y php8.2 php8.2-cli php8.2-curl php8.2-gd php8.2-intl php8.2-ldap php8.2-mbstring php8.2-mysql php8.2-xml php8.2-zip
    sudo apt install -y php8.2-fpm
    sudo a2enconf php8.2-fpm
}

# END functions
###########################################################################################
# BEGIN installation

if [ ! -e "/etc/php/8.2" ]; then
    echo ""
    echo -n "Install PHP 8.2? (y/N) "
    read -r -n1 install
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing PHP 8.2."
        installPHP
        echo ""
    fi
else
    echo ""
    info "PHP 8.2 is already installed."
    echo -n "Reinstall? (y/N) "
    read -r -n1 reinstall
    echo ""
    if [ "$reinstall" = "y" ]; then
        echo ""
        installPHP
        echo ""
    fi
fi

# END installation
###########################################################################################
# BEGIN configuration

filename="/etc/php/8.2/fpm/pool.d/www.conf"
search="user = www-data"
replace="user = ${USER}"
sed -i "s/$search/$replace/" $filename
