#!/usr/bin/env bash

source ${HOME}/.dotfiles/shell/.functions

info "Pulling latest from Git: ${DOTFILES}"
cd ${DOTFILES}
git reset HEAD --hard
git pull
printf "\n"

info "Updating package information."
sudo apt update
printf "\n"

# HACK ALERT
# Files seem to come down from Git with odd permissions. This code is my attempt to clean things up.
# all files get 644
#find ~/utils -type f -exec chmod 644 {} \;
# all directories get 775
#find ~/utils -type d -exec chmod 775 {} \;
# all shell scripts get 755
#find ~/utils -name '*.sh' -exec chmod 755 {} \;
