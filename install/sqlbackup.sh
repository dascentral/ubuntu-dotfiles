#!/bin/sh

#===================================================================================
# Ubuntu Utilities - MySQL Backup
#===================================================================================

printf "\033[1;37mInstalling MySQL Backup Utility.\033[0m\n"

# Create the /sqlbackup folder
if [ ! -e "/sqlbackup" ]; then
    sudo mkdir -p /sqlbackup
fi

# Fix permissions on the /sqlbackup folder
sudo chown $USER:$USER /sqlbackup

# Copy the backup utility script into place
sudo cp ~/utils/mysql/sqlbackup /sqlbackup

# Copy the crontab template script into place
if [ ! -e "/usr/local/bin/mysql_backup" ]; then
    sudo cp ~/utils/mysql/mysql_backup /usr/local/bin
    sudo chown $USER:$USER /usr/local/bin/mysql_backup
fi

# Wrap it up
printf "\n"
