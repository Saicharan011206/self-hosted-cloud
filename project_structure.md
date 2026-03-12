# Project Structure:

*config/*

- Contains configuration files used for server setup.

- */apache-nextcloud.conf* => Apache VirtualHost configuration for serving the Nextcloud application.

- */php-nextcloud.ini* => Custom PHP configuration optimized for Nextcloud performance.

- */database_setup.sql* => SQL script used to initialize the Nextcloud performance.

*docs/*

- Technical Documentation for installation, networking,architecture

*scripts/*

- Automation scripts used to install dependencies, deploy Nextcloud, and manage backups.

- */install_dependencies.sh* => Installs all required system packages.

- */setup_database.sh* => Creats the MariaDB database and the user.

- */install_nextcloud.sh* => Downloads and installs the Nextcloud server.

- */backup.sh* => Creates backups for Nextcloud data and database.

**README.md**

- Overivew of the Project