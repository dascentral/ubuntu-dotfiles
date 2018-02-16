#!/bin/sh

#===================================================================================
# MySQL
#===================================================================================

# Setup
name="MySQL"
check="/usr/bin/mysql"

# Installation
if [ ! -e $check ]; then
    # Install
    printf "\033[1;33mInstalling $name...\033[0m\n"

    # If running Ubuntu 14.04
    wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
    sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
    sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5
    sudo apt-get update

    # Standard instructions
    sudo apt-get install -y mysql-server
    sudo mysql_secure_installation
    printf "\n\n"

    # To allow remote connections to MySQL, disable the "bind-address" line within
    # the appropriate configuration file within "/etc/mysql"
fi
