#!/bin/sh

#===================================================================================
# Ubuntu Utilities - Update
#
# DESCRIPTION
# Reset the repo and pull down the latest from Git.
#
#===================================================================================

# Clean any potential conflicts
printf "\033[1mResetting repository.\033[0m\n"
cd ~/utils
git reset HEAD --hard
printf "\n"

# Ensure we have the latest
printf "\033[1mPulling latest from GitHub.\033[0m\n"
git pull

# This is a hack.
# Files come down from Git with permissions that do not match what
# I consider to be "ideal." Let's clean them up.
find ~/utils -type f -exec chmod 644 {} \;
find ~/utils -type d -exec chmod 755 {} \;
chmod 755 ~/utils/install.sh
chmod -R 755 ~/utils/bin
chmod -R 755 ~/utils/install

# Update the packaging tool
printf "\033[Updating the Ubunutu Packaging Tool.\033[0m\n"
sudo apt-get update

# Wrap it up
printf "\n"