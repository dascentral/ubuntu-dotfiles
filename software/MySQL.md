# MySQL

## Introduction

MySQL is an open-source relational database management system. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language. [Wikipedia](https://en.wikipedia.org/wiki/MySQL)

## Installation

Initial installation is relatively straightforward. Simply execute the following:

```bash
sudo apt update
sudo apt install mysql-server
```

Source: [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04)


### Secure the installation

Out of the box, the MySQL installation is sufficiently secure for production use. There is a separate process that can be run to harden the install.

```bash
sudo mysql_secure_installation
```

I do not currently enable the "VALIDATE PASSWORD PLUGIN."

## Configuration

To allow remote connections to MySQL, disable the "bind-address" line within the appropriate configuration file.

For versions of MySQL prior to 5.7, see `/etc/mysql/my.cnf`.

For MySQL 5.7, see `/etc/mysql/mysql.conf.d/mysqld.cnf`.

## Resetting the root password

We've all needed this at some point or another, right? First, we need to stop the MySQL service:

```bash
sudo /etc/init.d/mysql stop
```

Then we need to start MySQL without a password:

```bash
sudo mysqld_safe --skip-grant-tables &
```

If you receive an error message saying that the directory for "UNIX socket file don't exists", then you need to manually create that folder and assign the appropriate permissions.

```bash
sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld
```

Login as the `root` user:

```bash
mysql -u root
```

Reset the password:

```bash
USE mysql;
UPDATE user SET authentication_string=PASSWORD('password') WHERE user='root';
FLUSH PRIVILEGES;
quit
```

Stop and restart MySQL:

```bash
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
```

## Uninstalling MySQL 5.5

Backup all data before running the following commands.

### Stop the Service

```bash
sudo service mysql stop
sudo killall -KILL mysql mysqld_safe mysqld
```

### Purge Packages

Various websites list various packages when suggesting how to uninstall
MySQL. Check which packages you have installed via the following command:

```bash
apt list --installed
```

For my most recent uninstall attempt, I used the following:

```bash
sudo apt-get -y purge mysql-client-5.5 mysql-client-core-5.5 mysql-common
sudo apt-get -y purge mysql-server mysql-server-5.5 mysql-server-core-5.5
sudo apt-get -y autoremove --purge
sudo apt-get autoclean
```

### Remove MySQL User/Group

```bash
sudo deluser --remove-home mysql
sudo delgroup mysql
```

### Remove MySQL Files

```bash
sudo rm -rf /etc/apparmor.d/abstractions/mysql
sudo rm -rf /etc/apparmor.d/cache/usr.sbin.mysqld
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql
sudo rm -rf /var/log/mysql*
sudo rm -rf /var/log/upstart/mysql.log*
sudo rm -rf /var/run/mysqld
sudo updatedb
```

### Reboot

```bash
sudo reboot
```
