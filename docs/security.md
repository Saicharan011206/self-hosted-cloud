# Server Security Configuration

## SSH Key Authentication

To improve server security, password-based SSH authentication was disabled and replaced with SSH key authentication.

### Generate SSH Key(client)

*ssh-keygen -t ed25519*

This generates 
- Private Key: ~/.ssh/id_ed25519
- Public Key: ~/.ssh/id_ed25519.pub

### Copy Key to server

*ssh-copy-id username@SERVER_TAILSCALE_IP*

The public key is stored in: *~/.ssh/authorized_keys*

### Disable Password Authentication

Goto *sudo nano /etc/ssh/sshd/config*

Edit SSH configuration:

set:

- PasswordAuthentication no
- ChallengeResponseAuthentication no (In newer Debian configurations it might not be visible)
- PubKeyAuthentication yes

Restart SSH Service:

*sudo systemctl restart ssh*

### Security Benefits

- Prevents brute force attacks
- Enables secure authentication
- Industry standard practice for Linux users

## Database Security

MariaDB is configured with dedicated database user for the nextcloud application instead of using the root account.

This follows principle of least privilege.

Database User: **nextclouduser@localhost**

Permissions:

Full access only to 'nextcloud' database.

This prevents other system databases from being accessed by this application.

## Enforcing HTTPS Redirect

Nextcloud reported that the instance was accessible over HTTP,
which is insecure.

To enforce encrypted connections, Apache was configured to redirect
all HTTP traffic to HTTPS.

File: */etc/apache2/sites-available/nextcloud.conf*

Configuration:

<VirtualHost *:80>
    ServerName 100.88.187.43
    DocumentRoot /var/www/nextcloud

    Redirect permanent / https://100.88.187.43/

    <Directory /var/www/nextcloud/>
        Require all granted
        AllowOverride All
        Options FollowSymLinks MultiViews
    </Directory>
</VirtualHost>

After modifying the configuration, Apache was restarted.

## Enabling HSTS (HTTP Strict Transport Security)

To improve HTTPS security, the HSTS header was enabled in Apache.

File: */etc/apache2/sites-available/nextcloud-ssl.conf*

Configuration:

Header always set Strict-Transport-Security "max-age=15552000; includeSubDomains"

HSTS forces browsers to always use HTTPS when connecting to the server,
preventing protocol downgrade attacks.

## Firewall Integration

To harden the server, UFW (Uncomplicated Firewall) was configured.

Allowed Ports:

- 22/tcp SSH Access
- 80/tcp HTTP (redirect to HTTPS)
- 443/tcp Netdata Monitoring Dashboard
- 19999/tcp Netcloud Monitoring Dashboard 

Commands: 
- *sudo apt install ufw*
- *sudo ufw allow 22/tcp*
- *sudo ufw allow 443/tcp*
- *sudo ufw allow 80/tcp*
- *sudo ufw allow 19999/tcp*
- *sudo ufw enable*
