# Netdata Integration in Nextcloud

## Overview
Netdata provides real-time monitoring of server metrics. To make it accessible alongside Nextcloud, the dashboard was integrated into the Nextcloud web interface.

## Methods Used
### 1. External Sites App
- Nextcloud app “External Sites” was enabled.
- Netdata URL (`http://100.88.187.43:19999`) added as an external site.
- Provides admin users with one-click access to server metrics.

### 2. Reverse Proxy (Optional)
- Netdata is accessible via `https://nextcloud.domain/netdata`.
- Configured Apache with:

ProxyPass "/netdata" "http://127.0.0.1:19999/"
ProxyPassReverse "/netdata" "http://127.0.0.1:19999/"

Required Modules: proxy, proxy_http, headers

## Security

Netdata remains accesible only over Tailscale VPN.
