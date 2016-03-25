# Ubuntu Utils

## Introduction
A collection of scripts and utility files that will aid in administration
of Ubuntu servers.

## Installation
This is a fairly simple clone from GitHub. All scripts within this repo
assume the repo is cloned into the `~/utils` folder.

**Via HTTP**

```
git clone https://github.com/dascentral/ubuntu-utils.git ~/utils
```

**Via SSH**

```
git clone git@github.com:dascentral/ubuntu-utils.git ~/utils
```

## Updates
This repository contains an update script that can be used to pull down
the latest from the repo and move items into the appropriate place.

```
cd ~/utils
./update.sh
```

The update script does rely on thee use of `sudo` so while you could run that
daily, you should avoid running it on crontab unless you have `sudoers`
setup properly.
