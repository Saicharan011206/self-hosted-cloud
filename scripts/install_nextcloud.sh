#!/bin/bash

# =============================================================
# Nextcloud Installation Script
# Author: Sai Charan
# Date: 2024-06-01
# Description:
# This script automates the installation of Nextcloud on a Linux server.
# It assumes that all dependencies have been installed and the database has been set up.
# =============================================================

set -e

NEXTCLOUD_URL="https://download.nextcloud.com/server/releases/latest.tar.bz2"

echo "Downloading Nextcloud..."

cd /tmp
wget $NEXTCLOUD_URL -O nextcloud.tar.bz2

echo "Extracting Nextcloud..."

tar -xjf nextcloud.tar.bz2

echo "Moving Nextcloud to /var/www/nextcloud..."

sudo mv nextcloud /var/www/nextcloud

echo "Setting permissions for Nextcloud..."

sudo chown -R www-data:www-data /var/www/nextcloud
sudo chmod -R 755 /var/www/nextcloud

echo "Nextcloud installation completed successfully."