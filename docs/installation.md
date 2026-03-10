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

