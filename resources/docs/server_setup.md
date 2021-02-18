# Ubuntu Server Setup

## Introduction

I feel the industry should be moving towards serverless architectures wherever possible. Developers should be free to spend their time focused on making digital products and services that make the world a better place. They should NOT be spending time setting up, maintaining, or patching servers. We should leave that job to the SysAdmin and DevOps specialists of the world. I admire their skills and respect them greatly.

However, I do not yet live fully in the world of serverless. I still use and maintain servers. This document attempts to outline my most recent understanding of how to securely setup an **Ubuntu 20.04** server running the following software:

* PHP
* MySQL
* Nginx
* Redis

I currently host servers at [DigitalOcean](https://www.digitalocean.com/). Setup instructions below were for a new droplet created in July 2020. I specified the `root` password during its creation.

## Server Setup

### Login as root

Our first step is to login as the `root` user. This method of access will only be available if `PasswordAuthentication` has been set to `yes`.

```bash
ssh root@[ip_address]
```

### Create an Administrative User

Once logged in, create a new user and grant them administrative privileges. We will use this account for day-to-day systems administration.

```bash
adduser [username]
usermod -aG sudo [username]
```

### Enable SSH Login

You can use `ssh-copy-id` from your local machine to easily copy your public key to the new server:

```bash
ssh-copy-id [username]@[ip_address]
```

You may also manually copy your public key into the `~/.ssh/authorized_keys` file within your administrative account. The following bevy of commands will hopefully get you to the right spot:

```bash
su - [username]
cd && mkdir ~/.ssh && chmod 700 ~/.ssh
cd ~/.ssh
echo "ssh-rsa EXAMPLEzaC1yc2E...GvaQ" >> ~/.ssh/authorized_keys
chmod 600 authorized_keys
```

### Secure SSH Connections

To ensure SSH access to the server is as secure as possible, we want to perform the following:

* Disable the root login
* Disable password authentication
* Ensure Pubkey Authentication is enabled
* Ensure Challenge Response Authentication is *disabled*

We will make the necessary modifications within `/etc/ssh/sshd_config` :

```bash
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication no
```

Following those changes, restart the SSH service:

```bash
sudo service ssh restart
```

### Update packages

Depending upon the distribution used during initial installation of the operating system, you likely have a number of packages with updates pending. You can install those updates via the following:


```bash
sudo apt update
sudo apt upgrade
```

### Firewall Setup

Ubuntu 20.04 servers can use the [UFW firewall](https://en.wikipedia.org/wiki/Uncomplicated_Firewall) to restrict only secure connections to certain services. We can set up a basic firewall very easily using this application.

Let's first ensure the firewall allows SSH connections:

```bash
sudo ufw allow OpenSSH
```

Let's not forget to turn on the firewall:

```bash
sudo ufw enable
```

To check the status of the firewall, you can use the appropriately named "status" command:

```bash
sudo ufw status
```

### Install Fail2ban

[Fail2Ban](https://en.wikipedia.org/wiki/Fail2ban) is an intrusion prevention software framework that protects computer servers from brute-force attacks. I highly recommend installing this software. It requires no real configuration.

```bash
sudo apt update
sudo apt install -y fail2ban
```

## LEMP Setup

### Nginx Installation

Installation of the software is fairly straightforward:

```bash
sudo apt update
sudo apt install -y nginx
```

After installation, we'll need to make sure the firewall grants access to ports 80 and 443:

```bash
sudo ufw allow 'Nginx Full'
```

### MySQL Installation

Installation of this software is also fairly straightforward:

```bash
sudo apt update
sudo apt install -y mysql-server
```

We will want to run through the secure installation process to ensure we have locked things down:

```bash
sudo mysql_secure_installation
```

I do not install the "VALIDATE PASSWORD PLUGIN" since I use a password manager to always create strong, unique passwords for database credentials. However, I do recommend the following during setup:

* **Yes** — Remove the anonymous user
* **Yes** — Disallow root login remotely
* **Yes** — Remove the test database and access to it
* **Yes** — Reload privilege tables immediately

At the end of the installation process, you can test the login via the following:

```bash
sudo mysql
```

This will connect to the MySQL server as the administrative database user **root**, which is inferred by the use of `sudo` when running this command.

Note that the default authentication method for the administrative MySQL user is `unix_socket` instead of `password`. So even though we provided a password for the root user during the initial installation, we cannot login with that password because of this setting.

**Enabling external access**

While I would not recommend this for production instances, you can enable external access to MySQL but you will need to make two changes.

First, enable MySQL traffice through the firewall:

```bash
sudo ufw allow mysql
```

Second, edit the `/etc/mysql/mysql.conf.d/mysql.conf.d` file and edit the following line:

```bash
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address		= 127.0.0.1
```

Ideally, you sent the bind address to your current IP address. You may also comment it out to allow connections from any IP address.

### PHP Installation

You guessed it. Installation of this software is fairly straightforward:

```bash
sudo apt update
sudo apt install -y php-fpm php-mysql php7.4-zip php7.4-xml php7.4-mbstring
```

## Optional Modifications

### Nginx

Out of the box, the `root` user owns many of the files and folders that you will likely need to modify with frequency. You may wish to change ownership of the following locations:

```bash
sudo chown -R [user]:[user] /var/www/html
sudo chown -R [user]:[user] /etc/nginx/sites-available
sudo chown -R [user]:[user] /etc/nginx/sites-enabled
```

## Additional Software

### Recommended

```bash
sudo apt install -y git tmux vim curl wget zip unzip htop
```

### Supervisor

[Supervisor](http://supervisord.org/) is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems. This [DigitalOcean article](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps) gives you the info that you'll need.

```bash
sudo apt install supervisor
service supervisor restart
```

## Sudoers

If you wish to allow your administrative user to issue `sudo` commands without entering their password, you can make additions to the `/etc/sudoers.d/` folder. The **safe** way to do this is via the `visudo` command. For example, the following will allow you to add a custom directive for `php-fpm`:

```bash
sudo visudo -f /etc/sudoers.d/php-fpm
```

You could then add the following command to allow execution without password:

```bash
[username] ALL=NOPASSWD: /usr/sbin/service php7.4-fpm reload
```

## Resources

* **Article:** February 2021 — [Setup a VM for Laravel 8 with Ubuntu 20.04, PHP8, Nginx, and MySQL](https://robertodev.medium.com/setup-a-vm-for-laravel-8-with-ubuntu-20-04-php8-nginx-and-mysql-4b709de88154)
* **Article:** April 2020 - [Initial Server Setup with Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)
* **Article:** April 2020 - [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04)
* **Screencasts:** [LEMP Stack with PHP-7.1](https://serversforhackers.com/c/lemp-nginx-php-laravel) - by Servers for Hackers. The PHP version is dated but the video still remains very relevant.

