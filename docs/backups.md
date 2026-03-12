# Backup System

## Overview

To ensure data safety and recoverability, an automated backup system was implemented for the Nextcloud server.

The backup system periodically saves:

- Nextcloud database(MariaDB)
- Nextcloud user directory

Backups are stored on the dedicated storage disk mounted at: */storage*

---

## Backup Components

### 1.Nextcloud Data

All user-uploaded files are stored in: */storage/nextcloud-data*

This directory is compressed and archived during each backup.

### 2.Nextcloud Database

The MariaDB database 'nextcloud' stores important metadata including:

- User Accounts
- File Metadata
- Sharing Permissions
- Application Configuration

The database is backed up using *mysqldump.*

---

## Backup Storage Location

Backups are stored under:

/storage/backups/
   |--YYYY-MM-DD
   |    |--nextclouddb.sql
        |__nextcloud-data.tar.gz

---

## Backup Script 

*/scripts/backup.sh*

The script performs the following tasks:

1. Created a dated backup directory
2. Dumps the Nextcloud MariaDB database
3. Compresses the Nextcloud data directory
4. Stores backups on the storage disk
5. Removes backups older than 7 days

---

## Automation

Backups are executed automatically using *cron*.

Cron Schedule:

0 2 * * *

This means:

Daily Backup at 02:00 AM

---

## Security

To allow automated backups without exposing credentials in scripts, a secure MariaDB client configuration file was created: *~/.my.cnf*

Permissions are restriced using: *sudo chmod 600 ~/.my.cnf*

This prevents unauthorized access to the database credentials.

---

## Recovery Strategy

In the event of system failure:

1. Restore database using mysql
2. Extract Nextcloud data archive
3. Restart Apache and database services

This enables full restoration of the cloud storage system.