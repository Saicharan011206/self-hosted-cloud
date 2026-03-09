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

## Installing Tailscale on the Debian Server

Install Tailscale: *curl -fsSL https://tailscale.com/install.sh | sh*

The above command installs tailscale repository on to the debian server.

**Note:** Installation on to the server can either be done via SSHing onto the server through the client or command can be directly run on the server.

Start Tailscale: *sudo tailscale up*

The above command initializes tailscale on the server side and generates a login link.
Open the link in the browser and authenticate/create your tailscale account and connect your device to the account.

Get Server Tailscale IP: *tailscale ip*

The above command prints the IP address created via tailscale for the server which can be used to SSH remotely onto the server.

## Installing Tailscale on the Client

Follow the same steps and use the login link generated after typing *sudo tailscale up* after installation. Authenticate with the same account used earlier for the server.

Get the client IP: *tailscale ip*

Use *tailscale status* to make sure both server and client are visible.

The new IP address generated can be used to remotelty SSH onto the server via the client.