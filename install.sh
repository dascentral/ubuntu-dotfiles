#!/bin/sh

#===================================================================================
# Ubuntu Utils Install Script - Ubuntu 14.04
#
# DESCRIPTION
# This script performs installation of the ubuntu utils.
#
# ACTIONS PERFORMED
# - Pulls latest content from master branch within Git
# - Copy aliases into place
# - Gives permission of /usr/local/bin to the current user
# - Copy /bin scripts into /usr/local/bin
# - Installs MySQL Backup Utility
# - Installs ack
#
# ASSUMPTIONS
# - Repo was initially cloned into the ~/utils directory
# - Script is executed as the ADMIN user with sudo privileges
#
# Script may be run multiple times without issue.
#
#===================================================================================

clear

# ensure we have the latest
printf "\033[1m1) Updating utils.\033[0m\n"
cd ~/utils
git pull

# Move aliases into place
printf "\n\033[1m2) Updating aliases.\033[0m\n"
cp ~/utils/aliases/aliases ~/.bash_aliases
if [ -e "/etc/apache2" ]; then
    cp ~/utils/aliases/aliases-apache ~/.bash_aliases
fi
if [ -e "/etc/nginx" ]; then
    cp ~/utils/aliases/aliases-nginx ~/.bash_aliases
fi

# Give permission of /usr/local/bin to admin user
printf "\n\033[1m3) Updating ownership of /usr/local/bin.\033[0m\n"
sudo chown -R $USER:$USER /usr/local/bin

# Install /usr/local/bin scripts
printf "\n\033[1m4) Copying scripts to /usr/local/bin.\033[0m\n"
sudo cp ~/utils/bin/* /usr/local/bin
sudo chown $USER:$USER /usr/local/bin/*

# Install MySQL Backup Utility
printf "\n\033[1m4) Installing MySQL Backup Utility.\033[0m\n"
if [ ! -e "/sqlbackup" ]; then
    sudo mkdir -p /sqlbackup
fi
sudo chown $USER:$USER /sqlbackup
sudo cp ~/utils/mysql/sqlbackup /sqlbackup
if [ ! -e "/usr/local/bin/mysql_backup" ]; then
    sudo cp ~/utils/mysql/mysql_backup /usr/local/bin
    sudo chown $USER:$USER /usr/local/bin/mysql_backup
fi

printf "\n\033[32mComplete!\033[0m\n"

# Install ack
sudo apt-get install ack-grep
