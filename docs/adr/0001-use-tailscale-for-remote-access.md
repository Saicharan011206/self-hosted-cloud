# ADR-0001: Use Tailscale for Remote Server Access

**Date:** 2026-03-09

## Status : Accepted

## Context

The project requires remote access to a Debian home server for administration and development.The home router does not allow configuration of port forwarding.

## Decision

Tailscale VPN will be used to establish secure remote connectivity between the client and the home server.

## Alternatives Considered

- Direct SSH with port forwarding
- WireGuard VPN
- OpenVPN

## Consequencies

Tailscale allows encrypted peer-to-peer connectivity without modifying router configuration,
simplifying deployment while maintaining security.