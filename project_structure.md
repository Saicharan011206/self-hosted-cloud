# Project Structure

This repository is organized to separate configuration, automation scripts, and documentation for the personal cloud infrastructure project.

```
.
├── config
│   ├── apache-nextcloud.conf
│   ├── database_setup.sql
│   └── php-nextcloud.ini
├── docs
│   ├── adr
│   │   ├── 0001-use-tailscale-for-remote-access.md
│   │   ├── 0002-use-mariadb-for-database.md
│   │   ├── 0003-separate-storage-disk.md
│   │   ├── 0004-use-apache-web-server.md
│   │   └── 0005-use-nextcloud-as-cloud-platform.md
│   ├── architecture.md
│   ├── backups.md
│   ├── installation.md
│   ├── monitoring.md
│   ├── networking.md
│   ├── operations.md
│   ├── performance.md
│   ├── remote_access.md
│   ├── screenshots
│   ├── security.md
│   └── troubleshooting.md
├── LICENSE
├── Makefile
├── project_structure.md
├── README.md
└── scripts
    ├── backup.sh
    ├── install_dependencies.sh
    ├── install_nextcloud.sh
    └── setup_database.sh
```

---

## Directory Overview

### [config/](config/)

Contains configuration files used by the server

- [config/apache-nextcloud.conf](config/apache-nextcloud.conf) => Aapache virtual host configuration

- [config/database_setup.sql](config/database_setup.sql) => SQL script for database initialization

- [config/php-nextcloud.ini](config/php-nextcloud.ini) => PHP configuration optimized for Nextcloud

### [scripts/](scripts/)

Contains automated scripts used for deployment and maintanence

- [scripts/install_dependencies.sh](scripts/install_dependencies.sh) => Installs required system packages

- [scripts/setup_database.sh](scripts/setup_database.sh) => Configures MariaDB database

- [scripts/install_nextcloud.sh](scripts/install_nextcloud.sh) => Installs and configures Nextcloud

- [scripts/backup.sh](scripts/backup.sh) => Performs system backups


### [docs/](docs/)

Contains documentation describing system architecture, deployment process, and operational procedures.

- [docs/adr](docs/adr/) => Architecture Decision Records

- [docs/screenshots](docs/screenshots/) => Contains screenshots and images of the project for reference

- [docs/architecture.md](docs/architecture.md) => Describes the overall architecture of the system

- [docs/installation.md](docs/installation.md) => Describes the steps executed during the installation and setup process

- [docs/networking.md](docs/networking.md) => Describes the networking behind the project

- [docs/remote_access.md](docs/remote_access.md) => Describes how remote access to the server works

- [docs/operations.md](docs/operations.md) => Describes common operational tasks

- [docs/performance.md](docs/performance.md) => Describes the process and steps to optimize the performance of the system

- [docs/security.md](docs/security.md) => Describes the security measures taken to harden the sever

- [docs/backups.md](docs/backups.md) => Describes the process to setup automated backup to sustain system failure

- [docs/monitoring.md](docs/monitoring.md) => Describes steps to add a monitoring client to Nextcloud interface

- [docs/troubleshooting.md](docs/troubleshooting.md) => Documents the problems discovered during the project and solutions procured

### [.gitignore](.gitignore)

Standard gitignore file

### [Makefile](Makefile)

Provides simplified interface to execute the automated scripts

### [README.md](README.md)

Main project documentation and overview

### [LICENSE](LICENSE)

Specifies the licensing terms of this project