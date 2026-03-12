-- Nextcloud Database Setup Script
-- Author: Sai Charan
-- This script creates a MySQL database and user for Nextcloud Installation.

CREATE DATABASE nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'your_secure_password';

GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';

FLUSH PRIVILEGES;