# Uninstalling MySQL 5.5
Backup all data before running the following commands.

## Stop the Service
```
sudo service mysql stop
sudo killall -KILL mysql mysqld_safe mysqld
```

## Purge Packages
Various websites list various packages when suggesting how to uninstall
MySQL. Check which packages you have installed via the following command:
```
apt list --installed
```

For my most recent uninstall attempt, I used the following:
```
sudo apt-get -y purge mysql-client-5.5 mysql-client-core-5.5 mysql-common
sudo apt-get -y purge mysql-server mysql-server-5.5 mysql-server-core-5.5
sudo apt-get -y autoremove --purge
sudo apt-get autoclean
```

## Remove MySQL User/Group
```
sudo deluser --remove-home mysql
sudo delgroup mysql
```

## Remove MySQL Files
```
sudo rm -rf /etc/apparmor.d/abstractions/mysql
sudo rm -rf /etc/apparmor.d/cache/usr.sbin.mysqld
sudo rm -rf /etc/mysql
sudo rm -rf /var/lib/mysql
sudo rm -rf /var/log/mysql*
sudo rm -rf /var/log/upstart/mysql.log*
sudo rm -rf /var/run/mysqld
sudo updatedb
```

## Reboot
```
sudo reboot
```
