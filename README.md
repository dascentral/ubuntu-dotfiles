# Ubuntu Utils

## Introduction
A collection of scripts and utility files that may aid in the administration
of Ubuntu servers.

## Assumptions
The scripts within this repo rely upon a number of assumptions that are not
documented as well as I might like. If you setup your Ubuntu servers in a
consistent manner, these scripts may work very well for you. If not, I admit
they may not error as gracefully as they should.

While I would love for these scripts to be helpful to others, they exist
primarily to faciltiate my systems administration activities and address
only a very small sliver of the needs within the sysadmin/DevOps world.

## Installation
This is a fairly simple clone from GitHub. All scripts within this repo
assume the repo is cloned into the `~/utils` folder.

**Via HTTP**

```
git clone https://github.com/dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

**Via SSH**

```
git clone git@github.com:dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

## Updates
The installation script can be run multiple times to ensure that the latest from the repository
is available to the local server and that all software has been installed.

```
cd ~/utils
./install.sh
```

At this time, the install script relies on the use of `sudo` so while you could run that
daily, you should avoid running it on crontab unless you have `sudoers` setup properly.


## Uninstalling Software
Initially I thought I would create shell scrips to uninstall various software
packages from an Ubuntu server. I quickly realized that was probably a bad idea.
Instead, I have documented uninstall instructions within various markdown files
found within the `/uninstall` folder.
