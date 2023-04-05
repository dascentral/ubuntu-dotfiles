#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/usr/local/bin/composer" ]; then
    echo ""
    echo -n "Install composer? (y/N) "
    read -r -n1 install
    echo ""
    if [ "$install" = "y" ]; then
        info "Installing composer."
        curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
        sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
        echo ""
    fi
fi
