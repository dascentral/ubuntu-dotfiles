#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP() {
    sudo apt install -y php php-fpm php-cli php-mysql
    sudo apt install -y php8.1-curl php8.1-gd php8.1-intl php8.1-ldap php8.1-mbstring php8.1-xml php8.1-zip
}

if [ ! -e "/etc/php" ]; then
    info "Installing PHP 8.1."
    installPHP
    printf "\n"
else
    info "PHP 8.1 is already installed."
    echo -n "Reinstall? (y/N) "
    read -r -n1 reinstall
    printf "\n"
    if [ "$reinstall" = "y" ]; then
        printf "\n"
        installPHP
        printf "\n"
    fi
fi

if [ ! -e "/etc/php/8.0" ]; then
    info "Installing PHP 8.0."
    sudo apt install -y php8.0 php8.0-fpm php8.0-mysql
    sudo apt install -y php8.0-curl php8.0-intl php8.0-ldap php8.0-mbstring php8.0-xml php8.0-zip
    printf "\n"
fi

if [ ! -e "/etc/php/7.4" ]; then
    info "Installing PHP 7.4."
    sudo apt install -y php7.4 php7.4-fpm php7.4-mysql
    sudo apt install -y php7.4-curl php7.4-intl php7.4-ldap php7.4-mbstring php7.4-xml php7.4-zip
    printf "\n"
fi
