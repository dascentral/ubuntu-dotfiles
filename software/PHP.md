# PHP

## Introduction

PHP: Hypertext Preprocessor is a general-purpose programming language originally designed for web development. It was originally created by Rasmus Lerdorf in 1994; the PHP reference implementation is now produced by The PHP Group. [Wikipedia](https://en.wikipedia.org/wiki/PHP)

All notes below are for **PHP 7.2** running on **Ubuntu 18.04**.

## Installation

Initial installation is accomplished through execution of the following commands:

```bash
sudo apt update
sudo add-apt-repository universe
sudo apt install php-fpm php-mysql
```

**Source:** [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04)

## Legacy Content

Installation can be completed via the following commands:

```bash
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt install php7.2 php7.2-common php7.2-cli php7.2-fpm
sudo apt install php7.2-bcmath php7.2-curl php7.2-gd php7.2-imap php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-pgsql php7.2-readline php7.2-sqlite3 php7.2-xml php7.2-zip
```

Note that the `mcrypt` extension was deprecated in PHP 7.1 and removed from PHP 7.2. OpenSSL is used instead.

### Uninstalling PHP 7.2

The following will uninstall PHP 7.2:

```bash
sudo apt purge php7.2-*
sudo apt purge php7.2
```

## PHP 7.1

I gleaned installation instructions from [Servers for Hackers](https://serversforhackers.com/c/lemp-nginx-php-laravel). PHP 7.1 may still be relevant to you so I'll leave these commands here for now.

```bash
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt install php7.1 php7.1-common php7.1-cli php7.1-fpm
sudo apt-get install -y php7.1-fpm php7.1-cli php7.1-mcrypt php7.1-gd php7.1-mysql php7.1-pgsql php7.1-imap php-memcached php7.1-mbstring php7.1-xml php7.1-curl php7.1-bcmath php7.1-sqlite3 php7.1-xdebug php7.1-zip
sudo service php7.1-fpm restart
```

### Optional Packages

The following lines were commented out from my most recent script.

```bash
sudo apt-get install -y php7.1-common
sudo apt-get install -y php7.1-curl
sudo apt-get install -y php7.1-dev
sudo apt-get install -y php7.1-intl
sudo apt-get install -y php7.1-json
sudo apt-get install -y php7.1-ldap
sudo apt-get install -y php7.1-opcache
sudo apt-get install -y php7.1-phpdbg
sudo apt-get install -y php7.1-recode
sudo apt-get install -y php7.1-snmp
sudo apt-get install -y php7.1-tidy
sudo sed -i 's/\;cgi\.fix_pathinfo\=1/cgi\.fix_pathinfo\=0/g' /etc/php/7.1/fpm/php.ini
```

### Uninstalling PHP 7.1

The following will uninstall PHP 7.1:

```bash
sudo apt purge php7.1-*
sudo apt purge php7.1
```

## PHP 7.0

At this stage of the game, I'm focused exclusively on removing PHP 7.0. These commans will help you get there.

The following command will remove PHP 7.0 and its dependencies:

```bash
sudo apt-get remove --auto-remove php7.0
```

The following command will also purge config/data related to PHP 7.0:

```bash
sudo apt-get purge --auto-remove php7.0
```

You likely installed a number of packages along with PHP 7.0 proper. Those can be removed via the following:

```bash
sudo apt-get purge --auto-remove php7.0-*
```
