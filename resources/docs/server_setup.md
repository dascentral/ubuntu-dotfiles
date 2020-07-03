# Ubuntu Server Setup

## Introduction

I feel the industry should be moving towards serverless architectures wherever possible. Developers should be free to spend their time focused on making digital products and services that make the world a better place. They should NOT be spending time setting up, maintaining, or patching servers. We should leave that job to the SysAdmin and DevOps specialists of the world. I admire their skills and respect them greatly.

However, I do not yet live fully in the world of serverless. I still use and maintain servers. This document attempts to outline my most recent understanding of how to securely setup an **Ubuntu 20.04** server running the following software:

* PHP
* MySQL
* Nginx
* Redis

Note that I currently host servers at [DigitalOcean](https://www.digitalocean.com/). Setup below covers configuration of a new Droplet.

## Server Setup

In July 2020, I setup a new droplet at DigitalOcean and struggled at first to gain access. By default, new droplets have `PasswordAuthentication` set to `no` within the SSH config — `/etc/ssh/sshd_config`.

I do not recall being provided an initial password for the `root` user so I requested a root password reset and logged in via the web console after receiving it via email.

### Create an Administrative User

Once successfully logged in as the `root` user, create an administrative user for daily use and grant them administrative privileges:

```bash
adduser [username]
usermod -aG sudo [username]
```

### Firewall Setup

Ubuntu 20.04 servers can use the [UFW firewall](https://en.wikipedia.org/wiki/Uncomplicated_Firewall) to make sure only  connections to certain services are allowed. We can set up a basic firewall very easily using this application.

Let's first ensure the firewall allows SSH connections:

```bash
ufw allow OpenSSH
```

Let's not forget to turn on the firewall:

```bash
ufw enable
```

To check the status of the firewall, you can use the appropriately named "status" command:

```bash
ufw status
```

If running commands as the administrative user, you will like need to prefix those commands with `sudo`.

### Enable SSH Login

If password authentication is *enabled* on your machine, you can use `ssh-copy-id` to easily copy your public key to the new server:

```bash
ssh-copy-id [username]@[ip_address]
```

If password authentication is *disabled*, login via the web console, `su -` to your administrative user, and manually copy the contents of your public key into your `~/.ssh/authorized_keys` file. The following bevy of commands will hopefully get you to the right spot:

```bash
su - [username]
cd && mkdir ~/.ssh && chmod 700 ~/.ssh
cd ~/.ssh
echo "ssh-rsa EXAMPLEzaC1yc2E...GvaQ" >> ~/.ssh/authorized_keys
chmod 600 authorized_keys
```

### Disable root login

Following creation of our administrative account, we want to prevent accidental use of the `root` account by disabling its ability to login.

Edit `/etc/ssh/sshd_config` and set `PermitRootLogin` to `no`.

```bash
PermitRootLogin no
```

Following that change, restart the SSH service:

```bash
sudo service ssh restart
```

### Disable Password Authentication

Passwords are one of the least secure ways to grant access to a server. We want to force login via SSH keys by turning off `PasswordAuthentication` within the SSH config.

In the event that your server started with this setting `on` or if you turned it on to make copying over your SSH public key easier, let's make sure we turn it off.

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

## LNMP Setup

### Nginx Installation

Installation of the software is fairly straightforward:

```bash
sudo apt update
sudo apt install nginx
```

After installation, we'll need to make sure the firewall grants access to ports 80 and 443:

```bash
sudo ufw allow 'Nginx Full'
```

### MySQL Installation

Installation of this software is also fairly straightforward:

```bash
sudo apt update
sudo apt install mysql-server
```

We will want to run through the secure installation process to ensure we have locked things down:

```bash
sudo mysql_secure_installation
```

I do not install the "VALIDATE PASSWORD PLUGIN" since I use a password manager to always create strong, unique passwords for database credentials. However, I do recommend the following during setup:

* Remove the anonymous user
* Disallow root login remotely
* Remove the test database and access to it
* Reload privilege tables immediately

At the end of the installation process, you can test the login via the following:

```bash
sudo mysql
```

This will connect to the MySQL server as the administrative database user **root**, which is inferred by the use of `sudo` when running this command.

Note that the default authentication method for the administrative MySQL user is `unix_socket` instead of `password`. So even though we provided a password for the root user during the initial installation, we cannot login with that password because of this setting.

### PHP Installation

You guessed it. Installation of this software is fairly straightforward:

```bash
sudo apt update
sudo apt install php-fpm php-mysql
```

## Resources

DigitalOcean produces a great deal of great content on server administration:

* **Article:** April 2020 - [Initial Server Setup with Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)
* **Article:** April 2020 - [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04)
* [How To Secure Nginx with Let's Encrypt on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04)

