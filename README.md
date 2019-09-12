# Ubuntu Utils

## Introduction

A collection of scripts and utility files that aid in the setup and administration of Ubuntu servers.

## Resources

DigitalOcean produces a great deal of great content on server administration:

* [Initial Server Setup with Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04)
* [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04)
* [How To Secure Nginx with Let's Encrypt on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04)

## Assumptions

The scripts within this repo rely upon a number of assumptions that are not documented as well as I might like. If you setup your Ubuntu servers in a consistent manner, these scripts may work very well for you. If not, I admit they may not error as gracefully as they should.

While I would love for these scripts to be helpful to others, they exist primarily to faciltiate my systems administration activities and address only a very small sliver of the needs within the sysadmin/DevOps world.

## Installation

This is a fairly simple clone from GitHub. All scripts within this repo assume the repo is cloned into the `~/utils` folder.

### Via HTTP

```bash
git clone https://github.com/dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

### Via SSH

```bash
git clone git@github.com:dascentral/ubuntu-utils.git ~/utils && cd ~/utils && ./install.sh
```

## Updates

The installation script can be run multiple times to ensure that the latest from the repository
is available to the local server and that all software has been installed.

```bash
cd ~/utils
./install.sh
```

At this time, the install script relies on the use of `sudo` so while you could run that daily, you should avoid running it on crontab unless you have `sudoers` setup properly.


## Server Setup

Steps serve as a summary of items from DigitalOcean's [initial server setup](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04) article.

### Create administrative user

You will need to kick off the process as `root` however do NOT use this account on a regular basis. We are only logging in as `root` right now so that we can create an administrative user.

```bash
ssh root@[IP_ADDRESS]
```

Once you are in, issue the following commands to create your administrative user and to grant them administrative privileges:

```bash
adduser [USERNAME]
usermod -aG sudo [USERNAME]
```

### Enable SSH login for administrative user

If you have logged into the server as `root` via SSH, you can copy your SSH key to the new administrative user's account via `RSYNC`:

```bash
rsync --archive --chown=[USERNAME]:[USERNAME] ~/.ssh /home/[USERNAME]
```

If you have logged in to the server using a password, you will be able to copy your local SSH keys via `ssh-copy-id`. Logout of the server and issue the following command from your local machine:

```bash
ssh-copy-id [USERNAME]@[IP_ADDRESS]
```

Enter the administrative password and you should be all set.


### Disable root login

Following creation of our administrative account, we want to prevent accidental use of the `root` account by disabling its ability to login.

Edit `/etc/ssh/sshd_config` and set `PermitRootLogin` to no.

```bash
PermitRootLogin no
```

Following that change, restart the SSH service:

```bash
sudo service ssh restart
```

### Disable password authentication

Passwords are one of the least secure ways to grant access to a server. We want to force login via SSH keys by turning off `PasswordAuthentication` within the SSH config.

Edit `/etc/ssh/sshd_config` and set `PasswordAuthentication` to no.

```bash
PasswordAuthentication no
```

Before restarting the SSH service, confirm the following defaults are in place:

```bash
PubkeyAuthentication yes
ChallengeResponseAuthentication no
```

Following that change, restart the SSH service:

```bash
sudo service ssh restart
```

### Update packages

Depending upon the distribution used during initial installation of the operating system, you likely have a number of packages with updates pending. You can install those updates via the following:


```bash
sudo apt update
sudo apt upgrade
```

## Additional Information

I do not have a good place for this info just yet so it goes here for now.

### Ubuntu 14.04 - Managing DNS

DNS name servers are stored in the following file:

```
/etc/network/interfaces
```

File contents typically look something like this:

```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
address 10.3.XXX.XXX
netmask 255.255.255.0
gateway 10.3.XXX.XXX
dns-nameservers 10.3.XXX.XXX 10.15.XXX.XXX
```
