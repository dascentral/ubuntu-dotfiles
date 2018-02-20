#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Cleanup
#===================================================================================
#
# DESCRIPTION
# Cleanup following all of the installation things.
#
#===================================================================================

# Clean any potential conflicts
printf "\033[1mRemoving orphan packages.\033[0m\n"
sudo apt-get autoremove -y

# Wrap it up
printf "\n"
