#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

info "Upgrading software."
sudo apt -y upgrade
printf "\n"

info "Removing orphan packages."
sudo apt autoremove -y
printf "\n"
