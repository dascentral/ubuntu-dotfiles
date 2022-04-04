#!/bin/bash

#===================================================================================
# Ubuntu Utilities - SSL Certificate Migration - Ubuntu 20.04
#===================================================================================
#
# DESCRIPTION
# Extracts SSL certificates issued by Let's Encrypt to this server.
#
# NOTES
# This script was written initially in Aug 2020 for an Ubuntu 20.04 server. Given
# the speed with which technology evolves a sanity check of the commands is
# warranted prior to each execution.
#
#===================================================================================

printf "\n"

printf "\n\033[1mMoving certificate files to \"/\"\033[0m\n"
sudo mv ~/certs.tar.gz /

printf "\n\033[1mExtracting certificate files\033[0m\n"
cd /
sudo tar -xvf certs.tar.gz

printf "\n\033[1mCleaning up\033[0m\n\n"
rm certs.tar.gz
