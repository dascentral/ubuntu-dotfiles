# PHP

## Introduction

PHP: Hypertext Preprocessor is a general-purpose programming language originally designed for web development. It was originally created by Rasmus Lerdorf in 1994; the PHP reference implementation is now produced by The PHP Group. Source: [Wikipedia](https://en.wikipedia.org/wiki/PHP)

Installation notes are for **PHP 7.4** running on **Ubuntu 18.04**.

## Installation

Initial installation is accomplished through execution of the following commands:

```bash
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.4
sudo apt-get install php7.4-fpm
sudo apt-get install php-pear
```

### Resources

* [How To Install PHP 7.4 on Ubuntu 18.04/19.04/16.04](https://computingforgeeks.com/how-to-install-php-on-ubuntu/)
* [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04)

## Uninstall

The content below is somewhat legacy and deals with removing various version of PHP 7.x.

### PHP 7.2

The following will uninstall PHP 7.2:

```bash
sudo apt purge php7.2-*
sudo apt purge php7.2
```

### PHP 7.1

The following will uninstall PHP 7.1:

```bash
sudo apt purge php7.1-*
sudo apt purge php7.1
```

### PHP 7.0

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
