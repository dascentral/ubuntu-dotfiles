# Ubuntu Utils

## Introduction
A collection of scripts and utility files that will aid in administration
of Ubuntu servers.

### Assumptions
The scripts within this repo rely upon a number of assumptions that are not
documented as well as I might like. If you setup your Ubuntu servers in a
consistent manner, these scripts may work very well for you. If not, I admit
they may not error as gracefully as they should.

While I would be pleased if these scripts help others in administration
of their servers, they primarily exist to faciltiate my systems
administration activities.

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
This repository contains an update script that can be used to pull down
the latest from the repo and move items into the appropriate place.

```
cd ~/utils
./update.sh
```

The update script relies on the use of `sudo` so while you could run that
daily, you should avoid running it on crontab unless you have `sudoers`
setup properly.
