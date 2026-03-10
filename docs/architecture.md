# System Architecture

## Storage Layout

The server uses two storage devices:

**System Disk:** /dev/sdb2 (454 GB)

Used For:
- Debian OS
- Apache Web Server
- MariaDB Database
- Nextcloud Application

**Data Disk:** /dev/sda (916 GB)

Mounted at: /storage (ext4 fs)

Used For:
- Nextcloud user files
- Personal Cloud Storage

Nextcloud Data Directory:

/storage/nextcloud-data