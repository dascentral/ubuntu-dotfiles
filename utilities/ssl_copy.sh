#!/bin/bash

#===================================================================================
# Ubuntu Utilities - SSL Certificate Migration - Ubuntu 20.04
#===================================================================================
#
# DESCRIPTION
# Facilitates transfer of SSL certificates issued by Let's Encrypt to a new server.
#
# NOTES
# This script was written initially in Aug 2020 for an Ubuntu 20.04 server. Given
# the speed with which technology evolves a sanity check of the commands is
# warranted prior to each execution.
#
#===================================================================================

# Let it breathe
printf "\n"

# Collect information
printf "\033[1mWhat domain are we transferring?\033[0m\n"
read -p 'Domain: ' domain
if [ ! -e "/etc/letsencrypt/archive/${domain}" ]; then
    printf "\033[1;33mUnable to find certificates for ${domain}.\n\033[0m"
    exit 1;
fi

printf "\n\033[1mWhere are we transferring to?\033[0m\n"
read -p 'Destination Server: ' ipaddress
read -p 'Destination User: ' user


printf "\n\033[1mAdding certificate files to tarball\033[0m\n"
sudo tar -chvzf certs.tar.gz /etc/letsencrypt/archive/${domain} /etc/letsencrypt/renewal/${domain}.conf


printf "\n\033[1mCopying tarball to destination server\033[0m\n"


printf "\n\033[1mCleaning up\033[0m\n"
