#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Cleanup
#
# DESCRIPTION
# Cleanup following all of the installation things.
#
#===================================================================================

# Clean any potential conflicts
printf "\033[1mRemoving orphan packages.\033[0m\n"
apt-get autoremove

# Wrap it up
printf "\n"