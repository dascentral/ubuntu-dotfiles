# WordPress

## Overview

Setting up and maintaining a WordPress installation across multiple environments can be a bit tricky. Below is what I currently believe to be best practice.

Primary content source, per usual, is [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-16-04).

## Setup

### Web Server Configurations

This repository contains a script entitled `wp-site` which facilitates creation of the directories and web server configurations necessary to host a WordPress-based site. Script usage is as follows:

```bash
wp-site [url]
```

Note that many of the commands below will slowly make their way into the `wp-site` script.

### Install WordPress Core

I feel strongly that the WordPress core should not be stored within any code repository since any code that you write should not modify said core. As a result, the WordPress core is installed via WP-CLI.

#### Nginx

```bash
wp core download --path=/usr/share/nginx/html/dev/URL
wp core download --path=/usr/share/nginx/html/stage/URL
wp core download --path=/usr/share/nginx/html/uat/URL
wp core download --path=/usr/share/nginx/html/prod/URL
```

#### Apache

```bash
wp core download --path=/www/html/dev/URL
wp core download --path=/www/html/stage/URL
wp core download --path=/www/html/uat/URL
wp core download --path=/www/html/prod/URL
```

### Configure Proper Permissions

Example commands for the production environment. The same would need to be run in DEV, Stage, and UAT.

```bash
sudo chown -R administrator:www-data /usr/share/nginx/html/prod/URL
sudo find /usr/share/nginx/html/prod/URL -type d -exec chmod g+s {} \;
sudo chmod g+w /usr/share/nginx/html/prod/URL/wp-content
sudo chmod -R g+w /usr/share/nginx/html/prod/URL/wp-content/themes
sudo chmod -R g+w /usr/share/nginx/html/prod/URL/wp-content/plugins
```

### Database Creation

Each environment will need its own MySQL database. Once logged into MySQL, execute the following commands:

```bash
CREATE DATABASE database_name CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE database_name_dev CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE database_name_stage CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE database_name_uat CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### Database Users

The commands here will give one administrative user access to each database.

```bash
USE mysql;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, REFERENCES, TRIGGER, LOCK TABLES ON `database_name`.* TO 'mysql_user'@'localhost' IDENTIFIED BY 'mysql_password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, REFERENCES, TRIGGER, LOCK TABLES ON `database_name_dev`.* TO 'mysql_user'@'localhost' IDENTIFIED BY 'mysql_password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, REFERENCES, TRIGGER, LOCK TABLES ON `database_name_stage`.* TO 'mysql_user'@'localhost' IDENTIFIED BY 'mysql_password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, REFERENCES, TRIGGER, LOCK TABLES ON `database_name_uat`.* TO 'mysql_user'@'localhost' IDENTIFIED BY 'mysql_password';
FLUSH PRIVILEGES;
```

### Data Import

At this moment in time, I'm assuming you have already done some development locally. You should export your local database and import it into the **production** database.

I will try to add a SQL command here to facilitate that export and import process but for now, Google is your friend.

### Update Database Configuration

WordPress still likes to keep fully qualified URLs within its application settings. Once you have imported the data, we will need to run a search and replace.

```bash
mysql --user=mysql_user --password=mysql_password --database=database_name -e "UPDATE wp_options SET option_value = 'URL' WHERE option_name IN ('siteurl', 'home')"
mysql --user=mysql_user --password=mysql_password --database=database_name -e "UPDATE wp_posts SET post_content=(REPLACE (post_content, 'OLD_URL','NEW_URL'))"
```

### Update WordPress Configuration

Shorhand version of final modifications to `wp-config.php`. I wouldn't keep that guy in a code repository either.

* Do the [salts](https://api.wordpress.org/secret-key/1.1/salt/)
* Add DB credentials
* define('FS_METHOD', 'direct');