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

# Give permission of /usr/local/bin to admin user
printf "\n\033[1m3) Updating ownership of /usr/local/bin.\033[0m\n"
sudo chown -R $USER:$USER /usr/local/bin

# Install /usr/local/bin scripts
printf "\n\033[1m4) Copying scripts to /usr/local/bin.\033[0m\n"
sudo cp ~/utils/bin/* /usr/local/bin
sudo chown $USER:$USER /usr/local/bin/*

# Install MySQL Backup Utility
printf "\n\033[1m4) Installing MySQL Backup Utility.\033[0m\n"
sudo mkdir -p /sqlbackup
sudo chown $USER:$USER /sqlbackup
sudo cp ~/utils/mysql/sqlbackup /sqlbackup
sudo cp ~/utils/mysql/mysql_backup /usr/local/bin
sudo chown $USER:$USER /usr/local/bin/mysql_backup


printf "\n\033[32mComplete!\033[0m\n"