# PHP 7.1

## Documentation
Source: [Servers for Hackers](https://serversforhackers.com/c/lemp-nginx-php-laravel)


## Installation

```
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.1-fpm
sudo apt-get install -y php7.1-cli
sudo apt-get install -y php7.1-mcrypt
sudo apt-get install -y php7.1-gd
sudo apt-get install -y php7.1-mysql
sudo apt-get install -y php7.1-pgsql
sudo apt-get install -y php7.1-imap
sudo apt-get install -y php-memcached
sudo apt-get install -y php7.1-mbstring
sudo apt-get install -y php7.1-xml
sudo apt-get install -y php7.1-curl
sudo apt-get install -y php7.1-bcmath
sudo apt-get install -y php7.1-sqlite3
sudo apt-get install -y php7.1-xdebug
sudo apt-get install -y php7.1-zip
sudo service php7.1-fpm restart
```

## Optional

The following lines were commented out from my most recent script.

```
#sudo apt-get install -y php7.1-common
#sudo apt-get install -y php7.1-curl
#sudo apt-get install -y php7.1-dev
#sudo apt-get install -y php7.1-intl
#sudo apt-get install -y php7.1-json
#sudo apt-get install -y php7.1-ldap
#sudo apt-get install -y php7.1-opcache
#sudo apt-get install -y php7.1-phpdbg
#sudo apt-get install -y php7.1-recode
#sudo apt-get install -y php7.1-snmp
#sudo apt-get install -y php7.1-tidy
#sudo sed -i 's/\;cgi\.fix_pathinfo\=1/cgi\.fix_pathinfo\=0/g' /etc/php/7.1/fpm/php.ini
```
