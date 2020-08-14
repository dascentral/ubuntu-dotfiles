# PHP

## Introduction

PHP: Hypertext Preprocessor is a general-purpose programming language originally designed for web development. It was originally created by Rasmus Lerdorf in 1994; the PHP reference implementation is now produced by The PHP Group. Source: [Wikipedia](https://en.wikipedia.org/wiki/PHP)

Installation notes are for **PHP 7.4** running on **Ubuntu 20.04**.

## Installation

Initial installation is accomplished through execution of the following commands:

```bash
sudo apt update
sudo apt install -y php-fpm php-mysql php7.4-zip php7.4-xml php7.4-mbstring
```

### Resources

* [How To Install PHP 7.4 on Ubuntu 18.04/19.04/16.04](https://computingforgeeks.com/how-to-install-php-on-ubuntu/)
* [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04)

## PHP-FPM Configuration

Following initial installation, PHP-FPM runs as the `www-data` user. I find that permissions are easier to manage when it runs as my main administrative user. If you wish to run this process as a different user, edit the `user` and `group` values within `/etc/php/7.4/fpm/pool.d/www.conf`.

```bash
; Unix user/group of processes
; Note: The user is mandatory. If the group is not set, the default user's group
;       will be used.
user = admin
group = admin
```

Following those changes, you will want to restart the PHP-FPM service:

```bash
sudo service php7.4-fpm restart
```

