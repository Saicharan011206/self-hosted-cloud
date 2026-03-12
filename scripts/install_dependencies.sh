#!/bin/bash
# =============================================================
# Install Server Dependencies for Personal Cloud
# Author: Sai Charan
# Date: 2024-06-01
# Description:
# This script installs all necessary dependencies for the Personal Cloud project,
# including Nextcloud, MySQL, Redis, PHP, Apache, MariaDB, curl, fail2ban, ufw.
# =============================================================

set -e
echo "Updating package lists..."
sudo apt update

echo "Installing core services..."
sudo apt install -y \
apache2 \
mariadb-server \
redis-server \
fail2ban \
ufw \
curl \
wget \
unzip \
net-tools

echo "Installing PHP and required modules..."
sudo apt install -y \
php \
php-mysql \
php-cli \
php-common \ 
php-zip \
php-gd \
php-curl \
php-xml \
php-bcmath \
php-intl \
php-gmp \
php-imagick \
php-apcu \
php-redis \

echo "Enabling Apache modules..."
sudo a2enmod rewrite
sudo a2enmod rewrite headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime
sudo a2enmod ssl

echo "Starting services..."
sudo systemctl enable apache2
sudo systemctl enable mariadb
sudo systemctl enable redis-server

sudo systemctl start apache2
sudo systemctl start mariadb
sudo systemctl start redis-server

echo "Dependency installation completed successfully."


