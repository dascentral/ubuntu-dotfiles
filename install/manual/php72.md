# PHP 7.2

## Installation

```bash
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt install php7.2 php7.2-common php7.2-cli php7.2-fpm
sudo apt install php7.2-bcmath php7.2-curl php7.2-gd php7.2-imap php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-pgsql php7.2-readline php7.2-sqlite3 php7.2-zip
```

Note that the `mcrypt` extension was deprecated in PHP 7.1 and removed from PHP 7.2. OpenSSL is used instead.

## Uninstalling PHP 7.1

The following will uninstall PHP 7.1:

```bash
sudo apt purge php7.1-*
sudo apt purge php7.1
```

## Resources

* [Servers for Hackers](https://serversforhackers.com/c/lemp-nginx-php-laravel)
* [Upgrading to PHP 7.2](https://ayesh.me/Ubuntu-PHP-7.2)
