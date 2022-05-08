#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

if [ ! -e "/usr/bin/certbot" ]; then
    info "Installing Certbot."
    sudo apt install software-properties-common
    sudo add-apt-repository universe
    sudo apt update
    sudo apt install -y certbot python3-certbot-nginx
    printf "\n"
fi

#https://certbot.eff.org/instructions?ws=nginx&os=ubuntubionic
#sudo apt install snapd
#sudo snap install core; sudo snap refresh core
#sudo apt-get remove certbot

#uninstalling certbot
#remove from crontab
#sudo rm -rf /opt/certbot/certbot-auto
#sudo rm -rf /opt/eff.org

#preparing new certbot
#sudo ln -s /snap/bin/certbot /usr/bin/certbot
