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
