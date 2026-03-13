# Operations Guide

This document describes common operational tasks required to manage
the personal cloud server after installation.

---

# Deploying Configuration Files

Configuration files are stored in the repository under the `config/` directory.

To apply configuration changes to the server, files are copied from the
local machine to the server using `scp`.

Example:

scp config/php-nextcloud.ini saicharan@100.88.187.43:~

After transferring the file, it can be moved to the appropriate system
configuration directory.

Example:

sudo mv ~/php-nextcloud.ini /etc/php/8.4/apache2/conf.d/nextcloud.ini

The Apache service must then be restarted for changes to take effect.

sudo systemctl restart apache2

---

# Service Management

System services can be monitored and controlled using `systemctl`.

Check Apache status:

sudo systemctl status apache2

Restart Apache:

sudo systemctl restart apache2

Check MariaDB status:

sudo systemctl status mariadb

Restart MariaDB:

sudo systemctl restart mariadb

---

# Nextcloud Command Line Operations

Nextcloud provides a command line interface called `occ`
(OwnCloud Console) for administrative operations.

All `occ` commands must be executed as the Apache user.

Example:

sudo -u www-data php /var/www/nextcloud/occ

---

# Common Administrative Tasks

## Run Maintenance Repairs

sudo -u www-data php /var/www/nextcloud/occ maintenance:repair

This command performs database and system maintenance tasks.

---

## Add Missing Database Indices

sudo -u www-data php /var/www/nextcloud/occ db:add-missing-indices

This improves database performance by adding recommended indices.

---

## Enable Maintenance Mode

sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --on

Disable maintenance mode:

sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --off

Maintenance mode temporarily disables user access while performing
system changes.

---

# Log Files

System logs are useful for diagnosing issues.

Apache logs:

/var/log/apache2/error.log  
/var/log/apache2/access.log

Nextcloud logs:

/var/www/nextcloud/data/nextcloud.log

These logs can be inspected using:

tail -f /var/log/apache2/error.log

---

# Applying Configuration Changes

When modifying configuration files such as:

- Apache virtual host configuration
- PHP configuration
- Nextcloud config.php

the corresponding service must be restarted.

Example:

sudo systemctl restart apache2

This ensures that the updated configuration is loaded by the system.
