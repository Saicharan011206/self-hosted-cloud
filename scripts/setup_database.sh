#!/bin/bash

# =============================================================
# MariaDB Setup for Nextcloud
# Author: Sai Charan
# Date: 2024-06-01
# Description:
# This script sets up the MariaDB database for Nextcloud, including creating the database,
# user, and granting necessary permissions.
# =============================================================

set -e

DB_NAME="nextcloud"
DB_USER="nextclouduser"
DB_PASS="change_me"

echo "Setting up MariaDB for Nextcloud..."

sudo mysql <<EOF

CREATE DATABASE IF NOT EXISTS $DB_NAME;
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;

EOF

echo "MariaDB setup completed successfully."