#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Install Script - Ubuntu 14.04
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
# - You're running Ubuntu 14.04.
# - Repo was initially cloned into the ~/utils directory.
# - Script is executed as the ADMIN user with sudo privileges.
#
#===================================================================================

clear

# Let it breathe
printf "\n"

# Update Repository
./install/prep.sh

# Environment Setup
./install/aliases.sh
./install/bin.sh
./install/permissions.sh

# Software Installation
./install/sqlbackup.sh
./install/ack.sh
./install/nvm.sh
./install/composer.sh

# Cleanup
./cleanup.sh
