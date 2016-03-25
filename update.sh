#!/bin/sh

#===================================================================================
# Ubuntu Utils Update Script - Ubuntu 14.04
#
# DESCRIPTION
# This script performs updates based upon changes in the utils repo.
#
# ACTIONS PERFORMED
# - Pulls latest content from master branch within Git
# - Copy aliases into place
# - Copy /bin scripts into /usr/local/bin
#
# ASSUMPTIONS
# - Repo was initially cloned into the ~/utils directory
# - Script is executed as the ADMIN user with sudo privileges
#
#===================================================================================

clear

# ensure we have the latest
printf "\033[1m1) Updating utils.\033[0m\n"
cd ~/utils
git pull

# Move aliases into place
printf "\n\033[1m2) Updating aliases.\033[0m\n"
cp ~/utils/aliases ~/.bash_aliases

# Install /usr/local/bin scripts
printf "\n\033[1m3) Copying scripts to /usr/local/bin.\033[0m\n"
sudo cp ~/utils/bin/* /usr/local/bin
sudo chown $USER:$USER /usr/local/bin/*

# This is a hack.
# For some reason, the Nginx conf files come down from Git with permissions
# set to 664. Let's clean that up so that they are 644.
chmod 644 ~/utils/nginx/*


printf "\n\033[32mComplete!\033[0m\n"