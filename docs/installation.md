## Database Setup (MariaDB)

Nextcloud requires a relational database to store metadata such as users,file indexes,sharing permissions, and configuration data.

MariaDB was chosen due to its strong compatibility with MySQL, and fast performance for web applications.

## Install MariaDB

*sudo apt update*
*sudo apt install mariadb-server*


## Apache web server

Install Apache: *sudo apt install apache2*

Verify Service: *sudo systemctl status apache2*

Test Locally: *curl localhost*

Apache runs as the 'www-data' user and will be used to the serve the Nextcloud web interface.

## PHP Installation

Nextcloud is a PHP-based application and requires PHP along with several extensions.

### Install PHP and Required Modules

*sudo apt install php php-cli php-fpm php-mysql*

*php-gd php-curl php-mbstring php-intl php-imagick*

*php-xml php-zip php-bcmath php-gmp*

### Verify PHP Version

php -v

### Enable PHP

*sudo a2enmod php8.4*

*sudo systemctl restart apache2*

### PHP Configuration for Nextcloud

Custom PHP configuration file:

*config/php-nextcloud.ini*

Settings Include:

- memory_limit= 512M
- upload_file_maxsize= 10G
- post_max_size= 10g
- max_execution_time= 360

## Nextcloud Installation

Nextcloud was delpoyed as the self-hosted cloud platform on the Debian Server.

### Download Nextcloud

*cd /tmp*

*wget https://download.nextcloud.com/server/releases/latest.tar.bz2*

*tar -xjf latest.tar.bz2*

### Move Nextcloud to Web Directory

*sudo mv /tmp/nextcloud /var/www/*

### Set Permissions

Nextcloud must be owned by the Apache user.

*sudo chown -R www-data:www-data/var/www/nextcloud*

*sudo chmod -R 750 /var/www/nextcloud*

### Aapache Virtual Host Configuration

File:

*/etc/apache2/sites-available/nextcloud.conf*

Configuration:

<VirtualHost *:80>
    DocumentRoot /var/www/nextcloud

<Directory /var/www/nextcloud/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews
</Directory>

ErrorLog ${APACHE_LOG_DIR}/nextcloud_error.log
CustomLog ${APACHE_LOG_DIR}/nextcloud_access.log combined
<VirtualHost>

Enable the site:

*sudo a2ensite nextcloud.conf*

*sudo a2dissite 000-default.conf*

*sudo a2mod rewrite*

*sudo systemctl restart apache2*

## PHP Memory Cache (APCu)

To improve Nextcloud performance, APCu caching was confugured.

APCu provides in-memory caching for PHP applications reduces database queries during normal operations.

### Installation

*sudo apt install php-apcu*

*sudo systemctl restart apache2*

### Nextcloud COnfiguration

File: */var/www/nextcloud/config/config.php*

Configuration Added: **'memcache.local'=>'\OC\Memcache\APCu'**

The enables APCu as the local memory cache for the Nextcloud instance.


## Database Index Optimization

Nextcloud reported missing optional database indices which can improve query performance.

The following command was executed to add the recommended indices:

*sudo -u www-data php/var/www/nextcloud/occ db:add-missing-indices*

This operation updates the databse to improve lookup performance for certain queries used by Nextcloud.