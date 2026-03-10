# ADR-0003: Use Separate Storage Disk for User Data

**Date:** 2026-03-10

## Status: Accepted

## Context

The server contains two storage devices:

- System Disk (~456 GB)
- Secondary Disk (~931 GB)

Nextcloud stores user files and uploaded data which can grow significantly over time.

Storing user files on the system disk can lead to :

- Reduced space for system operations
- Difficult system upgrades
- Complex backup procedures

## Decision

User data will be stored on the secondary disk mounted at */storage*

The Nextcloud data directory will be located at: */storage/nextcloud-data*

## Consequencies 

Advantages:

- Separates application data from the operating system
- Simplfies backups
- Reduces risk of system disk exhaustion
- Aligns with common server storage practices

Disadvantages:

- Requires additional filesystem management