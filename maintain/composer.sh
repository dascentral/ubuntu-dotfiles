#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ -e "/usr/local/bin/composer" ]; then
    info "Composer self-update"
    /usr/local/bin/composer self-update
    echo ""
fi
