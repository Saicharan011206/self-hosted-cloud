#!/bin/bash

# =============================================================
# Nextcloud Backup Script
# Author: Sai Charan
# Date: 2024-06-01
# Description:
# This script creates a backup of the Nextcloud data directory and the associated database.
# It organizes backups by date and removes backups older than 7 days.
# =============================================================


DATE=$(date +%F)
BACKUP_BASE="/storage/backups"
BACKUP_DIR="$BACKUP_BASE/$DATE"

NEXTCLOUD_DATA="/storage/nextcloud-data"
DB_NAME="nextcloud"
DB_USER="nextclouduser"

echo "Starting Nextcloud backup..."

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup database
echo "Backing up database..."
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/nextcloud-db.sql

# Backup Nextcloud data
echo "Backing up data directory..."
tar -czf $BACKUP_DIR/nextcloud-data.tar.gz $NEXTCLOUD_DATA

# Remove backups older than 7 days
echo "Cleaning old backups..."
find $BACKUP_BASE -mindepth 1 -maxdepth 1 -type d -mtime +7 -exec rm -rf {} \;

echo "Backup completed successfully."