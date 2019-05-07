# MySQL

## Introduction

MySQL is an open-source relational database management system. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language. [Wikipedia](https://en.wikipedia.org/wiki/MySQL)

All notes below are for **MySQL 5.7** running on **Ubuntu 18.04**.

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

Following completion of that process, you will now be able to login via the `root` user by simply executing the following:

```bash
sudo mysql
```

### Starting, Stopping, and Restarting

```bash
sudo service mysql start
sudo service mysql stop
sudo service mysql restart
```

## Allowing remote connections

To allow remote connections to MySQL, disable the "bind-address" line within the apporpriate MySQL configuration file. Typically, that is this file:

```bash
/etc/mysql/mysql.conf.d/mysqld.cnf
```

## Administrative Users

Would you like to create an administrative user in addition to the `root` user? Would you like them to be able to access the server remotely? The following commands will help you create that user.

```bash
USE mysql;
GRANT ALL PRIVILEGES ON *.* TO '[user]'@'localhost' IDENTIFIED BY '[pass]' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '[user]'@'%' IDENTIFIED BY '[pass]' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

The following will update a password for an existing user:

```bash
USE mysql;
ALTER USER '[user]'@'localhost' IDENTIFIED BY '[pass]';
FLUSH PRIVILEGES;
```

## Uninstall

### Purge

If things just aren't going well and you're fine blowing away your entire installation, **including all of you data**, you can purge the software from your server:

```bash
sudo service mysql stop
sudo killall -KILL mysql mysqld_safe mysqld
sudo apt-get --purge remove mysql-server
```

## Uninstalling MySQL 5.5

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
