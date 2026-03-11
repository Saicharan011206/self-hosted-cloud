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
