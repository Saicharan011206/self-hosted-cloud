## System Components

The personal cloud system is composed of serveral core layers.

### Operating System

Debian Linux running on a repurposed laptop server.

### Networking

Secure remote access is provided via Tailscale VPN.

### Web Server 

Apache will serve the nextcloud web interface.

### Database

MariaDB is used to store application metadata such as:

- User Accounts
- File Metadata
- Sharing Permissions
- System Configuration

### Storage

Two storage devices are used:

**System Disk:** /dev/sdb (465 GB)

Contains:

- Debian OS
- Apache
- MariaDB
- Nextcloud Application Files

**Data Disk:** /dev/sda (931 GB)

Mounted At: */storage*

Used For:

- Nextcloud user files
- personal cloud storage

Nextcloud Data Directory: */storage/nextcloud-data*

### Application Runtime

PHP 8.4 is used as the runtime environment for the Nextcloud application.

Apache integrates with PHP using the 'mod_php' module to execute PHP scripts and generate dynamic web content.

