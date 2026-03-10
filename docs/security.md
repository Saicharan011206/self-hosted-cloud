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
