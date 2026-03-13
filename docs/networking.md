# Networking

This document describes how network connectivity and remotr access are configured for the personal cloud server.

---

## Network Architecture

The server is not exposed directly to the public internet. Instead, remote access is provided is provided through **Tailscale**, which creates a secure private network between devices.

All devices connected to the Tailscale network can securely access the Nextcloud server.

## Tailscale VPN

Each device that joins the Tailscale network receives a private IP address.

Advantages:

- No router port forwarding
- End-to-end encrypted connections
- Secure access from anywhere
- Simplified network configuration

## Nextcloud Access

The Nextcloud web interface is accessible through the Tailscale network.

Only devices connected with the Tailscale network can access the interface.

## Device Access

Devices can access the cloud in two ways:

**Direct Access:**

Devices logged into the same Tailscale account as the server can automatically join the private network and access the interface.

**Shared Access:**

Other users can be granted access by sharing the server through the Tailscale admin console.

## HTTPS Configuration

The Nextcloud server is configured to support HTTPS

A self-signed SSL certificate was generated and configured in Apache.

This allows encrypted communication between clients and server withing the private Tailscale network.


