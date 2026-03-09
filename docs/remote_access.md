# Remote Access Setup

## Overview

To securely administer the home server from external networks (e.g., college or public WiFi), the project uses **Tailscale VPN** for remote connectivity.

Tailscale creates a secure peer-to-peer VPN network between devices without requiring router configuration or port forwarding.

## Why Tailscale?

The home router does not provide administrative access for configuring port forwarding or firewall rules. Tailscale allows remote access while maitaining scure encrypted connections.

## Benefits

- Secure encrypted connection
- No port forwarding required
- Works behind NAT and restrictive routers
- Easy device-to-device networking

## Architecture

    Client-Device(Laptop)
             |
             |(encrypted VPN tunnel)
    Tailscale Network
             |
             |
    Home Debian Server
             |
             |
        SSH Server