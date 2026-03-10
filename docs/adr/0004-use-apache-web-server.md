# ADR-0004: Using Apache Web Server

**Date:** 2026-03-10

## Status: Accepted

## Context

Nextcloud requires a web server to serve the application and handle HTTP requests.

## Decision

Apache was selected as the web server for this project.

The Apache service runs on port 80 and serves the Nextcloud application interface.

Apache easily integrates with PHP using the mod_php module and is commonly used in LAMP stacks.

## Alternatives Considered

- Nginx

## Consequencies

Advantages:

- Simple integration with PHP
- Well documented Nextcloud configuration
- Widely used LAMP stack component

Disadvantages:

- Slightly heavier han Nginx
- Requires additional modules for optimal performance