#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP() {
    sudo apt install -y php php-fpm php-cli php-mysql
    sudo apt install -y php8.2-curl php8.2-gd php8.2-intl php8.2-ldap php8.2-mbstring php8.2-xml php8.2-zip
}

# END functions
###########################################################################################
# BEGIN script logic

if [ ! -e "/etc/php" ]; then
    echo -n "Install PHP? (y/N) "
    read -r -n1 install
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing PHP 8.2."
        installPHP
        echo ""
    fi
else
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
