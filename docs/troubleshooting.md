### Apache Port Conflict Resolution

During apache installation, the server failed to start due the port 80 being occupied by Pi-hole.

**Error Observed:** 

(98) Address already in use
no listening sockets available

**Investigation:**

*sudo ss -tulpn | grep :80*

The output showed the 'pihole-FTL' listening on port 80.

**Resolution:**

*sudo systemctl stop pihole-FTL*

*sudo systemctl disable pihole-FTL*

*sudo systemctl start apache2*

After disabling Pi-hole, Apache started normally and displayed the default web page.