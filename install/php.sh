#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

installPHP82() {
    sudo apt install -y php php-fpm php-cli php-mysql
    sudo apt install -y php8.2-curl php8.2-gd php8.2-intl php8.2-ldap php8.2-mbstring php8.2-xml php8.2-zip
}

installPHP81() {
    sudo apt install -y php8.1 php8.1-fpm php8.1-cli php8.1-mysql
    sudo apt install -y php8.1-curl php8.1-gd php8.1-intl php8.1-ldap php8.1-mbstring php8.1-xml php8.1-zip
}

installPHP80() {
    sudo apt install -y php8.0 php8.0-fpm php8.0-cli php8.0-mysql
    sudo apt install -y php8.0-curl php8.0-gd php8.0-intl php8.0-ldap php8.0-mbstring php8.0-xml php8.0-zip
}

if [ ! -e "/etc/php" ]; then
    info "Installing PHP 8.2."
    installPHP82
    printf "\n"
else
    info "PHP 8.2 is already installed."
    echo -n "Reinstall? (y/N) "
    read -r -n1 reinstall
    printf "\n"
    if [ "$reinstall" = "y" ]; then
        printf "\n"
        installPHP82
        printf "\n"
    fi
fi

if [ ! -e "/etc/php/8.1" ]; then
    info "Installing PHP 8.1."
    installPHP81
    printf "\n"
fi

if [ ! -e "/etc/php/8.0" ]; then
    info "Installing PHP 8.0."
    installPHP80
    printf "\n"
fi
