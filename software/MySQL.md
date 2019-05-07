# MySQL

## Documentation

Honestly, I'm not sure where I found the instructions listed below. It's likely worth a little Googling to confirm that these are up-to-date.

## Installation

The following commands were identified for machines running Ubuntu 14.04.

```bash
wget http://dev.mysql.com/get/mysql-apt-config_0.6.0-1_all.deb
sudo dpkg -i mysql-apt-config_0.6.0-1_all.deb
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5
sudo apt-get update
```

And then the `apt-get install` portion of the installation process.

```bash
sudo apt-get install -y mysql-server
sudo mysql_secure_installation
```

## Configuration

To allow remote connections to MySQL, disable the "bind-address" line within the appropriate configuration file.

For versions of MySQL prior to 5.7, see `/etc/mysql/my.cnf`.

For MySQL 5.7, see `/etc/mysql/mysql.conf.d/mysqld.cnf`.

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
