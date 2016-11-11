#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Install Script - Ubuntu 14.04
#
# DESCRIPTION
# Facilitates installation of various software packages for administering
# Ubuntu servers or virtual machines.
#
# NOTES
# - This script is safe to run multiple times.
#
# PARAMETERS
# - No parameters required.
#
# ACTIONS PERFORMED
# - See comments below. Easier to define the actions there.
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
./install/update.sh

# Environment Setup
./install/env/aliases.sh
./install/env/bin.sh

# MySQL Utilities
./install/mysql/sqlbackup.sh

# CLI Utilities
./install/cli/ack.sh
