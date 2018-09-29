# PHP 7.0

## Documentation

Not sure of the source of this material. It likely came from Servers for Hackers.

## Installation

```bash
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.0
sudo apt-get install -y php7.0-fpm
sudo apt-get install -y php7.0-cli
sudo apt-get install -y php7.0-common
sudo apt-get install -y php7.0-curl
sudo apt-get install -y php7.0-dev
sudo apt-get install -y php7.0-gd
sudo apt-get install -y php7.0-imap
sudo apt-get install -y php7.0-intl
sudo apt-get install -y php7.0-json
sudo apt-get install -y php7.0-ldap
sudo apt-get install -y php7.0-mysql
sudo apt-get install -y php7.0-mcrypt
sudo apt-get install -y php7.0-mbstring
sudo apt-get install -y php7.0-opcache
sudo apt-get install -y php7.0-phpdbg
sudo apt-get install -y php7.0-recode
sudo apt-get install -y php7.0-snmp
sudo apt-get install -y php7.0-tidy
sudo apt-get install -y php7.0-zip
sudo apt-get install -y php7.0-xml
sudo sed -i 's/\;cgi\.fix_pathinfo\=1/cgi\.fix_pathinfo\=0/g' /etc/php/7.0/fpm/php.ini
sudo service php7.0-fpm restart
```

## Uninstall

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
