# ADR-0002: MariaDB for Database

**Date:** 2026-03-10

## Status: Accepted

## Context

Nextcloud requires a relational database to store application metadata such as users, file indexes, sharing permissions, and configuration.

## Decision

MariaDB was selected as the database backend for this project.

The database will run locally on the debian server and store all Nextcloud application metadata.

A dedicated database user will be created for the application to follow the principle of least privilege.

## Alternatives Considered

- SQLite
- MySQL
- PostgreSQL

SQLite is suitetable only for single layer applications.MySQL and MariaDB are widely used in web application stacks and provide strong compatibility with Nextcloud.

## Consequencies

Advantages:

- Fully compatible with Nextcloud
- High performance for web applications
- Easy integration with Apache and PHP
- Actively maintained open-source project

Disadvantages:

- Requires additional configuration and management compared to SQLite