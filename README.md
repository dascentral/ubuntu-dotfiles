# Ubuntu dotfiles

## Introduction

Ubuntu dotfiles is a series of customizations that help me personalize and maintain an Ubuntu web server.

I have also have a personal [dotfiles](https://github.com/dascentral/dotfiles) repository that speaks more to the philosophy of this type of repository and contains links to many other repositories that you may use for inspiration.

### Assumptions

The scripts within this repo rely upon a number of assumptions that are not as well documented as I might like. If you setup your Ubuntu servers in a manner similar to mine, these scripts may work very well for you. If not, I admit they may not error as gracefully as they should.

While I would love for these scripts to be helpful to others, they exist primarily to faciltiate my systems administration activities and address only a very small sliver of the needs within the systems administration or DevOps world.

## Installation

This is a fairly simple clone from GitHub. All scripts within this repo assume the repo is cloned into the `~/.dotfiles` folder.

### Via HTTP

```bash
git clone https://github.com/dascentral/ubuntu-utils.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh
```

### Via SSH

```bash
git clone git@github.com:dascentral/ubuntu-utils.git ~/.dotfiles && cd ~/.dotfiles && ./install.sh
```

## Updates

I have created a script simpy titled `dotfiles` that is idempotent and can be run regularly to ensure the system stays up-to-date. Since this command lives within the `~/.dotfiles/bin` folder, it can be executed from anywhere within the system.

```bash
dotfiles
```

# Legacy Content



## Update packages

Depending upon the distribution used during initial installation of the operating system, you likely have a number of packages with updates pending. You can install those updates via the following:

```bash
sudo apt update
sudo apt upgrade
```

## Random Nuggets

### Laravel Storage Folder

So, I haven't quite yet nailed the RSYNC command necessary to properly deploy Laravel's storage folder for a new website. These commands will create the necessary folder structure:

```bash
mkdir -p storage/app
mkdir -p storage/framework/cache
mkdir -p storage/framework/sessions
mkdir -p storage/framework/testing
mkdir -p storage/framework/views
mkdir -p storage/logs
```

