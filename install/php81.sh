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
    echo -n "Install PHP 8.1? (y/N) "
    read -r -n1 install
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing PHP 8.1."
        installPHP
        echo ""
    fi
else
    echo ""
    info "PHP 8.1 is already installed."
    echo -n "Reinstall? (y/N) "
    read -r -n1 reinstall
    echo ""
    if [ "$reinstall" = "y" ]; then
        echo ""
        installPHP
        echo ""
    fi
fi
