# Installation Guide

This document describes the steps used to deploy the self-hosted Nextcloud personal cloud server on Debian.

---

## Database Setup (MariaDB)

Nextcloud reuqires a relational database to store metadata.

### Install MariaDB

sudo apt update

sudo apt install mariadb-server

Verify the service: sudo systemctl status mariadb

---

## Apache Web Server

### Install Apache

sudo apt install apache2

Verify the service: sudo systemctl status apache2

Test Locally: curl localhost

Apache runs under the 'www-data' user.

---

## PHP Installation

Nextcloud is PHP-based application and requires PHP along with several extensions.

### Install PHP and Required Modules

sudo apt install php php-cli php-fpm php-mysql
php-gd php-curl php-mbstring php-intl php-imagick
php-xml php-zip php-bcmath php-gmp

### Verify PHP Version

php -v

### Enable PHP in Apache

sudo a2enmod php8.4

sudo systemctl restart apache2

---

## PHP Configuration for Nextcloud

A custom PHP configuration file was created to optimize for Nextcloud.

File: [config/php-nextcloud.ini] (config/php-nextcloud.ini)

Settings Include:

- memory_limit = 512M
- upload_max_filesize = 2G
- post_max_size = 2G
- max_execution_time = 360

---

## Nextcloud Installation

### Download Nextcloud

cd /tmp

wget https://download.nextcloud.com/server/releases/latest.tar.bz2

tar -xjf latest.tar.bz2

### Move Nextcloud to Web Directory

sudo mv /tmp/nextcloud /var/www/

### Set Permissions

sudo chown -R www-data:www-data/var/www/nextcloud

sudo chmod -R 750 /var/www/nextcloud

---

## Apache Virtual Host Configuration

File: /etc/apache2/sites-available/nextcloud.conf

Configuration: [config/apache-nextcloud.conf] (config/apache-nextcloud.conf)

Enable the site:

sudo a2ensite nextcloud.conf

sudo a2dissite 000-default.conf

sudo a2enmod write

sudo systemctl restart apache2

## PHP Memory Cache (APCu)

To improve Nextcloud performance, APCu caching was configured.

APCu provides in-memory caching for PHP applications and reduces database queries during a normal operation.

### Installation

sudo apt install php-apcu

sudo systemctl restart apache2

### Nextcloud Configuration

File: /var/www/nextcloud/config/config.php

Configuration Added:

'memcache.local' => '\\OC\\Memcache\\APCu'

This enables APCu as the loca memory cache for the Nextcloud instance.

---

## Database Index Optimization

Nextcloud reports missing optional database indices that improve query performance.

The following command to be executed:

sudo -u www-data php /var/www/nextcloud/occ db:add-missing-indices

This operation updates the database to improve lookup performance.

---

## Mimetype Migration and System Repair

After installation, Nextcloud reports that mimetype migrations are available.

The repair option was executed using the Nextcloud-cli:

sudo -u www-data php /var/www/nextcloud/occ maintenance:repair --include-expensive

This command performs maintanence tasks including:

- Updating Database Schemas
- Reparing File Metadata
- Registering Background Jobs
- Clearing Caches

---

## Maintanence Window Configuration

Nextcloud recommends setting a maintanence window so heavy background jobs run during low usage hours.

File: /var/www/nextcloud/config/config.php

Configuration Added: 'maintanence_window_start' => 1

---

