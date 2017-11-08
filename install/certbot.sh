#!/bin/sh

#===================================================================================
# certbot Install Script - https://certbot.eff.org/
#===================================================================================

# setup
name="certbot"
check="/opt/certbot/certbot-auto"

# Check if installed
if [ -e $check ]; then
    exit 0;
fi

# Install
printf "\033[1;37mInstalling $name...\033[0m\n"

# Create Directory
sudo mkdir /opt/certbot
sudo chown $USER:$USER /opt/certbot

# Install certbot utility
wget https://dl.eff.org/certbot-auto -P /opt/certbot
chmod a+x /opt/certbot/certbot-auto

# Execute Setup
/opt/certbot/certbot-auto

# Wrap it up
printf "\n\n"
