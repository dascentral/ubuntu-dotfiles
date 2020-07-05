#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Install Script - Ubuntu 18.04
#===================================================================================
#
# DESCRIPTION
# Facilitates installation of various software packages for administering
# Ubuntu servers or virtual machines.
#
# ACTIONS PERFORMED
# - See comments below.
#
# ASSUMPTIONS
# - You're running Ubuntu 18.04.
# - Repo was initially cloned into the ~/utils directory.
# - Script is executed as the ADMIN user with sudo privileges.
#
#===================================================================================

clear

# Let it breathe
printf "\n"

# Update Repository
./install/prep.sh

# Install aliases
./install/aliases.sh

# Install Nginx
./install/nginx.sh

# Environment Setup
#./install/bin.sh
#./install/permissions.sh

# Cleanup
#./install/cleanup.sh
