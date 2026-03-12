# System Architecture

This document describes the architecture of the Personal Cloud Infrastructure project.
The system is designed to provide secure private cloud storage using self-hosted services running on Debian-based server.

---

# High Level Architecture

The system is composed of multiple layers working together to deliver the cloud service.

User devices connect securely through a private VPN network and access the Nextcloud application served by Apache web server.

                                 User Devices
                                 (Laptop/ Mobile)
                                       |
                                       ▼
                                 Tailscale VPN
                                       |
                                       ▼
                                 Aapache Web Server
                                       |
                                       ▼
                                 Nextcloud Application
                                       |
                                       ▼
                                 MariaDB Database
                                       |
                                       ▼
                                 Storage Disk (/storage)  


# System Components

The personal cloud system is composed of several core layers.

## Operating System

The server runs Debian Linux (v13 aka Trixie) on a repurposed laptop.

**Responsibilites:**

- System Resource Management
- Service Orchestration (systemd)
- Package Management
- Network Configuration

Debian was chosen for it's stability, large package repository, and suitability for long-running server workloads.

## Networking Layer

Secure remote connectivity is provided using *Tailscale VPN*.

Tailscale create a private mesh network using WireGuard encryption.

Each device connected to the network receives a private Tailscale IP address, 
allowing secure communication without exposing services to the public internet.

**Advantages:**

- No Router Port Forwarding required
- End-to-End Encryption
- Secure Remote Access from any device
- Simplified Network Configuration

## Web Server Layer

*Apache HTTP Server* is used to serve the Nextcloud web interface.

Apache handles:

- HTTP/HTTPS requests
- SSL/TLS Encryption
- Virtual Host Configuration
- PHP Integration

The server used Apache modules including:

- mod_php
- mod_rewrite
- mod_ssl

These modules allow Apache to process dynamic PHP and server the Nextcloud application.

## Application Runtime

*PHP 8.4* is used as the runtime environment for Nextcloud.

Apache inregrates with PHP using 'mod_php' module which allows php scripts to execute directly within the web server process.

PHP handles:

- Dynamic Page Generation
- API requests
- File Operations
- User Authentication Logic

## Database Layer

*MariaDB* is used as the relational database backend for Nextcloud

The database stores application metadata such as:

- User Accounts
- File Metadata
- Sharing Permissions
- Application Configuration
- Activity Logs

MariaDB was selected because it is stable, high-performance and fully compatible with Nextcloud.

## Storage Layer

The system uses two physical storage devices.

### System Disk

Device: */dev/sdb*
Size: 465 GB

Contains:

- Debian Operating System
- Apache web Server
- MariaDB Database
- Nextcloud Application Files.

### Data Disk

Device: */dev/sda*
Size: 931 GB
Mounted At: */storage*

Used For:

- Nextcloud User Files
- Personal Cloud Storage
- Backups

Nextcloud's data directory is configured as: */storage/nextcloud-data*

Separating application files from user data improves reliability and simplfies backup management.

## Cloud Platform Layer

*Nextcloud* is deployed as the application layer of the system.

Nextcloud provides the primary cloud functionality including:

- User File Storage
- Web Interface for file management
- File Synchronization accross devices
- Sharing and Access Control
- Mobile and Desktop Clients

Nextcloud runs on top of the LAMP stack:

- Linux (Debian)
- Aapache (Web Server)
- MariaDB (Database)
- PHP (Application Runtime)

## Monitoring Layer

System monitoring is implemented using Netdata.

Netdata provides real-time metrics including:

- CPU Usage
- Memory Usage
- Disk Activity
- Network Traffic
- System Proccesses

This allows for continous monitoring of server health and performance.

Nextcloud dashboard for quick visibility.

## Summary

The system architecture follows a layered design consisting of:

- Operating System (Debian)
- Networking (Tailscale)
- Web Server (Apache)
- Application Runtime (PHP)
- Database (MariaDB)
- Storage Layer (Dedicated Data Disk)
- Application Layer (Nextcloud)
- Monitoring Layer (Netdata)

This architecture provides a secure, stable, and maintanable self-hosted cloud storage solution.

